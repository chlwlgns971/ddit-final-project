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
@RequestMapping("/destination")
public class DestinationSyncListController {
	@Inject
	private DestinationListController otherController;
	
//	@RequestMapping("/view/{code}")
//	public Model serviceList(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
//			@ModelAttribute("simpleCondition") SearchVO simpleCondition, Model model
//			, @PathVariable(name="code", required=false) String artCCode
//			, ArticleVO detailCondition
//			) {
//		Model model = new Model();
//		PagingVO<ArticleVO> pagingVO = otherController.destListWhere(currentPage, simpleCondition, artBCode, detailCondition);
//		mav.addObject("pagingVO", pagingVO);
//		if("BC003".equals(artCCode) || "BC005".equals(artCCode) ){
//			
//			log.info("BC003005:{}", mav);
//		}
//		return mav;
//	}
	

}
