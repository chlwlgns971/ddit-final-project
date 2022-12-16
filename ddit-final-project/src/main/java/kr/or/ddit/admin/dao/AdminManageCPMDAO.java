package kr.or.ddit.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.CouponVO;
import kr.or.ddit.vo.PagingVO;

@Mapper
public interface AdminManageCPMDAO {
	
	// 쿠폰 카테고리 반환 메서드
	public List<CategoryVO> getCPCat();
	
	//페이징 처리된 쿠폰 리스트 반환 메서드
	public List<CouponVO> getCouponList(PagingVO<CouponVO> pagingVO);
	
	//페이징 처리를 위한 전체 발급 수 카운트 메서드
	public int retrieveCouponCount(PagingVO<CouponVO> pagingVO);
	
	// 특정 쿠폰 상세보기 메서드
	public CouponVO getCouponDetail(int couNum);
	
	//쿠폰명, 유효 기간 변경 메서드
	public int setCoupon(CouponVO coupon);
	
//	//쿠폰 번호를 파라미터로 받아 해당 쿠폰을 삭제하는 메서드
//	public int deleteCoupon(int couNum);
	
	// 쿠폰 생성 메서드
	public int insertCoupon(CouponVO coupon);

}
