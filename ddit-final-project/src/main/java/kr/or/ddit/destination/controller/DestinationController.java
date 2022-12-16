package kr.or.ddit.destination.controller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.calender.dao.CalenderDAO;
import kr.or.ddit.destination.dao.DestinationDAO;
import kr.or.ddit.vo.AttractionVO;
import kr.or.ddit.vo.DestinationVO;
import kr.or.ddit.vo.SearchRecordVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/destination")
public class DestinationController {
	@Inject
	private DestinationDAO dao;
	
	@Inject
	private CalenderDAO calDao;

	/**
	 * 지역코드를 받아 해당 지역코드 정보페이지로 이동시키는 컨트롤러
	 * @param areaCode 지역코드
	 * @return
	 */
	@RequestMapping("/view")
	public ModelAndView destinationView(
		@RequestParam(name="code")String areaCode
		, Principal principal
	) {
		//검색 기록에 아이디/여행지코드/시간을 저장하는 메서드(통계 자료로 활용할 예정)
		SearchRecordVO search = new SearchRecordVO();
		String accId;
		if(null==principal) {
			accId="";
		}else {
			accId=principal.getName();
		}
		
		search.setAccId(accId);
		search.setDestCode(areaCode);
		log.info("insert Search History VO: {}, {}", accId, areaCode);
		int resCnt = dao.insertSearchHistory(search);
		log.info("insert Search History Result: {}", resCnt);
		
		List<AttractionVO> attractionList = calDao.attractionList(areaCode);
		
		ModelAndView mav = new ModelAndView();
		
		
		DestinationVO dest = dao.selectDestination(areaCode);
		
		
		String viewName = "destination/destinationInfo";
		
		mav.addObject("destination", dest);
		mav.addObject("attractionList", attractionList);
		mav.setViewName(viewName);
		return mav;
	}
}