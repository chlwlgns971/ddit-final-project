<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>	
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
    
  <div class="main-wrapper packages-list-left-sidebar">

<!-- ====================================
———	PAGE TITLE
===================================== -->
<section class="page-title">
  <div class="page-title-img bg-img bg-overlay-darken" style="background-image: url(${pageContext.request.contextPath }/resources/images/pages/page-title-bg15.jpg);">
    <div class="container">
      <div class="row align-items-center justify-content-center" style="height: 200px;">
        <div class="col-lg-6">
          <div class="page-title-content">
            <div class="title-border">
              <h2 class="text-uppercase text-white font-weight-bold">렌터카</h2>
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
<section class="bg-smoke py-10">
  <div class="container">
    <div class="row">
      <div class="col-lg-3">
        <div class="row">
			<form id="searchForm" name="searchForm" method="post"
							action="${pageContext.request.contextPath }/prod/rentcarList">
			<security:csrfInput/>
				<div class="col-md-6 col-lg-12">
					<div
						class="mb-6 bg-white px-3 py-6 border-top border-top-5 border-primary rounded">
						
						<h4 class="text-uppercase font-weight-bold">렌터카를 검색해 보세요</h4>
						<div class="mb-5">
							<div class="select-default select-category-1">
								<select id="continentsSelect" class="select-option">
									<option>대륙을 선택하세요.</option>
									<c:set var="continentsList" value="${continentsList }"></c:set>
									<c:choose>
										<c:when test="${not empty continentsList and fn:length(continentsList)!=0 }">
											<c:forEach items="${continentsList}" var="category" >
												<option value="${category.catCode}" >${category.catNam }</option>
											</c:forEach>
										
										</c:when>
										<c:otherwise>
											<option>조회 중 에러 발생. 새로고침 후 이용하시기 바랍니다.</option>
										</c:otherwise>
									</c:choose>
									
								</select>
							</div>
						</div>
						
						<div class="mb-5">
							<div class="select-default select-category-1">
								<select id="countrySelect" name="countrySelect" class="select-option">
									<option>국가를 선택하세요.</option>
								
								</select>
							</div>
						</div>
	
						<div class="mb-5">
							<div class="select-default select-category-1">
								<input type="hidden" />
									<select id="citySelect" class="select-option" name="cityName" >
										<option>도시를 선택하세요.</option>
										
									</select>
							</div>
						</div>
						<div
							class="form-group form-group-icon form-group-icon-dark mb-5">
							<input
								type="date"
								class="form-control daterange-picker sidebar-daterange-picker text-uppercase"
								name="resSdate" autocomplete="off" value="${pagingVO.detailMap.resSdate }" data-placeholder="차량 픽업일" required aria-required="true"/>
						</div>
	
						<div
							class="form-group form-group-icon form-group-icon-dark mb-5">
							<input
								type="date"
								class="form-control daterange-picker sidebar-daterange-picker text-uppercase"
								name="resEdate" autocomplete="off" value="${pagingVO.detailMap.resEdate}" data-placeholder="차량 반납일" required aria-required="true"/>
						</div>
						<div class="d-grid">
							<button type="submit"
								id="searchBtn"
								class="btn btn-block btn-xs btn-outline-secondary text-uppercase">렌터카
								검색</button>
						</div>
	                </div>
	            </div>
	
	

          <div class="col-md-6 col-lg-12">
            <div class="mb-6 bg-white p-3 pt-6 border-top border-top-5 border-primary rounded">
              <h4 class="text-uppercase font-weight-bold">필터</h4>

              <div class="accordion" id="accordionOne">
                <div class="card">
                  <div class="card-header" id="headingOne">
                    <h5 class="icon-bg" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true"
                      aria-controls="collapseOne">
                      <span>차량 종류</span>
                    </h5>
                  </div>
            
                  <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionOne">
                    <div class="card-body">
                      <div class="form-check custom-form-check">
                        <input class="form-check-input" type="checkbox" name="carKind" value="소형차" id="flexCheckDefault1">
                        <label class="form-check-label" for="flexCheckDefault1">
                    	      소형
                        </label>
                      </div>

                      <div class="form-check custom-form-check">
                        <input class="form-check-input" type="checkbox" name="carKind" value="중형차" id="flexCheckDefault2">
                        <label class="form-check-label" for="flexCheckDefault2">
                          	중형
                        </label>
                      </div>

                      <div class="form-check custom-form-check">
                        <input class="form-check-input" type="checkbox" name="carKind" value="대형차" id="flexCheckDefault3">
                        <label class="form-check-label" for="flexCheckDefault3">
                         	 대형
                        </label>
                      </div>

                      <div class="form-check custom-form-check">
                        <input class="form-check-input" type="checkbox" name="carKind" value="SUV" id="flexCheckDefault4">
                        <label class="form-check-label" for="flexCheckDefault4">
                          SUV
                        </label>
                      </div>
                    </div>
                  </div>
                </div>
            
                <div class="card">
                  <div class="card-header" id="headingTwo">
                    <h5 class="icon-bg collapsed" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false"
                      aria-controls="collapseTwo">
                      <span>변속기</span>
                    </h5>
                  </div>
            
                  <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionOne">
                    <div class="card-body">
                      <div class="form-check custom-form-check">
                        <input class="form-check-input" type="checkbox" name="carGear" value="AUTO" id="flexCheckDefault6">
                        <label class="form-check-label" for="flexCheckDefault6">
                          	자동
                        </label>
                      </div>

                      <div class="form-check custom-form-check">
                        <input class="form-check-input" type="checkbox" name="carGear" value="STICK" id="flexCheckDefault6">
                        <label class="form-check-label" for="flexCheckDefault6">
                          	수동
                        </label>
                      </div>
                    </div>
                  </div>
                </div>
            
                <div class="card">
                  <div class="card-header" id="headingThree">
                    <h5 class="icon-bg collapsed" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false"
                      aria-controls="collapseThree">
                      <span>차량옵션</span>
                    </h5>
                  </div>
            
                  <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-bs-parent="#accordionOne">
                    <div class="card-body">
                      <div class="form-check custom-form-check">
                        <input class="form-check-input" type="checkbox" name="carAc" value="YES" id="flexCheckDefault12">
                        <label class="form-check-label" for="flexCheckDefault12">
							에어컨
                        </label>
                      </div>

                      <div class="form-check custom-form-check">
                        <input class="form-check-input" type="checkbox" name="carHeat" value="YES" id="flexCheckDefault13">
                        <label class="form-check-label" for="flexCheckDefault13">
							열선시트
                        </label>
                      </div>

                      <div class="form-check custom-form-check">
                        <input class="form-check-input" type="checkbox" name="carNavi" value="YES" id="flexCheckDefault14">
                        <label class="form-check-label" for="flexCheckDefault14">
							네비게이션
                        </label>
                      </div>

                      <div class="form-check custom-form-check">
                        <input class="form-check-input" type="checkbox" name="carHp"value="YES" id="flexCheckDefault15">
                        <label class="form-check-label" for="flexCheckDefault15">
							하이패스
                        </label>
                      </div>

                      <div class="form-check custom-form-check">
                        <input class="form-check-input" type="checkbox" name="carHolder" value="YES" id="flexCheckDefault16">
                        <label class="form-check-label" for="flexCheckDefault16">
							핸드폰거치대
                        </label>
                      </div>

                      <div class="form-check custom-form-check">
                        <input class="form-check-input" type="checkbox" name="carCharg" value="YES" id="flexCheckDefault17">
                        <label class="form-check-label" for="flexCheckDefault17">
							차량용충전기
                        </label>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        <input type="hidden" name="page" />
	  </form>
    </div>
  </div>

      <div class="col-lg-9">
        <div class="mb-md-6">
          <div class="row align-items-center">
            <div class="col-md-6 col-xl-4">
              <div class="form-group mb-5 mb-md-0 bg-white">
                <div class="select-default select-category-2">
                  <select class="select-option">
                    <option>최신순</option>
                    <option>최저가순</option>
                    <option>리뷰 평점 높은순</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <div id="rentcarListArea">
