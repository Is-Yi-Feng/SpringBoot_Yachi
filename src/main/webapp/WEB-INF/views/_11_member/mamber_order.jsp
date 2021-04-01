<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/normalize.css'/>">
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/background.css'/>">
<link rel="stylesheet"
	href="<c:url value='/_00_util/memberUtil/css/member_order.css'/>">

<title>會員訂單</title>
</head>
<body>

	<!-- 引入共同的頁首 -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	<!-- 引入共同的頁首 結束 -->

	<!-- 跑馬燈 -->
<!-- 	<div id="Marquee"> -->
<!-- 		<h3>最新優惠消息:</h3> -->
<!-- 		<ul id="news"> -->
<!-- 			<li>東西很貴不要買 !</li> -->
<!-- 			<li>還沒做完</li> -->
<!-- 			<li>目前網路商店全館免運</li> -->
<!-- 		</ul> -->
<!-- 	</div> -->
	<!-- 跑馬燈結束 -->


	<div class="main-member">
	<!-- 功能選單開始 -->
	<jsp:include page="/WEB-INF/views/_00_util/memberUtil/jsp/member_aside.jsp" />
	<!-- 功能選單結束 -->
		<!-- 側邊攔開始 -->
<!-- 		<aside> -->
<!--             <div class="function"> -->
<!--                 <h3>會員中心</h3> -->
<!-- 				<div class="item"> -->
				
<%-- 		            <img src='<c:url value='/_00_init/getMemberImage?memberId=${LoginOK.memberId}' /> ' --%>
<!-- 		                  id="headImgg" height='200px' width='200px'> -->
		                  					
