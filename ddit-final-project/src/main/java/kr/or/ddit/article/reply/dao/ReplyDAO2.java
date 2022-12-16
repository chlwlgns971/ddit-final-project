package kr.or.ddit.article.reply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ReplyVO;


 /**
  * 게시글 댓글 관리(CRUD) 용 Persistence Layer
 * @author PC-03
 *
 */
//@Mapper
public interface ReplyDAO2 {

	public List<ReplyVO> selectReplyListArticle(PagingVO<ReplyVO> pagingVO);

	public int insertReplyArticle(ReplyVO reply);
	
	/**
	 * 한 게시글에 댓글 수 조회
	 * @param replyNum
	 * @return
	 */
	public int selectReplyCountArticle(int artNum);
	
	public int updateReplyArticle(ReplyVO reply);
	
	public int deleteReplyArticle(ReplyVO reply);
	
	public ReplyVO selectReplyArticle(@Param("replyNum") int replyNum);
	
}