<!--         	처음 렌터카페이지 진입 시 -->
			<c:set var="rentcarList" value="${pagingVO.dataList }"/>
			<c:if test="${not empty rentcarList }">
				<c:forEach items="${rentcarList }" var="rentcarList">
	        <div class="media media-list-view media-list-fullwidth media-border flex-column flex-md-row align-items-stretch mb-5">
	          <div class="media-img position-relative">
	            <img class="img-fluid position-relative lazyestload" data-src="${rentcarList.prodImg}" src="${rentcarList.prodImg}" alt="gallery-img">
	            <a class="media-img-overlay" data-fancybox="gallery" href="${rentcarList.prodImg}"></a>
	          </div>
	
	          <div class="media-body">
	            <div class="row" style="padding-top: 30px;">
	           
	              <div class="col-md-7 col-xl-8 position-relative">
	                <h4>
	                  <a class="media-title">${rentcarList.prodNam }</a>
					</h4> 
					<div>
					<span >${rentcarList.revNum}건의 이용후기</span>
					<span class='content-view text-uppercase border-right-0 ps-1'>(평점 ${rentcarList.cinfoArate })</span>
					</div>
					<br>
					<p>중형 </p>
	                <div>
						<i class="fas fa-user"></i> ${rentcarList.carSeat } &nbsp
						<i class="fas fa-suitcase"></i> ${rentcarList.carBag } &nbsp
		        		<i class="fa fa-car" aria-hidden="true"></i>  ${rentcarList.carGear } &nbsp
		        		<i class="far fa-snowflake"></i> 에어컨
	          
	                </div>
	              </div>
	
	              <div class="col-md-5 col-xl-4">
	                <div class="bg-primary text-center p-3 view-details">
	                  <h2 class="text-white font-weight-bold h3">￦ ${rentcarList.carPrice}</h2>
	                  <p class="text-white text-capitalize">1일 요금</p>
	                  <div>
	                     <a href='#' onclick='("${pageContext.request.contextPath }/prod/rentcarView")'
	                      class="btn btn-xs w-75 mx-auto btn-outline-white btn-booking text-uppercase mb-2">상세보기</a>
	                  </div>
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
	        </c:forEach>
	       </c:if> 
	        
	    </div>    
      </div>
    </div>
  </div>  

  <!-- ====================================
