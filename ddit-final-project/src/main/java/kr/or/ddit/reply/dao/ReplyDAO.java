package kr.or.ddit.reply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ReplyVO;


 /**
  * 게시글 및 포스트 댓글 관리(CRUD) 용 Persistence Layer
 * @author PC-03
 *
 */
@Mapper
public interface ReplyDAO {

	/**
	 * 게시글 혹은 포스트에 작성된 댓글list
	 * @param pagingVO
	 * @return
	 */
	public List<ReplyVO> selectReplyList(PagingVO<ReplyVO> pagingVO);
	
	/**
	 * 블로그 포스트에 작성된 댓글list
	 * @param postNum : 블로그 포스트 번호
	 * @return
	 */
	public List<ReplyVO> getBlogReplyList(int postNum);


	/**
	 * 댓글 추가 
	 * @param reply
	 * @return
	 */
	public int insertReply(ReplyVO reply);

	
	/**
	 * 댓글 수정
	 * @param reply
	 * @return
	 */
	public int updateReply(ReplyVO reply);
	
	/**
	 * 댓글 삭제
	 * @param reply
	 * @return
	 */
	public int deleteReply(int replyNum);
	
	/**
	 * 한 게시글 혹은 한 포스트의 댓글수 조회
	 * @param replyNum
	 * @return
	 */
	public int selectReplyCount(ReplyVO replyvo);
	
	
	/**
	 * 하나의 댓글에 달린 대댓글수
	 * @param replyNum
	 * @return
	 */
	public int selectCountPnum(int replyNum); 
	
	
	/**
	 * 한 게시글의 부모댓글의 MAx수
	 * 
	 * 메인댓글의 MAX를 찾아서 맨 아래 댓글 추가시 MAX+1해서 메인댓글 추가.
	 * 
	 * @param artNum
	 * @return
	 */
	public Integer selectMaxReplyRef(int artNum);
}
