
package kr.or.ddit.admin.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.admin.dao.AdminManageDestinationDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.DestinationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminManageDestinationServiceImpl implements AdminManageDestinationService {

	@Inject
	private AdminManageDestinationDAO dao;
	
	// 대륙 분류 코드 리스트를 반환하는 메서드
	@Override
	public List<CategoryVO> getContinentList() {
		return dao.returnContientList();
	}

	// 대륙 분류 코드를 파라미터로 해당 대륙의 국가 리스트를 반환하는 메서드
	@Override
	public List<CategoryVO> getNationList(String continent) {
		return dao.returnNataionList(continent);
	}
	
	// 국가 분류 코드를 파라미터로 해당 여행지의 리스트를 반환하는 메서드
	@Override
	public List<CategoryVO> getDestList(String nation) {
		return dao.returnDestList(nation);
	}
	
	// 해당 여행지의 정보를 반환하는 메서드
	@Override
	public DestinationVO getDestination(String destCode) {
		return dao.getDestination(destCode);
	}
	
	// 여행지 정보를 수정하는 메서드
	@Override
	public ServiceResult editDest(DestinationVO destination) {
		ServiceResult result;
		int resultCnt = dao.editDest(destination);
		log.info("destination vo: {}", destination.toString());
		if(resultCnt>0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIL;
		}
		
		return result;
	}

	@Override
	public ServiceResult insertDest(Map<String, String> param) {
		ServiceResult result;
		// 파라미터 map에서 국가 코드 받기 
		String nationCode = param.get("nationCode");
		// 해당 국가의 가장 마지막 번호+1 찾기 
		String nationNum = dao.getDestNum(nationCode);
		log.info("new nation code: {}",nationNum);
		
		// 가져온 다음 번호를 map에 넣기 
		param.put("catCode", nationNum);
		// CATEGORY TABLE에 INSERT
		int cntDest= dao.insertDest(param);
		// AREA TABLE에 INSERT
		int cntArea = dao.insertArea(param);
		
		
		if(cntDest>0&&cntArea>0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIL;
		}
		
		return result;
	}

}
