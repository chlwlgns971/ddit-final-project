package kr.or.ddit.member.company.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.AreaVO;
import kr.or.ddit.vo.CompanyProductVO;
import kr.or.ddit.vo.PagingVO;
@Mapper
public interface CompanyDAO {
	
	public CompanyProductVO selectCompanyProduct(String comId);
	
	public List<CompanyProductVO> companyProductList(PagingVO pagingVO);
	
	//	페이징 처리를 위해 업체의 상품을 카운트한다.
	public int retrieveCPCount(PagingVO pagingVO);
	
	//상품의 상세정보를 보는 메소드
	public CompanyProductVO companyDetailProduct(int prodNum);
	
	//지역코드를 지역이름으로 바꿔준다
	public AreaVO searchAreaName(AreaVO areaVO);
}
