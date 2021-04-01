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
<title>編輯優惠券</title>
<link rel="stylesheet" href="<c:url value='/_00_util/shopUtil/css/reset.css'/>">
<link rel="stylesheet" href="<c:url value='/_00_util/shopUtil/css/新增優惠券2.css'/>">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

<script>
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

		/* hover事件切換 如果只寫一個方法  
		   那鼠標經過和離開都會觸發這個方法 slideToggle
		 */
		// $('.menu-box').hover(function(){
		//     $(this).children('ul').slideToggle();
		// })
		$('.tab-list a').hover(
				function() {
					/* 為匹配的當前元素切換 class css類別 */
					$(this).toggleClass('liColor');

					/* 拿到當前(this) a 的索引號 */
					index = $(this).index();

					/* 讓上面和下面相應的索引號 eq() 顯示內容 
					    其餘siblings() 隱藏起來 */
					$('.tab-panel').eq(index).stop().fadeIn('slow').show()
							.siblings().hide();

				}, function() {
					/* 第二個方法處理滑鼠移開事件 */
					$(this).removeClass('liColor');
					$('.tab-panel').hide();
				})

		$('.tab-panel').hover(function() {
			index = $(this).index();
			$(this).css('background-color', 'white').show();
			$('.tab-list a').eq(index).addClass('liColor');
		}, function() {
			$(this).hide();
			$('.tab-list a').eq(index).removeClass('liColor');
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
<!-- 				<h3>商家管理頁面</h3> -->
				

<!-- 				<div class="item"> -->
<%-- 					<a href="<c:url value='/_50_shop/_53_shopRegister/modifyShop/${LoginOK.shopBean.shop_id}' />"> --%>
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
			

			<div
				style="display: flex; justify-content: center; border: 2px dashed #333; padding: 10px; margin: 20px;"
				id="insert">


				<div style="width: 35%; text-align: right;">
					<div class="text">優惠券名稱：</div>
					<div class="text" style="margin-top: 30px;">優惠券內容：</div>
					<div class="text" style="margin-top: 70px;">優惠券照片：</div>
					<div class="text" style="margin-top: 150px;">可使用次數：</div>
					<div class="text" style="margin-top: 30px;">使用期限：</div>
					<div class="text" style="margin-top: 30px;">優惠券種類：</div>
				</div>
				<div style="width: 65%; text-align: left;">

					<form:form method="POST" modelAttribute="couponBean"
						enctype='multipart/form-data'>

						<div>

							<form:input type="text" path="coupon_name" class="form" />
						</div>
						<div>

							<form:textarea path="coupon_info" cols="40" rows="5"
								style="margin-top: 25px;" />
						</div>
						<div style="display: flex;">
							<div style="margin-top: 5px;">
								<img src="<c:url value='/_50_shop/_51_coupon/getPicture/${couponBean.coupon_id}'/>" class="coupon-pic" id="headImg" style="width: 250px; height: 150px;">
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
			

		</main>

	</div>
	
<!-- -------------------------------引入共同的頁尾---------------------------------------- -->
<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
<!-- -------------------------------引入共同的頁尾----------------------------------------- -->	


</body>
</html>