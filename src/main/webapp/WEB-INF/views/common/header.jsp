<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/header.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/reset.css">
    <script src="/missingitnow/resources/js/member/main.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>

<body>

	<form name="cartPaging">
		
		 <input type="hidden" name="userNo" value="${loginMember.userNo}">
		 
	</form>


    <header>
        <div class="nav">

            <!-- 햄버거 버튼 -->

            <div class="menu">
                <input type="checkbox" id="menuicon">
                <label for="menuicon">
                    <span></span>
                    <span></span>
                    <span></span>
                </label>
                <div class="sidebar">
                    <div class="header-information">
                        <div class="profile"><img src="${ pageContext.servletContext.contextPath }/resources/images/header/profile.png" alt=""></div>
	                    <div class="user-name">
	                       	<c:if test="${ !empty loginMember }">
	           					<c:out value="${ loginMember.userName }"/>님 환영합니다.
	            			</c:if>
	            			<c:if test="${ !empty CorpUserSession }">
	            				<c:out value="${ CorpUserSession.corpName }"/>님 환영합니다.
	            			</c:if>
                        </div>
                    </div>
                    <div class="test">
                        <div class="blank"></div>

                        <div class="category">
                            <div class="category-name">카테고리</div>
                            <ul><a href="${ pageContext.servletContext.contextPath}/product/productList?prodCtgNo=PRCT0001">
                                    <li class="category-title">
                                        <div class="category-title-style">거실/침실가구</div>
                                    </li>
                                </a>
                                <a href="${ pageContext.servletContext.contextPath}/product/productList?prodCtgNo=PRCT0002">
                                    <li class="category-title">
                                        <div class="category-title-style">학생/서재가구</div>
                                    </li>
                                </a>
                                <a href="${ pageContext.servletContext.contextPath}/product/productList?prodCtgNo=PRCT0003">
                                    <li class="category-title">
                                        <div class="category-title-style">테이블/의자</div>
                                    </li>
                                </a>
                                <a href="#">
                                    <li class="category-title">
                                        <div class="category-title-style">침구/커튼</div>
                                    </li>
                                </a>
                                <a href="#">
                                    <li class="category-title">
                                        <div class="category-title-style">쿠션/방석</div>
                                    </li>
                                </a>
                                <a href="#">
                                    <li class="category-title">
                                        <div class="category-title-style">가전</div>
                                    </li>
                                </a>
                                <a href="#">
                                    <li class="category-title">
                                        <div class="category-title-style">수납/정리</div>
                                    </li>
                                </a>
                                <a href="#">
                                    <li class="category-title">
                                        <div class="category-title-style">조명</div>
                                    </li>
                                </a>
                                <a href="#">
                                    <li class="category-title">
                                        <div class="category-title-style">홈데코</div>
                                    </li>
                                </a>
                                <a href="#">
                                    <li class="category-title">
                                        <div class="category-title-style">생활용품</div>
                                    </li>
                                </a>
                             
                            </ul>
                        </div>

                        <div class="blank"></div>

                        <div class="category">
                            <div class="category-name">주요서비스</div>
                            <ul><a href="#">
                                    <li class="category-title">
                                        <div class="category-title-style">쿠폰존</div>
                                    </li>
                                </a>
                                <a href="#">
                                    <li class="category-title">
                                        <div class="category-title-style">이벤트 / 기획전</div>
                                    </li>
                                </a>
                                
                                
                              <!-- 일반회원으로 로그인했을때 표시되는 마이페이지 링크 -->  
                              <c:if test="${!empty loginMember }">
	
		                                <a href="${ pageContext.servletContext.contextPath}/member/myPageMain">
		                                    <li class="category-title">
		                                        <div class="category-title-style">MY PAGE</div>
		                                    </li>
		                                </a>								        
									
							  </c:if>

						      <!-- 기업회원으로 로그인했을때 표시되는 마이페이지 링크 -->  
									
						      <c:if test="${!empty CorpUserSession }">
						      			<c:choose>
						      				<c:when test="${ CorpUserSession.corpNo eq 'ADMIN' }">
						      					<a href="${ pageContext.servletContext.contextPath}/admin/main">
				                                    <li class="category-title">
				                                        <div class="category-title-style">관리자 페이지</div>
				                                    </li>
				                                </a>
						      				</c:when>
						      				<c:when test="${ CorpUserSession.corpNo ne 'ADMIN' }">
						      					<a href="${ pageContext.servletContext.contextPath}/corpMng/main">
				                                    <li class="category-title">
				                                        <div class="category-title-style">MY PAGE</div>
				                                    </li>
				                                </a>
						      				</c:when>
						      			</c:choose>
							  </c:if>
									
										
                                 <a href="${ pageContext.servletContext.contextPath}/communty/communtyList">
                                    <li class="category-title">
                                        <div class="category-title-style">커뮤니티</div>
                                    </li>
                                </a>
                                 <a onclick="loginCheck()">
                                    <li class="category-title">
                                        <div class="category-title-style">Q&amp;A</div>
                                    </li>
                                </a>
                                 <a href="${ pageContext.servletContext.contextPath }/admin/ntc/list">
                                    <li class="category-title">
                                        <div class="category-title-style">공지사항</div>
                                    </li>
                                </a>
                            </ul>
                        </div>

                        <div class="blank"></div>

                        <div class="event">
                     	       우리은행 카드 결제시 수수료 면제
                        </div>

                        <div class="blank"></div>

                    </div>
                </div>
            </div>
            <!-- 로고 -->
            <div class="logo">
                <a href="${ pageContext.servletContext.contextPath }/product/main"><img class="logo-png" src="${ pageContext.servletContext.contextPath }/resources/images/logo.png" class="icons_img" alt="" width="80px"></a>
            </div>

            <!-- 검색바 -->
             <div class="search">
                <div class="search_bar">
                    <input class="search_size" id="ketSearch" type="text" title="검색">
                    <a href="#" id="search"><img src="${ pageContext.servletContext.contextPath }/resources/images/search.png" class="search_img" alt=""></a>
                </div>
            </div>
			<div class="searchClass">
			
			</div>
            <!-- 차트 -->
            <div class="charts">
                <span class="charts_rank">1 &nbsp;&nbsp;</span><span>1등인기 상품</span>
            </div>

            <!-- 아이콘 -->
            
            	<!-- 비로그인 상태에서 보여줄 헤더 아이콘 -->
            	<c:if test="${ empty loginMember && empty CorpUserSession}">
            		<div class="icons">
               			<a href="${ pageContext.servletContext.contextPath}/corporation/loginPage"><img src="${ pageContext.servletContext.contextPath }/resources/images/main/menu/menu1.png" class="icons_img" alt=""></a>
		                <a href="${ pageContext.servletContext.contextPath}/corporation/loginPage"><img src="${ pageContext.servletContext.contextPath }/resources/images/main/menu/menu3.png" class="icons_img" alt=""></a>
            		</div>
            	</c:if>
     	
            	
            	<!-- 로그인 상태에 보여줄 헤더 아이콘 -->            	
            	<c:if test="${!empty loginMember || !empty CorpUserSession}">
	            	<div class="icons">
	            		<c:if test="${!empty CorpUserSession}">
		            		<c:choose>
			      				<c:when test="${ CorpUserSession.corpNo eq 'ADMIN' }">
			      					<a href="${ pageContext.servletContext.contextPath}/admin/main"><img src="${ pageContext.servletContext.contextPath }/resources/images/main/menu/menu1.png" class="icons_img" alt=""></a>
			      				</c:when>
			      				<c:when test="${ CorpUserSession.corpNo ne 'ADMIN' }">
			      					<a href="${ pageContext.servletContext.contextPath}/corpMng/main"><img src="${ pageContext.servletContext.contextPath }/resources/images/main/menu/menu1.png" class="icons_img" alt=""></a>
			      				</c:when>
			      			</c:choose>
			        	</c:if>
			         	<c:if test="${!empty loginMember}">
			                <a href="javascript:goCartPaging('${loginMember.userNo}');"><img src="${ pageContext.servletContext.contextPath }/resources/images/main/menu/menu1.png" class="icons_img" alt=""></a>
			         	</c:if>
			                <a href="javascript:goCartPaging('${loginMember.userNo}');"><img src="${ pageContext.servletContext.contextPath }/resources/images/main/menu/menu3.png" class="icons_img" alt=""></a>
	             		    <a href="${ pageContext.servletContext.contextPath}/member/logout"><img src="${ pageContext.servletContext.contextPath }/resources/images/main/menu/menu4.png" class="icons_img" alt=""></a>
	            	</div>
            	
            	</c:if>
            	
            	
        </div>
    </header>
    <div id="msgStack" style="position: fixed; right: 0px; bottom: 0px;"></div>
    <div class="space"></div>
    <!-- 검색바 엔진 구현 -->
   <script>
    $("#search").click(function(){
		const search = document.getElementById("ketSearch").value;
		location.href="${ pageContext.servletContext.contextPath}/product/productSearch?search=" + search;
	});
    
		$("#ketSearch").keyup(function(){
			const search = document.getElementById("ketSearch").value;
			$.ajax({
				url : "ketSearch",
				method : "post",
				data : {
					search : search
				},
				success : function(data){
					console.log(data)
					console.table(data);
					const $div = $(".searchClass");
					$div.html("");
					$searchBottom = $("<div>").attr("class", "searchBottom");
					if(search == ""){
						$div.html("");
					}
					if(search != ""){
					for(var index in data){

						$link = $("<a>").attr("href", "#");
						$searchFont = $("<div>").text(data[index].product.prodName).attr("class", "searchFont test"+[index]).attr("id", "test"+[index]);
						$link.append($searchFont); 
						$searchBottom.append($link); 
						
						
					} 	
						$div.append($searchBottom); 
						
						
						$("#test0").click(function(){
							document.getElementById("ketSearch").value = data[0].product.prodName;
						});
						$("#test1").click(function(){
							document.getElementById("ketSearch").value = data[1].product.prodName;
						});
						$("#test2").click(function(){
							document.getElementById("ketSearch").value = data[2].product.prodName;
						});
						$("#test3").click(function(){
							document.getElementById("ketSearch").value = data[3].product.prodName;
						});
						$("#test4").click(function(){
							document.getElementById("ketSearch").value = data[4].product.prodName;
						});
						
						$("#test0").mouseenter(function(){
							$img = $("<img>").attr("src", "${ pageContext.servletContext.contextPath }/resources/images/product/"+ data[0].productImg.prodImgRename ).attr("class", "searchImg");
							$div.append($img); 
						});
						$("#test1").mouseenter(function(){
							$img = $("<img>").attr("src", "${ pageContext.servletContext.contextPath }/resources/images/product/"+ data[1].productImg.prodImgRename ).attr("class", "searchImg");
							$div.append($img); 
						});
						$("#test2").mouseenter(function(){
							$img = $("<img>").attr("src", "${ pageContext.servletContext.contextPath }/resources/images/product/"+ data[2].productImg.prodImgRename ).attr("class", "searchImg");
							$div.append($img); 
						});
						$("#test3").mouseenter(function(){
							$img = $("<img>").attr("src", "${ pageContext.servletContext.contextPath }/resources/images/product/"+ data[3].productImg.prodImgRename ).attr("class", "searchImg");
							$div.append($img); 
						});
						$("#test4").mouseenter(function(){
							$img = $("<img>").attr("src", "${ pageContext.servletContext.contextPath }/resources/images/product/"+ data[4].productImg.prodImgRename ).attr("class", "searchImg");
							$div.append($img); 
						});
					}
				},
				
				error : function(error){
					console.log(error);
				}
				});
			
		});
		
		function loginCheck(){
			
			var userSession = '${loginMember}';
			var corpSession = '${CorpUserSession}';
			
			if(corpSession){
				
				location.href = "${ pageContext.servletContext.contextPath }/admin/qna/list";
				
			} else if(userSession){
				
				location.href = "${ pageContext.servletContext.contextPath }/admin/qna/list";
				
			} else {
				
				alert("로그인이 필요한 서비스입니다!");
				return false;
				
			}
			
		}
	</script>
	<!-- sockJS -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script>
	// 전역변수 설정
	var websocket = null;
	var wsUri = "ws://localhost:8888/missingitnow/qnaresponse/websocket";
	$(document).ready(function(){
		
		send_message();
		
	});
	
	function send_message(){
		
	    // 웹소켓 연결
	    websocket = new WebSocket(wsUri);
	
        websocket.onmessage = function(evt) {

            onMessage(evt);

        };

	};
	
	// toast생성 및 추가
	function onMessage(evt){
	    var data = evt.data;
	    // toast
	    let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
	    toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
	    toast += "<small class='text-muted'>just now</small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
	    toast += "<span aria-hidden='true'>&times;</span></button>";
	    toast += "</div><div class='toast-body'>" + data + "</div></div>";
	    $("#msgStack").append(toast);   // msgStack div에 생성한 toast 추가
	    $(".toast").toast({"animation": true, "autohide": false});
	    $('.toast').toast('show');
	};	
</script>
</body>
</html>