———	PAGINATION
===================================== -->
		<section class="pt-5 pt-md-7">
			<div class="container" id="pagingArea">${pagingVO.pagingHTML }
			</div>
		</section>

	</section>

</div><!-- element wrapper ends -->
  
<script>


//새창열기로 바꾸깅
function openRentcarView(url) {
	event.preventDefault();
	// 	alert(url);

	window.open(url, "carView", "");

}

//검색 버튼을 누르면 컨트롤러로 도시, 객실 수, 인원수, 체크인, 체크아웃 파라미터 전송하기
let search = $("searchForm").on("click", "#searchBtn", function(event){
	let inputTags = searchUI.find(":input[name]");
	$.each(inputTags, function(index, inputTag){
		let name = $(this).attr("name");
		let value = $(this).val();
		console.log("나왔니?");
		searchForm.get(0)[name].value = value;
		console.log("나왔니?");
	});
	searchForm.submit();
}); 



//검색폼의 대륙 선택하면 대륙에 속한 국가리스트 가져오기
$("#continentsSelect").on('change', function(event){
	let continentName = $(this).val();
	$.ajax({
		url : "${pageContext.request.contextPath}/prod/hotelList/country",
		data : { name: continentName},
		dataType : "json",
		success : function(resp) {
			$('#countrySelect').find("option").remove();   //대륙옵션 변경 시 전 대륙 결과와 함께 출력되서 옵션값 삭제기능 추가함
			let nationsList = resp;
			let options = [];
			
			options.push($("<option>").attr(
					"value", "000").prop(
					"selected", true).text(
					"국가를 선택하세요"));

			
			$.each(nationsList, function(index, category){	
				let option = $("<option>").attr("value", category.catCode)
										.text(category.catNam);
				options.push(option);
			})
			$('#countrySelect').append(options);
			$('#countrySelect').selectric('init'); 	//selectric 초기화
		},
		error : function(errorResp) {
			console.log(errorResp.status);
		}
	})
});


//국가 선택하면 국가에 속한 도시리스트 가져오기
$("#countrySelect").on('change', function(event){
	let countryName = $(this).val();
	$.ajax({
		url : "${pageContext.request.contextPath}/prod/hotelList/city",
		data : { name: countryName},
		dataType : "json",
		success : function(resp) {
			$('#citySelect').find("option").remove();   
			let nationsList = resp;
			let options = [];
			
			options.push($("<option>").attr(
					"value", "000").prop(
					"selected", true).text(
					"도시를 선택하세요"));
			
			$.each(nationsList, function(index, category){	
				let option = $("<option>").attr("value", category.catCode)
										.text(category.catNam);
				options.push(option);
			})
			$('#citySelect').append(options);
			$('#citySelect').selectric('init'); 	
		},
		error : function(errorResp) {
			console.log(errorResp.status);
		}
	})
});

$("select[name=searchArea]").change(function(){
	  console.log($(this).val()); //value값 가져오기
	  console.log($("select[name=searchArea] ")); //text값 가져오기
});

//차량종류 & 변속기 중복체크불가
$(document).ready(
		function() {
			$('input[type="checkbox"][name="carKind"]').click(
					function() {
						if ($(this).prop('checked')) {
							$('input[type="checkbox"][name="carKind"]')
									.prop('checked', false);
							$(this).prop('checked', true);
						}
					});
			$('input[type="checkbox"][name="carGear"]').click(
					function() {
						if ($(this).prop('checked')) {
							$('input[type="checkbox"][name="carGear"]')
									.prop('checked', false);
							$(this).prop('checked', true);
						}
					});
		});
		
		
		
