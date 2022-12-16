package kr.or.ddit.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class AreaVO {
	@NotBlank
	private String areaCode; //지역코드
	private String areaName; //지역이름
	private String natCode; //국가코드
	private String catName; //국가이름
	private String catuCode; //국가분류코드
}
