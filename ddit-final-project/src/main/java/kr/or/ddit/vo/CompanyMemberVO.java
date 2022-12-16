package kr.or.ddit.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="comId")
public class CompanyMemberVO {
	@NotBlank
	private String comId;
	@NotBlank
	private String comCnam;
	@NotBlank
	private String comHphon;
	@NotBlank
	private String comNam;
	@NotBlank
	private String comPhon;
	@NotBlank
	private String comAddr;
	private String comLatit;
	private String comLngit;
	private String comPolicy;
	@NotBlank
	private String comImg;
	@NotBlank
	private String comRnum;
	@NotBlank
	private String comCode;
	@NotBlank
	private String comMail;
	@NotBlank
	private String comCons;
	@NotBlank
	private String comLogin;
	private String comAddr2;
	private String accIntro;
}
