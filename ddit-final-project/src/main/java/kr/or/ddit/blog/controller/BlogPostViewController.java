package kr.or.ddit.blog.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.blog.dao.BlogDAO;
import kr.or.ddit.blog.service.BlogService;
import kr.or.ddit.reply.dao.ReplyDAO;
import kr.or.ddit.vo.BlogPostVO;
import kr.or.ddit.vo.BlogVO;
import kr.or.ddit.vo.ReplyVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 작성자명
 * @since 2022. 11. 12.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 11. 14.      작성자명       최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Controller
public class BlogPostViewController {
	//DB접근을 위한 Service 객체 주입
	@Inject
	private BlogService service;
	@Inject
	private BlogDAO blogDao;
	@Inject
	private ReplyDAO replyDao;
	
	//블로그 포스트 번호를 받아 상세페이지로 이동시키는 컨트롤러
	@RequestMapping("/blog/01/viewPost")
	public ModelAndView blogPostView(@RequestParam(name="what", required=true) int postNum, Principal loginInfo, @ModelAttribute(name="reply") ReplyVO reply) {
		BlogPostVO post = service.blogPostView(postNum);
		log.info("BlogPostVO : {}",post);
		log.info("상속컬럼 확인 : {}",post.getBlogName());
		
		//추천유무 체크용 Map
		Map<String, Object> map = new HashMap<>();
		map.put("accId", loginInfo.getName());
		map.put("postNum", post.getPostNum());
		int isChecked = blogDao.ischeckedRec(map);
		log.info("BlogViewController 추천확인 : {}", isChecked);
		post.setIsChecked(isChecked);
		
		//블로그 정보 가져오기
		BlogVO blog = service.blogInfo(post.getBlogId());
		
		//포스트 댓글 리스트 가져오기
		List<ReplyVO> replyList = replyDao.getBlogReplyList(postNum);
		log.info("replyList : {}", replyList);
		
		//모델생성
		ModelAndView mav = new ModelAndView();
		mav.addObject("post",post);
		mav.addObject("blog", blog);
		if(replyList == null || replyList.isEmpty()) mav.addObject("replyList", null);
		else mav.addObject("replyList", replyList);
		
		mav.setViewName("blog/01/viewPost");
		log.info("ModelAndView : {}", mav);
		return mav;
	}
	
	//블로그 포스트를 추천하거나 추천 취소시키는 컨트롤러
	@RequestMapping(value="/blog/postRec", method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> postRec(@RequestParam(name="what", required=true) int postNum, Principal loginInfo){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("postNum", postNum);
		map.put("accId", loginInfo.getName());
		log.info("BlogViewController 추천수 확인용 map : {}",map);;
		int count = service.countPostRec(map);
		
		Map<String, Object> result = new HashMap<>();
		result.put("count", count);
		result.put("success",count >=0);
		return result;
	}
}
