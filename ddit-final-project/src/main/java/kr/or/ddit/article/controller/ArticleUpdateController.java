package kr.or.ddit.article.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.article.service.ArticleService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.ArticleVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/article")
public class ArticleUpdateController {
	@Inject
	private ArticleService service;
	
	@GetMapping("/articleUpdate")
	public String updateForm(
			@RequestParam(name="what", required=true) int artNum
			, Model model
			) {
		ArticleVO article= service.retrieveArticle(artNum);
		model.addAttribute("article", article);
		log.info("article수정:{}",article);
		return "article/articleEdit";
	}
	
	@PostMapping("/articleUpdate")
	public String articleUpdate(
			@Validated(UpdateGroup.class) @ModelAttribute("article") ArticleVO article
			, BindingResult errors
			, Model model	
			) {
		String viewName = null;
		if(!errors.hasErrors()) {
			ServiceResult result = service.modifyArticle(article);
			String message = null;
			switch (result) {
				case OK:
					log.info("article수정완료:{}", article);
					viewName = "redirect:/article/article/"+article.getArtNum();
					break;
				default:
					message = "서버 오류";
					viewName = "article/articledEdit";
					break;
			}
			model.addAttribute("message", message);
		}else {
			viewName = "article/articleEdit";
		}
		return viewName;
	}
		
	
	
}
