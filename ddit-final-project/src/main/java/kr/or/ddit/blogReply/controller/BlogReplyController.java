package kr.or.ddit.blogReply.controller;

import java.security.Principal;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.blog.service.BlogService;
import kr.or.ddit.reply.dao.ReplyDAO;
import kr.or.ddit.vo.BlogPostVO;
import kr.or.ddit.vo.BlogVO;
import kr.or.ddit.vo.ReplyVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BlogReplyController {
	@Inject
	private BlogService blogService;
	
	@Inject
	private ReplyDAO dao;
	
	@RequestMapping("/blog/insertReply")
	public ModelAndView blogReplyForm( @RequestParam(name="replyScope", defaultValue="public")String replyScope
			, @ModelAttribute(name="reply") ReplyVO reply, Errors errors, Principal principal) {
		reply.setReplyScope(replyScope);
		reply.setAccId(principal.getName());
		log.info("testController ReplyVO : {}",reply);
		
		String viewName = null;
		BlogPostVO post = blogService.blogPostView(reply.getPostNum());
		//블로그 정보 가져오기
		BlogVO blog = blogService.blogInfo(post.getBlogId());
		
		//모델생성
		ModelAndView mav = new ModelAndView();
		
		if(!errors.hasErrors()) {
			dao.insertReply(reply);
			viewName = "redirect:/blog/01/viewPost?what="+reply.getPostNum();
			
		}
		else {
			mav.addObject("post",post);
			mav.addObject("blog", blog);
			viewName = "blog/01/viewPost";
		}
		
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@RequestMapping("/blog/updateReply")
	public String replyUpdate(@RequestParam(name="replyScope", defaultValue="public")String replyScope, ReplyVO reply) {
		reply.setReplyScope(replyScope);
		if(reply.getReplyCont() == null || reply.getReplyCont().isEmpty()) reply.setReplyCont(" ");
		log.info("replyUpdate ReplyVO : {}", reply);
		
		dao.updateReply(reply);
		
		String viewName = "redirect:/blog/01/viewPost?what="+reply.getPostNum();
		return viewName;
	}
	
	@PostMapping("/blog/deleteReply")
	public String replyDelete(int replyNum, int postNum) {
		log.info("replyDelete replyNum : {}",replyNum);
		log.info("replyDelete postNum : {}",postNum);
		
		dao.deleteReply(replyNum);
		String viewName = "redirect:/blog/01/viewPost?what="+postNum;
		return viewName;
	}
}
