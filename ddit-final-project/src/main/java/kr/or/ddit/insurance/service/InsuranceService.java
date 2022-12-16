package kr.or.ddit.insurance.service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.InsuranceVO;

public interface InsuranceService {
	/**
	 * 보험상품 추가
	 * @param insurance
	 * @return
	 */
	public ServiceResult createInsurance(InsuranceVO insurance);
	
	
	/**
	 * max를 찾아서 기본키로 사용
	 * @return
	 */
	public int retrieveMaxInsurance();
	
}
