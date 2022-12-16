package kr.or.ddit.insurance.reservation.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.insurance.reservation.dao.ReservationDAO;
import kr.or.ddit.vo.ReservationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Inject
	private ReservationDAO resDao;
	
	@Transactional
	@Override
	public ServiceResult createReservation(ReservationVO reservation) {
		log.info("reDao:{}",resDao);
		return resDao.insertReservation(reservation) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

}
