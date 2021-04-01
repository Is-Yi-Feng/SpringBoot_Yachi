<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check Shop</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/normalize.css'/>">
 <link rel="stylesheet" href="<c:url value='/_00_util/allUtil/css/background.css'/>">
<link rel="stylesheet"
	href="<c:url value='/_00_util/adminUtil/css/admin_checkShop.css'/>">
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
    <script src="<c:url value='/_00_util/allUtil/javascript/enscroll-0.6.2.min.js'/>"></script>
</head>
<body>

	<!-- 引入共同的頁首 -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	<!-- 頁首結束 -->
	
	    <div class="container">
        
        <div class="row">
          	<!-- 功能選單開始 -->
          	<jsp:include page="/WEB-INF/views/_00_util/adminUtil/jsp/admin.jsp" />
			<!-- 功能選單結束 -->
			
            <div class="col-8">
                <!-- 標頭 -->
                <div class="row py-3 mb-4 border-bottom" id="shopTitle">
                    <div class="col-4 row1_item" >
                        <div class="d-flex justify-content-start">
                            <span>商家名稱</span>
                        </div>
                    </div>

                    <div class="col-4 row1_item border-right-0 border-left-0" >
                        <div class="d-flex justify-content-start">
                            <span>申請日期</span>
                        </div>
                    </div>

                    <div class="col-4 row1_item" >
                        <div class="d-flex justify-content-start">
                            <span>簡介</span>
                        </div>
                    </div>
                </div>
            

                <!-- 商家紀錄 -->
                <div class="row shopList">
                    <div class="col-4 row1_item border-top-0" >
                        <div class="d-flex justify-content-start">
                            <span>方家雞肉飯</span>
                        </div>
                    </div>

                    <div class="col-4 row1_item border-right-0 border-left-0 border-top-0" >
                        <div class="d-flex justify-content-start">
                            <span>2021/01/01</span>
                        </div>
                    </div>

                    <div class="col-4 row1_item border-top-0" >
                        <div class="d-flex justify-content-start">
                            <span class="d-inline-block text-truncate" style="max-width: 150px;">
                                歸納我喜歡的火雞肉飯，最大關鍵是：肉優、飯Q、雞油香，最重要的就是油蔥酥呀！本文整理近年來在嘉義走跳吃過的火雞肉飯食記，分享給口味
                            </span>
                        </div>
                    </div>
                </div>


                <!-- 商家詳細資料 -->
                <div class="row shopDetail">

                    <div class="col-6 row2_item mt-2 mb-0">
                        商家名稱 :
                    </div>

                    <div class="col-6 row2_item mt-2 mb-0">
                        商家電話 :
                    </div>

                    <div class="col-6 row2_item my-2">
                        商家地址 :
                    </div>

                    <div class="col-6 row2_item my-2">
                        商家營業時間 :
                    </div>

                    <div class="col-3 row2_item my-1">
                        <img src="https://picsum.photos/160/80" alt="picture">
                    </div>

                    <div class="col-3 row2_item my-1">
                        <img src="https://picsum.photos/160/80" alt="picture">
                    </div>

                    <div class="col-3 row2_item my-1">
                        <img src="https://picsum.photos/160/80" alt="picture">
                    </div>

                    <div class="col-3 row2_item my-1">
                        <div class="row">

                            <div class="col-12 mb-2 d-flex justify-content-end">
                                <div>
                                    <button type="button" class="btn btn-primary">確認</button>
                                </div>
                            </div>

                            <div class="col-12 mb-2 d-flex justify-content-end">
                                <div>
                                    <button type="button" class="btn btn-secondary">返回</button>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>

            </div>

        </div>
        
    </div>
<!-- -------------------------------引入共同的頁尾---------------------------------------- -->
<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
<!-- -------------------------------引入共同的頁尾----------------------------------------- -->

	
</body>
</html>