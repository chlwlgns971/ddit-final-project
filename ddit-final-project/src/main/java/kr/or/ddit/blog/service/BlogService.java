package kr.or.ddit.blog.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.AttFileVO;
import kr.or.ddit.vo.BlogCateVO;
import kr.or.ddit.vo.BlogPostVO;
import kr.or.ddit.vo.BlogVO;
import kr.or.ddit.vo.PagingVO;

public interface BlogService {
	/**
	 * 회원가입시 블로그 최초 생성
	 * @return 성공 OK, 실패 FAIL
	 */
	public ServiceResult createBlog(String accId);
	
	/**
	 * 회원 탈퇴시 블로그 삭제
	 * @param accId 회원아이디(인당 블로그는 1개이기 때문에 키값대신 아이디를 받음)
	 * @return 성공 OK, 실패 FAIL
	 */
	public ServiceResult deleteBlog(String accId);
	
	/**
	 * 블로그 정보 수정(블로그이름, 템플릿 등)
	 * @param blog 블로그 수정 정보가 담긴 VO객체
	 * @return 성공 OK, 실패 FAIL
	 */
	public ServiceResult updateBlog(BlogVO blog);
	
	/**
	 * 블로그 간략정보 조회
	 * @param accId 회원아이디
	 * @return BlogVO
	 */
	public BlogVO blogInfo(String accId);
	
	/**
	 * 블로그 전체 포스트 가져오기
	 * @param accId 회원아이디
	 * @return BlogPostVo 객체리스트
	 */
	public List<BlogPostVO> allBlogPostList(PagingVO<BlogPostVO> page, String blogId, String loginId);
	
	/**
	 * 블로그 카테고리 포스트 가져오기
	 * @param accId 회원아이디
	 * @param bcateNum 카테고리 번호
	 * @return
	 */
	public List<BlogPostVO> blogPostList(PagingVO<BlogPostVO> page, String blogId, int bcateNum, String loginId);
	
	/**
	 * 블로그 포스트 작성
	 * @param vo 블로그 포스트 정보가 담긴 VO객체
	 * @return 성공 OK, 실패 FAIL
	 */
	public ServiceResult insertBlogPost(BlogPostVO vo);
	
	/**
	 * 블로그 포스트 삭제
	 * @param postNum 블로그 포스트번호
	 * @return 성공 OK, 실패 FAIL
	 */
	public ServiceResult deleteBlogPost(int postNum);
	
	/**
	 * 블로그 포스트 업데이트
	 * @param vo 블로그 포트스 정보가 담긴 VO객체
	 * @return 성공 OK, 실패 FAIL
	 */
	public ServiceResult updateBlogPost(BlogPostVO vo);
	
	/**
	 * 블로그 포스트 보기
	 * @param postNum 포스트 번호
	 * @return BlogPostVO
	 */
	public BlogPostVO blogPostView(int postNum);
	
	/**
	 * 페이징 처리용 전체 포스트 갯수
	 * @param pageVo
	 * @param blogId
	 * @return 현재 블로그 포스트 수
	 */
	public int countTotalPost(PagingVO<BlogPostVO> page, String blogId, String loginId);
	
	/**
	 * 페이징 처리용 특정 카테고리 포스트 갯수
	 * @param pageVo
	 * @param blogId
	 * @param cateNum
	 * @return 현재 블로그 포스트 수
	 */
	public int countCategoryPost(PagingVO<BlogPostVO> page, String blogId, int cateNum, String loginId);
	
	/**
	 * 포스트 추천수를 올리거나 내리는 로직 역할 담당
	 * @param map 포스트번호와 아이디 정보가 담긴 Map
	 * @return 현재 추천수 반환
	 */
	public int countPostRec(Map<String, Object> map);
	
	/**
	 * 현재 카테고리 이름을 반환
	 * @param blogId 블로그 주인 아이디
	 * @param cateNum 카테고리 번호
	 * @return
	 */
	public BlogCateVO blogCateInfo(String blogId, int cateNum);
	
	/**
	 * 블로그 구독 
	 * @param blogId 블로그 주인 아이디
	 * @param accId 회원의 아이디
	 * @return OK : 성공, Fail : 실패
	 */
	public ServiceResult insertSubcribe(String blogId, String accId);
	
	/**
	 * 블로그 구독 취소
	 * @param blogId 블로그 주인 아이디
	 * @param accId 회원의 아이디
	 * @return OK : 성공, Fail : 실패
	 */
	public ServiceResult removeSubcribe(String blogId, String accId);
	
	/**
	 * 구독자인지 체크하는 기능
	 * @param blogId 블로그 주인 아이디
	 * @param accId 회원의 아이디
	 * @return 1 : 구독, 0 : 구독아님
	 */
	public int checkSubcribe(String blogId, String accId);
	
	/**
	 * 블로그 삭제용 구독자 모두 삭제 
	 * @param blogId 블로그 주인 아이디
	 * @return OK : 성공, Fail : 실패
	 */
	public ServiceResult deleteSubcribe(String blogId);
	
	/**
	 * 글쓰기 완료 이전 
	 * @param attatch
	 * @return
	 */
	public ServiceResult insertAttatch(AttFileVO attatch);
	
	/**
	 * 블로그 카테고리 수정 로직
	 * @param category : 수정정보가 담긴 VO객체
	 * @return OK : 성공, Fail : 실패
	 * @throws IOException 
	 */
	public ServiceResult categorySet(BlogCateVO category) throws IOException;
}
