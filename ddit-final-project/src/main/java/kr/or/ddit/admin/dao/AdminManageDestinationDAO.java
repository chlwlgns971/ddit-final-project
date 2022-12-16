package kr.or.ddit.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.DestinationVO;

@Mapper
public interface AdminManageDestinationDAO {
	
	// 대륙 리스트를 반환
	public List<CategoryVO> returnContientList();
	
	// 대륙코드를 파라미터로 국가 리스트를 반환
	public List<CategoryVO> returnNataionList(String continent);
	
	// 국가 분류 코드를 파라미터로 해당 여행지의 리스트를 반환하는 메서드
	public List<CategoryVO> returnDestList(String nation);
	
	// 여행지 코드로 여행지 정보를 반환하는 메서드
	public DestinationVO getDestination(String destCode);
	
	// 여행지 정보 수정 행 수를 반환하는 메서드
	public int editDest(DestinationVO destination);
	
	// 새로운 여행지를 등록하는 메서드
	public int insertDest(Map<String, String> param);
	
	// 새로운 여행지 등록 전 여행지 코드를 받기 위해 기존의 코드 중 가장 마지막 코드를 가져오는 메서드
	public String getDestNum(String natioCode);
	
	// 새로운 여행지 정보를 AREA TABLE에 INSERT하는 메서드
	public int insertArea(Map<String, String> param);

}
