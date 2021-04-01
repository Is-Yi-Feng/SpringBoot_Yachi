<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shopping</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
  
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/normalize.css'/>">
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/background.css'/>">
<link rel="stylesheet"
	href="<c:url value='/_00_util/shoppingMallUtil/css/4_shopping_cart.css'/>">
<link rel="stylesheet"
	href="<c:url value='/_00_util/shoppingMallUtil/css/2_mix.css'/>">
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
<script src="<c:url value='/_00_util/allUtil/javascript/jquery-3.5.1.js'/>"></script>
<script src="<c:url value='/_00_util/allUtil/javascript/jquery-ui.js'/>"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css" />
<script src="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js"></script>


</head>
<body>
	<!-- -----------------------------------------引入共同的頁首--------------------------------------------- -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	<!-- -----------------------------------------引入共同的頁首--------------------------------------------- -->
	
	<!-- ps: 需要優化的地方： 2/10 
        1. 會用bootstrap 優化商品排列(已完成)
        2. 點選商品分類 上方中括號的字會變成點選的商品分類名稱
        3. 點擊加入購物車，購物車界面會彈跳出來(數量與金額會跟著增加)
        4. 購物車選單出現時，會回到最上方，需改善此問題(未解決) 
    -->

	<!-- ---------------------------------------Start：購物車介面-------------------------------------------- -->
	<div class="cart_container">
		<input type="checkbox" name="" id="side_menu_switch">
		<div class="side_cart">
			<div class="carCancelBtn">
				<i class="fa fa-arrow-left"></i>
			</div>
			<label for="side_menu_switch"><i class="fas fa-cart-plus"></i>
			</label>
			
			
			<c:if test="${empty LoginOK}">
				<div class="title">
					<c:if test='${empty sessionCartVoList}'>  <!-- 訪客專用的 --> 
						購物清單 <span class="shopNum">0</span>
					</c:if>
					<c:set value='0' var='sum'/>
					<c:if test='${!empty sessionCartVoList}'>
	            		購物清單 <span class="shopNum">${sessionCartVoList.size()}</span>
	            	</c:if>
					<!-- 存放購物數量-->
				</div>
				<c:if test='${empty sessionCartVoList}'>
	           		<div class="emptyCart">
	           			<a href="<c:url value='/DisplayPageProducts' />" 
	           			style="display: block;color: #444;font-size: 1.1rem; height: 100px;line-height: 100px;margin-left: 50px;">
	           				購物車空空如也! 趕快去選購吧
	           			</a>
	       			</div>
	           	</c:if>
			</c:if>
			<c:if test="${!empty LoginOK}">
				<div class="title">
					<c:if test='${empty memberCartVoList || memberCartVoList.size() == 0}'>
						購物清單 <span class="shopNum">0</span>
					</c:if>
					<c:set value='0' var='sum'/>
					<c:if test='${!empty memberCartVoList}'>
	            		購物清單 <span class="shopNum">${memberCartVoList.size()}</span>
	            	</c:if>
					<!-- 存放購物數量-->
				</div>
				<c:if test='${empty memberCartVoList}'>
	           		<div class="emptyCart">
	           			<a href="<c:url value='/DisplayPageProducts' />" 
	           			style="display: block;color: #444;font-size: 1.1rem; height: 100px;line-height: 100px;margin-left: 50px;">
	           				購物車空空如也! 趕快去選購吧
	           			</a>
	       			</div>
	           	</c:if>
			</c:if>
			
			
			
			<ul id="item_box">
				<!-- id 可以存放產品編號-->
				
				<c:choose>
					<c:when test="${empty LoginOK}">
						
						<c:forEach var='cartVo' items='${sessionCartVoList }'>
		                <li id="car_productId" class="carItem">      
		                    <div class="pic">
		                        <a href="javascript:;">
		                            <img src="<c:url value='/getProductPictureA/${cartVo.product_id }'/>">
		                        </a>
		                    </div>
		                    <div class="text_box">
		                        <div class="name">
		                            <a href="javascript:;">${cartVo.product_name }</a>
		                        </div>
		                        <div class="size">規格：${cartVo.product_spec }</div>
		                        <div class="count">
		                        	<span>數量：</span><span class="showCount">${cartVo.scQty}</span>
	<!-- 	                            <select name="" id="car_productId"> -->
	<%-- 	                            	<c:forEach var="num" begin="1" end="10" > --%>
	<%--                                 		<option value="${num}" <c:if test="${cartVo.scQty == num}">selected</c:if>>${num}</option>  --%>
	<%--                                 	</c:forEach> --%>
	<!-- 	                                <option value="1" selected>1</option> -->
	<!-- 	                                <option value="2">2</option> -->
	<!-- 	                                <option value="3">3</option> -->
	<!-- 	                                <option value="4">4</option> -->
	<!-- 	                                <option value="5">5</option> -->
	<!-- 	                                <option value="6">6</option> -->
	<!-- 	                                <option value="7">7</option> -->
	<!-- 	                                <option value="8">8</option> -->
	<!-- 	                                <option value="9">9</option> -->
	<!-- 	                                <option value="10">10</option> -->
	<!-- 	                            </select> -->
		                        </div>
		                        <div class="unit_price">單價：${cartVo.product_price }</div>
		                        <div class="price">NT$ ${cartVo.product_price * cartVo.scQty}</div>
		                    </div>
		                    <div class="cancelBtn">
		                        <a class="deleteLink" href="<c:url value='/visitorSideCartDel/${cartVo.product_id}/'/>"><i class="fa fa-trash"></i></a>
		                    </div>
		                </li> 
		                <c:set var='sum' value='${sum + cartVo.product_price * cartVo.scQty}'/>
					</c:forEach>
					</c:when>
					<c:otherwise>
						
						<c:forEach var='memberCartVo' items='${memberCartVoList}'>
		                <li id="car_productId" class="carItem">      
		                    <div class="pic">
		                        <a href="#">
		                            <img src="<c:url value='/getProductPictureA/${memberCartVo.product_id}'/>">
		                        </a>
		                    </div>
		                    <div class="text_box">
		                        <div class="name">
		                            <a href="javascript:;">${memberCartVo.product_name }</a>
		                        </div>
		                        <div class="size">規格：${memberCartVo.product_spec }</div>
		                        <div class="count">
		                        	<span>數量：</span><span class="showCount">${memberCartVo.scQty}</span>
	<!-- 	                            <select name="" id="car_productId"> -->
	<%-- 	                            	<c:forEach var="num" begin="1" end="10" > --%>
	<%--                                 		<option value="${num}" <c:if test="${cartVo.scQty == num}">selected</c:if>>${num}</option>  --%>
	<%--                                 	</c:forEach> --%>
	<!-- 	                                <option value="1" selected>1</option> -->
	<!-- 	                                <option value="2">2</option> -->
	<!-- 	                                <option value="3">3</option> -->
	<!-- 	                                <option value="4">4</option> -->
	<!-- 	                                <option value="5">5</option> -->
	<!-- 	                                <option value="6">6</option> -->
	<!-- 	                                <option value="7">7</option> -->
	<!-- 	                                <option value="8">8</option> -->
	<!-- 	                                <option value="9">9</option> -->
	<!-- 	                                <option value="10">10</option> -->
	<!-- 	                            </select> -->
		                        </div>
		                        <div class="unit_price">單價：${memberCartVo.product_price }</div>
		                        <div class="price">NT$ ${memberCartVo.product_price * memberCartVo.scQty}</div>
		                    </div>
		                    <div class="cancelBtn">
		                        <a class="deleteLink" href="<c:url value='/sideCartDel/${memberCartVo.cart_id}/${LoginOK.memberId }'/>"><i class="fa fa-trash"></i></a>
		                    </div>
		                </li> 
		                <c:set var='sum' value='${sum + memberCartVo.product_price * memberCartVo.scQty}'/>
					</c:forEach>
					</c:otherwise>
				</c:choose>
				
			</ul>
			<!-- 卷軸部分 -->
			<div class="scrollArea">
				<div class="enscroll-track track3">
					<a href class="controller handle3">
						<div class="top"></div>
						<div class="bottom"></div>
					</a>
				</div>
			</div>
			<!-- 卷軸部分結束 -->
			<div class="buyBtn">
				<a href="<c:url value='/goCheckout'/>">前往結帳 NT$ ${sum}</a>
			</div>

			
			<c:choose>
				<c:when test="${empty LoginOK}">
					<c:if test="${empty sessionCartVoList}">
						<div id="count_circle">0</div>
					</c:if>
					<div id="count_circle">${sessionCartVoList.size() }</div>
				</c:when>
				<c:otherwise>
