<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <div class="main-wrapper blog-list-right-sidebar">


<!-- ====================================
———	PAGE TITLE
===================================== -->
<section class="page-title">
  <div class="page-title-img bg-img bg-overlay-darken" style="background-image: url(${pageContext.request.contextPath }/resources/images/blog/blog-bg-01.png);">
    <div class="container">
      <div class="row align-items-center justify-content-center" style="height: 200px;">
        <div class="col-lg-6">
          <div class="page-title-content">
            <div class="title-border">
              <h2 class="text-uppercase text-white font-weight-bold">BLOG</h2>
            </div>
            <p class="text-white mb-0"></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- ====================================
——— TRAVEL LIST SECTION
===================================== -->
<section class="py-9 py-md-10">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-xl-9 order-1 order-lg-0" id="contentArea">
      	<c:forEach var="travelPostList" items="${PagingVO.dataList }">
      		<div class="card rounded-0 card-transparent border-bottom mb-7 pb-7">
          		<div class="row align-items-xl-center">
            		<div class="col-md-6">
              			<a href="${pageContext.request.contextPath}/blog/01/viewPost?what=${travelPostList.postNum }" class="position-relative">
               				<img class="card-img-top rounded lazyestload" data-src="${travelPostList.postThum }" src="${travelPostList.postThum }" alt="Card image cap" style="width:350px; height:230px; object-fit: cover;">
               				<div class="card-img-overlay card-hover-overlay rounded"></div>
              			</a>
            		</div>

            		<div class="col-md-6">
              			<div class="card-body px-md-0 py-6 pt-md-0">
                			<h3 class="mb-4">
                  				<a href="${pageContext.request.contextPath}/blog/01/viewPost?what=${travelPostList.postNum }" class="text-capitalize text-dark hover-text-primary" style="font-weight: bold;">${travelPostList.postTitle }</a>
               				</h3>
              
                			<div class="meta-post-sm mb-4">
                  				<ul class="list-unstyled d-flex flex-wrap mb-0">
                    				<li class="meta-tag me-4 mb-1">
	                      				<i class="fa fa-user text-gray-color" aria-hidden="true"></i>
	                      				<a class="text-gray-color hover-text-primary" href="${pageContext.request.contextPath}/blog/01/rest4TripBlog?id=${travelPostList.blogId }">
	                        				<span class="ms-1 text-capitalize">${travelPostList.blogNickname }</span>
	                      				</a>
                    				</li>
              
				                    <li class="meta-tag text-gray-color me-4 mb-1">
				                      <i class="fas fa-calendar-alt" aria-hidden="true"></i>
				                      <span class="ms-1 text-capitalize">${travelPostList.postDate }</span>
				                    </li>
              
				                    <li class="meta-tag text-gray-color me-4 mb-1">
				                      <i class='fa fa-heart' aria-hidden='true'></i>
				                      <span class="ms-1 text-capitalize">${travelPostList.postRec }</span>
				                    </li>
              
				                    <li class="meta-tag text-gray-color me-4 mb-1">
				                      <i class='fa fa-eye' aria-hidden='true'></i>
				                      <span class="ms-1 text-capitalize">${travelPostList.postHit }</span>
				                    </li>
                 				</ul>
                			</div>
                			
                			<p class="mb-0"></p>
              			</div>
              
			            <div class="card-footer px-5 px-lg-0">
			            	<a href="${pageContext.request.contextPath}/blog/01/viewPost?what=${travelPostList.postNum }" class="btn btn-sm btn-outline-secondary text-uppercase">View post</a>
			            </div>
            		</div>
          		</div>
        	</div>
      	</c:forEach>   	
      </div>
      <div class="col-lg-4 col-xl-3">
        <div class="mb-md-6 mb-lg-0">
          <div class="row">
            <div class="col-md-6 col-lg-12">
              <div class="bg-smoke border border-light-gray rounded p-3 mb-4">
                <h3 class="mb-4">My Blog</h3>
                <div style="display: flex; justify-content: center;">
                	<c:if test="${blog eq null }">
                		<a href="${pageContext.request.contextPath}/blogSet/createBlog"><button class="btn btn-primary" style="width: 200px; text-align: center;">블로그 시작하기</button></a>
                	</c:if>   
                	<c:if test="${blog ne null }">
                		<a href="${pageContext.request.contextPath}/blog/01/rest4TripBlog?id=${blog.blogId }"><button class="btn btn-primary" style="width: 200px; text-align: center;">내 블로그 바로가기</button></a>
                	</c:if>           
                </div>
              </div>
          
              <div class="d-none d-md-block">
                <div class="mb-4">
                  <ul class="nav nav-tabs nav-justified blog-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                      <a class="nav-link active" id="subcribe-tab" data-bs-toggle="tab" href="#subcribe" role="tab"
                        aria-controls="subcribe" aria-selected="true">Subcribe Post</a>
                    </li>
          
                    <li class="nav-item">
                      <a class="nav-link" id="popular-tab" data-bs-toggle="tab" href="#popular" role="tab" aria-controls="popular"
                        aria-selected="false">Most Like</a>
                    </li>
          
                    <li class="nav-item">
                      <a class="nav-link" id="hit-tab" data-bs-toggle="tab" href="#hit" role="tab" aria-controls="hit"
                        aria-selected="false">Most View</a>
                    </li>
                  </ul>
          
                  <div class="tab-content bg-smoke border border-light-gray border-top-0 rounded-bottom px-3 py-5" id="myTabContent">
                    <div class="tab-pane fade show active" id="subcribe" role="tabpanel" aria-labelledby="subcribe-tab">
                    	<c:forEach var="recentSubcribePostList" items="${recentSubcribePostList }">
	                      <div class="media meta-post-sm border-bottom border-off-white pb-3 mb-3">
	                        <div class="img-overlay rounded me-2">
	                          <img class="lazyestload" data-src="${recentSubcribePostList.postThum }" src="${recentSubcribePostList.postThum }" alt="Generic placeholder image" style="width: 100px; height: 100px; object-fit: cover;">
	                          <a href="${pageContext.request.contextPath}/blog/01/viewPost?what=${recentSubcribePostList.postNum }" class="hover-img-overlay-dark"></a>
	                        </div>
	          
	                        <div class="media-body">
	                          <a href="${pageContext.request.contextPath}/blog/01/viewPost?what=${recentSubcribePostList.postNum }" class="text-dark hover-text-primary text-capitalize mb-1">
	                            ${recentSubcribePostList.postTitle }
	                          </a>
	          
	                          <ul class="list-unstyled d-flex flex-wrap mb-0">
	                            <li class="meta-tag text-gray-color me-4 mb-1">
	                              <i class="fas fa-calendar-alt" aria-hidden="true"></i>
	                              <span class="ms-1 text-capitalize">${recentSubcribePostList.postDate }</span>
	                            </li>
	                            <li class="meta-tag text-gray-color me-4 mb-1">
	                              <i class="fa fa-user text-gray-color" aria-hidden="true"></i>
	                              <span class="ms-1 text-capitalize">${recentSubcribePostList.blogNickname }</span>
	                            </li>
	                          </ul>
	                        </div>
	                      </div>
                      	</c:forEach>	
                    </div>
          
                    <div class="tab-pane fade" id="popular" role="tabpanel" aria-labelledby="popular-tab">
                      <c:forEach var="weekRecPostList" items="${weekRecPostList }">
	                      <div class="media meta-post-sm border-bottom border-off-white pb-3 mb-3">
	                        <div class="img-overlay rounded me-2">
	                          <img class="lazyestload" data-src="${weekRecPostList.postThum }" src="${weekRecPostList.postThum }" alt="Generic placeholder image" style="width: 100px; height: 100px; object-fit: cover;">
	                          <a href="${pageContext.request.contextPath}/blog/01/viewPost?what=${weekRecPostList.postNum }" class="hover-img-overlay-dark"></a>
	                        </div>
	          
	                        <div class="media-body">
	                          <a href="${pageContext.request.contextPath}/blog/01/viewPost?what=${weekRecPostList.postNum }" class="text-dark hover-text-primary text-capitalize mb-1">
	                            ${weekRecPostList.rowNum }. ${weekRecPostList.postTitle }
	                          </a>
	          
	                          <ul class="list-unstyled d-flex flex-wrap mb-0">
	                            <li class="meta-tag text-gray-color me-4 mb-1">
	                              <i class="fas fa-calendar-alt" aria-hidden="true"></i>
	                              <span class="ms-1 text-capitalize">${weekRecPostList.postDate }</span>
	                            </li>
	                            <li class="meta-tag text-gray-color me-4 mb-1">
	                              <i class='fa fa-heart' style="color: red;" aria-hidden='true'></i>
	                              <span class="ms-1 text-capitalize">${weekRecPostList.postRec }</span>
	                            </li>
	                          </ul>
	                        </div>
	                      </div>
                      	</c:forEach>
                    </div>
          
                    <div class="tab-pane fade" id="hit" role="tabpanel" aria-labelledby="hit-tab">
     					<c:forEach var="weekHitPostList" items="${weekHitPostList }">
	                      <div class="media meta-post-sm border-bottom border-off-white pb-3 mb-3">
	                        <div class="img-overlay rounded me-2">
	                          <img class="lazyestload" data-src="${weekHitPostList.postThum }" src="${weekHitPostList.postThum }" alt="Generic placeholder image" style="width: 100px; height: 100px; object-fit: cover;">
	                          <a href="${pageContext.request.contextPath}/blog/01/viewPost?what=${weekHitPostList.postNum }" class="hover-img-overlay-dark"></a>
	                        </div>
	          
	                        <div class="media-body">
	                          <a href="${pageContext.request.contextPath}/blog/01/viewPost?what=${weekHitPostList.postNum }" class="text-dark hover-text-primary text-capitalize mb-1">
	                            ${weekHitPostList.rowNum }. ${weekHitPostList.postTitle }
	                          </a>
	          
	                          <ul class="list-unstyled d-flex flex-wrap mb-0">
	                            <li class="meta-tag text-gray-color me-4 mb-1">
	                              <i class="fas fa-calendar-alt" aria-hidden="true"></i>
	                              <span class="ms-1 text-capitalize">${weekHitPostList.postDate }</span>
	                            </li>
	                            <li class="meta-tag text-gray-color me-4 mb-1">
	                              <i class='fa fa-eye' aria-hidden='true'></i>
	                              <span class="ms-1 text-capitalize">${weekHitPostList.postHit }</span>
	                            </li>
	                          </ul>
	                        </div>
	                      </div>
                      	</c:forEach>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          
            <div class="col-md-6 col-lg-12 d-none d-md-block">
          
              <div class="">
                <div class="bg-smoke border border-light-gray rounded p-3 mb-4 mb-lg-0">
					<h3 class="mb-4">Search</h3>
                	<div class="form-subscribe mb-3" id="searchUI">
	                  <div class="input-group input-group-sm">
						<input type="text" name="searchWord" placeholder="검색키워드" class="form-control form-control-sm border-0" value="${PagingVO.simpleCondition.searchWord}"/>
	                    <button class="input-group-text border-0 btn bg-primary" id="searchBtn" type="submit">
	                      <i class="fa fa-search text-white" aria-hidden="true"></i>
	                    </button>
	                  </div>
                	</div>
                </div>
              </div>
            </div>
          </div>
        </div>
        
      </div>
    </div>

      </div>
