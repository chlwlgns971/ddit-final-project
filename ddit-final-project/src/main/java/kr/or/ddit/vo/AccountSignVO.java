package kr.or.ddit.vo;


import java.io.Serializable;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="accId")
@ToString
public class AccountSignVO implements Serializable{
	
	//관리자
	@NotBlank
	@Size(min=4,max=12)
	private String accId;
	@NotBlank
	@Size(min=8,max=16)
	private String accPw;
	private String accRdate;
	private String accStat;
	private String memCode;
	
	// 일반회원
	private String memId;
	private String memKln;
	private String memKfn;
	private String memEln;
	private String memEfn;
	private String memBirth;
	private String memNat;
	private String memGend;
	private String memHphon;
	private String memPhon;
	private String memMail;
	private String memAddr;
	private String memDaddr;
	private String memCons;
	private String memLogin;
	private String memGrade;
	private double memEval;
	private int memMil;

	//사업자회원
	private String comId;
	private String comCnam;
	private String comHphon;
	private String comNam;
	private String comPhon;
	private String comAddr;
	private String comAddr2;
	private String comPolicy;
	private String comRnum;
	private String comCode;
	private String comMail;
	private String comCons;
	private String comLogin;
	private String comRimg;
	
	//임시속성
	private String sumMail;
	
}
