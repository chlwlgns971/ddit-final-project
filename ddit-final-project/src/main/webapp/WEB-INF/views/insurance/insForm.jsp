<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ====================================
———	BOOKING SECTION
===================================== -->
<div class="mb-8">
	<div class="row progress-wizard">
		<div class="col-3 progress-wizard-step active">
			<div class="progress">
				<div class="progress-bar"></div>
			</div>

			<a href="javascript:void(0)" class="progress-wizard-dot">
				<div class="progress-wizard-content">
					<i class="fas fa-laptop-medical" aria-hidden="true"></i> <span
						class="d-block">1. 여행자보험 플랜 선택</span>
				</div>
			</a>
		</div>

		<div class="col-3 progress-wizard-step incomplete">
			<div class="progress">
				<div class="progress-bar"></div>
			</div>

			<a href="예약2.html" class="progress-wizard-dot">
				<div class="progress-wizard-content">
					<i class="fa fa-user" aria-hidden="true"></i> <span class="d-block">2.
						가입자 정보 입력</span>
				</div>
			</a>
		</div>

		<div class="col-3 progress-wizard-step incomplete">
			<div class="progress">
				<div class="progress-bar"></div>
			</div>

			<a href="예약3.html" class="progress-wizard-dot">
				<div class="progress-wizard-content">
					<i class="fas fa-won-sign" aria-hidden="true"></i> <span
						class="d-block">3. 결제</span>
				</div>
			</a>
		</div>
		<div class="col-3 progress-wizard-step incomplete">
			<div class="progress">
				<div class="progress-bar"></div>
			</div>

			<a href="예약3.html" class="progress-wizard-dot">
				<div class="progress-wizard-content">
					<i class="fa fa-check" aria-hidden="true"></i> <span
						class="d-block">4. 보험 확인</span>
				</div>
			</a>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-7 col-lg-8 order-1 order-md-0">
		<h3 class="text-capitalize mb-5">플랜선택</h3>

		<form action="" method="post" target="_blank">
			<div class="card bg-smoke mb-6 mb-md-0">
				<table class="col-12">
					<tr>
						<td class="col-4" style="text-align: center">실속플랜<br />
							1,190원
						</td>
						<td class="col-4" style="text-align: center">표준플랜<br />
							2,290원
						</td>
						<td class="col-4" style="text-align: center">고급플랜<br />
							3,190원
						</td>
					</tr>
				</table>
			</div>
			<br />
		</form>

		<table border="1">
			<thead>
				<tr>
					<th class="col-3" style="text-align: center">구분</th>
					<th class="col-3" style="text-align: center">실속플랜</th>
					<th class="col-3" style="text-align: center">표준플랜</th>
					<th class="col-3" style="text-align: center">고급플랜</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="col-3" style="text-align: center"><p>사망.후유장해</p></td>
					<td class="col-3" style="text-align: right"><p>5,000만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>1억원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>2억원&nbsp;</p></td>
				</tr>
				<tr>
					<td class="col-3" style="text-align: center"><p>사망 및
							질병80%이상 고도후유장해</p></td>
					<td class="col-3" style="text-align: right"><p>500만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>1,000만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>2,000만원&nbsp;</p></td>
				</tr>
				<tr>
					<td class="col-3" style="text-align: center"><p>실손의료비
							상해(해외)</p></td>
					<td class="col-3" style="text-align: right"><p>1,000만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>2,000만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>3,000만원&nbsp;</p></td>
				</tr>
				<tr>
					<td class="col-3" style="text-align: center"><p>실손의료비
							상해(입원)</p></td>
					<td class="col-3" style="text-align: right"><p>1,000만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>2,000만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>3,000만원&nbsp;</p></td>
				</tr>
				<tr>
					<td class="col-3" style="text-align: center"><p>실손의료비
							상해(통원 외래)</p></td>
					<td class="col-3" style="text-align: right"><p>10만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>15만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>25만원&nbsp;</p></td>
				</tr>
				<tr>
					<td class="col-3" style="text-align: center"><p>실손의료비
							상해(통원 처방조제)</p></td>
					<td class="col-3" style="text-align: right"><p>5만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>10만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>15만원&nbsp;</p></td>
				</tr>
				<tr>
					<td class="col-3" style="text-align: center"><p>실손의료비
							질병(해외)</p></td>
					<td class="col-3" style="text-align: right"><p>1,000만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>2,000만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>3,000만원&nbsp;</p></td>
				</tr>
				<tr>
					<td class="col-3" style="text-align: center"><p>실손의료비
							질병(입원)</p></td>
					<td class="col-3" style="text-align: right"><p>1,000만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>2,000만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>3,000만원&nbsp;</p></td>
				</tr>
				<tr>
					<td class="col-3" style="text-align: center"><p>실손의료비
							질병(통원 외래)</p></td>
					<td class="col-3" style="text-align: right"><p>10만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>15만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>25만원&nbsp;</p></td>
				</tr>
				<tr>
					<td class="col-3" style="text-align: center"><p>실손의료비
							질병(통원 처방조제)</p></td>
					<td class="col-3" style="text-align: right"><p>5만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>10만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>15만원&nbsp;</p></td>
				</tr>
				<tr>
					<td class="col-3" style="text-align: center"><p>배상책임(자기부담금
							1만원)</p></td>
					<td class="col-3" style="text-align: right"><p>1,000만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>2,000만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>3,000만원&nbsp;</p></td>
				</tr>
				<tr>
					<td class="col-3" style="text-align: center"><p>휴대품
							손해(자기부담금 1만원)</p></td>
					<td class="col-3" style="text-align: right"><p>30만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>50만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>100만원&nbsp;</p></td>
				</tr>
				<tr>
					<td class="col-3" style="text-align: center"><p>특별비용</p></td>
					<td class="col-3" style="text-align: right"><p>100만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>300만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>500만원&nbsp;</p></td>
				</tr>
				<tr>
					<td class="col-3" style="text-align: center"><p>항공기납치</p></td>
					<td class="col-3" style="text-align: right"><p>140만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>200만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>260만원&nbsp;</p></td>
				</tr>
				<tr>
					<td class="col-3" style="text-align: center"><p>해외장기체류
							실손비급여의료비_도수,체외충격파,증식치료(국내)</p></td>
					<td class="col-3" style="text-align: right"><p>350만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>400만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>450만원&nbsp;</p></td>
				</tr>
				<tr>
					<td class="col-3" style="text-align: center"><p>해외여행실손
							비급여의료비_비급여주사료(국내)</p></td>
					<td class="col-3" style="text-align: right"><p>250만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>300만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>350만원&nbsp;</p></td>
				</tr>
				<tr>
					<td class="col-3" style="text-align: center"><p>해외여행실손
							비급여의료비_자기공명 영상진단(국내)</p></td>
					<td class="col-3" style="text-align: right"><p>300만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>350만원&nbsp;</p></td>
					<td class="col-3" style="text-align: right"><p>400만원&nbsp;</p></td>
				</tr>
			</tbody>
		</table>

	</div>
	<div class="col-md-5 col-lg-4">
		<!--         <h3 class="mb-5">보험료계산</h3> -->
		<div class="card bg-smoke mb-6 mb-md-0">
			<div class="card-body">
				<h3 class="mb-5 text-dark">보험료계산</h3>

				<ul class="list-group list-group-flush">
					<li class="list-group-item bg-transparent border-top-0 px-0 py-4">
						<span><i class="far fa-calendar-alt me-1"
							aria-hidden="true"></i>From:</span> <span class="text-gray-color">25
							Mar, 2019</span>
					</li>

					<li
						class="list-group-item bg-transparent px-0 py-4 border-off-white">
						<span><i class="far fa-calendar-alt me-1"
							aria-hidden="true"></i>To:</span> <span class="text-gray-color">28
							Mar, 2019</span>
					</li>

					<li
						class="list-group-item bg-transparent px-0 py-4 border-off-white">
						<span><i class="fa fa-user me-1" aria-hidden="true"></i>Guests:</span>
						<span class="text-gray-color">2 Adults, 1Child</span>
					</li>

					<li class="list-group-item bg-transparent px-0 py-4 d-none"></li>
				</ul>
			</div>

			<div class="card-footer mt-6">
				<h2 class="mb-0">
					<span>Total:</span> <span class="text-primary font-weight-bold">$6,500</span>
				</h2>
			</div>
			<!-- 	        <div> -->
			<!-- 	        	<h6>아래 보장내용 및 가입금액을 확인해주세요.</h6> -->

			<!-- 	         	<table class="table table-hover"> -->
			<!-- 	         		<tbody> -->
			<!-- 		        		<tr> -->
			<!-- 		        			<td class="col-3" style="text-align:left">사망.후유장해</td> -->
			<!-- 							<td class="col-2" style="text-align:right">5,000만원&nbsp;<i class="fas fa-chevron-right"></i></td> -->
			<!-- 		        		</tr> -->
			<!-- 		        		<tr> -->
			<!-- 		        			<td class="col-3" style="text-align:left">질병사망/고도후유장해</td> -->
			<!-- 							<td class="col-2" style="text-align:right">5,000만원&nbsp;<i class="fas fa-chevron-right"></i></td> -->
			<!-- 		        		</tr> -->
			<!-- 		        		<tr> -->
			<!-- 		        			<td class="col-3" style="text-align:left">해외상해 해외의료비</td> -->
			<!-- 							<td class="col-2" style="text-align:right">1,000만원&nbsp;<i class="fas fa-chevron-right"></i></td> -->
			<!-- 		        		</tr> -->
			<!-- 		        		<tr> -->
			<!-- 		        			<td class="col-3" style="text-align:left">해외상해 국내의료비(입원)</td> -->
			<!-- 							<td class="col-2" style="text-align:right">1,000만원&nbsp;<i class="fas fa-chevron-right"></i></td> -->
			<!-- 		        		</tr> -->
			<!-- 		        		<tr> -->
			<!-- 		        			<td class="col-3" style="text-align:left">해외상해 국내의료비(통원_외래)</td> -->
			<!-- 							<td class="col-2" style="text-align:right">25만원&nbsp;<i class="fas fa-chevron-right"></i></td> -->
			<!-- 		        		</tr> -->
			<!-- 		        		<tr> -->
			<!-- 		        			<td class="col-3" style="text-align:left">해외상해 국내의료비(처방조제)</td> -->
			<!-- 							<td class="col-2" style="text-align:right">5만원&nbsp;<i class="fas fa-chevron-right"></i></td> -->
			<!-- 		        		</tr> -->
			<!-- 		        		<tr> -->
			<!-- 		        			<td class="col-3" style="text-align:left">해외질병 해외의료비</td> -->
			<!-- 							<td class="col-2" style="text-align:right">1,000만원&nbsp;<i class="fas fa-chevron-right"></i></td> -->
			<!-- 		        		</tr> -->
			<!-- 		        		<tr> -->
			<!-- 		        			<td class="col-3" style="text-align:left">해외질병 국내의료비(입원)</td> -->
			<!-- 							<td class="col-2" style="text-align:right">1,000만원&nbsp;<i class="fas fa-chevron-right"></i></td> -->
			<!-- 		        		</tr> -->
			<!-- 		        		<tr> -->
			<!-- 		        			<td class="col-3" style="text-align:left">해외질병 국내의료비(통원_외래)</td> -->
			<!-- 							<td class="col-2" style="text-align:right">25만원&nbsp;<i class="fas fa-chevron-right"></i></td> -->
			<!-- 		        		</tr> -->
			<!-- 		        		<tr> -->
			<!-- 		        			<td class="col-3" style="text-align:left">해외질병 국내의료비(처방조제)</td> -->
			<!-- 							<td class="col-2" style="text-align:right">5만원&nbsp;<i class="fas fa-chevron-right"></i></td> -->
			<!-- 		        		</tr> -->
			<!-- 		        		<tr> -->
			<!-- 		        			<td class="col-3" style="text-align:left">휴대품손해</td> -->
			<!-- 							<td class="col-2" style="text-align:right">20만원&nbsp;<i class="fas fa-chevron-right"></i></td> -->
			<!-- 		        		</tr> -->
			<!-- 		        		<tr> -->
			<!-- 		        			<td class="col-3" style="text-align:left">배상책임</td> -->
			<!-- 							<td class="col-2" style="text-align:right">500만원&nbsp;<i class="fas fa-chevron-right"></i></td> -->
			<!-- 		        		</tr> -->
			<!-- 		        		<tr> -->
			<!-- 		        			<td class="col-3" style="text-align:left">특별비용</td> -->
			<!-- 							<td class="col-2" style="text-align:right">500만원&nbsp;<i class="fas fa-chevron-right"></i></td> -->
			<!-- 		        		</tr> -->
			<!-- 		        		<tr> -->
			<!-- 		        			<td class="col-3" style="text-align:left">항공기납치</td> -->
			<!-- 							<td class="col-2" style="text-align:right">140만원&nbsp;<i class="fas fa-chevron-right"></i></td> -->
			<!-- 		        		</tr> -->
			<!-- 		        		<tr> -->
			<!-- 		        			<td class="col-3" style="text-align:left">국내비급여의료비(도수,채외충격파,증식치료)</td> -->
			<!-- 							<td class="col-2" style="text-align:right">350만원&nbsp;<i class="fas fa-chevron-right"></i></td> -->
			<!-- 		        		</tr> -->
			<!-- 		        		<tr> -->
			<!-- 		        			<td class="col-3" style="text-align:left">국내비급여의료비(비급여주사료)</td> -->
			<!-- 							<td class="col-2" style="text-align:right">250만원&nbsp;<i class="fas fa-chevron-right"></i></td> -->
			<!-- 		        		</tr> -->
			<!-- 		        		<tr> -->
			<!-- 		        			<td class="col-3" style="text-align:left">국내비급여의료비(자기공명영상진단)</td> -->
			<!-- 							<td class="col-2" style="text-align:right">300만원&nbsp;<i class="fas fa-chevron-right"></i></td> -->
			<!-- 		        		</tr> -->
			<!-- 					</tbody> -->
			<!-- 				</table> -->


			<!-- 	        </div> -->
		</div>
	</div>

</div>


