package kr.or.ddit.blog.controller;

import java.security.Principal;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.blog.service.BlogService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.BlogPostVO;
import kr.or.ddit.vo.BlogVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/blog/01/updatePost")
public class UpdateBlogPostController {
	@Inject
	private BlogService service;
	
	/**
	 * get방식으로 update요청이 들어오면 게시글 정보를 vo에 담아 수정하기 위한 Form페이지로 보낸다.
	 * @param postNum = 포스트번호
	 * @return
	 */
	@GetMapping
	public ModelAndView updateForm(@RequestParam(name="what", required=true) int postNum, Principal loginInfo) {
		BlogPostVO blogPost = service.blogPostView(postNum);
		BlogVO blog = service.blogInfo(loginInfo.getName());
		ModelAndView mav = new ModelAndView();
		if(!(loginInfo.getName().equals(blogPost.getBlogId()))){
			String message = "권한이 없습니다.";
			mav.addObject("message",message);
			mav.setViewName("redirect:/blog/01/viewPost?what="+postNum);
		}
		else {
			mav.setViewName("blog/01/blogForm");
			mav.addObject("blogPost",blogPost);
			mav.addObject("blog", blog);
			log.info("UpdateBlogPostController ModelAndView : {}",mav); //modelAndView가 제대로 담기는지 확인
		}
		return mav;
	}
	
	/**
	 * 수정된 정보를 받아 실제 DB에 반영하는 컨트롤러
	 * @param blogPost 수정사항이 반영된 VO객체
	 * @param errors 에러정보가 담긴 객체
	 * @param model 데이터를 담기 위한 model객체
	 * @return
	 */
	@PostMapping
	public String updateBlogPost(@Validated(UpdateGroup.class) @ModelAttribute("blogPost") BlogPostVO blogPost
			, BindingResult errors, Model model) {
		log.info("UpdateBlogPostController 수정사항이 반영된 BlogPostVO 객체 : {}",blogPost.toString());
		String viewName = "";
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
			ServiceResult result = service.updateBlogPost(blogPost);
			if(result == ServiceResult.OK) {
				viewName = "redirect:/blog/01/viewPost?what="+blogPost.getPostNum();
			}else {
				String message = "등록실패";
				model.addAttribute("message",message);
				viewName = "blog/01/blogForm";
			}
			
		}else {
			String message = "등록실패";
			model.addAttribute("message",message);
			viewName = "blog/01/blogForm";
		}
		return viewName;
	}
}
