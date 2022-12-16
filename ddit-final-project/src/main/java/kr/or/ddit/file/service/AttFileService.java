package kr.or.ddit.file.service;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.enumpkg.ServiceResult;

public interface AttFileService {
	/**
	 * DB에 저장하기 위한 정보를 받아 VO객체 담아 DAO로 보내는 역할
	 * @param upload 업로드한 파일의 정보
	 * @param saveName UUID 인코딩 처리한 파일 저장명
	 * @param originalName 파일 원본명
	 * @param url 파일 저장 위치
	 * @param accId 글쓴이의 아이디
	 * @return OK : 성공, FAIL : 실패
	 */
	public ServiceResult insertAttFile(MultipartFile upload, String saveName, String originalName, String url, String accId);
	
	/**
	 * 게시글 등록 후 파일테이블에서 게시글 번호 or 블로그 포스트 번호 업데이트
	 * @param accId 작성자 id
	 * @param postNum 블로그 글 번호 (값이 존재 하지 않으면 0)
	 * @param artNum 게시글 글 번호 (값이 존재하지 않으면 0)
	 * @return OK : 성공, FAIL : 실패
	 */
	public ServiceResult updateAttFile(String accId, int postNum, int artNum);
}
