<%@page import="kr.or.ddit.vo.ComplyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="complyMng">
	<div class="kmb-title">
		<h2>동행관리</h2>
	</div>

	<div class="container">
		<!-- Table Section -->
		<div class="table-dashboard mb-7">

			<div class="cmp-tab">
				<div class="cmpTab" onmouseover="OnMouseIn(this)"
					onmouseout="OnMouseOut(this)"
					onclick="location.href='${pageContext.request.contextPath }/mypage/member/personal/complybook?complyState=P'">동행예정</div>
				<div>&nbsp;</div>
				<div class="cmpTab" onmouseover="OnMouseIn(this)"
					onmouseout="OnMouseOut(this)"
					onclick="location.href='${pageContext.request.contextPath }/mypage/member/personal/complybook?complyState=C'">동행완료</div>
			</div>
			<div class="background-color">
				<div class="cmpTableDiv">
					<table class="cmpTable">
						<thead>
							<tr>
								<th class="cmpTH">동행 예정일</th>
								<th class="cmpTH">동행 아이디</th>
							</tr>
						</thead>
						<tbody id="complyBookTbody">
							
							<% 	List<ComplyVO> list = (List<ComplyVO>) request.getAttribute("complyVOPostList");
								// 리스트 안의 데이터가 존재할 때
								if(list.size()>0&&list!=null){
									for (ComplyVO vo : list){
										pageContext.setAttribute("complyVO",vo);
							%>
								<tr>
									<td class="cmpTD">${complyVO.complySdate} ~ ${complyVO.complyEdate}</td>
									<td class="cmpTD"><a href="javascript:void(0);" onclick="complyDetailFunc('${complyVO.complyId}');"><%=vo.getComplyId() %></a></td>
								</tr>		
							<%			
									}
									//리스트 안의 데이터가 없을 때
								}else{
							%>
								<tr>
									<td colspan="2" class="cmpTD">해당 데이터가 존재하지 않습니다.</td>
								</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>

				<!-- ====================================
            ———   PAGINATION
            ===================================== -->
				<section class="pt-5 pt-md-7">
					<div class="container">
<!-- 						<nav aria-label="Page navigation"> -->
<!-- 							<ul class="pagination justify-content-center align-items-center"> -->
<!-- 								<li class="page-item"><a class="page-link" -->
<!-- 									href="javascript:void(0)" tabindex="-1"> <i -->
<!-- 										class="fas fa-long-arrow-alt-left d-none d-md-inline-block me-md-1" -->
<!-- 										aria-hidden="true"></i> Previous -->
<!-- 								</a></li> -->

<!-- 								<li class="page-item"><a class="page-link active" -->
<!-- 									href="javascript:void(0)">1</a></li> -->

<!-- 								<li class="page-item"><a class="page-link" -->
<!-- 									href="javascript:void(0)">2</a></li> -->

<!-- 								<li class="page-item"><a class="page-link" -->
<!-- 									href="javascript:void(0)">3</a></li> -->

<!-- 								<li class="page-item"><a class="page-link" -->
<!-- 									href="javascript:void(0)">...</a></li> -->

<!-- 								<li class="page-item"><a class="page-link" -->
<!-- 									href="javascript:void(0)">9</a></li> -->

<!-- 								<li class="page-item"><a class="page-link" -->
<!-- 									href="javascript:void(0)">Next <i -->
<!-- 										class="fas fa-long-arrow-alt-right d-none d-md-inline-block ms-md-1" -->
<!-- 										aria-hidden="true"></i> -->
<!-- 								</a></li> -->
<!-- 							</ul> -->
<!-- 						</nav> -->
					</div>
				</section>
			</div>
		</div>
	</div>
</div>


