package kr.or.ddit.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class DestinationVO extends AreaVO{
	@NotBlank
	private String destInfo;
	private String destConv;
	private String destAir;
	private String destBanner;
	private String destWimg;
	private String destImg1;
	private String destImg2;
	private String destImg3;
	private String destLang;
	private String destExten;
	private String destPopul;
	private String destTime;
	private String destRelig;
	private String destVolt;
	private String destCur;
	private String destVisa;
	private String destPrice;
	private String destWeather;
	private String destBtime;
}
