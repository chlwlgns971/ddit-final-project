package kr.or.ddit.member.personal.service;

import java.io.File;
import java.io.IOException;
import java.util.Properties;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.member.personal.dao.PersonalMemberDAO;
import kr.or.ddit.member.personal.dao.ProfileImageDAO;
import kr.or.ddit.vo.AccountVO;
import kr.or.ddit.vo.PersonalMemberVO;
import kr.or.ddit.vo.ProfileImageVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PersonalMemberServiceImpl implements PersonalMemberService {
	private final PersonalMemberDAO personalMemberDAO;
	private final ProfileImageDAO profileImageDAO; 
	
	
	
	@Override
	public PersonalMemberVO retrievePersonalMember(String memId) {
		PersonalMemberVO personalMem = personalMemberDAO.SelectPersonalMemberView(memId);
		return personalMem;
	}


	@Override
	public ServiceResult modifyPersonalMember(PersonalMemberVO memberVO) {
		int rowcnt = personalMemberDAO.updatePersonalMember(memberVO);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}


	@Override
	public String searchOname(String profileImageVO) {
		return personalMemberDAO.searchImgOname(profileImageVO);
	}


	@Override
	public int searchImage(String accId) {
		return profileImageDAO.countImg(accId);
	}


	@Override
	public ProfileImageVO retrieveImgInfo(String accId) {
		return profileImageDAO.retrieveImgInfo(accId);
	}
	
	

	

	
}
