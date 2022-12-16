package kr.or.ddit.blog.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.blog.dao.BlogDAO;
import kr.or.ddit.blog.service.BlogService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.BlogCateVO;
import kr.or.ddit.vo.BlogImgVO;
import kr.or.ddit.vo.BlogPostVO;
import kr.or.ddit.vo.BlogVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/blogSet")
public class BlogSettingController {
	@Inject
	private BlogService service;
	
	@Inject
	private BlogDAO dao;
	
	
	
	/**
	 * 블로그 생성 컨트롤러
	 * @param loginInfo 아이디를 얻기위한 인증객체
	 * @return
	 */
	@RequestMapping("/createBlog")
	public ModelAndView createBlog(Principal loginInfo) {
		BlogVO blog = new BlogVO();
		ModelAndView mav = new ModelAndView();
		ServiceResult result = null;
		String accId = loginInfo.getName();
		
		//생성되어 있는 블로그가 있는지 확인
		blog = service.blogInfo(accId);
		if(blog == null) { //블로그가 생성되어 있지 않을 경우
			result = service.createBlog(accId);
			if(result == ServiceResult.OK) mav.setViewName("redirect:/blog/01/rest4TripBlog?id="+accId);
			else {
				String message = "블로그 생성 실패";
				mav.addObject("message", message);
				mav.setViewName("/blog/blogMainPage");
			}
		}
		else { //블로그가 생성되어 있는 경우
			String message = "블로그가 이미 존재합니다.";
			mav.addObject("message", message);
			mav.setViewName("redirect:/blog/01/rest4TripBlog?id="+accId);
		}
		return mav;
	}
	
	/**
	 * 블로그 삭제 컨트롤러
	 * @param accId 회원의 아이디
	 * @return
	 */
	@RequestMapping("/deleteBlog")
	public ModelAndView deleteBlog(@RequestParam(name="id") String accId) {
		log.info("BlogSettingController deleteBlog id 확인 : {}", accId);
		ModelAndView mav = new ModelAndView();
		BlogVO blog = service.blogInfo(accId);
		if(blog !=null) {
			ServiceResult result = service.deleteBlog(accId);
			if(result == ServiceResult.OK) mav.setViewName("/blog/blogMainPage");
			else {
				String message = "블로그 삭제 실패";
				mav.addObject("message", message);
				mav.setViewName("/blog/blogMainPage");
			}
		}else { //블로그가 없는 경우
			String message = "블로그가 이미 존재하지 않습니다.";
			mav.addObject("message", message);
			mav.setViewName("/blog/blogMainPage");
		}
		return mav;
	}
	
	/**
	 * 블로그 정보(템플릿, 자기소개, 블로그 제목 등)를 수정하는 컨트롤러
	 * @param blog 수정정보가 담긴 VO객체
	 * @param errors 에러정보가 담긴 객체
	 * @return
	 */
	@RequestMapping("/updateBlog")
	public ModelAndView updateBlog(@Validated(UpdateGroup.class) @ModelAttribute("blog") BlogVO blog
			, BindingResult errors) {
		log.info("BlogSettingController updateBlog BlogVO 확인 : {}", blog);
		ModelAndView mav = new ModelAndView();
		if(!errors.hasErrors()) {
			ServiceResult result = service.updateBlog(blog);
			if(result == ServiceResult.OK) mav.setViewName("redirect:/blog/01/rest4TripBlog?id="+blog.getBlogId());
			else {
				String message = "블로그 수정 실패";
				mav.addObject("message", message);
				mav.setViewName("/blogSet/setting");
			}
		}else { //에러가 있는경우
			mav.setViewName("/blogSet/setting");
		}
		return mav;
	}
	/**
	 * 블로그 카테고리를 수정하는 컨트롤러
	 * @param category 수정정보가 담긴 VO객체
	 * @param errors 에러정보가 담긴 객체
	 * @return
	 * @throws IOException 
	 */
	@PostMapping(value="updateCategory", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public int updateCategory(@ModelAttribute(name="category")BlogCateVO category, BindingResult errors, Principal principal) throws IOException {
		log.info("BlogSettingController updateCategory BlogCateVO 확인 : {}", category);
		category.setBlogId(principal.getName());
		int cnt = 0;
		ServiceResult result = null;
		if(!errors.hasErrors()) {
			result = service.categorySet(category);
		}

		if(result == ServiceResult.OK) cnt = 1;
		return cnt;
	}
	@GetMapping("/setting")
	public String setForm(@ModelAttribute(name="category")BlogCateVO category ,@RequestParam(name="id") String blogId, Principal principal, Model model) {
		//블로그 정보 가져오기
		BlogVO blog = service.blogInfo(blogId);
		
		model.addAttribute("blog", blog);
		return "blog/01/settingForm";
	}
}
