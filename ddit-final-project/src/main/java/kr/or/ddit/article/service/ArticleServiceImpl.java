package kr.or.ddit.article.service;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.article.dao.ArticleDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.AccountVO;
import kr.or.ddit.vo.AccountVOWrapper;
import kr.or.ddit.vo.ArticleVO;
import kr.or.ddit.vo.PagingVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class ArticleServiceImpl implements ArticleService {
	private final ArticleDAO articleDAO;
	
	@Transactional
	@Override
	public ServiceResult createArticle(ArticleVO article) {
		int rowcnt = articleDAO.insertArticle(article); // 1

		log.info("article: {}", article);
		log.info("rowcnt: {}", rowcnt);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ArticleVO retrieveArticle(int artNum) {
		ArticleVO article = articleDAO.selectArticle(artNum);
		if (article == null)
			throw new RuntimeException(String.format("%d 글번호의 글이 없음.", artNum));
		articleDAO.incrementArtHit(artNum);
		log.info("article의 조회수를 증가하고 article를 다시 찾아서 담아준다.");
		article = articleDAO.selectArticle(artNum);

		log.info("article: {}", article);
		return article;
	}

	@Override
	public List<ArticleVO> retrieveArticleList(PagingVO<ArticleVO> pagingVO) {
		return articleDAO.selectArticleList(pagingVO);
	}
	
	@Override
	public int retrieveArticleCount(PagingVO<ArticleVO> pagingVO) {
		
		return articleDAO.selectTotalRecord(pagingVO);
	}

	@Transactional
	@Override
	public ServiceResult modifyArticle(ArticleVO article) {
		
		ServiceResult result = null;
		
		int rowcnt = articleDAO.updateArticle(article);
		result = rowcnt >0? ServiceResult.OK : ServiceResult.FAIL;
		
		log.info("result: {}", result);
		return result;
	}
	
	@Transactional
	@Override
	public ServiceResult removeArticle(ArticleVO article) {
		ServiceResult result = null;
		int rowcnt = articleDAO.deleteArticle(article);
		result = rowcnt > 0? ServiceResult.OK : ServiceResult.FAIL;

		log.info("result: {}", result);
		return result;
	}

	@Override
	public int recommend(int artNum) {
		articleDAO.incrementRec(artNum);
		return articleDAO.selectArticle(artNum).getArtRec();
		
	}

	@Override
	public List<ArticleVO> retrieveArticleListOption(PagingVO<ArticleVO> pagingVO) {
		
		return articleDAO.selectArticleListOption(pagingVO);
	}

	@Override
	public int retrieveArticleCountOption(PagingVO<ArticleVO> pagingVO) {
		
		return articleDAO.selectTotalRecordOption(pagingVO);
	}
	

}
