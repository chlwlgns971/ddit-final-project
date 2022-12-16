package kr.or.ddit.blog.controller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.blog.dao.BlogDAO;
import kr.or.ddit.blog.service.BlogService;
import kr.or.ddit.vo.BlogCateVO;
import kr.or.ddit.vo.BlogPostVO;
import kr.or.ddit.vo.BlogVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 작성자명
 * @since 2022. 11. 14.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * 2022.11.14	최지훈			컨트롤러 최초 작성
 * --------     --------    ----------------------
 * 2022. 11. 14.      작성자명       최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Controller
public class BlogPostListController {
	//BlogService 객체 주입
	@Inject
	private BlogService service;
	
	@Inject
	private BlogDAO dao;
	
	//블로그메뉴 메인화면
	@RequestMapping("/blog/blogMainPage")
	public ModelAndView blogMain(@RequestParam(name="page", required=false, defaultValue="1") int currentPage, ModelAndView model, Principal principal) {
		//일주일 동안 가장 많은 추천을 받은 포스트를 10개 가져온다.
		List<BlogPostVO> weekRecPostList = dao.weekTopRecPostList();
		log.info("weekRecPostList : {}", weekRecPostList);
		
		//일주일 동안 가장 많은 조회수를 기록한 포스트를 10개 가져온다.
		List<BlogPostVO> weekHitPostList = dao.weekTopHitPostList();
		log.info("weekHitPostList : {}", weekHitPostList);
		
		//구독한 블로그에서 가장 최근 포스트 10개를 가져온다.
		List<BlogPostVO> recentSubcribePostList = dao.recentSubcribePostList(principal.getName());
		log.info("recentSubcribePostList : {}",recentSubcribePostList);
		
		//전체 여행카테고리 포스트중에 전체공개 된 포스트 리스트를 최신순으로 가져오기 위한 로직
		PagingVO<BlogPostVO> page = new PagingVO<>(5,5);
		//현재페이지 정보 set
		page.setCurrentPage(currentPage);
		//전체포스트 갯수 구하기
		int count = dao.countTravelPost(page);
		page.setTotalRecord(count);
		log.info("PagingVO : {}",page);
		//전체 여행카테고리 포스트 가져오기
		List<BlogPostVO> travelPostList = dao.travelPostList(page);
		log.info("travelPostList : {}",travelPostList);
		page.setDataList(travelPostList);
		
		//블로그 정보 가져오기
		BlogVO blog = service.blogInfo(principal.getName());
		
		model.addObject("weekRecPostList", weekRecPostList);
		model.addObject("weekHitPostList", weekHitPostList);
		model.addObject("recentSubcribePostList", recentSubcribePostList);
		model.addObject("PagingVO", page);
		model.addObject("blog",blog);
		model.setViewName("blog/blogMainPage");
		return model;
	}
	
