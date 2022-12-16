package kr.or.ddit.member.company.service;

import java.util.List;

import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.CompanyMemberVO;
import kr.or.ddit.vo.CompanyProductVO;
import kr.or.ddit.vo.ProfileImageVO;

public interface CompanyMemberService {
	public CompanyMemberVO SelectCompanyMember(String comId);
	public int updateCompanyMember(CompanyMemberVO companyMemberVO);
	public int searchImage(String comId);
	public ProfileImageVO retrieveImgInfo(String accId);
	public List<CategoryVO> categoryList();

}
