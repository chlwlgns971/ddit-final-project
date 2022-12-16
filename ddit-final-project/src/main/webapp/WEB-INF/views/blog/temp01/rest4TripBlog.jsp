<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<security:authentication property="principal" var="principal" />
<div class="hero-wrap js-fullheight" style="background-image: url(${pageContext.request.contextPath }/resources/images/blog/blog-single-01.jpg); color:black"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="js-fullheight d-flex justify-content-center align-items-center">
		<div class="col-md-8 text text-center">
			<div class="img mb-4"
				style="background-image: url(${blog.accImg});"></div>
			<div class="desc">
				<h2 class="subheading" style="color: black">Hello I'm</h2>
				<h1 class="mb-4">${blog.blogNickname }</h1>
				<p class="mb-4">
					${blog.blogIntro }
				</p>
				<c:if test="${blog.blogId ne principal.realUser.accId }">
					<c:if test="${subcribe eq 0 }">
						<p><a href="javascript:subcribeManage();" class="btn-custom" style="color: black; font-weight: bold;">Subcribe</a><span class="fas fa-share-square" style="color: black; margin-left: 5px"></span></p>
					</c:if>
					<c:if test="${subcribe > 0 }">
						<p><a href="javascript:subcribeManage();" class="btn-custom" style="color: black; font-weight: bold;">Subcribed</a><span class="fas fa-check-square" style="color: black; margin-left: 5px"></span></p>
					</c:if>
				
				</c:if>
			</div>
		</div>
	</div>
</div>
<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-2">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<h2 class="mb-4">전체글보기</h2>
				<p>“관점은 여행을 떠나야 비로소 변화한다. 길이 아주 갑자기, 전혀 예상치 못하게, 변명의 여지도 없이 아주 단호하게 방향을 틀거나 급경사로 바뀔 때, 비로소 우리는 다른 곳에서는 볼 수 없었던 그 모든 것들을 보게 된다.” </p>
				<p> – <산 위에 가서 말하라>, 제임스 볼드윈</p>
			</div>
		</div>
		<div class="row" id="contentArea">
			
		</div>
		<div class="row mt-5">
	  		<div class="col">
	    		<div class="block-27" id="pagingArea">
	    		
	    		</div>
	  		</div>
		</div>
	</div>
</section>


<form id="searchForm">
	<input type="hidden" name="page" />
	<input type="hidden" name="searchType" value="${simpleCondition.searchType}"/>
	<input type="hidden" name="searchWord" value="${simpleCondition.searchWord}"/>
</form>
<div id="searchUI" class="row g-3 justify-content-center" style="margin-bottom: 1em;">
	<div class="col-auto" style="padding-top: 1em;">
		<select name="searchType" class="form-select">
			<option value="all">전체</option>
			<option value="title" ${pagingVO.simpleCondition.searchType eq 'title'?'selected':''}>제목</option>
			<option value="content" ${pagingVO.simpleCondition.searchType eq 'content'?'selected':''}>내용</option>
		</select>
	</div>
	<div class="col-auto">
		<input type="text" style="border:0px; border-bottom: 2px solid black;" name="searchWord" placeholder="검색키워드" class="form-control" value="${pagingVO.simpleCondition.searchWord}"/>
	</div>
	<div class="col-auto" style="padding-top: 1em;">
		<input type="button" value="검색" id="searchBtn" class="btn btn-primary"/>
		<c:if test="${blog.blogId eq principal.realUser.accId }">
		<a class="btn btn-info" href="${pageContext.request.contextPath}/blog/01/insertPost">새글쓰기</a>
		</c:if>
	</div>
