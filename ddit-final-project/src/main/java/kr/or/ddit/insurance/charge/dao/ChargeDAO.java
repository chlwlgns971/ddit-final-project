package kr.or.ddit.insurance.charge.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ChargeVO;

@Mapper
public interface ChargeDAO {
	
	public int insertCharge(ChargeVO charge);
	
	public ChargeVO SelectCharge(String charCode);
}

