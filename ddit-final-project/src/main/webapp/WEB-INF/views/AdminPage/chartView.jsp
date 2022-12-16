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
	data.addColumn('string', '상품 유형');
	data.addColumn('number', '판매량');
	
	data.addRows([
		['패키지', 14],
		['호텔', 42],
		['렌트카', 31],
		['승인 대기', 30]
	]);
	var options ={
		'title': '회원 비율',
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
          ['Year', '남성', '여성'],
          ['10대',  100,      120],
          ['20대',  667,      1027],
          ['30대',  1055,      880],
          ['40대',  667,       584],
          ['50대 이상',  277,      224]
    ]);

    var options = {
      title: '가입자 연령 및 성별',
      curveType: 'function',
      legend: { position: 'bottom' },
	  width : '800'
    };

    var chart = new google.visualization.ColumnChart(document.getElementById('chart_div2'));

    chart.draw(data, options);
}



</script>