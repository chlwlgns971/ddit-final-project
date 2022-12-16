package kr.or.ddit.admin.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.DestinationVO;

public interface AdminManageDestinationService {
	
	// 대륙 분류 코드 리스트를 반환하는 메서드
	public List<CategoryVO> getContinentList();
	
	// 대륙 분류 코드를 파라미터로 해당 대륙의 국가 리스트를 반환하는 메서드
	public List<CategoryVO> getNationList(String continent);
	
	// 국가 분류 코드를 파라미터로 해당 여행지의 리스트를 반환하는 메서드
	public List<CategoryVO> getDestList(String nation);
	
	// 여행지 코드로 여행지 정보를 가져오는 메서드
	public DestinationVO getDestination(String destCode);
	
	// 여행지 수정 결과를 반환하는 메서드
	public ServiceResult editDest(DestinationVO destination);
	
	// 국가 코드와 여행지 이름을 이용하여 새로운 여행지를 등록하는 메서드
	public ServiceResult insertDest(Map<String, String> param);
}
