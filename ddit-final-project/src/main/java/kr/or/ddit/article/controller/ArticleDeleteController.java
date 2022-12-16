package kr.or.ddit.article.controller;

import java.security.Principal;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.article.service.ArticleService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.ArticleVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/article")
public class ArticleDeleteController {
	@Inject
	private ArticleService service;
	
	@PostMapping("/articleDelete")
	public String articleDelete(
			@RequestParam(name="artNum", required=true) int artNum
			,@RequestParam(name="writer",required=true) String writer
			,@RequestParam(name="deleter",required=false) String deleter
			, RedirectAttributes redirectAttributes
			) {
		ArticleVO article = new ArticleVO();
		
		article = service.retrieveArticle(artNum);
		log.info("artNum:{}",artNum);
		log.info("article:{}", article);
		log.info("writer:{}", writer);
		log.info("deleter:{}", deleter);
		
		String viewName = null;
		ServiceResult result = null;
		
		if(writer.equals(deleter)){
			result = service.removeArticle(article);
			log.info("asdfasdfasdf, result:{}",result);
		}else {
			viewName = "redirect:/article/"+article.getArtNum();
			log.info("작성자와 로그인한 사람이 다른 사람임.");
		}
		
		if(ServiceResult.OK.equals(result)) {
			viewName = "redirect:/";
		}else {
			redirectAttributes.addFlashAttribute("message", article+"삭제처리 실패");
			viewName = "redirect:/";
			
		}
		return viewName;
		
		
	}

}
