package kr.or.ddit.vo;

import javax.validation.constraints.NotNull;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.Data;

@Data
public class CalenderVO extends AreaVO{
	@NotNull(groups= {UpdateGroup.class, DeleteGroup.class})
	private Integer calNum;
	private String calWdate;
	private String calSdate;
	private String calEdate;
	
	//배너이미지
	private String bannerImg;
}
