package kr.or.ddit.article.reply.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.article.reply.service.ReplyService2;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ReplyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
//@RestController
@RequestMapping(value="/article/{artNum}/replyDelete", produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
public class ReplyDeleteController2 {
	@Inject
	private ReplyService2 service;
	
	@PostMapping
	public Map<String, Object> replyDelete(
			@Validated(DeleteGroup.class) @ModelAttribute("reply") ReplyVO reply
			, @RequestParam(name="artNum", required=true) int artNum
			, @RequestParam(name="replyNum", required=true) int replyNum
			, @RequestParam(name="writer",required=true) String writer
			, @RequestParam(name="accId",required=true) String deleter
			, BindingResult errors
			) {
		log.info("reply:{}",reply);
//		ReplyVO reply1 = new ReplyVO();
//		
//		reply.setArtNum(artNum);
//		reply.setReplyNum(replyNum);
//		reply.setAccId(writer);
//		log.info("ReplyDeleteController replyVO): {}", reply1);
		
		Map<String, Object> result = new HashMap<>();
		if(writer.equals(deleter) && !errors.hasErrors()){
			result.put("result",service.removeReplyArticle(reply));
		}else {
			result.put("errors", errors.getErrorCount());
		}
		
		log.info("result:{}", result);
		return result;
	
		
	}

}
