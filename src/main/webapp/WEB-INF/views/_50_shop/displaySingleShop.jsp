<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${shop.shop_name}(${shop.nightMarketBean.market_name})</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/normalize.css'/>">
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/background.css'/>">
<!--     <link rel="stylesheet" href="slick/slick.css"/> -->
<!-- 		Add the new slick-theme.css if you want the default styling -->
<!--     <link rel="stylesheet" href="slick/slick-theme.css"/> -->
<link rel="stylesheet"
	href="<c:url value='/_00_util/nightShopUtil/css/1_shop.css'/>" />
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
<!--     <script type="text/javascript" src="js/slick_jquery1.11.0.min.js"></script> -->
<!--     <script type="text/javascript" src="js/slick_jq_migrate1.2.1.min.js"></script> -->
<!--     <script type="text/javascript" src="slick/slick.js"></script> -->

<style>
.rate {
	float: left;
	height: 46px;
	padding-bottom: 10px;
}

.rate:not(:checked)>input {
	display: none;
}

.rate:not(:checked)>label {
	float: right;
	width: 1em;
	overflow: hidden;
	white-space: nowrap;
	cursor: pointer;
	font-size: 30px;
	color: #ccc;
}

.rate:not(:checked)>label:before {
	content: '★ ';
}

.rate>input:checked ~ label {
	color: #ffc700;
}

.rate:not(:checked)>label:hover, .rate:not(:checked)>label:hover ~ label
	{
	color: #deb217;
}

.rate>input:checked+label:hover, .rate>input:checked+label:hover ~ label,
	.rate>input:checked ~ label:hover, .rate>input:checked ~ label:hover ~
	label, .rate>label:hover ~ input:checked ~ label {
	color: #c59b08;
}

.addCoupon i{
	color: #333;
    font-size: 1.6rem;
    transition:.1s;
}
.addCoupon i:hover{
	color:#e61d1d;
	padding:0;
    font-size: 1.8rem;
    border-radius:2px;
}

.commentBox{
	background:#fff;
}
.comment_content{
/* 	white-space: pre-line; */
}
.commentBox .shopComment{
	margin:0 auto;
}
/* 顯示星星評價 */
/* 評價星星 */
.ratings {
    position: relative;
    bottom: 20%;
/*     left: 4%; */
    vertical-align: middle;
    display: inline-block;
    color: #b1b1b1;
    overflow: hidden;
}
.full-stars {
    position: absolute;
    left: 0;
    top: 0;
    white-space: nowrap;
    overflow: hidden;
    color: #fde16d;
}
.empty-stars:before, .full-stars:before {
    content:"\2605\2605\2605\2605\2605";
    font-size: 15pt;
}
.empty-stars:before {
    -webkit-text-stroke: 1px #848484;
}
.full-stars:before {
    -webkit-text-stroke: 1px orange;
}
/* Webkit-text-stroke is not supported on firefox or IE */

/* Firefox */
@-moz-document url-prefix() {
    .full-stars {
        color: #ECBE24;
    }
}

