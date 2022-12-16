package kr.or.ddit.insurance.cusinfo.service;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.CusInfoVO;

@Service
public interface CusInfoService {

	/**
	 * 고객정보 추가
	 * @param cusInfo
	 * @return
	 */
	public ServiceResult createCusInfo(CusInfoVO cusInfo);

}
