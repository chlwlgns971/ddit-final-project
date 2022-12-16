package kr.or.ddit.article.reply.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.article.reply.dao.ReplyDAO2;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ReplyVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
//@Service
public class ReplyServiceImpl2 implements ReplyService2{
	
	@Inject
	private ReplyDAO2 dao;

	
	@Override
	public List<ReplyVO> retrieveReplyListArticle(PagingVO<ReplyVO> pagingVO) {
//		 페이징 처리 안함.
		pagingVO.setDataList(dao.selectReplyListArticle(pagingVO));
		return pagingVO.getDataList();
	}
	
	@Transactional
	@Override
	public ServiceResult createReplyArticle(ReplyVO reply) {
		
		return dao.insertReplyArticle(reply)>0 ? ServiceResult.OK : ServiceResult.FAIL;
	}
	@Transactional
	@Override
	public ServiceResult modifyReplyArticle(ReplyVO reply) {
		
		ServiceResult result = null;
		int rowcnt = dao.updateReplyArticle(reply);
		result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		
		return result;
	}
	
	@Transactional
	@Override
	public ServiceResult removeReplyArticle(ReplyVO reply) {
		ServiceResult result = null;
		int rowcnt = dao.deleteReplyArticle(reply);
		result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public int retrieveReplyCountArticle(int replyNum) {
		
		return dao.selectReplyCountArticle(replyNum);
	}

	@Override
	public ReplyVO retrieveReplyArticle(int replyNum) {
		ReplyVO reply = dao.selectReplyArticle(replyNum);
		if(reply == null) {
			throw new RuntimeException(String.format("%d 댓글번호의 댓글이 없음.", replyNum));
			
		}
		return reply;
		
	}

}
