package kr.or.ddit.member.personal.service;

import org.springframework.stereotype.Service;
import javax.inject.Inject;

import kr.or.ddit.member.personal.dao.PayHistoryDAO;
import kr.or.ddit.vo.ChargeVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PayHistoryServiceImpl implements PayHistoryService {
	@Inject
	private PayHistoryDAO payHistoryDAO;
	
	@Override
	public ChargeVO searchPayHistory(String charCode) {
		System.out.println(charCode);
		ChargeVO charge=payHistoryDAO.searchPayHistory(charCode);
		System.out.println(charge);
		return charge;
	}

}
