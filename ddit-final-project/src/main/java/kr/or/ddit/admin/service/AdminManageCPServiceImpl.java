package kr.or.ddit.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.admin.dao.AdminManageCPMDAO;
import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.CouponVO;
import kr.or.ddit.vo.PagingVO;

@Service
public class AdminManageCPServiceImpl implements AdminManageCPService {
	//dao 연결
	@Inject
	private AdminManageCPMDAO dao;
	
	// 쿠폰 카테고리 반환 메서드
	@Override
	public List<CategoryVO> getCPCat() {
		return dao.getCPCat();
	}
	// 페이징처리된 쿠폰 발급 리스트 반환
	@Override
	public List<CouponVO> getCouponList(PagingVO<CouponVO> pagingVO) {
		return dao.getCouponList(pagingVO);
	}// 쿠폰 발급 이력 전체 수 반환ㄴ

	@Override
	public int retrieveCouponCount(PagingVO<CouponVO> pagingVO) {
		return dao.retrieveCouponCount(pagingVO);
	}
	@Override
	public CouponVO getCouponDetail(int couNum) {
		return dao.getCouponDetail(couNum);
	}
	@Override
	public int setCoupon(CouponVO coupon) {
		return dao.setCoupon(coupon);
	}
//	@Override
//	public int deleteCoupon(int couNum) {
//		return dao.deleteCoupon(couNum);
//	}
	@Override
	public int insertCoupon(CouponVO coupon) {
		return dao.insertCoupon(coupon);
	}

}
