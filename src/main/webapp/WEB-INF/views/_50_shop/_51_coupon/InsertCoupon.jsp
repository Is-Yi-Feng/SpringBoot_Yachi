<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>新增優惠券</title>
<link rel="stylesheet" href="<c:url value='/_00_util/shopUtil/css/reset.css'/>">
<link rel="stylesheet" href="<c:url value='/_00_util/shopUtil/css/新增優惠券2.css'/>">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>




<script>
	var token = true;
	$(function() {
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
	                 width:`250px`,
	                 height:`150px`
	             });
					
	         }
	     });

		

		$('#insertbtn').click(function() {
			if (token == true) {
				$('#insert').css("display", "flex");
				$('#insertbtn').text("取消");
				token = false;
			} else {
				$('#insert').css("display", "none");
				$('#insertbtn').text("＋ 新增優惠券");
				token = true;
			}
			
		})
		
		$('#deletecoupon').click(function() {
	    	alert(123);
    			Swal.fire({
  	    		  title: '確定要刪除此筆優惠卷?',
  	    		  text: "",
  	    		  icon: 'warning',
  	    		  showCancelButton: true,
  	    		  confirmButtonColor: '#3085d6',
  	    		  cancelButtonColor: '#d33',
  	    		  confirmButtonText: '確認'
  	    		}).then((result) => {
  	    		  if (result.isConfirmed) {
  	    			let href = $(this).attr('href');
              	   	$('form').attr('action', href).submit();
  	    		  }
  	    		})
        	return false;
        });
		
		//一鍵輸入功能
		  //存取input標籤的值必須使用.val()方法
		  $('#inputAllBtn').click(function(){
			  $('#coupon_name').val("順順十全排骨");
			  $('#coupon_info').val("排骨飯優惠5元")
			  $('#coupon_amount').val("10")
			  $('#product_spec').val("聯名款")
		  })
		
		
		
		
		
		
		

	});
</script>

</head>
<body>
	
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	
	<div class="main-member">
	<!-- 功能選單開始 -->
	<jsp:include page="/WEB-INF/views/_00_util/shopUtil/jsp/shop_aside.jsp" />
	<!-- 功能選單結束 -->
<!-- 		<aside> -->
<!-- 			<div class="function"> -->
<!-- 				<h3 >商家管理頁面</h3> -->
				

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
			<div class="column">
				<div class="column-pic">
					<p class="column-picname">優惠券照片</p>
				</div>
				<div class="column-name">優惠券名稱</div>
				<div class="column-content">優惠券內容</div>
				<div class="column-amount">次數</div>
				<div class="column-exp">使用期限</div>
				<div class="column-edit">
					<p class="column-editname">編輯</p>
				</div>

			</div>


			<c:forEach var="coupon" varStatus="stat" items="${coupons}">
				<div class="column">
					<div class="column-pic">
						<img src="<c:url value='/_50_shop/_51_coupon/getPicture/${coupon.coupon_id}'/>" class="coupon-pic" style="width:100px;height:60px;">
					</div>
					<div class="column-name">${coupon.coupon_name}</div>
					<div class="column-content">${coupon.coupon_info}</div>
					<div class="column-amount">${coupon.coupon_amount}</div>
					<div class="column-exp">
						${coupon.coupon_begin}~${coupon.coupon_end}</div>
					<div class="coupon-edit">
						<input type="button" value="編輯" onclick="location.href='${pageContext.request.contextPath}/_50_shop/_51_coupon/modifyCoupon/${coupon.coupon_id}'">
						/
						<input type="button" value="刪除" onclick="location.href='${pageContext.request.contextPath}/_50_shop/_51_coupon/deleteCoupon/${coupon.coupon_id}'">
						
					</div>
				</div>


			</c:forEach>





			<div
				style="display: none; justify-content: center; border: 2px dashed #333; padding: 10px; margin: 20px;"
				id="insert">


				<div style="width: 35%; text-align: right;">
					<div class="text">優惠券名稱：</div>
					<div class="text" style="margin-top: 28px;">優惠券內容：</div>
					<div class="text" style="margin-top: 86px;">優惠券照片：</div>
					<div class="text" style="margin-top: 154px;">可使用次數：</div>
					<div class="text" style="margin-top: 33px;">使用期限：</div>
					<div class="text" style="margin-top: 32px;">優惠券種類：</div>
				</div>
				<div style="width: 65%; text-align: left;">

					<form:form method="POST" modelAttribute="couponBean"
						enctype='multipart/form-data'>

						<div>

							<form:input type="text" path="coupon_name" class="form" />
						</div>
						<div>

							<form:textarea path="coupon_info" cols="40" rows="5"
								style="margin-top: 15px;" />
						</div>
						<div style="display: flex;">
							<div>
								<img src="${pageContext.request.contextPath}/data/images/smallPic/yachiLogo50.png" alt="" id="headImg" style="width: 250px; height: 150px;margin-top: 10px">		
							</div>
								
							<div>
								<form:input type="file" path="coupon_image" style="margin-left: 5px; margin-top: 130px;" id="file"  accept="image/gif, image/jpeg, image/png"/>
							</div>
						</div>
						<div style="display: flex;">
							<div>

								<form:input type="number" path="coupon_amount"
									style="margin-top: 13px;" />
							</div>

						</div>
						<div>
							<div>
								<form:input type="date" path="coupon_begin"
									style="margin-top: 22px;" />
								至
								<form:input type="date" path="coupon_end" />
							</div>
							<div style="margin-top: 24px;">
								<form:select path='shopTypeBean.shop_type_id'>
									<form:option value="-1" label="請挑選" />
									<form:options items="${shopTypeBeanList}" itemLabel='shop_type_name' itemValue='shop_type_id' />
								</form:select>
								<form:errors path="shopTypeBean" cssClass="error" />
							</div>
							<div style="width: 100%; text-align: right; height: 60px;">

								<input type="submit" value="儲存"
									style="margin-top: 28px; width: 120px; height: 30px;"></input>
							</div>
						</div>
					</form:form>
				</div>
			</div>
			<div class="middle-bottom"
				style="width: 95%; height: 40px; margin: 20px; border: 2px dashed #333; display: flex;">
				<button style="margin: 3px;" id="insertbtn">＋ 新增優惠券</button>
				<button type="button" id="inputAllBtn">一鍵輸入</button>
			</div>

		</main>

	</div>
	
<!-- -------------------------------引入共同的頁尾---------------------------------------- -->
<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
<!-- -------------------------------引入共同的頁尾----------------------------------------- -->
</body>
</html>