package kr.or.ddit.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="sancNum")
@ToString(exclude="sancResn")
public class SanctionVO {
	
	@NotBlank(groups= {UpdateGroup.class, DeleteGroup.class})
	private Integer sancNum;
	
	@NotBlank(groups=InsertGroup.class)
	private String sancCode;
	
	private String sancResn;
	
	@NotBlank(groups=InsertGroup.class)
	private String sancSdate;
	
	@NotBlank(groups=InsertGroup.class)
	private String sancEdate;
	
	@NotNull(groups= InsertGroup.class)
	private Integer repNum;
	
	@NotNull(groups=InsertGroup.class)
	private String adminId;
}
