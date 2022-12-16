package kr.or.ddit.insurance.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.InsuranceVO;

@Mapper
public interface InsuranceDAO {

	/** 보험상품 추가
	 * @param insurance
	 * @return
	 */
	public int insertInsurance(InsuranceVO insurance);
	
	/**
	 * max값을 찾아서 기본키로 사용
	 * @return
	 */
	public int selectMaxInsurance();
		
}
