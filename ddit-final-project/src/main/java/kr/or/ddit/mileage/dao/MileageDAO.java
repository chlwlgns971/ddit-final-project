package kr.or.ddit.mileage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.UseMileageVO;

@Mapper
public interface MileageDAO {
	public List<UseMileageVO> selectMileageHistory(String memId);
	
	public List<UseMileageVO> companyProductList(PagingVO pagingVO);
	
	public int retrieveMLCount(PagingVO pagingVO);
}
