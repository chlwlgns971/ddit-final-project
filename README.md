## Rest 4 Trip(종합 여행정보 사이트 프로젝트)
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
