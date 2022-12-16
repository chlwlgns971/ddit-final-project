package kr.or.ddit.main.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainDAO {
	/**
	 * 뉴스레터 수신동의용 로직
	 * @param mail : 이메일
	 * @return 성공 : 1, 실패 : 0
	 */
	public int insertNews(String mail);
	
	/**
	 * 일반회원 수 반환
	 * @return
	 */
	public int countMember();
	
	/**
	 * 기업회원 수 반환
	 * @return
	 */
	public int countCompany();
	
	/**
	 * 렌트카 상품 수 반환
	 * @return
	 */
	public int countCar();
	
	/**
	 * 호텔상품 수 반환
	 * @return
	 */
	public int countRoom();
	
	/**
	 * 패키지 상품 수 반환
	 * @return
	 */
	public int countPackage();
	
	/**
	 * 여행지 수 반환
	 * @return
	 */
	public int countDestination();
}
