package kr.or.ddit.reply.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.reply.service.ReplyService;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ReplyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value="/replyDelete", produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
public class ReplyDeleteController {
	@Inject
	private ReplyService service;
	
	@PostMapping
	public Map<String, Object> replyDelete(
			@Validated(DeleteGroup.class) ReplyVO reply,
			@RequestParam(name="replyNum", required= true) int replyNum
			, BindingResult errors
			) {
		reply.setPostNum(replyNum);
		Map<String, Object> result = new HashMap<>();
		if(!errors.hasErrors()){
			result.put("result",service.removeReply(reply.getReplyNum()));
		}else {
			result.put("errors", errors.getErrorCount());
		}
		
		log.info("result:{}", result);
		return result;
	
		
	}

}
