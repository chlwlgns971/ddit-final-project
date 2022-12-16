package kr.or.ddit.insurance.cusinfo.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.CusInfoVO;

@Mapper
public interface CusInfoDAO {
	
	/** 고객정보 추가
	 * @param cusInfo
	 * @return
	 */
	public int insertCusInfo(CusInfoVO cusInfo);
	
	
}
