package kr.or.ddit.insurance.insinfo.service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.InsInfoVO;

public interface InsInfoService {
	
	/**
	 * 보험상품상세 추가
	 * @param cusInfo
	 * @return
	 */
	public ServiceResult createInsInfo(InsInfoVO insInfo);


}
