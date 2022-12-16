package kr.or.ddit.prodwish.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProdWishDAO {

	/**
	 * 상품 위시리스트에 추가
	 * @param map 블로그 주인 아이디와 이용자 아이디 정보가 담긴 Map
	 * @return insert 성공: 1, 실패: 0
	 */
	public int insertItemToWish(Map<String, Object> map);
	
	/**
	 * 상품 위시리스트에서 삭제
	 * @param map 블로그 주인 아이디와 이용자 아이디 정보가 담긴 Map
	 * @return insert 성공: 1, 실패: 0
	 */
	public int removeItemFromWish(Map<String, Object> map);
	
	/**
	 * 위시리스트에 있는 상품인지 확인하는 기능
	 * @param map 업체번호와 이용자 아이디 정보가 담긴 Map
	 * @return 1 : 구독, 0 : 구독아님
	 */
	public int checkInWish(Map<String, Object> map);
}
