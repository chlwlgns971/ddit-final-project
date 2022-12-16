package kr.or.ddit.blog.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
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
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.blog.dao.BlogDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.AttFileVO;
import kr.or.ddit.vo.BlogCateVO;
import kr.or.ddit.vo.BlogImgVO;
import kr.or.ddit.vo.BlogPostVO;
import kr.or.ddit.vo.BlogVO;
import kr.or.ddit.vo.PagingVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BlogServiceImpl implements BlogService {
	@Inject
	private BlogDAO dao;
	
	@Inject
	private ServletContext application;
	
	@Value("#{appInfo.blogCategory}")
	private String imageFolderURL;
	@Value("#{appInfo.blogCategory}")
	private Resource imageFolderRes;
	private File saveFolder;
	
	@PostConstruct
	public void init() throws IOException {
		saveFolder = imageFolderRes.getFile();	
		if(!saveFolder.exists()) saveFolder.mkdirs();
		log.info("image folder url : {}", imageFolderURL);
		log.info("로딩된 saveFolder : {}",saveFolder.getCanonicalPath());
	}
	
	@Override
	public ServiceResult createBlog(String accId) {
		ServiceResult result = null;
		//블로그 생성용 객체 set
		BlogVO blog = new BlogVO();
		blog.setBlogId(accId);
		blog.setBlogName(accId+"'s Blog");
		blog.setBlogNickname(accId);
		blog.setBlogIntro("Hello, I am "+accId);
		blog.setBlogTemp(1);
		
		int cnt = dao.createBlog(blog);
		result = cnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		
		if(result == ServiceResult.OK) { //블로그 생성이 됐다면 실행
			//기본 카테고리 생성용 데이터 set
			List<BlogCateVO> list = new ArrayList<>();
			list.add(new BlogCateVO(accId,1,"Notice","/rest4Trip/resources/images/blog/bg_1.jpg","Pyramid of Gija in Egypt Cairo"));
			list.add(new BlogCateVO(accId,2,"Travel","/rest4Trip/resources/images/blog/bg_2.jpg","Cinque Terre in Italy Liguria"));
			list.add(new BlogCateVO(accId,3,"Food","/rest4Trip/resources/images/blog/bg_3.jpg","Antelope Canyon in USA Lechee, Arizona"));
			list.add(new BlogCateVO(accId,4,"Hobby","/rest4Trip/resources/images/blog/bg_4.jpg","Santorini in Greece"));
			list.add(new BlogCateVO(accId,5,"Coding","/rest4Trip/resources/images/blog/bg_5.jpg","Lombard Street in USA San Francisco"));
			list.add(new BlogCateVO(accId,6,"Daily Life","/rest4Trip/resources/images/blog/bg_6.jpg","Montmartre in France Paris"));
			list.add(new BlogCateVO(accId,7,"Free","/rest4Trip/resources/images/blog/bg_7.jpg","Sagrada Familia in Spain Barcelona"));
			
			cnt = dao.createBlogCate(list);
			result = cnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		}
		return result;
	}

	@Override
	public ServiceResult deleteBlog(String accId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ServiceResult updateBlog(BlogVO blog) {
		int cnt = dao.updateBlog(blog);
		ServiceResult result = cnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public BlogVO blogInfo(String accId) {
		// 블로그가 존재하는지 확인
		int cnt = dao.checkBlog(accId);

		BlogVO blog = null;
		if (cnt != 0) {
			blog = dao.blogInfo(accId);
			List<BlogCateVO> list = dao.cateInfo(accId);
			blog.setCategory(list);
		}
		return blog;
	}

	@Override
	public List<BlogPostVO> allBlogPostList(PagingVO<BlogPostVO> page, String blogId, String loginId) {
		Map<String, Object> map = new HashMap<String, Object>();
		String scope = null;
		if (blogId.equals(loginId)) {
			scope = "all";
		} else {
			int cnt = checkSubcribe(blogId, loginId);
			scope = (cnt > 0) ? "subcribe" : "public";
		}
		map.put("blogId", blogId);
		map.put("PagingVO", page);
		map.put("Scope", scope);
		return dao.allBlogPostList(map);
	}

	@Override
	public List<BlogPostVO> blogPostList(PagingVO<BlogPostVO> page, String blogId, int bcateNum, String loginId) {
		Map<String, Object> map = new HashMap<String, Object>();
		String scope = null;
		if (blogId.equals(loginId)) {
			scope = "all";
		} else {
			int cnt = checkSubcribe(blogId, loginId);
			scope = (cnt > 0) ? "subcribe" : "public";
		}
		map.put("blogId", blogId);
		map.put("PagingVO", page);
		map.put("cateNum", bcateNum);
		map.put("Scope", scope);
		return dao.blogPostList(map);
	}

	@Override
	public ServiceResult insertBlogPost(BlogPostVO vo) {
		ServiceResult result = null;
		int cnt = dao.insertBlogPost(vo);
		result = cnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public ServiceResult deleteBlogPost(int postNum) {
		ServiceResult result = null;
		int cnt = dao.deleteBlogPost(postNum);
		result = cnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public ServiceResult updateBlogPost(BlogPostVO vo) {
		ServiceResult result = null;
		int cnt = dao.updateBlogPost(vo);
		result = cnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public BlogPostVO blogPostView(int postNum) {
		BlogPostVO post = dao.blogPostView(postNum);
		if (post == null)
			throw new RuntimeException(String.format("%d 글번호의 글이 없음.", postNum));
		dao.incPostHit(postNum);
		return dao.blogPostView(postNum);
	}

	@Override
	public int countTotalPost(PagingVO<BlogPostVO> page, String blogId, String loginId) {
		Map<String, Object> map = new HashMap<String, Object>();
		String scope = null;
		if (blogId.equals(loginId)) {
			scope = "all";
		} else {
			int cnt = checkSubcribe(blogId, loginId);
			scope = (cnt > 0) ? "subcribe" : "public";
		}
		map.put("blogId", blogId);
		map.put("PagingVO", page);
		map.put("Scope", scope);
		return dao.countTotalPost(map);
	}

	@Override
	public int countCategoryPost(PagingVO<BlogPostVO> page, String blogId, int cateNum, String loginId) {
		Map<String, Object> map = new HashMap<String, Object>();
		String scope = null;
		if (blogId.equals(loginId)) {
			scope = "all";
		} else {
			int cnt = checkSubcribe(blogId, loginId);
			scope = (cnt > 0) ? "subcribe" : "public";
		}
		map.put("blogId", blogId);
		map.put("PagingVO", page);
		map.put("cateNum", cateNum);
		map.put("Scope", scope);
		return dao.countCategoryPost(map);
	}

	@Override
	public int countPostRec(Map<String, Object> map) {
		int postNum = (int) map.get("postNum");
		int cnt = 0;
		// 해당 포스트에서 추천여부 확인
		int isChecked = dao.ischeckedRec(map);

		// 추천을 했었으면 추천 취소, 추천을 안했다면 추천수 증가
		if (isChecked > 0) {
			cnt = dao.decPostRec(postNum);
			cnt += dao.decreaseBlogRec(map);
		} else {
			cnt = dao.incPostRec(postNum);
			cnt += dao.insertBlogRec(map);
		}
		// 현재 추천수 조회
		int count = dao.postRec(postNum);

		// insert or delete가 정상적으로 실행되지 않았다면 count = -1반환
		if (!(cnt > 0))
			count = -1;

		return count;
	}

	@Override
	public BlogCateVO blogCateInfo(String blogId, int cateNum) {
		Map<String, Object> map = new HashMap<>();
		map.put("blogId", blogId);
		map.put("cateNum", cateNum);

		BlogCateVO blogCate = dao.blogCateInfo(map);
		return blogCate;
	}

	@Override
	public ServiceResult insertSubcribe(String blogId, String accId) {
		Map<String, String> map = new HashMap<>();
		map.put("blogId", blogId);
		map.put("accId", accId);

		ServiceResult result = (dao.insertSubcribe(map) > 0) ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public ServiceResult removeSubcribe(String blogId, String accId) {
		Map<String, String> map = new HashMap<>();
		map.put("blogId", blogId);
		map.put("accId", accId);

		ServiceResult result = (dao.removeSubcribe(map) > 0) ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public int checkSubcribe(String blogId, String accId) {
		Map<String, String> map = new HashMap<>();
		map.put("blogId", blogId);
		map.put("accId", accId);
		return dao.checkSubcribe(map);
	}

	@Override
	public ServiceResult deleteSubcribe(String blogId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ServiceResult insertAttatch(AttFileVO attatch) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public ServiceResult categorySet(BlogCateVO category) throws IOException {
		ServiceResult result = null;
		
		//BlogImgVO, BlogCateVO 파일에 접근하기 위한 Map 생성
		Map<String, Object> map = new HashMap<>();
		map.put("blogId", category.getBlogId());
		map.put("bcateNum", category.getBcateNum());
		
		BlogCateVO cateInfo = dao.getCateInfo(map);
		
		category.setBcateImg(cateInfo.getBcateImg());
		
		int cnt = 0;
		
		//MultipartFile이 존재할 때만 실행(=이미지가 업로드 되면)
		if(!category.getBannerImg().isEmpty()) {
			MultipartFile multipart = category.getBannerImg(); //첨부파일 가져오기
			String originalName = multipart.getOriginalFilename(); //파일이름
			String saveName = UUID.randomUUID().toString(); //파일 저장명
			String exName = multipart.getContentType(); //파일 확장자명
			int fileSize = (int)multipart.getSize(); //파일 사이즈
			String fancySize = FileUtils.byteCountToDisplaySize(fileSize); //파일사이즈(문자)
			String url = String.format("%s%s/%s", application.getContextPath(), imageFolderURL, saveName); //저장경로
			
			//DB에 저장하기 위한 BlogImgVO 객체 생성
			BlogImgVO blogImg = new BlogImgVO();
			
			blogImg.setBcateNum(category.getBcateNum());
			blogImg.setBimgExnam(exName);
			blogImg.setBimgFsize(fancySize);
			blogImg.setBimgLnam(url);
			blogImg.setBimgOnam(originalName);
			blogImg.setBimgSize(fileSize);
			blogImg.setBimgSnam(saveName);
			blogImg.setBlogId(category.getBlogId());
			
			log.info("BlogImgVO : {}", blogImg);
			
			//기존파일 삭제(실제 파일 삭제)
			BlogImgVO imgInfo = dao.getBlogBanner(map);
			if(imgInfo != null) {
				//파일 저장명 가져오기
				String fileName = imgInfo.getBimgSnam();
				//파일 저장위치 구하기
				String saveLocation = String.format("%s/%s", saveFolder, fileName);
				File file = new File(saveLocation);
				log.info("file : {}",file);
				//파일이 존재하는지 체크
				Boolean check = file.exists();
				log.info("check : {}",check);
				//파일 삭제
				FileUtils.deleteQuietly(file);
				
				//기존파일삭제(DB)
				cnt = cnt + dao.deleteBlogBanner(map);
			}
			
			//실제파일 저장
			try(
				InputStream is = multipart.getInputStream();	
			){
				File saveFile = new File(saveFolder, saveName);
				FileUtils.copyInputStreamToFile(is, saveFile);
			}
			//파일정보 DB에 저장
			cnt = cnt + dao.insertBlogBanner(blogImg);
			
			category.setBcateImg(url);
		}
		
		//블로그 카테고리 정보 update
		cnt = cnt + dao.updateBlogCate(category);
		
		result = cnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		
		return result;
	}
}
