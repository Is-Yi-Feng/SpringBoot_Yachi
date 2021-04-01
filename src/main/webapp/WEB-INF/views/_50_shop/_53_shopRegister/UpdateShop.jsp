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
<title>Shopping</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<link rel="stylesheet"
	href="<c:url value='/_00_util/shopUtil/css/normalize.css'/>">
<link rel="stylesheet"
	href="<c:url value='/_00_util/shopUtil/css/shop_register1.css'/>">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/javascript/header.js"></script>
<!-- MATERIAL DESIGN ICONIC FONT
<link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css"> -->
<script>
 $(function () {
             // change這個event只有代表改變，並不代表有檔案
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
     });


            // 跑馬燈每三秒執行一次
            setInterval(function(){
            $('#news li:first-child').slideUp(function(){

                $(this).appendTo($('#news')).slideDown();
            });

            },3000);

        });    
</script>
</head>
<body>

	<!-- 引入共同的頁首 -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	
	<div class="main-member">
	<!-- 功能選單開始 -->
	<jsp:include page="/WEB-INF/views/_00_util/shopUtil/jsp/shop_aside.jsp" />
	<!-- 功能選單結束 -->
<!-- 		<aside> -->
<!-- 			<div class="function"> -->
<!-- 				<h3>商家管理頁面</h3> -->
				

<!-- 				<div class="item"> -->
<%-- 				<a href="<c:url value='/_50_shop/_53_shopRegister/modifyShop/${LoginOK.shopBean.shop_id}' />"> --%>
<!-- 						<button> -->
<!-- 							<span>商家資料</span> -->
<!-- 						</button> -->
<!-- 					</a> -->
<!-- 				</div> -->
<!-- 				<div class="item"> -->
<!-- 					<a href="#"> -->
<!-- 						<button> -->
<!-- 							<span>商家商品</span> -->
<!-- 						</button> -->
<!-- 					</a> -->
<!-- 				</div> -->
<!-- 				<div class="item"> -->
<%-- 					<a href="<c:url value='/_50_shop/_51_coupon/InsertCoupon/${LoginOK.shopBean.shop_id}' />"> --%>
<!-- 						<button> -->
<!-- 							<span>優惠券管理</span> -->
<!-- 						</button> -->
<!-- 					</a> -->
<!-- 				</div> -->
<!-- 				<div class="item"> -->
<!-- 					<a href="#"> -->
<!-- 						<button> -->
<!-- 							<span>報表</span> -->
<!-- 						</button> -->
<!-- 					</a> -->
<!-- 				</div> -->
<!-- 				<div class="item"> -->
<%-- 					<a href="<c:url value='/_50_shop/_54_showShops/ShowShops/${LoginOK.shopBean.shop_id}' />"> --%>
<!-- 						<button> -->
<!-- 							<span>商家頁面</span> -->
<!-- 						</button> -->
<!-- 					</a> -->
<!-- 				</div> -->
				
<!-- 				<div class="item"> -->
<%-- 					<a href="<c:url value='/doLogout'/>" onclick="return window.confirm('確定登出嗎?');"> --%>
<!-- 						<button> -->
<!-- 							<span>登出</span> -->
<!-- 						</button> -->
<!-- 					</a> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</aside> -->



		<main>


	<!-- 商家註冊頁面開始 -->
	<div class="wrapper" >
		<div class="inner">

			<form:form method="POST" modelAttribute="shopBean"
						enctype='multipart/form-data'>
				<h3>商家資料</h3>

				<div class="image-holder">
					<img src="<c:url value='/_50_shop/_53_shopRegister/getPicture/${LoginOK.shopBean.shop_id}'/>" class="coupon-pic" id="headImg">
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
					<form:input type="text" path="shop_hyperlink" class="form-control" placeholder="商家網頁"/>
					<i class="fas fa-store"></i>
				</div>
				
				<div class="form-wrapper">
					<form:input type="textarea" path="shop_info" class="form-control" placeholder="商家簡介"/>
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
				<input type="submit" value="更改資料"
									class="button-submit" />
									
			</form:form>
		</div>
	</div>
	</main>
	</div>

	
	
</body>
</html>