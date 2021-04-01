<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shopping</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

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
<script
	src="<c:url value='/_00_util/allUtil/javascript/jquery-3.5.1.js'/>"></script>
<script src="<c:url value='/_00_util/allUtil/javascript/jquery-ui.js'/>"></script>
<script
	src="<c:url value='/_00_util/allUtil/javascript/enscroll-0.6.2.min.js'/>"></script>
</head>
<body>
	<!-- 引入共同的頁首 -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	<!-- ps: 需要優化的地方： 2/10 
        1. 會用bootstrap 優化商品排列(已完成)
        2. 點選商品分類 上方中括號的字會變成點選的商品分類名稱
        3. 點擊加入購物車，購物車界面會彈跳出來(數量與金額會跟著增加)
        4. 購物車選單出現時，會回到最上方，需改善此問題(未解決) 
    -->

	<!-- Start：購物車介面 -->
	<div class="cart_container">
		<input type="checkbox" name="" id="side_menu_switch">
		<div class="side_cart">
			<div class="carCancelBtn">
				<i class="fa fa-arrow-left"></i>
			</div>
			<div class="title">
				購物清單 <span class="shopNum">4</span>
				<!-- 存放購物數量-->
			</div>
			<ul id="item_box">
				<!-- id 可以存放產品編號-->
				<!-- <li id="car_productId" class="carItem">      
                    <div class="pic">
                        <a href="javascript:;">
                            <img src="/images_2/1_product.jpg">
                        </a>
                    </div>
                    <div class="text_box">
                        <div class="name">
                            <a href="javascript:;">超好用收納購物袋</a>
                        </div>
                        <div class="size">S</div>
                        <div class="count">
                            <select name="" id="car_productId">
                                <option value="1" selected>1</option>
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
                        <div class="price">NT$ 199</div>
                    </div>
                    <div class="cancelBtn">
                        <i class="fa fa-trash"></i>
                    </div>
                </li>   -->


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
				<a href="javascript:;">前往結帳</a>
			</div>

			<label for="side_menu_switch"> <i class="fas fa-cart-plus"></i>
			</label>
		</div>
	</div>
	<!-- End：購物車介面 -->
	<div id="main">
		<!--         <div class="header_image"> -->
		<!--             <img src="images_2/封面圖.jpg"> -->
		<!--         </div> -->


		<div class="new_container">
			<div class="new_product">

				<h1>${sort.product_type_name}</h1>

			</div>
		</div>

		<!-- 商品部分 -->
		<div class="shoppingArea">

			<!-- leftSide start  引入共同商品種類功能列 -->
			<jsp:include
				page="/WEB-INF/views/_00_util/shoppingMallUtil/jsp/shop_sort.jsp" />
			<!-- leftSide over -->

			<!-- Start:rightSide -->
			<main>
				<div class="right_container container">

					<div class="row">
						<c:forEach var='product' items='${products}'>
							<div class="product_contianer col col-md-6 col-lg-3 ">
								<div class="product_items">
									<div class="product_image image2">

										<img
											src="<c:url value='/data/images/mediumPic/noImage1.PNG'/>">
									</div>
									<div class="product_image image1">

										<a
											href="<spring:url value='singleProduct?id=${product.product_id}'/>"><img
											src="<c:url value='/getPicture/${product.product_id}'/>"></a>
									</div>
									<div class="itemBody">
										<div class="product_name">
											<a
												href="<spring:url value='singleProduct?id=${product.product_id}'/>">${product.product_name }</a>
										</div>
										<div class="product_price">
											<span>售價NT${product.product_price }</span>
										</div>
										<div class="product_count">
											<span>數量</span> <select name="count" id="">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
												<option value="5">6</option>
												<option value="5">7</option>
												<option value="5">8</option>
												<option value="5">9</option>
												<option value="5">10</option>

											</select>
										</div>
										<div class="cartBtn">加入購物車</div>
									</div>
									<!-- <div class="clearfix"></div> -->
								</div>
							</div>
						</c:forEach>
					</div>
					<!--控制頁數區域 -->
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
					<!--控制頁數區域 -->

				</div>


			</main>
			<!-- End:rightSide -->


		</div>

	</div>
<!-- -------------------------------引入共同的頁尾---------------------------------------- -->
<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
<!-- -------------------------------引入共同的頁尾----------------------------------------- -->




	<script>
		$(document).ready(function() {
			//把點到的商品名稱放到標題上
			displaySortName();

			//側邊購物車
			cartListHeight();
			//resize之後會重新計算ul高度，能使卷軸滾動
			$(window).resize(function() {
				cartListHeight();
			})

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
		function displaySortName() {
			$('.items span').click(function() {
				let sort = $(this).text(); //抓取點到的文字
				//  console.log(sort);
				$('.new_product h1').text(sort); //把抓到的文字放進標題內
			})
		}
	</script>





</body>
</html>