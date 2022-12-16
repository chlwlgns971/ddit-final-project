package kr.or.ddit.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.admin.dao.AdminManageMemDAO;
import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.CompanyMemberVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.PersonalMemberVO;
import kr.or.ddit.vo.ReportVO;
import kr.or.ddit.vo.SanctionVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminManageMemServiceImpl implements AdminManageMemService {
	//dao 연결
	@Inject
	private AdminManageMemDAO dao;
	
	// 페이징 처리를 위해 탈퇴하지 않은 일반 회원의 전체 수를 구하는 메소드
	@Override
	public List<PersonalMemberVO> personalMemberList(PagingVO pagingVO) {
		return dao.personalMemberList(pagingVO);
	}
	
	// 해당 페이지의 일반회원의 리스트를 불러오는 메소드
	@Override
	public List<CompanyMemberVO> companyMemberList(PagingVO pagingVO) {
		return dao.companyMemberList(pagingVO);
	}
	
	// 페이징 처리를 위해 탈퇴하지 않은 업체 회원의 전체 수를 구하는 메소드
	@Override
	public int retrievePMCount(PagingVO pagingVO) {
		return dao.retrievePMCount(pagingVO);
	}
	
	// 해당 페이지의 업체회원의 리스트를 불러오는 메소드
	@Override
	public int retrieveCMCount(PagingVO<CompanyMemberVO> pagingVO) {
		return dao.retrieveCMCount(pagingVO);
	}
	
	// 페이징 처리를 위해 신고 기록의 전체 수를 구하는 메소드
	@Override
	public int retrieveReportCount(PagingVO<ReportVO> pagingVO) {
		// TODO Auto-generated method stub
		return dao.retrieveReportCount(pagingVO);
	}
	
	// 해당 페이지에 해당하는 신고내역 리스트를 불러오는 메소드
	@Override
	public List<ReportVO> reportList(PagingVO<ReportVO> pagingVO) {
		// TODO Auto-generated method stub
		return dao.reportList(pagingVO);
	}
	
	// 신고 리스트 중 하나를 선택했을 때 해당 상세 내용을 가져오는 메서드
	@Override
	public ReportVO getReport(String repNum) {
		return dao.getReport(repNum);
	}
	
	// 신고 처리를 위한 제재 항목을 불러오는 메소드
	@Override
	public List<CategoryVO> getSancCategory() {
		return dao.getSancCategory();
	}
	// 신고 처리 기록을 불러오는 메소드
	@Override
	public int getSancRow(String repNum) {
		return dao.getSancRow(repNum);
	}
	// 신고 처리 내용을 insert 하는 메서드
	@Override
	public int insertSanc(SanctionVO sancInfo) {
//		String sancCode = sancInfo.getSancCode();
//		log.info(""+sancCode);
//		String sancEdate = sancCode.substring(8);
//		log.info(sancEdate);
//		sancInfo.setSancEdate(sancEdate);
		return dao.insertSanc(sancInfo);
	}


}