<!-- 	            </div> -->
<!--                 <div class="item"> -->
<%--                    	<a href="<c:url value='/member/update/${LoginOK.memberId}'/>"> --%>
<!--                         <button><span>基本資料</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="item"> -->
<%--                     <a href="<c:url value='/_23_orderProcess/orderList'/>"> --%>
<!--                         <button><span>訂單查詢</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="item"> -->
<%--                     <a href="<c:url value='/member/keep/coupons'/>"> --%>
<!--                         <button><span>我的優惠券</span></button> -->
<!--                     </a>                     -->
<!--                 </div> -->
<!--                 <div class="item"> -->
<%--                     <a href="<c:url value="/queryFavoriteShop"/>">  --%>
<!--                         <button><span>喜愛商家</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="item"> -->
<!--                     <a href="#"> -->
<!--                         <button><span>通知</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<%--                  <c:if test="${empty LoginOK.shopBean.shop_id}">	 --%>
<!--                 <div class="item"> -->
<%--                     <a href="<c:url value='/_50_shop/_53_shopRegister/InsertShop' />"> --%>
<!--                         <button><span>申請商家</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<%--                 </c:if> --%>
<!--                 <div class="item"> -->
<!--                     <a href="#"> -->
<!--                         <button><span>新增信用卡</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="item"> -->
<%--                     <a href="<c:url value='/doLogout'/>" onclick="return window.confirm('確定登出嗎?');"> --%>
<!--                         <button><span>登出</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </aside> -->
		<!-- 側邊攔結束 -->



		<main class="shadow p-3 mb-5 bg-white rounded">

			<form action="" method="">

				<div id="hcg_tabs">

					<div id="tabs-nav">
						<a href="#" id="inputOrder" class="change">訂單查詢</a> <a href="#">所有訂單</a> <a
							href="#">待付款</a> <a href="#">待出貨</a> <a href="#">待收貨</a>
						<!-- <a href="#">給予評價</a> -->
					</div>

					<div class="tabs-content">

						<!-- 先讓第一個內容顯示出來 display:block -->

						<!-- --------------------------查詢訂單開始 ---------------------------->
						<div class="tabs-panel" style="display: block">

							<div class="orderTitle">
								<span>親愛的 "${LoginOK.fullname }" 會員您好 ， 您可透過訂單編號快速查詢</span>
							</div>
							<!-- 搜尋框 -->
						  <div class="container container_search">
								<div class="row">
									<div class="col">
										<div style="display: inline-flex;">
											<span id="order_number">查詢訂單：</span>
						
											<form class="d-flex" method="GET">
												<input id="orderNumber" class="form-control me-2 input_area" type="search"
													placeholder="YAxxxxxCHI" aria-label="Search">
												<button id="searchBtn" class="btn btn-outline-success submit_btn" type="button">
													<i class="fas fa-search"></i>
												</button>
											</form>
						
										</div>
									</div>
						
								</div>
						 	</div>
							<!-- 搜尋框 -->
							<!-- 訂單詳情 -->
							<div id="orderDetailArea"> 
						        <!-- <h3>訂單詳情 </h3>  -->
							    <!-- <div class="descArea">		  
									<span class = "descTitle">明細數量: </span><span class="descContent"> 共 ${orderBean.items.size() } 樣商品</span><br>
									<span class = "descTitle">訂單總計: </span><span class="total"> ${orderBean.order_total } 元整</span><br>
									<span class = "descTitle">訂購日期: </span><span class="descContent"> <fmt:formatDate value="${ orderBean.order_datetime}" pattern="yyyy年MM月dd日 HH點mm分ss秒"/></span><br>
									<span class = "descTitle">訂單編號: </span><span class="descContent"> ${orderBean.orderNumber}</span><br>
									<span class = "descTitle">配送地址: </span><span class="descContent"> ${orderBean.order_address}</span><br>
									<span class = "descTitle">付款方式: </span><span class="descContent"> ${orderBean.payTypeBean.pay_type_name }</span><br>
									<c:if test="${!empty orderBean.company_id }">
									<span class = "descTitle">統一編號: </span><span class="descContent"> ${orderBean.company_id}</span><br>
									</c:if>
							    </div>
							
								<table>
								
									<c:forEach var="item" items="${orderBean.items}">
										<thead>
											
											<tr class="img-tr">
												<td colspan="2" rowspan="5" class="img-td">
													<img src="<c:url value='/getPicture/${item.productBean.product_id }'/>">
												</td>
												<td colspan="6"><span class="productName">商品名稱: ${item.c.product_name }</span></td> 
											</tr>
											<tr>
												<td colspan="4" rowspan="4">${item.productBean.product_info}</td>
											</tr>
											<tr>
												<td style="text-align: center;">數量</td>
												<td style="text-align: right;">x ${item.amount}</td>
											</tr>
											<tr>
												<td style="text-align: center;">單價</td>
												<td style="text-align: right;">$ ${item.unitPrice}</td>
											</tr>
											<tr>
					
												<td style="text-align: center;">小計</td>
												<td style="text-align: right;">$ ${item.amount * item.unitPrice }</td>
											</tr> 
										</thead>
									</c:forEach>
								 
								</table>
							
								<div class="btCancel">
								
									<a href="#"><button><i class="fas fa-cart-arrow-down"></i>再買一次</button></a>
									<a href="<c:url value='/cancelOrder/asdf9${orderBean.order_id}8'/>"><button><i class="fas fa-window-close"></i>取消訂單</button></a>
								
								</div> -->
						
						  	</div>
						  	<!-- 訂單詳情 -->



						</div>
						<!-- 查詢訂單結束 -->






						<!-- --------------------------所有訂單開始-------------------------- -->
						<div class="tabs-panel">

							<div class="orderTitle">
								<span>親愛的 ${LoginOK.fullname } ， 您目前有
									${memberOrders.size()} 筆訂單</span>
							</div>
						<!-- 搜尋框 -->
						  <!-- <div class="container container_search">
								<div class="row">
									<div class="col">
										<div style="display: inline-flex;">
											<span id="order_number">查詢訂單：</span>
						
											<form class="d-flex" method="GET">
												<input id="orderNumber" class="form-control me-2 input_area" type="search"
													placeholder="YAxxxxxCHI" aria-label="Search">
												<button id="searchBtn" class="btn btn-outline-success submit_btn" type="submit">
													<i class="fas fa-search"></i>
												</button>
											</form>
						
										</div>
									</div>
						
								</div>
						 </div> -->
						<!-- 搜尋框 -->
							
							

							<table class="order-info">
								<thead>
									<tr class="order-nav">
										<th>序號</th>
										<th>日期</th>
										<th>編號</th>
										<th>付款方式</th>
										<th>訂單狀態</th>
										<th>配送日期</th>
										<th>總額</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="order" items="${memberOrders}" varStatus='i'>
										<tr>
											<td>${i.count}</td>
											<c:if test="${empty memberOrders}">
												<td colspan="10" class="alignC"><span
													style="color: Red; font-weight: bold;">查無紀錄</span></td>
											</c:if>
											<td><fmt:formatDate value="${ order.order_datetime}"
													pattern="yyyy-MM-dd" /><br> <fmt:formatDate
													value="${ order.order_datetime}" pattern="HH:mm" /></td>
											<td class="orderDetail"><a
												href="<c:url value='/_23_orderProcess/orderDetail?orderNo=${order.order_id}'/>">
													${order.orderNumber} </a></td>
											<td><a href="javascript:;">${order.payTypeBean.pay_type_name}</a>
											</td>
											<td><c:choose>
													<c:when test="${order.orderStatusBean.status_id == 1}">
														<span style="color: red; font-weight: 500;";>${order.orderStatusBean.status_name }</span>
													</c:when>
													<c:when
														test="${order.orderStatusBean.status_id == 2 || order.orderStatusBean.status_id == 3}">
														<span style="color: black; font-weight: 500;";>${order.orderStatusBean.status_name }</span>
													</c:when>
													<c:when test="${order.orderStatusBean.status_id == 4 }">
														<span style="color: green; font-weight: 500;";>${order.orderStatusBean.status_name }</span>
													</c:when>
													<c:otherwise>
														<span style="color: gray; font-weight: 500;";>${order.orderStatusBean.status_name }</span>
													</c:otherwise>
												</c:choose></td>
											<td><fmt:formatDate value="${ order.shipping_date}"
													pattern="yyyy-MM-dd" /></td>
											<td>${ order.order_total}</td>
										</tr>
									</c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<th class="alignR" colspan="10">
											<div class="pager">

												<h2>共 ${memberOrders.size()} 筆訂單</h2>
											</div>
										</th>
									</tr>
								</tfoot>

							</table>

						</div>
						<!-- ---------------------------所有訂單結束 --------------------------->







						<!-- ----------------------------未付款訂單開始 ------------------------>
							<div class="tabs-panel">

							<table class="order-info">
								<thead>
									<tr class="order-nav">
										<th>序號</th>
										<th>日期</th>
										<th>編號</th>
										<th>付款方式</th>
										<th>訂單狀態</th>
										<th>配送日期</th>
										<th>總額</th>
									</tr>
								</thead>
								<tbody>
									<!-----------------出現未付款狀態 == 1-------------- -->
									<c:forEach var="order" items="${memberOrders}" varStatus='i'>
										<c:if test="${order.orderStatusBean.status_id == 1}">
										<tr>
											<td>${i.count}</td>
											<c:if test="${empty memberOrders}">
												<td colspan="10" class="alignC"><span
													style="color: Red; font-weight: bold;">查無紀錄</span></td>
											</c:if>
											<td><fmt:formatDate value="${ order.order_datetime}"
													pattern="yyyy-MM-dd" /><br> <fmt:formatDate
													value="${ order.order_datetime}" pattern="HH:mm" /></td>
											<td class="orderDetail"><a
												href="<c:url value='/_23_orderProcess/orderDetail?orderNo=${order.order_id}'/>">
													${order.orderNumber} </a></td>
											<td><a href="javascript:;">${order.payTypeBean.pay_type_name}</a>
											</td>
											<td><c:choose>
													<c:when test="${order.orderStatusBean.status_id == 1}">
														<span style="color: red; font-weight: 500;";>${order.orderStatusBean.status_name }</span>
													</c:when>
													<c:when
														test="${order.orderStatusBean.status_id == 2 || order.orderStatusBean.status_id == 3}">
														<span style="color: black; font-weight: 500;";>${order.orderStatusBean.status_name }</span>
													</c:when>
													<c:when test="${order.orderStatusBean.status_id == 4 }">
														<span style="color: green; font-weight: 500;";>${order.orderStatusBean.status_name }</span>
													</c:when>
													<c:otherwise>
														<span style="color: gray; font-weight: 500;";>${order.orderStatusBean.status_name }</span>
													</c:otherwise>
												</c:choose></td>
											<td><fmt:formatDate value="${ order.shipping_date}"
													pattern="yyyy-MM-dd" /></td>
											<td>${ order.order_total}</td>
										</tr>
										</c:if>
									</c:forEach>
								
								</tbody>

							</table>

						</div>
						<!-- -----------------------------待付款訂單結束-------------------------- -->




						<!--------------------------------- 待出貨訂單開始------------------------- -->
						<div class="tabs-panel">

							<table class="order-info">
								<thead>
									<tr class="order-nav">
										<th>序號</th>
										<th>日期</th>
										<th>編號</th>
										<th>付款方式</th>
										<th>訂單狀態</th>
										<th>配送日期</th>
										<th>總額</th>
									</tr>
								</thead>
								<tbody>
									<!-----------------出現未出貨狀態 == 2-------------- -->
									<c:forEach var="order" items="${memberOrders}" varStatus='i'>
										<c:if test="${order.orderStatusBean.status_id == 2}">
										<tr>
											<td>${i.count}</td>
											<c:if test="${empty memberOrders}">
												<td colspan="10" class="alignC"><span
													style="color: Red; font-weight: bold;">查無紀錄</span></td>
											</c:if>
											<td><fmt:formatDate value="${ order.order_datetime}"
													pattern="yyyy-MM-dd" /><br> <fmt:formatDate
													value="${ order.order_datetime}" pattern="HH:mm" /></td>
											<td class="orderDetail"><a
												href="<c:url value='/_23_orderProcess/orderDetail?orderNo=${order.order_id}'/>">
													${order.orderNumber} </a></td>
											<td><a href="javascript:;">${order.payTypeBean.pay_type_name}</a>
											</td>
											<td><c:choose>
													<c:when test="${order.orderStatusBean.status_id == 1}">
														<span style="color: red; font-weight: 500;";>${order.orderStatusBean.status_name }</span>
													</c:when>
													<c:when
														test="${order.orderStatusBean.status_id == 2 || order.orderStatusBean.status_id == 3}">
														<span style="color: black; font-weight: 500;";>${order.orderStatusBean.status_name }</span>
													</c:when>
													<c:when test="${order.orderStatusBean.status_id == 4 }">
														<span style="color: green; font-weight: 500;";>${order.orderStatusBean.status_name }</span>
													</c:when>
													<c:otherwise>
														<span style="color: gray; font-weight: 500;";>${order.orderStatusBean.status_name }</span>
													</c:otherwise>
												</c:choose></td>
											<td><fmt:formatDate value="${ order.shipping_date}"
													pattern="yyyy-MM-dd" /></td>
											<td>${ order.order_total}</td>
										</tr>
										</c:if>
									</c:forEach>
								
								</tbody>

							</table>

						</div>
						<!---------------------------------- 待出貨訂單開始------------------------ -->			
						



						<!---------------------------------- 待收貨(已送達)訂單開始------------------------- -->
						<div class="tabs-panel">

							<table class="order-info">
								<thead>
									<tr class="order-nav">
										<th>序號</th>
										<th>日期</th>
										<th>編號</th>
										<th>付款方式</th>
										<th>訂單狀態</th>
										<th>配送日期</th>
										<th>總額</th>
									</tr>
								</thead>
								<tbody>
									<!-----------------出現未出貨狀態 == 2-------------- -->
									<c:forEach var="order" items="${memberOrders}" varStatus='i'>
										<c:if test="${order.orderStatusBean.status_id == 4}">
										<tr>
											<td>${i.count}</td>
											<c:if test="${empty memberOrders}">
												<td colspan="10" class="alignC"><span
													style="color: Red; font-weight: bold;">查無紀錄</span></td>
											</c:if>
											<td><fmt:formatDate value="${ order.order_datetime}"
													pattern="yyyy-MM-dd" /><br> <fmt:formatDate
													value="${ order.order_datetime}" pattern="HH:mm" /></td>
											<td class="orderDetail"><a
												href="<c:url value='/_23_orderProcess/orderDetail?orderNo=${order.order_id}'/>">
													${order.orderNumber} </a></td>
											<td><a href="javascript:;">${order.payTypeBean.pay_type_name}</a>
											</td>
											<td><c:choose>
													<c:when test="${order.orderStatusBean.status_id == 1}">
														<span style="color: red; font-weight: 500;";>${order.orderStatusBean.status_name }</span>
													</c:when>
													<c:when
														test="${order.orderStatusBean.status_id == 2 || order.orderStatusBean.status_id == 3}">
														<span style="color: black; font-weight: 500;";>${order.orderStatusBean.status_name }</span>
													</c:when>
													<c:when test="${order.orderStatusBean.status_id == 4 }">
														<span style="color: green; font-weight: 500;";>${order.orderStatusBean.status_name }</span>
													</c:when>
													<c:otherwise>
														<span style="color: gray; font-weight: 500;";>${order.orderStatusBean.status_name }</span>
													</c:otherwise>
												</c:choose></td>
											<td><fmt:formatDate value="${ order.shipping_date}"
													pattern="yyyy-MM-dd" /></td>
											<td>${ order.order_total}</td>
										</tr>
										</c:if>
									</c:forEach>
								
								</tbody>

							</table>

						</div>
						<!-- ---------------------------------待收貨(已送達)訂單開始------------------------- -->


					</div>

				</div>
			</form>

		</main>

	</div>
	
	<!-- -------------------------------引入共同的頁尾---------------------------------------- -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	<!-- -------------------------------引入共同的頁尾----------------------------------------- -->
	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
		integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
		crossorigin="anonymous"></script>
	<script
		src="<c:url value='/_00_util/allUtil/javascript/jquery-3.5.1.js'/>"></script>
	<script
		src="<c:url value='/_00_util/allUtil/javascript/jquery-ui.js'/>"></script>
	<script>
		$(function() {

			$('#tabs-nav a').click(
					function() {
						// 當點擊tabs-nav的元素a時  替當前(this)的a超連結增加.change類  
						// 其餘兄弟類 siblings() remove .change類
						$(this).addClass('change').siblings().removeClass(
								'change');

						// 點擊的同時 拿到當前 a 超連結的索引號
						let index = $(this).index(); //  index有6個

						// 讓下面對應的索引號  .tabs-content 的子元素.tabs-panel[index] 渲染出來  
						// 其他 子元素 兄弟類 siblings() 隱藏起來   
						// 用addClass 增加動畫
						$('.tabs-content .tabs-panel').eq(index).addClass(
								'fadeIn animated-tabs').show().siblings()
								.hide();

					});

			// 每三秒執行一次
			setInterval(function() {
				$('#news li:first-child').slideUp(function() {

					$(this).appendTo($('#news')).slideDown();
				});

			}, 3000);

			// 點擊移除商品
			$('.remove-product').click(function() {
				$(this).closest('.product-item').remove();

			});

			
		});



		//快搜訂單功能
		let searchBtn = document.getElementById('searchBtn');
		searchBtn.addEventListener('click',function(){
			let orderNumber = document.getElementById('orderNumber').value.trim();
			if(orderNumber == null || orderNumber == ""){
				alert("請填入訂單編號");	
			}
			// STEP1: 建立 AJAX 物件
			let url = "<c:url value='/_23_orderProcess/queryOrder/" + orderNumber + "'/>";
			// alert(url)
			$.getJSON(url).then(res => {
				// alert(res.orderNumber);
				
				if(res.orderNumber != orderNumber){
					alert("訂單號不正確喔!!!")
// 					return;
				}else{
					
				// 資訊區域
				h3Title = `<h3>${'${res.orderNumber}'} 的訂單詳情</h3>`; 
				h3Title +=`<h4>訂單狀態: ${'${res.orderStatusBean.status_name}'} </h4>`
				divDesc = `<div class = "descArea">`;
				spanDesc = `<span class = "descTitle">明細數量: </span><span class="descContent"> 共 ${'${res.items.length}'} 樣商品</span><br>`;
				spanDesc += `<span class = "descTitle">訂單總計: </span><span class="total"> ${'${res.order_total}'} 元整</span><br>`
				spanDesc += `<span class = "descTitle">訂購日期: </span><span class="descContent"> ${'${ new Date (res.order_datetime).toLocaleString()}'}</span><br>`;
				spanDesc += `<span class = "descTitle">訂單編號: </span><span class="descContent"> ${'${res.orderNumber}'}</span><br>`;
				spanDesc += `<span class = "descTitle">配送地址: </span><span class="descContent"> ${'${res.order_address}'}</span><br>`;
				spanDesc += `<span class = "descTitle">付款方式: </span><span class="descContent"> ${'${res.payTypeBean.pay_type_name}'}</span><br>`;
				if(res.company_id != ""){
					spanDesc += `<span class = "descTitle">統一編號: </span><span class="descContent"> ${'${res.company_id}'}</span><br>`;
				}
				
				divDesc += spanDesc;
				divDesc += `</div>`;
				h3Title += divDesc;
			
				//訂單明細區域
				let segment = `<div class = "tableArea"><table>
									<tr>
										<th>商品圖片</th>
										<th>商品名稱</th>
										<th>數量</th>
										<th>單價</th>
										<th>小計</th>
									</tr>`;
				for(let i = 0; i < res.items.length; i++){
					//照片出不來(待補)
					let image = '<img class="product_images" src="' + 
		          				'<c:url value="/getProductPictureA/' + 
		        	 			res.items[i].productBean.product_id + '" />">';
					// <td style="white-space:pre-line;">${'${res.items[i].productBean.product_info}'} => <th>商品描述</th> 
					segment += `<tr>
									<td>${'${image}'}</td>
									<td>${'${res.items[i].productBean.product_name}'}
									<td>${'${res.items[i].amount}'}	
									<td>NT$ ${'${res.items[i].unitPrice}'}	
									<td>NT$ ${'${res.items[i].amount * res.items[i].unitPrice}'}	
								</tr>`; 	
				}
				segment += `</table></div>`;	
				h3Title += segment;
				}
				

				//判斷如果此區域有元素就清空(解決累加問題)
				if($('#orderDetailArea:has(h3)').length != 0)	{
					$('#orderDetailArea').empty();
				}
				$('#orderDetailArea').append(h3Title);
			})
		})
		


	</script>
</body>
</html>