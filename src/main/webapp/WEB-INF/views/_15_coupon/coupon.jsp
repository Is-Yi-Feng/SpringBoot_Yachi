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
	href="<c:url value='/_00_util/shoppingMallUtil/css/4_shopping_cart.css'/>">
<link rel="stylesheet"
	href="<c:url value='/_00_util/shoppingMallUtil/css/2_mix.css'/>">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	 
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

<link rel="stylesheet"
	href="<c:url value='/WEB-INF/views/_00_util/allUtil/css/reset.css'/>">
<link rel="stylesheet"
	href="<c:url value='/WEB-INF/views/_00_util/homeUtil/css/home.css'/>">
<link rel="stylesheet" href="<c:url value='/test/reset.css'/>">
<link rel="stylesheet" href="<c:url value='/test/header.css'/>">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>

<style>


button, .button {
    border: none;
    line-height: 2.8rem;
    text-align: center;
    display: block;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
    font-size: 1rem;
    outline: none !important;
    padding: 0;
}

.button-org {
    background-color: #FF8800;
    color: #FFFFFF !important;
}

.button-org:hover {
    background-color: #F4880C;
    color: #FFFFFF;
    cursor: pointer;
}

.i-newuser {
    background-image: url(data:image/svg+xml;charset=US-ASCII,%3C%3Fxml%20version%3D%221.0%22%20encoding%3D%22UTF-8%22%20standalone%3D%22no%22%3F%3E%0A%3Csvg%20width%3D%2260px%22%20height%3D%2260px%22%20viewBox%3D%220%200%2060%2060%22%20version%3D%221.1%22%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20xmlns%3Axlink%3D%22http%3A//www.w3.org/1999/xlink%22%3E%0A%20%20%20%20%3C%21--%20Generator%3A%20Sketch%2050.2%20%2855047%29%20-%20http%3A//www.bohemiancoding.com/sketch%20--%3E%0A%20%20%20%20%3Ctitle%3Etabbar_e_icon@1.5x%3C/title%3E%0A%20%20%20%20%3Cdesc%3ECreated%20with%20Sketch.%3C/desc%3E%0A%20%20%20%20%3Cdefs%3E%3C/defs%3E%0A%20%20%20%20%3Cg%20id%3D%22channel%22%20stroke%3D%22none%22%20stroke-width%3D%221%22%20fill%3D%22none%22%20fill-rule%3D%22evenodd%22%3E%0A%20%20%20%20%20%20%20%20%3Cg%20id%3D%22%u5546%u54C1%u9801%u9762%28%u7D19%u672C%u9910%u5238%29%22%20transform%3D%22translate%28-945.000000%2C%20-780.000000%29%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cg%20id%3D%22%u4E0B%u8F09%u5340%u584A%22%20transform%3D%22translate%28930.000000%2C%20750.000000%29%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cg%20id%3D%22tabbar_e_icon%22%20transform%3D%22translate%2815.000000%2C%2030.000000%29%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cg%20id%3D%22Group-2%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Ccircle%20id%3D%22Oval-2%22%20fill%3D%22%23FF8800%22%20cx%3D%2230%22%20cy%3D%2230%22%20r%3D%2230%22%3E%3C/circle%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cpath%20d%3D%22M39.2785283%2C14.3199471%20C39.2785283%2C14.3199471%2030.0597955%2C12.6576095%2027.0559388%2C12.1381289%20C24.052082%2C11.6186484%2022.8608975%2C14.6316354%2022.8608975%2C14.6316354%20C22.8608975%2C14.6316354%2018.5104842%2C39.0472198%2018.1479498%2C41.6446224%20C17.7336247%2C44.242025%2020.6339002%2C45.3848822%2020.6339002%2C45.3848822%20C20.6339002%2C45.3848822%2029.3865173%2C46.9952718%2033.0118616%2C47.6186484%20C36.637206%2C48.190077%2037.3622749%2C44.8654017%2037.3622749%2C44.8654017%20C37.3622749%2C44.8654017%2041.4019443%2C22.164103%2041.9716413%2C18.6316354%20C42.5931289%2C15.0472198%2039.2785283%2C14.3199471%2039.2785283%2C14.3199471%20L39.2785283%2C14.3199471%20Z%20M29.3865173%2C15.6186484%20C29.4383079%2C15.3589082%2029.6972611%2C15.151116%2029.9562143%2C15.203064%20L35.2906495%2C16.0861809%20C35.5496027%2C16.1381289%2035.7049746%2C16.3978692%2035.653184%2C16.6576095%20C35.6013933%2C16.9173497%2035.3424402%2C17.1251419%2035.083487%2C17.0731939%20L29.7490517%2C16.190077%20C29.5418892%2C16.1381289%2029.3347267%2C15.8783887%2029.3865173%2C15.6186484%20L29.3865173%2C15.6186484%20Z%20M27.729217%2C44.2939731%20C26.9523575%2C44.2939731%2026.2790793%2C43.6705965%2026.2790793%2C42.8394276%20C26.2790793%2C42.0602069%2026.9005669%2C41.3848822%2027.729217%2C41.3848822%20C28.5060765%2C41.3848822%2029.1793548%2C42.0082588%2029.1793548%2C42.8394276%20C29.1793548%2C43.6705965%2028.5578672%2C44.2939731%2027.729217%2C44.2939731%20L27.729217%2C44.2939731%20Z%20M36.3264622%2C41.0731939%20L20.374947%2C38.216051%20L24.052082%2C17.4368302%20L40.0553878%2C20.2939731%20L36.3264622%2C41.0731939%20L36.3264622%2C41.0731939%20Z%22%20id%3D%22Shape%22%20fill%3D%22%23FFFFFF%22%20transform%3D%22translate%2830.078351%2C%2029.881306%29%20rotate%28-10.000000%29%20translate%28-30.078351%2C%20-29.881306%29%20%22%3E%3C/path%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cpath%20d%3D%22M29.2413561%2C25.295%20L29.2413561%2C34.9978571%20C29.2413561%2C35.3935714%2029.5603864%2C35.7121429%2029.9534773%2C35.7121429%20C30.3479924%2C35.7121429%2030.6655985%2C35.3935714%2030.6655985%2C34.9978571%20L30.6655985%2C25.295%20L33.723447%2C28.3607143%20C33.8630227%2C28.5007143%2034.0453258%2C28.5692857%2034.2262045%2C28.5692857%20C34.4085076%2C28.5692857%2034.5908106%2C28.5007143%2034.7303864%2C28.3607143%20C35.0081136%2C28.0821429%2035.0081136%2C27.6307143%2034.7303864%2C27.3507143%20L30.4576591%2C23.0664286%20C30.3935682%2C23.0007143%2030.3138106%2C22.9464286%2030.2255076%2C22.9107143%20C30.05175%2C22.8392857%2029.8566288%2C22.8392857%2029.6828712%2C22.9107143%20C29.5945682%2C22.9464286%2029.5148106%2C23.0007143%2029.4492955%2C23.0664286%20L25.1779924%2C27.3507143%20C24.9002652%2C27.6307143%2024.9002652%2C28.0821429%2025.1779924%2C28.3607143%20C25.4557197%2C28.6392857%2025.9072045%2C28.6392857%2026.1849318%2C28.3607143%20L29.2413561%2C25.295%20Z%22%20id%3D%22Fill-1%22%20stroke%3D%22%23FFFFFF%22%20stroke-width%3D%220.5%22%20fill%3D%22%23FFFFFF%22%20transform%3D%22translate%2829.954189%2C%2029.284643%29%20rotate%28-180.000000%29%20translate%28-29.954189%2C%20-29.284643%29%20%22%3E%3C/path%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C/g%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C/g%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3C/g%3E%0A%20%20%20%20%20%20%20%20%3C/g%3E%0A%20%20%20%20%3C/g%3E%0A%3C/svg%3E);
    background-repeat: no-repeat;
    width: 80px;
    height: 60px;
    margin-top: 0.3rem;
}

.t-11 {
    font-size: 1.6rem;
     text-align:center; 
}

/*  h1, h2, h3, h4, h5, h6 {  */
/*      margin-top: 0;  */
/*      line-height: 1.5 !important;  */
/*      color: #000000;  */
/*      font-family: 'Noto Sans TC', 'Microsoft JhengHei', 'Microsoft YaHei', 'Helvetica Neue', 'Helvetica', 'PingFang TC', 'Roboto', sans-serif, Arial !important;  */
/*      font-weight: 300;  */
/*  }  */



/* .dropdown_intro ul.fine_print_area li a:hover, .dropdown_intro ul.fine_print_area li button:hover { */
/*     color: #FF8800 !important; */
/*     text-decoration: underline !important; */
/* } */


/* .i-smile-4-1 { */
/*     background-image: url(../img/smilingface-4-1.png); */
/* } */
/* .prod-smile-icon { */
/*     padding-left: 92px; */
/*     background-repeat: no-repeat; */
/*     background-position: 0 1px; */
/* } */

.t-orange, .label-smile {
    color: #FF8800 !important;
}



</style>
</head>

<body style="background-color: #F3F8F2;">

	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />


	<div class="container">
<!-- 		<button id="myBtn" class="page myBtn gotop" title="Go to top" -->
<!-- 			style="display: block;"> -->
<!-- 			<i class="fa fa-chevron-up t-white" aria-hidden="true"></i> <span>TOP</span> -->
<!-- 		</button> -->
		<div class="row">
			<div class="col-md-8 my-3">
				<div class="prodInfo">
					<h1>${coupon.coupon_name}</h1>
					<h2 class="t-namered t-11">
<!-- 						<div class="icon bubble mr-1"> -->
<!-- 							<span class="t-08 t-white"> 7.5折 </span> -->
<!-- 						</div> -->
<!-- 						A.精選酥嫩腰內豬排特餐 / B.名古屋味噌雞排特餐 / C.香潤里脊豬排特餐 / D.特選風味雙人特餐 -->
					</h2>
					<div class="d-flex mt-2">
						<div class="d-flex tagBox product-tag">

							<div class="tag-square"
								style="color: #FF5D00; border: 1px solid #FF5D00;">破千銷售</div>




						</div>

						<div
							class="fas fa-star label-smile prod-smile-icon i-smile-4-1 font-weight-bold mt-1 ml-1">
							<span class="t-10 number">4</span> <span class="t-085">.5</span>
							<span class="t-085" style="margin-left: -0.4rem;">
								&nbsp;(1389) </span>
						</div>

					</div>
					<div id="carouselIndicators1"
						class=" product-carousel carousel slide carousel-fade mt-2 relative"
						data-ride="carousel">
						<div class="map-subject"></div>
						<ol class="carousel-indicators">
							<li data-target="#carouselIndicators1" data-slide-to="0" class="active"></li>
							<li data-target="#carouselIndicators1" data-slide-to="1" class=""></li>

						</ol>
						<div class="carousel-inner">
							<div class="carousel-item active">
									<img class="d-block w-100"
										src="<c:url value='/getCouponPicture/${coupon.coupon_id}'/>">
								</div>
								
							
								<div class="carousel-item">
									<img class="d-block w-100"
										src="<c:url value='/getCouponPicture/${coupon.coupon_id}'/>">
								</div>
							

							</div>

							<!-- Left and right controls -->
							<a class="carousel-control-prev" href="#carouselIndicators1"
								role="button" data-slide="prev"> <span
								class="carousel-control-prev-icon" aria-hidden="true"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="carousel-control-next" href="#carouselIndicators1"
								role="button" data-slide="next"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>
						<div class="d-flex my-3">


							<div class="ml-auto">
								<div class="d-flex">
									<a class="ml-2 share" data-type="facebook" data-city="1"
										data-pid="268916" title="利用 Facebook 分享"
										data-product_name="A.精選酥嫩腰內豬排特餐 / B.名古屋味噌雞排特餐 / C.香潤里脊豬排特餐 / D.特選風味雙人特餐"
										href="#" onclick="return false;"> <i
										class="social-icon i-social-facebook"></i>
									</a> <a class="ml-2" href="https://line.me/R/msg/text/"
										target="_blank"> <i class="social-icon i-social-line"></i>
									</a>
									<!--<a class="ml-2" href="mailto:?subject=勝博殿現在GOMAJI有優惠哦！&body=【勝博殿】現有優惠https://www.gomaji.com/store/55885?pid=268916" title="E-mail">-->
									<!--<i class="social-icon i-social-email"></i>-->
									<!--</a>-->

									<!--<a class="ml-2" href="javascript:void(0);" onclick="javascript:window.location.href='mailto:?subject=勝博殿現在GOMAJI有優惠哦！&body=【勝博殿】現有優惠https://www.gomaji.com/store/55885?pid=268916'; return false;" title="E-mail"><i class="social-icon i-social-email"></i>-->
									<!--</a>-->
									<a class="ml-2" id="share-copy" data-fancybox=""
										data-src="#social-copy-popup" href="javascript:;" title="分享連結">
										<i class="social-icon i-social-copy"></i>
									</a> <input type="hidden" name="copy" id="copy"
										value="https://www.gomaji.com/store/55885?pid=268916">
								</div>
							</div>
						</div>
						<!-- End:channel-header -->


						<div class="tabs mt-3" id="info">
							<h3 class="t-12 mb-3">
								<i class="icon i-info mr-2"></i>兌換說明
							</h3>
							<div class="d-flex tagBox product-tag ml-2">
								<div class="tag-square t-dgray b-gray">免預約</div>
								<div class="tag-square t-dgray b-gray">限內用</div>
							</div>

							<div class="correctContent">
								<div class="dropdown_intro">
									<ul class="fine_print_area">
										<li>優惠期間為自 2021 年 02 月 11 日 起兌換至 2021 年 12 月 31 日，平假日皆可使用</li>
										<li>其他<br>1.不得跨店使用 <br>2.本優惠僅供內用<br>
										</li>
										<li>公司名稱：Yachi(股)有限公司<br>負責人：Jason<br>客服電話：0800-123-123<br>E-mail：Yachi123456789@gmail.com<br>營業網址：http://www.yachi.com.tw/
										</li>
										
										
										<li>需遵守
											<button type="button"
												class="t-orange d-inline-block "
												data-toggle="popover"
												data-content="                                 不能與其他優惠合併,                                  無法兌換現金,                                  逾期未兌換可退費                                                                           "
												data-original-title="" title="">兌換券須知</button> 及店家現場消費規定
										</li>
									</ul>
								</div>
							</div>
							<hr>
						</div>
						
					</div>
					<!-- End:channel-header -->
				</div>
				<!-- End:left -->
				<div class="col-md-4 my-3 relative">
					<div id="purchasePanel-sticky-wrapper" class="sticky-wrapper"
						style="height: 373px;">
						<div class="purchase" id="purchasePanel">
							<div class="purchaseBox border">
								<h3 class="t-11">${coupon.coupon_name}</h3>
								<hr>
<!-- 								<h3 class="t-095 t-namered">A.精選酥嫩腰內豬排特餐 / B.名古屋味噌雞排特餐 / -->
<!-- 									C.香潤里脊豬排特餐 / D.特選風味雙人特餐</h3> -->

								<div class="pricewrap">
									<div class="d-flex flex-row">
<!-- 										<div class="discount t-085 ml-auto calc-discount" -->
<!-- 											style="color: red; margin-top: 0.08rem;" data-city="1" -->
<!-- 											data-discount="7.5898520084567">7.5 折</div> -->
<!-- 										<div class="priceBox"> -->
<!-- 											<div class="price d-flex justify-content-end"> -->
<!-- 												<div class="original line-through">$473</div> -->
<!-- 												<div class="current"> -->
<!-- 													$359 <span class="t-09">起</span> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->
									</div>
								</div>

								<div class="purchase-button mt-3 text-center">
								
<!-- 	=====================================沒登入就會隱藏按鈕======================================= -->
<%-- 								<c:if test="${!empty LoginOK}"> --%>
									<a id="collect" class="button button-org mb-2" href="<spring:url value='/addfavorite/add/${coupon.coupon_id}'/>" data-fancybox=""
										data-src="#purchaseBox" rel="buy"> 收藏 </a>
										
											<a id="using" class="button button-org mb-2" href="<spring:url value='/useCoupon/${coupon.coupon_id}'/>" data-fancybox=""
										data-src="#purchaseBox" rel="buy"> 使用優惠劵 </a>
<%-- 										</c:if> --%>
										


									<div class="d-flex justify-content-center">
										<p class="t-red t-10">1345份已販售</p>
									</div>

								</div>
							</div>
							<div class="newuser-coupon border mt-3 p-2">
								<div class="d-flex mt-2">
									<i class="i-newuser ml-2"></i>
									<div>
										<p class="t-09">
											立刻下載APP，輸入邀請碼 <br> <span class="t-red">" Yachi"</span>即可獲得$100點！
										</p>
										<a class="t-085 d-inline-block mb-1 t-orange"
											href="<c:url value='#' />">下載APP</a>
											
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- End:right -->
			</div>
		</div>
		
		<script>

        $(function () {

            const using = document.getElementById('using');
            using.addEventListener('click', function (e) {
                Swal.fire({
                    title: '確定要使用優惠劵嗎?',
                    text: "",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '確定兌換',
                    cancelButtonText: '取消'
                }).then((result) => {
                    if (result.isConfirmed) {
                        Swal.fire(
                            '兌換成功!',
                            '',
                            'success'
                        )
                        sleep(3000);
                        
                        document.location.href="http://localhost:8080/yachi/useCoupon/" + ${sessionScope.coupon.coupon_id};
                    }
                })
            });
            const collect = document.getElementById('collect');
            collect.addEventListener('click', function (e) {
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: '成功收藏優惠卷',
                    showConfirmButton: false,
                    timer: 1500
                })
            });
            
            function sleep(ms) {
            	  return new Promise(resolve => setTimeout(resolve, ms));
            	}
        });
    </script>
		
    </script>  
</body>
</html>

<!-- 僅供學術研究使用 如有侵權煩請告知 E-mail: a830425tw@gmail.com -->
<!-- 僅供學術研究使用 如有侵權煩請告知 E-mail: a830425tw@gmail.com -->
<!-- 僅供學術研究使用 如有侵權煩請告知 E-mail: a830425tw@gmail.com -->
<!-- 僅供學術研究使用 如有侵權煩請告知 E-mail: a830425tw@gmail.com -->
<!-- 僅供學術研究使用 如有侵權煩請告知 E-mail: a830425tw@gmail.com -->
<!-- 僅供學術研究使用 如有侵權煩請告知 E-mail: a830425tw@gmail.com -->