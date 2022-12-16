<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href='<%=request.getContextPath()%>/resources/css/hmg.css'
	rel='stylesheet'>
<c:set var="proInfo" value="${list }" />
<c:set var="mem" value="${mem }" />

<section class="page-title">
	<div class="page-title-img bg-img bg-overlay-darken"
		style="background-image: url(${pageContext.request.contextPath }/resources/images/pages/page-title-bg13.jpg);">
		<div class="container">
			<div class="row align-items-center justify-content-center"
				style="height: 200px;">
				<div class="col-lg-6">
					<div class="page-title-content">
						<div class="">
							<h2 class="text-uppercase text-white font-weight-bold">보험상품</h2>
						</div>
						<p class="text-white mb-0">여행자보험, 실속, 표준, 고급플랜을 제공하며 커스텀이
							가능합니다</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="py-8 py-md-10">
	<div class="container">
		<div class="mb-8">
			<div class="row progress-wizard">
				<div class="col-6 progress-wizard-step active">
					<div class="progress">
						<div class="progress-bar"></div>
					</div>

					<div class="progress-wizard-dot">
						<div class="progress-wizard-content">
							<i class="fas fa-laptop-medical" aria-hidden="true"></i> <span
								class="d-block">1. 여행자보험 플랜 선택 및 가입자 정보 입력</span>
						</div>
					</div>
				</div>

				<div class="col-6 progress-wizard-step incomplete">
					<div class="progress">
						<div class="progress-bar"></div>
					</div>

					<div class="progress-wizard-dot">
						<div class="progress-wizard-content">
							<i class="fas fa-won-sign" aria-hidden="true"></i> <span
								class="d-block">2. 결제 및 보험 확인</span>
						</div>
					</div>
				</div>
			</div>
		</div>





		<section class="py-10">
			<div class="container">
				<div class="row">
					<div class="col-md-5 col-lg-4 order-2">
						<div class="card border">
							<!-- 	<div class="row"> -->
							<!-- 		<div class="col-md-5 col-lg-4 order-2"> -->

							<!-- 			<div class="card border"> -->
							<h2
								class="card-header text-uppercase text-center bg-smoke border-bottom">Booking</h2>
							<div class="card-body px-3 py-4 ">
								<div class="border-bottom mb-5">
									<div class="form-group mb-5">
										<div class="row">
											<label for="inputTime"
												class="col-xl-5 col-form-label text-center text-xl-right px-2">시작일:</label>
											<div class="col-xl-7">
												<input type="date"
													class="form-control daterange-picker-category-2 sdate dataset"
													value="" name="sdate" />
												<!-- 									<div -->
												<!-- 										class="form-group form-group-icon form-group-icon-category-2 mb-0"> -->
												<!-- 										<i class="far fa-calendar-alt" aria-hidden="true"></i> <input -->
												<!-- 											type="text" class="form-control daterange-picker-category-2 sdate" -->
												<!-- 											autocomplete="off" name="dateRange" value="" -->
												<!-- 											placeholder="MM/DD/YYYY"> -->
												<!-- 									</div> -->
											</div>
										</div>
									</div>
									<div class="form-group mb-5">
										<div class="row">
											<label for="inputTime"
												class="col-xl-5 col-form-label text-center text-xl-right px-2">종료일:</label>

											<div class="col-xl-7">
												<input type="date"
													class="form-control daterange-picker-category-2 edate dataset"
													value="" name="edate" />
												<!-- 									<div -->
												<!-- 										class="form-group form-group-icon form-group-icon-category-2 mb-0"> -->
												<!-- 										<i class="far fa-calendar-alt" aria-hidden="true"></i> <input -->
												<!-- 											type="text" class="form-control daterange-picker-category-2 edate" -->
												<!-- 											autocomplete="off" name="dateRange" value="" -->
												<!-- 											placeholder="MM/DD/YYYY"> -->
												<!-- 									</div> -->
											</div>
										</div>
									</div>

									<div class="form-group mb-5">
										<div class="row align-items-center">
											<label
												class="control-label col-xl-5 text-center text-xl-right">인원수:</label>

											<div class="col-xl-7">
												<div class="count-input mx-auto">
													<a class="incr-btn" data-action="decrease"
														href="javascript:void(0)">–</a> <input class="quantity"
														type="number" value="1" name="quantity" readOnly>
													<a class="incr-btn" data-action="increase"
														href="javascript:void(0)">+</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="d-flex justify-content-between mb-5 pb-5">
									<span class="text-uppercase h6 mb-0">금액</span>
									<c:set var="sum" value="0" />
									<c:forEach items="${list }" var="proInfo">
										<c:set var="sum" value="${sum+ proInfo['pinfSPay']}" />
									</c:forEach>
									<span class="font-weight-bold text-primary h5 mb-0 total">
										<fmt:formatNumber value="${sum }" />원
									</span> <input type="hidden" id="totAmount" name="totAmount"
										value="${sum }" />
									<!-- 							하루 보험금액 -->
								</div>

								<div class="d-flex justify-content-between mb-5 pb-5">
									<span class="text-uppercase h6 mb-0">일수</span> <span
										class="font-weight-bold text-primary h5 mb-0 dateDiff">
									</span> <input type="hidden" class="" id="totDate" name="totDate"
										value="" />
									<!-- 							신청한 보험일수 -->
								</div>

								<div class="d-flex justify-content-between mb-5 pb-5">
									<span class="text-uppercase h6 mb-0">인원수</span> <span
										class="font-weight-bold text-primary h5 mb-0 quantityResult">1명</span>
									<input type="hidden" id="totCount" class="dataset"
										name="totCount" value="" />
									<!-- 							총 인원수 -->
								</div>

								<div class="d-flex justify-content-between mb-5 pb-5  ">
									<span class="text-uppercase h3 mb-0">Total cost</span> <span
										class="font-weight-bold text-primary h2 mb-0 totalCost">
										<%-- 								<fmt:formatNumber value="${sum }"/>원 --%>
									</span> <input type="hidden" class="dataset" id="totCost"
										name="totCost" value="" />
									<!-- 							총금액 -->
								</div>

								<div class="text-center px-4">
									<form:form class="insBook" id="insBook">
										<button type="button" onclick="insBookForm()" value=""
											class="btn btn-hover btn-lg btn-block btn-outline-secondary text-uppercase">
											신청 <span class="ms-4"><i class="fa fa-angle-right"
												aria-hidden="true"></i></span>
										</button>
									</form:form>
								</div>
							</div>
						</div>
					</div>

					<!-- 	//asd -->
					<div class="col-md-7 col-lg-8 order-1 order-md-0">
						<div class="accordion" id="accordionPanelsStayOpenExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="panelsStayOpen-headingOne">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse"
										data-bs-target="#panelsStayOpen-collapseOne"
										aria-expanded="true"
										aria-controls="panelsStayOpen-collapseOne">플랜선택</button>
								</h2>
							</div>
							<div id="panelsStayOpen-collapseOne"
								class="accordion-collapse collapse show"
								aria-labelledby="panelsStayOpen-headingOne">
								<div class="accordion-body">
									<div>
										<table class="border-top">
											<thead>
												<tr class="border-top">
													<th class="col-3" style="text-align: center; height: 3rem;">구분</th>
													<th class="col-2" style="text-align: right"><a
														href="javascript:void(0)" class="clickedB">실속플랜</a></th>
													<th class="col-2" style="text-align: right"><a
														href="javascript:void(0)" style="color: #01ace4" class="clickedS">표준플랜</a></th>
													<th class="col-2" style="text-align: right"><a
														href="javascript:void(0)" class="clickedP">고급플랜</a></th>
													<th class="col-2"
														style="text-align: right; padding-right: 1rem;">금액</th>
												</tr>
											</thead>
											<tbody>
												<c:choose>
													<c:when test="${not empty list }">
														<c:forEach items="${list }" var="proInfo">
															<tr class="border-top">
																<td style="text-align: center">
																	<p style="padding-top: 1rem;">
																		<a href="javascript:void(0)" data-bs-toggle="modal"
																			data-bs-target="#modal${proInfo['pinfNum'] }">${proInfo['pinfNam'] }</a>
																	<p>
																		<input type="hidden" class="dataset" name="pinfNum"
																			value="${proInfo['pinfNum'] }" /> <input
																			type="hidden"
																			class="pinCode${proInfo['pinfNum'] } dataset"
																			name="pinCode" value="INSS" />
																</td>
																<td style="text-align: right">
																	<div class="form-check">
																		<input hidden="hidden"
																			class="form-check-input checkedBPay${proInfo['pinfNum'] }"
																			type="radio" name="flexRadio${proInfo['pinfNum'] }"
																			id="pinf${proInfo['pinfNum'] }radio1"
																			value="${proInfo['pinfBPay'] }" /> <label
																			class="form-check-label checkedB checkedB${proInfo['pinfNum'] }"
																			for="pinf${proInfo['pinfNum'] }radio1"
																			onclick="checkedB(${proInfo['pinfNum'] })">${proInfo['pinfB'] }</label>
																	</div> <%-- 													<p hidden="hidden" class="checkedBPay${proInfo['pinfNum'] }">${proInfo['pinfBPay'] }</p> --%>
																</td>
																<td style="text-align: right">
																	<div class="form-check">
																		<input hidden="hidden"
																			class="form-check-input checkedSPay${proInfo['pinfNum'] }"
																			type="radio" name="flexRadio${proInfo['pinfNum'] }"
																			id="pinf${proInfo['pinfNum'] }radio2"
																			value="${proInfo['pinfSPay'] }" checked /> <label
																			class="form-check-label checkedS checkedS${proInfo['pinfNum'] }"
																			for="pinf${proInfo['pinfNum'] }radio2"
																			onclick="checkedS(${proInfo['pinfNum'] })"
																			style="color: #01ace4">${proInfo['pinfS'] }</label>
																	</div> <%-- 													<p hidden="hidden" class="checkedSPay${proInfo['pinfNum'] }">${proInfo['pinfSPay'] }</p> --%>
																</td>
																<td style="text-align: right">
																	<div class="form-check">
																		<input hidden="hidden"
																			class="form-check-input checkedPPay${proInfo['pinfNum'] }"
																			type="radio" name="flexRadio${proInfo['pinfNum'] }"
																			id="pinf${proInfo['pinfNum'] }radio3"
																			value="${proInfo['pinfPPay'] }" /> <label
																			class="form-check-label checkedP checkedP${proInfo['pinfNum'] }"
																			for="pinf${proInfo['pinfNum'] }radio3"
																			onclick="checkedP(${proInfo['pinfNum'] })">${proInfo['pinfP'] }</label>
																	</div> <%-- 													<p hidden="hidden" class="checkedPPay${proInfo['pinfNum'] }">${proInfo['pinfPPay'] }</p> --%>
																</td>
																<td style="text-align: right">
																	<!-- 													각 숫자를 누르면 여기가 변경되어야한다. -->
																	<p style="padding-top: 1rem; padding-right: 1rem"
																		id="pay${proInfo['pinfNum'] }"
																		class="pay${proInfo['pinfNum'] }">${proInfo['pinfSPay'] }</p>
																</td>
															</tr>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<tr>
															<td style="text-align: center"><p></p></td>
															<td style="text-align: right"><p></p></td>
															<td style="text-align: right"><p></p></td>
															<td style="text-align: right"><p></p></td>
															<td style="text-align: right"><p></p></td>
														</tr>
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
										<!-- 							Modal 보장상세 -->
										<c:forEach items="${list }" var="proInfo">
											<div class="modal fade" id="modal${proInfo.pinfNum }"
												tabindex="-1" aria-labelledby="exampleModalLabel"
												aria-hidden="true">
												<div
													class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
													<div class="modal-content" style="width: 900px">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalLabel">보장상세</h5>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">
															<table class="row">
																<tr>
																	<th class="col-3">보장명</th>
																	<th class="col-5">보장사유</th>
																	<th class="col-4">보장금액</th>
																</tr>
																<tr>
																	<td style="padding-right: 1rem;">${proInfo.pinfNam }</td>
																	<td style="padding-right: 1rem;">${proInfo.pinfRea }</td>
																	<td style="padding-right: 1rem;">${proInfo.pinfPay }</td>
																</tr>
															</table>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-bs-dismiss="modal" style="width: 100px">Close</button>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
										<!-- 																			modal 보장상세 -->
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="panelsStayOpen-headingTwo">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse"
										data-bs-target="#panelsStayOpen-collapseTwo"
										aria-expanded="true"
										aria-controls="panelsStayOpen-collapseTwo">가입자 정보</button>
								</h2>
								<div id="panelsStayOpen-collapseTwo"
									class="accordion-collapse collapse show"
									aria-labelledby="panelsStayOpen-headingTwo">
									<div class="accordion-body cusNum">
										<div class="border-top addCusNum cusNum1">
											<div class="row g-3">
												<div class="col-sm-3">
													<input type="hidden" value="" id="cusNum1" /> <label
														for="cusNam1" class="form-label">이름</label> <input
														type="text" class="form-control dataset" placeholder="홍길동"
														id="cusNam1" name="cusNam"
														value="${mem['memKln'] }${mem['memKfn'] }">
												</div>
												<div class="col-sm-3">
													<label for="cusBirth1" class="form-label">생년월일</label> <input
														type="date" class="form-control dataset"
														placeholder="221216" id="cusBirth1" name="cusBirth"
														value="${mem['memBirth'] }" />
												</div>
												<div class="col-sm-3">
													<label for="cusEmail1" class="form-label">이메일</label> <input
														id="cusEmail1" type="text" class="form-control dataset"
														placeholder="rest4Trip@ddit.com" name="cusEmail"
														value="${mem['memMail'] }" />
												</div>
												<div class="col-sm-3">
													<label for="cusPhon1" class="form-label">전화번호</label> <input
														type="text" class="form-control dataset"
														placeholder="010-1234-5678" id="cusPhon1" name="cusPhon"
														value="${mem['memPhon'] }" />
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="formHidden" hidden="hidden">
									<form:form modelAttribute="charge" id="resForm"
										action="${cPath }/insurance/insCheck">
										<input name="charCode" value="" placeholder="결제코드" />
										<input name="resCode" value="" placeholder="예약코드" />
										<input name="charPrice" value="" placeholder="결제금액" />
										<input type="date" name="resSdate" value=""
											placeholder="이용시작일" />
										<input type="date" name="resEdate" value=""
											placeholder="이용종료일" />
										<input name="resQty" value="" placeholder="인원수" />
										<input name="memId" value="" placeholder="이름" />
									</form:form>
								</div>
							</div>
						</div>
					</div>

					<!-- 	//asd -->
				</div>
			</div>
		</section>
		</div>
