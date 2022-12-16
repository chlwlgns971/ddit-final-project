package kr.or.ddit.account.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.AccountVO;

@Mapper
public interface AccountLoginDAO {
	
	public AccountVO accLogin(AccountVO vo) throws Exception;
}
