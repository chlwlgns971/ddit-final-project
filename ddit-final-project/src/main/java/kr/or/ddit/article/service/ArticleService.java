package kr.or.ddit.article.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.ArticleVO;
import kr.or.ddit.vo.PagingVO;

/**
 * 게시판 관리용 Business Logic Layer
 *
 */
public interface ArticleService {
	
	/**
	 * 게시글 등록
	 *
	 */
	public ServiceResult createArticle(ArticleVO article);
	
	/**
	 * 게시글 조회
	 * @param artNum
	 * @return
	 */
	public ArticleVO retrieveArticle(int artNum);
	
	/**
	 * 게시글리스트 조회 페이징
	 * @param pagingVO
	 * @return
	 */
	public List<ArticleVO> retrieveArticleList(PagingVO<ArticleVO> pagingVO);
	
	/**
	 * 게시글조회수
	 * @param pagingVO
	 * @return
	 */
	public int retrieveArticleCount(PagingVO<ArticleVO> pagingVO);
	
	/**
	 * 게시글 수정(인증 필요)
	 * @param article
	 * @return RuntimeException, OK, FAIL
	 */
	public ServiceResult modifyArticle(ArticleVO article);
	
	/**
	 * 게시글 삭제(인증 필요)
	 * @param article
	 * @return RuntimeException, OK, FAIL
	 */
	public ServiceResult removeArticle(ArticleVO article);
	
	/**
	 * 갱신된 종아요수
	 * @param artNo
	 * @return
	 */
	public int recommend(int artNum);
	
	/**
	 * 게시글리스트 조회 페이징
	 * @param pagingVO
	 * @return
	 */
	public List<ArticleVO> retrieveArticleListOption(PagingVO<ArticleVO> pagingVO);
	
	/**
	 * 게시글조회수
	 * @param pagingVO
	 * @return
	 */
	public int retrieveArticleCountOption(PagingVO<ArticleVO> pagingVO);
	
	
	
	
}
