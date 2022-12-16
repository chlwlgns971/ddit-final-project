package kr.or.ddit.calender.service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.CalenderVO;

public interface CalenderService {
	/**
	 * 여행일정 생성 로직
	 * @param calender 여행일정 정보가 담긴 VO객체
	 * @param accId 일정을 생성한 아이디
	 * @return OK : 성공, FAIL : 실패
	 */
	public ServiceResult createCalender(String calSdate, String calEdate, String areaCode, String accId);
	
	/**
	 * 여행일정 삭제 로직
	 * @param calNum : 캘린더 번호
	 * @param accId : 회원아이디
	 * @return OK : 성공, FAIL : 실패
	 */
	public ServiceResult deleteCalender(int calNum, String accId);
}
