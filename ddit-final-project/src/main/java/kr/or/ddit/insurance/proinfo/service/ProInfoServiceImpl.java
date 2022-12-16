package kr.or.ddit.insurance.proinfo.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.insurance.proinfo.dao.ProInfoDAO;
import kr.or.ddit.vo.ProInfoVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class ProInfoServiceImpl implements ProInfoService{
	
	private final ProInfoDAO dao;
	
	/* 보장내용 1개 조회
	 * @see kr.or.ddit.insurance.proinfo.service.ProInfoService#retrieveProInfo(int)
	 */
	@Override
	public ProInfoVO retrieveProInfo(int pinfNum){
		ProInfoVO proInfo= dao.selectProInfo(pinfNum);
		if(proInfo == null) throw new RuntimeException(String.format("%d 보장정보가 존재하지 않음,", pinfNum));
		
		return proInfo;
	}

	/* 보장내용 전체 조회
	 * @see kr.or.ddit.insurance.proinfo.service.ProInfoService#retrieveProInfoList(kr.or.ddit.vo.ProInfoVO)
	 */
	@Override
	public List<ProInfoVO> retrieveProInfoList() {
		
		List<ProInfoVO> list = new ArrayList<>();
		int max = dao.maxProInfo();
		for(int i = 1; i<=max; i++	) {
			list.add(dao.selectProInfo(i));
		}
		log.info("list:{}",list);
	
		return list;
	}

	/* 보장내용의 총 수
	 * @see kr.or.ddit.insurance.proinfo.service.ProInfoService#maxProInfo()
	 */
	@Override
	public int maxProInfo() {
		
		return dao.maxProInfo();
	}
	
	
	
}
