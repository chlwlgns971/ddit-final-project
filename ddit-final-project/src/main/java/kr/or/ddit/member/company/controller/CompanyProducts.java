package kr.or.ddit.member.company.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.account.service.AccountService;
import kr.or.ddit.booking.dao.BookingDAO;
import kr.or.ddit.member.company.service.CompanyMemberService;
import kr.or.ddit.member.company.service.CompanyService;
import kr.or.ddit.prod.hotel.service.HotelService;
import kr.or.ddit.prod.rentcar.service.RentcarService;
import kr.or.ddit.prod.service.ProdService;
import kr.or.ddit.vo.AccountVO;
import kr.or.ddit.vo.AccountVOWrapper;
import kr.or.ddit.vo.HotelRoomVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ProdImageVO;
import kr.or.ddit.vo.ProdVO;
import kr.or.ddit.vo.RentCarVO;
import kr.or.ddit.vo.ResDatailVO;
import kr.or.ddit.vo.ReservationVO;
import kr.or.ddit.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage/member/company/product")
public class CompanyProducts {
	@Inject
	private CompanyService cService;
	@Inject
	private RentcarService rcService;
	@Inject
	private HotelService hService;
	@Inject
	private AccountService aSerice;
	@Inject
	private ProdService pService;
	@Inject
	private CompanyMemberService cmService;
	
	@Inject
	private BookingDAO bookingDao;

	@Value("#{appInfo.prodImageFolder}")
	private String imageFolderURL;

	String noImg = "No_image";
	String catuCode = "HRCT";

	/*
	 * ========================================================================
	 * ============================ ????????? ???????????? ================================
	 * ========================================================================
	 */

	@GetMapping(value = "/list")
	public String companyProductView(Model model, @ModelAttribute("simpleCondition") SearchVO simpleCondition,
			@AuthenticationPrincipal AccountVOWrapper accountWrapper,
			@AuthenticationPrincipal(expression = "realUser") AccountVO account,
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage) {

		PagingVO<ProdVO> pagingVO = new PagingVO<>(10, 5);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(simpleCondition);

		// ????????? ?????? ??????????????? AccountVO??? ??????
		AccountVO accountVO = accountWrapper.getRealUser();

		// AccountVO??? ????????? ID??? userId??? ??????.
		String comId = accountVO.getAccId();

		Map<String, Object> detailMap = new HashMap<>();
		detailMap.put("comId", comId);
		pagingVO.setDetailMap(detailMap);

		int totalRecord = pService.retrieveComCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);

		// jsp??? ????????? ???????????????
		List<ProdVO> CompanyProductList = pService.CompanyProductList(pagingVO);

		// ???????????? ???????????? ??????
		pagingVO.setDataList(CompanyProductList);

		// model??? view??? ?????????

		model.addAttribute("CompanyProductList", CompanyProductList);
		model.addAttribute("pagingVO", pagingVO);

		return "myPage/member/company/companyProductManager";
	}

	/*
	 * ========================================================================
	 * ============================ ?????? ?????????????????? ===============================
	 * ========================================================================
	 */
//	<------------------------------?????????------------------------------>
	@RequestMapping(value = "/detail/rentCar", method = RequestMethod.GET)
	public String companyProductRentCar(@RequestParam(name = "what", required = true) int prodNum, Model model) {
		RentCarVO rentCarVO = rcService.rentCarDetail(prodNum);
		ProdVO prodVO=new ProdVO();

		
		
		rentCarVO.setProdNum(prodNum);
		List<ProdImageVO> prodImageList = rcService.retrieveRentCarImage(prodNum);
		String majorImage = "";
		if (prodImageList.size() != 0) {

			majorImage = "/rest4Trip" + imageFolderURL + "/" + prodImageList.get(0).getPImgName();
			if (prodImageList.get(0).getPImgName().length() == 0) {
				majorImage = "/rest4Trip/resources/images/No_image";
			}
		}
		List<String> prodImgName = new ArrayList<String>();
		for (ProdImageVO vo : prodImageList) {
			prodImgName.add(vo.getPImgName());
		}

		model.addAttribute("prodNum", prodNum);
		model.addAttribute("majorImage", majorImage);
		model.addAttribute("prodImgName", prodImgName);
		model.addAttribute("rentCarVO", rentCarVO);

		return "myPage/member/company/product/rentCarDetailView";
	}

//	<------------------------------??????------------------------------>
	@RequestMapping(value = "/detail/hotelRoom", method = RequestMethod.GET)
	public String companyProductHotel(@RequestParam(name = "what", required = true) int prodNum, Model model

	) {
		HotelRoomVO hotelRoomVO = hService.hotelRoomDetail(prodNum);
		hotelRoomVO.setProdNum(prodNum);
		List<ProdImageVO> prodImageList = hService.retrieveHotelImage(prodNum);
		String majorImage = "";

		if (prodImageList.size() != 0) {

			majorImage = "/rest4Trip" + imageFolderURL+"/"+ prodImageList.get(0).getPImgName();
			if (prodImageList.get(0).getPImgName().length() == 0) {
				majorImage = "/rest4Trip/resources/images/No_image";
			}
		}
		List<String> prodImgName = new ArrayList<String>();
		log.info("?????????????????????{}",majorImage);

		for (ProdImageVO vo : prodImageList) {
			prodImgName.add(vo.getPImgName());
		}

		model.addAttribute("prodNum", prodNum);
		model.addAttribute("majorImage", majorImage);
		model.addAttribute("prodImgName", prodImgName);
		model.addAttribute("hotelRoomVO", hotelRoomVO);

		return "myPage/member/company/product/hotelDetailView";
	}
	
	/**
	 * ???????????? ?????? ????????? ??????????????? ???????????? ?????? ??????????????? ????????????
	 * @param principal
	 * @param model
	 * @return
	 */
	@RequestMapping("/reservation")
	public String companyReservationList(Principal principal, Model model) {
		List<ReservationVO> reservationList = bookingDao.getResComList(principal.getName());
		if(reservationList == null || reservationList.isEmpty()) model.addAttribute("reservationList", null);
		else model.addAttribute("reservationList", reservationList);
		return "myPage/member/company/reservationList";
	}
	
	@RequestMapping("/resDetail")
	public String resMemInfo(@RequestParam(name="what")String resCode, Model model) {
		ReservationVO reservation = bookingDao.getReservationInfo(resCode);
		ResDatailVO resDetail = bookingDao.getResMemberInfo(resCode);
		model.addAttribute("reservation", reservation);
		model.addAttribute("resDetail", resDetail);
		return "myPage/member/company/reservationDetail";
	}
}
