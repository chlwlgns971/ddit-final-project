package kr.or.ddit.mileage.service;

import java.util.List;

import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.UseMileageVO;

public interface mileageService {
	public List<UseMileageVO> selectMileageHistory(String memId);
	
	public List<UseMileageVO> mileagetList(PagingVO<UseMileageVO> pagingVO);
	
	public int retrieveMLCount(PagingVO<UseMileageVO> pagingVO);
}
