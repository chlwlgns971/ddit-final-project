package kr.or.ddit.main.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.main.dao.MainDAO;
import kr.or.ddit.vo.MainVO;

@Service
public class MainServiceImpl implements MainService {
	@Inject
	private MainDAO dao;
	
	@Override
	public MainVO getMainInfo() {
		int memCount = dao.countMember();
		int comCount = dao.countCompany();
		int desCount = dao.countDestination();
		int roomCount = dao.countRoom();
		int packageCount = dao.countPackage();
		int carCount = dao.countCar();
		int prodCount = roomCount + packageCount + carCount;
		
		MainVO main = new MainVO();
		main.setComCount(comCount);
		main.setMemCount(memCount);
		main.setDestinationCount(desCount);
		main.setProdCount(prodCount);
		return main;
	}

}
