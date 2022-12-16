package kr.or.ddit.account.service;

import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.vo.AccountSignVO;

public interface AccountSignupService {

	
	/**
	 * 일반회원 가입
	 * @param account
	 * @return
	 * @throws Exception
	 */
	public void accountReg(AccountSignVO account) throws Exception;
	
	/**
	 * 사업자회원 가입
	 * @param account
	 * @throws Exception
	 */
	public void accountBisReg(AccountSignVO account) throws Exception;

	/**
	 * 아이디 중복검사
	 * @param accId
	 * @return
	 * @throws Exception
	 */
	public int idCheck(String accId);

	
	/**
	 * 아이디 찾기
	 * @param phoneNum
	 * @return
	 */
	public String find_id(String phoneNum);

	/**
	 * Reg Check Phone Num
	 * @param phoneNum
	 * @return
	 */
	public String accountRegPhone(String phoneNum);
	
	
	/**
	 * 이메일 발송
	 * @param vo
	 * @param div
	 * @throws Exception
	 */
	public void sendEmail(AccountSignVO vo, String div) throws Exception;

	/**
	 * 비밀번호 찾기
	 * @param resp
	 * @param vo
	 * @throws Exception
	 */
	public void findPw(HttpServletResponse resp, AccountSignVO vo) throws Exception;
	
	
}