<%-- 					<c:if test="${empty memberCartVoList}"> --%>
<!-- 						<div id="count_circle">0</div> -->
<%-- 					</c:if> --%>
					<div id="count_circle">${memberCartVoList.size() }</div>
				</c:otherwise>
			</c:choose>
			
		</div>
	</div>
	<!-- ---------------------------------------End：購物車介面-------------------------------------------- -->
	
	
	<div id="main">
		<!--         <div class="header_image"> -->
		<!--             <img src="images_2/封面圖.jpg"> -->
		<!--         </div> -->


		<div class="new_container">
			<div class="new_product">
				<c:if test="${empty sort.product_type_name}">
					<h1 class="animate__flipInX h1Title">最新商品</h1>
				</c:if>
				<c:if test="${!empty sort.product_type_name}">
					<h1 class="animate__bounceIn h1Title">${sort.product_type_name}</h1>
				</c:if>
				

			</div>
		</div>

		<!-- 商品部分 -->
		<div class="shoppingArea">

			<!-- ------------------------------leftSide start  引入共同商品種類功能列----------------------------- -->
			<jsp:include
				page="/WEB-INF/views/_00_util/shoppingMallUtil/jsp/shop_sort.jsp" />
			<!-- ------------------------------leftSide start  引入共同商品種類功能列----------------------------- -->

			<!-- Start:rightSide -->
			<main>-
				<div class="right_container container">
				
			<!-----------------------------------------商品排列區域------------------------------------------------>
						<div class="row">
							<c:forEach var='entry' items='${products_DPP}'>
							<!-- 判斷商品是否示刪除狀態 -->
								<c:if test="${entry.product_status == 0 }">
									<div class="product_contianer col col-md-6 col-lg-3 ">
										<div class="product_items">
					<div data-aos="flip-down">
											<div class="product_image image2">
		
												<img src="<c:url value='/getProductPictureB/${entry.product_id}'/>">

												
											</div>
											<div class="product_image image1">
		
