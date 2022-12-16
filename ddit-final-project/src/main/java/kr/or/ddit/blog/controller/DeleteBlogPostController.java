package kr.or.ddit.blog.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.blog.dao.BlogDAO;
import kr.or.ddit.blog.service.BlogService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.file.dao.AttFileDAO;
import kr.or.ddit.vo.AccountVOWrapper;
import lombok.extern.slf4j.Slf4j;

/**
 * 블로그 포스트 삭제 컨트롤러
 * @author 작성자명
 * @since 2022. 11. 15.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 11. 15.      최지훈      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Controller
@Transactional
public class DeleteBlogPostController {
	@Inject
	private BlogService service;
	@Inject
	private BlogDAO dao;
	
	@Inject
	private AttFileDAO fileDao;
	
	@Value("#{appInfo.boardFileURL}")
	private String imageFolderURL;
	@Value("#{appInfo.boardFileURL}")
	private Resource imageFolderRes;
	private File saveFolder;
	
	@PostConstruct
	public void init() throws IOException {
		saveFolder = imageFolderRes.getFile();	
		if(!saveFolder.exists()) saveFolder.mkdirs();
		log.info("image folder url : {}", imageFolderURL);
		log.info("로딩된 saveFolder : {}",saveFolder.getCanonicalPath());
	}
	
	@RequestMapping("/blog/01/deletePost")
	public String deleteBlogPost(@RequestParam(name="what", required=true) int postNum
			,@RequestParam(name="id") String blogId
			,@AuthenticationPrincipal AccountVOWrapper account
			,Model model) 
	{
		log.info("DeleteBlogPostController 포스트 번호 : {}",postNum);
		log.info("DeleteBlogPostController 아이디 : {}",blogId);
		String viewName = "";
		String message = "";
		if((!(account.getUsername().equals(blogId)))&&!(account.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_MA")))) {
			message = "권한이 없습니다.";
			model.addAttribute("message",message);
			viewName = "redirect:/blog/01/viewPost?what="+postNum;
		}
		else {
			//첨부파일 정보 가져오기
			List<String> postFile = fileDao.getPostFileUrl(postNum);
			
			//리스트에서 경로를 하나씩 꺼내 실제 파일 삭제
			for (String saveName : postFile) {
				String url = String.format("%s/%s", saveFolder, saveName);
						
				File file = new File(url);
				log.info("file : {}",file);
				Boolean check = file.exists();
				log.info("check : {}",check);
				FileUtils.deleteQuietly(file);
			}
			//포스트에 포함된 파일 삭제
			int cnt = fileDao.deletePostFile(postNum);
			log.info("cnt : {}",cnt);
			if(cnt > 0) {
				//포스트 삭제 service 메서드 실행 후 결과 받기
				dao.deleteBlogRec(postNum);
				ServiceResult result = service.deleteBlogPost(postNum);
				if(result == ServiceResult.OK) { // 정상적으로 삭제됐을 경우
					viewName = "redirect:/blog/01/rest4TripBlog?id="+blogId;
				}
				else {// 삭제에 실패했을 경우
					message = "삭제실패";
					model.addAttribute("message",message);
					viewName = "redirect:/blog/01/viewPost?what="+postNum;
				}
			}
		}
		return viewName;

	}
}
