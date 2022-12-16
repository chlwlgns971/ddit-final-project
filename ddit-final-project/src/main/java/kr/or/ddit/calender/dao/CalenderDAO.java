package kr.or.ddit.calender.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.AttractionVO;
import kr.or.ddit.vo.CalenderVO;
import kr.or.ddit.vo.TravNoteVO;
import kr.or.ddit.vo.TravelerVO;

@Mapper
public interface CalenderDAO {
	/**
	 * 여행 일정 생성
	 * @param calender 여행일정 정보가 담긴 VO객체
	 * @return 성공 : 1, 실패 : 0
	 */
	public int createCalender(CalenderVO calender);
	
	/**
	 * 생성한 여행일정 정보를 아이디랑 연결
	 * @param calNum 여행일정 번호
	 * @param accId 회원 아이디
	 * @return 성공 : 1, 실패 : 0
	 */
	public int createTravelInfo(TravelerVO travel);
	
	/**
	 * 
	 * @param accId
	 * @return
	 */
	public List<CalenderVO> calenderList(String accId);
	
	/**
	 * 캘린더 정보 조회
	 * @param calNum : 캘린더 번호
	 * @return
	 */
	public CalenderVO calenderInfo(int calNum);
	
	/**
	 * 여행일정 삭제
	 * @param calNum : 캘린더 번호
	 * @return 성공 : 1, 실패 : 0
	 */
	public int deleteCalender(int calNum);
	
	/**
	 * 여행자 정보 삭제
	 * @param map : 캘린더 번호와 아이디 정보가 담겨있는 map
	 * @return 성공 : 1, 실패 : 0
	 */
	public int deleteTravelInfo(Map<String, Object> map);
	
	/**
	 * 여행지 정보 리스트 가져오기
	 * @param areaCode : 지역코드
	 * @return
	 */
	public List<AttractionVO> attractionList(String areaCode);
	
	/**
	 * 여행일정 리스트 가져오기
	 * @param calNum : 일정번호
	 * @return
	 */
	public List<TravNoteVO> travNoteList(int calNum);
}