</div>
<script type="text/javascript">
	let searchUI = $("#searchUI").on("click", "#searchBtn", function(event){
		let inputTags = searchUI.find(":input[name]");
		$.each(inputTags, function(index, inputTag){
			let name = $(this).attr("name");
			let value = $(this).val();
			searchForm.get(0)[name].value = value;
		});
		searchForm.submit();
	});
	
	let pageTag = $("[name=page]");
	let contentArea = $("#contentArea");
	let pagingArea = $("#pagingArea").on("click", "a", function(event){
		event.preventDefault();
		let page = $(this).data("page");
		if(!page) return false;
		pageTag.val(page);
		searchForm.submit();
		return false;
	});
	
	let makeContent = function(blogPost){
		let code = "<div class='col-md-4'>";
		code+="<div class='blog-entry ftco-animate fadeInUp ftco-animated'>";
		code+="<a href='${pageContext.request.contextPath}/blog/01/viewPost?what="+blogPost.postNum+"' class='img img-2' style='background-image: url("+blogPost.postThum+");'></a>";
		code+="<div class='text text-2 pt-2 mt-3'>";
		code+="<span class='category mb-3 d-block'><a href=${pageContext.request.contextPath}/blog/01/blogCategoryList?cate="+blogPost.bcateNum+"&id="+blogPost.blogId+">"+blogPost.bcateName+"</a></span>";
		code+="<h3 class='mb-4'><a href='${pageContext.request.contextPath}/blog/01/viewPost?what="+blogPost.postNum+"'>"+blogPost.postTitle+"</a></h3>";
		code+="<p class='mb-4'></p>";
		code+="<div class='author mb-4 d-flex align-items-center'>";
		code+="<a href='#' class='img' style='background-image: url("+blogPost.accImg+");'></a>";
		code+="<div class='ml-3 info'>";
		code+="<span>Written by</span>";
		code+="<h3><span style='font-weight: bold; font-size: 20px'>"+blogPost.blogNickname+"</span>, <span>"+blogPost.postDate+"</span></h3>"
		code+="</div>";
		code+="</div>";
		code+="<div class='meta-wrap align-items-center'>";
		code+="<div class='half order-md-last'>"
		code+="<p class='meta' style='font-size: 15px'>"
		code+="<span><i class='fa fa-heart' aria-hidden='true'></i>"+blogPost.postRec+"</span>";
		code+="<span><i class='fa fa-eye' aria-hidden='true'></i>"+blogPost.postHit+"</span>";
		code+="<span><i class='fa fa-comments' aria-hidden='true'></i>"+blogPost.countReply+"</span>";
		code+="</p>";
		code+="</div>";
		code+="<div class='half'>";
		code+="<p><a class='btn py-2' style='color:orange' href=${pageContext.request.contextPath}/blog/01/viewPost?what="+blogPost.postNum+">Continue Reading <span class='fa fa-angle-right' aria-hidden='true'></span></a></p>";
		code+="</div>";
		code+="</div>";
		code+="</div>";
		code+="</div>";
		code+="</div>";
		
		
		return code;
	}
	
	let searchForm = $("#searchForm").on("submit", function(event){
		event.preventDefault();
		let url = this.action;
		let method = this.method;
		let data = $(this).serialize();
		$.ajax({
			url : url,
			method : method,
			data : data,
			dataType : "json",
			success : function(page) {
				contentArea.empty();
				pageTag.val("");
				let blogPostList = page.dataList;
				let content = [];
				if(blogPostList.length > 0){
					$.each(blogPostList, function(index, blogPost){
						let date = makeContent(blogPost);
						content.push(date);
					});
				}
				contentArea.append(content);
				let blogPaging = page.blogPaging1;
				pagingArea.html(blogPaging);
			},
			error : function(errorResp) {
				console.log(errorResp.status);
			}
		});
		return false;
	}).submit();
	
	function subcribeManage(){
		if(${subcribe eq 0 }) qa = "이 블로그를 구독하시겠습니까?";
		else qa = "이 블로그를 구독취소하시겠습니까?";
		Swal.fire({
			title: 'Confirm',
		   	text: qa,
		   	icon: 'question',
		   
		   	showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		   	confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		   	cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		   	confirmButtonText: '확인', // confirm 버튼 텍스트 지정
		   	cancelButtonText: '취소', // cancel 버튼 텍스트 지정
		   
			   
		}).then(result => {
			   // 만약 Promise리턴을 받으면,
			   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면 
				   location.href="${pageContext.request.contextPath }/blog/subcribe?blogId=${blog.blogId}&accId=${principal.realUser.accId}";
			   }
			});
	}
</script>
<!-- END COLORLIB-MAIN -->