package kr.or.ddit.prod.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import kr.or.ddit.prod.dao.ProdDAO;
import kr.or.ddit.prod.image.dao.ProdImageDAO;
import kr.or.ddit.vo.AreaVO;
import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.CompanyInfoVO;
import kr.or.ddit.vo.HotelRoomVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ProdImageVO;
import kr.or.ddit.vo.ProdVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class ProdServiceImpl implements ProdService {
	@Inject
	private final ProdDAO prodDAO;
	@Inject
	private ProdImageDAO prodImageDAO;
	
	@Value("#{appInfo.prodImageFolder}")
	private Resource attatchFolder;
	
	private File saveFolder;
	
	@PostConstruct
	public void init() throws IOException {
		saveFolder = attatchFolder.getFile();
	}
	
	
	
	@Override
	public CompanyInfoVO SelectCompanyInfo(String comId) {
		CompanyInfoVO companyInfoVO=prodDAO.SelectCompanyInfo(comId);
		return companyInfoVO;
	}
	
	@Override
	public int createProd(ProdVO prodVO) {
		log.info("createProd ProdVO: {}",prodVO.toString());
		int rowcnt=prodDAO.insertProduct(prodVO);
		int prodNum=prodVO.getProdNum();
		List<ProdImageVO> prodImageList;
		// 이미지 등록을 하지 않은 경우 체크
		if(!(null==prodVO.getProdImageList()||prodVO.getProdImageList().size()<0)) {
			prodImageList = prodVO.getProdImageList();
			for(ProdImageVO prod: prodImageList) {
				prod.setProdNum(prodVO.getProdNum());
			}
		}
		
		rowcnt+=processProdImageList(prodVO);
		
		return rowcnt;
	}

	@Override
	public List<AreaVO> selectArea(AreaVO areaVO) {
		List<AreaVO> areaList=prodDAO.selectArea(areaVO);
		return areaList;
	}

	@Override
	public List<ProdImageVO> retrieveProdImage(int prodNum) {
		List<ProdImageVO> prodImage=prodImageDAO.selectProdImages(prodNum);
		return prodImage;
	}

	@Override
	public int processProdImageList(ProdVO prodVO) {
		int rowcnt = 0;
		List<ProdImageVO> prodImageList=prodVO.getProdImageList();
		if(prodImageList!=null && !prodImageList.isEmpty()){
			// 메타데이터 저장
			rowcnt=prodImageDAO.insertProdImages(prodVO);
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

//	@Override
//	public int processDeleteProdImage(ProdVO prodVO) {
//		String[] delProdImageName= prodVO.getDelProdImageName();
//		if(delProdImageName==null||delProdImageName.length==0) return 0;
//		Arrays.sort(delProdImageName);
//		List<ProdImageVO> prodImageList=prodDAO.selectProd(prodVO.getProdNum()).getProdImageList();
//		
//		List<String> saveNames = prodImageList.stream()
//				.filter(prodImage->{
//					return Arrays.binarySearch(delProdImageName, prodImage.getPImgName()) >= 0;
//				}).map(prodImage->{
//					return prodImage.getPImgOname();
//				}).collect(Collectors.toList());
//		int rowcnt=prodImageDAO.deleteProdImages(prodVO.getProdNum());
//		//2진데이터삭제
//		if(!saveNames.isEmpty()) {
//			for(String pImageOname:saveNames) {
//				File deleteFile = new File(saveFolder, pImageOname);
//				FileUtils.deleteQuietly(deleteFile);
//			}
//		}
//		
//		return rowcnt;
//	}
	
	@Override
	public int modifyProd(ProdVO prodVO) {
		int rowcnt=prodDAO.updateProd(prodVO);
		// 1. 신규파일등록  : 2진, 메타데이타
		rowcnt+=processProdImageList(prodVO);
//		processDeleteProdImage(prodVO);
		return rowcnt;
	}



	@Override
	public AreaVO selectAreaCode(String areaName) {
		AreaVO area=prodDAO.selectAreaCode(areaName);
		return area;
	}



//	@Override
//	public CategoryVO selectCategory(CategoryVO categoryVO) {
//		// TODO Auto-generated method stub
//		return null;
//	}



	@Override
	public List<CategoryVO> CategoryList(String catuCode) {
		List<CategoryVO> categoryList=prodDAO.CategoryList(catuCode);
		return categoryList;
	}



	@Override
	public List<ProdImageVO> findThumbnail(int prodNum) {
		List<ProdImageVO> ProdImageList= prodDAO.findThumbnail(prodNum);
		return ProdImageList;
	}



	@Override
	public int getProdNum() {
		return prodDAO.getProdNum();
	}



	@Override
	public int insertThumbNail(ProdVO prodVO) {
		return prodDAO.insertThumbNail(prodVO);
	}



	@Override
	public ProdVO sliceCategory(int prodNum) {
		return prodDAO.sliceCategory(prodNum);
	}



	@Override
	public int SearchProdImge(int prodNum) {
		return prodImageDAO.SearchProdImge(prodNum);
	}



	@Override
	public int deletePrImg(String pImgName) {
		return prodImageDAO.deletePrImg(pImgName);
	}



	@Override
	public int changeInsertProdImages(ProdImageVO prodImageVO) {
		return prodImageDAO.changeInsertProdImages(prodImageVO);
	}


	@Override
	public int hoteMainlUpdate(ProdVO prodVO) {
	return prodDAO.hoteMainlUpdate(prodVO);
	}



	@Override
	public ProdVO selectProdvo(int prodNum) {
		return prodDAO.selectProdvo(prodNum);
	}



	@Override
	public int retrieveComCount(PagingVO<ProdVO> pagingVO) {
		return prodDAO.retrieveCPCount(pagingVO);
	}



	@Override
	public List<ProdVO> CompanyProductList(PagingVO<ProdVO> pagingVO) {
		return prodDAO.companyProductList(pagingVO);
	}



//	@Override
//	public int deleteProdImage(int prodNum) {
//		return prodImageDAO.deleteProdImage(prodNum);
//	}



	@Override
	public int deleteProd(int prodNum) {
		return prodDAO.deleteProd(prodNum);
	}



	@Override
	public int createCompanyInfo(CompanyInfoVO companyInfoVO) {
		return prodDAO.createCompanyInfo(companyInfoVO);
	}



	@Override
	public List<AreaVO> findArea() {
		return prodDAO.findArea();
	}


}
