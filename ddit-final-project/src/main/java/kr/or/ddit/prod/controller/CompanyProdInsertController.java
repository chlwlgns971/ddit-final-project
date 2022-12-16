package kr.or.ddit.prod.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.support.incrementer.HsqlSequenceMaxValueIncrementer;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.account.service.AccountService;
import kr.or.ddit.member.company.service.CompanyMemberService;
import kr.or.ddit.prod.hotel.service.HotelService;
import kr.or.ddit.prod.rentcar.service.RentcarService;
import kr.or.ddit.prod.service.ProdService;
import kr.or.ddit.vo.AccountVO;
import kr.or.ddit.vo.AccountVOWrapper;
import kr.or.ddit.vo.AreaVO;
import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.CompanyInfoVO;
import kr.or.ddit.vo.CompanyMemberVO;
import kr.or.ddit.vo.HotelRoomVO;
import kr.or.ddit.vo.ProdImageVO;
import kr.or.ddit.vo.ProdVO;
import kr.or.ddit.vo.RentCarVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
//@RequestMapping("/prod/Insert")
public class CompanyProdInsertController {
	@Inject
	private final HotelService hService;
	@Inject
	private final ProdService pService;
	@Inject
	private final AccountService aSerice;
	@Inject
	private final CompanyMemberService cmService;
	@Inject
	private final RentcarService rService;

	@Value("#{appInfo.prodImageFolder}")
	private String imageFolderURL;
	@Value("#{appInfo.prodImageFolder}")
	private Resource imageFolderRes;
	private File saveFolder;

	@PostConstruct
	public void init() throws IOException {
		saveFolder = imageFolderRes.getFile();
		if (!saveFolder.exists())
			saveFolder.mkdirs();
	}

	@ModelAttribute("hotel")
	public HotelRoomVO hotelRoom() {

		return new HotelRoomVO();
	}

	String hotelCatuCode = "HRCT";
	String carCatuCode = "RCCT";
	String colorCatuCode = "COLOR";
	String carFuelCode = "RCFUEL";
	String carGear = "CARGEAR";
	String carBrand = "CARBRND";
	String areaName="";

	String majorImage = "";
	String prodImgName = "";

	@RequestMapping(value = "/prod/Insert", method = RequestMethod.GET)
	public String ProdFrom(Model model, @AuthenticationPrincipal AccountVOWrapper accountWrapper,
			@AuthenticationPrincipal(expression = "realUser") AccountVO account, ProdVO prodVO) {
		String viewName = null;

		// 인증객체에서 아이디 가져오기
		AccountVO test1 = accountWrapper.getRealUser();
		String comId = test1.getAccId();

		// 계정객체에 들어있는 멤버코드를 추출하기 위함
		AccountVO accVO = aSerice.selectAccount(comId);
		String accRole = accVO.getMemCode();

		// cInfoNum 가져오기
		CompanyInfoVO companyInfo = pService.SelectCompanyInfo(comId);


		List<CategoryVO> hotelCategoryList = pService.CategoryList(hotelCatuCode);
		List<CategoryVO> rentCarCategoryList = pService.CategoryList(carCatuCode);
		List<CategoryVO> carColorCategoryList = pService.CategoryList(colorCatuCode);
		List<CategoryVO> carFuelCategoryList = pService.CategoryList(carFuelCode);
		List<CategoryVO> carGearCategoryList = pService.CategoryList(carGear);
		List<CategoryVO> carBrandCategoryList = pService.CategoryList(carBrand);
		List<AreaVO> areaList=pService.findArea();
		if (accRole.equals("ROLE_HC")) {

			String comCode = accRole.substring(accRole.length() - 2);
			model.addAttribute("categoryList", hotelCategoryList);
			model.addAttribute("companyInfo", companyInfo);
			model.addAttribute("comCode", comCode);
			model.addAttribute("areaList", areaList);

			viewName = "myPage/member/company/product/hotelInsertForm";

		} else {
			String comCode = accRole.substring(accRole.length() - 2);
			model.addAttribute("carBrandCategoryList", carBrandCategoryList);
			model.addAttribute("carGearCategoryList", carGearCategoryList);
			model.addAttribute("categoryList", rentCarCategoryList);
			model.addAttribute("carColorCategoryList", carColorCategoryList);
			model.addAttribute("carFuelCategoryList", carFuelCategoryList);
			model.addAttribute("companyInfo", companyInfo);
			model.addAttribute("comCode", comCode);
			model.addAttribute("areaList", areaList);

			viewName = "myPage/member/company/product/rentCarInsertForm";
		}

		return viewName;
	}

