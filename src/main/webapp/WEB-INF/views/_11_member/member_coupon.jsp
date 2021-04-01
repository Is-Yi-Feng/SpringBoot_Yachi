<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
 	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>會員優惠券</title>
   	<link rel="stylesheet" href="<c:url value='/_00_util/memberUtil/css/reset.css'/>">
   	<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
   	<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/background.css'/>">
	<link rel="stylesheet" href="<c:url value='/_00_util/memberUtil/css/member_coupon.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
	
</head>
<body>
	<!-- 引入共同的頁首 -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />

    <!-- 跑馬燈 -->
<!-- 	<div id="Marquee"> -->
<!--         <h3>最新優惠消息:</h3> -->
<!--         <ul id="news"> -->
<!--             <li>東西很貴不要買 !</li> -->
<!--             <li>還沒做完</li> -->
<!--             <li>目前網路商店全館免運</li> -->
<!--         </ul> -->
<!--     </div> -->
    <!-- 跑馬燈結束 -->

    <!-- 左側的會員導覽列 -->
	<div class="main-member">
	<!-- 功能選單開始 -->
	<jsp:include page="/WEB-INF/views/_00_util/memberUtil/jsp/member_aside.jsp" />
	<!-- 功能選單結束 -->
<!--         <aside> -->
<!--             <div class="function"> -->
<!--                 <h3>會員中心</h3> -->
<!-- 				<div class="item"> -->
<%-- 		            <img src='<c:url value='/_00_init/getMemberImage?memberId=${LoginOK.memberId}' /> ' --%>
<!-- 		                  id="headImgg" height='200px' width='200px'>					 -->
<!-- 	            </div> -->
<!--                 <div class="item"> -->
<%--                     <a href="<c:url value='/member/update/${LoginOK.memberId}'/>"> --%>
<!--                         <button><span>基本資料</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="item"> -->
<%--                     <a href="<c:url value='/_23_orderProcess/orderList'/>"> --%>
<!--                         <button><span>訂單查詢</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="item"> -->
<%--                      <a href="<c:url value='/member/keep/coupons'/>"> --%>
<!--                         <button><span>我的優惠券</span></button> -->
<!--                     </a>     -->
<!--                 </div> -->
<!--                 <div class="item"> -->
<%--                     <a href="<c:url value="/queryFavoriteShop"/>"> --%>
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
<%--                      <a href="<c:url value='/doLogout'/>" onclick="return window.confirm('確定登出嗎?');"> --%>
<!--                         <button><span>登出</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </aside> -->

        <!-- 左側的會員導覽列結束 -->

        <!-- 右側的我的優惠券 -->
        <main class="shadow p-3 mb-5 bg-white rounded"> 

            <form action="">

                <div id="hcg_tabs">
    
                    <div id="tabs-nav">
                       <a href="#" class="change">我的優惠券</a>                     
                    </div>
                   
                    <div class="tabs-content">
    
                        <!-- 先讓第一個內容顯示出來 display:block -->
                      <div class="tabs-panel" style="display:block"> 
                        <div class="container">
	                        <div class=" row ml-5" >                            
	                           <c:forEach var='couponlist' items='${coupons}'>   
	                                                                          
	                              <div class="col-5 coupon-shop mt-5 shadow p-4 mb-3 bg-white rounded mr-5">  
	                              <a
							href="<c:url value='/coupon?coupon_id=${couponlist.coupon_id}' />">  
	                                  <img src="<c:url value='/getCouponPicture/${couponlist.coupon_id}' />" >
	                                  </a>
	                              		<a href="<c:url value='/member/delete/${couponlist.coupon_id}'/>" 
	                              		class="remove-product remove-coupon" onclick="return window.confirm('確定移除嗎?')">
	                              		<i class="fas fa-times cancelBtn"></i></a>
	                              </div>
	                              
	                              
	                         </c:forEach>           
	
	
	                        </div>
						</div>

                      </div>
                   
                   
                      
                
                   
                    </div>
                  
                </div>
            </form>

        </main>

    </div>
<!-- -------------------------------引入共同的頁尾---------------------------------------- -->
<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
<!-- -------------------------------引入共同的頁尾----------------------------------------- -->
</body>
</html>