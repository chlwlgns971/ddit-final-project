package kr.or.ddit.account.controller;

import javax.inject.Inject;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.account.service.AccountService;

import kr.or.ddit.vo.AccountVO;
import kr.or.ddit.vo.AccountVOWrapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage/member/personal/updatePswd")
public class AccountPswdUpdateController {
	private AccountService service;
	
	@Inject
	public void setService(AccountService service) {
		this.service = service;
	}

	@GetMapping
	public String getThePswd(Model model, @AuthenticationPrincipal AccountVOWrapper accountWrapper,
			@AuthenticationPrincipal(expression = "realUser") AccountVO account) {
		
		log.info("1");
		AccountVO accountVO = accountWrapper.getRealUser();
		log.info("2");
		String accId = accountVO.getAccId();
		log.info("3");

		AccountVO account1 = service.comparePswd(accId);
		log.info("4");
		model.addAttribute("AccountVO", account1);
		log.info("5");
		return "popUp/PMemberPswdUpdate";
		
	}

	@PostMapping
	public String changeThePswd(@ModelAttribute("AccountVO") AccountVO accountVO,
			@AuthenticationPrincipal AccountVOWrapper accountWrapper,
			@AuthenticationPrincipal(expression = "realUser") AccountVO account, Model model,
			@RequestParam(name = "newPswdVerify") String newPswd) {
		String message = null;
		String viewName = null;

		AccountVO accPswdUpdateVO = accountWrapper.getRealUser();
		String memId = accPswdUpdateVO.getAccId();
//		String memPswd=accPswdUpdateVO.getAccPw();

		accountVO.setAccId(memId);
		accountVO.setAccPw(newPswd);

		int rowcnt = service.AccoutUpdatePswd(accountVO);
		switch (rowcnt) {
		case 0:
			message = "비밀번호 변경 실패";
			viewName = "popUp/PMemberPswdUpdate";
//			accountVO.setAccPw(memPswd);
			break;
		case 1:
			message = "비밀번호 변경 성공";
			viewName = "popUp/PMemberPswdUpdate";
			break;
		default:
			break;
		}
		model.addAttribute("rowcnt", rowcnt);
		model.addAttribute("message", message);
		return viewName;
	}

}
