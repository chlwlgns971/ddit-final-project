package kr.or.ddit.mileage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mileage.dao.MileageDAO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.UseMileageVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class mileageServiceImpl implements mileageService {
	@Inject
	private MileageDAO mileageDAO;

	@Override
	public List<UseMileageVO> selectMileageHistory(String memId) {
		System.out.println("여긴옴??");
		List<UseMileageVO> mileList=mileageDAO.selectMileageHistory(memId);
		return mileList;
	}

	@Override
	public List<UseMileageVO> mileagetList(PagingVO<UseMileageVO> pagingVO) {
		// TODO Auto-generated method stub
		return mileageDAO.companyProductList(pagingVO);
	}

	@Override
	public int retrieveMLCount(PagingVO<UseMileageVO> pagingVO) {
		// TODO Auto-generated method stub
		return mileageDAO.retrieveMLCount(pagingVO);
	}

}

