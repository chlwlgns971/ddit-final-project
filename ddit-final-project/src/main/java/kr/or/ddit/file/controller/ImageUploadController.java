package kr.or.ddit.file.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.file.service.AttFileService;
import kr.or.ddit.vo.AttFileVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ImageUploadController {
	@Inject
	private AttFileService service;
	@Inject
	private ServletContext application;
	@Value("#{appInfo.boardFileURL}")
	private String imageFolderURL;
	@Value("#{appInfo.boardFileURL}")
	private Resource imageFolderRes;
	private File saveFolder;
	
	/**
	 * PostConstruct는 기본생성자와 Inject를 실행한 이후에 실행하라는 의미!
	 * @throws IOException 
	 */
	@PostConstruct
	public void init() throws IOException {
		saveFolder = imageFolderRes.getFile();	
		if(!saveFolder.exists()) saveFolder.mkdirs();
		log.info("image folder url : {}", imageFolderURL);
		log.info("로딩된 saveFolder : {}",saveFolder.getCanonicalPath());
	}
	
	/**
	 * 업로드하는 이미지를 저장하고 url 형태로 이미지를 반환하는 컨트롤러(CKEditor)
	 * @param upload 업로드한 파일
	 * @param principal 업로드하는 회원 id
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/file/imageUpload", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> blogImageUpload(@RequestPart(required=true) MultipartFile upload, Principal principal) throws IOException{
		Map<String, Object> target = new HashMap<String, Object>();
		if(!upload.isEmpty()) {
			//UUID 인코딩 방식으로 암호화한 파일 저장명
			String saveName = UUID.randomUUID().toString();
			try(
				InputStream is = upload.getInputStream();	
			){
				File saveFile = new File(saveFolder, saveName);
				FileUtils.copyInputStreamToFile(is, saveFile);
				//파일의 원본 이름
				String originalName = upload.getOriginalFilename();
		
				int uploaded = 1;
				String url = String.format("%s%s/%s", application.getContextPath(), imageFolderURL, saveName);
				
				ServiceResult result = service.insertAttFile(upload, saveName, originalName, url, principal.getName());
				if(result == ServiceResult.OK) {
					target.put("fileName", originalName);
					target.put("uploaded", uploaded);
					target.put("url", url);
				}
				else {
					Map<String, Object> error = new HashMap<>();
					target.put("error", error);
					error.put("number", 500);
					error.put("message", "DB저장에 실패");
				}
				
				
			}
		}else {
			Map<String, Object> error = new HashMap<>();
			target.put("error", error);
			error.put("number", 400);
			error.put("message", "업로드된 이미지가 비어있음");
		}
		return target;
	}
}
