package kr.or.ddit.admin.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.admin.service.AdminManageNoticeService;
import kr.or.ddit.vo.ArticleVO;
import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage/admin")
public class AdminManageNoticeController {
	
	@Inject
	public AdminManageNoticeService service;
	
	// 공지사항 리스트 띄우는 메서드
	@RequestMapping("/manageNotice")
	public String manageNotice(
			@ModelAttribute("simpleCondition") SearchVO simpleCondition
			, @RequestParam(name="artBCode",required=false, defaultValue="BC003") String artBCode
			, @RequestParam(name="page", required=false, defaultValue="1") int currentPage
			,Model model
	) {
		PagingVO<ArticleVO> pagingVO = new PagingVO<>(10,5);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(simpleCondition);
		Map<String, Object> detailMap = new HashMap();
		detailMap.put("artBCode", artBCode);
		pagingVO.setDetailMap(detailMap);
		int totalRecord = service.retrieveNoticeCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		List<ArticleVO> noticeList = service.noticeList(pagingVO);
		pagingVO.setDataList(noticeList);
		for(ArticleVO vo : pagingVO.getDataList()) {
			log.info(vo.getArtNum()+"/"+vo.getArtTitle()+"/"+vo.getArtDate());
		}
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("targetItem", "notice");
		
		return "adminPage/manageNotice";
	}
	
	// 공지사항 조회 메서드
	@RequestMapping("/noticeDetail")
	public String noticeDetail(
		@RequestParam(name="artNum") int artNum
		, Model model
	) {
		ArticleVO articleVO = service.getArticleDetail(artNum);
		
		model.addAttribute("articleVO", articleVO);
		
		return "adminPage/noticeDetail";
	}
	
	@ModelAttribute("article")
	public ArticleVO article() {
		log.info("@ModelAttribute 메소드 실행.");
		return new ArticleVO();
	}
	
	
	//공지사항&FAQ 등록 폼 메서드
	@PostMapping("/insertNFForm")
	public String inserFormtNotice(
		Model model
		, @RequestParam("artBCode") String artBCode
	) {
		log.info("AdminManageNotice.inserFormtNotice, method='get'");
		String catuCode="";
		if("BC003".equals(artBCode)) {
			catuCode="NC";
		}else if("BC005".equals(artBCode)) {
			catuCode="FAQ";
		}
		List<CategoryVO> catList = service.getNotiCat(catuCode);
		log.info(String.format("AdminManageNotice.inserFormtNotice.Category Size: %s",catList.size()));
		model.addAttribute("catList", catList);
		model.addAttribute("artBCode", artBCode);
		log.info(artBCode);
		return "adminPage/insertNotice";
	}
	
	
	// 공지사항 insert 메서드
	@PostMapping("/insertNF")
	public String insertNotice(
		@ModelAttribute("article") ArticleVO article
		, Principal principal
		, RedirectAttributes ra
	) {
		log.info("AdminManageNotice.insertNotice, method='post'");
		String id = principal.getName();
		article.setAccId(id);
		log.info(article.getArtTitle());
		log.info(article.getArtCCode());
		log.info(article.getArtCont());
		log.info(article.getArtBCode());
		
		int rowCnt = service.insertNotice(article);
		
		int artNum = article.getArtNum();
		log.info("artNum:{}",artNum);
		String message = "";
		String viewName="";
		String artBCode = article.getArtBCode();
		if(rowCnt==1) {
			message="등록에 성공했습니다.";
			if("BC003".equals(artBCode)) {
				viewName="redirect:/mypage/admin/manageNotice";
			}else if("BC005".equals(artBCode)) {
				viewName="redirect:/mypage/admin/manageFAQ";
			}
			ra.addAttribute("artNum", artNum);
			ra.addFlashAttribute("message", message);
			log.info(String.format("Insert NoticeNo: ", artNum));
		}else {
			message="문제가 발생했습니다. 다시 시도해주세요.";
			viewName="redirect:/mypage/admin/insertNotice";
			ra.addFlashAttribute("message", message);
			log.info(String.format("Insert Fail(Notice): %n",rowCnt));
			
		}
		
		return viewName;
	}
	
	
	// 공지사항 수정 폼 이동 메서드
	@PostMapping("/editNoticeForm")
	public String editNoticeForm(
		@RequestParam("artNum") int artNum
		, @RequestParam("artBCode") String artBCode
		, Model model
	) {
		log.info("artBCode: {}",artBCode);
		ArticleVO vo = service.getArticleDetail(artNum);
		model.addAttribute("articleVO",vo);
		String catuCode="";
		if("BC003".equals(artBCode)) {
			catuCode="NC";
		}else if("BC005".equals(artBCode)) {
			catuCode="FAQ";
		}
		log.info(artBCode);
		List<CategoryVO> catList = service.getNotiCat(catuCode);
		model.addAttribute("catList", catList);
		model.addAttribute("catuCode", catuCode);
		
		return "adminPage/editNotice";
	}
	// 공지사항 수정 메서드
	@PostMapping("/editNotice")
	public String editNotice(
		@ModelAttribute("article") ArticleVO article
		, Model model
		, RedirectAttributes ra
		, Principal principal
	) {
		String id = principal.getName();
		article.setAccId(id);
		
		log.info(article.getArtTitle());
		log.info(article.getArtCCode());
		log.info(article.getArtCont());
		log.info(article.getAccId());
		log.info(article.getArtBCode());
		log.info("",article.getArtNum());
		
		int rowCnt = service.updateNotice(article);
		
		int artNum = article.getArtNum();
		log.info("artNum:{}",artNum);
		String message = "";
		String viewName="";
		if(rowCnt==1) {
			message="성공적으로 수정되었습니다.";
			viewName="redirect:/mypage/admin/noticeDetail";
			ra.addAttribute("artNum", artNum);
			ra.addFlashAttribute("message", message);
			log.info(String.format("Insert NoticeNo: %n", artNum));
		}else {
			message="문제가 발생했습니다. 다시 시도해주세요.";
			viewName="redirect:/mypage/admin/insertNotice";
			ra.addFlashAttribute("message", message);
			log.info(String.format("Insert Fail(Notice): %n",rowCnt));
			
		}
		
		return viewName;
	}
	
