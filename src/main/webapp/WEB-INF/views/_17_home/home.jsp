<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Yachi</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/background.css'/>">
	<!--------------------------aos套件-------------------------------- -->
	<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
	<!--------------------------aos套件-------------------------------- -->
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/normalize.css'/>">
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  />
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
<!--------------------------aos套件-------------------------------- -->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<!--------------------------aos套件-------------------------------- -->

<script src="<c:url value='/_00_util/allUtil/javascript/jquery-ui.js'/>"></script>

<link rel="stylesheet"
	href="<c:url value='/WEB-INF/views/_00_util/allUtil/css/reset.css'/>">
<link rel="stylesheet"
	href="<c:url value='/WEB-INF/views/_00_util/homeUtil/css/home.css'/>">
<style>
.imgs {
max-width:335.5px; 

}

div input {
	height: 30px;
}

#theForm {
	/* background: black; */
	/* border: 1px solid black; */
	width: 450px;
	height: 550px;
	margin: 0px auto 0px auto;
	box-sizing: border-box;
	text-align: center;
	/* align-items: center;
         justify-content: center; */
	color: #ffffff;
}

#theForm h1 {
	/* border:1px solid rgb(255, 0, 0); */
	font-size: 50px;
	text-align: center;
	margin: 10px auto;
}

#theForm div {
	margin: 10px auto;
}

fieldset {
	/* border:1px solid rgb(255, 0, 0); */
	margin: 15px auto 0px auto;
	/* height: 400px; */
	font-size: 25px;
}

/* Shared */
.loginBtn {
	box-sizing: border-box;
	position: relative;
	/* width: 13em;  - apply for fixed size */
	margin: 0.2em;
	padding: 0 15px 0 46px;
	border: none;
	text-align: left;
	line-height: 34px;
	white-space: nowrap;
	border-radius: 0.2em;
	font-size: 16px;
	color: #FFF;
}

.loginBtn:before {
	content: "";
	box-sizing: border-box;
	position: absolute;
	top: 0;
	left: 0;
	width: 34px;
	height: 100%;
}

.loginBtn:focus {
	outline: none;
}

.loginBtn:active {
	box-shadow: inset 0 0 0 32px rgba(0, 0, 0, 0.1);
}