<%-- 												<a href="<spring:url value='singleProduct?id=${entry.product_id}'/>"><img src="<c:url value='/getProductPictureA/${entry.product_id}'/>"></a> --%>
													
													<a data-fancybox="gallery" href="<c:url value='/getProductPictureA/${entry.product_id}'/>"><img src="<c:url value='/getProductPictureA/${entry.product_id}'/>"></a>
													
											</div>
											<div class="itemBody">
												<div class="product_name">
												
													<a href="<spring:url value='singleProduct?id=${entry.product_id}'/>">${entry.product_name }</a>
													
												</div>
												<div class="product_price">
													<span>售價NT${entry.product_price }</span>
												</div>
												<c:if test="${!empty LoginOK}">
													<form action="<c:url value='/BuyProduct.do?cmd=add&sortId=${entry.productTypeBean.product_type_id }' />" method="POST">
														<div class="product_count">
															<span>數量</span> 
															<select name='qty'>
																<option value="1">1</option>
																<option value="2">2</option>
																<option value="3">3</option>
																<option value="4">4</option>
																<option value="5">5</option>
																<option value="6">6</option>
																<option value="7">7</option>
																<option value="8">8</option>
																<option value="9">9</option>
																<option value="10">10</option>
															</select>
														</div>
														<input type='hidden' name='product_id' value='${entry.product_id}'>
														<input type='hidden' name='pageNo' value='${param.pageNo}'>
														<c:choose>
															<c:when test="${entry.product_stock == 0}">
																<button disabled class="cartBtn" style="cursor: no-drop; color:#444;">缺貨中</button>
															</c:when>
															<c:otherwise>
																<button type='submit' class="cartBtn">加入購物車</button>
															</c:otherwise>
														</c:choose>
													</form>
												</c:if>
												<c:if test="${empty LoginOK}">
													<form action="<c:url value='/visitorBuyProduct.do?cmd=add&sortId=${entry.productTypeBean.product_type_id }' />" method="POST">
														<div class="product_count">
															<span>數量</span> 
															<select name='qty'>
																<option value="1">1</option>
																<option value="2">2</option>
																<option value="3">3</option>
																<option value="4">4</option>
																<option value="5">5</option>
																<option value="6">6</option>
																<option value="7">7</option>
																<option value="8">8</option>
																<option value="9">9</option>
																<option value="10">10</option>
															</select>
														</div>
														<input type='hidden' name='product_id' value='${entry.product_id}'>
														<Input type='hidden' name='pageNo' value='${param.pageNo}'>
														<c:choose>
															<c:when test="${entry.product_stock == 0}">
																<button disabled class="cartBtn" style="cursor: no-drop; color:#444;">缺貨中</button>
															</c:when>
															<c:otherwise>
																<button type='submit' class="cartBtn">加入購物車</button>
															</c:otherwise>
														</c:choose>
	<!-- 													<button type='submit' class="cartBtn" onclick="alert('加入購物車成功')">加入購物車</button> -->
													</form>
												</c:if>
											
											
											
											
											
											
											
											</div>
											<!-- <div class="clearfix"></div> -->
										</div>
					</div>
									</div>
							 	</c:if>
							</c:forEach>
						</div>
			<!-----------------------------------------商品排列區域------------------------------------------------>	
					
					
			<!-----------------------------------------控制頁數區域------------------------------------------------>
					
					<c:if test="${empty sort.product_type_name}">
						<nav aria-label="Page navigation example" class="navConfig">
							<ul class="pagination">
								<c:if test="${pageNo > 1 }">
									<li class="page-item">
										<a class="page-link" href="<c:url value='DisplayPageProducts?pageNo=${pageNo-1}' />" aria-label="Previous"> 
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
								</c:if>
								<!-- 利用總頁數跑迴圈，得出自動新增分頁的按鈕 -->
								<c:forEach var='page' begin='1' end='${totalPages}'>
									<li class="page-item"><a class="page-link" href="<c:url value='DisplayPageProducts?pageNo=${page}' />">${page}</a></li>
								</c:forEach>
								
	            				<c:if test="${pageNo != totalPages}">
									<li class="page-item">
										<a class="page-link" href="<c:url value='DisplayPageProducts?pageNo=${pageNo+1}' />" aria-label="Next">
										 	<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</c:if>
							</ul>
	
						</nav>
					</c:if>
			<!-----------------------------------------控制頁數區域------------------------------------------------>

				</div>


			</main>
			<!-- End:rightSide -->


		</div>

	</div>


