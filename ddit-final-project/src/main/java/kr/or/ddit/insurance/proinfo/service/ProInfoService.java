package kr.or.ddit.insurance.proinfo.service;

import java.util.List;

import kr.or.ddit.vo.ProInfoVO;

public interface ProInfoService {
	
	/**
	 * 보장내용 1개 찾기
	 * @param pinfNum
	 * @return
	 */
	public ProInfoVO retrieveProInfo(int pinfNum);
	
	/**
	 * 보장내용 전체 조회
	 * @param proInfo
	 * @return
	 */
	public List<ProInfoVO> retrieveProInfoList();
	
	/**
	 * 총 보장내용 수
	 * @return
	 */
	public int maxProInfo();
}
