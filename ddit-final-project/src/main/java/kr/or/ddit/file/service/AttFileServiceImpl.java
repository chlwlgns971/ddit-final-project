package kr.or.ddit.file.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.file.dao.AttFileDAO;
import kr.or.ddit.vo.AttFileVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AttFileServiceImpl implements AttFileService{
	@Inject
	private AttFileDAO dao;
	
	/**
	 * 파일을 AttFileVO에 담아 DAO로 넘기고 결과값을 리턴해주는 로직
	 */
	@Override
	public ServiceResult insertAttFile(MultipartFile upload, String saveName, String originalName, String url, String accId) {
		AttFileVO attatch = new AttFileVO();
		long byteFileSize = upload.getSize();
		String fileSize = FileUtils.byteCountToDisplaySize(byteFileSize);
		attatch.setAfileName(saveName);
		attatch.setAfileOname(originalName);
		attatch.setAfileSize(byteFileSize);
		attatch.setAfileFsize(fileSize);
		attatch.setPostNum(0);
		attatch.setArtNum(0);
		attatch.setAfileId(accId);
		attatch.setAfileLocat(url);
		
		log.info("AttFileServiceImpl AttFileVO : {}",attatch);
		
		ServiceResult result = dao.insertAttFile(attatch) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		
		return result;
	}
	
	/**
	 * 업데이트에 필요한 정보를 받아 게시글 번호 or 포스트 번호를 업데이트 하는 로직
	 */
	@Override
	public ServiceResult updateAttFile(String accId, int postNum, int artNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("accId", accId);
		map.put("postNum", postNum);
		map.put("artNum", artNum);
		
		ServiceResult result = dao.updateAttFile(map) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

}
