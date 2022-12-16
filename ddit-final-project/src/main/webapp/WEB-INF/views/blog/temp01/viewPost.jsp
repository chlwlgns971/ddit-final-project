<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<security:authentication property="principal" var="principal" />
<section class="ftco-section">
	<c:set value="${post }" var="post" />
	<c:set value="${blog }" var="blog" />
	<div class="py-8 py-md-9 py-lg-10">
    	<div class="container">
      		<div class="row">
        		<div class="col-lg-8 col-xl-9 order-1 order-md-0 order-lg-1">
          			<div class="container">
            			<div class="card-body px-2 py-6">
              				<h3 class="mb-4" style="font-weight: bold;">${post.postTitle }</h3>
  
              				<div class="meta-post-sm mb-4">
                				<ul class="list-unstyled d-flex flex-wrap mb-0">
                  					<li class="meta-tag me-4 mb-1">
                    					<i class="fa fa-user text-gray-color" aria-hidden="true"></i>
                    					<a class="text-gray-color hover-text-primary" href="">
                      						<span class="ms-1 text-capitalize">${post.blogNickname}</span>
                    					</a>
                  					</li>
  
				                  	<li class="meta-tag text-gray-color me-4 mb-1" style="margin-left: 1em">
				                    	<i class="fas fa-calendar-alt" aria-hidden="true"></i>
				                    	<span class="ms-1 text-capitalize">${post.postDate }</span>
				                  	</li>
				  
				                  	<li class="meta-tag text-gray-color me-4 mb-1" style="margin-left: 1em">
				                    	<i class="fa fa fa-tags" aria-hidden="true"></i>
				                    	<span class="ms-1 text-capitalize">${post.bcateName }</span>
				                  	</li>
				  
				                  	<li class="meta-tag text-gray-color me-4 mb-1" style="margin-left: 1em">
				                    	<i class="fa fa-eye" aria-hidden="true"></i>
				                    	<span class="ms-1 text-capitalize">${post.postHit }</span>
				                  	</li>
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
                				</ul>
              				</div>
  							<div id="editorArea" style="color: black;">${post.postCont }</div>
            			</div>
  						<div style="text-align: center; font-size: 15px">
              				<span id="recBtn" data-target="#recArea" class="btn">
              					<i class="fas fa-solid fa-heart" style='<c:if test="${post.isChecked > 0 }">color:red;</c:if><c:if test="${post.isChecked eq 0 }">color:lightgray;</c:if>' id="heart">
              						<span style="color: black;" id="recArea">${post.postRec }</span>
              					</i>
              				</span>
            			</div>
            			<div class="card-footer d-flex align-items-center bg-smoke rounded p-3 p-md-4" style="margin-top: 5%">
              				<span class="font-weight-bold font-size-15">Comments</span>
            			</div>	
            			<div class="mb-7 p-3 p-md-4">
            				<c:if test="${replyList ne null }">
					        <c:forEach var="replyVo" items="${replyList }">
					        	<c:if test="${replyVo.replyPnum eq null }">
					            <div class="media mb-8" style="border-bottom: 1px solid lightgray; padding-top: 30px;">
					              <div class="img-overlay rounded me-4" style="width: 75px; height: 75px; background-size: contain;">
					                <img class="w-100 lazyestload" src="${replyVo.accImg }" alt="Generic placeholder image">
					                <a href="" class="hover-img-overlay-dark"></a>
					              </div>
					  
					              <div class="media-body" style="color: black">
						              	<div class="mb-7">
						                  <div class='dropdown'>
							                  <h6 class="font-weight-bold text-capitalize mb-2">${replyVo.blogNickname }</h6>
							                  <input type="hidden" id="writer${replyVo.replyNum }" value="${replyVo.accId }">
							                  <input type="hidden" id="scope${replyVo.replyNum }" value="${replyVo.replyScope }">
							                  <c:if test="${replyVo.accId eq principal.realUser.accId || principal.realUser.memCode eq 'ROLE_MA'}">
							                  <a class="ms-1 text-capitalize" id='navbarScrollingDropdown' role='button' data-bs-toggle='dropdown' aria-expanded='true' style='color:#fd7e14; float: right' >
							  					<i class='fas fa-ellipsis-v' aria-hidden='true' id="ulTag${replyVo.replyNum }"></i>
							  				  </a>
											  <ul class='dropdown-menu' aria-labelledby='navbarScrollingDropdown'>
												<li><a class='dropdown-item' onClick='editBtn(${replyVo.replyNum})'>수정</a></li>
												<li><a class='dropdown-item' href='javascript:deleteBtn(${replyVo.replyNum})'>삭제</a></li>
											  </ul>
											  </c:if>
										  </div>
						                  <div class="meta-tag text-gray-color mb-3">
						                    <i class="fas fa-calendar-alt" aria-hidden="true"></i>
						                    <span class="ms-2 text-capitalize">${replyVo.replyDate }</span>
						                  </div>
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
						  					
						                 
						  
						                  <button onclick="location.href='javascript:replyBtn(${replyVo.replyNum })';" class="btn text-primary p-0" style="background-color: transparent">
						                    Reply
						                  </button>
						                </div>
						              	<div class="media flex-column flex-md-row mb-7" id="replyArea${replyVo.replyNum }"></div>
