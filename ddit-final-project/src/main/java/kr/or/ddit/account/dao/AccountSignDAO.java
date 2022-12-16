package kr.or.ddit.account.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.AccountSignVO;

@Mapper
public interface AccountSignDAO {


	/**
	 * 일반회원 가입
	 * @param accountReg
	 */
	public void accountReg(AccountSignVO account );

	/**
	 * 사업자회원 가입
	 * @param account
	 */
	public void accountBisReg(AccountSignVO account);

	/**
	 * 아이디 중복검사
	 * @param accountId
	 * @return
	 */
	public int idCheck(String accId);

	/**
	 * 아이디 찾기
	 * @param phone
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
	 * 비밀번호 찾기
	 * @param vo
	 * @throws Exception
	 */
	public void findPw(AccountSignVO vo);
}
