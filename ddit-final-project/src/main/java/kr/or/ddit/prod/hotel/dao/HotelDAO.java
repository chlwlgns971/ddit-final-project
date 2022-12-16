package kr.or.ddit.prod.hotel.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.CompanyInfoVO;
import kr.or.ddit.vo.HotelRoomVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ProdSearchVO;
import kr.or.ddit.vo.RentCarVO;

/**
 * @author PC-13
 *
 */
@Mapper
public interface HotelDAO {
	
//	=======================김유리============================================
	public int selectTotalRecord(PagingVO<HotelRoomVO> pagingVO);
	public int defaultTotalRecord(PagingVO<HotelRoomVO> pagingVO);	
	public List<HotelRoomVO> selectHotelList(PagingVO<HotelRoomVO> pagingVO);
	public List<HotelRoomVO> defaultList(PagingVO<HotelRoomVO> pagingVO);
	public List<CategoryVO> getContinents();
	public List<CategoryVO> getNations(String continentName);
	public List<CategoryVO> getcities(String countryName);
	
	public CompanyInfoVO selectHotel(@Param("cinfoNum") int cinfoNum);
	public List<HotelRoomVO> selectRoomInfo(HotelRoomVO hotelRoomVO);
	
//	=======================강명범============================================	
	//업체회원의  상품을 등록하기위한 메소드(kmb)
		public int createHotelProduct(HotelRoomVO hotelRoomVO);
		
		//업체회원의 마이페이지에서 상세정보를 보기 위한 메소드(kmb)
		public HotelRoomVO hotelRoomDetail(int prodNum);
		
		//업체회원의 마이페이지에서 상품을 수정하기 위한 메소드
		public int updateProd(HotelRoomVO hotelRoomVO);
		
		//검색조건에 따른 결과리스트 가져오는 메소드
		public List<HotelRoomVO> selecthotelRoomList(PagingVO<HotelRoomVO> pagingVO);
		
		public int hotelOptionlUpdate(HotelRoomVO hotelRoomVO);
		
		public int deleteHotel(int romNum);
}
