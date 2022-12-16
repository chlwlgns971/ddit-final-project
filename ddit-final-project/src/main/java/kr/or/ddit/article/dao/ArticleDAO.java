package kr.or.ddit.article.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.ArticleVO;
import kr.or.ddit.vo.PagingVO;
import lombok.Data;

/**
 * 
 * 게시글 관리(Persistence Layer), CRUD
 *
 */
@Mapper
public interface ArticleDAO {
	/**
	 * 게시글 등록
	 * @param article
	 * @return 성공 : 1 실패 : 0
	 */
	public int insertArticle(ArticleVO article);
	/**
	 * 게시글 조회
	 * @param artNum 조회할 게시글번호
	 * @return 존재하지 않는다면, null 반환
	 */
	public ArticleVO selectArticle(@Param("artNum") int artNum);
	
	/**
	 * 조회수 증가
	 * @param artNum 증가할 게시글번호
	 * @return
	 */
	public int incrementArtHit(@Param("artNum") int artNum);
	
	/**
	 * 게시글 목록 조회
	 * @param pagingVO TODO
	 * @return size==0 테이블 empty
	 */
	public List<ArticleVO> selectArticleList(PagingVO<ArticleVO> pagingVO);
	
	/**
	 * 페이징 처리를 위한 totalRecord 조회
	 * @param pagingVO
	 * @return
	 */
	public int selectTotalRecord(PagingVO<ArticleVO> pagingVO);
	
	/**
	 * 게시글 수정
	 * @param member
	 * @return 성공 : 1 실패 : 0
	 */
	public int updateArticle(ArticleVO article);
	/**
	 * 게시글 삭제(??)
	 * @param memId
	 * @return 성공 : 1 실패 : 0
	 */
	public int deleteArticle(ArticleVO article);
	
	/**
	 * 좋아요 증가
	 * @param 
	 * @return
	 */
	public int incrementRec(int artNum);
	
	/**
	 * 게시글 목록 조회
	 * @param pagingVO TODO
	 * @return size==0 테이블 empty
	 */
	public List<ArticleVO> selectArticleListOption(PagingVO<ArticleVO> pagingVO);
	
	/**
	 * 페이징 처리를 위한 totalRecord 조회
	 * @param pagingVO
	 * @return
	 */
	public int selectTotalRecordOption(PagingVO<ArticleVO> pagingVO);
	
	
}
