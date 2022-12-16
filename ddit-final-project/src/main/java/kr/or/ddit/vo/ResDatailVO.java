package kr.or.ddit.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class ResDatailVO {
	@NotBlank
	private String resCode;
	private String rdeFnam;
	private String rdeLnam;
	private String rdeMail;
	private String rdeNat;
	private String rdeAdd1;
	private String rdeAdd2;
}
