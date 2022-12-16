package kr.or.ddit.insurance.insinfo.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.insurance.insinfo.dao.InsInfoDAO;
import kr.or.ddit.vo.InsInfoVO;

@Service
public class InsInfoServiceImpl implements InsInfoService {
	@Inject
	private InsInfoDAO dao;

	@Override
	public ServiceResult createInsInfo(InsInfoVO insInfo) {
		return dao.insertInsInfo(insInfo) >0 ? ServiceResult.OK : ServiceResult.FAIL;
	}
	
}
