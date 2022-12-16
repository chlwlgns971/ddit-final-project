package kr.or.ddit.blog.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.blog.service.BlogService;
import kr.or.ddit.enumpkg.ServiceResult;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BlogSubcribeController {
	@Inject
	private BlogService service;
	
	/**
	 * 구독정보를 리턴해주는 컨트롤러(비동기)
	 * @param accId 이용하고 있는 회원 아이디
	 * @param blogId 블로그 주인 아이디
	 * @return
	 */
//	@RequestMapping(value="/blog/subcribe",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
//	@ResponseBody
//	public Map<String, Object> subcribeManage(@RequestParam(name="accId", required=true) String accId, @RequestParam(name="blogId", required=true) String blogId) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		ServiceResult result = null;
//		int count = service.checkSubcribe(blogId, accId);
//		if(count > 0) { //구독정보가 있을 때 구독취소 및 상태정보 맵에 담기
//			result = service.removeSubcribe(blogId, accId);
//			if(result == ServiceResult.OK) {
//				map.put("state", true);
//				map.put("data", "Subcribe");
//			}
//			else map.put("state", false);
//		}
//		else { // 구독 정보가 없을 때 구독하기 및 상태정보 맵에 담기
//			result = service.insertSubcribe(blogId, accId);
//			if(result == ServiceResult.OK) {
//				map.put("state", true);
//				map.put("data", "Subcribed");
//			}
//			else map.put("state", false);
//		}
//		
//		return map;
//	}
	
	/**
	 * 구독정보를 리턴해주는 컨트롤러
	 * @param accId 이용하고 있는 회원 아이디
	 * @param blogId 블로그 주인 아이디
	 * @return
	 */
	@RequestMapping("/blog/subcribe")
	public String subcribeManage(@RequestParam(name="accId", required=true) String accId, @RequestParam(name="blogId", required=true) String blogId) {
		String viewName=null;
		ServiceResult result = null;
		int count = service.checkSubcribe(blogId, accId);
		if(count > 0) { //구독정보가 있을 때 구독취소 및 상태정보 맵에 담기
			result = service.removeSubcribe(blogId, accId);
		}
		else { // 구독 정보가 없을 때 구독하기 및 상태정보 맵에 담기
			result = service.insertSubcribe(blogId, accId);
		}
		viewName = "redirect:/blog/01/rest4TripBlog?id="+blogId;
		return viewName;
	}
}