	/*
	 * <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	 * >
	 * <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<상품등록하기>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	 * <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	 * >>>
	 */
	@RequestMapping(value = "/prod/Insert", method = RequestMethod.POST)
	public String prodHotelInsert(@AuthenticationPrincipal AccountVOWrapper accountWrapper
			, @AuthenticationPrincipal(expression = "realUser") AccountVO account
			, @ModelAttribute HotelRoomVO hotelRoomVO
			, @ModelAttribute RentCarVO rentCarVO
			, @ModelAttribute ProdVO prodVO
			, @ModelAttribute AreaVO areaVO
			,Model model, @RequestPart(name = "multipartImage") List<MultipartFile> multipartImage) {

		String viewName = null;

		// 인증객체에서 아이디 가져오기
		AccountVO test1 = accountWrapper.getRealUser();
		String comId = test1.getAccId();


		// 계정객체에 들어있는 멤버코드를 추출하기 위함
		AccountVO accVO = aSerice.selectAccount(comId);
		String accRole = accVO.getMemCode();
		log.info("com Role: {}", accRole);

		// cInfoNum 가져오기
		CompanyInfoVO companyInfo = pService.SelectCompanyInfo(comId);

		
//		log.info("cinfoNum: {}", cInfoNum);

		// prodNum 발급 받는 메서드
		int prodNum = pService.getProdNum();
		log.info("prodNum: {}", prodNum);

		// prodvo에 이미지파일 리스트 세팅
		prodVO.setProdImages(multipartImage);
		// 발급받은 prodNum 세팅하기
		prodVO.setProdNum(prodNum);
//		prodVO.setCinfoNum(companyInfo.getCinfoNum());
		prodVO.setComId(comId);

		for (MultipartFile mpfSize : multipartImage) {
			// 부모 테이블인 prodvo가 먼저 등록이 되어야 한다.
			int prodRowcnt = pService.createProd(prodVO);
			int insertProdNum = prodVO.getProdNum();
			
//////////////////////////////아무런 이미지도 추가하지 않았을때/////////////////////////
			if (mpfSize.getSize() == 0) {
				if (accRole.equals("ROLE_RC")) {
					// 자식 테이블인 rentCarVO 가 그 다음에 등록 되어야 한다.
					rentCarVO.setProdNum(insertProdNum);
					//렌터카정보를 입력한다.
					int carRowCnt=rService.createRentCarProduct(rentCarVO);
					viewName = "myPage/member/company/product/rentCarDetailView";
					
				}else {
					// 자식 테이블인 hotelRoomVO 가 그 다음에 등록 되어야 한다.
					hotelRoomVO.setRomNum(insertProdNum);
					// 상품명과 호텔명은 같은것이므로 같은값으로 셋팅을 해준다.
					String roomName = prodVO.getProdNam();
					hotelRoomVO.setRomNam(roomName);
					// 호텔 내용을 입력한다.
					int hotelRowcnt = hService.createHotelProduct(hotelRoomVO);
					viewName = "myPage/member/company/product/hotelDetailView";
				}
				
				List<AreaVO> areaList = pService.selectArea(areaVO);

				break;

////////////////////////////이미지를 추가했을때/////////////////////////				
			} else {

				for (ProdImageVO vo : prodVO.getProdImageList()) {
					log.info("getProdNum: {}", vo.getProdNum());
					vo.setProdNum(prodVO.getProdNum());
				}

				// 상품내역 등록하기
				System.out.println(prodRowcnt);

				// 지역코드 가져오기
				List<AreaVO> areaList = pService.selectArea(areaVO);

				log.info("가져온 지역코드 리스트 사이즈: {}", areaList);
				List<ProdImageVO> prodImageList = pService.findThumbnail(prodVO.getProdNum());
				log.info("prodImageList // findThumnail: {}", prodVO.getProdNum());

				String thumbNail = prodImageList.get(0).getPImgName();
				prodVO.setProdImg("/rest4Trip" + imageFolderURL + "/" + thumbNail);

				int thumNailCount = pService.insertThumbNail(prodVO);
				System.out.println(thumNailCount);
				
				String majorImage = "";
				
				
////////////////////////////////렌터카를 등록했을때////////////////////////////////////////
				if (accRole.equals("ROLE_RC")) {
					rentCarVO.setProdNum(insertProdNum);
					int carRowCnt=rService.createRentCarProduct(rentCarVO);
					
					if (carRowCnt > 0) {
						for (int i = 0; i <= 0; i++) {
							majorImage = "/rest4Trip"+imageFolderURL+"/"+prodImageList.get(i).getPImgName();
						}
						List<String> prodImgName = new ArrayList<String>();
						
						for (ProdImageVO vo : prodImageList) {
							prodImgName.add(vo.getPImgName());
						}
						viewName = "myPage/member/company/product/rentCarDetailView";
						model.addAttribute("majorImage", majorImage);
						model.addAttribute("prodImgName", prodImgName);
						model.addAttribute("prodVO", prodVO);
						model.addAttribute("rentCarVO", rentCarVO);
					}else {
						
					}
					// 자식 테이블인 hotelRoomVO  등록 한다.
					
//////////////////////////////호텔을 등록했을때////////////////////////////////////////				
				} else if (accRole.equals("ROLE_HC")) {
					// 자식 테이블인 hotelRoomVO  등록 한다.
					hotelRoomVO.setRomNum(insertProdNum);
					
					// 상품명과 호텔명은 같은것이므로 같은값으로 셋팅을 해준다.
					String roomName = prodVO.getProdNam();
					hotelRoomVO.setRomNam(roomName);
					int hotelRowcnt = hService.createHotelProduct(hotelRoomVO);
					
					if (hotelRowcnt > 0) {						
						for (int i = 0; i <= 0; i++) {
							majorImage ="/rest4Trip"+imageFolderURL+"/"+prodImageList.get(i).getPImgName();
						}
						List<String> prodImgName = new ArrayList<String>();

						for (ProdImageVO vo : prodImageList) {
							prodImgName.add(vo.getPImgName());
						}
						viewName = "myPage/member/company/product/hotelDetailView";
						model.addAttribute("majorImage", majorImage);
						model.addAttribute("prodImgName", prodImgName);
						model.addAttribute("prodVO", prodVO);
						model.addAttribute("hotelRoomVO", hotelRoomVO);
					} else {

					}
				} else {
					model.addAttribute("majorImage", majorImage);
					viewName = "/mypage/member/company/product/detail/package";
				}
				break;
			}
		}
		return viewName;
	}

}
