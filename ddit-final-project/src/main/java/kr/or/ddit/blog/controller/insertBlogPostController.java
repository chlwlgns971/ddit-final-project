package kr.or.ddit.blog.controller;

import java.security.Principal;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.blog.service.BlogService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.file.service.AttFileService;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.BlogPostVO;
import kr.or.ddit.vo.BlogVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/blog/01/insertPost")
public class insertBlogPostController {
	@Inject
	private BlogService service;
	
	@Inject
	private AttFileService fileService;
	
	/**
	 * inset Form에 VO정보를 보내기 위해 기본 VO객체 생성
	 * @return
	 */
	@ModelAttribute("blogPost")
	public BlogPostVO blogPost() {
		return new BlogPostVO();
	}
	
	/**
	 * 포스트 생성 폼으로 전송시키는 컨트롤러
	 * @param blogPost 위에서 만든 blogPostVO객체
	 * @return
	 */
	@GetMapping
	public String blogPostForm(@ModelAttribute("blogPost") BlogPostVO blogPost, Principal principal, Model model) {
		//블로그 정보 가져오기
		BlogVO blog = service.blogInfo(principal.getName());
		blog.setBlogId(principal.getName());
		model.addAttribute("blog", blog);
		log.info("InsertBlogPostController blog 객체 확인 : {}",blog);
		return "blog/01/blogForm";
	}
	
	/**
	 * Form에서 받은 정보를 실제 DB에 반영시키는 메서드
	 * @param blogPost 글 정보가 담긴 VO객체
	 * @param errors 에러 정보가 담긴 객체
	 * @param model viewName과 메세지를 담기위한 model객체
	 * @return
	 */
	@PostMapping
	@Transactional
	public String insertBlog(
			@Validated(InsertGroup.class) @ModelAttribute("blogPost") BlogPostVO blogPost
			,Errors errors
			,Principal loginInfo
			, Model model
		) {
		log.info("insertBlogPostController 입력받은 객체 : {}",blogPost);
		log.info("errors 객체 확인 : {}",errors);
		String viewName = null;
		String message = null;
		if(!errors.hasErrors()) {
			Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
	        Matcher matcher = pattern.matcher(blogPost.getPostCont());  
	        try {
	        	matcher.find();
		        log.info("img src링크 : {}",matcher.group(1));
		        blogPost.setPostThum(matcher.group(1));
			} catch (Exception e) {
				blogPost.setPostThum("/rest4Trip/resources/images/No_image.jpg");
			}
	        blogPost.setBlogId(loginInfo.getName());
			blogPost.setPostHit(0);
			blogPost.setPostRec(0);
			ServiceResult result = service.insertBlogPost(blogPost);
			
			if(result == ServiceResult.OK) { // 포스트 insert가 성공했을 경우
				//파일 정보 업데이트(포스트 번호)
				ServiceResult updateFile = fileService.updateAttFile(loginInfo.getName(), blogPost.getPostNum(), 0);
				if(updateFile == ServiceResult.OK) viewName = "redirect:/blog/01/viewPost?what="+blogPost.getPostNum();
				else {
					message = "파일정보갱신실패";
					model.addAttribute("message",message);
					viewName = "redirect:/blog/01/viewPost?what="+blogPost.getPostNum();
				}
			}else{
				message = "등록실패";
				model.addAttribute("message",message);
				viewName = "blog/01/blogForm";
			}
		}else {
			viewName = "blog/01/blogForm";
		}
		return viewName;
	}
}
