<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
    	
    	       .titleTable{
        margin-left:20px;		
		height:100px;		
		vertical-align: bottom;	
	}

	.titleColorBox{	
		background-color: rgba(119, 94, 238, 0.7);
		color:#fff;
		font-size:30px;
		vertical-align: bottom;	
	}
	
	.titleNonColor{
		font-size:25px;
		vertical-align: bottom;
	}
        
        .leftBg{
		position:relative;
		margin-top:400px;
		margin-left:650px;
		margin-bottom:50px;
		}
        
        
        .pwdFindForm{      
        	position:absolute;
            margin-top:-800px; 
            margin-left:1000px; 
            margin-bottom:900px;
            background-color: rgba(119, 94, 238, 0.33); 
            width:900px;
            height:700px;
        }
        .pwdFindFormTable{
        	
            margin-top:50px;
            margin-left:40px;
        }
    	
    	
    	
    	.whiteForm{
        background: #FBF9F9;
		border: 0.2px solid #000000;
		box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
		border-radius: 10px;
        width:500px;
        margin-top:70px;
        margin-left:390px;
        }
    
    
    
        .mainBtn{
        outline: 0;
        border : 0;        
        background: #775EEE;
		color:#ffff;		
		width:150px;
		height:30px;
		border-radius: 10px;
		font-size:15px;
    	}
    	
        .mainBtn2{
        outline: 0;
        border : 0;        
        background: rgba(119, 94, 238, 0.51);;
		color:#ffff;		
		width:150px;
		height:30px;
		border-radius: 10px;
		font-size:12px;
    	}
    
    	.cancelBtn{
        outline: 0;
        border : 0;        
        background: #EE5E5E;
		color:#ffff;		
		width:150px;
		height:30px;
		border-radius: 10px;
		font-size:15px;
    	}
       

        .hide{
            display: none;

        }

		.inform{
			line-height:29px;
			font-size:13px;
			font-family: Roboto;
			color:gray;
		}
   


    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
 		
 			<div class="header">
	<jsp:include page="../common/header.jsp"/>
    </div> 


   
    
<div>
<img class="leftBg" src="/missingitnow/resources/images/member/findLeftbg.png">
</div>     
    
<div class="pwdFindForm">
    
    <div><br><br><br></div>
	
<table class="titleTable" border="1">
		   	<tr>
		   		<td class="titleColorBox"><br><br><br><c:out value="${loginMember.userName }"/>&nbsp;?????????, </td>
		   		<td class="titleNonColor">&nbsp;&nbsp;?????? ?????????????????????????</td>
		   		
		   	</tr>
 
		   		<tr><td><br></td></tr>

		   	<tr> 
		   		<td>&nbsp;</td>
		   		<td class="titleNonColor">&nbsp;&nbsp;???????????? ????????? ???????????? ????????? ??????????????????</td>
		   		
		   	</tr>
	</table> 
		   
	<div class="whiteForm">
    <table border="1" class="pwdFindFormTable">
        
        
        <tr>
            
            <td>&nbsp;&nbsp;<pre class="inform">        ??????????????? ?????? ??? ?????? ????????? ???????????? ???????????? ????????????
???????????? ????????? ??????, ????????? ???????????? ????????? 1?????? ????????? ???????????????.

           ????????? ????????? ?????? ????????? ?????????????????? ????????????.</pre></td> 
         <tr>  
         	<td><br></td>
         <tr> 
                <td align="center">
                	
                	<button class="mainBtn2" id="privacyPolicy" type="button" onclick="openPopup()">???????????? ????????????</button>
                
                </td>
         </tr>   	
         
         		<tr><td><br></td></tr>
         
            	        	
            	
                
        <tr><td><br></td></tr>
        
        
        <tr align="center">
        
            <td colspan="4"> <button id="findBtn" type="button" class="mainBtn">????????????</button>    
                &nbsp;&nbsp;&nbsp;&nbsp;
                
                <button type="button" class="cancelBtn" 
                onclick="location.href='${pageContext.servletContext.contextPath}/member/myPageMain'">????????????</button>  
                
            </td>
                
                
                
                
        </tr>
        <tr><td><br><br></td></tr>
    </table>
	</div>

</div>


	<div class="footer">
    
    <jsp:include page="../common/footer.jsp"/>
    
	</div>	 
 		
 		
    <script>
	
    function openPopup(){
        window.open("${pageContext.servletContext.contextPath}/member/PrivacyPolicy", 
        		"new", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=950, height=700, left=0, top=0" );
    }
    

    </script>
    


</body>
</html>