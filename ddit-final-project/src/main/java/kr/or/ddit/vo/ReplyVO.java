package kr.or.ddit.vo;



import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 
 * 게시판 관리를 위한 Domain Layer
 *
 */

@Data
@EqualsAndHashCode
public class ReplyVO {
	
	@NotNull(groups= {UpdateGroup.class, DeleteGroup.class})
	private Integer replyNum;
	@NotBlank(groups= {InsertGroup.class, UpdateGroup.class})
	private String replyCont;
	private String replyDate;
	private Integer replyPnum;
	private String replyScope;
	private Integer postNum;
	private Integer artNum;
	// 답변글끼리 모으는 컬럼 
	private Integer replyRef;
	// 답변글 순서 
	private Integer replyReStep;
	// 답변글의 답변글
	private Integer replyReLevel;
	
	@NotNull
	private String accId;
	
	//블로그에서 사용하는 닉네임
	private String blogNickname;
	
	//댓글 프로필 사진
	private String accImg;
	
}
