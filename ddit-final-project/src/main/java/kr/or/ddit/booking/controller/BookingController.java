package kr.or.ddit.booking.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.booking.dao.BookingDAO;
import kr.or.ddit.booking.service.BookingService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.AccountVOWrapper;
import kr.or.ddit.vo.ChargeVO;
import kr.or.ddit.vo.CompanyInfoVO;
import kr.or.ddit.vo.ProdVO;
import kr.or.ddit.vo.ResDatailVO;
import kr.or.ddit.vo.ReservationVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/booking")
public class BookingController {
	@Inject
	private BookingService service;
	
	@Inject
	private BookingDAO dao;
	
	/**
	 * 결제 페이지로 전송하는 컨트롤러 상품정보와 회원정보를 model에 담아 같이 보낸다.
	 * @param account : 로그인한 회원의 정보가 담긴 객체
	 * @param prod : 상품 정보가 담긴 VO객체
	 * @return
	 */
	@RequestMapping("/step1")
	public ModelAndView bookingStep1(@AuthenticationPrincipal AccountVOWrapper account, @ModelAttribute("resv") ReservationVO resv, @ModelAttribute("resd") ResDatailVO resd) {
		ModelAndView mav = new ModelAndView();
		String viewName = "booking/bookingStep1";
		
		log.info("bookingController Test ReservationVO : {}",resv);
		
		ProdVO prod = dao.getProdInfo(resv.getProdNum());
		log.info("bookingController Test ProdVO : {}",prod);
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(account != null) { //로그인이 되어있는 경우 = 회원인 경우
			//회원정보, 마일리지, 쿠폰 정보를 Map에 담아 반환
			map = service.getBookingPageInfo(account.getUsername(), prod.getProdCode(), resv.getProdPrice());
			mav.addObject("member", map.get("member"));
			mav.addObject("coupon", map.get("coupon"));
		}
		else{
			mav.addObject("member", null);
		}
		mav.addObject("prod", prod);
		mav.setViewName(viewName);
		return mav;
	}
	
	/**
	 * 결제가 완료된 이후 필요한 정보를 결제관련 DB에 연동하고 결과 창으로 전송
	 * @param resv : 예약정보가 담긴 VO객체
	 * @param resd : 예약한 사람 정보가 담긴 VO객체
	 * @param prod : 주문한 상품 정보가 담긴 VO객체
	 * @param model 
	 * @return
	 */
	@RequestMapping("/step2")
	public String bookingStep2(@ModelAttribute("resv") ReservationVO resv, ResDatailVO resd, ProdVO prod, ChargeVO charge
			, @RequestParam(defaultValue = "0")int coupon, @RequestParam(defaultValue = "0")int mileage, Model model, Principal principal) {
		log.info("Step2 ReservationVO : {}", resv);
		log.info("Step2 ResDatailVO : {}", resd);
		log.info("Step2 ProdVO : {}", prod);
		log.info("Step2 ChargeVO : {}", charge);
		log.info("Step2 coupon : {}", coupon);
		log.info("Step2 mileage : {}", mileage);
		
		ServiceResult result = service.chargeProcess(resv, resd, prod, charge, coupon, mileage, principal.getName());
		
		if(result == ServiceResult.OK) {
			CompanyInfoVO company = dao.getCompanyInfo(prod.getCinfoNum());
			log.info("Step2 CompanyInfoVO : {}", company);
			
			model.addAttribute("company", company);
			model.addAttribute("resd", resd);
			model.addAttribute("prod", prod);
		}
		
		
		return "booking/bookingStep2";
	}
}
