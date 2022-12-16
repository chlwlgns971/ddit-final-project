package kr.or.ddit.reply.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.reply.dao.ReplyDAO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	private ReplyDAO dao;

	
	@Override
	public List<ReplyVO> retrieveReplyList(PagingVO<ReplyVO> pagingVO) {
//		 페이징 처리 안함.
		pagingVO.setDataList(dao.selectReplyList(pagingVO));
		return pagingVO.getDataList();
	}
	
	@Transactional
	@Override
	public ServiceResult createReply(ReplyVO reply) {
		
		return dao.insertReply(reply)>0 ? ServiceResult.OK : ServiceResult.FAIL;
	}
	@Transactional
	@Override
	public ServiceResult modifyReply(ReplyVO reply) {
		
		ServiceResult result = null;
		int rowcnt = dao.updateReply(reply);
		result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		
		return result;
	}
	
	@Transactional
	@Override
	public ServiceResult removeReply(int replyNum) {
		ServiceResult result = null;
		int rowcnt = dao.deleteReply(replyNum);
		result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public int retrieveReplyCount(ReplyVO reply) {
		
		return dao.selectReplyCount(reply);
	}
	
	
	/* 하나의 댓글에 달린 대댓글수
	 * @see kr.or.ddit.reply.service.ReplyService#retrieveCountPnum(int)
	 */
	@Override
	public int retrieveCountPnum(int replyNum) {
		
		return dao.selectCountPnum(replyNum);
	}

	/* 한 게시글의 부모댓글의 MAX수를 찾고 부모댓글 추가할 시 MAX+1해서 메인댓글 추가.
	 * @see kr.or.ddit.reply.service.ReplyService#retrieveMaxReplyRef(int)
	 */
	@Override
	public Integer retrieveMaxReplyRef(int artNum) {
		int replyRef = 0;
		if(dao.selectMaxReplyRef(artNum) == null) {
			replyRef += 1;
		}
		else {
			replyRef =dao.selectMaxReplyRef(artNum);
		}
		return replyRef;
	}

}
