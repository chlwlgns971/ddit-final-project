<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart(){
		var data = new google.visualization.DataTable();
		data.addColumn('string', '상품 유형');
		data.addColumn('number', '판매량');
		
		data.addRows([
			['패키지', 30],
			['호텔', 100],
			['렌트카', 70],
			['보험', 50]
		]);
		var options ={
			'title': '품목별 10월 판매량',
			'width': '600',
			'height': '500',
		};
		var chart = new google.visualization.PieChart(document.getElementById('chart_div1'));
		chart.draw(data,options);
	}
	
	google.charts.load('current', {'packages':['line']});
	google.charts.setOnLoadCallback(drawChart2);
	
	function drawChart2(){
		var data = google.visualization.arrayToDataTable([
	          ['Year', 'Sales', 'Expenses'],
	          ['2004',  1000,      400],
	          ['2005',  1170,      460],
	          ['2006',  660,       1120],
	          ['2007',  1030,      540]
        ]);

        var options = {
          title: 'Company Performance',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('chart_div2'));

        chart.draw(data, options);
    }
	
// 	let previous = $('pagination page-item:nth-child(0)').disabled = true;
	$(document).ready(function(){
		// 페이징처리 버튼들을 모아둔 배열 pageItems
		var pageItems = document.getElementsByClassName("page-link");
		//
		for(var i = 0; i<pageItems.length;i++){
			var pageItem = pageItems.item(i);
			if(pageItem.dataset.page<1){
// 				pageItem.href.delete;
// 				pageItem.dataset.page="";
			}
			
		}
	});
	
	
</script>
