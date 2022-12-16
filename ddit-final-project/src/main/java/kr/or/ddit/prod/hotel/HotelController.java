
package kr.or.ddit.prod.hotel;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.prod.hotel.service.HotelService;
import kr.or.ddit.vo.AccountVO;
import kr.or.ddit.vo.AccountVOWrapper;
import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.CompanyInfoVO;
import kr.or.ddit.vo.HotelRoomVO;
import kr.or.ddit.vo.PagingVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/prod")
public class HotelController {
	@Inject
	private HotelService service;
	

	//대륙리스트 호출 + 기본 호텔리스트 호출
	@RequestMapping("/hotelList")
	public String defaultListAndContinentsList(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage
			,@ModelAttribute(name="hotelList") HotelRoomVO hotelRoomVO
			,Model model
			) {
		PagingVO<HotelRoomVO> pagingVO = new PagingVO<>(8,5);

		pagingVO.setCurrentPage(currentPage);
		log.info("defaultlList 현재 페이지 세팅");
		
		int totalRecord = service.defaultCount(pagingVO);
		log.info(String.format("defaultList: 검색 조건에 맞는  상품의 수 {}", totalRecord));
		pagingVO.setTotalRecord(totalRecord);
		
		List<HotelRoomVO> hotelList = service.defaultList(pagingVO);
		log.info("HotelController List<HotelRoomVO> : {}", hotelList);
		
		pagingVO.setDataList(hotelList);
		List<CategoryVO> continentsList = (List<CategoryVO>) service.getContinents();
		model.addAttribute("continentsList",continentsList);
		model.addAttribute("pagingVO", pagingVO);
		return "prod/hotelList";
	}
	
	//국가리스트 호출
	@ResponseBody
	@RequestMapping(value="/hotelList/country", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<CategoryVO> contriesList(
			Model model
			, @RequestParam(name="name") String continentName
			) {
		List<CategoryVO> nationsList = (List<CategoryVO>) service.getNations(continentName);
		return nationsList;
	}

	//도시리스트 호출
	@ResponseBody
	@RequestMapping(value="/hotelList/city", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<CategoryVO> citiesList(
			Model model
			, @RequestParam(name="name") String countryName
			) {
		List<CategoryVO> citiesList = (List<CategoryVO>) service.getcities(countryName);
		return citiesList;
	}
	

	
	//검색조건을 가지고 호텔 검색
	@ResponseBody
	@PostMapping(value="/hotelList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public PagingVO<HotelRoomVO> searchHotelList(
			@RequestParam Map<String, Object> detailMap
			,@RequestParam(name="page", required=false, defaultValue="1") int currentPage
			,@ModelAttribute(name="hotelList") HotelRoomVO hotelRoomVO
			,HttpServletRequest request
			,Model model
		)throws Exception {
		log.info("searchHotelList 진입");
		//파라미터 어떻게 넘어오는지 보기위한 로그
		log.info("detailMap:{}", detailMap.size());
		
	
		log.info("searchHotelList PagingVO에서 한 페이지에 보여질 행 수와 하단의 페이지 버튼 개수 설정.");
		PagingVO<HotelRoomVO> pagingVO = new PagingVO<>(8,5);

		pagingVO.setCurrentPage(currentPage);
		log.info("searchHotelList 현재 페이지 세팅");
		pagingVO.setDetailMap(detailMap);
		log.info("detailMap :{}", detailMap);
		
		HttpSession session = request.getSession();
		String resSdate = (String) detailMap.get("resSdate");
		session.setAttribute("resSdate", resSdate);
		String resEdate = (String) detailMap.get("resEdate");
		session.setAttribute("resEdate", resEdate);
		String roomString = (String) detailMap.get("room");
		int room = Integer.parseInt(roomString) ;
		session.setAttribute("room", room);
		String guestString = (String) detailMap.get("guest");
		int guest = Integer.parseInt(guestString);
		session.setAttribute("guest", guest);
		
		
		int totalRecord = service.retrieveHotelCount(pagingVO);
		log.info(String.format("searchHotelList: 검색 조건에 맞는  상품의 수 {}", totalRecord));
		pagingVO.setTotalRecord(totalRecord);
		
		List<HotelRoomVO> hotelList = service.retrieveHotelList(pagingVO);
		log.info("HotelController List<HotelRoomVO> : {}", hotelList);
		
		pagingVO.setDataList(hotelList);
		log.info("searchHotelList: DataList Setting");
		
		return pagingVO;
		
	}
	
	
	//호텔 상세 뷰- 업체정보 가져오기
	@RequestMapping("/hotelView")
	public String hotelView(
			@RequestParam(name="cinfoNum") int cinfoNum
			,HttpServletRequest request
			,Model model
			)throws Exception {
		
		HttpSession session = request.getSession();
		
		String resSdate = (String) session.getAttribute("resSdate");
		String resEdate = (String) session.getAttribute("resEdate");
		int room = (int) session.getAttribute("room");
		int guest = (int) session.getAttribute("guest");
		log.info("체크인날짜 : {} ", resSdate);
		log.info("체크인날짜 : {} ", resEdate);
		log.info("방 개수: {}", room);
		log.info("인원: {}", guest);
		
		HotelRoomVO hotelRoomVO = new HotelRoomVO();
		hotelRoomVO.setCinfoNum(cinfoNum);
		hotelRoomVO.setResSdate(resSdate);
		hotelRoomVO.setResEdate(resEdate);
		hotelRoomVO.setProdQty(room);

		CompanyInfoVO hotelInfo = service.retrieveHotel(cinfoNum);
		List<HotelRoomVO> roomInfo = service.retrieveRoomInfo(hotelRoomVO);
		
		log.info("HotelController HotelRoomVO : {}", hotelInfo);
		log.info("HotelController List<HotelRoomVO> : {}", roomInfo);
		model.addAttribute("hotelInfo", hotelInfo);
		model.addAttribute("roomInfo", roomInfo);
		
		return "prod/hotelView";
		
	}
}
