package kr.or.ddit.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="couNum")
public class CouponVO {
	private Integer couNum;
	@NotBlank
	private String couNam;
	private Integer couQty;
	@NotBlank
	private String couSdate;
	@NotBlank
	private String couEdate;
	@NotBlank
	private String couCode;
	@NotNull
	private Integer couDisc;
	@NotBlank
	private String accId;
	@NotBlank
	private String couCate;
	@NotNull
	private Integer couMin;
}
