package kr.or.ddit.admin.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.admin.service.AdminManageDestinationService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.DestinationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage/admin")
public class AdminManageDestinationController {
	
	@Inject
	private AdminManageDestinationService service;
	
	
	// 대륙 분류 코드 리스트 반환 컨트롤러 
	@RequestMapping("/manageDestination")
	public String manageDestination(
		Model model
	) {
		// 대륙 분류 리스트 받기
		List<CategoryVO> continentList = service.getContinentList();
		// 모델에 리스트 담기
		model.addAttribute("continentList", continentList);
		return "adminPage/manageDestination";
	}
	
	
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

	//비동기로 해당 여행지 정보를  반환하는 메서드
	@PostMapping(value="/destDetail", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public DestinationVO getDestination(
		@RequestParam("destCode") String destCode
	){
		DestinationVO destination = service.getDestination(destCode);
		return destination;
	}
	//해당 여행지 정보를  수정하는 메서드
	@PostMapping(value="/editDetail")
	public String editDestination(
		DestinationVO destination
		, RedirectAttributes ra
	){
		
		log.info("메롱 destination: {}",destination.toString());
		
		String message = "";
		ServiceResult result = service.editDest(destination);
		
		log.info("destination: {}",destination.toString());
		
		if(ServiceResult.OK==result) {
			message="정상적으로 되었습니다.";
		}else {
			message="여행지 등록에 실패했습니다. 다시 시도하십시오.";
		}
		ra.addFlashAttribute("message", message);
		
		return "redirect:/mypage/admin/manageDestination";
	}
	// 비동기로 대륙 목록을 반환하는 메서드
	@PostMapping(value="/contiList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<CategoryVO> getConti(){
		List<CategoryVO> continentList = service.getContinentList();
		return continentList;
	}
	// 비동기로 여행지를 등록하는 메서드
	@PostMapping(value="/insertDest", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public String insertDest(
		@RequestParam Map<String, String> param
	){
		String message = "";
		ServiceResult result = service.insertDest(param);
		if(ServiceResult.OK==result) {
			message="정상적으로 등록되었습니다.";
		}else {
			message="여행지 등록에 실패했습니다. 다시 시도하십시오.";
		}
		return message;
	}
	
	
	
}
