package kr.or.ddit.member.personal.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.booking.dao.BookingDAO;
import kr.or.ddit.insurance.charge.service.ChargeService;
import kr.or.ddit.prod.service.ProdService;
import kr.or.ddit.vo.ChargeVO;
import kr.or.ddit.vo.ProdVO;
import kr.or.ddit.vo.ReservationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage/member/personal/chargeList")
public class PersonalChargeList {
	@Inject
	private BookingDAO dao;
	
	@GetMapping
	/**
	 * 예약상세내역 정보 view로 넘기는 Controller
	 * @param model
	 * @param resCode : 예약번호
	 * @return
	 * 로직만 최지훈이 추가함.
	 */
	public String SelectChargList(Model model, @RequestParam(name = "what", required = true) String resCode) {
		ReservationVO reservation = dao.getReservationInfo(resCode);
		model.addAttribute("reservation", reservation);
		
		return "myPage/member/personal/payListDetailView";
	}
}
