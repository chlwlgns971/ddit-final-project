package kr.or.ddit.article.reply.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.article.reply.service.ReplyService2;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ReplyVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j

//@RestController
@RequestMapping(value="/article/{artNum}/reply", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
public class ReplyInsertController2 {
	
	@Inject
	private ReplyService2 service;
	
	@GetMapping
	public PagingVO<ReplyVO> replyList(
		ReplyVO detailCondition
		, @RequestParam(name="page", required=false, defaultValue="1") int currentPage
	) {
		log.info("detailCondition:{}",detailCondition);
		PagingVO<ReplyVO> pagingVO = new PagingVO<>();
		pagingVO.setDetailCondition(detailCondition);
		pagingVO.setCurrentPage(currentPage);
		log.info("pagingVO:{}", pagingVO);

		service.retrieveReplyListArticle(pagingVO);
		
		return pagingVO;
	}
	
	
	// 댓글 Insert   
	@PostMapping
	public Map<String, Object> replyList(
		@Validated(InsertGroup.class) @ModelAttribute ReplyVO reply
		, Errors errors
		, Principal principal
	) {	
		log.info("ReplyInsertController replyVO : {}", reply);
		Map<String, Object> result = new HashMap<>();
		if(!errors.hasErrors()) {
			result.put("result", service.createReplyArticle(reply));
		}else {
			result.put("errors", errors.getFieldErrorCount());
			log.info("여기로 들어오는 거깄지");
		}
		return result;
	}
}