package kr.or.ddit.admin.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.AccountVO;
import kr.or.ddit.vo.ProfileImageVO;


@Mapper
public interface AdminInfoDAO {
	
	// 유저의 정보를 반환하는 메서드
	public HashMap<String, Object> getUserInfo(String userId);
	
	// 유저의 pw를 반환하는 메서드
	public String getUserPW(String userId);
	
	//유저의 pw를 변경하는 메서드
	public int setNewPassword(AccountVO accountEdit);
	
	// 해당 유저의 소개글을 변경하는 메서드
	public int setNewIntro(AccountVO accountEdit);
	
	// 기존 이미지 메타 데이터 수를 반환하는 메서드
	public int getImageData(String userId);
	
	// 기존 이미지 데이터 존재할 경우 실행되는 메서드로 해당 이미지 데이터를 삭제함.
	public int deleteImgdata(String userId);
	
	// DB에 이미지파일을 등록하는 메서드
	public int insertImgData(ProfileImageVO profileImg);
	
	// 새로운 이미지 파일의 저장명을 계정 테이블에 등록
	public int UpdateImgData(AccountVO account);

}
