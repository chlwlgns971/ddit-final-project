package kr.or.ddit.article.reply.service;

import java.util.List;


import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ReplyVO;

public interface ReplyService2 {
	public List<ReplyVO> retrieveReplyListArticle(PagingVO<ReplyVO> pagingVO);
	public ServiceResult createReplyArticle(ReplyVO reply);
	
	public ServiceResult modifyReplyArticle(ReplyVO reply);
	
	public ServiceResult removeReplyArticle(ReplyVO reply);
	
	public int retrieveReplyCountArticle(int artNum);
	
	public ReplyVO retrieveReplyArticle(int replyNum);
	
}
