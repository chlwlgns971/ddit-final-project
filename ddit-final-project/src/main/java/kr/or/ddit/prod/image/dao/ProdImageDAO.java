package kr.or.ddit.prod.image.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.ProdImageVO;
import kr.or.ddit.vo.ProdVO;
import kr.or.ddit.vo.ProfileImageVO;

@Mapper
public interface ProdImageDAO {
	/**
	 * 게시글의 첨부파일의 메타데이터를 한번에 insert.
	 * @param rentCar
	 * @return
	 */
	public int insertProdImages(ProdVO prodVO);
	
	//업체회원의 상품이미지 리스트를 보기 위한 메소드
	public List<ProdImageVO> selectProdImages(int prodNum);
	/**
	 * 상품 수정시 한건 한건의 파일의 메타데이터 삭제용.
	 * @param delProdImageName
	 * @return
	 */
//	public int deleteProdImage(int prodNum);
	/**
	 * 게시글에 첨부된 모든 파일의 메타데이터 삭제용.
	 * @param boNo
	 * @return
	 */
	public int deleteProdImages(int prodNum);
	/**
	 * 상품이미지의 개수를 구한다.
	 * @param prodNum
	 * @return
	 */
	public int SearchProdImge (int prodNum);
	public int deletePrImg(String pImgName);
	public int changeInsertProdImages(ProdImageVO prodImageVO);
}