</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	<!-- slider -->
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img
					src="<c:url value='/_50_shop/_53_shopRegister/getPicture/${shop.shop_id}'/>"
					class="d-block w-100" alt="...">
			</div>
			<!-- 		    <div class="carousel-item"> -->
			<%-- 		      <img src="<c:url value='/data/images/slidePic/寧夏方家雞肉飯2.jpg'/>" class="d-block w-100" alt="..."> --%>
			<!-- 		    </div> -->
			<!-- 		    <div class="carousel-item"> -->
			<%-- 		      <img src="<c:url value='/data/images/slidePic/寧夏方家雞肉飯3.jpg'/>" class="d-block w-100" alt="..."> --%>
			<!-- 		    </div> -->
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>







	<div id="secondContainer" class="container">
		<div class="row">

			<!-- Left -->
			<div id="sectionLeft" class="col-8">
				<!-- 商家簡介 -->
				<div id="shopInfo">
					<div style="display: flex;">
						<div style="margin-right: 15px;">
							<h2 style="color: #f26419;">${shop.shop_name}</h2>
						</div>
						<c:if test="${!empty favoriteId}">
							<div>
							<a
								href="<c:url value='/deleteFavoriteShop2/${shop.shop_id}' />"
								style="font-size:20px;border:1px solid #777;padding:6px;border-radius:4px;background-color:#aaa;color:white;box-shadow: 2px 2px 3px 1px #999;"><i
								class="fas fa-heart "></i> 已收藏</a>
						</div>
						</c:if>
						<c:if test="${empty favoriteId}">
						<div>
							<a
								href="<c:url value='/_50_shop/_54_showShops/addFavoriteShop/${shop.shop_id}' />"
								style="font-size:20px;border:1px solid #930000;padding:6px;border-radius:4px;background-color:#ff0000;color:white;box-shadow: 2px 2px 3px 1px #999;"><i
								class="fas fa-heart"></i> 收藏</a>
						</div>
						</c:if>
					</div>

					<!-----------------------------------評分數開始---------------------------------- -->
					<div>
						<div class="ratings">
							<div class="empty-stars"></div>
							
							<div class="full-stars" style="width: ${shop.shop_score * 20}%; "></div>
						</div>
						<span>(${count}則評論)</span>
