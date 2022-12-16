package kr.or.ddit.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.admin.service.AdminManageMemService;
import kr.or.ddit.vo.AccountVO;
import kr.or.ddit.vo.AccountVOWrapper;
import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.CompanyMemberVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.PersonalMemberVO;
import kr.or.ddit.vo.ReportVO;
import kr.or.ddit.vo.SanctionVO;
import kr.or.ddit.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage/admin")
public class AdminPageManageMemController {
	@Inject
	private AdminManageMemService service;
	
	// 일반 회원 목록 출력
	@RequestMapping("/manageMem")
	public String manageMem(
			@ModelAttribute("simpleCondition") SearchVO simpleCondition
			, @RequestParam(name="page", required=false, defaultValue="1") int currentPage
			,Model model
	) {
		PagingVO<PersonalMemberVO> pagingVO = new PagingVO<>(10,5);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(simpleCondition);
		int totalRecord = service.retrievePMCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		List<PersonalMemberVO> pMemList = service.personalMemberList(pagingVO);
		pagingVO.setDataList(pMemList);
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("targetItem", "personalMem");
		
		
		return "adminPage/manageMember";
	}
	
	// 업체 회원 목록 출력
	@RequestMapping("/manageComp")
	public String manageComp(
			@ModelAttribute("simpleCondition") SearchVO simpleCondition
			, @RequestParam(name="page", required=false, defaultValue="1") int currentPage
			,Model model
			) {
		PagingVO<CompanyMemberVO> pagingVO = new PagingVO<>(10,5);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(simpleCondition);
		int totalRecord = service.retrieveCMCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		List<CompanyMemberVO> pMemList = service.companyMemberList(pagingVO);
		pagingVO.setDataList(pMemList);
		log.info("dataList size: {})", pagingVO.getDataList().size() );
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("targetItem", "companyMem");
		
		
		return "adminPage/manageComp";
	}
	
	//신고 목록 출력
	@RequestMapping("/manageReport")
	public String manageReport(
			@ModelAttribute("simpleCondition") SearchVO simpleCondition
			, @RequestParam(name="page", required=false, defaultValue="1") int currentPage
			,Model model
			) {
		// 페이징 처리를 위한 객체 생성
		PagingVO<ReportVO> pagingVO = new PagingVO<>(10,5);
		// 현재 페이지 설정
		pagingVO.setCurrentPage(currentPage);
		// 검색조건 설정
		pagingVO.setSimpleCondition(simpleCondition);
		// 검색조건에 해당하는 레코드 수 반환
		int totalRecord = service.retrieveReportCount(pagingVO);
		// 레코드 수 설정
		pagingVO.setTotalRecord(totalRecord);
		// 페이지에 해당하는 객체들이 담긴 리스트를 반환
		List<ReportVO> reportList = service.reportList(pagingVO);
		// 리스트를 데이터로 세팅
		pagingVO.setDataList(reportList);
		
		model.addAttribute("pagingVO", pagingVO);
		ReportVO vo = new ReportVO();
		model.addAttribute("reportVO", vo);
		model.addAttribute("targetItem", "reportList");
		
		
		return "adminPage/manageReport";
	}
	
	
	
	
	
	//신고 상세보기 및 신고 처리를 위한 분류 코드, 기존 처리 내역 있는지 여부 불러오기
	@ResponseBody
	@PostMapping(value="/reportDetail", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String, Object>> reportDetail(
			@RequestParam("repNum") String repNum
			, Model model
			) {
		//모든 정보를 하나로 묶을 map 객체
		Map<String, Object> resultMap = new HashMap<>();
		
		// 기존 신고 내역 처리 기록이 있는지 확인
		int sancRow = service.getSancRow(repNum);
		String message ="";
		// 이미 신고처리가 된 경우
		if(sancRow>0) {
			message="이미 처리된 내용입니다.";
		}
		ReportVO report = service.getReport(repNum);
		log.info("report {}: {}", "repId",report.getRepId());
		log.info("report {}: {}", "memId",report.getMemId());
		List<CategoryVO> categoryVO = service.getSancCategory();
		//메시지가 존재한다면 이미 처리된 건이 있는 것이므로 alert를 띄우고 submit button을 disabled 한다.
		resultMap.put("message", message);
		resultMap.put("report", report);
		resultMap.put("category", categoryVO);
		return new ResponseEntity<>(resultMap, HttpStatus.OK);
	}
	
	//신고 처리 
	@PostMapping("/sancInsert")
	public String sancInsert(
			@AuthenticationPrincipal AccountVOWrapper accountWrapper
			,  @AuthenticationPrincipal(expression="realUser") AccountVO account
			, @ModelAttribute("sancForm") SanctionVO sancInfo
			, Model model
			, RedirectAttributes ra
			) {
		String sancCode = sancInfo.getSancCode();
		log.info(""+sancCode);
		String sancEdate = sancCode.substring(8);
		log.info(sancEdate);
		sancInfo.setSancEdate(sancEdate);
		sancInfo.setAdminId(account.getAccId());
		log.info(""+sancInfo.getRepNum());
		
		
		log.info("sancInfo.getSancCode(): "+sancInfo.getSancCode());
		log.info("sancInfo.getSancResn(): "+sancInfo.getSancResn());
		log.info("sancInfo.getSancEdate(): "+sancInfo.getSancEdate());
		log.info("sancInfo.getRepNum(): "+sancInfo.getRepNum());
		log.info("sancInfo.getAdminId(): "+sancInfo.getAdminId());
		
		int rowCnt = service.insertSanc(sancInfo);
		
		//redirect 방식으로 이동 시 message를 띄우기 위해 사용
		ra.addFlashAttribute("rowCnt", rowCnt);
		return "redirect:/mypage/admin/manageReport";
	}
	
}
