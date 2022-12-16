package kr.or.ddit.insurance.cusinfo.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.insurance.cusinfo.dao.CusInfoDAO;
import kr.or.ddit.vo.CusInfoVO;

@Service
public class CusInfoServiceImpl implements CusInfoService{
	
	@Inject
	private CusInfoDAO dao;
	
	@Override
	public ServiceResult createCusInfo(CusInfoVO cusInfo) {
		return dao.insertCusInfo(cusInfo) >0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

}
