<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- ====================================
———	PAGE TITLE
===================================== -->
<section class="page-title">
  <div class="page-title-img bg-img bg-overlay-darken" style="background-image: url(${calender.bannerImg});">
    <div class="container">
      <div class="row align-items-center justify-content-center" style="height: 500px;">
        <div class="col-lg-6">
          <div class="page-title-content">
            <div class="title-border">
              <h2 class="text-uppercase text-white font-weight-bold">${calender.areaName }</h2>
            </div>
            <p class="text-white mb-0"></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<section class="py-10">
	<div class="container">
		<fmt:parseDate value="${calender.calSdate }" var="strPlanDate" pattern="yyyy-MM-dd"/>
		<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
		<fmt:parseDate value="${calender.calEdate }" var="endPlanDate" pattern="yyyy-MM-dd"/>
		<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
		<div id="accordion">
		<c:forEach begin="1" end="${endDate - strDate + 1 }" step="1" varStatus="status">
			<div class="card">
	   	 		<div class="card-header">
	      			<a class='<c:if test="${status.current eq 1 }">btn</c:if><c:if test="${status.current ne 1 }">collapsed btn</c:if>' data-bs-toggle="collapse" href="#collapse${status.current }">
	        			Day ${status.current } Calender.
	      			</a>
	    		</div>
	    		<div id="collapse${status.current }" class="<c:if test="${status.current eq 1 }">collapse show</c:if><c:if test="${status.current ne 1 }">collapse</c:if>" data-bs-parent="#accordion">
	      			<div class="card-body">
	        			<table class="table" style="text-align: center;">
						    <thead class="table-success">
						      <tr>
						        <th>Name</th>
						        <th>Address</th>
						        <th></th>
						      </tr>
						    </thead>
						    <tbody id="travArea">
						    <c:forEach var="trav" items="${travNoteList }">
						    <c:if test="${trav.traDay eq status.current }">
						    	<tr id="trav${trav.attNum }">
						        	<td class="dataset">${trav.traInfo }</td>
						        	<td class="dataset">${trav.traAddr }</td>
						        	<td>
				        				<a class="primary" href="">delete</a>
									</td>
						      	</tr>
						    </c:if>
						    </c:forEach>
						    </tbody>
						      <tr>
						       	<td colspan="4">
						       		<button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#attractionList">
  										Open modal
									</button>
						       	</td>
						      </tr>
						    
					  	</table>
						<a class="btn btn-primary" href="javascript:saveTrav()" style="float: right; margin-bottom: 5%;">Save</a>
	      			</div>
	    		</div>
	  		</div>
		</c:forEach>
		</div>
		
		<div class="container">
    		<div class="row">
    										<div>
								<div id="googleMap" style="width: 100%; height: 400px;"></div>
							</div>
							<script type="text/javascript">
	//            		function initMap() {
	//             		var map = new google.maps.Map(document.getElementById("googleMap"), {
	//             	    	center: { lat: 37.5400456, lng: 126.9921017 },
	//             	    	zoom: 10
	//             	  	};
	//            		}
	
		            function initMap() {
		            	var mapOptions = { 
		            			center:new google.maps.LatLng(48.8608184316035, 2.3522020819303364),
		            	        zoom:11
		            	};
		            	var map = new google.maps.Map(document.getElementById("googleMap"), mapOptions );
		            	const malls = [
// 		            	    { label: "1", name: "코엑스몰", lat: 37.5115557, lng: 127.0595261 },
// 		            	    { label: "2", name: "고투몰", lat: 37.5062379, lng: 127.0050378 },
// 		            	    { label: "3", name: "동대문시장", lat: 37.566596, lng: 127.007702 },
// 		            	    { label: "4", name: "IFC몰", lat: 37.5251644, lng: 126.9255491 },
// 		            	    { label: "5", name: "롯데월드타워몰", lat: 37.5125585, lng: 127.1025353 },
// 		            	    { label: "6", name: "명동지하상가", lat: 37.563692, lng: 126.9822107 },
// 		            	    { label: "7", name: "타임스퀘어", lat: 37.5173108, lng: 126.9033793 },
		            	  ];
		            	
		            	const infowindow = new google.maps.InfoWindow();
		            	
		            	malls.forEach(({ label, name, lat, lng }) => {
		            	    const marker = new google.maps.Marker({
		            	      	position: { lat, lng },
		            	      	label,
		            	      	map: map,
		            	    });
		            	    marker.addListener("click", () => {
		            	    	var distanceData = null;
		            	    	$.ajax({
		            	    		url : "https://cors-anywhere.herokuapp.com/"+"https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&mode=transit&origins=37.5115557,127.0595261&destinations=37.5251644,126.9255491&region=KR&key=<api키>",
	// 	            				data : {"origins" : "37.541,126.986", "destinations" : "35.1595454,126.8526012", "key" : "<api키>"},
		            				success : function(resp) {
		            					console.log(JSON.stringify(resp));
	// 	            					console.log(JSON.stringify(resp.rows[0].elements[0].distance.text));
		            					distanceData = JSON.stringify(resp.rows[0].elements[0].distance.text);
		            					console.log(distanceData);
		    	            	    	map.panTo(marker.position);
		    	            	      	infowindow.setContent("<h3>"+name+"</h3><div>"+distanceData+"</div>");
		    	            	      	infowindow.open({
		    	            	        	anchor: marker,
		    	            	        	map,
		    	            	      	});
		            					
		            				},
		            				error : function(errorResp) {
		            					console.log(errorResp.status);
		            				}
		            	    	})
		            	    	
			            	});
		            	});
		            };
	            </script>
					<script src="https://maps.googleapis.com/maps/api/js?key=<api키>&callback=initMap"></script>
    		</div>
  		</div>
		
  	</div>
	<!-- The Modal -->
	<div class="modal" id="attractionList">
		<div class="modal-dialog">
		    <div class="modal-content">
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">여행지 리스트</h4>
		        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		        <table id="example-table-1" class="table" style="text-align: center;">
				    <thead class="table-dark">
				      <tr>
				        <th>Name</th>
				        <th>Address</th>
				        <th></th>
				      </tr>
				    </thead>
				    <tbody>
				    <c:forEach var="attraction" items="${attractionList }">
				    	<tr id="att${attraction.attNum }">
				        	<td>${attraction.attNam }</td>
				        	<td>${attraction.attAddr }</td>
				        	<td>
				        		<a class="primary" href="javascript:addAttraction(${attraction.attNum })">add</a>
							</td>
				      	</tr>
				    </c:forEach>
				    </tbody>
			  	</table>
		      </div>
		    </div>
		 </div>
	</div>
	<script type="text/javascript">
		function addAttraction(attNum) {
			let str = ""
			let tdArr = new Array();	// 배열 선언
			
			// 현재 클릭된 Row(<tr>)
			let tr = $('#att'+attNum);
			let td = tr.children();
			
			// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
			console.log("클릭한 Row의 모든 데이터 : "+tr.text());
			
			// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
			td.each(function(i){
				tdArr.push(td.eq(i).text());
			});
			
			console.log("배열에 담긴 값 : "+tdArr);
			
			// td.eq(index)를 통해 값을 가져올 수도 있다.
			let name = td.eq(0).text();
			console.log("name : "+name);
			let addr = td.eq(1).text();
			console.log("addr : "+addr);
			
			str = `<tr id=trav\${attNum}>
	        	<td>\${name}</td>
	        	<td>\${addr}</td>
	        	<td>
					<a class="primary" href="">delete</a>
				</td>
	      		</tr>`;
			$('#travArea').append(str);
		}
		
		function saveTrav(){
			var forms = $(".dataset");
		    console.log("",forms);
		    var dataArr = [];
		    for(var i = 0; i<forms.length;i++){
		    	var oneJ = {};
		    	oneJ[forms[i].name] = forms[i].value;
				console.log(oneJ);
				
				dataArr.push(oneJ);
		    }
			console.log(dataArr);
		}
	</script>
</section>