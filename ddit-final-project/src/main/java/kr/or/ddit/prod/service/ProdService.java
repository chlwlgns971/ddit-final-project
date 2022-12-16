package kr.or.ddit.prod.service;

import java.util.List;

import kr.or.ddit.vo.AreaVO;
import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.CompanyInfoVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ProdImageVO;
import kr.or.ddit.vo.ProdVO;
import kr.or.ddit.vo.ReservationVO;

public interface ProdService {
	public CompanyInfoVO SelectCompanyInfo(String comId);
	
	public int createProd(ProdVO prodVO);
	
	public List<AreaVO> selectArea(AreaVO areaVO);
	
	//업체회원의 이미지 리스트로 보기 위한 메소드
	public List<ProdImageVO> retrieveProdImage(int prodNum);
	
	//업체회원의 이미지를 저장하기 위한 메소드 
	public int processProdImageList(ProdVO prodVO);
	
	//업체회원 상품 이미지를 삭제하기 위한 메소드
//	public int processDeleteProdImage(ProdVO prodVO);
	
	//업체회원의 마이페이지에서 상품을 수정하기 위한 메소드
	public int modifyProd(ProdVO prodVO);
	
	//지역이름을 입력하여 지역ㅋ토드를 가져오는 메소드
	public AreaVO selectAreaCode(String areaName);
	
	//카테고리 이름을 검색하여 카테고리 코드를 얻는 메소드
//	public CategoryVO selectCategory(CategoryVO categoryVO);
	
	public List<CategoryVO> CategoryList(String catuCode);
	
	public List<ProdImageVO> findThumbnail(int prodNum);
	
//	public int deleteProdImage(int prodNum);
	
	// 시퀀스로 등록할 prodNum 가져오기
	public int getProdNum();
	
	public int insertThumbNail(ProdVO prodVO);
	
	public ProdVO sliceCategory(int prodNum);
	
	public int SearchProdImge (int prodNum);
	
	public int deletePrImg(String pImgName);
	
	public int changeInsertProdImages(ProdImageVO prodImageVO);
	
	public int hoteMainlUpdate(ProdVO prodVO);
	
	public ProdVO selectProdvo(int prodNum);
	
	public int retrieveComCount(PagingVO<ProdVO> pagingVO);
	
	public List<ProdVO> CompanyProductList(PagingVO<ProdVO> pagingVO);
	
	public int deleteProd(int prodNum);
	
	public int createCompanyInfo(CompanyInfoVO companyInfoVO);
	
	public List<AreaVO> findArea();
	
}
