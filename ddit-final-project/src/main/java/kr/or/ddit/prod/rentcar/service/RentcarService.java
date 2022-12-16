package kr.or.ddit.prod.rentcar.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ProdImageVO;
import kr.or.ddit.vo.RentCarVO;

public interface RentcarService {
	public List<CategoryVO> getContinents();
	public List<CategoryVO> getNations(String continentName);
	public List<CategoryVO> getcities(String countryName);
	
	public int defaultCount(PagingVO<RentCarVO> pagingVO);
	public List<RentCarVO> defaultList(PagingVO<RentCarVO> pagingVO);
	//검색조건에 맞는 결과리스트 가져오는 메소드
	public List<RentCarVO> retrieveRentCarList(PagingVO<RentCarVO> pagingVO);
	// 검색 결과 조회리스트 페이징 메소드
	public int retrieveRentCarCount(PagingVO<RentCarVO> pagingVO);
	//상품상세조회 메소드
	public RentCarVO retrieveRentCar(int prodNum);
	
	

	
	//업체회원의 새상품을 등록하기 위한 메소드(KMB)
	public int createProd(RentCarVO rentCarVO);
	
	public int createRentCarProduct(RentCarVO rentCarVO);
	
	//업체회원의 마이페이지에서 상세정보를 보기 위한 메소드(kmb)
	public RentCarVO rentCarDetail(int prodNum);
	
	//업체회원의 이미지 리스트로 보기 위한 메소드(KMB)
	public List<ProdImageVO> retrieveRentCarImage(int prodNum);
	
	//업체회원의 이미지를 저장하기 위한 메소드(KMB) 
	public int processProdImageList(RentCarVO rentCarVO);
	
	//업체회원 상품을 수정하기 위한 메소드
	public int modifyProd(RentCarVO rentCarVO);
	
	//업체회원 상품 이미지를 삭제하기 위한 메소드
	public int processDeleteProdImage(RentCarVO rentCarVO);
	
	public int deleteRentCar(int prodNum);
}


