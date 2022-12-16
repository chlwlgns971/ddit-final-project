package kr.or.ddit.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="prodNum")
public class CompanyProductVO {
	
	private int prodNum;
	private String prodNam;
	private Integer prodQty;
	private String prodCode;
	private String cinfoNum;
	private String areaName;
	private String comId;
	private String prodImg;
}
