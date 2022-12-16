package kr.or.ddit.insurance.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.insurance.dao.InsuranceDAO;
import kr.or.ddit.vo.InsuranceVO;

@Service
public class InsuranceServiceImpl implements InsuranceService{

	@Inject
	private InsuranceDAO dao;

	@Transactional
	@Override
	public ServiceResult createInsurance(InsuranceVO insurance) {
		// TODO Auto-generated method stub
		return dao.insertInsurance(insurance) >0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	
	@Override
	public int retrieveMaxInsurance() {
		String smax = Integer.toString(dao.selectMaxInsurance());
		int max;

		if("".equals(smax) || smax == null) {
			smax ="0";
		}

		max = Integer.valueOf(smax);
		
		return max;
	}

}
