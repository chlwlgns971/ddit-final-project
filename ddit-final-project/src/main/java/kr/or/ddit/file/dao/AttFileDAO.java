package kr.or.ddit.file.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.AttFileVO;

@Mapper
public interface AttFileDAO {
	/**
	 * 게시글 이미지(첨부파일) 정보를 DB에 저장
	 * @param file 첨부파일 정보가 담긴 VO
	 * @return 성공 : 1, 실패 : 0
	 */
	public int insertAttFile(AttFileVO file);
	
	/**
	 * 게시글 등록 후 파일테이블에서 게시글 번호 or 블로그 포스트 번호 업데이트
	 * @param accId 작성자 id
	 * @param postNum 블로그 글 번호 (값이 존재 하지 않으면 0)
	 * @param artNum 게시글 글 번호 (값이 존재하지 않으면 0)
	 * @return 성공 : 1, 실패 : 0
	 */
	public int updateAttFile(Map<String, Object> map);
	
	/**
	 * 블로그 포스트를 삭제할 때 포스트에 연결된 파일들을 삭제
	 * @param postnum 블로그 포스트 번호
	 * @return 성공 : 1, 실패 : 0
	 */
	public int deletePostFile(int postnum);
	
	/**
	 * 게시글 삭제할 때 게시글에 연결된 파일들을 삭제
	 * @param artNum 게시글 번호
	 * @return 성공 : 1, 실패 : 0
	 */
	public int deleteArtFile(int artNum);
	
	/**
	 * 포스트에 첨부된 파일을 찾아 List타입으로 저장명 반환
	 * @param postNum 포스트 번호
	 * @return
	 */
	public List<String> getPostFileUrl(int postNum);
	
	/**
	 * 게시글에 첨부된 파일을 찾아 List타입으로  저장명 반환
	 * @param artNum 게시글 번호
	 * @return
	 */
	public List<String> getArticleFileUrl(int artNum);
}
