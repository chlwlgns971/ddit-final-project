package kr.or.ddit.article.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.article.service.ArticleService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.ArticleVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/article")
public class ArticleInsertController {
	private final ArticleService service;
	
	@ModelAttribute("article")
	public ArticleVO article() {
		log.info("@ModelAttribute 메소드 실행.");
		return new ArticleVO();
	}
	
	@GetMapping("/articleForm")
	public String uploadArticle() {
		log.info("Get 메소드 핸들러 boardForm 실행");
		return "article/articleForm";
	}
	
	@PostMapping("/articleForm")
	public ModelAndView articleInsert(
		@ModelAttribute("article") ArticleVO article
		, Principal principal
		, Model model
	) {
		ModelAndView mav = new ModelAndView();
		log.info("Post 메소드 핸들러 articleInsert 실행");
		String id = principal.getName();
		article.setAccId(id);

		
		ServiceResult result = service.createArticle(article);
		int num = article.getArtNum();
		log.info("article:{}", article);
		log.info("result:{}",result);
		log.info("num:{}",num);

		mav.addObject(article);

		mav.setViewName("redirect:/article/article/"+num);
		
		return mav;
		
	}
	@GetMapping("/destArticleForm/{where}")
	public ModelAndView uploadDestArticle(
		@PathVariable(name="where", required=true) String artCCode
			) {
		ModelAndView mav = new ModelAndView();
		ArticleVO article = new ArticleVO();
		article.setArtCCode(artCCode);
		article.setArtBCode("BC004");
		mav.addObject("article", article);
		
		log.info("Get 메소드 핸들러 destArticleForm 실행");
		log.info("article:{}",article);
		
		String viewName = "article/destArticleForm";
		mav.setViewName(viewName);
		return mav;
	}
	
	@PostMapping("/destArticleForm/{where}")
	public ModelAndView destArticleInsert(
			@ModelAttribute("article") ArticleVO article
			, Principal principal
			, Model model
			) {
		ModelAndView mav = new ModelAndView();
		log.info("Post 메소드 핸들러 articleInsert 실행");
		String id = principal.getName();
		article.setAccId(id);
		
		ServiceResult result = service.createArticle(article);
		int num = article.getArtNum();
		log.info("article:{}", article);
		log.info("result:{}",result);
		log.info("num:{}",num);
		
		mav.addObject(article);
		
		mav.setViewName("redirect:/article/article/"+num);
		
		return mav;
		
	}
}
