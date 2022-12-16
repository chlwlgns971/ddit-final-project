package kr.or.ddit.member.personal.dao;

import org.apache.ibatis.annotations.Mapper;


import kr.or.ddit.vo.PersonalMemberVO;
import kr.or.ddit.vo.ProfileImageVO;

@Mapper
public interface PersonalMemberDAO {
	/**
	 * 일반회원 개인정보 보기
	 * @param memId
	 * @return  PersonalMemberVO
	 */
	public PersonalMemberVO SelectPersonalMemberView(String memId);
	/**
	 * 일반회원 개인정보 수정하기
	 * @param PMember
	 * @return 수정 성공시 1 반환,실패시 0 반환
	 */
	public int updatePersonalMember(PersonalMemberVO PMemberVO);
	/**
	 * 랜덤문자 파일명으로 이미지명 찾기
	 * @param profileImageVO
	 * @return
	 */
	public String searchImgOname(String profileImageVO);
	
}
