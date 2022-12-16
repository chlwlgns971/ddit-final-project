package kr.or.ddit.booking.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.booking.dao.BookingDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.ChargeVO;
import kr.or.ddit.vo.CouponVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MyCouponVO;
import kr.or.ddit.vo.ProdVO;
import kr.or.ddit.vo.ResDatailVO;
import kr.or.ddit.vo.ReservationVO;
import kr.or.ddit.vo.UseCouponVO;
import kr.or.ddit.vo.UseMileageVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BookingServiceImpl implements BookingService {
	@Inject
	private BookingDAO dao;

	@Override
	public Map<String, Object> getBookingPageInfo(String memId, String prodCode, int prodPrice) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		//회원정보 가져오기
		MemberVO member = dao.getMemInfo(memId);
		
		//쿠폰 가져오기
		List<MyCouponVO> list = new ArrayList<MyCouponVO>();
		Map<String, Object> data = new HashMap<>();
		data.put("memId", memId);
		data.put("prodCode", prodCode);
		data.put("prodPrice", prodPrice);
		list = dao.getCouponList(data);
		
		map.put("member", member);
		map.put("coupon", list);
		log.info("map : {}",map);
		return map;
	}

	@Override
	public int mileageCalculation(int mileage, String memId, int prodPrice) {
		int result = -1;
		MemberVO member = dao.getMemInfo(memId);
		//내 마일리지 정보 가져오기
		int dbMileage = member.getMemMil();
		log.info("dbMileage : {}",dbMileage);
		log.info("mileage : {}",mileage);
		if(mileage <= dbMileage && mileage >= 0) result = prodPrice - mileage;
		return result;
	}

	@Override
	public int couponCalculation(String memId, String prodCode, int coupon, int prodPrice) {
		int result = -1;
		//쿠폰 진위여부 확인용 쿠폰 조회
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memId", memId);
		map.put("prodCode", prodCode);
		map.put("coupon", coupon);
		map.put("prodPrice", prodPrice);
		CouponVO couponVo = null;
		
		log.info("Map : {}",map);
		couponVo = dao.getCoupon(map);
		log.info("couponVo : {}",couponVo);
		if(couponVo != null) {
			String code = couponVo.getCouCode();
			if(code.equals("DCP")) { // 금액 할인형 금액 계산
				result = prodPrice - couponVo.getCouDisc();
			}
				
			else { // 금액 퍼센티지 금액 계산
				result = (prodPrice * (100-couponVo.getCouDisc()))/100;
			}
		}
		return result;
	}

	@Override
	@Transactional
	public ServiceResult chargeProcess(ReservationVO resv, ResDatailVO resd, ProdVO prod, ChargeVO charge, int coupon,
			int mileage, String memId) {
		//결제정보 insert
		int cnt = dao.insertChargeInfo(charge);
		
		//예약정보 insert
		resv.setResStt("RS");
		resv.setMemId(memId);
		cnt = cnt + dao.insertResInfo(resv);
		
		//예약자정보 insert
		cnt = cnt + dao.insertResDetailInfo(resd);
		
		//결제정보 가져오기(결제시간 얻기 위함)
		ChargeVO chargeVo = dao.getChargeInfo(charge.getCharCode());
		
		//쿠폰을 사용했을 경우에만 실행
		if(coupon != 0) {
			//쿠폰 사용내역 insert
			UseCouponVO useCoupon = new UseCouponVO();
			useCoupon.setCharCode(charge.getCharCode());
			useCoupon.setMcouNum(coupon);
			useCoupon.setMemId(memId);
			useCoupon.setUcouDate(chargeVo.getCharDate());
			cnt = cnt + dao.insertUseCoupon(useCoupon);
			
			//보유쿠폰 수량 업데이트
			Map<String, Object> couponMap = new HashMap<>();
			couponMap.put("memId", memId);
			couponMap.put("couNum", coupon);
			cnt = cnt + dao.updateCoupon(couponMap);
		}
		
		//마일리지를 사용했을 경우에만 실행
		if(mileage !=0) {
			//마일리지 사용내역 insert
			UseMileageVO mileageVo = new UseMileageVO();
			mileageVo.setCharCode(charge.getCharCode());
			mileageVo.setMemId(memId);
			mileageVo.setUmilDate(chargeVo.getCharDate());
			mileageVo.setUmilMilage(mileage);
			cnt = cnt + dao.insertUseMileage(mileageVo);
			
			//보유 마일리지 업데이트
			Map<String, Object> mileageMap = new HashMap<>();
			mileageMap.put("memId", memId);
			mileageMap.put("mileage", mileage);
			cnt = cnt + dao.updateMileage(mileageMap);
		}
		
		ServiceResult result = ServiceResult.FAIL;
		
		if(cnt > 0) result = ServiceResult.OK;
		
		return result;
	}

}
