package kr.or.ddit.article.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.article.service.ArticleService;
import kr.or.ddit.vo.ArticleVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/article")
public class ArticleRetrieveController {
	private ArticleService service;
	
	@Inject
	public void setService(ArticleService service) {
		this.service = service;
	}

	//비동기방식의 articleList, 데이터만 전송.
	@RequestMapping(value = "/articleList/{where}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<ArticleVO> articleListWhere(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@ModelAttribute("simpleCondition") SearchVO simpleCondition
			, @PathVariable(name="where", required=true) String artBCode
			, ArticleVO detailCondition
			) {
		detailCondition.setArtBCode(artBCode);
		log.info("detailCondition:{}",detailCondition.getArtBCode());
		log.info("detailCondition:{}", detailCondition);
		PagingVO<ArticleVO> pagingVO = new PagingVO<>();
		log.info("PagingVO:{}",pagingVO);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(simpleCondition);
		pagingVO.setDetailCondition(detailCondition);
		int totalRecord = service.retrieveArticleCountOption(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<ArticleVO> articleList = service.retrieveArticleListOption(pagingVO);
		log.info("articleList:{}", articleList);
		pagingVO.setDataList(articleList);
		
		return pagingVO;
	}
	//비동기방식의 articleList, 데이터만 전송.
	@RequestMapping(value = "/serviceList/{where}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<ArticleVO> serviceListWhere(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@ModelAttribute("simpleCondition") SearchVO simpleCondition
			, @PathVariable(name="where", required=true) String artBCode
			, ArticleVO detailCondition
			) {
		detailCondition.setArtBCode(artBCode);
		log.info("detailCondition:{}",detailCondition.getArtBCode());
		log.info("detailCondition:{}", detailCondition);
		PagingVO<ArticleVO> pagingVO = new PagingVO<>();
		log.info("PagingVO:{}",pagingVO);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(simpleCondition);
		pagingVO.setDetailCondition(detailCondition);
		int totalRecord = service.retrieveArticleCountOption(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<ArticleVO> articleList = service.retrieveArticleListOption(pagingVO);
		log.info("articleList:{}", articleList);
		pagingVO.setDataList(articleList);
		
		return pagingVO;
	}

	@RequestMapping("service/{what}")
	public ModelAndView ServiceView(
		@PathVariable(name="what", required=true) int artNum
			) {
		ArticleVO article = service.retrieveArticle(artNum);
		ModelAndView mav = new ModelAndView();
		mav.addObject("article", article);
		mav.setViewName("article/serviceView");
		log.info("mav:{}", mav);
		return mav;
	
	}
	
	@RequestMapping("article/{what}")
	public ModelAndView articleView(
			@PathVariable(name="what", required=true) int artNum
			, @AuthenticationPrincipal User user
			) {
		ArticleVO article = service.retrieveArticle(artNum);
		ModelAndView mav = new ModelAndView();
		mav.addObject("article", article);
		mav.setViewName("article/articleView");
		mav.addObject("user", user);
		log.info("mav:{}", mav);
		return mav;
		
	}
	
	
	
	
}
