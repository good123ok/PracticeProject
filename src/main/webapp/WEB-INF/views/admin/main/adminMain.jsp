<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/reset.css">
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin_main.css">
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/main.css">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
function drawBasic() {
	var totalUser = ${ datas.totalUserCount }; /* 현재 가입한 유저 숫자 */
	var todayRegistUser = ${ datas.todayRegistUserCount }; /* 오늘 신규 가입한 유저 숫자 */
	var unpurchasedUser = ${ datas.unpurchasedUserCount }; /* 한번도 상품을 구매하지 않은 유저 숫자 */
	var highRateRefundUser = ${ datas.highRateRefundUserCount }; /* 전체 구매횟수중 환불/반품 비율이 높은 유저 숫자 */
	
	var data = google.visualization.arrayToDataTable([
		 ['Element', '유저 수'],
         ['총 유저', totalUser],
         ['오늘가입유저', todayRegistUser],
         ['미구매유저', unpurchasedUser],
         ['환불/반품 고비율 유저', highRateRefundUser]
    ]);
	
	var options = {};
	
	var chart = new google.visualization.ColumnChart(document.getElementById('chart_div_user'));

	chart.draw(data, options);
	
	var totalCorpUser = ${ datas.totalCorpUserCount }; /* 현재 가입한(가입신청 미완료 포함) 기업 숫자 */
	var unacceptedCorpUser = ${ datas.unacceptedCorpUserCount }; /* 현재 판매승인 대기중인 기업 숫자 */
	var todayRegistCorpUser = ${ datas.todayRegistCorpUserCount }; /* 오늘 가입신청한 기업 숫자 */
	
	var data2 = google.visualization.arrayToDataTable([
		 ['Element', '기업 수', { role: 'style' }],
         ['총 기업', totalCorpUser, '#b87333'],            
         ['판매승인 대기중 기업', unacceptedCorpUser, 'silver'],           
         ['금일가입기업', todayRegistCorpUser, 'gold'],
    ]);
	
	var options2 = {};
	
	var chart2 = new google.visualization.ColumnChart(document.getElementById('chart_div_corp_user'));

	chart2.draw(data2, options2);
	
	var totalUserQnA = ${ datas.totalUserCount };
	var totalCorpUserQnA = ${ datas.totalCorpUserCount };
	var totalNonAnswerUserQnA = ${ datas.totalNonAnswerUserQuestionCount };
	var totalNonAnswerCorpUserQnA = ${ datas.totalNonAnswerCorpUserQuestionCount };
	
	var data3 = google.visualization.arrayToDataTable([
        ['Task', '게시글 수'],
        ['답변완료 유저 질문', totalUserQnA - totalNonAnswerUserQnA],
        ['미답변 유저 질문', totalNonAnswerUserQnA],
        ['답변완료 기업 질문', totalCorpUserQnA - totalNonAnswerCorpUserQnA],
        ['미답변 기업 질문', totalNonAnswerCorpUserQnA],
    ]);
	
	var options3 = {
			        title: '질의응답 게시글',
			        is3D: true
			      };
	var chart3 = new google.visualization.PieChart(document.getElementById('chart_div_qna'));
	
	chart3.draw(data3, options3);
	
	var totalSettlement = ${ datas.totalSettlementCount }; /* 전체 정산신청 숫자 */
	var unsettlement = ${ datas.unsettlementCount }; /* 미정산 상태의 정산신청 숫자 */
	var shortPeriodSettlement = ${ datas.shortPeriodSettlementCount }; /* 일주일 미만의 짧은 기간 미정산 정산신청 숫자 */
	var largeAmountSettlement = ${ datas.largeAmountSettlementCount }; /* 고액(1000만 이상)의 미정산 정산신청 숫자 */
	var todaySettlement = ${ datas.todaySettlementCount }; /* 오늘 정산신청한 숫자 */
	
	var data4 = google.visualization.arrayToDataTable([
        ['Task', '정산신청 수'],
        ['총 정산신청 현황', totalSettlement],
        ['미정산 현황', unsettlement],
        ['단기간 정산', shortPeriodSettlement],
        ['고액 정산', largeAmountSettlement],
        ['금일 정산신청', todaySettlement]
    ]);
	
	var options4 = {
						title: '정산신청 현황',
				        chartArea: {width: '60%'},
						hAxis: 
						{
					        title: '정산신청 수',
					        minValue: 0
				      	}
					};
	var chart4 = new google.visualization.BarChart(document.getElementById('chart_div_settlement'));
	
	chart4.draw(data4, options4);
	
}
</script>
<script type="text/javascript">
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawBasic);
</script>
</head>
<body>
	<header>
		<jsp:include page="../../common/corpMngHeader.jsp"/>
    </header>
	<div style="overflow:hidden; display: flex;">
    <aside>
		<jsp:include page="../../common/corpMngNavi.jsp"/>
    </aside>
	<section>
	<div class="sectionBodyDiv">
		<div class="userDiv contentDiv">
            <button class="titleBtn" onclick="location.href='${ pageContext.servletContext.contextPath }/admin/userManage/list'"> 이용자 현황 > </button>
            <hr style="margin-top: 0px;	margin-bottom: 0px;">
            <div id="chart_div_user" style="width: 697px; height: 302px;">
            </div>
        </div>
        <div class="corpDiv contentDiv">
            <button class="titleBtn" onclick="location.href='${ pageContext.servletContext.contextPath }/system/comInfo'"> 기업회원 현황 > </button>
            <hr style="margin-top: 0px;	margin-bottom: 0px;">
            <div id="chart_div_corp_user" style="width: 697px; height: 302px;">
            </div>
        </div>
        <div class="QNADiv contentDiv">
            <button class="titleBtn" onclick="location.href='${ pageContext.servletContext.contextPath }/admin/qna/manage'"> 질문 현황	 > </button>
            <hr style="margin-top: 0px;	margin-bottom: 0px;">
            <div id="chart_div_qna" style="width: 697px; height: 302px;">
            </div>
        </div>
        <div class="settlementDiv contentDiv">
            <button class="titleBtn" onclick="location.href='${ pageContext.servletContext.contextPath }/admin/settlement/breakdown'"> 정산 현황 > </button>
            <hr style="margin-top: 0px;	margin-bottom: 0px;">
            <div id="chart_div_settlement" style="width: 697px; height: 302px;">
            </div>
        </div>
        <div class="orderDiv contentDiv">
            <button class="titleBtn" onclick="location.href='${ pageContext.servletContext.contextPath }/system/orderInfo'"> 주문내역 현황 > </button>
            <hr style="margin-top: 0px;	margin-bottom: 0px;">
            <table class="orderInfoTable infoTables">
           		<tr>
           			<!-- 전체 주문내역 숫자 -->
           			<td>총 주문내역 현황 : ${ datas.totalOrderCount }개</td>
           			<!-- 최근 한달 주문내역 숫자 -->
           			<td>최근 한달 주문내역 현황 : ${ datas.lastMonthOrderCount }개</td>
           		</tr>
           		<tr>
           			<!-- 환불 주문내역 숫자 -->
           			<td>환불 주문내역 현황 : ${ datas.refundOrReturnOrderCount }개</td>
           			<!-- 배송중 주문내역 숫자 -->
           			<td>배송중인 주문내역 현황 : ${ datas.deliveringOrderCount }개</td>
           		</tr>
           		<tr>
           			<!-- 입금대기 주문내역 숫자 -->
           			<td>입금대기 주문내역 현황 : ${ datas.waitingDepositOrderCount }개</td>
           		</tr>
           	</table>
        </div>
        <div class="adminCommissionDiv contentDiv">
            <button class="titleBtn" onclick="location.href='${ pageContext.servletContext.contextPath }/admin/settlement/breakdown'"> 수수료 현황 > </button>
            <hr style="margin-top: 0px;	margin-bottom: 0px;">
            <table class="commissionInfoTable infoTables">
           		<tr>
           			<!-- 전체 수수료액 -->
           			<td>총 수수료 : ${ datas.totalCommission }원</td>
           			 <!-- 수수료 비율 -->
           			<td>수수료 비율 : 5%</td>
           		</tr>
           		<tr>
           			<!-- 기간별 수수료액(하루/일주일/개월) -->
           			<td>최근 한달 수수료 : ${ datas.lastMonthCommission }원</td>
           			<td>최근 한주 수수료 : ${ datas.lastWeekCommission }원</td>
           		</tr>
           		<tr>
           			<td>최근 하루 수수료 : ${ datas.lastDayCommission }원</td>
           		</tr>
           	</table>
        </div>
	</div>
	</section>
	</div>
	<footer>
		<jsp:include page="../../common/footer.jsp"/>
	</footer>
</body>
</html>