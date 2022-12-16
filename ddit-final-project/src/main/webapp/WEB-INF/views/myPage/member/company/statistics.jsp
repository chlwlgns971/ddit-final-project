<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="mainInfo">
	<br>
	<h3>&nbsp;&nbsp;&nbsp;&nbsp;통계자료</h3>
<!-- 	<div class="container"> -->
<!-- 		<div class="mb-6" style=" height:20px;"> -->
			
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<br/> -->
<!-- 	<br/> -->
	
	<div id="chart_div1" style="width: 400px;"></div>
	<div id="chart_div2"></div>
	
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart(){
	var data = new google.visualization.DataTable();
	data.addColumn('string', '구매 회원');
	data.addColumn('number', '판매량');
	
	data.addRows([
		['20대', 320],
		['30대', 463],
		['40대', 349],
		['50대', 115]
	]);
	var options ={
		'title': '방문 연령대',
		'width': '400',
		'height': '400'
	};
	var chart = new google.visualization.PieChart(document.getElementById('chart_div1'));
	chart.draw(data,options);
}

google.charts.load('current', {'packages':['line']});
google.charts.setOnLoadCallback(drawChart2);

function drawChart2(){
	var data = google.visualization.arrayToDataTable([
          ['Month', '예약 수'],
          ['7월',  486],
          ['8월',  572],
          ['9월',  366],
          ['10월',  285],
          ['11월',  181],
          ['12월',  92]
    ]);

    var options = {
      title: '월별 예약 (최근 6개월)',
      curveType: 'function',
      legend: { position: 'bottom' },
	  width : '800'
    };

    var chart = new google.visualization.ColumnChart(document.getElementById('chart_div2'));

    chart.draw(data, options);
}



</script>