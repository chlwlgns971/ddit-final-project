<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Table Section -->
    <div class="table-dashboard mb-7">
      <div class="row">
        <div class="col-12">
          <h2 class="text-uppercase mb-3">나의 여행</h2>
          <table class="table table-hover">
            <tbody>
            <c:forEach var="calender" items="${calenders }">
              <tr>
                <th scope="row">
                <c:choose>
                	<c:when test="${calender.catuCode eq 'AS' }">
                		<div class="badge bg-info">
                	</c:when>
                	<c:when test="${calender.catuCode eq 'EU' }">
                		<div class="badge bg-danger">
                	</c:when>
                	<c:when test="${calender.catuCode eq 'AM' }">
                		<div class="badge bg-success-light">
                	</c:when>
                	<c:otherwise>
                		<div class="badge bg-warning">
                	</c:otherwise>
                </c:choose>
                    <span class="d-block">
                      <h1>${fn:substring(calender.calSdate,4,6) }</h1>
                      <h3>${fn:substring(calender.calSdate,0,3) }</h3>
                    </span>
                  </div>
                </th>
              
                <td class="second-child">
                <c:choose>
                	<c:when test="${calender.catuCode eq 'AS' }">
                		<i class="fa fa fa-plane border-info text-info" aria-hidden="true"></i>
                	</c:when>
                	<c:when test="${calender.catuCode eq 'EU' }">
                		<i class="fa fa fa-plane border-danger text-danger" aria-hidden="true"></i>
                	</c:when>
                	<c:when test="${calender.catuCode eq 'AM' }">
                		<i class="fa fa fa-plane border-success-light text-success-light" aria-hidden="true"></i>
                	</c:when>
                	<c:otherwise>
                		<i class="fa fa fa-plane border-warning text-warning aria-hidden="true"></i>
                	</c:otherwise>
                </c:choose>
                  <div>
                    <a href="${pageContext.request.contextPath}/calender/calenderDetail?what=${calender.calNum}" class="hover-text-info">${calender.areaName }</a>
                    <p class="">You are flying</p>
                  </div>
                </td>
              
                <td>
                	<c:choose>
	                	<c:when test="${calender.catuCode eq 'AS' }">
	                		<h2 class="text-info">${calender.catName }</h2>
	                	</c:when>
	                	<c:when test="${calender.catuCode eq 'EU' }">
	                		<h2 class="text-danger">${calender.catName }</h2>
	                	</c:when>
	                	<c:when test="${calender.catuCode eq 'AM' }">
	                		<h2 class="text-success-light">${calender.catName }</h2>
	                	</c:when>
	                	<c:otherwise>
	                		<h2 class="text-warning">${calender.catName }</h2>
	                	</c:otherwise>
	                </c:choose>
	               	<h4><a href="javascript:deleteCalender()">Delete</a></h4>
	               	<script type="text/javascript">
	               		function deleteCalender(){
	               			Swal.fire({
	               				title: 'Confirm',
	               			   	text: "정말로 삭제하시겠어요?",
	               			   	icon: 'question',
	               			   
	               			   	showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
	               			   	confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
	               			   	cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
	               			   	confirmButtonText: '확인', // confirm 버튼 텍스트 지정
	               			   	cancelButtonText: '취소', // cancel 버튼 텍스트 지정
	               			   
	               				   
	               			}).then(result => {
               				   // 만약 Promise리턴을 받으면,
               					if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면 
               					   $.ajax({
	               						url : "${pageContext.request.contextPath }/calender/deleteCalender?what=${calender.calNum}",
	               						method : "GET",
	               						success : function(resp) {
	               							if(resp == "success"){
	               								Swal.fire({
	               		               				title: 'Info',
	               		               			   	text: "삭제되었습니다!",
	               		               			   	icon: 'success',
	               		               			   	confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
	               		               			   	confirmButtonText: '확인', // confirm 버튼 텍스트 지정
	               		               			}).then(result => {
	               		          			   // 만약 Promise리턴을 받으면,
		               		          			   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면 
		               		          				location.href="${pageContext.request.contextPath }/calender/viewMyCalenders";
		               		          			   }
	               		          				});
	               							}
	               							else{
	               								Swal.fire({
	               		               				title: 'Info',
	               		               			   	text: "삭제에 실패했습니다. 계속 이상이 있다면 관리자에 문의를 남겨주세요.",
	               		               			   	icon: 'error',
	               		               			   	confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
	               		               			   	confirmButtonText: '확인', // confirm 버튼 텍스트 지정
	               		               			})
	               							}
	               						},
	               						error : function(errorResp) {
	               							console.log(errorResp.status);
	               						}
               					   })
               				   	}
	               			});
	               		}
	               	</script>
                </td>
              
                <td>
                  <ul class="list-unstyled">
                    <li class="">
                    	<c:choose>
		                	<c:when test="${calender.catuCode eq 'AS' }">
		                		<h5 class="text-info">DATE</h5>
		                	</c:when>
		                	<c:when test="${calender.catuCode eq 'EU' }">
		                		<h5 class="text-danger">DATE</h5>
		                	</c:when>
		                	<c:when test="${calender.catuCode eq 'AM' }">
		                		<h5 class="text-success-light">DATE</h5>
		                	</c:when>
		                	<c:otherwise>
		                		<h5 class="text-warning">DATE</h5>
		                	</c:otherwise>
	                	</c:choose>
                    </li>
              
                    <li>
                      <h6>${calender.calSdate }~${calender.calEdate }</h6>
                    </li>
              
                    <li class="">
                    	<c:choose>
		                	<c:when test="${calender.catuCode eq 'AS' }">
		                		<h5 class="text-info">Saved in</h5>
		                	</c:when>
		                	<c:when test="${calender.catuCode eq 'EU' }">
		                		<h5 class="text-danger">Saved in</h5>
		                	</c:when>
		                	<c:when test="${calender.catuCode eq 'AM' }">
		                		<h5 class="text-success-light">Saved in</h5>
		                	</c:when>
		                	<c:otherwise>
		                		<h5 class="text-warning">Saved in</h5>
		                	</c:otherwise>
	                	</c:choose>
                    </li>
              
                    <li>
                      <h6 class="mb-0">${calender.calWdate }</h6>
                    </li>
                  </ul>
                </td>
              </tr>
			</c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
