package kr.or.ddit.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.Data;

@Data
public class BlogPostVO extends BlogVO{
	@NotNull(groups= {UpdateGroup.class, DeleteGroup.class})
	private Integer postNum; //포스트 번호
	@NotBlank(groups=InsertGroup.class)
	private String postTitle; // 포스트 제목
	@NotBlank(groups=InsertGroup.class)
	private String postCont; // 포스트 내용
	private String postDate; // 작성일
	@NotBlank(groups=InsertGroup.class)
	private String postScope; // 공개범위
	private Integer postRec; // 추천수
	private Integer postHit; // 조회수
	@NotBlank(groups=InsertGroup.class)
	private String bcateNum; // 카테고리 번호
	private String bcateName; // 카테고리 이름
	private String blogId; // 블로그 이름
	private String postThum; // 포스트 썸네일
	
	// 추천 여부 확인용 변수. 0보다 크면 추천함. 0이라면 추천안함.
	private int isChecked;
	int rowNum;
	private String blogName = BlogPostVO.this.getBlogName();
	
	//댓글 수 
	private Integer countReply;
}