//검색폼 결과 가져오기
let pageTag = $("[name=page]");
let rentcarListArea = $("#rentcarListArea");
let pagingArea = $("#pagingArea").on("click", "a", function(event) {
	event.preventDefault();
	let page = $(this).data("page");
	if (!page)
		return false;
	pageTag.val(page);
	searchForm.submit();
	return false;
});

let makeTrTag = function(rentcarList) {
	let code ="<div class='media media-list-view media-list-fullwidth media-border flex-column flex-md-row align-items-stretch mb-5'>";
	code += "<div class='media-img position-relative'>";
	code += "<img class='img-fluid position-relative lazyestload' data-src='"+rentcarList.prodImg+"' src='"+rentcarList.prodImg+"'>";
	code += "<a class='media-img-overlay' data-fancybox='gallery' href='"+rentcarList.prodImg+"'></a>";
	code += "</div>";
	code += "<div class='media-body'>";
	code += "<div class='row' style='padding-top: 30px;'>";

	code += "<div class='col-md-7 col-xl-8 position-relative'>";
	code += "<h4>";
	code += "<a class='media-title' href='javascript:void(0)'>"+rentcarList.prodNam+"</a>";
	code += "</h4> ";
	code += "<div> ";                                    
	code += "<span >"+rentcarList.revNum+"건의 이용후기</span>";
	code += "<span class='content-view text-uppercase border-right-0 ps-1'>(평점 "+rentcarList.cinfoArate+")</span>";
	code += "</div>";
	code += "<br>";
	code += "<p>"+rentcarList.carKind+" </p>";
	code += "<div> ";
	code += "<i class='fas fa-user'></i>&nbsp"+rentcarList.carSeat+"&nbsp";
	code += "<i class='fas fa-suitcase'></i>&nbsp"+rentcarList.carBag+" &nbsp";
	code += "<i class='fa fa-car' aria-hidden='true'></i>&nbsp"+rentcarList.carGear+" &nbsp";
	code += "<i class='far fa-snowflake'></i> 에어컨";
	code += "</div>";
	code += "</div>";
	code += "<div class='col-md-5 col-xl-4'>";
	code += "<div class='bg-primary text-center p-3 view-details'>";
	code += "<h2 class='text-white font-weight-bold h3'>￦"+rentcarList.carPrice+"</h2>";
	code += "<p class='text-white text-capitalize'>1일 요금</p>";
	code += "<div>";                                                                       
	code += `<a href='#' onclick='openRentcarView("${pageContext.request.contextPath}/prod/rentcarView?prodNum=\${rentcarList.prodNum}")'  class='btn btn-xs btn-outline-white btn-booking text-uppercase'>상세보기</a>`;
	code += "</div>";
	code += "</div>";
	code += "</div>";
	code += "</div>";
	code += "</div>";
	code += "</div>";
	

	return code;

}

let searchForm = $("#searchForm").on("submit", function(event) {
	event.preventDefault();
	let url = this.action;
	let method = this.method;
	let data = $(this).serialize();

	//		console.log("check:",data); 
	$.ajax({
		url : url,
		method : method,
		data : data,
		dataType : "json",
		success : function(page) {
			console.log(page);
			console.log(page.detailMap.savedCityName);

			rentcarListArea.empty();
			let rentcarLists = page.dataList;
			let trTags = [];
			if (rentcarLists.length > 0) {
				$.each(rentcarLists, function(index, rentcarList) {
					let tr = makeTrTag(rentcarList);
					trTags.push(tr);
				});
			}
			rentcarListArea.append(trTags);
			let pagingHTML = page.pagingHTML;
			pagingArea.html(pagingHTML);
			pageTag.val("");
		},
		error : function(errorResp) {
			console.log(errorResp.status);
		}
	});
	return false;
});
		

// 필터 체크드/언체크드 때마다 비동기로 재검색 결과 가져오기
let checkBox = $(".form-check-input");
console.log(checkBox.length);
let searchForm2 = $("#searchForm");
checkBox[0].addEventListener("change", searchSubmit, false);
console.log(checkBox[0]);
checkBox[1].addEventListener("change", searchSubmit, false);
checkBox[2].addEventListener("change", searchSubmit, false);
checkBox[3].addEventListener("change", searchSubmit, false);
checkBox[4].addEventListener("change", searchSubmit, false);
checkBox[5].addEventListener("change", searchSubmit, false);
checkBox[6].addEventListener("change", searchSubmit, false);
checkBox[7].addEventListener("change", searchSubmit, false);
checkBox[8].addEventListener("change", searchSubmit, false);
checkBox[9].addEventListener("change", searchSubmit, false);
checkBox[10].addEventListener("change", searchSubmit, false);
checkBox[11].addEventListener("change", searchSubmit, false);

function searchSubmit() {
	searchForm.submit();
}



</script>