</section>
<div class="container" id="pagingArea" style="margin-bottom: 5em">
	${PagingVO.pagingHTML }
</div>
<form id="searchForm">
	<input type="hidden" name="page" />
	<input type="hidden" name="searchType" value="all"/>
	<input type="hidden" name="searchWord" value="${PagingVO.simpleCondition.searchWord}"/>
</form>
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
		let code = `<div class="card rounded-0 card-transparent border-bottom mb-7 pb-7">
  		<div class="row align-items-xl-center">
		<div class="col-md-6">
  			<a href="${pageContext.request.contextPath}/blog/01/viewPost?what=\${blogPost.postNum }" class="position-relative">
   				<img class="card-img-top rounded lazyestload" data-src="\${blogPost.postThum }" src="\${blogPost.postThum }" alt="Card image cap" style="width:400px; height:280px; object-fit: cover;">
   				<div class="card-img-overlay card-hover-overlay rounded"></div>
  			</a>
		</div>

		<div class="col-md-6">
  			<div class="card-body px-md-0 py-6 pt-md-0">
    			<h3 class="mb-4">
      				<a href="${pageContext.request.contextPath}/blog/01/viewPost?what=\${blogPost.postNum }" class="text-capitalize text-dark hover-text-primary" style="font-weight: bold;">\${blogPost.postTitle}</a>
   				</h3>
  
    			<div class="meta-post-sm mb-4">
      				<ul class="list-unstyled d-flex flex-wrap mb-0">
        				<li class="meta-tag me-4 mb-1">
              				<i class="fa fa-user text-gray-color" aria-hidden="true"></i>
              				<a class="text-gray-color hover-text-primary" href="${pageContext.request.contextPath}/blog/01/rest4TripBlog?id=\${blogPost.blogId }">
                				<span class="ms-1 text-capitalize">\${blogPost.blogId }</span>
              				</a>
        				</li>
  
	                    <li class="meta-tag text-gray-color me-4 mb-1">
	                      <i class="fas fa-calendar-alt" aria-hidden="true"></i>
	                      <span class="ms-1 text-capitalize">\${blogPost.postDate }</span>
	                    </li>
  
	                    <li class="meta-tag text-gray-color me-4 mb-1">
	                      <i class='fa fa-heart' aria-hidden='true'></i>
	                      <span class="ms-1 text-capitalize">\${blogPost.postRec }</span>
	                    </li>
  
	                    <li class="meta-tag text-gray-color me-4 mb-1">
	                      <i class='fa fa-eye' aria-hidden='true'></i>
	                      <span class="ms-1 text-capitalize">\${blogPost.postHit }</span>
	                    </li>
     				</ul>
    			</div>
    			
    			<p class="mb-0"></p>
  			</div>
  
            <div class="card-footer px-5 px-lg-0">
            	<a href="${pageContext.request.contextPath}/blog/01/viewPost?what=\${blogPost.postNum }" class="btn btn-sm btn-outline-secondary text-uppercase">View post</a>
            </div>
		</div>
		</div>
		</div>`;
		
		
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
				let pagingHTML = page.pagingHTML;
				pagingArea.html(pagingHTML);
			},
			error : function(errorResp) {
				console.log(errorResp.status);
			}
		});
		return false;
	});
</script>
</div><!-- element wrapper ends -->