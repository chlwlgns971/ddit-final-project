package kr.or.ddit.member.personal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ChargeVO;
import kr.or.ddit.vo.ReservationVO;

@Mapper
public interface PayHistoryDAO {
	public ChargeVO searchPayHistory(String charCode);
}
