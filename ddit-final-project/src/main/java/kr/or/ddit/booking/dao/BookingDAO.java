package kr.or.ddit.booking.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.maven.model.CiManagement;

import kr.or.ddit.vo.ChargeVO;
import kr.or.ddit.vo.CompanyInfoVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MyCouponVO;
import kr.or.ddit.vo.ProdVO;
import kr.or.ddit.vo.ResDatailVO;
import kr.or.ddit.vo.ReservationVO;
import kr.or.ddit.vo.UseCouponVO;
import kr.or.ddit.vo.UseMileageVO;

@Mapper
public interface BookingDAO {
	/**
	 * 회원의 보유 쿠폰 리스트를 반환
	 * @param map : 아래 정보들이 담긴 map
	 * @param memId : 회원아이디
	 * @param prodCode : 상품코드
	 * @param prodPrice : 상품가격
	 * @return
	 */
	public List<MyCouponVO> getCouponList(Map<String, Object> map);
	
	/**
	 * 쿠폰 진위여부 확인
	 * @param map
	 * @return
	 */
	public MyCouponVO getCoupon(Map<String, Object> map);
	
	/**
	 * 결제에 필요한 회원정보 반환
	 * @param memId : 회원 아이디
	 * @return
	 */
	public MemberVO getMemInfo(String memId);
	
	/**
	 * 상품번호로 상품정보를 조회하여 반환
	 * @param prodNum : 상품번호
	 * @return
	 */
	public ProdVO getProdInfo(int prodNum);
	
	/**
	 * 상품글 번호로 사업체 정보를 조회하여 반환
	 * @param cinfoNum : 상품 소개글 번호
	 * @return
	 */
	public CompanyInfoVO getCompanyInfo(int cinfoNum);
	
	/**
	 * 결제코드로 결제정보를 조회하여 반환
	 * @param charCode : 결제코드
	 * @return
	 */
	public ChargeVO getChargeInfo(String charCode);
	
	/**
	 * 결제정보를 DB에 insert
	 * @param charge : 결제정보가 담긴 ChargeVO 객체
	 * @return 성공 : 1, 실패 : 0
	 */
	public int insertChargeInfo(ChargeVO charge);
	
	/**
	 * 예약정보를 DB에 insert
	 * @param resv : 예약정보가 담긴 VO객체
	 * @return 성공 : 1, 실패 : 0
	 */
	public int insertResInfo(ReservationVO resv);
	
	/**
	 * 예약자 정보를 DB에 insert
	 * @param resd : 예약자 상세정보가 담긴 VO객체
	 * @return 성공 : 1, 실패 : 0
	 */
	public int insertResDetailInfo(ResDatailVO resd);
	
	/**
	 * 마일리지 사용내역을 DB에 insert
	 * @param useMileage : 마일리지 사용내역 정보가 담긴 VO객체
	 * @return 성공 : 1, 실패 : 0
	 */
	public int insertUseMileage(UseMileageVO useMileage);
	
	/**
	 * 쿠폰 사용내역을 DB에 insert
	 * @param useCoupon : 쿠폰 사용내역 정보가 담긴 VO객체
	 * @return 성공: 1, 실패 : 0
	 */
	public int insertUseCoupon(UseCouponVO useCoupon);
	
	/**
	 * 보유마일리지 업데이트
	 * @param map : 회원 아이디와 사용 마일리지 정보로 이루어진 map
	 * @return 성공 : 1, 실패 : 0
	 */
	public int updateMileage(Map<String, Object> map);
	
	/**
	 * 보유 쿠폰 정보 업데이트
	 * @param map : 회원아이디와 사용 쿠폰 정보로 이루어진 map
	 * @return 성공 : 1, 실패 : 0
	 */
	public int updateCoupon(Map<String, Object> map);
	
	//12.13 최지훈 추가
	/**
	 * 회원 예약정보 리스트 가져오기
	 * @param accId : 아이디
	 * @return
	 */
	public List<ReservationVO> getReservationList(String accId);
	
	/**
	 * 회원 예약정보 상세내용 가져오기
	 * @param resCode : 예약코드
	 * @return
	 */
	public ReservationVO getReservationInfo(String resCode);
	
	/**
	 * 업체 예약정보 리스트 가져오기
	 * @param accId : 아이디
	 * @return
	 */
	public List<ReservationVO> getResComList(String comId);
	
	/**
	 * 회원  상세정보 가져오기
	 * @param resCode : 예약코드
	 * @return
	 */
	public ResDatailVO getResMemberInfo(String resCode);
}
