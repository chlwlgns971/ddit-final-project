package kr.or.ddit.admin.service;

import java.util.List;

import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.CouponVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ReportVO;

public interface AdminManageCPService {
	
	// 페이징 처리를 위해 전체 쿠폰 발급 건 수를 체크하는 메서드
	public int retrieveCouponCount(PagingVO<CouponVO> pagingVO);

	// 페이징 처리된 쿠폰 리스트
	public List<CouponVO> getCouponList(PagingVO<CouponVO> pagingVO);
	
	//쿠폰 등록에 필요한 카테고리 
	public List<CategoryVO> getCPCat();
	
	//쿠폰 상세 보기 메소드
	public CouponVO getCouponDetail(int couNum);
	
	// 쿠폰 이름, 사용 가능 기한 변경 메서드
	public int setCoupon(CouponVO coupon);
	
	
//	// 쿠폰 삭제 메서드 
//	public int deleteCoupon(int couNum);
	
	// 쿠폰 생성 메서드 
	public int insertCoupon(CouponVO coupon);
	
}
