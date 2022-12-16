package kr.or.ddit.blog.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.BlogCateVO;
import kr.or.ddit.vo.BlogImgVO;
import kr.or.ddit.vo.BlogPostVO;
import kr.or.ddit.vo.BlogVO;
import kr.or.ddit.vo.PagingVO;

@Mapper
public interface BlogDAO {
	/**
	 * 회원가입시 블로그 최초 생성
	 * @return 성공 1, 실패 0
	 */
	public int createBlog(BlogVO blog);
	
	/**
	 * 블로그 생성시 기본 카테고리 생성
	 * @param list 카테고리 정보가 담긴 list
	 * @return
	 */
	public int createBlogCate(List<BlogCateVO> list);
	
	/**
	 * 회원 탈퇴시 블로그 삭제
	 * @param accId 회원아이디(인당 블로그는 1개이기 때문에 키값대신 아이디를 받음)
	 * @return 성공 1, 실패 0
	 */
	public int deleteBlog(String blogId);
	
	/**
	 * 블로그 정보 수정(블로그이름, 템플릿 등)
	 * @param BlogVO 블로그 수정정보가 담긴 VO객체
	 * @return 성공 1, 실패 0
	 */
	public int updateBlog(BlogVO blog);
	
	/**
	 * 블로그 간략정보 조회
	 * @param accId 회원아이디
	 * @return BlogVO
	 */
	public BlogVO blogInfo(String blogId);
	
	/**
	 * 블로그가 있는지 유무 체크
	 * @param blogId
	 * @return 블로그 존재 : 1, 없음 : 0
	 */
	public int checkBlog(String blogId);
	
	/**
	 * 회원의 블로그 카테고리 정보 조회
	 * @param accId 회원아이디
	 * @return
	 */
	public List<BlogCateVO> cateInfo(String blogId);
	
	/**
	 * 블로그 전체 포스트 가져오기
	 * @param accId 회원아이디
	 * @return BlogPostVo 객체리스트
	 */
	public List<BlogPostVO> allBlogPostList(Map<String, Object> map);
	
	/**
	 * 블로그 카테고리 포스트 가져오기
	 * @param accId 회원아이디
	 * @param bcateNum 카테고리 번호
	 * @return
	 */
	public List<BlogPostVO> blogPostList(Map<String, Object> map);
	
	/**
	 * 블로그 메인페이지 여행 카테고리 포스트들 리스트 가져오기
	 * @return
	 */
	public List<BlogPostVO> travelPostList(PagingVO<BlogPostVO> page);
	
	/**
	 * 일주일동안의 추천수가 가장 많은 여행카테고리 포스트 top10 가져오기
	 * @return
	 */
	public List<BlogPostVO> weekTopRecPostList();
	
	/**
	 * 일주일동안의 조회수가 가장 많은 여행카테고리 포스트 top10 가져오기
	 * @return
	 */
	public List<BlogPostVO> weekTopHitPostList();
	
	/**
	 * 구독한 블로그 글 중 가장 최근 게시글 10개 가져오기
	 * @return
	 */
	public List<BlogPostVO> recentSubcribePostList(String accId);
	
	/**
	 * 블로그 포스트 작성
	 * @param vo 블로그 포스트 정보가 담긴 VO객체
	 * @return 성공 1, 실패 0
	 */
	public int insertBlogPost(BlogPostVO vo);
	
	/**
	 * 블로그 포스트 삭제
	 * @param postNum 블로그 포스트번호
	 * @return 성공 1, 실패 0
	 */
	public int deleteBlogPost(int postNum);
	
	/**
	 * 블로그 포스트 업데이트
	 * @param vo 블로그 포트스 정보가 담긴 VO객체
	 * @return 성공 1, 실패 0
	 */
	public int updateBlogPost(BlogPostVO vo);
	
	/**
	 * 블로그 포스트 보기
	 * @param postNum 포스트 번호
	 * @return BlogPostVO
	 */
	public BlogPostVO blogPostView(int postNum);
	
	/**
	 * 게시글 조회수 증가
	 * @param postNum 포스트 번호
	 */
	public void incPostHit(int postNum);
	
	/**
	 * 게시글 추천수 증가
	 * @param postNum 포스트 번호
	 * @return 성공 1, 실패 0
	 */
	public int incPostRec(int postNum);
	
	/**
	 * 게시글 추천수 감소
	 * @param postNum 포스트 번호
	 * @return 성공 1, 실패 0
	 */
	public int decPostRec(int postNum);
	
