package kr.or.ddit.member.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

@Controller
@RequestMapping("/mypage/member/company/statistics")
public class CompanyStatistics {
@GetMapping
public String companyStatistics(
		Model model
		
		) {
	return "myPage/member/company/statistics";
}
}
