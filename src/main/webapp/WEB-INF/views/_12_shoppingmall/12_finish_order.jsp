<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/_00_util/allUtil/css/normalize.css'/>">
	<link rel="stylesheet" href="<c:url value='/_00_util/allUtil/css/background.css'/>">
    <link rel="stylesheet" href="<c:url value='/_00_util/shoppingMallUtil/css/12_finish_order.css'/>">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="<c:url value='/_00_util/allUtil/javascript/jquery-3.5.1.js'/>"></script>
	<script src="<c:url value='/_00_util/allUtil/javascript/jquery-ui.js'/>"></script>


<title>訂購成功</title>
</head>
<body>
	
	<!-- -----------------------------------------引入共同的頁首--------------------------------------------- -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	<!-- -----------------------------------------引入共同的頁首--------------------------------------------- -->
	
	
	<!-----------------------------訂單流程圖----------------------------- -->
	  <div class="container chart_box">
		  <div class="row justify-content-center chart">
			<div data-aos="fade-up"
			data-aos-duration="1000">
			  <ul class="shop_list d-flex ">
					<li class="circle_box step1">
						<span>01</span>	
						<span class="chart_name">購物清單</span>
					</li>
				
				<li class="circle_box step2">
					<span>02</span>
					<span class="chart_name">填寫資料</span>
				</li>
				<li class="circle_box step3">
					<span>03</span>
					<span class="chart_name">完成訂單</span>
				</li>
			  </ul>
			  </div>
			
		  </div>
	  </div>
	  <!-----------------------------訂單流程圖----------------------------- -->

	
	
	
	<div class="successOrder shadow mb-5 bg-white rounded">

        <!-- 標頭 -->
        <div class="successTitle">
            <div class="icon1">
                <i class="far fa-check-circle success_icon"></i>
            </div>
            <span>Yachi已經收到您的訂單囉！</span>
            <h2>訂單編號：${orderBeanNew.orderNumber}</h2>
        </div>
        <!-- 標頭 -->
        
        <!-- 會員中心連結 -->
        <div class="successContent">
            <span>可至 <a href="<c:url value="/_23_orderProcess/orderList"/>">會員中心-訂單查詢</a> 查詢相關明細<br>
                  或至您的 <a href="https://www.google.com/gmail/">電子信箱<img
						src="<c:url value='/data/images/smallPic/search.png'/>" alt=""></a> 查收訂單通知信 <br>
                   謝謝您的光臨！

            </span>
            
        </div>
        <!-- 會員中心連結 -->

        <!-- 回商城首頁 -->
        <div class="backToShopBtn">
            <a href="<c:url value='/DisplayPageProducts'/>" class="btn btn-light btn-md active" role="button" aria-pressed="true">商城首頁</a>
        </div>
        <!-- 回商城首頁 -->
        
    </div>
    <!-- -------------------------------引入共同的頁尾---------------------------------------- -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	<!-- -------------------------------引入共同的頁尾----------------------------------------- -->
    <script>
        $(function () {
          
            // setInterval(function (){
            setTimeout(function(){
                $('.successTitle .success_icon').effect( "shake" )
            },300)
            // },2000)
    });
    </script>
    <script>
	AOS.init();
	</script>
</body>
</html>