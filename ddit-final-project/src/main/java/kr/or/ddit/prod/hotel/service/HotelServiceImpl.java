package kr.or.ddit.prod.hotel.service;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import kr.or.ddit.prod.hotel.dao.HotelDAO;
import kr.or.ddit.prod.image.dao.ProdImageDAO;
import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.CompanyInfoVO;
import kr.or.ddit.vo.HotelRoomVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ProdImageVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class HotelServiceImpl implements HotelService {
	@Inject
	private HotelDAO dao;
	@Inject
	private ProdImageDAO piDao;

//	=======================김유리============================================
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

//	@Override
//	public HotelRoomVO retrieveHotel(int cinfoNum) {
//		return dao.selectHotel(cinfoNum);
//	}

	@Override
	public int retrieveHotelCount(PagingVO<HotelRoomVO> pagingVO) {
		return dao.selectTotalRecord(pagingVO);
	}

	@Override
	public List<HotelRoomVO> retrieveHotelList(PagingVO<HotelRoomVO> pagingVO) {
		return dao.selectHotelList(pagingVO);
	}

	@Override
	public List<HotelRoomVO> defaultList(PagingVO<HotelRoomVO> pagingVO) {
		// TODO Auto-generated method stub
		return dao.defaultList(pagingVO);
	}

	@Override
	public int defaultCount(PagingVO<HotelRoomVO> pagingVO) {
		// TODO Auto-generated method stub
		return dao.defaultTotalRecord(pagingVO);
	}

	@Override
	public CompanyInfoVO retrieveHotel(int cinfoNum) {
		// TODO Auto-generated method stub
		return dao.selectHotel(cinfoNum);
	}

	@Override
	public List<HotelRoomVO> retrieveRoomInfo(HotelRoomVO hotelRoomVO) {
		// TODO Auto-generated method stub
		return dao.selectRoomInfo(hotelRoomVO);
	}
//	=======================강명범============================================	

	@Override
	public int createHotelProduct(HotelRoomVO hotelRoomVO) {
		return dao.createHotelProduct(hotelRoomVO);
	}

	@Override
	public HotelRoomVO hotelRoomDetail(int prodNum) {
		return dao.hotelRoomDetail(prodNum);
	}

	@Override
	public int modifyProd(HotelRoomVO hotelRoomVO) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public List<ProdImageVO> retrieveHotelImage(int prodNum) {
		List<ProdImageVO> prodImage=piDao.selectProdImages(prodNum);
		return prodImage;
	}

	@Override
	public int hotelOptionlUpdate(HotelRoomVO hotelRoomVO) {
		return dao.hotelOptionlUpdate(hotelRoomVO);
	}

	@Override
	public int deleteHotel(int romNum) {
		return dao.deleteHotel(romNum);
	}
}
