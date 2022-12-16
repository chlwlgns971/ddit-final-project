package kr.or.ddit.member.personal.controller;

import javax.inject.Inject;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.prod.packageTrip.service.PackageService;
import kr.or.ddit.vo.PackageVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage/member/personal/wishList-detailview")
public class PersonalWishList {
	@Inject
	private PackageService pckgService;
	
	@GetMapping
	public String SelcetWishList(
			Model model
			,@RequestParam(name = "what", required = true) int pkgNum
			) {
		PackageVO packageVO=pckgService.selectPackage(pkgNum);
		model.addAttribute("packageVO", packageVO);
		return "myPage/member/personal/wishList-package-view";
	}
}
