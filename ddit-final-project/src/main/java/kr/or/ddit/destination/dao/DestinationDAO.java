package kr.or.ddit.destination.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.DestinationVO;
import kr.or.ddit.vo.SearchRecordVO;

@Mapper
public interface DestinationDAO {
	/**
	 * 여행지 정보를 가져온다.
	 * @param areaCode 지역코드
	 * @return 여행지 정보가 담긴 DestinationVO
	 */
	public DestinationVO selectDestination(String areaCode);

	public int insertSearchHistory(SearchRecordVO search);
}
