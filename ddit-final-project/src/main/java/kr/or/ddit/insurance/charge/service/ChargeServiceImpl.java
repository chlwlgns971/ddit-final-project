package kr.or.ddit.insurance.charge.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.insurance.charge.dao.ChargeDAO;
import kr.or.ddit.vo.ChargeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ChargeServiceImpl implements ChargeService{
	
	
	@Inject
	private ChargeDAO chargeDao;
	
	
	@Transactional
	@Override
	public ServiceResult createCharge(ChargeVO charge) {
		log.info("dao:{}",chargeDao);
		
		return chargeDao.insertCharge(charge) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}


	@Override
	public ChargeVO SelectCharge(String charCode) {
		ChargeVO chargeVO =  chargeDao.SelectCharge(charCode);
		return chargeVO;
	}
	
}
