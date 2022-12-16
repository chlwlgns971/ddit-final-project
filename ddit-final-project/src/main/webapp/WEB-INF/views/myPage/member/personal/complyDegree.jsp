<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div class="kmb-title">
		<h2>동행관리</h2>
	</div>

	<div class="container">
		<!-- Table Section -->
		<div class="table-dashboard mb-7">
			<div class="background-color">

				<div class="complyFriend">
					<div class="comply-friend-image">
						<img
							src="<%=request.getContextPath()%>/resources/images/about-us/team-03.jpg"
							data-src="<%=request.getContextPath()%>/resources/images/about-us/team-03.jpg"
							alt="Generic placeholder image" class="kmb-circle">
					</div>
					<div class="comply-friend-id" style="height: 30px;">
						<h2 class="complyFriend-name">아이디</h2>
					</div>
					<div class="comply-friend-degree" style="height: 30px;">
						<p class="complyFriend-degree">36.7도</p>
					</div>
					<div class="comply-thermometer" style="height: 30px;">
						<input type="range" min="0" max="10" list="tickmarks" >
						<datalist id="tickmarks">
							<option value="0"></option>
							<option value="1"></option>
							<option value="2"></option>
							<option value="3"></option>
							<option value="4"></option>
							<option value="5"></option>
							<option value="6"></option>
							<option value="7"></option>
							<option value="8"></option>
							<option value="9"></option>
							<option value="10"></option>
						</datalist>
					</div>
					<div>
						<ul class="list-unstyled" style="margin-left: 100px; margin-top: 50px;">
							<input type="button" class="btn btn-primary" value="평가하기">
						</ul>
					</div>
				</div>

			</div>


		</div>

	</div>