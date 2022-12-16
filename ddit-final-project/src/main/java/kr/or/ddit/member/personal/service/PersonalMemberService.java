package kr.or.ddit.member.personal.service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.AccountVO;
import kr.or.ddit.vo.PersonalMemberVO;
import kr.or.ddit.vo.ProfileImageVO;

public interface PersonalMemberService {
	public PersonalMemberVO retrievePersonalMember(String memId);
	public ServiceResult modifyPersonalMember(PersonalMemberVO memberVO);
	public String searchOname(String profileImageVO);
	public int searchImage(String accId);
	public ProfileImageVO retrieveImgInfo(String accId);
}
