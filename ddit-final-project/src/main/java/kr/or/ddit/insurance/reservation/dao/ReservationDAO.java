package kr.or.ddit.insurance.reservation.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ReservationVO;

@Mapper
public interface ReservationDAO {
	
	public int insertReservation(ReservationVO reservation);
}
