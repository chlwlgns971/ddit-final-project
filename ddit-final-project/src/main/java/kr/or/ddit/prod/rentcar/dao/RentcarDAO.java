package kr.or.ddit.prod.rentcar.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.RentCarVO;
import oracle.security.crypto.fips.RNGTest;
@Mapper
public interface RentcarDAO {
	public List<CategoryVO> getContinents();
	public List<CategoryVO> getNations(String continentName);
	public List<CategoryVO> getcities(String countryName);
	
	//검색조건에 따른 결과리스트 가져오는 메소드
	public List<RentCarVO> selectRentCarList(PagingVO<RentCarVO> pagingVO);
	// 페이징처리 메소드
	public int selectTotalRecord(PagingVO<RentCarVO> pagingVO);
	
	//검색조건 입력 전 기본으로 보여주는 리스트
	public int defaultTotalRecord(PagingVO<RentCarVO> pagingVO);	
	public List<RentCarVO> defaultList(PagingVO<RentCarVO> pagingVO);

	// 상세페이지- 렌트카 정보 보여주는 메소드
	public RentCarVO selectRentcar(int prodNum);
	
	
	
	
	
	//업체회원의  상품을 등록하기위한 메소드(kmb)
	public int createProduct(RentCarVO rentCarVO);
	
	
	public int createRentCarProduct(RentCarVO rentCarVO);
	//업체회원의 마이페이지에서 상세정보를 보기 위한 메소드(kmb)
	public RentCarVO rentCarDetail(int prodNum);
	
	//업체회원의 마이페이지에서 상품을 수정하기 위한 메소드
	public int updateProd(RentCarVO rentCarVO);
	
	public int deleteRentCar(int prodNum);
	
	
	

}
