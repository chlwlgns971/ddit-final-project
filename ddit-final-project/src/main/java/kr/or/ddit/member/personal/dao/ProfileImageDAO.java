package kr.or.ddit.member.personal.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.servlet.mvc.condition.ProducesRequestCondition;

import kr.or.ddit.vo.PersonalMemberVO;
import kr.or.ddit.vo.ProfileImageVO;

@Mapper
public interface ProfileImageDAO {
	/**
	 * 
	 * @param accountVO
	 * @return int 파일 업로드 1:성공  0:실패
	 */
	public int insertProfilImage(ProfileImageVO profileImage);
	
	public ProfileImageVO retrieveImgInfo(String memId);

	public int countImg(String accId);
	
	public int countImageInfo(String accId);
	/**
	 * 기존 프로파일 이미지 삭제를 위한 메소드
	 * @param accId
	 * @return
	 */
	public int deleteProfilImage(String accId);
	/**
	 * 상품의 사진을 입력하는 메소드
	 * @param prodNum
	 * @return
	 */
	public int insertProdImageList(int prodNum);

	
}