</section>

<script type="text/javascript">

	function checkedB(num){
		var $checkedB = $(".checkedB" + num);
		var $checkedS = $(".checkedS" + num);
		var $checkedP = $(".checkedP" + num);

		$checkedB.css('color', '#01ace4');
		$checkedS.css('color', '');
		$checkedP.css('color', '');
		
		var $checkedBPay = $(".checkedBPay" + num);
		var $pay = $(".pay" + num);
		$pay.text($checkedBPay.val());
		
		var total = getTotCost();
		
		var count = $('.quantity').val(); //총인원수를 찾고
		
		var days = $(".dateDiff").text(); //보험 신청 총 일수
		
		$(".total").text(total.toLocaleString()+"원");//하루 금액을 표시해서는 곳에 값을 넣어줌.

		console.log("total: ",total);
		console.log("days: ", days);
		console.log("count:",count);
		
		var code = 'INSB';
		var $pinCode = $(".pinCode"+ num);
		$pinCode.attr('value', code);
		
		
		if(days != '' && days != null){
			fn_calculate(total, days, count);
		}
		
		
	}	
	
	function checkedS(num){
		var $checkedB = $(".checkedB" + num);
		var $checkedS = $(".checkedS" + num);
		var $checkedP = $(".checkedP" + num);
		
		$checkedB.css('color', '');
		$checkedS.css('color', '#01ace4');
		$checkedP.css('color', '');

		var $checkedSPay = $(".checkedSPay" + num);
		var $pay = $(".pay" + num);
		$pay.text($checkedSPay.val());
		
		
		var total = getTotCost();
		
		var count = $('.quantity').val(); //총인원수를 찾고
		
		var days = $(".dateDiff").text(); //보험 신청 총 일수
		
		$(".total").text(total.toLocaleString()+"원");//하루 금액을 표시해서는 곳에 값을 넣어줌.

		console.log("total: ",total);
		console.log("days: ", days);
		console.log("count:",count);
		
		var code = 'INSS';
		var $pinCode = $(".pinCode"+ num);
		$pinCode.attr('value', code);
		
		if(days != '' && days != null){
			fn_calculate(total, days, count);
		}
				
	}
	
	function checkedP(num){
		var $checkedB = $(".checkedB" + num);
		var $checkedS = $(".checkedS" + num);
		var $checkedP = $(".checkedP" + num);
		
		$checkedB.css('color', '');
		$checkedS.css('color', '');
		$checkedP.css('color', '#01ace4');
		
		var $checkedPPay = $(".checkedPPay" + num);
		var $pay = $(".pay" + num);
		$pay.text($checkedPPay.val());
		
		var total = getTotCost();
		
		var count = $('.quantity').val(); //총인원수를 찾고
		
		var days = $(".dateDiff").text(); //보험 신청 총 일수
		
		$(".total").text(total.toLocaleString()+"원");//하루 금액을 표시해서는 곳에 값을 넣어줌.

		console.log("total: ",total);
		console.log("days: ", days);
		console.log("count:",count);
		
		var code = 'INSP';
		var $pinCode = $(".pinCode"+ num);
		$pinCode.attr('value', code);
		
		if(days != '' && days != null){
			fn_calculate(total, days, count);
		}
		
	}
	
	function getDateDiff(dat1, dat2 ){
		
		dat2= $(".sdate").val();
		dat1= $(".edate").val();
		const date1 = new Date(dat1);
		const date2 = new Date(dat2);

		const diffDate = date1.getTime() - date2.getTime();
		
		if(diffDate == 0){
		}
		
		//밀리세컨 * 초 * 분  * 시 = 일
		var days= $(".dateDiff").text(Math.abs(diffDate / (1000 * 60 * 60 * 24)));
		
		return days;

	};
	
	function getTotCost() {
		var total = 0;
		for(var num = 1; num <=${list.size() }; num++){
			
			var $pay = $(".pay" + num);
			total += $pay.text() *1;
			
		}
		
		return total;
	}
	
	
	

	$(document).ready(function(){
		//실속플랜을 눌렀을때
		$(".clickedB").on("click", function(){
			
			$(this).css('color', '#01ace4');
			$(".clickedS").css('color', '');
			$(".clickedP").css('color', '');
			$(".clickedM").css('color', '');
			
			$(".checkedB").css('color', '#01ace4');
			$(".checkedS").css('color', '');
			$(".checkedP").css('color', '');
			$(".checkedM").css('color', '');
			
			var total = 0; //하루 금액
			for(var num = 1; num <= ${list.size() }; num++){
				var $checkedBPay = $(".checkedBPay" + num);
				var $pay = $(".pay" + num);
				$pay.text($checkedBPay.val());
				total += $checkedBPay.val() * 1;
				
				var code = 'INSB';
				var $pinCode = $(".pinCode"+ num);
				$pinCode.attr('value', code);

			}
			
			$(".total").text(total.toLocaleString()+"원");
			
			var count = $('.quantity').val(); //총인원수를 찾고
			
			var days = $(".dateDiff").text(); //보험 신청 총 일수
			
			console.log("total: ",total);
			console.log("days: ", days);
			console.log("count:",count);
			if(days != '' && days != null){
				fn_calculate(total, days, count);
			}
			
		});
		//표준플랜을 눌렀을때
		$(".clickedS").on("click", function(){
			$(".clickedB").css('color', '');
			$(this).css('color', '#01ace4');
			$(".clickedP").css('color', '');
			$(".clickedM").css('color', '');

			$(".checkedB").css('color', '');
			$(".checkedS").css('color', '#01ace4');
			$(".checkedP").css('color', '');
			$(".checkedM").css('color', '');
			
			var total = 0; //하루 금액
			for(var num = 1; num <= ${list.size() }; num++){
				var $checkedSPay = $(".checkedSPay" + num);
				var $pay = $(".pay" + num);
				$pay.text($checkedSPay.val());
				total += $checkedSPay.val() * 1;
				
				var code = 'INSS';
				var $pinCode = $(".pinCode"+ num);
				$pinCode.attr('value', code);

			}
			
			$(".total").text(total.toLocaleString()+"원");
			
			var count = $('.quantity').val(); //총인원수를 찾고
			
			var days = $(".dateDiff").text(); //보험 신청 총 일수
			
			console.log("total: ",total);
			console.log("days: ", days);
			console.log("count:",count);
			if(days != '' && days != null){
				fn_calculate(total, days, count);
			}
			
		});
		
		//고급플랜을 눌렀을때
		$(".clickedP").on("click", function(){
			$(".clickedB").css('color', '');
			$(".clickedS").css('color', '');
			$(this).css('color', '#01ace4');
			$(".clickedM").css('color', '');

			$(".checkedB").css('color', '');
			$(".checkedS").css('color', '');
			$(".checkedP").css('color', '#01ace4');
			$(".checkedM").css('color', '');
			
			var total = 0; //하루 금액
			for(var num = 1; num <= ${list.size() }; num++){
				var $checkedPPay = $(".checkedPPay" + num);
				var $pay = $(".pay" + num);
				$pay.text($checkedPPay.val());
				total += $checkedPPay.val() * 1;
				
				var code = 'INSP';
				var $pinCode = $(".pinCode"+ num);
				$pinCode.attr('value', code);

			}
			
			$(".total").text(total.toLocaleString()+"원");
			
			var count = $('.quantity').val(); //총인원수를 찾고
			
			var days = $(".dateDiff").text(); //보험 신청 총 일수
			
			console.log("total: ",total);
			console.log("days: ", days);
			console.log("count:",count);
			if(days != '' && days != null){
				fn_calculate(total, days, count);
			}
		
		});
		//시작일을 눌렀을때
		$(".sdate").on("change",function(){
			var date = $(".sdate").val();
			$('input[name=resSdate]').val(date);
			
			if($(".edate").val() != '' && $(".sdate").val() != ''){
				
				getDateDiff($(".edate").val(), $(".sdate").val());
				
				var total = $("#totAmount").val();
				
				var days = $(".dateDiff").text();
				
				var count = $('.quantity').val();
				
				if(days != '' && days != null){
					fn_calculate(total, days, count);
				}
				
				
				
			}
			
		});

		$(".edate").on("change",function(){
			var date = $(".edate").val();
			$('input[name=resEdate]').val(date);

			if($(".edate").val() != '' && $(".sdate").val() != ''){
					
				getDateDiff($(".edate").val(), $(".sdate").val());
				
				var total = $("#totAmount").val();
				
				var days = $(".dateDiff").text();
				
				var count = $('.quantity').val();
				
				if(days != '' && days != null){
					fn_calculate(total, days, count);
				}
		
			}

		});
		
		
		let cusNum = 1;
		$(".incr-btn").on("click",function(){

			var count = $('.quantity').val();
			if(count <=1){
				count = 1;
				$('.quantity').val(count);
			}
			
			$(".quantityResult").text(count+"명");

			var total = $("#totAmount").val();
			
			if(total == null  || total == ''){
				alert("INCR-BTN: 오류???");
			}
			
			var days = $(".dateDiff").text();
			
			if(count > cusNum){
				cusNum = cusNum + 1 * 1;
				console.log("count:"+count+",cusNum:"+cusNum+"증가");
				$(".cusNum").append(
						$("<div class='border-top addCusNum cusNum"+cusNum+" '>").html("<div class='row g-3'>"
														+    "<div class='col-sm-3'>"
														+	 "<label for='cusNam"+cusNum+"' class='form-label'>이름</label> <input type='text' class='form-control dataset' placeholder='이름' id='cusNam"+cusNum+"' name='cusNam' value=''>"
														+    "</div>"
														+    "<div class='col-sm-3'>"
														+      "<label for='cusBirth"+cusNum+"' class='form-label'>생년월일</label> <input type='date' class='form-control dataset' placeholder='230101' id='cusBirth"+cusNum+"' name='cusBirth' value=''>"
														+    "</div>"
														+    "<div class='col-sm-3'>"
														+      "<label for='cusEMail"+cusNum+"' class='form-label'>이메일</label> <input type='text' class='form-control dataset' placeholder ='rest4Trip@ddit.com' name='cusPhon'  id='cusEMail"+cusNum+"'  value='' >"
														+    "</div>"
														+    "<div class='col-sm-3'>"
														+      "<label for='cusPhon"+cusNum+"' class='form-label'>전화번호</label> <input type='text' class='form-control dataset' placeholder='010-1234-5678' id='cusPhon"+cusNum+"' name='cusPhon' value='''>"
														+    "</div>"
														+  "</div>"
																
						));
				
			}
			if(count < cusNum){
				cusNum = cusNum - 1 * 1;
				console.log("count:"+count+",cusNum:"+cusNum+"감소");
				var remove = cusNum + 1;
				$(".cusNum"+remove+"").remove();
				
			}

			
			if(days != '' || days != null){
				fn_calculate(total, days, count);
			}

		});
		
		
		
	});
	
	
	
	
	function fn_calculate(total, days, count){
		var totcalCost = total * days * count;
		
		$(".totalCost").text(totcalCost.toLocaleString() + "원");
		
		console.log("total1:",total); //form에 들어갈 input에 들어갈 값: 하루금액
		console.log("days1:",days);//form에 들어갈 input에 들어갈 값: 총 일수
		console.log("count1:",count);//form에 들어갈 input에 들어갈 값: 총 인원수
		console.log("totcalCost1:",totcalCost);//form에 들어갈 값: 총금액

		$("#totAmount").val(total); //form에 들어갈 input에 들어갈 값: 하루금액
		$("#totDate").val(days);//form에 들어갈 input에 들어갈 값: 총 일수
		$("#totCount").val(count);//form에 들어갈 input에 들어갈 값: 총 인원수
		$("#totCost").val(totcalCost);//form에 들어갈 값: 총금액
	}
	
	 function insBookForm(){
		 event.preventDefault();
		var token = $("input[name='_csrf']").val();
		
	    var forms = $(".dataset");
	    console.log(forms);
	    var dataArr = [];
	    for(var i = 0; i<forms.length;i++){
	    	var oneJ = {};
	    	oneJ[forms[i].name] = forms[i].value;
			console.log(oneJ);
			
			dataArr.push(oneJ);
	    }
		console.log(dataArr);
		
		var totCost = $("#totCost").val();
		var email = $("#cusEmail1").val();
		var name = $("#cusNam1").val();
		var tel = $("#cusPhon1").val();
		var memId = $("#cusNam1").val();
		
		//아임포트 결제 부분_시작
		var IMP = window.IMP; // 생략 가능
    	IMP.init("<api키>"); // 예: imp00000000
	 	IMP.request_pay({ // param
        	pg: "html5_inicis.INIpayTest",
          	pay_method: "card",
          	merchant_uid: "${fn:substring(prod.prodCode,0,2)}"+ new Date().getTime(),
          	name: "DD손해보험",
         	amount: totCost,
          	buyer_email: email,
          	buyer_name: name,
          	buyer_tel: tel,
      	}, function (rsp) { // callback
//       		debugger;
      		console.log(rsp);
          	if (rsp.success) {

          		//결제가 완료가 된다면 실행됨.
          		$.ajax({
    				type:"POST",
    				url:"${cPath }/insurance/dd?_csrf="+token,
    				async : false,
    				data: JSON.stringify(dataArr),
    				contentType:"application/json;charset=utf-8",
    				dataType:"json",
    				success: function(result){
    					if(result){
//     						alert(result.resultMessage);
							
    		          		let imp_uid = rsp.imp_uid;
    		                let merchant_uid = rsp.merchant_uid;
    		                let sdate = $(".sdate").val();
    		        		let edate = $(".edate").val();
    		        		let resQty = $(".quantity").val();
							
							console.log("memId: "+ memId);
    		        		
    		                //결제테이블의 결제코드
    		                $('input[name=charCode]').val(imp_uid);
    		                //예약테이블의 예약코드
    		                $('input[name=resCode]').val(merchant_uid);
    		                //결제금액
    		                $('input[name=charPrice]').val(totCost);
    		                //이용시작일자
    		                $('input[name=resSdate]').val(sdate);
    		                //이용종료일자
    		                $('input[name=resEdate]').val(edate);
    		                //총인원수
    		                $('input[name=resQty]').val(resQty);
    		                //구매자
    		                $('input[name=memId]').val(memId);
    		                 
// 							debugger;
    						$('#resForm').submit();
    						
    					}else{
    						alert("어~?????");
    					}
    				}, error : function(errorResp) {
    					console.log(token);
    					console.log(errorResp.status);
    				}
    				
    			});
          	
          	
          	
          	
          	} else {
//              	alert(rsp.error_msg);
             	Swal.fire({
					title: rsp.error_msg,         // Alert 제목
					icon:'warning',        // Alert 타입
				  confirmButtonColor: '#1ab3e8'
				});
             	console.log("취소");
          	}
      	});
	 	//아임포트 결제 부분_끝
		
		    console.log("test token value : ",token);
		
		
		
		    
				    
		    
		  }

	
	
	
</script>