/* Facebook */
.loginBtn--facebook {
	width: 200px;
	text-align: center;
	background-color: #4C69BA;
	background-image: linear-gradient(#4C69BA, #3B55A0);
	/*font-family: "Helvetica neue", Helvetica Neue, Helvetica, Arial, sans-serif;*/
	text-shadow: 0 -1px 0 #354C8C;
}

.loginBtn--facebook:before {
	border-right: #364e92 1px solid;
	background:
		url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/14082/icon_facebook.png')
		6px 6px no-repeat;
}

.loginBtn--facebook:hover, .loginBtn--facebook:focus {
	background-color: #5B7BD5;
	background-image: linear-gradient(#5B7BD5, #4864B1);
}

/* Google */
.loginBtn--google {
	width: 200px;
	text-align: center;
	/*font-family: "Roboto", Roboto, arial, sans-serif;*/
	background: #DD4B39;
}

.loginBtn--google:before {
	border-right: #BB3F30 1px solid;
	background:
		url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/14082/icon_google.png')
		6px 6px no-repeat;
}

.loginBtn--google:hover, .loginBtn--google:focus {
	background: #E74B37;
}

#confirm, #signUp {
	background: rgb(99, 99, 81);
	width: 70px;
	color: #F3F8F2;;
	border: none;
	padding: 10px;
	border-radius: 10px;
	cursor: pointer;
	transition: all 1000ms ease-in-out;
	margin: 20px 30px;
}

.font {
	font-weight: bold;
	font-size:1.3rem;
}

.pos {
	position: absolute;
	right: 16px;
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

	<!-- 回到上方的按鈕 -->
	<!------------------------- Start ------------------------------->

	<!-------------------------  End  ------------------------------->

	<!-- Log in====================================== -->
	<!-- <div class="login-bg-first">
    <div class="login-bg-second">
      <form id="theForm">
        <fieldset class="text-shadow">
          <h1>登入</h1>
          <div>
            <label>帳號</label>
            <input type="text" name="account" id="account">
          </div>
          <div>
            <label>密碼</label>
            <input type="text" name="password" id="password">
          </div>
          <div>
            <input type="checkbox" name="rememberPw" id="rememberPw">
            <label>記住密碼</label>
          </div>



          <div><button class="loginBtn loginBtn--facebook">
              Facebook
            </button></div>

          <div> <button class="loginBtn loginBtn--google">
              Google
            </button></div>

          <div id="btn">
            <button id="confirm">確認</button>
            <button id="signUp">註冊</button>
          </div>
          <a href="">忘記密碼</a>
        </fieldset>
      </form>
    </div>
  </div> -->
	<!-- slider ================================= -->
	<!-- .mt-n1 {
      margin-top: -0.25rem !important;
    } -->
	<!-- <div class="slider"> -->
	<!--<div class="slider " style="margin: 0px 150px;">
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
					<img src="<c:url value='/data/images/couponPic/wheel_pies.jpg'/>"
						class="d-block w-100">
				</div>
				<div class="carousel-item">
					<img src="<c:url value='/data/images/couponPic/Vermicelli2.jpg'/>"
						class="d-block w-100">
				</div>
				<div class="carousel-item">
					<img
						src="<c:url value='/data/images/couponPic/Taiwanese_hamburger.jpg'/>"
						class="d-block w-100">
				</div>
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
	</div>-->
		<div class="container ">
				<div class="row no-gutters">
					<div class="col-md-8">
					<div class="slider">
						<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carouselExampleIndicators" data-slide-to="0"
									class="active"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img
										src="<c:url value='/data/images/couponPic/lunch_box.webp.jpg'/>"
										class="d-block w-100">
								</div>
								<div class="carousel-item">
									<img
										src="<c:url value='/data/images/couponPic/Vermicelli2.jpg'/>"
										class="d-block w-100">
								</div>
								<div class="carousel-item">
									<img
										src="<c:url value='/data/images/couponPic/Taiwanese_hamburger.jpg'/>"
										class="d-block w-100">
								</div>
							</div>
							<a class="carousel-control-prev"
								href="#carouselExampleIndicators" role="button"
								data-slide="prev"> <span class="carousel-control-prev-icon"
								aria-hidden="true"></span> <span class="sr-only">Previous</span>
							</a> <a class="carousel-control-next"
								href="#carouselExampleIndicators" role="button"
								data-slide="next"> <span class="carousel-control-next-icon"
								aria-hidden="true"></span> <span class="sr-only">Next</span>
							</a>
						</div>
					</div>
				</div>
					<div class="col-md-4 pl-2">
						
						<div class="sec-cover">
							<a href="RedBean_pies"> 
							<img
										src="<c:url value='/data/images/couponPic/RedBean_pies.webp.jpg'/>"
										class="d-block w-100">
							</a>
						</div>
						                       
						<div class="third-cover mt-2 d-block">
							<a href="bread"> 
							<img
										src="<c:url value='/data/images/couponPic/bread.webp.jpg'/>"
										class="d-block w-100">
							</a>
						</div>
						
					</div>
				</div>
			</div>


	<!-- Night Market =================================== -->
	<!-- <div class="night-market-bg-first" style="background: url(./Night_Market/nightMarket-bg.jpg);"> -->

	<div class="night-market-bg-second">
		<div class="jobs ">
			<div class="container ">
				<div class="focus text-black text-center text-shadow ">

					<h1>夜市推薦</h1>
					<hr>
				</div>
				<div class="row" style="margin: 0px -180px">
					
					<div class="col-sm-6 col-lg-3 mt-4">
						<div data-aos="zoom-out">
							<div class="card shadow  bg-white rounded">
									<a href="<c:url value='/MarketShilin' />"> <img class="imgs"
									src="<c:url value='/data/images/Night_Market/Shilin_Night.jpg'/>"></a>
								<div class="card-body ">
								<div class="card-title font d-flex justify-content-between">
									士林夜市
									<!-----------------------------------評分數開始---------------------------------- -->
									<div>
										<div class="ratings">
											<div class="empty-stars"></div>
	
											<div class="full-stars"
												style="width: ${night4.market_score * 20}%; "></div>
										</div>
									</div>
									<!-----------------------------------評分數結束---------------------------------- -->
								</div>
								<!-- 	<i class="fas fa-star pos"></i>  我是Font Awesome星星圖-->
	
									<!-- 		<p class="card-text">營業時間: 周一至周日 晚上6點至凌晨12點</p> -->
									<!-- 	<a href="#" class="btn btn-primary  ">前進夜市</a> -->
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-3 mt-4">
						<div data-aos="zoom-out">
							<div class="card shadow  bg-white rounded">
							<a href="<c:url value='/MarketSouth' />"> <img class="imgs"
									src="<c:url value='/data/images/Night_Market/South_Airport.jpg'/>"></a>
								<div class="card-body">
									<div class="card-title font d-flex justify-content-between">
									南機場夜市
									<!-----------------------------------評分數開始---------------------------------- -->
									<div>
										<div class="ratings">
											<div class="empty-stars"></div>
	
											<div class="full-stars"
												style="width: ${night8.market_score * 20}%; "></div>
										</div>
									</div>
									<!-----------------------------------評分數結束---------------------------------- -->
								</div>
									<!-- 								<p class="card-text">營業時間: 周一至周日 晚上6點至凌晨12點</p> -->
									<!-- 								<a href="#" class="btn btn-primary ml-5 mt-2">前進夜市</a> -->
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-3 mt-4">
						<div data-aos="zoom-out">
							<div class="card shadow  bg-white rounded">
							<a href="<c:url value='/MarketRaohe' />"> <img class="imgs"
									src="<c:url value='/data/images/Night_Market/Raohe.jpg'/>"></a>
								<div class="card-body">
									<div class="card-title font d-flex justify-content-between">
										饒河夜市
										<!-----------------------------------評分數開始---------------------------------- -->
										<div>
											<div class="ratings">
												<div class="empty-stars"></div>
	
												<div class="full-stars"
													style="width: ${night4.market_score * 20}%; "></div>
											</div>
										</div>
										<!-----------------------------------評分數結束---------------------------------- -->
									</div>
									<!-- 								<p class="card-text">營業時間: 周一至周日 晚上6點至凌晨12點</p> -->
									<!-- 								<a href="#" class="btn btn-primary justify-content-center">前進夜市</a> -->
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-3 mt-4">
						<div data-aos="zoom-out">
							<div class="card shadow  bg-white rounded">
									<a href="<c:url value='/MarketNingxia' />"> <img class="imgs"
									src="<c:url value='/data/images/Night_Market/Ningxia.jpg'/>"></a>
								<div class="card-body">
									<div class="card-title font d-flex justify-content-between">
										寧夏夜市
										<!-----------------------------------評分數開始---------------------------------- -->
										<div>
											<div class="ratings">
												<div class="empty-stars"></div>
	
												<div class="full-stars"
													style="width: ${night3.market_score * 20}%; "></div>
											</div>
										</div>
										<!-----------------------------------評分數結束---------------------------------- -->
									</div>
									<!-- 								<p class="card-text">營業時間: 周一至周日 晚上6點至凌晨12點</p> -->
									<!-- 								<a href="#" class="btn btn-primary ml-5 mt-2">前進夜市</a> -->
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-3 mt-4">
						<div data-aos="zoom-out">
							<div class="card shadow  bg-white rounded">
							<a href="<c:url value='/MarketGongguan' />"> <img class="imgs"
									src="<c:url value='/data/images/Night_Market/kou.jpg'/>"></a>
								<div class="card-body">
									<div class="card-title font d-flex justify-content-between">
										公館夜市
										<!-----------------------------------評分數開始---------------------------------- -->
										<div>
											<div class="ratings">
												<div class="empty-stars"></div>
	
												<div class="full-stars"
													style="width: ${night7.market_score * 20}%; "></div>
											</div>
										</div>
										<!-----------------------------------評分數結束---------------------------------- -->
									</div>
									<!-- 								<p class="card-text">營業時間: 周一至周日 晚上6點至凌晨12點</p> -->
									<!-- 								<a href="#" class="btn btn-primary ml-5 mt-2">前進夜市</a> -->
								</div>
							</div>
						</div>	
					</div>
					<div class="col-sm-6 col-lg-3 mt-4">
						<div data-aos="zoom-out">
							<div class="card shadow  bg-white rounded">
							<a href="<c:url value='/MarketHuaxi' />"> <img class="imgs"
									src="<c:url value='/data/images/Night_Market/Huaxi Street.jpg'/>"></a>
							
								<div class="card-body">
									<div class="card-title font d-flex justify-content-between">
										華西街夜市
										<!-----------------------------------評分數開始---------------------------------- -->
										<div>
											<div class="ratings">
												<div class="empty-stars"></div>
	
												<div class="full-stars"
													style="width: ${night2.market_score * 20}%; "></div>
											</div>
										</div>
										<!-----------------------------------評分數結束---------------------------------- -->
									</div>
									<!-- 								<p class="card-text">營業時間: 周一至周日 晚上6點至凌晨12點</p> -->
									<!-- 								<a href="#" class="btn btn-primary ml-5 mt-2">前進夜市</a> -->
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-3 mt-4">
						<div data-aos="zoom-out">
							<div class="card shadow  bg-white rounded">
							<a href="<c:url value='/MarketLinjiang' />"> <img class="imgs"
									src="<c:url value='/data/images/Night_Market/Xichang.jpg'/>"></a>
								<div class="card-body">
									<div class="card-title font d-flex justify-content-between">
										臨江街夜市
										<!-----------------------------------評分數開始---------------------------------- -->
										<div>
											<div class="ratings">
												<div class="empty-stars"></div>
	
												<div class="full-stars"
													style="width: ${night5.market_score * 20}%; "></div>
											</div>
										</div>
										<!-----------------------------------評分數結束---------------------------------- -->
									</div>
									<!-- 								<p class="card-text">營業時間: 周一至周日 晚上6點至凌晨12點</p> -->
									<!-- 								<a href="#" class="btn btn-primary ml-5 mt-2">前進夜市</a> -->
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-3 mt-4">
						<div data-aos="zoom-out">
							<div class="card shadow  bg-white rounded">
							<a href="<c:url value='/MarketYanping' />"> <img class="imgs"
									src="<c:url value='/data/images/Night_Market/Yanzo.jpg'/>"></a>
								<div class="card-body">
									<div class="card-title font d-flex justify-content-between">
										延三夜市
										<!-----------------------------------評分數開始---------------------------------- -->
										<div>
											<div class="ratings">
												<div class="empty-stars"></div>
	
												<div class="full-stars"
													style="width: ${night6.market_score * 20}%; "></div>
											</div>
										</div>
										<!-----------------------------------評分數結束---------------------------------- -->
									</div>
									<!-- 								<p class="card-text">營業時間: 周一至周日 晚上6點至凌晨12點</p> -->
									<!-- 								<a href="#" class="btn btn-primary ml-5 mt-2">前進夜市</a> -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- </div>
  </div> -->
		<!-- Voucher  =================================== -->
		<!-- <div class="Voucher-bg-first" style="background: url(./Night_Market/bg-4.jpg);">
          <div class="Voucher-bg-second"> -->
<!-- 		<div class="jobs "> -->
<!-- 			<div class="container"> -->
<!-- 				<div class="focus text-black text-center text-shadow "> -->
<!-- 					<h1>優惠劵推薦</h1> -->
<!-- 					<hr> -->
<!-- 				</div> -->
<!-- 				<div class="row" style="margin: 0px -180px"> -->
<!-- 					<div class="col-sm-6 col-lg-3 mt-4 "> -->
<!-- 						<div class="card"> -->
<!-- 						<a href="#"> <img class="imgs" -->
<%-- 								src="<c:url value='/data/images/Taiwan_streetFood/Chicken Fillet.jpg'/>"></a> --%>
<!-- 							<div class="card-body"> -->
<!-- 								<h5 class="card-title font"> -->
<!-- 									雞排 -->
<!-- 								</h5> -->
<!-- 								<p class="card-text"></p> -->
<!-- 																<a href="#" class="btn btn-primary ml-5">今晚想來點</a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-sm-6 col-lg-3 mt-4 "> -->
<!-- 						<div class="card"> -->
<!-- 							<a href="#"> <img class="imgs" -->
<%-- 								src="<c:url value='/data/images/Taiwan_streetFood/Fried chicken.jpg'/>"></a> --%>
<!-- 							<div class="card-body"> -->
<!-- 								<h5 class="card-title font"> -->
<!-- 									鹹酥雞 -->
<!-- 								<p class="card-text"></p> -->
<!-- 																<a href="#" class="btn btn-primary ml-5">今晚想來點</a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-sm-6 col-lg-3 mt-4"> -->
<!-- 						<div class="card"> -->
<!-- 						<a href="#"> <img class="imgs" -->
<%-- 								src="<c:url value='/data/images/Taiwan_streetFood/Oyster vermicelli.jpg'/>"></a> --%>
<!-- 							<div class="card-body"> -->
<!-- 								<h5 class="card-title font"> -->
<!-- 									大腸蚵仔麵線 -->
<!-- 								</h5> -->
<!-- 								<p class="card-text"></p> -->
<!-- 																<a href="#" class="btn btn-primary ml-5">今晚想來點</a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-sm-6 col-lg-3 mt-4"> -->
<!-- 						<div class="card"> -->
<!-- 						<a href="#"> <img class="imgs" -->
<%-- 								src="<c:url value='/data/images/Taiwan_streetFood/Pork.jpg'/>"></a> --%>
<!-- 							<div class="card-body"> -->
<!-- 								<h5 class="card-title font"> -->
<!-- 									藥燉排骨 -->
<!-- 								</h5> -->
<!-- 								<p class="card-text"></p> -->
<!-- 																<a href="#" class="btn btn-primary ml-5">今晚想來點</a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-sm-6 col-lg-3 mt-4"> -->
<!-- 						<div class="card"> -->
<!-- 						<a href="#"> <img class="imgs" -->
<%-- 								src="<c:url value='/data/images/Taiwan_streetFood/soybean pudding.jpg'/>"></a> --%>
<!-- 							<div class="card-body"> -->
<!-- 								<h5 class="card-title font"> -->
<!-- 									粉圓豆花 -->
<!-- 								</h5> -->
<!-- 								<p class="card-text"></p> -->
<!-- 																<a href="#" class="btn btn-primary ml-5">今晚想來點</a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-sm-6 col-lg-3 mt-4"> -->
<!-- 						<div class="card"> -->
<!-- 							<a href="#"> <img class="imgs" -->
<%-- 								src="<c:url value='/data/images/Taiwan_streetFood/Sweet potato balls.jpg'/>"></a> --%>
<!-- 							<div class="card-body"> -->
<!-- 								<h5 class="card-title font"> -->
<!-- 									地瓜球 -->
<!-- 								</h5> -->
<!-- 								<p class="card-text"></p> -->
<!-- 																<a href="#" class="btn btn-primary ml-5">今晚想來點</a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-sm-6 col-lg-3 mt-4"> -->
<!-- 						<div class="card"> -->
<!-- 							<a href="#"> <img class="imgs" -->
<%-- 								src="<c:url value='/data/images/Taiwan_streetFood/Stinky Tofu.jpg'/>"></a> --%>
<!-- 							<div class="card-body"> -->
<!-- 								<h5 class="card-title font"> -->
<!-- 									港式臭豆腐 -->
<!-- 								</h5> -->
<!-- 								<p class="card-text"></p> -->
<!-- 																<a href="#" class="btn btn-primary ml-5">今晚想來點</a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-sm-6 col-lg-3 mt-4"> -->
<!-- 						<div class="card"> -->
<!-- 						<a href="#"> <img class="imgs" -->
<%-- 								src="<c:url value='/data/images/Taiwan_streetFood/steak.jpg'/>"></a> --%>
						
<!-- 							<div class="card-body"> -->
<!-- 								<h5 class="card-title font "> -->
<!-- 									招牌沙朗 -->
<!-- 								</h5> -->
<!-- 								<p class="card-text"></p> -->
<!-- 																<a href="#" class="btn btn-primary ml-5">今晚想來點</a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->

		<!-- Copyright ============================== -->
<!-- 		<div class="copyright bg-dark text-white text-center p-3"> -->
<!-- 			Copyright © 2021 Yachi . All rights reserved.</div> -->

	<!-- -------------------------------引入共同的頁尾---------------------------------------- -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	<!-- -------------------------------引入共同的頁尾----------------------------------------- -->

		<!-- Modal -->
		<!-- 		<div class="modal fade" id="myModal" tabindex="-1" -->
		<!-- 			aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
		<!-- 			<div class="modal-dialog"> -->
		<!-- 				<div class="modal-content"> -->
		<!-- 					<div class="modal-header"> -->
		<!-- 						<h5 class="modal-title" id="exampleModalLabel">Modal title</h5> -->
		<!-- 						<button type="button" class="close" data-dismiss="modal" -->
		<!-- 							aria-label="Close"> -->
		<!-- 							<span aria-hidden="true">&times;</span> -->
		<!-- 						</button> -->
		<!-- 					</div> -->
		<!-- 					<div class="modal-body">...</div> -->
		<!-- 					<div class="modal-footer"> -->
		<!-- 						<button type="button" class="btn btn-secondary" id="close"> -->
		<!-- 							Close</button> -->
		<!-- 						<button type="button" class="btn btn-primary">Save -->
		<!-- 							changes</button> -->
		<!-- 					</div> -->
		<!-- 				</div> -->
		<!-- 			</div> -->
		<!-- 		</div> -->
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous">
		
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous">
		
	</script>
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<script>
		$(function() {

			// 鼠標下滾，header消失(還有bug，當f5 無法判斷header是否top=0)
			// $(document).on('mousewheel DOMMouseScroll',function(e){
			//    //判斷鼠標是向下還是向上(藉由e.originalEvent.wheelDelta)，正值向上負值向下
			//     let delta = (e.originalEvent.wheelDelta &&
			//                      (e.originalEvent.wheelDelta > 0 ? 1 : -1)) ||  // chrome & ie &其它
			//     (e.originalEvent.detail && (e.originalEvent.detail > 0 ? -1 : 1));  // firefox
			//     // console.log(e);
			//     // console.log(delta);
			//     //向上滾
			//     if(delta > 0){
			//         //當向上滾時，必須把.tab 的設定值恢復成預設值，否則會無法呈現原本樣子
			//         if($('header').offset().top === 0){
			//             $('.tab').css({
			//                 position:'static',
			//                 backgroundColor:'transparent',
			//                 boxShadow:'none',
			//             })
			//             //因為是針對nav, .search變透明
			//             //所以往上滾時，對象也要針對它們，而不是header標籤 
			//             $('nav, .search').css({   
			//             transition:'.5s',
			//             opacity:'1',
			//             });
			//         }
			//     //向下滾
			//     }else if(delta < 0){
			//         $('nav, .search').css({
			//             opacity:'0',
			//             transition:'.2s'
			//         });
			//         $('.tab').css({
			//             width:'100%',
			//             position:'absolute', //須為absolute 才能top=0 
			//             top:'0',
			//             backgroundColor:'rgba(255,255,255,0.9)',
			//             boxShadow:'2px 2px 2px 1px rgba(0, 0, 0, 0.1)',
			//         })

			//     }
			// })

			// // jQ入口函數會自動觸發
			// $('html').scrollTop(0);

			//可以把css包成class 寫在css檔裡面，利用addClass 與 removerClass 有效縮減程式碼
			//考慮之後還會更改，目前先暫時寫在這邊 2/10 
			//使用此方式，還是會出現上述程式的問題(重整後卷軸不在上方卻還是跑出全部hearder)

			$(window).scroll(function() {
				//卷軸在頂部時scroll會=0 ，故只要判斷是否為0即可，做出header一捲動就變化的效果
				let scroll = $(window).scrollTop();
				console.log(scroll);
				if (scroll >= 1) {
					$('nav, .search').css({
						opacity : '0',
						transition : '.2s'
					});
					$('.tab').css({
						width : '100%',
						position : 'absolute', //須為absolute 才能top=0 
						top : '0',
						backgroundColor : 'rgba(255,255,255,0.9)',
						boxShadow : '2px 2px 2px 1px rgba(0, 0, 0, 0.1)',
					})
				} else {
					$('.tab').css({
						position : 'static',
						backgroundColor : 'transparent',
						boxShadow : 'none',
					})
					//因為是針對nav, .search變透明
					//所以往上滾時，對象也要針對它們，而不是header標籤 
					$('nav, .search').css({
						transition : '.5s',
						opacity : '1',
					});
				}
			})

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
						// stop()  沒有加好像效果一樣???
						$('.tab-panel').eq(index).stop().fadeIn('slow').show()
								.siblings().hide();

					}, function() {
						/* 第二個方法處理滑鼠移開事件 */
						$(this).removeClass('liColor');
						$('.tab-panel').hide();
					})

			// 當鼠標移到出現的區塊時，區塊仍不會消失
			$('.tab-panel').hover(function() {
				index = $(this).index();
				$(this).css('background-color', 'white').show();
				$('.tab-list a').eq(index).addClass('liColor');
			}, function() {
				$(this).hide();
				$('.tab-list a').eq(index).removeClass('liColor');
			})

		})
	</script>
	<script>
		const submitBtn = document.getElementById('submit');
		submitBtn.onclick = function() {
			console.log('clicked');
			$('#myModal').modal('show');
		}

		const closeBtn = document.getElementById('close');
		closeBtn.onclick = function() {
			$('#myModal').modal('hide');
		}
	</script>


	<!-- Log in script==================== -->
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<script>
		$(function() {

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
	<script>
	 AOS.init();
	</script>
</body>

</html>

<!-- 僅供學術研究使用 如有侵權煩請告知 E-mail: a830425tw@gmail.com -->
<!-- 僅供學術研究使用 如有侵權煩請告知 E-mail: a830425tw@gmail.com -->
<!-- 僅供學術研究使用 如有侵權煩請告知 E-mail: a830425tw@gmail.com -->