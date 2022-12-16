package kr.or.ddit.reply.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletRequest;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.reply.service.ReplyService;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ReplyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value="/replyUpdate", produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
public class ReplyUpdateController {
	@Inject
	private ReplyService service;
	
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

		service.retrieveReplyList(pagingVO);
		
		return pagingVO;
	}
	
	@Transactional
	@PostMapping
	public Map<String, Object> replyUpdate(
			@Validated(UpdateGroup.class ) @ModelAttribute ReplyVO reply
			, BindingResult errors
			) {
		log.info("ReplyUpdateController replyVO): {}", reply);
		
		Map<String, Object> result = new HashMap<>();
		if(!errors.hasErrors()) {
			result.put("result",service.modifyReply(reply));
		
		}else {
			result.put("errors", errors.getErrorCount());
		}
		
		log.info("result:{}", result);
		return result;
	
		
	}
	
	
	
}
