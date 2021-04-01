<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>




<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/normalize.css'/>">
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/header.css'/>">
<script
	src="<c:url value='/_00_util/allUtil/javascript/jquery-3.5.1.js'/>"></script>
<script src="<c:url value='/_00_util/allUtil/javascript/jquery-ui.js'/>"></script>
<script src="<c:url value='/_00_util/allUtil/javascript/header.js'/>"></script>


<style>

/* 會員大頭貼的設定 */
.member-headImg {
	position: absolute;
	top: 40px;
	right: 10px;
	width: 100px;
	padding: 10px;
}

.member-headImg img {
	width: 80%;
	height: 80%;
	border-radius: 50%;
}
</style>



<!-- Start:header -->
<!-- 回到上方的按鈕 -->
<!-- <a href="#" class="toTop"><i class="fas fa-arrow-up"></i></a> -->

<a href="#" id="go-top"><i class="fas fa-arrow-up"></i></a>

<header>
	<nav class="myNav">
		<div class="navbar">
			<div class="ig-links">
				<a href="#">快速登入</a> <a href="#"><img
					src="<c:url value='/data/images/smallPic/facebook.png'/>" alt=""></a>
				<a href="#"><img
					src="<c:url value='/data/images/smallPic/instagram.png'/>" alt=""></a>
				<a href="#"><img
					src="<c:url value='/data/images/smallPic/search.png'/>" alt=""></a>
			</div>
			<div class="space"></div>
			<div class="links">
				<a href="#"><i class="fas fa-user-friends"></i>關於我們</a>
				<a href="#"><i class="fas fa-info-circle"></i>最新消息</a>
<!-- 				<button type="button" class="fas fa-info-circle btn-dark" -->
<%-- 					data-toggle="modal" data-target="#exampleModal">最新消息</button> --%>
				<a href="#"><i class="far fa-question-circle"></i>幫助中心</a> <a
					href="#"><i class="fas fa-comment-dots"></i>意見回應</a>
			</div>
		</div>
	</nav>


	<div class="search">
		<div class="search-wrap">

			<div class="logo-wrap">
				<a href="<c:url value='/home' />"> <img
					src="<c:url value='/data/images/smallPic/yachiLogo50.png'/>">
				</a>
			</div>

			<form class="search-food" action="<c:url value='/search/product'/>">
				<div class="search-input">

					<c:if test="${!empty keyword}">

						<c:if test="${keyword != '?' }">
							<input name="product_name" type="text" placeholder="${keyword}">
						</c:if>
						<c:if test="${keyword == '?' }">
							<input name="product_name" type="text" placeholder="請輸入關鍵字 . . .">
						</c:if>

					</c:if>

					<c:if test="${empty keyword}">
						<input name="product_name" type="text" placeholder="搜尋商城商品 . . .">
					</c:if>

					<button type="submit">
						<i class="fas fa-search"></i>
					</button>

				</div>

				<!-- 跑馬燈 -->
				<div id="Marquee">
					<h3>最新優惠消息:</h3>
					<ul id="news">
						<c:forEach var="adminactivityBean" varStatus="stat"
							items="${adminactivityBeanList}">
							<li><button type="button" class="fas fas-white">  
									${adminactivityBean.adminactivity_name}</button></li>
<%-- 									data-toggle="modal" data-target="#exampleModal${adminactivityBean.adminactivity_id }"  --%>
							<!-- Modal -->
