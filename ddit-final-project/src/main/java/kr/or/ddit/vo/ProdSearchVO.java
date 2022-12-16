package kr.or.ddit.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//searchGROUP 만들어서 검색조건에 들어가는 notNull추가하기
//'PROD','PRODIMG','COMREV','COMIMG', 'RESERVATION', 'COMINFO', 'COMPANY'가 모두 담긴 논리VIEW개념의 VO
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProdSearchVO {
	
	private String cimgName;
	private String cimgOname;
	private String cimgExt;
	private Integer cimgSize;
	private String cimgFsize;
	private Integer cinfoNum;
	private String revNum;
	private String revCont;
	private String revDate;
	private Integer revRate;
	private Integer revPnum;
	private String accId;
	private Integer prodNum;
	private String prodNam;
	private Integer prodQty;
	private String prodCode;
	private String areaCode;
	private String comId;
	private Integer resNum;
	private String resDate;
	private String resSdate;
	private String resEdate;
	private String resStt;
	private Integer resQty;
	private String memId;
	private String comCnam;
	private String comHphon;
	private String comNam;
	private String comPhon;
	private String comAddr;
	private Integer comLatit;
	private Integer comLngit;
	private String comPolicy;
	private String comImg;
	private String comRnum;
	private String comCode;
	private String comMail;
	private String comCons;
	private String comInfo;
	private String comLogin;
	private String comRimg;
	private String cinfoTitle;
	private String cinfoInfo;
	private Integer cinfoArate;
	private String cinfoBcode;
	private Integer cinfoHit;
	private String pimgName;
	private String pimgOname;
	private Integer pimgSize;
	private String pimgFsize;
	private String pimgLocat;
}