	//블로그메뉴 메인화면 페이지 이동(비동기)
	@RequestMapping(value="/blog/blogMainPage", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<BlogPostVO> mainPage(@RequestParam(name="page", required=false, defaultValue="1") int currentPage
			, @ModelAttribute("simpleCondition") SearchVO simpleCondition, ModelAndView model) {
		log.info("BlogMainPageList currentPage : {}",currentPage);
		log.info("BlogMainPageList simpleCondition : {}",simpleCondition);
		//전체 여행카테고리 포스트중에 전체공개 된 포스트 리스트를 최신순으로 가져오기 위한 로직
		PagingVO<BlogPostVO> page = new PagingVO<>(5,5);
		//현재페이지 정보 set
		page.setCurrentPage(currentPage);
		//검색조건과 검색어 정보 set
		page.setSimpleCondition(simpleCondition);
		//전체포스트 갯수 구하기
		int count = dao.countTravelPost(page);
		page.setTotalRecord(count);
		//전체 여행카테고리 포스트 가져오기
		List<BlogPostVO> travelPostList = dao.travelPostList(page);
		log.info("travelPostList : {}",travelPostList);
		page.setDataList(travelPostList);
		
		return page;
	}
	
	@RequestMapping(value="/blog/01/rest4TripBlog", method=RequestMethod.GET)
	public String allListUI(@RequestParam(name="id", required=true) String blogId, Model model, Principal principal) {
		//블로그 정보 가져오기
		BlogVO blog = service.blogInfo(blogId);
		
		//구독정보 가져오기
		int isCheckedSub = service.checkSubcribe(blogId, principal.getName());
		
		model.addAttribute("blog", blog);
		model.addAttribute("subcribe", isCheckedSub);
		return "blog/01/rest4TripBlog";
	}
	
	/**
	 * 
	 * @param blogId 블로그 주인 아이디
	 * @param currentPage 요청된 페이지번호
	 * @param simpleCondition 검색어 정보가 담긴 SearchVO 객체
	 * @return 
	 */
	@RequestMapping(value="/blog/01/rest4TripBlog", method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<BlogPostVO> allBlogPostList(@RequestParam(name="id", required=true) String blogId 
			,@RequestParam(name="page", required=false, defaultValue="1") int currentPage
			,@ModelAttribute("simpleCondition") SearchVO simpleCondition, Principal principal){
		log.info("BlogPostListController simpleCondition : {}",simpleCondition);
		//페이징 처리용 VO객체 생성 한 페이지에 9개의 포스트, 5개의 페이지블록으로 구성
		PagingVO<BlogPostVO> page = new PagingVO<>(9, 5);
		//현재페이지 정보 set
		page.setCurrentPage(currentPage);
		//검색조건과 검색어 정보 set
		page.setSimpleCondition(simpleCondition);
		//로그인정보
		String loginId = principal.getName();
		//전체 포스트 갯수 구하기
		int totalRecord = service.countTotalPost(page, blogId, loginId);
		log.info("전체포스트 갯수 : {}",totalRecord);
		page.setTotalRecord(totalRecord);
		log.info("PagingVO : {}",page.toString());
		//블로그 포스트 리스트 가져오기
		List<BlogPostVO> list = service.allBlogPostList(page, blogId, loginId);
		page.setDataList(list);
		log.info("page: {}",page);
		return page;
	}
	
	@RequestMapping(value="/blog/01/blogCategoryList", method=RequestMethod.GET)
	public String listUI(@RequestParam(name="id", required=true) String blogId, @RequestParam(name="cate", required=true) int cateNum,Model model) {
		//블로그 정보 가져오기
		BlogVO blog = service.blogInfo(blogId);
		BlogCateVO blogCate = service.blogCateInfo(blogId, cateNum);
		
		model.addAttribute("blogCate", blogCate);
		model.addAttribute("blog", blog);
		return "blog/01/blogCategoryForm";
	}
	
	/**
	 * 블로그 특정 카테고리 포스트 조회 컨트롤러
	 * @param blogId 블로그 주인 아이디
	 * @param currentPage 요청된 페이지번호
	 * @param simpleCondition 검색어 정보가 담긴 SearchVO 객체
	 * @return 
	 */
	@RequestMapping(value="blog/01/blogCategoryList", method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<BlogPostVO> blogPostList(@RequestParam(name="id", required=true) String blogId 
			,@RequestParam(name="cate", required=true) int cateNum
			,@RequestParam(name="page", required=false, defaultValue="1") int currentPage
			,@ModelAttribute("simpleCondition") SearchVO simpleCondition, Principal principal){
		//페이징 처리용 VO객체 생성 한 페이지에 9개의 포스트, 5개의 페이지블록으로 구성
		PagingVO<BlogPostVO> page = new PagingVO<>(5, 5);
		//현재페이지 정보 set
		page.setCurrentPage(currentPage);
		//검색조건과 검색어 정보 set
		page.setSimpleCondition(simpleCondition);
		//로그인정보
		String loginId = principal.getName();
		//전체 포스트 갯수 구하기
		int totalRecord = service.countCategoryPost(page, blogId, cateNum, loginId);
		log.info("전체포스트 갯수 : {}",totalRecord);
		page.setTotalRecord(totalRecord);
		log.info("PagingVO : {}",page.toString());
		//블로그 포스트 리스트 가져오기
		List<BlogPostVO> list = service.blogPostList(page,blogId, cateNum, loginId);
		page.setDataList(list);
		log.info("page: {}",page);
		return page;
	}
}
