package kr.or.ddit.vo;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PackageVO extends ProdVO {
	@NotNull (groups= {UpdateGroup.class, DeleteGroup.class})
	private Integer pkgNum;
	private Integer pkgPrice;
	private String pkgCont;
	private String pkgFlight;
	private String pkgSdate;
	private String pkgEdate;
}
