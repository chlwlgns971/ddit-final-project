package kr.or.ddit.account.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.AccountVO;

@Mapper
public interface SecurityLoginDAO {
	public AccountVO findByPk(@Param("username") String username);
}
