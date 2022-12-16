package kr.or.ddit.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.admin.dao.AdminManageNoticeDAO;
import kr.or.ddit.vo.ArticleVO;
import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.PagingVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminManageNoticeServiceImpl implements AdminManageNoticeService {
	//dao 연결
	@Inject
	private AdminManageNoticeDAO dao;
	
	// 공지사항에 해당하는 Article table의 데이터 행 수를 count하는 메서드
	@Override
	public int retrieveNoticeCount(PagingVO<ArticleVO> pagingVO) {
		log.info("AdminManageNoticeServiceImpl.retrieveNoticeCount()");
		
		return dao.retrieveNoticeCount(pagingVO);
	}

	@Override
	public List<ArticleVO> noticeList(PagingVO<ArticleVO> pagingVO) {
		log.info("AdminManageNoticeServiceImpl.noticeList()");
		return dao.noticeList(pagingVO);
	}

	@Override
	public ArticleVO getArticleDetail(int artNum) {
		log.info("AdminManageNoticeServiceImpl.getArticleDetail()");
		return dao.getArticleDetail(artNum);
	}

	@Override
	public int insertNotice(ArticleVO article) {
		log.info("AdminManageNoticeServiceImpl.insertNotice()");
		return dao.insertNotice(article);
	}

	@Override
	public List<CategoryVO> getNotiCat(String catuCode) {
		return dao.getNotiCat(catuCode);
	}

	@Override
	public int updateNotice(ArticleVO article) {
		return dao.updateNotice(article);
	}

	@Override
	public int delNotice(int artNum) {
		return dao.delNotice(artNum);
	}

}
