<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<script src="<%=request.getContextPath()%>/resources/js/signup/kakaoMap.js"></script> <!-- 여기 있어야 맵 나옴 -->

<!-- ====================================
——— MODAL SECTION
===================================== -->

<!-- Login Modal -->
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-label="loginModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header rounded">
				<h3 class="modal-title text-uppercase font-weight-bold">
					로그인
				</h3>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>

			<form:form class="" action="${pageContext.request.contextPath }/login/loginCheck.do" method="post">
				<div class="modal-body">
					<!-- 아이디 입력받기 -->
					<div class="mb-3">
						<label for="employee-id">
							ID를 입력해 주세요 
						</label>
						<input id="accId" aria-describedby="employee-pw-hint" name="accId" type="text" 
							class="form-control bg-smoke" placeholder="dev0304" maxlength="20" minlength="4" required autofocus>
					</div>

					<!-- 비밀번호 입력받기 -->
					<div class="mb-3">
						<label for="employee-pw">
							비밀번호를 입력해 주세요
						</label>
						<input id="accPw" aria-describedby="employee-pw-hint" name="accPw" type="password" 
							 placeholder="WebStandard!dev2" class="form-control bg-smoke" required autofocus>
					</div>

						<!-- 회원구분 -->
						<div class="choiseButton div1">
							<input type="text" class="btn btn-outline-info" style="width:100%;margin-bottom:1%;" value="일반회원 : member/member" >
							<input type="text" class="btn btn-outline-info" style="width:100%;margin-bottom:1%;" value="사업자회원 : business/business" >
							<input type="text" class="btn btn-outline-info" style="width:100%;margin-bottom:1%;" value="관리자 : admin/admin" >
						</div>
					<br>
						<!-- 로그인 버튼 -->
						<div class="d-grid">
							<button type="submit" class="btn btn-primary text-uppercase">로그인</button>
						</div>
					</div>
					<br>

					<!-- 아이디 /비밀번호 찾기 -->
					<div class="mb-3 form-check mb-0">
						<a href="AccLoginn/forgotId.do">
							ID 찾기
						</a>
						또는
						<a href="AccLoginn/forgotPw.do">
							비밀번호 찾기
						</a>
						<br>
						
						<!-- MAP 좌표값 찾기 -->
						<a class="pull-right" href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#findxy">
							사업체 이름으로 위치 검색
						</a>
						<br>
						<!-- 회원가입 버튼 -->
						<p class="mb-1">
							회원가입 하시겠습니까? 
							<a href="AccLoginn/signup.do" >
								회원가입
							</a>
						</p>
					</div>
				</form:form>
			</div>
		</div>
	</div>

<!-- 지도맵 테스트 -->
<div class="modal fade" id="findxy" tabindex="-1" role="dialog" aria-label="forgotIdLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header rounded">
				<h3 class="modal-title text-uppercase font-weight-bold">사업체 주소로 좌표값 찾기</h3>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			
			<!-- 카카오 지도 api -->
			<div class="map_wrap">
			<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
			
				<div id="menu_wrap" class="bg_white">
				<div class="option">
					<div>
						<form onsubmit="searchPlaces(); return false;">
							키워드 : <input type="text" value="재단법인 대덕인재개발원" id="keyword" size="15"> 
							<button type="submit">검색하기</button> 
						</form>
					</div>
					</div>
				<hr>
				<ul id="placesList"></ul>
				<div id="pagination"></div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="<%=request.getContextPath()%>/resources/js/signup/loginMenu.js"></script>
