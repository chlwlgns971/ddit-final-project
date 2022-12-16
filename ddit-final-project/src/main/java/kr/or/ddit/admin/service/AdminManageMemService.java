package kr.or.ddit.admin.service;

import java.util.List;

import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.CompanyMemberVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.PersonalMemberVO;
import kr.or.ddit.vo.ReportVO;
import kr.or.ddit.vo.SanctionVO;


public interface AdminManageMemService {

	// 페이징 처리를 위해 탈퇴하지 않은 일반 회원의 전체 수를 구하는 메소드
	public int retrievePMCount(PagingVO<PersonalMemberVO> pagingVO);
	// 해당 페이지의 일반회원의 리스트를 불러오는 메소드
	public List<PersonalMemberVO> personalMemberList(PagingVO<PersonalMemberVO> pagingVO);
	
	// 페이징 처리를 위해 탈퇴하지 않은 업체 회원의 전체 수를 구하는 메소드
	public int retrieveCMCount(PagingVO<CompanyMemberVO> pagingVO);
	// 해당 페이지의 업체회원의 리스트를 불러오는 메소드
	public List<CompanyMemberVO> companyMemberList(PagingVO<CompanyMemberVO> pagingVO);

	// 페이징 처리를 위해 신고 기록의 전체 수를 구하는 메소드
	public int retrieveReportCount(PagingVO<ReportVO> pagingVO);
	// 해당 페이지에 해당하는 신고내역 리스트를 불러오는 메소드
	public List<ReportVO> reportList(PagingVO<ReportVO> pagingVO);
	// 신고 리스트 중 하나를 선택했을 때 해당 상세 내용을 가져오는 메서드
	public ReportVO getReport(String repNum);
	// 신고 처리를 위한 제재 항목을 불러오는 메소드
	public List<CategoryVO> getSancCategory();
	public int getSancRow(String repNum);
	// 신고 처리 기록 insert
	public int insertSanc(SanctionVO sancInfo);
}
