package kr.or.ddit.article.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.article.service.ArticleService;
import kr.or.ddit.vo.ArticleVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/destination")
public class DestinationListController {
	@Inject
	private ArticleService service;
	
	//비동기방식의 articleList, 데이터만 전송.
	@RequestMapping(value = "/view/{code}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<ArticleVO> destListWhere(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@ModelAttribute("simpleCondition") SearchVO simpleCondition
			, @PathVariable(name="code", required=false) String artCCode
			, ArticleVO detailCondition
			) {
		log.info("여기로 들어오는 가?");
		detailCondition.setArtCCode(artCCode);
		log.info("artCCode:{}", artCCode);
		detailCondition.setArtBCode("BC004");
		log.info("detailCondition:{}",detailCondition.getArtCCode());
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
	
	
	
	
	

}
