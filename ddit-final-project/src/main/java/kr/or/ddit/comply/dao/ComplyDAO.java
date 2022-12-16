package kr.or.ddit.comply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.ComplyVO;
import kr.or.ddit.vo.PersonalMemberVO;

@Mapper
public interface ComplyDAO {
	/**
	 * 동행 완료자의 목록을 볼 수 있는 리스트
	 * @param memId
	 * @return
	 */
	public List<ComplyVO> selectComplyViewList(String memId);
	/**
	 * 동행 예정자의 목록을 볼 수 있는 리스트
	 * @param complyVO
	 * @return
	 */
	public List<ComplyVO> selectPostComplyViewList(ComplyVO complyVO);
	/**
	 * 동행자의 자세한 정보를 볼 수 있는 메소드
	 * @param memId
	 * @return
	 */
	public PersonalMemberVO ComplyDetailView(String memId);
	/**
	 * 동행 회원에게 점수주기
	 * @param personalMemberVO
	 * @return
	 */
	public int updateUserDegree(PersonalMemberVO personalMemberVO);
	/**
	 * 동행자에 대해서 수정 내역이 있을경우 값을 변경해준다.
	 * @param complyVO
	 * @return
	 */
	public int updateDegreeRecord(ComplyVO complyVO);
	/**
	 * 과거 수정내역이 있는지 확인하는 메소드
	 * @param complyVO
	 * @return
	 */
	public String findComplyCheck(ComplyVO complyVO);

}
