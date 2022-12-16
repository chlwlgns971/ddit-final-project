package kr.or.ddit.booking.controller;

import java.security.Principal;
import java.util.HashMap;
import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.booking.service.BookingService;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/calculate")
public class CalculationController {
	@Inject
	BookingService service;
	
	/**
	 * 마일리지 적용 상품가격 계산
	 * @param mileage : 사용마일리지
	 * @param prodPrice : 상품가격
	 * @param principal : 회원인증객체
	 * @return
	 */
	@RequestMapping(value="/mileage", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public int resultMileage(@RequestParam(name="mileage") int mileage, @RequestParam(name="price") int prodPrice, Principal principal) {
		int result = service.mileageCalculation(mileage, principal.getName(), prodPrice);
		return result;
	}
	
	/**
	 * 쿠폰 적용 상품가격 계산
	 * @param coupon : 쿠폰번호
	 * @param prodPrice : 상품가격
	 * @param prodCode : 상품코드
	 * @param principal : 회원인증객체
	 * @return
	 */
	@RequestMapping(value="/coupon", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public int resultCoupon(@RequestParam(name="coupon") int coupon, @RequestParam(name="price") int prodPrice
			, @RequestParam(name="prodCode") String prodCode, Principal principal) {
		int result = service.couponCalculation(principal.getName(), prodCode, coupon, prodPrice);
		return result;
	}
	
	/**
	 * 결제하기 전 값 위조가 일어났는지 확인
	 * @param coupon : 쿠폰번호
	 * @param mileage : 사용마일리지
	 * @param finalPrice : 최종결제금액
	 * @param originalPrice : 상품의 원래 금액
	 * @param prodCode : 상품코드
	 * @param principal : 회원인증객체
	 * @return 결과일치(위변조없음) : finalPrice, 결과불일치(위변조일어남) : -1
	 */
	@RequestMapping(value="/validate", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public int validateAmount(@RequestParam(name="coupon", defaultValue="0") int coupon, @RequestParam(name="mileage", defaultValue="0") int mileage
			, @RequestParam(name="finalPrice") int finalPrice, @RequestParam(name="originalPrice") int originalPrice
			, @RequestParam(name="prodCode") String prodCode, Principal principal) {
		int result1 = originalPrice;
		if(coupon != 0) {
			//쿠폰을 적용한 후의 가격계산
			result1 = service.couponCalculation(principal.getName(), prodCode, coupon, originalPrice);
		}
		int result2 = result1;
		if(mileage != 0) {
			//마일리지를 적용한 후의 가격계산
			result2 = service.mileageCalculation(mileage, principal.getName(), result1);
		}
		
		log.info("Validate result1 : {}",result1);
		log.info("Validate result2 : {}",result2);
		log.info("Validate finalPrice : {}",finalPrice);
		//위변조 여부 검사(쿠폰과 마일리지를 계산한 결과가 최종결제 금액과 일치하는지 검사)
		if(finalPrice == result2) return finalPrice;
		else return -1;
	}
}