<!-- 							<div class="modal fade" -->
<%-- 								id="exampleModal${adminactivityBean.adminactivity_id }" --%>
<!-- 								tabindex="-1" aria-labelledby="exampleModalLabe" -->
<!-- 								aria-hidden="true" style="z-index: 9999 !important;"> -->
<!-- 								<div class="modal-dialog"> -->
<!-- 									<div class="modal-content"> -->
<!-- 										<div class="modal-header"> -->
<!-- 											<h5 class="modal-title" id="exampleModalLabel">Modal -->
<!-- 												title</h5> -->
<!-- 											<button type="button" class="close" data-dismiss="modal" -->
<!-- 												aria-label="Close"> -->
<!-- 												<span aria-hidden="true">&times;</span> -->
<!-- 											</button> -->
<!-- 										</div> -->
<!-- 										<div class="modal-body"> -->
<!-- 											<p>我們要呈現在Modal裡的內容</p> -->
<!-- 										</div> -->
<!-- 										<div class="modal-footer"> -->
<!-- 											<button type="button" class="btn btn-secondary" -->
<!-- 												data-dismiss="modal">Close</button> -->
<!-- 											<button type="button" class="btn btn-primary">Save -->
<!-- 												changes</button> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->

						</c:forEach>
					</ul>
				</div>
				<!-- 跑馬燈結束 -->

				<!-- 					<div class="food-trending"> -->
				<!-- 						<a href="#">測試中</a> <a href="#">測試中</a> <a href="#">優惠券</a> <a -->
				<!-- 							href="#">關鍵字</a> <a href="#">測試</a> -->
				<!-- 					</div> -->
			</form>

			<div class="search-ticket">
				<img src="<c:url value='/data/images/smallPic/yachiLogo50.png'/>">
				<div class="txt">
					<a href="<c:url value='/coupons'/>"><h2>優惠券專區</h2></a>
				</div>

			</div>

			<div class="member">
				<c:if test="${!empty LoginOK || !empty AdminLoginOK}">
					<a href="#"><font>你好 ! </font></a>
					<script>
