package kr.or.ddit.calender.controller;


import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.calender.dao.CalenderDAO;
import kr.or.ddit.calender.service.CalenderService;
import kr.or.ddit.destination.dao.DestinationDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.AccountVOWrapper;
import kr.or.ddit.vo.AttractionVO;
import kr.or.ddit.vo.CalenderVO;
import kr.or.ddit.vo.DestinationVO;
import kr.or.ddit.vo.TravNoteVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/calender")
public class CalenderController {
	@Inject
	private CalenderService service;
	
	@Inject
	private CalenderDAO dao;
	
	@Inject
	private DestinationDAO destDao;
	
	@RequestMapping("/createCalender")
	public String createCalender(@RequestParam(name="startDay") String calSdate, @RequestParam(name="endDay") String calEdate
			, @RequestParam(name="areaCode") String areaCode, Model model, @AuthenticationPrincipal AccountVOWrapper account) {
		log.info("CalenderController calSdate : {}", calSdate);
		log.info("CalenderController calEdate : {}", calEdate);
		log.info("CalenderController areaCode : {}", areaCode);
		log.info("CalenderController account : {}", account.getAuthorities());
		String viewName = null;
		ServiceResult result = service.createCalender(calSdate, calEdate, areaCode, account.getUsername());
		if(result == ServiceResult.OK) {
			DestinationVO dest = destDao.selectDestination(areaCode);
			model.addAttribute("dest", dest);
			
			viewName = "redirect:/calender/viewMyCalenders";
		}
		else viewName = "redirect:/destination/view?code="+areaCode;
		return viewName;
	}
	
	@RequestMapping("/viewMyCalenders")
	public ModelAndView viewMyCalenders(@AuthenticationPrincipal AccountVOWrapper account) {
		ModelAndView mav = new ModelAndView();
		String viewName = "myPage/calenderList";
		
		List<CalenderVO> calenders = dao.calenderList(account.getUsername());
		log.info("CalenderController calenders : {}",calenders);
		
		mav.addObject("calenders", calenders);
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping("/calenderDetail")
	public ModelAndView makeDetailCalender(@RequestParam(name="what")int calNum) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("calender/calenderDetail");
		
		CalenderVO calender = dao.calenderInfo(calNum);
		List<AttractionVO> attractionList = dao.attractionList(calender.getAreaCode());
		List<TravNoteVO> travNoteList = dao.travNoteList(calender.getCalNum());
		mav.addObject("calender", calender);
		mav.addObject("attractionList", attractionList);
		mav.addObject("travNoteList", travNoteList);
		
		return mav;
	}
	
	@RequestMapping("/deleteCalender")
	@ResponseBody
	public String deleteCalender(@RequestParam(name="what")int calNum, Principal principal) {
		String result = "fail";
		ServiceResult serviceResult = service.deleteCalender(calNum, principal.getName());
		if(serviceResult == ServiceResult.OK) result = "success";
		return result;
	}
}
