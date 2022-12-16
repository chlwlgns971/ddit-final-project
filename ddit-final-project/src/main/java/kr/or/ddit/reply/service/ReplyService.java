package kr.or.ddit.reply.service;

import java.util.List;


import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ReplyVO;

public interface ReplyService {
	
	/**
	 * 한 게시글 혹은 한 포스트에 대한 댓글list
	 * @param pagingVO
	 * @return
	 */
	public List<ReplyVO> retrieveReplyList(PagingVO<ReplyVO> pagingVO);
	
	/**
	 * 댓글 추가
	 * @param reply
	 * @return
	 */
	public ServiceResult createReply(ReplyVO reply);
	
	
	/**
	 * 댓글 수정
	 * @param reply
	 * @return
	 */
	public ServiceResult modifyReply(ReplyVO reply);
	
	/**
	 * 댓글 삭제
	 * @param reply
	 * @return
	 */
	public ServiceResult removeReply(int replyNum);
	
	/**
	 * 한 게시글 혹은 한 포스트에 있는 댓글 수
	 * @param reply
	 * @return
	 */
	public int retrieveReplyCount(ReplyVO reply);
	
	/**
	 * 한 댓글에 달린 대댓글수
	 * @param replyNum
	 * @return
	 */
	public int retrieveCountPnum(int replyNum);
	
	/**
	 * 한 게시글의 부모댓글의 MAX수
	 * 
	 * 메인 댓글의 MAx를 찾아서 MAX+1해서 메인댓글 추가.
	 * 
	 * @param artNum
	 * @return
	 */
	public Integer retrieveMaxReplyRef(int artNum);
	
	
}
