package kr.or.ddit.coupon.personal.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.coupon.personal.dao.CouponPersonalDAO;
import kr.or.ddit.vo.CouponVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CouponPersonalServiceImpl implements CouponPersonalService {
	private final CouponPersonalDAO couponPersonalDAO;
	
	@Override
	public List<CouponVO> retrievePesonalCoupon(String memId) {
		List<CouponVO> couponList=couponPersonalDAO.couponList(memId);
		return couponList;
	}

	@Override
	public int countCoupon(String accId) {
		int cnt=couponPersonalDAO.countCoupon(accId);
		return cnt;
	}

}
