package kr.or.ddit.account.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.AccountVO;
import kr.or.ddit.vo.ProfileImageVO;

@Mapper
public interface AccountDAO {
	/**
	 * Account정보등록
	 * @param account
	 * @return 입력 성공시 1, 실패시 0 반환
	 */
	public int insertAccount(AccountVO account);
	/**
	 * Account 객체의 전체값을 가져온다.
	 * @param accId
	 * @return
	 */
	public AccountVO selectAccount(String accId);
	/**
	 * 자기소개서 가져오기 위한 메소드
	 * @param accId
	 * @return 검색성공시 AccountVO 반환
	 */
	public AccountVO selectAccInfo(String accId);
	/**
	 * 자기소개란을 수정하기 위한 메소드
	 * @param accountVO
	 * @return
	 */
	public int updateAccInfo(AccountVO accountVO);
	/**
	 * 비밀번호 변경전 비교하기위한 메소드
	 * @param accId
	 * @return 검색성공시 AccountVO 반환
	 */
	public AccountVO searchAccountPswd(String accId);
	/**
	 * Account 비밀번호 수정
	 * @param accountVO
	 * @return 수정 성공시 1, 실패시 0 반환
	 */
	public int updatePswd(AccountVO accountVO);
	/**
	 * account계정의  accImg를 없데이트 하기위한 메소드
	 * @param accountVO
	 * @return
	 */
	public int updateAccountImageName(AccountVO accountVO);

}
