package kr.or.ddit.member.personal.service;

import kr.or.ddit.vo.ChargeVO;

public interface PayHistoryService {
	public ChargeVO searchPayHistory(String charCode);
}
