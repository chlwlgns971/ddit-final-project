<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="home-slider js-fullheight owl-carousel">
	

   	<div class="slider-item js-fullheight" style="background-image:url(${blogCate.bcateImg }); ">
   		<div class="overlay"></div>
   		<div class="container-fluid">
     		<div class="row no-gutters slider-text slider-text-2 js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
     			<div class="col-md-10 text-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
       				<h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">${blogCate.bcateName }</h1>
       				<p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">${blogCate.bcateImginfo }</p>
     			</div>
   			</div>
     	</div>
   	</div>
</section>
<section class="ftco-section">
	<div class="container">
	    <div class="row">
	    	<div class="col-lg-8">
	    		<div class="row" id="contentArea">
   					
   				</div>
   				<div class="row mt-5">
	          		<div class="col">
	            		<div class="block-27" id="pagingArea">
			            	
	            		</div>
	          		</div>
	        	</div>
   			</div><!-- END-->
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
			<option value>전체</option>
			<option value="title" ${pagingVO.simpleCondition.searchType eq 'title'?'selected':''}>제목</option>
			<option value="content" ${pagingVO.simpleCondition.searchType eq 'content'?'selected':''}>내용</option>
		</select>
	</div>
	<div class="col-auto">
		<input type="text" style="border:0px; border-bottom: 2px solid black;" name="searchWord" placeholder="검색키워드" class="form-control" value="${pagingVO.simpleCondition.searchWord}"/>
	</div>
	<div class="col-auto" style="padding-top: 1em;">
		<input type="button" value="검색" id="searchBtn" class="btn btn-primary"/>
		<c:if test="${blogCate.blogId eq principal.realUser.accId }">
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
		let code = "<div class='col-md-12'>";
		code+="<div class='blog-entry ftco-animate fadeInUp ftco-animated'>";
		code+="<a href='${pageContext.request.contextPath}/blog/01/viewPost?what="+blogPost.postNum+"' class='img' style='background-image: url("+blogPost.postThum+");'></a>";
		code+="<div class='text pt-2 mt-3'>";
		code+="<span class='category mb-1 d-block'><a href='#'>"+blogPost.bcateName+"</a></span>";
		code+="<h3 class='mb-4'><a href='${pageContext.request.contextPath}/blog/01/viewPost?what="+blogPost.postNum+"'>"+blogPost.postTitle+"</a></h3>";
		code+="<p class='mb-4'></p>";
		code+="<div class='author mb-4 d-flex align-items-center'>";
		code+="<a href='#' class='img' style='background-image: url("+blogPost.accImg+");'></a>";
		code+="<div class='ml-3 info'>";
		code+="<span>Written by</span>";
		code+="<h3><span style='font-weight: bold; font-size: 20px'>"+blogPost.blogNickname+"</span>, <span>"+blogPost.postDate+"</span></h3>"
		code+="</div>";
		code+="</div>";
		code+="<div class='meta-wrap d-md-flex align-items-center'>";
		code+="<div class='half order-md-last text-md-right'>"
		code+="<p class='meta' style='font-size: 15px'>"
		code+="<span><i class='fa fa-heart' aria-hidden='true'></i>"+blogPost.postRec+"</span> ";
		code+="<span><i class='fa fa-eye' aria-hidden='true'></i>"+blogPost.postHit+"</span> ";
		code+="<span><i class='fa fa-comments' aria-hidden='true'></i>"+blogPost.countReply+"</span>";
		code+="</p>";
		code+="</div>";
		code+="<div class='half'>";
		code+="<p><a class='btn p-3 px-xl-4 py-xl-3' style='color:orange' href=${pageContext.request.contextPath}/blog/01/viewPost?what="+blogPost.postNum+">Continue Reading <span class='fa fa-angle-right' aria-hidden='true'></span></a></p>";
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
						let data = makeContent(blogPost);
						content.push(data);
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
</script>