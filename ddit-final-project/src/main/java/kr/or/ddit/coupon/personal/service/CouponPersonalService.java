package kr.or.ddit.coupon.personal.service;

import java.util.List;

import kr.or.ddit.vo.CouponVO;

public interface CouponPersonalService {
public List<CouponVO> retrievePesonalCoupon(String memId);
public int countCoupon(String accId);
}