<%-- 						${shop.shop_score}&nbsp;<i class="fas fa-star"></i> (${count}) --%>
					</div>
					<!-----------------------------------評分數結束---------------------------------- -->
					
					<p style="color: #78886f;">${shop.shop_info}</p>
				</div>
				<!-- 商家簡介 -->

				<!-- 商家優惠券 -->
				<c:forEach var="coupon" varStatus="stat" items="${coupons}">

					<div class="addCoupon">
						<div style="margin-top: 15px;">
							<a href="<c:url value='/addFavoriteInShop/add/${coupon.coupon_id}'/>" onclick="return window.alert('收藏成功!');"><i
								class="far fa-plus-square fa-3x" ></i></a>
						</div>
						<div>
						<a
						href="<c:url value='/coupon?coupon_id=${coupon.coupon_id}' />">
							<img
								src="<c:url value='/_50_shop/_51_coupon/getPicture/${coupon.coupon_id}'/>"
								style="width: 200px; height: 80px;">
								</a>
						</div>
						<div class="couponInfo">
							<h3>${coupon.coupon_name}</h3>
							${coupon.coupon_info}
						</div>
					</div>

				</c:forEach>

				<!-- 商家優惠券 -->

				<!-- 留言區 -->
				<div id="comment" class="mb-5">
					<div class="mt-5">
						<h2>
							<i class="fas fa-comments"></i>&nbsp;立即評價
						</h2>
					</div>
					<div class="container pb-4 border-bottom">
						<c:if test="${empty LoginOK}">
							<div class="row" id="flexbox1">

								<div class="col-12">
									<div>
										您尚未登入，將以訪客身分留言，亦可<span>登入</span>留言
									</div>
								</div>
							</div>
						</c:if>
						<c:if test="${!empty commentExistBean}">
						<div><h3>你已經評論囉～</h3></div>
					</c:if>
					</div>
					<c:if test="${empty commentExistBean}">

						<form:form method="POST" modelAttribute="shopCommentBean"
							enctype='multipart/form-data'>

							<div class="row py-1">
								<div class="col-3" style="line-height: 50px;">給商家們個評價吧~~</div>

								<form:input type="number" path="shop_score" id="star"
									style="display:none" />
								<div class="rate">

									<input type="radio" id="star5" name="rate" value="5" /> <label
										for="star5" title="非常好">5 stars</label> <input type="radio"
										id="star4" name="rate" value="4" /> <label for="star4"
										title="好">4 stars</label> <input type="radio" id="star3"
										name="rate" value="3" /> <label for="star3" title="普通">3
										stars</label> <input type="radio" id="star2" name="rate" value="2" />
									<label for="star2" title="差">2 stars</label> <input
										type="radio" id="star1" name="rate" value="1" /> <label
										for="star1" title="非常差">1 star</label>


								</div>


							</div>



							<div class="col-12 flexitem" id="flex-item-1">
								<p class="form-control" style="margin-top: 0; margin-bottom: 0;">${shopCommentBean.memberBean.username}&nbsp;:</p>
							</div>

							<div class="col-12 flexitem">
								<form:textarea path="shop_comment_content" class="form-control"
									aria-label="With textarea" placeholder="留個言吧..."
									style="margin-top:1px;" />

								<button type="submit" class="btn btn-secondary btn-sm btn-block"
									style="margin-top: 10px;">送出留言</button>

							</div>

						</form:form>


					</c:if>
					
				</div>
				<c:forEach var="shopCommentBean" varStatus="stat"
					items="${shopCommentBeanList}">
					<div class="commentBox shadow mb-5 bg-white" style="padding: 6px;">
						<div class="memberInfo">
							<div class="putLeft">
								<div class="memberImage">
									<img
										src="<c:url value='/_00_init/getMemberImage?memberId=${shopCommentBean.memberBean.memberId}'/>">
								</div>
								<span class="memberId">${shopCommentBean.memberBean.username }</span>
								<span class="nickname">${shopCommentBean.memberBean.fullname }</span>
								<input type="number" id="score${shopCommentBean.shop_comment_id}"
									value="${shopCommentBean.shop_score}" style="display: none;">
								<div class="comment_score"
									id="feedback${shopCommentBean.shop_comment_id}"></div>
							</div>

							<!-- 點擊會出現檢舉或編輯的下拉選單 -->
							<div class="doMore">
								<i class="fas fa-ellipsis-v"></i>
								<!-- 分開管理css 與 jq 的 class屬性值 -->
								<!-- <ul class="dropdownList jq-dropdown">
                                <li>編輯</li>
                                <li>檢舉</li>
                            </ul> -->
							</div>
						</div>
						<div class="comment_content ">
							<span>${shopCommentBean.shop_comment_content}</span>
						</div>
						<hr>
						<div class="putLeft">
							<div class="memberImage">
								<img
									src="<c:url value='/_50_shop/_53_shopRegister/getPicture/${shop.shop_id}'/>">
							</div>
							<span class="memberId">${shopCommentBean.shopBean.shop_name }&nbsp;:</span>
						</div>
						<!-- 點擊會出現檢舉或編輯的下拉選單 -->
						<div class="comment_content shopComment">
							<span>${shopCommentBean.shop_response}</span>
						</div>

						<div>
							<c:if test="${LoginOK.shopBean.shop_id == shop.shop_id}">
								<form:form
									action="${pageContext.request.contextPath}/_50_shop/_54_showShops/ShopResponse/${shop.shop_id}"
									method="POST" modelAttribute="shopCommentBean"
									enctype='multipart/form-data'>
									<div class="col-12 flexitem">
										<form:input type="number" path="shop_comment_id"
											style="display:none"
											value="${shopCommentBean.shop_comment_id}" />
										<form:textarea path="shop_response" class="form-control"
											aria-label="With textarea" placeholder="回覆評論..."
											style="margin-top:1px;" />

										<button type="submit"
											class="btn btn-secondary btn-sm btn-block"
											style="margin-top: 10px;">送出回覆</button>
									</div>
								</form:form>
							</c:if>
						</div>
					</div>

				</c:forEach>


			</div>
			<div id="RightBorder" class="col-4">
				<div id="shopPhone">
					<div class="item">
						<div class="item-left">
							<i class="fas fa-phone-alt"></i>
						</div>
						<div class="item-right">${shop.shop_phone}</div>
					</div>
					<div class="item">
						<div class="item-left">
							<i class="fas fa-map-marked-alt"></i>
						</div>
						<div class="item-right">${shop.shop_addr}</div>
					</div>
					<div class="item">
						<div class="item-left">
							<i class="fab fa-chrome"></i>
						</div>
						<div class="item-right">${shop.shop_hyperlink}</div>
					</div>
					<div class="item">
						<div class="item-left">
							<i class="fas fa-clock"></i>
						</div>
						<div class="item-right">${shop.shop_hours}</div>
					</div>
					<div class="item">
						<div class="item-left">
							<a class="btn" href="javascript:navbar();"> <i
								class="fas fa-bars"></i>
							</a>

						</div>
						<div class="item-right m-auto ">MENU</div>
					</div>
					<div class="item row justify-content-center" id="menu_animate">
						<c:forEach var="shopmenu" varStatus="stat" items="${smb}">
							<div class="col-6">
								<div class="column-pic">
									 <img
										src="<c:url value='/_50_shop/_52_shopmenu/picture/${shopmenu.menu_id}'/>"
										style="width:140px" class="coupon-pic">

									<p>${shopmenu.menu_name}</p>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End:Right -->



	<!-- 留言內容 -->




	<!-- 留言區 -->


	<!-- End:Left -->
	<!-- Right -->

	<script>
		function doFirst() {
			//處理評論文字換行問題
			$('.comment_content').each(function(e){
				let reg = /\n/g;
				let comment = $(this).text();
				comment = comment.replace(reg,'<br/>');
				$(this).html(comment);
				
			});
			
			
			try {
				score = document.getElementById("star");
				star5 = document.getElementById("star5");
				star4 = document.getElementById("star4");
				star3 = document.getElementById("star3");
				star2 = document.getElementById("star2");
				star1 = document.getElementById("star1");

				star5.addEventListener("click", function() {
// 					alert();
					score.value = star5.value;
// 					alert(score.value);
				})

				star4.addEventListener("click", function() {
					score.value = star4.value;
				})

				star3.addEventListener("click", function() {
					score.value = star3.value;
				})

				star2.addEventListener("click", function() {
					score.value = star2.value;
				})

				star1.addEventListener("click", function() {
					score.value = star1.value;
				})
			} catch (e) {

			}

			for (var n = 1; n < 100; n++) {
				try {
					rate = document.getElementById(`score${'${n}'}`).value;
					feedback = document.getElementById(`feedback${'${n}'}`);
					if (rate == 5) {
						feedback.innerHTML = "<span style='color:#c59b08;'>★★★</span><span style='color:#c59b08;'>★★</span>";
					}
					if (rate == 4) {
						feedback.innerHTML = "<span style='color:#c59b08;'>★★★★</span><span style='color:#ccc;'>★</span>";
					}
					if (rate == 3) {
						feedback.innerHTML = "<span style='color:#c59b08;'>★★★</span><span style='color:#ccc;'>★★</span>";
					}
					if (rate == 2) {
						feedback.innerHTML = "<span style='color:#c59b08;'>★★</span><span style='color:#ccc;'>★★★</span>";
					}
					if (rate == 1) {
						feedback.innerHTML = "<span style='color:#c59b08;'>★</span><span style='color:#ccc;'>★★★★</span>";
					}
				} catch (e) {

				}

			}

		}
		window.addEventListener("load", doFirst())

		function navbar() {
			// 			alert();
			// 		 	alert(document.getElementById("menu_animate").style.display);
			var style = document.getElementById("menu_animate").style.display;
			if (style == "flex") {
				document.getElementById("menu_animate").style.display = "none";
			} else {
				document.getElementById("menu_animate").style.display = "flex";
			}

		}
	</script>






<!-- -------------------------------引入共同的頁尾---------------------------------------- -->
<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
<!-- -------------------------------引入共同的頁尾----------------------------------------- -->
</body>
</html>
