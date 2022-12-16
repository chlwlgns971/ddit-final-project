package kr.or.ddit.calender.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.calender.dao.CalenderDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.CalenderVO;
import kr.or.ddit.vo.TravelerVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CalenderServiceImpl implements CalenderService{
	@Inject
	private CalenderDAO dao;

	@Override
	@Transactional
	public ServiceResult createCalender(String calSdate, String calEdate, String areaCode, String accId) {
		ServiceResult result = null;
		CalenderVO calender = new CalenderVO();
		calender.setAreaCode(areaCode);
		calender.setCalSdate(calSdate);
		calender.setCalEdate(calEdate);
		int cnt = dao.createCalender(calender);
		log.info("CalenderServiceImpl CalenderVO : {}",calender);
		if(cnt > 0) { // 일정등록에 성공
			//생성한 일정정보를 회원아이디와 연결
			TravelerVO travel = new TravelerVO();
			travel.setCalNum(calender.getCalNum());
			travel.setAccId(accId);
			result = dao.createTravelInfo(travel) > 0 ? ServiceResult.OK : ServiceResult.FAIL; 
		}
		else result = ServiceResult.FAIL;
		return result;
	}

	@Override
	public ServiceResult deleteCalender(int calNum, String accId) {
		ServiceResult result = null;
		Map<String, Object> map = new HashMap<>();
		map.put("calNum", calNum);
		map.put("accId", accId);
		int cnt = dao.deleteTravelInfo(map);
		cnt = cnt + dao.deleteCalender(calNum);
		if(cnt > 0) result = ServiceResult.OK;
		else result = ServiceResult.FAIL;
		return result;
	}

}
