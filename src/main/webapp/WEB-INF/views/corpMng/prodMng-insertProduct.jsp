<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
    
	.insertProductDiv{
        /* border: 1px solid black; */
        position: relative;
        left: 50px;
        width: 1500px;
    }
    
    .insertProductTable {
    	/* border: 1px solid black; */
    	position: relative;
    	top: 30px;
        left: 30px;
        width: 1500px;
    }

    .insertProductTable td{
    	/* border: 1px solid black; */
    	border-bottom: 1px solid darkgray;
        height: 80px;
        font-size: 20px;
        font-family: 'SCDream-Regular';
    }
    
    .insertProductTable input{
    	font-family: 'SCDream-Regular';
    	font-size: 20px;
    	height: 40px;
    }
    
    #prodImgUploadBtn{
    	position: relative; 
    	width: 150px;
    	height: 40px;
    	font-size: 20px;
    	font-family: 'SCDream-Regular';
    	color: white;
    	background-color: #8877DA;
    	border: none;
    	border-radius: 10px;
    	text-align: center;
    	padding-top: 10px;
    	padding-bottom: 10px;
    	padding-right: 20px;
    	padding-left: 20px;
    	margin: 0;
    	margin-left: 20px;
    }
    
    .previewDiv {
    	/* border: 1px solid black; */
    	width: 1200px;
    	/* height: 500px; */
    	margin-left: 20px;
    	margin-top: 20px;
    }
    
    .previewImgDiv {
    	 display: inline-block;
    	 margin-bottom: 10px;
    	 margin-right: 10px;
    	 border: 2px solid #8877DA;
    	 border-radius: 10px;
    	 padding: 10px;
    	 width: 200px;
    	 height: 200px;
    }
    
    .previewImgs{
    	position: absolute;
    	width: 200px;
		height: 200px;
    }
    
    .delBtn{
    	width: 40px;
    	height: 40px;
        background-color: #8877DA;
        border-radius: 100%;
        font-family: 'SCDream-Medium';
        font-size: 22px;
        color: white;
        border: none;
        float: right;
        opacity: 0.7;
        position: relative;
        right: 5px;
        top: 5px;
        padding: 0;
    }
    
    .prodDetailImgBtn{
    	position: relative; 
    	width: 200px;
    	height: 40px;
    	font-size: 20px;
    	font-family: 'SCDream-Regular';
    	color: white;
    	background-color: #8877DA;
    	border: none;
    	border-radius: 10px;
    	text-align: center;
    	padding-top: 10px;
    	margin: 0;
    	margin-left: 20px;
    	margin-top: 20px;
    }
    
    .prodDetailPreviewDiv {
    	border: 2px solid #8877DA;
    	border-radius: 10px;
    	margin-top: 20px;
    	margin-left: 20px;
    	margin-bottom: 20px;
    	width: 500px;
    	height: 600px;
    }
    
    .prodDetailPreview{
    	border: none;
    	width: 450px;
    	height: 600px;
    	position: relative; 
    	left: 50%;
    	transform: translateX(-50%);
    }
    
    .insertProductBtn{
    	width: 200px; 
    	height: 50px; 
    	position: relative;
    	left: 50%;
    	transform: translateX(-50%);
    	font-family: 'SCDream-Regular';
    	font-size: 20px; 
    	color: white;
    	background-color: #8877DA;
    	border: none;
    	border-radius: 10px;
    	text-align: center;
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
        <h1 style="position: relative; left: 20px; font-family: 'SCDream-Medium'; font-size: 40px;">????????????</h1>
        <hr width="1600px" align="left">
        <br><br>
        <div class="insertProductDiv">
            <form action="${ pageContext.servletContext.contextPath }/prodMng/insertProduct" method="POST" enctype="multipart/form-data">
                <table class="insertProductTable">
                    <tr>
                        <td style="text-align: right; width: 200px; padding-right: 20px;">* ???????????? : </td>
                        <td style="width: 1300px; text-indent: 20px;">
                            <select name="prodCtgNo" style="width: 400px; height: 40px; font-size: 20px; font-family: 'SCDream-Regular';">
                                <option value="PRCT0001">??????/????????????</option>
                                <option value="PRCT0002">??????/????????????</option>
                                <option value="PRCT0003">?????????/??????</option>
                                <option value="PRCT0004">??????/??????</option>
                                <option value="PRCT0005">??????/??????</option>
                                <option value="PRCT0006">??????</option>
                                <option value="PRCT0007">??????/??????</option>
                                <option value="PRCT0008">??????</option>
                                <option value="PRCT0009">?????????</option>
                                <option value="PRCT0010">????????????</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding-right: 20px;">* ????????? : </td>
                        <td style="text-indent: 20px;">
                            <input type="text" name="prodName" style="width: 500px;" placeholder=" ???????????? ??????????????????." required>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding-right: 20px;">* ????????? : </td>
                        <td style="text-indent: 20px;">
                            <input type="text" name="prodManufacturer" style="width: 500px;" placeholder=" ???????????? ??????????????????." required>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding-right: 20px;">* ?????? ????????? : <br>
                            <p style="margin: 0; font-size: 14px;">(?????? 1???/?????? 10???)&nbsp;</p>
                        </td>
                        <td style="min-height: 300px; padding-top: 20px;">
                        	<input type="file" id="prodImg" name="prodImg" multiple required hidden>
                       		<label for="prodImg" id="prodImgUploadBtn">????????? ?????????</label>
                        	<div id="previewDiv" class="previewDiv">
                        		<div class="previewImgDiv"></div>
                        	</div>
                       </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding-right: 20px;">* ????????? : </td>
                        <td style="text-indent: 20px;">
                            <input type="number" min="10" name="prodPrice" style="width: 250px; font-size: 20px; text-align: right;" 
                            		placeholder="???????????? ???????????????." required> ???
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding-right: 20px;">* ?????? ???????????? : </td>
                        <td>
                            <input type="file" name="prodImg" id="prodDetailImg" required hidden>
                            <div class="prodDetailImgBtn"><label for="prodDetailImg"> ?????? ????????? ??????</label></div>
                            <div class="prodDetailPreviewDiv"> <img class="prodDetailPreview" id="prodDetailPreview"> </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding-right: 20px;">* ?????? ????????? : </td>
                        <td style="text-indent: 20px;">
                            <input type="date" name="prodTerminateDate" style="width: 200px; text-align: center;" required>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding-right: 20px;">* ?????? ?????? ?????? : </td>
                        <td style="text-indent: 20px;">
                            <input type="text" name="stockQuantity" style="width: 250px; text-align: right;" 
                            		placeholder="??????????????? ???????????????." required> ???
                            		
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding-right: 20px;">* ????????? ?????? : <br>
                            <p style="margin: 0; font-size: 14px;">(?????? 1???/?????? 5???)&nbsp;</p>
                        </td>
                        <td style="text-indent: 20px;">
                            <input type="text" name="keywordsSet" style="width: 150px;" required>
                            <input type="text" name="keywordsSet" style="width: 150px; margin-left:10px;">
                            <input type="text" name="keywordsSet" style="width: 150px; margin-left:10px;">
                            <input type="text" name="keywordsSet" style="width: 150px; margin-left:10px;">
                            <input type="text" name="keywordsSet" style="width: 150px; margin-left:10px;">
                        </td>
                    </tr>
                </table>
                <br><br>
                <button class="insertProductBtn" type="submit">????????????</button>
            </form>
        </div>
        <br><br><br><br>
    </div>  <!-- sectionDiv ?????? -->
    
	<br clear=both>
	<!-- <div class="footer">
		<h1 align="center">FOOTER</h1>
	</div> -->
	
	<script>
		$('#prodImgUploadBtn').off('click').on('click',function(){
			$('#prodImgUploadBtn').unbind('click');
			
			$("input[id='prodImg']").change(function(e){
				$('#previewDiv').empty();
				var addDiv = '<div class="previewImgDiv"></div>';
				
				if($('#previewDiv').is(':empty')){
					$(addDiv).appendTo('#previewDiv'); 
				}
				var files = e.target.files;
				var arr = Array.prototype.slice.call(files);
				preview(arr);
			});
			
			function preview(arr){
				$('#previewDiv').empty();

				if(arr.length >= 1 && arr.length <= 10){
					
					arr.forEach(function(f){
						var str = '<div class="previewImgDiv">';
						var reader = new FileReader();
						reader.onload = function (e) {
							str += '<img id="preview" class="previewImgs" src="'+e.target.result+'"/>';
							str += '</div>';
							$(str).appendTo('#previewDiv');
						}
						reader.readAsDataURL(f);
					}); /* for??? ?????? */
					
				} else if (arr.length > 10){
					alert('????????? ????????? ????????? ???????????? ?????????.');
					var addDiv = '<div class="previewImgDiv"></div>';
					
					if($('#previewDiv').is(':empty')){
						$(addDiv).appendTo('#previewDiv'); 
					}
				}
			};
		});	
			
		/* $(document).on('click','#prodImg',function(){
			$("input[id='prodImg']").change(function(e){
				$('#previewDiv').empty();
				
		          var files = e.target.files;
		          var arr = Array.prototype.slice.call(files);
					console.log('files : ' + e.target.files);
					console.log('arr : ' + arr);
		          
		          preview(arr);
		          
		        });
			
				function preview(arr){
					
					 if(arr.length == 10){
						 // $('#previewDiv').empty();
						
						arr.forEach(function(f){
							var str = '<div class="previewImgDiv">';
							var reader = new FileReader();
							
							reader.onload = function (e) {
								str += '<img id="preview" class="previewImgs" src="'+e.target.result+'"/>';
								str += '<button type="button" class="delBtn">x</button>';
								str += '</div>';
								$(str).appendTo('#previewDiv');
							}
							reader.readAsDataURL(f);
						}); // for??? ?????? 
						
						// $("#prodImg").val("");
					} else if(arr.length < 10){
						
						if(($('#previewDiv').children().length + arr.length) > 11 ){
							alert('????????? ????????? ?????? ????????? ???????????? ?????????.');
						} else {
							arr.forEach(function(f){
								var str = '<div class="previewImgDiv">';
								var reader = new FileReader(); //????????? ?????? ?????? FileReader?????? ??????
										
								reader.onload = function (e) { //?????? ?????????????????? ??????????????? ???????????? ????????? ?????????
									str += '<img id="preview" class="previewImgs" src="'+e.target.result+'"/>';
									str += '<button type="button" class="delBtn">x</button>';
									str += '</div>';
									$(str).prependTo('#previewDiv');
								} 
								reader.readAsDataURL(f);
							}); //for??? ??????
						}
						
						// $("#prodImg").val("");
						if (($('#previewDiv').children().length + arr.length) == 11 ){
							$('#prodImgUploadBtnLabel').parent().remove();
						}
							
					} else if (arr.length > 10) {
						alert('????????? ????????? ?????? ????????? ???????????? ?????????.');
						$('#previewDiv').empty();
						$("#prodImg").val("");
						var addBtn = '<div class="previewImgDiv"><label for="prodImg" id="prodImgUploadBtnLabel"><img src="${ pageContext.servletContext.contextPath }/resources/images/insertButton.png" class="previewImgs"></label></div>';
						$(addBtn).appendTo('#previewDiv'); 
					}
		      	};
		}); */
		
		
		/* $(document).on('click','#prodImg',function(){
			$("input[id='prodImg']").change(function(e){
	
		          $('#previewDiv').empty();
		    
		          var files = e.target.files;
		          var arr = Array.prototype.slice.call(files);
		          
		          preview(arr);
		          
		        });
	
				function preview(arr){
					if(arr.length <= 10){
						arr.forEach(function(f){
							var str = '<div class="previewImgDiv">';
						
							if(f.type.match('image.*')){
								var reader = new FileReader(); //????????? ?????? ?????? FileReader?????? ??????
								
								reader.onload = function (e) { //?????? ?????????????????? ??????????????? ???????????? ????????? ?????????
									str += '<img id="preview" class="previewImgs" src="'+e.target.result+'"/>';
									str += '<button type="button" class="delBtn">x</button>';
									str += '</div>';
									$(str).appendTo('#previewDiv');
									
								} 
								reader.readAsDataURL(f);
							}
						}); //arr.forEach
						
					} else if (arr.length > 10){
						alert('????????? ????????? ?????? ????????? ???????????? ?????????.');
					}
		      	};
		}); */

		/* $(document).on('click','.delBtn',function(){
			console.log('ss : ' + $(this).parent())
			$(this).parent().attr()
			$(this).parent().is('img').remove();
			$('#previewDiv').empty();
			$("#prodImg").val("");
			
			var addBtn = '<div class="previewImgDiv"><label for="prodImg" id="prodImgUploadBtnLabel"><img src="${ pageContext.servletContext.contextPath }/resources/images/insertButton.png" id="previewImgs"></label></div>';
			if($('#previewDiv').is(':empty')){
				$("#prodImg").val("");
				$(addBtn).appendTo('#previewDiv'); 
			}
			
			if($('#prodImgUploadBtnLabel').parents().is('div') == false){
				$(addBtn).appendTo('#previewDiv');
			}
		}); */
		
		$(document).on('click','.prodDetailImgBtn',function(){
			
			$("input[id='prodDetailImg']").change(function(e){
				$('#prodDetailPreviewDiv').empty();
				var value = e.target;
				uploadProdDetailImg(value);
			});
			
			function uploadProdDetailImg(value){
				
				if (value.files && value.files[0]) {
					var reader = new FileReader();
				         
					reader.onload = function (e) {
						$('#prodDetailPreview').attr('src', e.target.result);
					}
					reader.readAsDataURL(value.files[0]);
				}
			};
		});
	  
  </script>
	

	
</body>
</html>