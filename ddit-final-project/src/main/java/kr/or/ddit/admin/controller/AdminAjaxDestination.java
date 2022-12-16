package kr.or.ddit.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.admin.service.AdminManageDestinationService;
import kr.or.ddit.vo.CategoryVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminAjaxDestination {
	
	@Inject
	private AdminManageDestinationService service;
	
	
	
	//비동기로 해당 대륙의 국가 리스트를 반환하는 메서드
	@PostMapping(value="/nationList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<CategoryVO> getNationList(
		@RequestParam("continent") String continent
	){
		List<CategoryVO> nationList = service.getNationList(continent);
		return nationList;
	}
	
	//비동기로 해당 국가의 여행지 리스트를 반환하는 메서드
	@PostMapping(value="/destList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<CategoryVO> getDestList(
			@RequestParam("nation") String nation
	){
		List<CategoryVO> destList = service.getDestList(nation);
		return destList;
	}

	
	
	
	
}
