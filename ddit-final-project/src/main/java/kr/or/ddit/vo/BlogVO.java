package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class BlogVO {
	private String blogId;
	private String blogName;
	private Integer blogTemp;
	private String blogNickname;
	private String blogIntro;
	
	//블로그 카테고리 정보를 담는 리스트
	List<BlogCateVO> category;	
	//프로필사진 이미지
	private String accImg;
}