<%-- 					  					</c:if> --%>
<%-- 					  					<c:if test="${replyVo.replyPnum ne null }"> --%>
					  					<c:forEach var="replyVo2" items="${replyList }">
					  					<c:if test="${replyVo.replyNum eq replyVo2.replyPnum }">
							                <div class="media flex-column flex-md-row mb-7">
							                  <div class="img-overlay rounded mb-4 mb-md-0 me-md-4" style="width: 75px; height: 75px; background-size: contain;">
							                    <img class="w-100 lazyestload" src="${replyVo2.accImg }" alt="Generic placeholder image">
							                    <a href="" class="hover-img-overlay-dark"></a>
							                  </div>
							  
							                  <div class="media-body">
							                  	<div>
							                    	<h6 class="font-weight-bold text-capitalize mb-2" style="color: black;">${replyVo2.blogNickname }</h6>
						                     		<input type="hidden" id="writer${replyVo2.replyNum }" value="${replyVo2.accId }">
							                 		<input type="hidden" id="scope${replyVo2.replyNum }" value="${replyVo2.replyScope }">
						                     		<c:if test="${replyVo2.accId eq principal.realUser.accId || principal.realUser.memCode eq 'ROLE_MA'}">
						                     		<a class="ms-1 text-capitalize" id='navbarScrollingDropdown' role='button' data-bs-toggle='dropdown' aria-expanded='true' style='color:#fd7e14; float: right' >
							  							<i class='fas fa-ellipsis-v' aria-hidden='true' id="ulTag${replyVo2.replyNum }"></i>
							  				  		</a>
												  	<ul class='dropdown-menu' aria-labelledby='navbarScrollingDropdown'>
														<li><a class='dropdown-item' onClick='editBtn(${replyVo2.replyNum})'>수정</a></li>
														<li><a class='dropdown-item' onClick='deleteBtn(${replyVo2.replyNum})'>삭제</a></li>
												  	</ul>
												  	</c:if>
							  					</div>
							                    <div class="meta-tag text-gray-color mb-3">
							                      <i class="fas fa-calendar-alt" aria-hidden="true"></i>
							                      <span class="ms-2 text-capitalize">${replyVo2.replyDate }</span>
							                    </div>
							  					<c:choose>
								                  	<c:when test="${replyVo2.replyScope eq 'private' && (replyVo.accId eq principal.realUser.accId || replyVo2.accId eq principal.realUser.accId)}">
								  						 <p id="${replyVo2.replyNum }">${replyVo2.replyCont }</p>
								  					</c:when>
								  					<c:when test="${replyVo2.replyScope eq 'private' && (replyVo.accId ne principal.realUser.accId && replyVo2.accId ne principal.realUser.accId)&& principal.realUser.memCode ne 'ROLE_MA'}">
								  						 <p><i class="fas fa-lock"></i><span id="${replyVo2.replyNum }" class="ml-1">비밀글입니다.</span></p>
								  					</c:when>
								  					<c:otherwise>
								  						<p id="${replyVo2.replyNum }">${replyVo2.replyCont }</p>
								  					</c:otherwise>
						                  		</c:choose>
							                  </div>
							                </div>
										</c:if>
										</c:forEach>
					            	</div>
					        	</div>
					        	</c:if>
				        	</c:forEach>
				           </c:if>
				        </div>
				        <div class="mb-7 p-3 p-md-4">	
				        <h3 class="mb-6">Leave A Comments</h3>
            			<form:form modelAttribute="reply" action="${pageContext.request.contextPath }/blog/insertReply" method="POST" role="form" class="form">
            				<div class="form-group">
                				<form:textarea path="replyCont" class="form-control border-1 bg-smoke" rows="7" placeholder="Your Message" />
            				</div>
            				<form:hidden path="postNum" value="${post.postNum }"/>
  							<form:checkbox path="replyScope" name="scope" value="private"/><span class="ml-1">비밀글</span>
              				<button type="submit" class="btn btn-primary btn-outline-secondary text-uppercase py-2 font-weight-medium" style="float: right;">submit</button>
            			</form:form>
            			</div>
          			</div>		
        		</div>
        	</div>
    	</div>
	</div>
	<script type="text/javascript">
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
	function confirmDelete() {
		if(confirm("정말 삭제하시겠습니까?")) location.href="${pageContext.request.contextPath }/blog/01/deletePost?what=${post.postNum }&id=${post.blogId}";
	}
	
	//댓글 수정 버튼 누를 시, 실행
	function editBtn(no) {
		let reply = $('#'+no);
		let id = $('#writer'+no);
		let replyScope = $('#scope'+no);
		
		
		//댓글 컨텐츠 가져오기
		let text = reply.text();
		//댓글 아이디 가져오기
		let accId = id.val();
		//scope 가져오기
		let scope = replyScope.val();
		//오른쪽 수정,삭제  숨기기
		$('#ulTag'+no).css('display','none');
		let priv = "private";
		reply.html("<form id='editReplyForm' action='${cPath}/blog/updateReply' method='post'>"
				+ "<input type='hidden' name='replyNum' value='"+no+"'>"
				+ "<div class='row'>"
				+ "<div class='col-12'>"
				+ "<textarea name ='replyCont' class='form-control' rows='3'>"+ text + "</textarea>"
				+ "</div>"
				+ "<input type='hidden' name='accId' value='"+accId+"'/>"
				+ "<input type='hidden' name='postNum' value='${post.postNum}'/>"
				+ "<sec:csrfInput/>"
				+ "<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'/>"
				+ "</div>"
				+ "<input type='checkbox' name='replyScope' value='private' /><span class='ml-1'>비밀글</span>"
				+ "<button type='submit'  class='btn btn-primary btn-outline-secondary text-uppercase py-2 font-weight-medium' style='margin-top: 10px; float: right'>submit</button>"
				+ "</form>"
		);		
	}
	
	function deleteBtn(no) {	
		let postNum = ${post.postNum};
		let token = $('input[name="_csrf"]').val();
		let f = document.createElement('form');
		
		let obj;
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'replyNum');
	    obj.setAttribute('value', no);
	    f.appendChild(obj);
	    
	    let obj2;
	    obj2 = document.createElement('input');
	    obj2.setAttribute('type', 'hidden');
	    obj2.setAttribute('name', 'postNum');
	    obj2.setAttribute('value', postNum);
	    f.appendChild(obj2);
	    
	    f.setAttribute('method', 'post');
	    f.setAttribute('action', '${cPath}/blog/deleteReply?_csrf='+token);
	    document.body.appendChild(f);
	    f.submit();
	}
	
	function replyBtn(no) {
		$('.editReplyForm').empty();
		let reply = $('#replyArea'+no);
		reply.html("<form class='editReplyForm' action='${cPath}/blog/insertReply' method='post' style='width:100%;'>"
				+ "<input type='hidden' name='replyPnum' value='"+no+"'>"
				+ "<div class='row'>"
				+ "<div class='col-12'>"
				+ "<textarea name ='replyCont' class='form-control' rows='3'></textarea>"
				+ "</div>"
				+ "<input type='hidden' name='postNum' value='${post.postNum}'/>"
				+ "<sec:csrfInput/>"
				+ "<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'/>"
				+ "</div>"
				+ "<input type='checkbox' name='replyScope' value='private' /><span class='ml-1'>비밀글</span>"
				+ "<button type='submit'  class='btn btn-primary btn-outline-secondary text-uppercase py-2 font-weight-medium' style='margin-top: 10px; float: right'>submit</button>"
				+ "</form>"
		);		
	}
	</script>
</section>