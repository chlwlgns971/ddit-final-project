package kr.or.ddit.prod.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.AreaVO;
import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.CompanyInfoVO;
import kr.or.ddit.vo.CompanyProductVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ProdImageVO;
import kr.or.ddit.vo.ProdVO;

@Mapper
public interface ProdDAO {
	public CompanyInfoVO SelectCompanyInfo(String comId);

	public int insertProduct(ProdVO prodVO);

	public List<AreaVO> selectArea(AreaVO areaVO);

	public ProdVO selectProd(@Param("prodNum") int prodNum);

	public int updateProd(ProdVO prodVO);

	public int deleteProd(int prodNum);

	public AreaVO selectAreaCode(String AreaName);

	public List<CategoryVO> CategoryList(String catuCode);

	public List<ProdImageVO> findThumbnail(int prodNum);

	public int getProdNum();

	public int insertThumbNail(ProdVO prodVO);

	public ProdVO sliceCategory(int prodNum);

	public int hoteMainlUpdate(ProdVO prodVO);

	public ProdVO selectProdvo(int prodNum);
///////////////////////////////////////////////////////////////////
	public ProdVO selectCompanyProduct(String comId);

	public List<ProdVO> companyProductList(PagingVO pagingVO);

	// 페이징 처리를 위해 업체의 상품을 카운트한다.
	public int retrieveCPCount(PagingVO pagingVO);

	// 상품의 상세정보를 보는 메소드
	public ProdVO companyDetailProduct(int prodNum);

	// 지역코드를 지역이름으로 바꿔준다
	public AreaVO searchAreaName(AreaVO areaVO);
	
	public int createCompanyInfo(CompanyInfoVO companyInfoVO);
	
	public List<AreaVO> findArea();

}
