<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<style>
	body{
        width: 1920px;
        /* min-height: 1900px; */
        margin: 0 auto;
	}
	
    .section{
        position: relative;
        float: right;
        width: 1650px;
        min-height: 1100px;
        /* border: 1px solid black; */
    }
    
    .salesStatDiv{
        margin: 0 auto;
        /* border: 1px solid black; */
        /* border-radius: 15px; */
        width: 1250px;
        height: 800px;
    }
    
    .salesStatTitle p{
	   	font-family: 'SCDream-Medium'; 
	   	font-size: 24px; 
	   	position: relative; 
	   	left: 20px; 
	   	top: 20px; 
	   	display: inline-block;
	}

    .salesStatTitle button{
        position: relative;
        float: right;
        top: 40px;
        width: 80px;
        height: 40px;
        margin-right: 20px;
        font-family: 'SCDream-Regular';
        font-size: 20px;
        background: transparent;
    	border: 1px solid #775EEE;
    	border-radius: 10px;
    }

    .salesStatDetails {
        margin: 0 auto;
        border: 1px solid black;
        border-radius: 15px;
        width: 1200px;
        height: 650px;
    }
   
    .footer{
        width: 1920px;
        height: 100px;
        border: 1px solid black;
        text-align: center;
    }
    
</style>
<body>
	<!-- header jsp -->
	<jsp:include page="corpMngHeader.jsp"/>
	<!-- navi jsp -->
	<jsp:include page="corpMngNavi.jsp"/>

	<div class="section">
		<h1 style="font-family: 'SCDream-Medium'; font-size: 40px; position: relative; left: 20px;">?????? ??????</h1>
        <hr width="1600px" align="left">
        <br>

        <div class="salesStatDiv">
            <div class="salesStatTitle">
                <p>??????/??????/?????? ?????? ??????</p>
                <button id="monthlyStatBtn">??????</button>
                <button id="weeklyStatBtn">??????</button>
                <button id="dailyStatBtn">??????</button>
            </div>
            <br>
            <div class="salesStatDetails">
            	<div id="dailyStatDiv" style="width: 1200px; height: 600px; margin: 0 auto; padding-top: 10px;"></div>
            	<div id="weeklyStatDiv" style="width: 1200px; height: 600px; margin: 0 auto; padding-top: 10px;" hidden></div>
            	<div id="monthlyStatDiv" style="width: 1200px; height: 600px; margin: 0 auto; padding-top: 10px;" hidden></div>
            </div>
        </div>
        <br>

        <div class="salesStatDiv">
            <div class="salesStatTitle">
                <p>??????????????? ?????? ??????</p>
            </div>
            <br>
            <div class="salesStatDetails">
                <div id="categoryStatDiv" style="width: 1200px; height: 600px; margin: 0 auto; padding-top: 10px;"></div>
            </div>
        </div>
        <br>

        <div class="salesStatDiv">
            <div class="salesStatTitle">
                <p>????????? ?????? ??????</p>
            </div>
            <br>
            <div class="salesStatDetails">
                <div id="productStatDiv" style="width: 1200px; height: 600px; margin: 0 auto; padding-top: 10px;"></div>
            </div>
        </div>
        <br>

        <div class="salesStatDiv">
            <div class="salesStatTitle">
                <p>????????? ?????? ??????</p>
            </div>
            <br>
            <div class="salesStatDetails">
                <div id="areaStatDiv" style="width: 1200px; height: 600px; margin: 0 auto; padding-top: 10px;"></div>
            </div>
        </div>
        <br>
        
	</div>	<!-- section Div ??????-->
	
    <br clear=both>
