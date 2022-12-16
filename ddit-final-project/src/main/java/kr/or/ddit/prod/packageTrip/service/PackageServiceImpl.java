package kr.or.ddit.prod.packageTrip.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.prod.packageTrip.dao.PackageDAO;
import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.PackageVO;
@Service
public class PackageServiceImpl implements PackageService {
	@Inject
	private PackageDAO dao;
	
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
	public PackageVO selectPackage(int pkgNum) {
		return dao.selectPackage(pkgNum);
	}

}
