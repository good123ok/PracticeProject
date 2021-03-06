<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
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
    
    .paymentListTable{
        border: hidden;
        border-top: 2px solid darkgray;
        border-bottom: 2px solid darkgray;
        border-collapse: collapse;
        text-align: center;
        width: 1500px;
        table-layout:fixed;
    }

    .paymentListTable td{
        border: 2px solid darkgray;
        font-family: 'SCDream-Regular';
        font-size: 16px;
        height: 50px;
        text-overflow: ellipsis;
        overflow: hidden;
    }
    
    .pagingArea{
    	position: absolute;
    	left: 50%;
    	transform: translateX(-50%);
    	bottom: 0px;
    	padding-bottom: 20px;
    }
        
    .pagingArea button{
    	width: 40px;
    	height: 40px;
    	color: #775EEE;
    	border: none;
    	background: transparent;
    	font-family: 'SCDream-Regular';
    	font-size: 16px;
    	font-weight: bold;
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
        <h1 style="position: relative; left: 20px; font-family: 'SCDream-Medium'; font-size: 40px;">결제내역</h1>
        <hr width="1600px" align="left">
        <br><br>

        <div class="paymentListDiv" align="center">
            <table class="paymentListTable">
                <tr>
                    <td style="font-family: 'SCDream-Medium'; font-size: 20px; width: 150px">결제번호</td>
                    <td style="font-family: 'SCDream-Medium'; font-size: 20px; width: 230px">결제수단</td>
                    <td style="font-family: 'SCDream-Medium'; font-size: 20px;">결제 내용</td> 
                    <td style="font-family: 'SCDream-Medium'; font-size: 20px; width: 180px">결제금액 (원)</td>
                    <td style="font-family: 'SCDream-Medium'; font-size: 20px; width: 150px">결제일자</td>
                </tr>
                <c:if test="${ empty paymentList }">
                	<tr>
                		<td colspan="5"style="font-family: 'SCDream-Regular'; font-size: 20px; height: 100px;">결제 내역이 없습니다.</td>
                	</tr>
                </c:if>
                
                <%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
                <%-- 3자리 마다 쉼표 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" /> --%>
				<%-- 한국 통화 : <fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${price}" /> --%>
                
                <c:forEach var="list" items="${ paymentList }">
                <tr>
                    <td><c:out value="${ list.corpPayNo }"/></td>
                    <td><c:out value="${ list.corpPayMethod }"/></td>
                    <td style="text-align: left; padding-left: 20px;"><c:out value="${ list.corpPayDetails }"/></td>
                    <td style="text-align: right; padding-right: 20px;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${ list.corpPayAmount }"/></td>
                    <td><c:out value="${ list.corpPayDate }"/></td>
                </tr>
                </c:forEach>
                
            </table>
        </div>       <!-- paymentListDiv 종료 -->
        
        <div class="pagingArea" align="center">
			<button id="startPage">◀◀</button>
	
			<c:if test="${ pageInfo.pageNo == 1 }">
				<button disabled>◁</button>
			</c:if>
			<c:if test="${ pageInfo.pageNo > 1 }">
				<button id="prevPage">◁</button>
			</c:if>
	
			<c:forEach var="p" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1">
			<c:if test="${ pageInfo.pageNo eq p }">
				<button disabled><c:out value="${ p }"/></button>
			</c:if>
			<c:if test="${ pageInfo.pageNo ne p }">
				<button onclick="pageButtonAction(this.innerText);"><c:out value="${ p }"/></button>
			</c:if>
			</c:forEach>
	
			<c:if test="${ pageInfo.pageNo == pageInfo.maxPage }">
				<button disabled>▷</button>	
			</c:if>
			<c:if test="${ pageInfo.pageNo < pageInfo.maxPage }">
				<button id="nextPage">▷</button>
			</c:if>
	
			<button id="maxPage">▶▶</button>
		</div> <!-- pagingAreaDiv 종료 -->
	
	</div>	<!-- sectionDiv 종료 -->
	
    <br clear=both>
<!-- 	<div class="footer">
		<h1 align="center">FOOTER</h1>
	</div>
 -->	
	<script>
		const link = "${ pageContext.servletContext.contextPath }/settleMng/paymentList";
		
		function pageButtonAction(text) {
			location.href = link + "?currentPage=" + text;
		}
		
		if(document.getElementById("startPage")){
			const $startPage = document.getElementById("startPage");
			$startPage.onclick = function(){
				location.href = link + "?currentPage=1";
			}
		}
		
		if(document.getElementById("maxPage")){
			const $maxPage = document.getElementById("maxPage");
			$maxPage.onclick = function(){
				location.href = link + "?currentPage=${ pageInfo.maxPage }";
			}
		}
		
		if(document.getElementById("prevPage")){
			const $prevPage = document.getElementById("prevPage");
			$prevPage.onclick = function(){
				location.href = link + "?currentPage=${ pageInfo.pageNo - 1 }";
			}
		}
		
		if(document.getElementById("nextPage")){
			const $nextPage = document.getElementById("nextPage");
			$nextPage.onclick = function(){
				location.href = link + "?currentPage=${ pageInfo.pageNo + 1 }";
			}
		}
	
	</script>
	
</body>
</html>