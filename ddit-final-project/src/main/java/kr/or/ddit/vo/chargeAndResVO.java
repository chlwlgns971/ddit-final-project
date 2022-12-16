package kr.or.ddit.vo;

import lombok.Data;

@Data
public class chargeAndResVO {
	private String charCode;
	private String resCode;
	private Integer charPrice;
	private String resSdate;
	private String resEdate;
	private Integer resQty;
	private String memId;
	private Integer prodNum;
}
