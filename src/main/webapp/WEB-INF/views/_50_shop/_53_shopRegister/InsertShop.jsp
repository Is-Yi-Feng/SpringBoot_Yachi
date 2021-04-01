<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>申請商家</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet"
	href="<c:url value='/_00_util/shopUtil/css/normalize.css'/>">
	<link rel="stylesheet"
	href="<c:url value='/_00_util/shopUtil/css/shop_register.css'/>">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- MATERIAL DESIGN ICONIC FONT
<link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css"> -->

</head>
<body>
	<!-- Start:header -->
	<!-- 回到上方的按鈕 -->
	<!-- <a href="#" class="toTop"><i class="fas fa-arrow-up"></i></a> -->
	
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />





	<!-- 商家註冊頁面開始 -->
	<div class="wrapper" style="background-image: url('images/bg-registration-form-1.jpg');">
		<div class="inner">

			<form:form method="POST" modelAttribute="shopBean"
						enctype='multipart/form-data'>
				<h3>申請成為商家</h3>

				<div class="image-holder">
					<img src="${pageContext.request.contextPath}/data/images/smallPic/yachiLogo50.png" alt="" id="headImg">				
					<label for="file">
						<i class="fas fa-image">
							編輯照片
							
							<form:input type="file" path="shop_image" style="display: none;" id="file"  accept="image/gif, image/jpeg, image/png"/>
						</i>
					</label>
				</div>
				
				<div class="form-wrapper">
					<form:input type="text" path="shop_name" class="form-control" placeholder="商家名稱"/>
					<i class="fas fa-store"></i>
				</div>
				<div class="form-wrapper">
					<form:input type="text" path="shop_owner" class="form-control" placeholder="業主姓名"/>
					<i class="fas fa-store"></i>
				</div>
				<div class="form-wrapper">
					<form:input type="text" path="shop_addr" class="form-control" placeholder="商家地址"/>
					<i class="fas fa-store"></i>
				</div>
				
				<div class="form-wrapper">
				<form:input type="text" path="shop_phone" class="form-control" placeholder="商家電話"/>
					<i class="fas fa-store"></i>
				</div>

				<div class="form-wrapper">
					<form:input type="text" path="shop_hours" class="form-control" placeholder="營業時間"/>
					<i class="fas fa-store"></i>
				</div>

				<div class="form-wrapper">
					<form:select path='shopTypeBean.shop_type_id' class="form-control">
									<form:option value="-1" label="商家類型" />
									<form:options items="${shopTypeBeanList}" itemLabel='shop_type_name' itemValue='shop_type_id' />
								</form:select>
								<form:errors path="shopTypeBean" cssClass="error" />
					<i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
				</div>
				
				<div class="form-wrapper">
					<form:select path='nightMarketBean.market_id' class="form-control">
									<form:option value="-1" label="所在夜市" />
									<form:options items="${nightMarketBeanList}" itemLabel='market_name' itemValue='market_id' />
								</form:select>
								<form:errors path="shopTypeBean" cssClass="error" />
					<i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
				</div>
				
				<button type="button" class="btn btn-outline-primary" id="inputAllBtn">一鍵輸入</button>
<!-- 				<button type="button" class="btn btn-outline-secondary" id="inputAllBtn">一鍵輸入</button> -->
				<input type="submit" value="Register"
									class="button-submit">
									</input>
			</form:form>
		</div>
	</div>
	
	<script>
 $(function () {
	 $('#file').change(function() { 
         // this代表<input id="file">  
         // files.length == 1 是長度為一的陣列
         let file = this.files[0]; 
         let reader = new FileReader();
         
         reader.readAsDataURL(file); 

         reader.onload = function(){     //成功讀取文件
             $('#headImg').attr({
                 
                 // src = this.result 
                 // 或者是 src = e.target () 
                 // 只是function(e) 加上e 事件物件處理函數
                 src:this.result , 
                 width:`200px`,
                 height:`200px`
             });
				
         }
     })
     
     //一鍵輸入功能
		  //存取input標籤的值必須使用.val()方法
		  $('#inputAllBtn').click(function(){
			  $('#shop_name').val("順順十全排骨");
			  $('#shop_owner').val("陳阿順");
			  $('#shop_addr').val("台北市士林區基河路 997號");
			  $('#shop_phone').val("02-0890-7788");
			  $('#shop_hours').val("11:00~20:00");
			  
		  })
     
     
     
 })
         
</script>
	
	
	
</body>
</html>