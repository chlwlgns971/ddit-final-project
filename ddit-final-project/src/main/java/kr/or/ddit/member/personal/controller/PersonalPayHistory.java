package kr.or.ddit.member.personal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.member.personal.service.PayHistoryService;
import kr.or.ddit.vo.ChargeVO;
import lombok.extern.slf4j.Slf4j;
import javax.inject.Inject;

@Slf4j
@Controller
@RequestMapping("/mypage/member/personal/payDetailView")
public class PersonalPayHistory {
	@Inject
	private PayHistoryService phService;
	
	@GetMapping
	public String payHistory(
			Model model
			,@RequestParam(name = "what", required = true) String charCode
			) {
		
		ChargeVO chargeVO= phService.searchPayHistory(charCode);
		model.addAttribute("chargeVO", chargeVO);
		return "/myPage/member/personal/payHistory";
	}
}
