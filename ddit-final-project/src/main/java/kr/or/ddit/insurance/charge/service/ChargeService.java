package kr.or.ddit.insurance.charge.service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.ChargeVO;

public interface ChargeService {
	public ServiceResult createCharge(ChargeVO charge);
	public ChargeVO SelectCharge(String charCode);
}
