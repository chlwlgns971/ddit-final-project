package kr.or.ddit.insurance.proinfo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ProInfoVO;

@Mapper
public interface ProInfoDAO {
	
	/**
	 * 보장내용 1개 조회
	 * @param pinfNum
	 * @return
	 */
	public ProInfoVO selectProInfo(int pinfNum);
	
	/**
	 * 보장내용 전체 조회
	 * @param proInfo
	 * @return
	 */
	public List<ProInfoVO> selectProInfoList();
	
	public int maxProInfo();
	
	
	
}
