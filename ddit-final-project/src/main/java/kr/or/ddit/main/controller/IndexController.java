package kr.or.ddit.main.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.main.dao.MainDAO;
import kr.or.ddit.main.service.MainService;
import kr.or.ddit.vo.MainVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class IndexController {
	@Inject
	private MainService service;
	@Inject
	private MainDAO dao;
	
	@RequestMapping("/index.do")
	public String mainPage(Model model) {
		MainVO mainVo = service.getMainInfo();
		log.info("mainVo : {}",mainVo);
		
		model.addAttribute("main", mainVo);
		return "main";
	}
	
	@RequestMapping("/getNewsletter")
	@ResponseBody
	public String insertMail(String mail) {
		log.info("mail : {}",mail);
		String result;
		int cnt = dao.insertNews(mail);
		if(cnt > 0) result = "success";
		else result = "fail";
		return result;
	}
}
