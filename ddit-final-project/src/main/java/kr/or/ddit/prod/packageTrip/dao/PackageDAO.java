package kr.or.ddit.prod.packageTrip.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.PackageVO;

@Mapper
public interface PackageDAO {
	public List<CategoryVO> getContinents();
	public List<CategoryVO> getNations(String continentName);
	public List<CategoryVO> getcities(String countryName);
	public PackageVO selectPackage(int pkgNum);
}
