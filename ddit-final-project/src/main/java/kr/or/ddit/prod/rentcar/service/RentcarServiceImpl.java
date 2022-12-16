package kr.or.ddit.prod.rentcar.service;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.apache.commons.io.FileUtils;

import kr.or.ddit.prod.image.dao.ProdImageDAO;
import kr.or.ddit.prod.rentcar.dao.RentcarDAO;
import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.HotelRoomVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ProdImageVO;
import kr.or.ddit.vo.ProdWishVO;
import kr.or.ddit.vo.RentCarVO;
import lombok.RequiredArgsConstructor;

@Service
//@RequiredArgsConstructor
public class RentcarServiceImpl implements RentcarService {
	@Inject
	private RentcarDAO dao;
	@Inject
	private ProdImageDAO prodImageDAO;
	
	
	@Value("#{appInfo.prodImageFolder}")
	private Resource attatchFolder;
	
	private File saveFolder;
	
	@PostConstruct
	public void init() throws IOException {
		saveFolder = attatchFolder.getFile();
	}
	
	//상품글 등록시이미지 삽입을 하기 위한 메소드
	@Override
	public int processProdImageList(RentCarVO rentCarVO) {
		int rowcnt = 0;
		List<ProdImageVO> prodImageList=rentCarVO.getProdImageList();
		if(prodImageList!=null && !prodImageList.isEmpty()){
			// 메타데이터 저장
			rowcnt=prodImageDAO.insertProdImages(rentCarVO);
			// 2진 데이터 저장
			for(ProdImageVO prodImage : prodImageList) {
				try {
					prodImage.saveTo(saveFolder);
				} catch (IOException e) {
					throw new RuntimeException(e);
				}
			}
		}
		return rowcnt;
	}
	
	@Override
	public int modifyProd(RentCarVO rentCarVO) {
		int rowcnt=dao.updateProd(rentCarVO);
		// 1. 신규파일등록  : 2진, 메타데이타
		rowcnt+=processProdImageList(rentCarVO);
		processDeleteProdImage(rentCarVO);
		return rowcnt;
	}
	
	@Override
	public int createRentCarProduct(RentCarVO rentCarVO) {
		return dao.createRentCarProduct(rentCarVO);
	}
	
	@Override
	public int processDeleteProdImage(RentCarVO rentCarVO) {
		int rowcnt=0;
		String[] delProdImageNo= rentCarVO.getDelProdImageName();
		if(delProdImageNo==null||delProdImageNo.length==0) return 0;
		Arrays.sort(delProdImageNo);
		List<ProdImageVO> prodImageList=dao.rentCarDetail(rentCarVO.getProdNum()).getProdImageList();
		
		List<String> saveNames = prodImageList.stream()
				.filter(prodImage->{
					return Arrays.binarySearch(delProdImageNo, prodImage.getPImgName()) >= 0;
				}).map(prodImage->{
					return prodImage.getPImgOname();
				}).collect(Collectors.toList());
//		int rowcnt=prodImageDAO.deleteProdImages(delProdImageNo);
		//2진데이터삭제
		if(!saveNames.isEmpty()) {
			for(String pImageOname:saveNames) {
				File deleteFile = new File(saveFolder, pImageOname);
				FileUtils.deleteQuietly(deleteFile);
			}
		}
		
		return rowcnt;
	}
	
	@Override
	public int createProd(RentCarVO rentCarVO) {
		int rowcnt=dao.createProduct(rentCarVO);
		rowcnt+=processProdImageList(rentCarVO);
		return rowcnt;
	}

	@Override
	public List<CategoryVO> getContinents() {
		return dao.getContinents();
	}

	@Override
	public List<CategoryVO> getNations(String continentName) {
		return dao.getNations(continentName);
	}
	
	@Override
	public List<CategoryVO> getcities(String countryName) {
		return dao.getcities(countryName);
	}

	@Override
	public RentCarVO rentCarDetail(int prodNum) {
		return dao.rentCarDetail(prodNum);
	}

	@Override
	public List<ProdImageVO> retrieveRentCarImage(int prodNum) {
		List<ProdImageVO> prodImage=prodImageDAO.selectProdImages(prodNum);
		return prodImage;
	}

	@Override
	public List<RentCarVO> retrieveRentCarList(PagingVO<RentCarVO> pagingVO) {
		return dao.selectRentCarList(pagingVO);
	}

	@Override
	public int retrieveRentCarCount(PagingVO<RentCarVO> pagingVO) {
		return dao.selectTotalRecord(pagingVO);
	}

	@Override
	public int defaultCount(PagingVO<RentCarVO> pagingVO) {
		return dao.defaultTotalRecord(pagingVO);
	}

	@Override
	public List<RentCarVO> defaultList(PagingVO<RentCarVO> pagingVO) {
		return dao.defaultList(pagingVO);
	}
	@Override
	public RentCarVO retrieveRentCar(int prodNum) {
		return dao.selectRentcar(prodNum);
	}

	@Override
	public int deleteRentCar(int prodNum) {
		// TODO Auto-generated method stub
		return dao.deleteRentCar(prodNum);
	}



	
}
