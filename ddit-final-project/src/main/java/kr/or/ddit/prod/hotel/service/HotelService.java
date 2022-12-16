package kr.or.ddit.prod.hotel.service;

import java.util.List;

import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.CompanyInfoVO;
import kr.or.ddit.vo.HotelRoomVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ProdImageVO;
import kr.or.ddit.vo.RentCarVO;

public interface HotelService {
//	=======================김유리============================================
	public int retrieveHotelCount(PagingVO<HotelRoomVO> pagingVO);
	public int defaultCount(PagingVO<HotelRoomVO> pagingVO);
	public List<HotelRoomVO> retrieveHotelList(PagingVO<HotelRoomVO> pagingVO);
	public List<HotelRoomVO> defaultList(PagingVO<HotelRoomVO> pagingVO);
	public List<CategoryVO> getContinents();
	public List<CategoryVO> getNations(String continentName);
	public List<CategoryVO> getcities(String countryName);
	
	//상세페이지에 업체정보 가져오기
	public CompanyInfoVO retrieveHotel(int cinfoNum);
	//상세페이지에 객실리스트 가져오기
	public List<HotelRoomVO> retrieveRoomInfo(HotelRoomVO hotelRoomVO);
	//상세페이지에 댓글 가져오기

//	=======================강명범============================================	
		//업체회원의 새상품을 등록하기 위한 메소드
		public int createHotelProduct(HotelRoomVO hotelRoomVO);
//		
//		//업체회원의 마이페이지에서 상세정보를 보기 위한 메소드
		public HotelRoomVO hotelRoomDetail(int prodNum);
//		
//		//업체회원 상품을 수정하기 위한 메소드
		public int modifyProd(HotelRoomVO hotelRoomVO);
		
		public List<ProdImageVO> retrieveHotelImage(int prodNum);
		
		public int hotelOptionlUpdate(HotelRoomVO hotelRoomVO);
		
		public int deleteHotel(int romNum);
	
}
