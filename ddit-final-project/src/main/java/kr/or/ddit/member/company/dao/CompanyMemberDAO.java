package kr.or.ddit.member.company.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.CompanyMemberVO;

@Mapper
public interface CompanyMemberDAO {
	/**
	 * 업체회원 정보 보여주기
	 * @param memId
	 * @return CompanyMemberVO
	 */
	public CompanyMemberVO SelectCompanyMember(String comId);
	/**
	 * 업체회원 정보 업데이트하기
	 * @param CompanyMemberVO
	 * @return int 
	 */
	public int updateCompanyMember(CompanyMemberVO companyMemberVO);
	
	public List<CategoryVO> categoryList();
}
