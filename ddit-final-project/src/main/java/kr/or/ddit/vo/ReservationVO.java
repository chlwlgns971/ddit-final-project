package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ReservationVO {
	private String charCode;
	private String resCode;
	private String resDate;
	private String resSdate;
	private String resEdate;
	private String resStt;
	private Integer resQty;
	private Integer prodNum;
	private String memId;
	// 상품 총 가격이 담길 변수 (12.03 최지훈 추가)
	private int prodPrice;
	
	//결제내역 테이블과 조인해서 데이터를 가져오기 위한 필드
	private Integer charPrice;
	private String charDate;
	private String prodImg;
	private String prodNam;
}
