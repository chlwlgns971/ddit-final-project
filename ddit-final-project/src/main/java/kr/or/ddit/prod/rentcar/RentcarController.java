package kr.or.ddit.prod.rentcar;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.prod.rentcar.service.RentcarService;
import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.RentCarVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/prod")
public class RentcarController {
	@Inject
	private RentcarService service;
	
	//대륙리스트 호출
	@RequestMapping("/rentcarList")
	public String defaultListAndContinentsList(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage
			,@ModelAttribute(name="rentcarList") RentCarVO rentcarVO
			,Model model
			) {
		PagingVO<RentCarVO> pagingVO = new PagingVO<>(8,5);

		pagingVO.setCurrentPage(currentPage);
		log.info("defaultlList 현재 페이지 세팅");
		
		int totalRecord = service.defaultCount(pagingVO);
		log.info(String.format("defaultList: 검색 조건에 맞는  상품의 수 {}", totalRecord));
		pagingVO.setTotalRecord(totalRecord);
		
		List<RentCarVO> rentcarList = service.defaultList(pagingVO);
		log.info("rentcarontroller List<RentCarVO> : {}", rentcarList);
		log.info("rentcarList.prodImg : ",rentcarList);
		
		pagingVO.setDataList(rentcarList);
		List<CategoryVO> continentsList = (List<CategoryVO>) service.getContinents();
		model.addAttribute("continentsList",continentsList);
		model.addAttribute("pagingVO", pagingVO);
		return "prod/rentcarList";
	}
	
	//국가리스트 호출
	@ResponseBody
	@RequestMapping(value="/rentcarList/country", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<CategoryVO> contriesList(
			Model model
			, @RequestParam(name="name") String continentName
			) {
		List<CategoryVO> nationsList = (List<CategoryVO>) service.getNations(continentName);
		return nationsList;
	}

	//도시리스트 호출
	@ResponseBody
	@RequestMapping(value="/rentcarList/city", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<CategoryVO> citiesList(
			Model model
			, @RequestParam(name="name") String countryName
			) {
		List<CategoryVO> citiesList = (List<CategoryVO>) service.getcities(countryName);
		return citiesList;
	}
	
	//검색결과 리스트 호출
	@ResponseBody
	@PostMapping("/rentcarList")
	public PagingVO<RentCarVO> rentalList(
			@RequestParam Map<String, Object> detailMap
			,@RequestParam(name="page", required=false ,defaultValue="1") int currentPage
			,@ModelAttribute(name="rentcarList") RentCarVO rentcarVO
			,HttpServletRequest request
			,Model model
			) {
		log.info("searchRentcarList 진입");
		//파라미터 어떻게 넘어오는지 보기위한 로그
		log.info("detailMap:{}", detailMap.size());
		log.info("detailMap에 뭐가 있을까요: {}", detailMap);
		
		HttpSession session = request.getSession();
		String resSdate = (String) detailMap.get("resSdate");
		session.setAttribute("resSdate", resSdate);
		String resEdate = (String) detailMap.get("resEdate");
		session.setAttribute("resEdate", resEdate);
		
	
		
	
		log.info("searchRentcarList PagingVO에서 한 페이지에 보여질 행 수와 하단의 페이지 버튼 개수 설정.");
		PagingVO<RentCarVO> pagingVO = new PagingVO<>(8,5);

		pagingVO.setCurrentPage(currentPage);
		pagingVO.setDetailMap(detailMap);
		log.info("detailMap :{}", detailMap);
		
		int totalRecord = service.retrieveRentCarCount(pagingVO);
		log.info(String.format("검색 조건에 맞는  상품의 수 {}", totalRecord));
		pagingVO.setTotalRecord(totalRecord);
		
		List<RentCarVO> rentcarList = service.retrieveRentCarList(pagingVO);
		log.info("rentcarController List<rentCarVO> : {}", rentcarList);
		
		pagingVO.setDataList(rentcarList);
		
		
		return pagingVO;
		
	}
	//렌터카 상세보기- 차량 정보, 업체정보 가져오기
	@RequestMapping("/rentcarView")
	public String rentalView(
			@RequestParam(name="prodNum") int prodNum
			,HttpServletRequest request
			,Model model 
			) {
		
		HttpSession session = request.getSession();
		
		String resSdate = (String) session.getAttribute("resSdate");
		String resEdate = (String) session.getAttribute("resEdate");
		log.info("픽업날짜 : {} ", resSdate);
		log.info("반납날짜 : {} ", resEdate);
		
		
		RentCarVO rentcarInfo = service.retrieveRentCar(prodNum);
		log.info("경도, 위도: {}, {}", rentcarInfo.getComLatit(),rentcarInfo.getComLngit());
		
		
		
		rentcarInfo.setResSdate(resSdate);
		rentcarInfo.setResEdate(resEdate);
		
		model.addAttribute("rentcarInfo", rentcarInfo);
	
		log.info("rentcarInfo: {}" , rentcarInfo);
		return "prod/rentcarView";
	}
	
}
