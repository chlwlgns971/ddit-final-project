package kr.or.ddit.vo;


import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
@EqualsAndHashCode(of="artNum")
public class ArticleVO{
	
	
	@NotNull(groups= {UpdateGroup.class, DeleteGroup.class})
	private Integer artNum;
	@NotBlank
	private String artTitle;
	private String artCont;
	private String artDate;
	private String artCCode;
	private String artBCode;
	private Integer artHit;
	private Integer artRec;
	
	@NotBlank(groups=InsertGroup.class)
	private String accId;
	
	@JsonIgnore
	private transient int startNo;
	
}
