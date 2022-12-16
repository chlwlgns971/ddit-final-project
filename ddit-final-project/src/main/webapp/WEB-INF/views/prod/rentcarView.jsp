<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>     
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%> 
<security:authentication property="principal" var="principal" />

<div class="main-wrapper packages-list-left-sidebar">
<!-- ====================================
———	PAGE TITLE
===================================== -->
<section class="page-title">
  <div class="page-title-img bg-img bg-overlay-darken" style="background-image: url(${pageContext.request.contextPath }/resources/images/pages/page-title-bg15.jpg);" >
    <div class="container">
      <div class="row align-items-center justify-content-center" style="height: 200px;">
        <div class="col-lg-6">
          <div class="page-title-content">
            <div class="title-border">
              <h2 class="text-uppercase text-white font-weight-bold">${rentcarInfo.cinfoTitle }</h2>
            </div>
            <p class="text-white mb-0"></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- ====================================
———	PACKAGES SECTION
===================================== -->
<section class="py-10">
  <div class="container">
    <div class="row">
      <div class="col-md-5 col-lg-4 order-2">
        <form action="${cPath }/booking/step1" method="post">
        <security:csrfInput />
          <div class="card border">
            <h2 class="card-header text-uppercase text-center bg-smoke border-bottom">
              픽업/반납
            </h2>

            <div class="card-body px-3 py-4">
              <div class="border-bottom mb-5">
                <div class="form-group mb-5">
                  <div class="row">
                    <label for="inputTime" class="col-xl-5 col-form-label text-center text-xl-end px-2">픽업일:</label>

                    <div class="col-xl-7">
                      <div class="form-group form-group-icon form-group-icon-category-2 mb-0">
                        <input type="text" class="form-control daterange-picker-category-2" autocomplete="off" name="resSdate" id="resSdate" value="${resSdate }">
                      </div>
                    </div>
                  </div>
                </div>


                <div class="form-group mb-5">
                  <div class="row">
                    <label for="inputTime" class="col-xl-5 col-form-label text-center text-xl-end px-2">반납일:</label>

                    <div class="col-xl-7">
                      <div class="form-group form-group-icon form-group-icon-category-2 mb-0">
                        <input type="text" class="form-control daterange-picker-category-2" autocomplete="off" name="resEdate" id="resEdate" value="${resEdate }">
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="d-flex justify-content-between border-bottom mb-5 pb-5">
              	<input type="hidden" name="prodNum" value="${rentcarInfo.prodNum }">
              	<input type="hidden" id="carPrice" value="${rentcarInfo.carPrice}">
              	<input type="hidden" name="prodPrice" id="prodPrice" value="">
                <span id="dayArea" class="text-uppercase h4 mb-0">x일 렌터카요금</span>
                <span id="totalPrice" class="font-weight-bold text-primary h3 mb-0"></span>
              </div>

              <div class="d-grid text-center px-4">
                <button type="submit" 
                  class="btn btn-hover btn-lg btn-outline-secondary text-uppercase">
                  예약하기 <span class="ms-4"><i class="fa fa-angle-right" aria-hidden="true"></i></span>
                </button>
              </div>
            </div>
          </div>
        </form>
      </div>

      <div class="col-md-7 col-lg-8">
        <div id="package-slider" class="owl-carousel owl-theme package-slider">
          <div class="item">
            <img class="lazyestload" data-src="${rentcarInfo.prodImg}" src="${rentcarInfo.prodImg}" alt="image">
          </div>
        </div>
   
        <div class="mt-8">
          <h2 class="text-uppercase mb-5">차량 옵션 정보
          </h2>
          
          <div class="prodDesc">
          	<table>
          		<tr>
          			<td class="rctd"><i class="fas fa-user"></i>${rentcarInfo.carSeat } 인승</td>
          			<td class="rctd"><i class="fa fa-car" aria-hidden="true"></i> ${rentcarInfo.carGear }</td>
          		</tr>
          		<tr>
          			<td class="rctd"><i class="fas fa-suitcase"></i> ${rentcarInfo.carBag }</td>
          			<td class="rctd">${rentcarInfo.carColor }</td>
          		</tr>
          		<tr>
          			<td class="rctd"><i class="fa fa-fire" aria-hidden="true"></i>${rentcarInfo.carFuel }</td>
          			<td class="rctd"><i class="far fa-snowflake"></i> 에어컨</td>
          		</tr>
          		<tr>
          			<td class="rctd">
          				<c:if test='${rentcarInfo.carNavi eq "YES"}'>
		 		       		<i class="fas fa-map-marked-alt"></i> 네비게이션  
		        	  	</c:if>
          			</td>
          			<td class="rctd">
          				<c:if test='${rentcarInfo.carHeat eq "YES"}'>
		 		       		<i class="fas fa-hot-tub"></i> 열선시트 
		        	  	</c:if>
          			</td>
          		</tr>
          		<tr>
          			<td class="rctd">
          				<c:if test='${rentcarInfo.carHp eq "YES"}'>
		 		       		<i class="fa fa-road" aria-hidden="true"></i> 하이패스 
		        	  	</c:if>
          			</td>
          			<td class="rctd">
          				<c:if test='${rentcarInfo.carCharg eq "YES"}'>
		 		       		<i class="fa fa-plug" aria-hidden="true"></i> 차량용충전기  
		        	  	</c:if>
          			</td>
          		</tr>
          		<tr>
          			<td class="rctd">
          				<c:if test='${rentcarInfo.carCharg eq "YES"}'>
		 		       		<i class="fa fa-plug" aria-hidden="true"></i> 차량용충전기  
		        	  	</c:if>
          			</td>
          			<td class="rctd">
          				<c:if test='${rentcarInfo.carHolder eq "YES"}'>
		 		       		<i class="fas fa-map-marked-alt"></i> 거치대  
		        	  	</c:if>
          			</td>
          		</tr>
          	</table>
          </div>
        </div>
        
              
		<div class="mt-8">
          <h2 class="text-uppercase mb-5">렌터카업체 정보</h2>
          
          <div class="prodDesc">
          <br>
        	<h3>${rentcarInfo.cinfoTitle }</h3>
        	<span>${rentcarInfo.comAddr }</span>
          
          </div>
			
        </div>
        <br>
		<br>
		<br>
        <div class="mb-7">
          <h2 class="text-uppercase mb-6">렌터카 픽업 위치</h2>
        </div>

        <div class="mb-7" id="map" style="width:100%; height:400px;"></div>

        <div class="mb-7">
          <h2 class="text-uppercase mb-6"> 렌터카 이용 후기</h2>

          <div class="d-flex align-items-center mb-6">
            <h3 class="text-uppercase mb-0">
              <span class="me-2">이용 후기 (3)</span>

              <span class="text-warning">
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
<!--                 <i class="fa fa-star" aria-hidden="true"></i> -->
              </span>
            </h3>
          </div>

          <div class="media mb-6">
            <a class="me-6" href="">
              <img class="rounded lazyestload" data-src="${pageContext.request.contextPath }/resources/images/blog/comments-02.jpg" src="${pageContext.request.contextPath }/resources/images/blog/comments-02.jpg" alt="Generic placeholder image">
            </a>

            <div class="media-body">
              <h5>choi</h5>
              <span class="text-warning">
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
   
              </span>
              <p class="mb-0">차량 상태가 좋았어요.</p>
            </div>
          </div>

          <div class="media mb-6">
            <a class="me-6" href="">
              <img class="rounded lazyestload" data-src="${pageContext.request.contextPath }/resources/images/blog/comments-01.jpg" src="${pageContext.request.contextPath }/resources/images/blog/comments-01.jpg" alt="Generic placeholder image">
            </a>

            <div class="media-body">
                <h5>mungbum</h5>
               <span class="text-warning">
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
              </span>
              <p class="mb-0">차에서 쾌쾌한 냄새가 나서 불쾌했어요</p>
            </div>
          </div>

          <div class="media">
            <a class="me-6" href="">
              <img class="rounded lazyestload" data-src="${pageContext.request.contextPath }/resources/images/blog/comments-03.jpg" src="${pageContext.request.contextPath }/resources/images/blog/comments-03.jpg" alt="Generic placeholder image">
            </a>
            <div class="media-body">
              <h5>hallabong</h5>
              <span class="text-warning">
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
   
              </span>
              <p class="mb-0">합리적인 가격이 좋아요</p>
            </div>
          </div>
        </div>

        <form class="mb-9 mb-md-0">
          <h3 class="text-uppercase mb-6">이용 후기를 남겨주세요</h3>

          <p class="rating-view d-flex align-items-center">
            <span class="content-view">평점 주기</span>
            <span class="star add-rating-default ms-2"></span>
          </p>

          <div class="form-group mb-6">
            <textarea class="form-control border-0 bg-smoke" placeholder="내용" rows="6"></textarea>
          </div>

          <div class="">
            <button type="button" onclick="location.href='javascript:void(0)';"
              class="btn btn-hover btn-outline-secondary text-uppercase">
              작성하기
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>
<script src='https://maps.googleapis.com/maps/api/js?key=<api키>'></script>

<script>


//렌트일 계산
let resSdate = $("#resSdate").val();
let resEdate = $("#resEdate").val();
console.log("resSdate", resSdate);
console.log("resEdate", resEdate);
let pickUp = new Date(resSdate);
let returnCar = new Date(resEdate);
let dayIn = pickUp.getTime();
let dayOut = returnCar.getTime();
let dayOfRent = (dayOut - dayIn)/1000/60/60/24;
console.log("몇일대여하세용?:", dayOfRent );
$("#dayArea").html(dayOfRent+"일 렌터카요금");

let carPrice = $("#carPrice").val();

let calcPrice = carPrice * dayOfRent;
$("#prodPrice").val(calcPrice);
$("#totalPrice").html('￦'+calcPrice);
console.log(carPrice);
console.log(calcPrice);

</script>
