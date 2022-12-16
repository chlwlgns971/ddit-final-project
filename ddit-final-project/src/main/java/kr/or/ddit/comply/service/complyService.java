package kr.or.ddit.comply.service;

import java.util.List;

import kr.or.ddit.vo.ComplyVO;
import kr.or.ddit.vo.PersonalMemberVO;
import kr.or.ddit.vo.ProfileImageVO;


public interface complyService {
	public List<ComplyVO> selectComplyViewList(String complyId);
	
	public List<ComplyVO> selectPostComplyViewList(ComplyVO complyVO);
	
	public PersonalMemberVO ComplyDetailView(String memId);
	
	public ProfileImageVO complyProfileImage(String complyId);
	
	public int updateUserDegree(PersonalMemberVO personalMemberVO);
	
	public int updateDegreeRecord(ComplyVO complyVO);
	
	public String findComplyCheck(ComplyVO complyVO);
}
