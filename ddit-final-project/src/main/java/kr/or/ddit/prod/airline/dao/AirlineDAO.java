package kr.or.ddit.prod.airline.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.CategoryVO;
@Mapper
public interface AirlineDAO {

	public List<CategoryVO> getContinents();
	public List<CategoryVO> getNations(String continentName);
	public List<CategoryVO> getcities(String countryName);
}
