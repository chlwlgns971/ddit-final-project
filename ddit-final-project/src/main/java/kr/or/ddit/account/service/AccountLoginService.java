package kr.or.ddit.account.service;

import kr.or.ddit.vo.AccountVO;

public interface AccountLoginService {
	
	public AccountVO accLogin(AccountVO vo) throws Exception;
	
}
