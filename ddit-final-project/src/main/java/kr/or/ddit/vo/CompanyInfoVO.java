package kr.or.ddit.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CompanyInfoVO {
	@NotNull(groups = {UpdateGroup.class, DeleteGroup.class})
	private Integer cinfoNum;
	private String cinfoTitle;
	private String cinfoInfo;
	private Integer cinfoArate;
	private String cinfoBcode;
	private Integer cinfoHit;
	@NotBlank
	private String comId;

	private String comAddr;
	private String comLatit;
	private String comLngit;
	private String romGrade;

	//12.03 최지훈 추가
	private String comMail;
	private String comHphon;

}
