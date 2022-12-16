package kr.or.ddit.member.company.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.member.company.dao.CompanyMemberDAO;
import kr.or.ddit.member.personal.dao.ProfileImageDAO;
import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.CompanyMemberVO;
import kr.or.ddit.vo.ProfileImageVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CompanyMemberServiceImpl implements CompanyMemberService {
	private final CompanyMemberDAO companyMemberDAO;
	private final ProfileImageDAO profileImageDAO;
	
	@Override
	public CompanyMemberVO SelectCompanyMember(String comId) {
		CompanyMemberVO companyMemberVO=companyMemberDAO.SelectCompanyMember(comId);
		return companyMemberVO;
	}

	@Override
	public int updateCompanyMember(CompanyMemberVO companyMemberVO) {
		int rowcnt=companyMemberDAO.updateCompanyMember(companyMemberVO);
		return rowcnt;
	}
	@Override
	public int searchImage(String comId) {
		return profileImageDAO.countImg(comId);
	}
	
	@Override
	public ProfileImageVO retrieveImgInfo(String comId) {
		return profileImageDAO.retrieveImgInfo(comId);
	}

	@Override
	public List<CategoryVO> categoryList() {
		List<CategoryVO> categoryList=companyMemberDAO.categoryList();
		return categoryList;
	}

}
