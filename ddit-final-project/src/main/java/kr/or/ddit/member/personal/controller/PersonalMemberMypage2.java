package kr.or.ddit.member.personal.controller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.booking.dao.BookingDAO;
import kr.or.ddit.insurance.charge.service.ChargeService;
import kr.or.ddit.member.personal.service.PersonalMemberService;
import kr.or.ddit.prod.service.ProdService;
import kr.or.ddit.vo.AccountVO;
import kr.or.ddit.vo.AccountVOWrapper;
import kr.or.ddit.vo.ChargeVO;
import kr.or.ddit.vo.PersonalMemberVO;
import kr.or.ddit.vo.ProdVO;
import kr.or.ddit.vo.ReservationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage/member/personal")
public class PersonalMemberMypage2 {
	@Inject
	private ChargeService chargeService;
	@Inject
	private ProdService pService;
	@Inject
	private BookingDAO dao;

	@RequestMapping("/payList")
	public String payList(Principal principal, Model model) {
		List<ReservationVO> reservationList = dao.getReservationList(principal.getName());
		if(reservationList == null||reservationList.isEmpty()) model.addAttribute("reservationList", null);
		else model.addAttribute("reservationList", reservationList);
		return "myPage/member/personal/payList";
	}

	@RequestMapping("/wishList-package")
	public String wishListPackage() {
		return "myPage/member/personal/wishList-package";
	}

	@RequestMapping("/wishList-hotel")
	public String wishListHotel() {
		return "myPage/member/personal/wishList-hotel";
	}

	@RequestMapping("/wishList-rentcar")
	public String wishListRentcar() {
		return "myPage/member/personal/wishList-rentcar";
	}

	@RequestMapping("/wishList-festival")
	public String wishListFestival() {
		return "myPage/member/personal/wishList-festival";
	}

	@RequestMapping("/wishList-travelplace")
	public String wishListTravelplace() {
		return "myPage/member/personal/wishList-travelplace";
	}

	@RequestMapping("/complycomplete")
	public String complycomplete() {
		return "myPage/member/personal/complycomplete";
	}

}