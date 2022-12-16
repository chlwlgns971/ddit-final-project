package kr.or.ddit.article.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.vo.ArticleVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/article")
public class ArticleSyncListController {

	@Inject
	private ArticleRetrieveController otherController;

//	@RequestMapping("/articleList")
//	public String list(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
//			@ModelAttribute("simpleCondition") SearchVO simpleCondition, Model model) {
//		PagingVO<ArticleVO> pagingVO = otherController.list(currentPage, simpleCondition);
//		model.addAttribute("pagingVO", pagingVO);
//		
//		return "article/articleList";
//	}

	@RequestMapping("/articleList/{where}")
	public ModelAndView articleList(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@ModelAttribute("simpleCondition") SearchVO simpleCondition, Model model
			, @PathVariable(name="where", required=true) String artBCode
			, ArticleVO detailCondition
			) {
			ModelAndView mav = new ModelAndView();
			PagingVO<ArticleVO> pagingVO = otherController.articleListWhere(currentPage, simpleCondition, artBCode, detailCondition);
			mav.addObject("pagingVO", pagingVO);
			if("BC001".equals(artBCode) || "BC002".equals(artBCode)) {
				mav.setViewName("article/articleList");
				
				log.info("BC001002:{}", mav);
			}
		return mav;
	}
	@RequestMapping("/serviceList/{where}")
	public ModelAndView serviceList(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@ModelAttribute("simpleCondition") SearchVO simpleCondition, Model model
			, @PathVariable(name="where", required=true) String artBCode
			, ArticleVO detailCondition
			) {
		ModelAndView mav = new ModelAndView();
		PagingVO<ArticleVO> pagingVO = otherController.serviceListWhere(currentPage, simpleCondition, artBCode, detailCondition);
		mav.addObject("pagingVO", pagingVO);
		if("BC003".equals(artBCode) || "BC005".equals(artBCode) ){
			mav.setViewName("article/serviceList");
			
			log.info("BC003005:{}", mav);
		}
		return mav;
	}

}
