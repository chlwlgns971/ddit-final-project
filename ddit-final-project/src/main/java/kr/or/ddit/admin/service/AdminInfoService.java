package kr.or.ddit.admin.service;

import java.util.HashMap;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.AccountVO;


public interface AdminInfoService {
	
	// 해당 유저의 정보를 반환하는 메서드
	public HashMap<String, Object> getUserInfo(String userId);

	// 해당 유저의 Password를 반환하는 메서드
	public String getUserPW(String userId);
	
	// 해당 유저의 pw를 변경하는 메서드
	public int setNewPassword(AccountVO accountEdit);
	
	// 해당 유저의 소개글을 변경하는 메서드
	public int setNewIntro(AccountVO accountEdit);
	
	
	// 해당 관리자 계정의 정보를 수정하는 메서드
	public ServiceResult updateAdminInfo(AccountVO account, String realFilePath);
	
}