	// 공지사항 삭제 메서드
	@RequestMapping("/delNotice")
	public String delNotice(
		@RequestParam("artNum")	int artNum
		, RedirectAttributes ra
	) {
		int rowCnt = service.delNotice(artNum);
		String message = "";
		String viewName="";
		if(rowCnt==1) {
			//정상처리후리스트로이동
			message=String.format("%d 번 공지사항이 성공적으로 삭제되었습니다.",artNum);
			viewName="redirect:/mypage/admin/manageNotice";
			ra.addFlashAttribute("message", message);
			log.info(String.format("Insert NoticeNo: %n", artNum));
		}else {
			message="공지사항 삭제 중 문제가 발생했습니다.";
			viewName="redirect:/mypage/admin/noticeDetail";
			ra.addFlashAttribute("artNum", artNum);
			ra.addFlashAttribute("message", message);
			log.info(String.format("Insert Fail(Notice): %n",rowCnt));
		}
		return viewName;
	}
	
	
	
	// 자주 묻는 질문 리스트 반환 메서드
	@RequestMapping("/manageFAQ")
	public String manageFAQ(
		@ModelAttribute("simpleCondition") SearchVO simpleCondition
		, @RequestParam(name="page", required=false, defaultValue="1") int currentPage
		,Model model
	) {
		PagingVO<ArticleVO> pagingVO = new PagingVO<>(10,5);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(simpleCondition);
		Map<String, Object> detailMap = new HashMap();
		detailMap.put("artBCode", "BC005");
		pagingVO.setDetailMap(detailMap);
		int totalRecord = service.retrieveNoticeCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		List<ArticleVO> noticeList = service.noticeList(pagingVO);
		pagingVO.setDataList(noticeList);
		for(ArticleVO vo : pagingVO.getDataList()) {
			log.info(vo.getArtNum()+"/"+vo.getArtTitle()+"/"+vo.getArtDate());
		}
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("targetItem", "manage");
		
		return "adminPage/manageFAQ";
	}
}