<!-- 	<script src="sweetalert2.all.min.js"></script> -->
	<script src="//cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js"></script>
	<script src="<c:url value='/_00_util/allUtil/javascript/enscroll-0.6.2.min.js'/>"></script>
	<script>
		$(document).ready(function() {
			//把點到的商品名稱放到標題上
			// displaySortName();

			//側邊購物車
			cartListHeight();
			//resize之後會重新計算ul高度，能使卷軸滾動
			$(window).resize(function() {
				cartListHeight();
			})
				
// 			$("#side_menu_switch2").click(function(){
// 				alert("123");
// 			});
			
// 		$("#side_menu_switch").toggle(function(){
			
// 			alert("123");
			
// 			$(".side_cart").css('transform','translateX(0px)');
		    
			
// 			},	    
// 		    function(){
			
// 			alert("456");
				
// 			$(".side_cart").css('transform','translateX(-500px)');
		    
// 			});
			
		})

		function cartListHeight() {
			let box_height = $(window).height();
			let buyBtn_height = $('.buyBtn a').outerHeight(true);
			let title_height = $('.title').outerHeight(true);
			//計算ul的高度(扣掉標頭以及底下按鈕)
			box_height -= buyBtn_height;
			box_height -= title_height
			console.log(box_height);

			//enscroll.js 套件使用方法(別問我我也不懂)
			$('#item_box').enscroll('destroy');
			$('#item_box').css({
				height : box_height
			})
			$('#item_box').enscroll({
				showOnHover : true,
				addPaddingToPane : false,
				verticalTrackClass : 'track3',
				verticalHandleClass : 'handle3',
			});

		}
		// function displaySortName() {
		// 	$('.items span').click(function() {
		// 		let sort = $(this).text(); //抓取點到的文字
		// 		//  console.log(sort);
		// 		$('.new_product h1').text(sort); //把抓到的文字放進標題內
		// 	})
		// }
		
		$('.deleteLink').click(function() {
			Swal.fire({
	    		  title: '什麼!不要這個商品了!?',
	    		  icon: 'warning',
	    		  showCancelButton: true,
	    		  confirmButtonColor: '#3085d6',
	    		  cancelButtonColor: '#d33',
	    		  confirmButtonText: '不想要了!'
	    		}).then((result) => {
	    		  if (result.isConfirmed) {
	    			let href = $(this).attr('href');
	    			$(this).attr('href', href).submit();
	    		  }
	    		})
    		return false;
   		});
		
		
// 		if($('#count_circle').change(){
			$('#count_circle').css({
				"display":"inline-block",
				"width":"25px",
				"height":"25px",
			
			});
// 		}
		
		
		
			
	
		
	</script>
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<script>
  		AOS.init();
	</script>



</body>
</html>