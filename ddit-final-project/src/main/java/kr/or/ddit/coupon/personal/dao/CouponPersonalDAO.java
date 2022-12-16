package kr.or.ddit.coupon.personal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.CouponVO;

@Mapper
public interface CouponPersonalDAO {
	public List<CouponVO> couponList(String memId);
	public int countCoupon(String accId);
}
