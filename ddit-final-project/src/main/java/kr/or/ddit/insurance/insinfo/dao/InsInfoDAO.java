package kr.or.ddit.insurance.insinfo.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.InsInfoVO;

@Mapper
public interface InsInfoDAO {
	
	public int insertInsInfo(InsInfoVO insInfo); 
		
}
