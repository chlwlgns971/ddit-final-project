package kr.or.ddit.prod.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.account.service.AccountService;
import kr.or.ddit.member.company.controller.CompanyProducts;
import kr.or.ddit.member.company.service.CompanyMemberService;
import kr.or.ddit.member.company.service.CompanyService;
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
import kr.or.ddit.vo.PersonalMemberVO;
import kr.or.ddit.vo.ProdImageVO;
import kr.or.ddit.vo.ProdVO;
import kr.or.ddit.vo.ProfileImageVO;
import lombok.extern.slf4j.Slf4j;

import org.springframework.ui.Model;

@Slf4j
@Controller
@RequestMapping("/mypage/member/company/product/HotelRoomUpdate")
public class HotelUpdateController {
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

	String catuCode = "HRCT";
	File save;
	File getFileName;

	// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<상품수정하기전
	// 뷰>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	@GetMapping
	public String updateHotelProdView(@RequestParam(name = "what", required = true) int prodNum, Model model,
			@AuthenticationPrincipal AccountVOWrapper accountWrapper,
			@AuthenticationPrincipal(expression = "realUser") AccountVO account

	) {

		String viewName = null;

		// 인증객체에서 아이디 가져오기
		AccountVO test1 = accountWrapper.getRealUser();
		String comId = test1.getAccId();

		// 계정객체에 들어있는 멤버코드를 추출하기 위함
		AccountVO accVO = aSerice.selectAccount(comId);
		String accRole = accVO.getMemCode();

		// 갖고 있는 룸의 종류를 조회한다.

		ProdVO category = pService.sliceCategory(prodNum);

		// cInfoNum 가져오기
		CompanyInfoVO companyInfo = pService.SelectCompanyInfo(comId);

		HotelRoomVO hotelRoomVO = hService.hotelRoomDetail(prodNum);
		List<ProdImageVO> prodImageList = hService.retrieveHotelImage(prodNum);

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

		// 지역코드 가져오기
		CompanyMemberVO memberVO = cmService.SelectCompanyMember(comId);
		String str = memberVO.getComAddr();
		String areaName = str.substring(0, 2);
		AreaVO area = pService.selectAreaCode(areaName);
		String areaCode = area.getAreaCode();

		List<CategoryVO> categoryList = pService.CategoryList(catuCode);

		model.addAttribute("prodImgName", prodImgName);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("category", category);
		model.addAttribute("companyInfo", companyInfo);
		model.addAttribute("hotelRoomVO", hotelRoomVO);

		return "myPage/member/company/product/hotelUpdate";
	}

	// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<상품수정>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	@PostMapping
	public String updateHote(Model model, @ModelAttribute("hotelRoomVO") HotelRoomVO hotelRoomVO,
			@RequestPart(name = "multipartImage") List<MultipartFile> multipartImage, @ModelAttribute ProdVO prodVO,
			@ModelAttribute AreaVO areaVO, @RequestParam(name = "what", required = true) int prodNum,
			HttpServletRequest request) throws IOException {

		int romNum = prodNum;
		// 이미지의 갯수를 구해온다.
		int rowcnt = pService.SearchProdImge(prodNum);
		// 상품 이미지 정보가 담긴 prodImageVO가 담긴 리스트를 반환하는 메서드
		List<ProdImageVO> prodImage = pService.retrieveProdImage(prodNum);

		save = new File(request.getSession().getServletContext().getRealPath(imageFolderURL));
		// 새로운 실제 이미지의 수만큼 반복
		for (int i = 0; i < multipartImage.size(); i++) {
			ProdImageVO prodImageTemp = new ProdImageVO(multipartImage.get(i));
			String orgImgName = prodImage.get(i).getPImgName();
			String newImgName = prodImageTemp.getPImgName();

			if (multipartImage.get(i) == null) {

			} else {
				save = new File(request.getSession().getServletContext().getRealPath(imageFolderURL));
				// 파일 삭제를 위한 경로 설정
				getFileName = new File(
						request.getSession().getServletContext().getRealPath(imageFolderURL) + "/" + orgImgName);

				if (!orgImgName.equals(newImgName)) {
					int imgDeleteNum = pService.deletePrImg(orgImgName);
					getFileName.delete();

					if (imgDeleteNum > 0) {
						int imgInsertNum = pService.changeInsertProdImages(prodImageTemp);
						if (imgInsertNum > 0) {
							prodImageTemp.saveTo(save);
						}

					}
				}
			}

		}

		ProdVO selectProd = pService.selectProdvo(prodNum);
		selectProd.setProdNam(prodVO.getProdNam());
		selectProd.setProdQty(prodVO.getProdQty());
		selectProd.setProdCode(prodVO.getProdCode());

		int prodUpdateNum = pService.hoteMainlUpdate(selectProd);
		hotelRoomVO.setRomNum(romNum);
		int hotelUpdateNum = hService.hotelOptionlUpdate(hotelRoomVO);

		List<ProdImageVO> prodImageList = hService.retrieveHotelImage(prodNum);
		String majorImage = "";
		for (int i = 0; i <= 0; i++) {
			majorImage = prodImageList.get(i).getPImgName();
		}
		List<String> prodImgName = new ArrayList<String>();

		for (ProdImageVO vo : prodImageList) {
			prodImgName.add(vo.getPImgName());
		}

		model.addAttribute("prodNum", prodNum);
		model.addAttribute("majorImage", majorImage);
		model.addAttribute("prodImgName", prodImgName);
		model.addAttribute("selectProd", selectProd);
		model.addAttribute("hotelRoomVO", hotelRoomVO);

		return "myPage/member/company/product/hotelDetailView";
	}

}
