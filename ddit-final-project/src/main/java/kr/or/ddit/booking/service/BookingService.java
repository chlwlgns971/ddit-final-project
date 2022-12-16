package kr.or.ddit.booking.service;

import java.security.Principal;
import java.util.Map;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.AccountVOWrapper;
import kr.or.ddit.vo.ChargeVO;
import kr.or.ddit.vo.ProdVO;
import kr.or.ddit.vo.ResDatailVO;
import kr.or.ddit.vo.ReservationVO;

public interface BookingService {
	/**
	 * 결제페이지에 필요한 정보(마일리지, 쿠폰, 로그인 정보)를 map에 담아 반환
	 * @param account : 로그인 정보가 담긴 AccountVOWrapper 객체
	 * @param prodCode : 상품코드
	 * @param prodPrice : 상품가격
	 * @return
	 */
	public Map<String, Object> getBookingPageInfo(String memId, String prodCode, int prodPrice);
	
	/**
	 * 사용하려는 마일리지가 실제 DB에 있는 마일리지보다 적은지 확인하고 상품금액에 마일리지를 뺀 가격을 반환
	 * @param mileage : 사용 마일리지
	 * @param memId : 회원 아이디
	 * @param prodPrice : 상품가격
	 * @return 정상처리 : 상품가격, 위변조발견됨 : -1 반환
	 */
	public int mileageCalculation(int mileage, String memId, int prodPrice);
	
	/**
	 * 사용하려는 쿠폰이 실제 가지고 있는 쿠폰인지, 사용가능한 쿠폰인지 확인하고 상품금액에 쿠폰가격을 적용한 가격을 반환
	 * @param memId : 상품가격
	 * @param prodCode : 상품코드
	 * @param coupon : 쿠폰번호
	 * @param prodPrice : 상품가격
	 * @return
	 */
	public int couponCalculation(String memId, String prodCode, int coupon, int prodPrice);
	
	/**
	 * 결제 완료 후 관련 정보들을 DB에 insert/update하는 로직
	 * @param resv : 예약정보가 담긴 VO객체
	 * @param resd : 예약자 정보가 담긴 VO객체
	 * @param prod : 상품정보가 담긴 VO객체
	 * @param charge : 결제정보가 담긴 VO객체
	 * @param coupon : 사용한 쿠폰번호
	 * @param mileage : 사용한 마일리지
	 * @param memId : 회원 아이디
	 * @return : OK : 성공, FAIL : 실패
	 */
	public ServiceResult chargeProcess(ReservationVO resv, ResDatailVO resd, ProdVO prod, ChargeVO charge, int coupon, int mileage, String memId);
}
