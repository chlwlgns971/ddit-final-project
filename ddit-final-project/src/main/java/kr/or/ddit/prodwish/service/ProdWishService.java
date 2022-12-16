package kr.or.ddit.prodwish.service;

import java.util.Map;

import kr.or.ddit.enumpkg.ServiceResult;

public interface ProdWishService {
	/**
	 * 상품 위시리스트 추가하거나 내리는 로직 담당
	 * @param map 업체번호와 아이디 정보가 담긴 map
	 * @return 위시에 추가된 상태면 1 아니면 0 반환
	 */
	public int addItemToWish(Map<String, Object> map);
	
	/**
	 * 위시리스트에 들어있는 상품인지 확인
	 * @param cinfoNum 상품의 업체번호
	 * @param memId 회원의 아이디
	 * @return 1 : 구독, 0 : 구독아님
	 */
	public int checkInWish(int cinfoNum, String memId);
}
