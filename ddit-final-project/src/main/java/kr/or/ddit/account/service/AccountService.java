package kr.or.ddit.account.service;

import kr.or.ddit.vo.AccountVO;
import kr.or.ddit.vo.ProfileImageVO;

public interface AccountService {
	/**
	 * 기존에 패스워드 값과 비교하기 위한 메소드
	 * @param accId
	 * @return
	 */
	public AccountVO comparePswd(String accId);
	/**
	 * 비밀번호를 수정하기 위한 메소드
	 * @param accountVO
	 * @return
	 */
	public int AccoutUpdatePswd(AccountVO accountVO);
	/**
	 * account 자기소개를 조회하는 메소드
	 * @param accId
	 * @return
	 */
	public AccountVO selectAccount(String accId);
	/**
	 * account자기소개 수정을 한다.
	 * @param acocuntVO
	 * @return
	 */
	public int updateAccInfo(AccountVO accountVO);
	/**
	 * 이미지 등록시 Account객체에 등록되는 이미지 이름
	 * @param accountVO
	 * @return
	 */
	public int updateAccountImageName(AccountVO accountVO);
	/**
	 * 
	 * @param profileImage
	 * @return
	 */
	public int insertImgInfo(ProfileImageVO profileImage);
	public ProfileImageVO retrieveImgInfo(String accId);
	public int countProfileImage(String accId);
	public int deleteProfilImage(String accId);
	public AccountVO selectAccInfo(String accId);
	
}
