package kr.or.ddit.admin.service;

import java.util.List;

import kr.or.ddit.vo.ArticleVO;
import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.PagingVO;

public interface AdminManageNoticeService {
	
	// 공지사항에 해당하는 Article table의 데이터 행 수를 count하는 메서드
	public int retrieveNoticeCount(PagingVO<ArticleVO> pagingVO);
	// 해당 페이지에 해당하는 Article 객체가 담긴 list를 반환하는 메서드
	public List<ArticleVO> noticeList(PagingVO<ArticleVO> pagingVO);
	
	//게시글 리스트의 행을 클릭시 상세 보기를 위해 articleVO 객체를 가져오는 메서드
	public ArticleVO getArticleDetail(int artNum);
	
	// 공지사항을 등록하는 메서드
	public int insertNotice(ArticleVO article);
	
	// 공지사항 분류코드를 반환하는 메서드
	public List<CategoryVO> getNotiCat(String catuCode);
	// 공지사항 업데이트 메서드
	public int updateNotice(ArticleVO article);
	//공지사항 삭제 메서드
	public int delNotice(int artNum);
	
	
}
