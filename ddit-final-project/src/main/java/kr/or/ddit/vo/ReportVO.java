package kr.or.ddit.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

//

@Data
@EqualsAndHashCode(of="repNum")
@ToString(exclude= {"repCont"})
public class ReportVO {
	
	@NotNull(groups= {UpdateGroup.class, DeleteGroup.class})
	private Integer repNum;
	
	@NotBlank(groups=InsertGroup.class)
	private String memId;

	@NotNull(groups=InsertGroup.class)
	private Integer artNum;
	
	private String repCont;
	@NotBlank(groups=InsertGroup.class)
	private String repCode;
	
	@NotBlank(groups=InsertGroup.class)
	private String repBcode;
	
	@NotBlank(groups=InsertGroup.class)
	private String repId;
	
	
	
}