<!-- 	<div class="footer">
		<h1 align="center">FOOTER</h1>
	</div>
 -->	
	<script>
		$.ajax({
			url:'/missingitnow/statistics/selectDailyStatistics',
			type:'post',
			success: function(stat){
				
				if(stat == "") {
					alert('?????? ????????? ????????????.');
					return false;
				}
				
				google.charts.load('current', {'packages':['corechart']});
			    google.charts.setOnLoadCallback(drawVisualization);
			    
				var arr = [['Day', 'Total']];
				for(var i = 0; i < stat.length; i++){
					arr.push([stat[i].dailyDate, stat[i].dailyTotal]);
				}

		    	function drawVisualization() {
					var data = google.visualization.arrayToDataTable(arr);
					var options = {
					  vAxis: {title: '????????? (???)'},
					  hAxis: {title: '?????? (?????? 15??? ??????)'},
					  seriesType: 'bars',
					};
				
				var chart = new google.visualization.ComboChart(document.getElementById('dailyStatDiv'));
				chart.draw(data, options);
				}
			},
			error: function(error){
				console.log(error)
			}
		}); /* ?????? ajax ?????? */
		
		
		$('#dailyStatBtn').click(function(){
			$('#dailyStatDiv').show();
			$('#weeklyStatDiv').hide();
			$('#monthlyStatDiv').hide();
			
			$.ajax({
				url:'/missingitnow/statistics/selectDailyStatistics',
				type:'post',
				success: function(stat){
					
					if(stat == "") {
						alert('?????? ????????? ????????????.');
						return false;
					}
					
					google.charts.load('current', {'packages':['corechart']});
				    google.charts.setOnLoadCallback(drawVisualization);
				    
					var arr = [['Day', 'Total']];
					for(var i = 0; i < stat.length; i++){
						arr.push([stat[i].dailyDate, stat[i].dailyTotal]);
					}
	
			    	function drawVisualization() {
						var data = google.visualization.arrayToDataTable(arr);
						var options = {
						  vAxis: {title: '????????? (???)'},
						  hAxis: {title: '?????? (?????? 15??? ??????)'},
						  seriesType: 'bars',
						};
					
					var chart = new google.visualization.ComboChart(document.getElementById('dailyStatDiv'));
					chart.draw(data, options);
					}
				},
				error: function(error){
					console.log(error)
				}
			}); /* ?????? ajax ?????? */
			
		});/* ?????? ???????????? ?????? */
		
		/* ??????  ?????? ?????? */			
		$('#weeklyStatBtn').click(function(){
			$('#weeklyStatDiv').show();
			$('#dailyStatDiv').hide();
			$('#monthlyStatDiv').hide();
			
			$.ajax({
				url:'/missingitnow/statistics/selectWeeklyStatistics',
				type:'post',
				success: function(stat){
					console.log(stat)
					
					if(stat == "") {
						alert('?????? ????????? ????????????.');
						return false;
					}
					
					google.charts.load('current', {'packages':['corechart']});
				    google.charts.setOnLoadCallback(drawVisualization);
				    
					var arr = [['Day', 'Total']];
					for(var i = 0; i < stat.length; i++){
						arr.push([stat[i].weeklyDate, stat[i].weeklyTotal]);
					}
	
			    	function drawVisualization() {
						var data = google.visualization.arrayToDataTable(arr);
						var options = {
						  vAxis: {title: '????????? (???)'},
						  hAxis: {title: '?????? (????????? ?????? ??????)'},
						  seriesType: 'bars',
						};
					
					var chart = new google.visualization.ComboChart(document.getElementById('weeklyStatDiv'));
					chart.draw(data, options);
					}
						
				},
				error: function(error){
					console.log(error)
				}
			}); /* ?????? ajax ?????? */
	
		});	/* ?????? ???????????? ?????? */
		
		/* ??????  ?????? ?????? */
		$('#monthlyStatBtn').click(function(){
			$('#monthlyStatDiv').show();
			$('#dailyStatDiv').hide();
			$('#weeklyStatDiv').hide();
			
			$.ajax({
				url:'/missingitnow/statistics/selectMonthlyStatistics',
				type:'post',
				success: function(stat){
					console.log(stat)
					
					if(stat == "") {
						alert('?????? ????????? ????????????.');
						return false;
					}
					
					google.charts.load('current', {'packages':['corechart']});
				    google.charts.setOnLoadCallback(drawVisualization);
				    
					var arr = [['Day', 'Total']];
					for(var i = 0; i < stat.length; i++){
						arr.push([stat[i].monthlyDate, stat[i].monthlyTotal]);
					}
	
			    	function drawVisualization() {
						var data = google.visualization.arrayToDataTable(arr);
						var options = {
						  vAxis: {title: '????????? (???)'},
						  hAxis: {title: '??????'},
						  seriesType: 'bars',
						};
					
					var chart = new google.visualization.ComboChart(document.getElementById('monthlyStatDiv'));
					chart.draw(data, options);
					}
						
				},
				error: function(error){
					console.log(error)
				}
			}); /* ?????? ajax ?????? */
	
		});	/* ?????? ???????????? ?????? */
		
		
		/* ??????????????? ?????? ?????? */
		$.ajax({
			url:'/missingitnow/statistics/selectCategoryStatistics',
			type:'post',
			success: function(stat){
				
				google.charts.load('current', {'packages':['corechart']});
			    google.charts.setOnLoadCallback(drawVisualization);
			    
				var arr = [['Category', 'Total']];
				for(var i = 0; i < stat.length; i++){
					arr.push([stat[i].prodCtgName, stat[i].ctgTotalAmt]);
				}
	
		    	function drawVisualization() {
					var data = google.visualization.arrayToDataTable(arr);
					var options = {
					  vAxis: {title: '????????? (???)'},
					  hAxis: {title: '????????????'},
					  seriesType: 'bars',
					};
				
				var chart = new google.visualization.ComboChart(document.getElementById('categoryStatDiv'));
				chart.draw(data, options);
				}
			},
			error: function(error){
				console.log(error)
			}
		});	/* ??????????????? ?????? ?????? ??????*/
		
		/* ????????? ?????? ?????? */
		$.ajax({
			url:'/missingitnow/statistics/selectProductStatistics',
			type:'post',
			success: function(stat){
				
				google.charts.load('current', {'packages':['corechart']});
			    google.charts.setOnLoadCallback(drawVisualization);
			    
				var arr = [['Product', 'Total']];
				for(var i = 0; i < stat.length; i++){
					arr.push([stat[i].prodName, stat[i].prodTotalAmt]);
				}
	
		    	function drawVisualization() {
					var data = google.visualization.arrayToDataTable(arr);
					var options = {
					  vAxis: {title: '????????? (???)'},
					  hAxis: {title: '?????????'},
					  seriesType: 'bars',
					};
				
				var chart = new google.visualization.ComboChart(document.getElementById('productStatDiv'));
				chart.draw(data, options);
				}
			},
			error: function(error){
				console.log(error)
			}
		});
		
		/* ????????? ?????? ?????? */
		$.ajax({
			url:'/missingitnow/statistics/selectAreaStatistics',
			type:'post',
			success: function(stat){
				
				google.charts.load('current', {'packages':['corechart']});
			    google.charts.setOnLoadCallback(drawVisualization);
			    
				var arr = [['Area', 'Total']];
				for(var i = 0; i < stat.length; i++){
					arr.push([stat[i].userArea, stat[i].areaTotalAmt]);
				}
	
		    	function drawVisualization() {
					var data = google.visualization.arrayToDataTable(arr);
					var options = {
					  vAxis: {title: '????????? (???)'},
					  hAxis: {title: '??????'},
					  seriesType: 'bars',
					};
				
				var chart = new google.visualization.ComboChart(document.getElementById('areaStatDiv'));
				chart.draw(data, options);
				}
			},
			error: function(error){
				console.log(error)
			}
		});
		
	
	</script>
	
</body>
</html>




















