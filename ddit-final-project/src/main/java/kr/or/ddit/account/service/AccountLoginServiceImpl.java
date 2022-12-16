package kr.or.ddit.account.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.account.dao.AccountLoginDAO;
import kr.or.ddit.vo.AccountVO;

@Service
public class AccountLoginServiceImpl implements AccountLoginService{
	
	@Inject	AccountLoginDAO dao;
	
	@Override
	public AccountVO accLogin(AccountVO vo) throws Exception{
		return dao.accLogin(vo);
	}
}
