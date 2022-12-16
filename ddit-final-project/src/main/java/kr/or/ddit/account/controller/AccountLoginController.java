package kr.or.ddit.account.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.account.service.AccountLoginService;
import kr.or.ddit.vo.AccountVO;


@Controller
@RequestMapping("/AccLogin/*")
public class AccountLoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(AccountLoginController.class);
	
	@Inject AccountLoginService service;
	
	//로그인
	@RequestMapping(value="/accLogin", method = RequestMethod.POST)
	public String accLogin(AccountVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		logger.info("post accLogin");
		
		HttpSession session = req.getSession();
		AccountVO accLogin = service.accLogin(vo);
		
		if(accLogin == null) {
			session.setAttribute("account", null);
			rttr.addFlashAttribute("msg", false);
		}else {
			session.setAttribute("account", accLogin);
		}
		return "redirect:/";
	}
	//로그아웃
	@RequestMapping(value="/accLogout", method = RequestMethod.GET)
	public String accLogout(HttpSession session) throws Exception{
		session.invalidate();
		
		return "redirect:/";
	}
	
}
