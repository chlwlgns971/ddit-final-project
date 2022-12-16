package kr.or.ddit.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="complyId")
public class ComplyVO {
	@NotBlank
	private String memId;	
	@NotBlank
	private String complyId;
	@NotBlank
	private String complySdate;
	@NotBlank
	private String complyEdate;
	@NotBlank 
	private String complyDegree;
	@NotBlank
	private String complyState;
	@NotBlank
	private PersonalMemberVO memberVO;
	@NotBlank
	private int memEval;
	private String complyCheck;
	
}
