## 여정(여행 정보 웹사이트 프로젝트)
![image](https://user-images.githubusercontent.com/96568009/208040462-79fbb761-da4c-44a3-8509-51077949f440.png)

## ❓ 프로젝트 제작 계기   
- 최근 코로나의 위험성으로 억제되어온 여행에 대한 수요가 규제가 풀리고, 여행 인원이 폭발적으로 증가함

- 실제로 여행을 간다고 생각했을 때 보통 개인의 블로그나 웹 검색, SNS으로 실제 다녀온 사람들의 정보를 얻고, 여행 상품 판매 사이트에서 패키지나 렌터카, 숙소, 여행자 보험 등을 따로 예약하는 불편함이 있다.



## 📝 구현 목표
- Rest 4 Trip의 목표는 여행의 시작 전부터 여행이 끝난 이후의 기록까지 관리할 수 있는 여행 종합 정보 사이트.

- 여행 시작 전 여행에 관련된 정보들을 수집하고, 계획한 여행에 관련된 상품들을 한 곳에서 예약할 수 있어야 한다. 

- 여행 이후에는 여행에서 보고 느낀 것들을 블로그와 리뷰에 남기거나 다른 사람의 기록을 볼 수 있고 커뮤니티 활동을 통해 생생한 정보를 얻을 수 있다.

## 🙋‍♂️ 프로젝트 인원 설명 
- 조수빈 : 회원 관리, 공지사항 관리, 쿠폰 관리, 뉴스레터 발송, 여행지 관리, 통계 자료

- 최지훈 : 개발 환경 세팅, 여행지 정보, 상품 예약/결제, 결제 내역 조회, 블로그 포스팅, 블로그 관리, 홈 화면 구현, API 구현 및 배포

- 홍무곤 : DB 설계 및 구축, 고객센터, 커뮤니티 구현, 보험 상품 가입

- 강명범 : 시큐리티를 적용한 로그인/로그아웃, 회원정보 수정, 마일리지/쿠폰, 동행 조회, 상품 정보 관리

- 김유리 : 항공권 조회, 렌터카 조회, 호텔 조회, 상품 상세 페이지, 여행지 검색

- 정요한 : 로그인/로그아웃, 일반 회원 가입, 업체 회원 가입, 아이디 찾기
## 목차  

1. [🛠 구현기능 미리보기  ](#구현기능-미리보기) 
    - [사이트 메인화면](#사이트-메인화면)  
    - [항공권 조회](#항공권-조회)  
    - [호텔 예약](#호텔-예약)  
    - [상품 결제](#상품-결제)  
    - [커뮤니티](#커뮤니티)  
    - [블로그 메뉴 홈](#블로그-메뉴-홈)  
    - [개인 블로그](#개인-블로그)  
    - [회원 마이페이지](#회원-마이페이지)  
    - [관리자 마이페이지](#관리자-마이페이지)
2. [개발 환경](#개발-환경)
3. [데이터 베이스](#데이터-베이스)  
4. [구현 기능 상세보기](#-구현-기능-상세보기)
    - [상품 결제](#상품-결제)   
    - [예약/결제 내역 조회](#예약결제-내역-조회)   
    - [블로그 메뉴 홈](#블로그-메뉴-홈)   
    - [개인 블로그](#개인-블로그)      
    - [여행지 페이지](#여행지-페이지)   
   
## 구현기능 미리보기
#### 사이트 메인화면
![메인화면](https://user-images.githubusercontent.com/96568009/208056065-014fda8b-e303-4cbc-853b-c1ee57bf4c01.jpg)

#### 항공권 조회
![localhost_rest4Trip_prod_airline](https://user-images.githubusercontent.com/96568009/208057585-2350c256-794e-4a9e-a184-28ab30f70a6a.png)

#### 호텔 예약
![image](https://user-images.githubusercontent.com/96568009/208058495-df9a120f-57df-4e51-bf5a-07bc398c91be.png)

#### 상품 결제
![localhost_rest4Trip_prod_hotelView_cinfoNum=32](https://user-images.githubusercontent.com/96568009/208347251-f8d9ef8b-fd1d-4cd8-90ff-6cfa80fa029d.png)

#### 커뮤니티
![localhost_rest4Trip_article_articleList_BC001](https://user-images.githubusercontent.com/96568009/208347418-fe057c8f-d7af-4c5b-b864-a3a69fe131c2.png)

#### 블로그 메뉴 홈
![localhost_rest4Trip_blog_blogMainPage](https://user-images.githubusercontent.com/96568009/208347741-dbfd2ee9-2ea5-4ce6-b557-2f3c9b4bc536.png)

#### 개인 블로그
![blog1](https://user-images.githubusercontent.com/96568009/208347507-bbe1145f-e75d-4923-8c47-20c5c2c6dcc5.png)
![blog2](https://user-images.githubusercontent.com/96568009/208347518-c47c4b2b-48b2-4621-9a75-7d9e8428f42a.png)

#### 회원 마이페이지
![localhost_rest4Trip_mypage_member_personal_chargeList_what=HT1670789445116](https://user-images.githubusercontent.com/96568009/208347562-f1ff7a86-f632-4230-b039-9c1a65bc5598.png)

#### 관리자 마이페이지
![localhost_rest4Trip_mypage_admin_chartView](https://user-images.githubusercontent.com/96568009/208347585-c215c7a6-bc54-417f-bf55-3fbbcdf75b5a.png)

<br>

## 개발 환경
![image](https://user-images.githubusercontent.com/96568009/208348507-f51c75d0-c63a-43a1-b89d-965c9857a4d8.png) 
![image](https://user-images.githubusercontent.com/96568009/208348662-a3b8ce3e-2fd2-4525-9b0f-ccd9dd099df7.png)

<br>

## 데이터 베이스
![image](https://user-images.githubusercontent.com/96568009/208349324-99c5797c-ef3b-4280-a762-bbc8eb09365a.png)

## 구현 기능 상세보기

>내가 구현한 기능.
   
### 상품결제
![localhost_rest4Trip_booking_step1](https://user-images.githubusercontent.com/96568009/208351367-c3d37540-105f-44d2-8927-7ec00e314254.png)
- 상품 결제 화면으로 회원이 보유한 마일리지와 보유하고 사용가능한 쿠폰정보를 불러와 화면에 표시한다.
- 쿠폰이나 마일리지는 적용하면 비동기로 처리하여 실시간으로 적용 후의 금액이 표시된다.
- 결제 전 비동기로 요청을 보내 실제로 사용가능한 쿠폰과 마일리지인지, 위변조는 없는지 확인하고 결제요청이 이루어진다. (계산이 맞지 않는 경우 -1 반환)
```java
/**
	 * 결제하기 전 값 위조가 일어났는지 확인
	 * @param coupon : 쿠폰번호
	 * @param mileage : 사용마일리지
	 * @param finalPrice : 최종결제금액
	 * @param originalPrice : 상품의 원래 금액
	 * @param prodCode : 상품코드
	 * @param principal : 회원인증객체
	 * @return 결과일치(위변조없음) : finalPrice, 결과불일치(위변조일어남) : -1
	 */
	@RequestMapping(value="/validate", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public int validateAmount(@RequestParam(name="coupon", defaultValue="0") int coupon
			, @RequestParam(name="mileage", defaultValue="0") int mileage
			, @RequestParam(name="finalPrice") int finalPrice
			, @RequestParam(name="originalPrice") int originalPrice
			, @RequestParam(name="prodCode") String prodCode, Principal principal) {
		  int result1 = originalPrice;
		  if(coupon != 0) {
			  //쿠폰을 적용한 후의 가격계산
			  result1 = service.couponCalculation(principal.getName(), prodCode, coupon, originalPrice);
		  }
		  int result2 = result1;
		  if(mileage != 0) {
			  //마일리지를 적용한 후의 가격계산
			  result2 = service.mileageCalculation(mileage, principal.getName(), result1);
		  }
		
		  log.info("Validate result1 : {}",result1);
		  log.info("Validate result2 : {}",result2);
		  log.info("Validate finalPrice : {}",finalPrice);
		  //위변조 여부 검사(쿠폰과 마일리지를 계산한 결과가 최종결제 금액과 일치하는지 검사)
		  if(finalPrice == result2) return finalPrice;
		  else return -1;
	}
```   
<br>   
  
### 예약/결제 내역 조회
![image](https://user-images.githubusercontent.com/96568009/208352802-3ae8381c-4092-437a-aef6-e360edfddf3a.png)
![image](https://user-images.githubusercontent.com/96568009/208352838-d7970a4d-bc8f-4706-a808-51c004b6333b.png)

- 예약 내역에선 상품 가격과 이용 날짜 상품명, 사진이 보여지고, 상세보기 버튼을 클릭하면 예약 상세정보와 결제 상세 내역을 확인할 수 있다.

<br>

### 블로그 메뉴 홈
![localhost_rest4Trip_blog_blogMainPage](https://user-images.githubusercontent.com/96568009/208347741-dbfd2ee9-2ea5-4ce6-b557-2f3c9b4bc536.png)
- 여행정보 사이트임을 감안하여 전체 공개된 여행카테고리의 블로그 포스트를 메인화면에 최신순으로 보여준다.
- 오른쪽 메뉴에서 내 블로그로 접근할 수 있고, 랭킹을 도입하여 1주일동안 가장 많은 추천수, 가장 많은 조회수를 기록한 포스트를 상위 10개까지 보여주고, Subcribe에선 구독한 블로그의 최신글 최대 10개까지 보여준다.

<br>

### 개인 블로그
![blog1](https://user-images.githubusercontent.com/96568009/208347507-bbe1145f-e75d-4923-8c47-20c5c2c6dcc5.png)
![blog2](https://user-images.githubusercontent.com/96568009/208347518-c47c4b2b-48b2-4621-9a75-7d9e8428f42a.png)
![localhost_rest4Trip_blog_01_blogCategoryList_id=Admin_CJH cate=2 (1)](https://user-images.githubusercontent.com/96568009/208356677-29a4ff23-f20a-4983-b946-c070f5b8c60b.png)
![localhost_rest4Trip_blog_01_blogCategoryList_id=Admin_CJH cate=2 (2)](https://user-images.githubusercontent.com/96568009/208356680-df0dad75-e1f5-423c-b5cc-95eb309401b3.png)

- 블로그에선 프로필사진, 소개글, 닉네임이 보여지며 닉네임은 블로그에서만 사용되는 기능이다. 닉네임은 블로그 관련 모든 컨텐츠에 아이디 대신 노출된다.
- 각 카테고리로 들어가면 해당 카테고리 안에서 작성된 블로그 포스트들을 볼 수 있으며, 카테고리 이름과 이미지, 카테고리 소제목은 커스텀이 가능하도록 구현하였다.

<br>

![localhost_rest4Trip_blogSet_setting_id=Admin_CJH](https://user-images.githubusercontent.com/96568009/208356213-b478c36e-4517-404f-b15e-0a17208c30c7.png)
![localhost_rest4Trip_blogSet_setting_id=Admin_CJH (1)](https://user-images.githubusercontent.com/96568009/208356225-9d1f373f-4f2f-4e97-ae13-1da11de5b7cf.png)

- 설정화면에서는 소개글, 닉네임, 블로그 이름, 카테고리 수정, 소제목, 이미지 변경이 가능하여 사용자가 원하는대로 커스텀하여 나만의 블로그를 만들어 이용할 수 있도록 했다.

<br>

![localhost_rest4Trip_blog_01_insertPost](https://user-images.githubusercontent.com/96568009/208356978-539061e2-e594-4907-a3dd-7af0c8513ba7.png)
- 게시글 작성은 CKEditor API를 이용하여 구현했고, 공개범위, 카테고리를 설정해서 글을 체계적으로 관리하고 모든 사람에게 공개하거나, 구독자들에게만 공개하거나, 나만 볼 수 있는 글로 공개범위를 설정할 수 있다.
- 또한 블로그 글 작성시 이미지를 첨부한다면 업로드한 첫번째 이미지를 자바 정규식을 이용해 뽑아내서 썸네일로 저장하고, 만약 이미지가 없다면 만들어둔 'No_Image' 이미지를 썸네일로 지정한다.
```java
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
     		try {//글 내용중에 이미지 태그를 검색
	  		matcher.find();
			log.info("img src링크 : {}",matcher.group(1));
			blogPost.setPostThum(matcher.group(1));
		} catch (Exception e) {//이미지 태그가 발견되지 않았다면 catch문으로 빠짐
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
```   

<br>

![localhost_rest4Trip_blog_01_viewPost_what=321](https://user-images.githubusercontent.com/96568009/208357326-b45df521-1524-4b4b-ac5d-ae06ad7a27a8.png)
![localhost_rest4Trip_blog_01_viewPost_what=321 (1)](https://user-images.githubusercontent.com/96568009/208357330-0568dd62-a413-4909-a493-258559efc1a6.png)
![localhost_rest4Trip_blog_01_viewPost_what=321 (2)](https://user-images.githubusercontent.com/96568009/208357332-3bebb686-780b-4c16-a6ca-4e498c1754e9.png)

- 글 상세보기에서 수정과 삭제 버튼은 글쓴이 혹은 관리자만 보여지게 설정하였다.
```html
<c:if test="${post.blogId eq principal.realUser.accId || principal.realUser.memCode eq 'ROLE_MA'}">
	<li class="meta-tag text-gray-color me-4 mb-1" style="margin-left: 1em">
		<i class="fas fa-solid fa-pen"></i>
    		<span class="ms-1 text-capitalize"><a href="${pageContext.request.contextPath }/blog/01/updatePost?what=${post.postNum }">Modify</a></span>
  	</li>
  	<li class="meta-tag text-gray-color me-4 mb-1" style='margin-left: 1em'>
		<i class="fa fa-trash" aria-hidden="true"></i>
		<span class="ms-1 text-capitalize"><a href="javascript:confirmDelete();">Delete</a></span>
  	</li>
</c:if>
```

- 추천이력은 DB에 저장되며 게시글 상세보기 클릭시 추천한 적이 있다면 빨간색 하트, 추천한 적이 없다면 회색 하트로 표현한다.
- 추천은 아이디당 같은 게시글에 대해서 한번만 가능하며 클릭하면 추천수가 증가하고, 한번 더 누르면 추천수가 감소한다. 
- 추천은 Ajax 비동기로 처리된다.
```javascript
let isChecked;
$("#recBtn").on("click", function(event){
	let selector = $(this).data("target");
	$.ajax({
		url : "${pageContext.request.contextPath }/blog/postRec",
		data : {
			what:${post.postNum}
		},
		dataType : "json",
		success : function(resp) {
			if(resp.success){
				$(selector).html(resp.count);
				if(isChecked == null){
					if(${post.isChecked} > 0){
						$('#heart').css('color','lightgray');
						isChecked = false;
					}
					else{
						$('#heart').css('color','red');
						isChecked = true;
					}
				}
				else{
					if(isChecked == true){
						$('#heart').css('color','lightgray');
						isChecked = false;
					}
					else{
						$('#heart').css('color','red');
						isChecked = true;
					}
				}	
			}
		},
		error : function(errorResp) {
			console.log(errorResp.status);
		}
	});
});
```

![localhost_rest4Trip_blog_01_viewPost_what=321 (3)](https://user-images.githubusercontent.com/96568009/208359404-bbf6779d-4f8e-4827-bf2f-89c25706f9a7.png)
- 댓글은 일반 댓글과 답글로 구분되며, 댓글은 프로필사진, 닉네임, 작성일, 내용으로 구성된다.
- 댓글에도 비밀글이 있으며, 비밀글 체크시 블로그 주인과 관리자만 확인이 가능하고, 답글의 경우 댓글작성자와 답글 작성자, 관리자만 확인이 가능하다.
- 대상자가 아닐경우 '비밀글입니다.' 문구가 보여지게 된다.
```html
<c:choose>
	<c:when test="${replyVo.replyScope eq 'private' && (post.blogId eq principal.realUser.accId || replyVo.accId eq principal.realUser.accId)}">
		<p id="${replyVo.replyNum }">${replyVo.replyCont }</p>
	</c:when>
	<c:when test="${replyVo.replyScope eq 'private' && (post.blogId ne principal.realUser.accId && replyVo.accId ne principal.realUser.accId)&&principal.realUser.memCode ne 'ROLE_MA'}">
		<p><i class="fas fa-lock"></i><span id="${replyVo.replyNum }" class="ml-1">비밀글입니다.</span></p>
	</c:when>
	<c:otherwise>
		<p id="${replyVo.replyNum }">${replyVo.replyCont }</p>
	</c:otherwise>
</c:choose>
```

<br>

### 여행지 페이지
![localhost_rest4Trip_destination_view_code=FR001](https://user-images.githubusercontent.com/96568009/208361243-7c364903-f930-4650-a517-f578e7abbe26.png)

- 날씨정보는 openweather API를 사용했고, API에서 기본으로 지원하는 아이콘은 조금 이상하게 생겨서 따로 날씨 아이콘을 구해 교체하는 작업을 진행했다.
- 현재시각 기준의 현지 날씨와 현재시각 기준의 3일뒤 날씨까지 화면에 보여지도록 구성했다.

![localhost_rest4Trip_destination_view_code=FR001 (1)](https://user-images.githubusercontent.com/96568009/208361701-9c1f816e-c80c-4d78-a6d6-d275ca8e2f6d.png)
- 관광지의 경우 카드섹션으로 구성했고, 각각의 카드들을 클릭하면 modal로 상세정보가 나오도록 구현했다.
![localhost_rest4Trip_destination_view_code=FR001 (2)](https://user-images.githubusercontent.com/96568009/208361894-f37ebd75-f19d-4a2a-aee0-7194c73a0768.png)

<br>

![image](https://user-images.githubusercontent.com/96568009/208362158-c9c90d80-e198-40ff-a81e-51e81e52b5f8.png)
![localhost_rest4Trip_calender_viewMyCalenders](https://user-images.githubusercontent.com/96568009/208362231-53a20f70-0346-4ca2-9a90-b9696f25f8dc.png)
- 여행지 정보 페이지에서 날짜를 선택하여 일정등록을 클릭하면 여행일정이 생성되고, 마이페이지-나의 여행 탭에서 확인이 가능하다.
- 여행일정은 유럽은 빨강, 아시아는 파랑, 미주지역은 초록, 그 이외의 지역은 노란색으로 구성했다.