// 					    $(function () {
// 					   		var temp = `${LoginOK.fullname}`;
// 							alert(temp+ " 歡迎回來 ! ");
// 					   	});
					</script>
					<c:choose>

						<c:when test="${!empty LoginOK}">
							<a href="#"><font>${LoginOK.fullname}</font></a>
						</c:when>
						<c:when test="${!empty AdminLoginOK}">
							<a href="#"><font>${AdminLoginOK.fullname}</font></a>
						</c:when>

						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</c:if>

				<c:if test="${empty LoginOK && empty AdminLoginOK }">
					<a href="<c:url value='/LoginAndRegister'/>"><font>免費註冊</font></a>
					<a href="<c:url value='/LoginAndRegister'/>"><font>登入</font></a>
				</c:if>

				<a href="<c:url value='/goCheckout'/>"><i
					class="fas fa-shopping-cart"></i></a>

			</div>

			<c:if test="${empty status and !empty code }">
				<script>
					$(function() {
						if (window.confirm('已成功寄信至 '+`${confirmMail}`+' 點擊確定前往驗證帳號')) {
							window.location.href='https://accounts.google.com/signin/v2/identifier?service=mail&passive=true&rm=false&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F%26ogbl%2F&ss=1&scc=1&ltmpl=default&ltmplcache=2&emr=1&osid=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin';
						};
					});
				</script>
			</c:if>

			<c:if test="${!empty shopregister  }">
				<script>
					$(function() {
						alert(" 你已成功申請為商家 !");
					});
				</script>
			</c:if>
			
			<c:if test="${!empty sendMail}">
				<script>
					$(function() {
						if (window.confirm('已成功寄信至 '+`${sendMail}`+' 點擊確定前往更改')) {
							window.location.href='https://accounts.google.com/signin/v2/identifier?service=mail&passive=true&rm=false&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F%26ogbl%2F&ss=1&scc=1&ltmpl=default&ltmplcache=2&emr=1&osid=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin';
						};
					});
				</script>
			</c:if>

			<c:if test="${!empty LoginOK}">
				<div class="member-headImg">
					<img
						src="<c:url value='/_00_init/getMemberImage?memberId=${LoginOK.memberId}'/>">
				</div>
			</c:if>

		</div>
	</div>



	<div class="tab">
		<div class="tab-warp">

			<div class="tab-list">
				<a href="<c:url value='/'/>">夜市簡介</a> <a
					href="<c:url value='/_50_shop/_54_showShops/ShowShops' />">優質商家</a>
				<a href="#">美食推薦</a> <a
					href="<c:url value="/DisplayPageProducts" />">購物中心</a>

				<c:if test="${!empty AdminLoginOK}">
					<a href="<c:url value='/admin/administrator'/>">管理員中心</a>
				</c:if>
				<c:if test="${!empty LoginOK}">
					<a href="#">會員中心</a>
				</c:if>

			</div>

			<div class="tab-content">

					<div class="tab-panel">
						<a href="<c:url value='/MarketRaohe' />">饒河夜市</a><br> 
						<a href="<c:url value='/MarketNingxia' />">寧夏夜市</a><br>  
						<a href="<c:url value='/MarketShilin' />">士林夜市</a><br> 
						<a href="<c:url value='/MarketYanping' />">延三夜市</a><br> 
						<a href="<c:url value='/MarketGongguan' />">公館夜市</a><br> 
						<a href="<c:url value='/MarketSouth' />">南機場夜市</a><br> 
						<a href="<c:url value='/MarketLinjiang' />">臨江街觀光夜市</a><br>
						<a href="<c:url value='/MarketHuaxi' />">華西街觀光夜市</a><br>
					</div>

				<div class="tab-panel">

					<%-- 						<a href="<c:url value='/nightMarketShop' />">方家雞肉飯</a><br> <a --%>
					<%-- 							href="<c:url value='/' />">測試1超好吃店家</a><br> <a --%>
					<%-- 							href="<c:url value='/' />">測試2世界第一好吃</a><br> <a --%>
					<%-- 							href="<c:url value='/' />">測試3</a><br> --%>

				</div>
				<div class="tab-panel">
					<!-- 						<a href="#">方家雞肉飯</a><br> <a href="#">方家雞肉飯2</a><br> <a -->
					<!-- 							href="#">方家雞肉飯3</a><br> <a href="#">方家雞肉飯4</a><br> <a -->
					<!-- 							href="#">方家雞肉飯5</a><br> <a href="#">方家雞肉飯5</a><br> <a -->
					<!-- 							href="#">方家雞肉飯5</a><br> <a href="#">方家雞肉飯5方家雞肉飯5</a><br> -->
				</div>
				<div class="tab-panel">
					<%-- 						<a href="<c:url value='/DisplayPageProducts' />">購物商城</a><br> --%>
					<%-- 						<a href="<c:url value='update/price' />">點我更新價格(+50元)</a><br> --%>
				</div>
				<div class="tab-panel">

					<c:if test="${!empty AdminLoginOK}">

						<a href="<c:url value='/admin/administrator' />">管理員首頁</a>
						<br>
						<a href="<c:url value='/admin/admin_editProduct' />">商品維護</a>
						<br>
						<a href="<c:url value='/admin/InsertAdminActivity' />">新增優惠活動</a>
						<br>
						<a href="<c:url value='/admin/InsertAdminCoupon' />">新增平台優惠券</a>
						<br>
						<a href="<c:url value='/admin/admin_adinfo' />">廣告資訊</a>
						<br>
						<a href="<c:url value='/admin/admin_chatroom' />">客服回應</a>
						<br>
						<a href="<c:url value='/admin/admin_checkShop' />">審核商家</a>
						<br>
						<a href="<c:url value='/admin/admin_announcement' />">公告</a>
						<br>
						<a href="<c:url value='/websocket/login'/>"><font>線上客服</font></a><br>
						<a href="<c:url value='/doLogout'/>"
							onclick="return window.confirm('確定登出嗎?');"> <font>登 出</font></a>

					</c:if>

					<c:if test="${!empty LoginOK}">

						<a href="<c:url value='/member/update/${LoginOK.memberId}'/>">修改會員資料</a>
						<a href="<c:url value='/member/keep/coupons'/>">我的優惠券</a>
						<a href="<c:url value="/queryFavoriteShop"/>">我的喜愛商家</a>
						<a href="<c:url value='/_23_orderProcess/orderList'/>"><font>查看訂單</font></a>
						<br>
						<c:if test="${empty LoginOK.shopBean.shop_id}">
							<a href="<c:url value='/_50_shop/_53_shopRegister/InsertShop' />">申請商家</a>
							<br>
						</c:if>
						<c:if test="${!empty LoginOK.shopBean.shop_id}">
							<a
								href="<c:url value='/_50_shop/_53_shopRegister/modifyShop/${LoginOK.shopBean.shop_id}' />">商家管理頁面</a>
							<br>
						</c:if>
						<a href="<c:url value='/websocket/login'/>"><font>線上客服</font></a><br>
						<a href="<c:url value='/doLogout'/>"
							onclick="return window.confirm('確定登出嗎?');"> <font>登 出</font></a>

					</c:if>


				</div>
			</div>

		</div>
	</div>


</header>
