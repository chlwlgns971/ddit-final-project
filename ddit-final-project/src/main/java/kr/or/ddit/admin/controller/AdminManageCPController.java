package kr.or.ddit.admin.controller;

import java.security.Principal;
import java.util.List;

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

import kr.or.ddit.admin.service.AdminManageCPService;
import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.CouponVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage/admin")
public class AdminManageCPController {
	@Inject
	private AdminManageCPService service;
	
	@RequestMapping("/manageCoupon")
	public String manageCoupon(
		@ModelAttribute("simpleCondition") SearchVO simpleCondition
		, @RequestParam(name="page", required=false, defaultValue="1") int currentPage
		,Model model
	) {
		// 페이징 처리를 위한 객체 생성 
		PagingVO<CouponVO> pagingVO = new PagingVO<>(10,5);
		// 현재 페이지 설정
		pagingVO.setCurrentPage(currentPage);
		// 검색조건 설정
		pagingVO.setSimpleCondition(simpleCondition);
		// 검색조건에 해당하는 레코드 수 반환
		int totalRecord = service.retrieveCouponCount(pagingVO);
		// 레코드 수 설정
		pagingVO.setTotalRecord(totalRecord);
		// 페이지에 해당하는 객체들이 담긴 리스트를 반환
		List<CouponVO> dataList = service.getCouponList(pagingVO);
		pagingVO.setDataList(dataList);
		
		
		//쿠폰 종류에 해당하는 카테고리
		List<CategoryVO> cpList = service.getCPCat();
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("cpList", cpList);
		log.info("pagingVO.getDataList().size(): {}",pagingVO.getDataList().size());
		log.info("category size: {}",cpList.size());
		
		return "adminPage/manageCoupon";
	}
	@ResponseBody
	@PostMapping(value="/couponDetail", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public CouponVO detailCoupon(
		@RequestParam("couNum") int couNum
	) {
		CouponVO vo = service.getCouponDetail(couNum);
		
		return vo;
	}
	
	// 쿠폰 일자, 이름 변경 처리
	@PostMapping("/couponUpdate")
	public String couponUpdate(
		@ModelAttribute("coupon") CouponVO coupon
		, Model model
		, RedirectAttributes ra
	) {
		// 가져온 값 로그 
		log.info("coupon.getCouNum(): {}",coupon.getCouNum());
		log.info(coupon.getCouSdate());
		log.info(coupon.getCouEdate());
		log.info(coupon.getCouNam());
		
		int rowCnt = service.setCoupon(coupon);
		String message = "";
		String viewName ="";
		
		if(rowCnt==1) {
			message = "쿠폰 내용을 변경했습니다.";
			viewName = "redirect:/mypage/admin/manageCoupon";
		}else {
			message = "쿠폰 내용 변경을 실패했습니다.";
			viewName = "redirect:/mypage/admin/manageCoupon";
		}
		ra.addFlashAttribute("message", message);
		
		return viewName;
	}
	// 금지된 메서드임 삭제하면 안된다 쿠폰 번호를 파라미터로 받아 해당 쿠폰을 삭제하는 메서드
//	@PostMapping("/couponDelete")
//	public String deleteCoupon(
//		@RequestParam("couNum") int couNum
//		,RedirectAttributes ra
//	) {
//		log.info("AdminManageCPM.deleteCoupon couNum: {}", couNum);
//		String message = "";
//		String viewName="";
//		
//		int rowCnt=service.deleteCoupon(couNum);
//		
//		log.info("rowCnt: {}", rowCnt);
//		
//		if(rowCnt==1) {
//			message = "쿠폰 내용 삭제를 성공했습니다.";
//		}else {
//			message = "쿠폰 내용 삭제를 실패했습니다.";
//		}
//		viewName = "redirect:/mypage/admin/manageCoupon";
//		ra.addFlashAttribute("message", message);
//		return viewName;
//	}
	@PostMapping("/couponInsert")
	public String insertCoupon(
		@ModelAttribute(name="coupon") CouponVO coupon
		, RedirectAttributes ra
		, Principal prin
	) {
		String viewName="";
		String message = "";
		coupon.setAccId(prin.getName());
		
		log.info("insert CouponVO: {}",coupon.toString());
		int rowCnt = service.insertCoupon(coupon);
		
		
		if(rowCnt==1) {
			message = "쿠폰을 성공적으로 등록했습니다.";
		}else {
			message = "쿠폰 등록을 실패했습니다.";
		}
		viewName = "redirect:/mypage/admin/manageCoupon";
		ra.addFlashAttribute("message", message);
		
		return viewName;
	}
	
	
}
