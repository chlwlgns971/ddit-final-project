package kr.or.ddit.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.admin.service.AdminNewsletterService;
import kr.or.ddit.vo.MailVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage/admin")
public class AdminNewsletterController {
	@Inject
	AdminNewsletterService service;
	
	
	@RequestMapping("/sendingNewsletter")
	public String sendingNewsletter() {
		return "adminPage/sendingNewsletter";
	}
	
	@PostMapping("/sendNewsletter")
	public String sendNewsletter(
		@ModelAttribute("mailVO") MailVO mailVO
		, RedirectAttributes ra
	) {
		//파라미터로 넘어온 제목과 내용 출력
		String title = mailVO.getTitle();
		String content = mailVO.getContent();
		log.info("title: {}", title);
		log.info("content: {}", content);
		
		// 이메일 일괄 전송
		String result = service.sendNewsletter(mailVO);
		
		
		ra.addFlashAttribute("result", result);
		
		return "redirect:/mypage/admin/sendingNewsletter";
	}
}
