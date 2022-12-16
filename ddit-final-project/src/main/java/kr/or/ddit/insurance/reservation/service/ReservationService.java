package kr.or.ddit.insurance.reservation.service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.ReservationVO;

public interface ReservationService {
	
	public ServiceResult createReservation(ReservationVO reservation);
}
