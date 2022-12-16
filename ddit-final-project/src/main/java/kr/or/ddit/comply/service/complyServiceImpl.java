package kr.or.ddit.comply.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.comply.dao.ComplyDAO;
import kr.or.ddit.member.personal.dao.ProfileImageDAO;
import kr.or.ddit.vo.ComplyVO;
import kr.or.ddit.vo.PersonalMemberVO;
import kr.or.ddit.vo.ProfileImageVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class complyServiceImpl implements complyService {
	private final ComplyDAO complyDAO;
	private final ProfileImageDAO profileImageDAO;
	@Override
	public List<ComplyVO> selectComplyViewList(String memId) {
		List<ComplyVO> complyVO=complyDAO.selectComplyViewList(memId);
		return complyVO;
	}
	
	@Override
	public List<ComplyVO> selectPostComplyViewList(ComplyVO complyVO) {
		List<ComplyVO> complyList=complyDAO.selectPostComplyViewList(complyVO);
		return complyList;
	}
	@Override
	public PersonalMemberVO ComplyDetailView(String memId) {
		PersonalMemberVO personalmemberVO=complyDAO.ComplyDetailView(memId);
		if(personalmemberVO==null)
			throw new RuntimeException(String.format("%s 동행자가 없습니다.", memId));
		return personalmemberVO;
	}

	@Override
	public ProfileImageVO complyProfileImage(String complyId) {
		ProfileImageVO profileImageVO=profileImageDAO.retrieveImgInfo(complyId);
		return profileImageVO;
	}

	@Override
	public int updateUserDegree(PersonalMemberVO personalMemberVO) {
		int degree=complyDAO.updateUserDegree(personalMemberVO);
		return degree;
	}

	@Override
	public int updateDegreeRecord(ComplyVO complyVO) {
		int degreeCheck=complyDAO.updateDegreeRecord(complyVO);
		return degreeCheck;
	}

	@Override
	public String findComplyCheck(ComplyVO complyVO) {
		String complyCheck=complyDAO.findComplyCheck(complyVO);
		return complyCheck;
	}
	

}
