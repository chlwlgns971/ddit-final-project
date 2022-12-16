/**
 * <pre>
 * 
 * </pre>
 * @author 작성자명
 * @since 2022. 11. 26.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자       수정내용
 * --------     --------    ----------------------
 * 2022. 11. 26.      최지훈       최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */ 
window.onload=function(){
	apiURI = "https://api.openweathermap.org/data/2.5/weather?q="+city+"&appid=<api키>";
	apiURI2 = "https://api.openweathermap.org/data/2.5/forecast?q="+city+"&appid=<api키>";
  	$.ajax({
   		url: apiURI,
      	dataType: "json",
      	type: "GET",
      	async: "false",
      	success: function(resp) {
      		console.log(resp);
      		let weatherNum = (resp.weather[0].icon).substr(0,2);
      		let imgURL = null;
      		if(weatherNum == 01) imgURL=cpath+"/resources/images/icons/sun.png";
      		else if(weatherNum == 02) imgURL=cpath+"/resources/images/icons/cloudy.png";
      		else if(weatherNum == 03 || weatherNum == 04) imgURL=cpath+"/resources/images/icons/cloud.png";
      		else if(weatherNum == 09 || weatherNum == 10) imgURL=cpath+"/resources/images/icons/rainy.png";
      		else if(weatherNum == 11) imgURL=cpath+"/resources/images/icons/storm.png";
      		else if(weatherNum == 13) imgURL=cpath+"/resources/images/icons/snowy.png";
      		else if(weatherNum == 50) imgURL=cpath+"/resources/images/icons/windy.png";
      		$('.img-fluid').attr('src',imgURL);
      		let curTemp = Math.round(resp.main.temp-273.15);
      		$('#curTemp').text(curTemp);
      		$('#city').text(resp.name);
          	console.log(resp);
          	console.log("현재온도 : "+ (resp.main.temp- 273.15) );
          	console.log("현재습도 : "+ resp.main.humidity);
          	console.log("날씨 : "+ resp.weather[0].main );
          	console.log("상세날씨설명 : "+ resp.weather[0].description );
          	console.log("날씨 이미지 : "+ resp.weather[0].icon );
          	console.log("바람   : "+ resp.wind.speed );
          	console.log("나라   : "+ resp.sys.country );
          	console.log("도시이름  : "+ resp.name );
          	console.log("구름  : "+ (resp.clouds.all) +"%" );                 
          	console.log("날짜  : "+ resp.dt_txt );                 
      	}
  	})
  	
  	$.ajax({
   		url: apiURI2,
      	dataType: "json",
      	type: "GET",
      	async: "false",
      	success: function(resp) {
      		console.log(resp);
      		let weatherNum2 = (resp.list[8].weather[0].icon).substr(0,2);
      		let imgURL2 = null;
      		if(weatherNum2 == 01) imgURL2=cpath+"/resources/images/icons/sun.png";
      		else if(weatherNum2 == 02) imgURL2=cpath+"/resources/images/icons/cloudy.png";
      		else if(weatherNum2 == 03 || weatherNum2 == 04) imgURL2=cpath+"/resources/images/icons/cloud.png";
      		else if(weatherNum2 == 09 || weatherNum2 == 10) imgURL2=cpath+"/resources/images/icons/rainy.png";
      		else if(weatherNum2 == 11) imgURL2=cpath+"/resources/images/icons/storm.png";
      		else if(weatherNum2 == 13) imgURL2=cpath+"/resources/images/icons/snowy.png";
      		else if(weatherNum2 == 50) imgURL2=cpath+"/resources/images/icons/windy.png";
      		$('#imgDay2').attr('src',imgURL2);
      		let curTemp2 = Math.round(resp.list[8].main.temp-273.15);
      		$('#day2Temp').text(curTemp2);
      		
      		let weatherNum3 = (resp.list[16].weather[0].icon).substr(0,2);
      		let imgURL3 = null;
      		if(weatherNum3 == 01) imgURL3=cpath+"/resources/images/icons/sun.png";
      		else if(weatherNum3 == 02) imgURL3=cpath+"/resources/images/icons/cloudy.png";
      		else if(weatherNum3 == 03 || weatherNum3 == 04) imgURL3=cpath+"/resources/images/icons/cloud.png";
      		else if(weatherNum3 == 09 || weatherNum3 == 10) imgURL3=cpath+"/resources/images/icons/rainy.png";
      		else if(weatherNum3 == 11) imgURL3=cpath+"/resources/images/icons/storm.png";
      		else if(weatherNum3 == 13) imgURL3=cpath+"/resources/images/icons/snowy.png";
      		else if(weatherNum3 == 50) imgURL3=cpath+"/resources/images/icons/windy.png";
      		$('#imgDay3').attr('src',imgURL3);
      		let curTemp3 = Math.round(resp.list[16].main.temp-273.15);
      		$('#day3Temp').text(curTemp3);
      		
      		let weatherNum4 = (resp.list[24].weather[0].icon).substr(0,2);
      		let imgURL4 = null;
      		if(weatherNum4 == 01) imgURL4=cpath+"/resources/images/icons/sun.png";
      		else if(weatherNum4 == 02) imgURL4=cpath+"/resources/images/icons/cloudy.png";
      		else if(weatherNum4 == 03 || weatherNum4 == 04) imgURL4=cpath+"/resources/images/icons/cloud.png";
      		else if(weatherNum4 == 09 || weatherNum4 == 10) imgURL4=cpath+"/resources/images/icons/rainy.png";
      		else if(weatherNum4 == 11) imgURL4=cpath+"/resources/images/icons/storm.png";
      		else if(weatherNum4 == 13) imgURL4=cpath+"/resources/images/icons/snowy.png";
      		else if(weatherNum4 == 50) imgURL4=cpath+"/resources/images/icons/windy.png";
      		$('#imgDay4').attr('src',imgURL4);
      		let curTemp4 = Math.round(resp.list[24].main.temp-273.15);
      		$('#day4Temp').text(curTemp4);
      	}
  	})
  	let d = new Date();
    let year = d.getFullYear();
    let week = ['Sun','Mon','Tue','Wen','Thu','Fri','Sat'];
    let monthNames = ["January", "February", "March", "April", "May", "June",
    	  "July", "August", "September", "October", "November", "December"
    	];
    let month = d.getMonth();
    let date = d.getDate();
    let mon = monthNames[month];
    let day = d.getDay();
    document.getElementById("copy-year").innerHTML = year;
    document.getElementById("copy-Month").innerHTML = mon + "&nbsp";
    document.getElementById("copy-day").innerHTML = date + ",&nbsp&nbsp";
    document.getElementById("day2").innerHTML = date+1;
    document.getElementById("day3").innerHTML = date+2;
    document.getElementById("day4").innerHTML = date+3;
    
//    Amadeus API
//    fetch("https://test.api.amadeus.com/v1/security/oauth2/token", {
//    	  body: "grant_type=client_credentials&client_id=<api키>&client_secret=<api 비밀키>",
//    	  headers: {
//    	    "Content-Type": "application/x-www-form-urlencoded"
//    	  },
//    	  method: "POST"
//    	}).then((response) => response.json())
//    	  .then((data) => console.log(data));
//    fetch("https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=ICN&destinationLocationCode=CDG&departureDate=2023-05-02&returnDate=2023-05-10&adults=6&children=0&travelClass=ECONOMY&nonStop=true&currencyCode=KRW&max=20", {
//    	  headers: {
//    	    Authorization: "Bearer o5zumHAyAOzjun7XSXdpc5nLJtDW"
//    	  }
//    	}).then((response) => response.json())
//  	  .then((data) => console.log(data));
    
    
    
}