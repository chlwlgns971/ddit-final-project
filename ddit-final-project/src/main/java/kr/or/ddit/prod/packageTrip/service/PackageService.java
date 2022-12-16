package kr.or.ddit.prod.packageTrip.service;

import java.util.List;

import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.PackageVO;

public interface PackageService {
	public List<CategoryVO> getContinents();
	public List<CategoryVO> getNations(String continentName);
	public List<CategoryVO> getcities(String countryName);
	public PackageVO selectPackage(int pkgNum);
	
}
