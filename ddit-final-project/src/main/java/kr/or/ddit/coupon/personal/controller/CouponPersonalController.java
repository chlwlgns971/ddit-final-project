package kr.or.ddit.coupon.personal.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.coupon.personal.service.CouponPersonalService;
import kr.or.ddit.vo.AccountVO;
import kr.or.ddit.vo.AccountVOWrapper;
import kr.or.ddit.vo.CouponVO;

@Controller
@RequestMapping("/mypage/member/personal/coupon")
public class CouponPersonalController {
	private CouponPersonalService service;
	
	@Inject
	public void setService(CouponPersonalService service) {
		this.service = service;
	}
	@GetMapping
	public String viewCoupon(
			Model model
			, @AuthenticationPrincipal AccountVOWrapper accountWrapper
			, @AuthenticationPrincipal(expression="realUser") AccountVO account
			) {
		AccountVO test1 = accountWrapper.getRealUser();
		String memId = test1.getAccId();
		
		
		
		int couponCnt=service.countCoupon(memId);
		List<CouponVO> couponList=service.retrievePesonalCoupon(memId); 
		
		
		model.addAttribute("couponCnt", couponCnt);
		model.addAttribute("couponList", couponList);
		return "myPage/member/personal/coupon";
	}
}