	/**
	 * 현재 게시글의 추천 수 조회
	 * @param postNum 포스트 번호
	 * @return 현재 추천수
	 */
	public int postRec(int postNum);
	
	/**
	 * 포스트 추천 여부 조회하기
	 * @param map 포스트번호와 아이디정보가 담긴 Map
	 * @return 추천정보가 담긴 VO객체
	 */
	public int ischeckedRec(Map<String, Object> map);
	
	/**
	 * 페이징 처리용 전체 포스트 갯수
	 * @param map
	 * @return 현재 블로그 포스트 수
	 */
	public int countTotalPost(Map<String, Object> map);
	
	/**
	 * 페이징 처리용 특정 카테고리 포스트 갯수
	 * @param map
	 * @return 현재 블로그 포스트 수
	 */
	public int countCategoryPost(Map<String, Object> map);
	
	/**
	 * 페이징 처리용 여행 카테고리 포스트 갯수 
	 * @return
	 */
	public int countTravelPost(PagingVO<BlogPostVO> page);
	
	/**
	 * 추천정보 DB에 저장하는 메서드
	 * @param map 포스트번호와 아이디 정보가 담긴 Map
	 * @return 성공 1, 실패 0
	 */
	public int insertBlogRec(Map<String, Object> map);
	
	/**
	 * 추천정보 DB에서 삭제하는 메서드
	 * @param map 포스트번호와 아이디 정보가 담긴 Map
	 * @return 성공 1, 실패 0
	 */
	public int decreaseBlogRec(Map<String, Object> map);
	
	/**
	 * 포스트 삭제용 포스트 추천수 모두 제거 메서드
	 * @param postNum 포스트번호
	 * @return 성공 1, 실패 0
	 */
	public int deleteBlogRec(int postNum);
	
	/**
	 * 현재 카테고리 이름을 반환
	 * @param map 카테고리번호와 아이디 정보가 담긴 Map
	 * @return
	 */
	public BlogCateVO blogCateInfo(Map<String, Object> map);
	
	/**
	 * 블로그 구독 
	 * @param map 블로그 주인 아이디와 이용자 아이디 정보가 담긴 Map
	 * @return insert 성공: 1, 실패: 0
	 */
	public int insertSubcribe(Map<String, String> map);
	
	/**
	 * 블로그 구독취소
	 * @param map 블로그 주인 아이디와 이용자 아이디 정보가 담긴 Map
	 * @return insert 성공: 1, 실패: 0
	 */
	public int removeSubcribe(Map<String, String> map);
	
	/**
	 * 구독자인지 체크하는 기능
	 * @param map 블로그 주인 아이디와 이용자 아이디 정보가 담긴 Map
	 * @return 1 : 구독, 0 : 구독아님
	 */
	public int checkSubcribe(Map<String, String> map);
	
	/**
	 * 블로그 삭제용 구독자 모두 삭제 
	 * @param blogId 블로그 주인 아이디
	 * @return 성공 : 1, 실패 : 0
	 */
	public int deleteSubcribe(String blogId);
	
	/**
	 * 개인블로그 카테고리 수정
	 * @param cate : 카테고리 수정 정보가 담긴 VO객체
	 * @return 성공 : 1, 실패 : 0
	 */
	public int updateBlogCate(BlogCateVO cate);
	
	/**
	 * 개인블로그 카테고리 정보 가져오기
	 * @param map : 블로그 아이디와 카테고리 번호가 담긴 map
	 * @return
	 */
	public BlogCateVO getCateInfo(Map<String, Object> map);
	
	/**
	 * 개인블로그 카테고리 이미지 사진 저장
	 * @param img : 파일 정보가 담긴 VO 객체
	 * @return 성공 : 1, 실패 : 0
	 */
	public int insertBlogBanner(BlogImgVO img);
	
	/**
	 * 개인블로그 카테고리 이미지 삭제
	 * @param map : 블로그 아이디와 카테고리 번호가 담긴 map
	 * @return 성공 : 1, 실패 : 0
	 */
	public int deleteBlogBanner(Map<String, Object> map);
	
	/**
	 * 개인블로그 카테고리 이미지  정보 가져오기
	 * @param map : 블로그 아이디와 카테고리 번호가 담긴 map
	 * @return
	 */
	public BlogImgVO getBlogBanner(Map<String, Object> map);
}
