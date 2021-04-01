<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>廣告資訊</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value='/_00_util/allUtil/css/background.css'/>">
    <link rel="stylesheet" href="<c:url value='/_00_util/adminUtil/css/admin_adinfo.css'/>">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@2.4.21/dist/css/themes/splide-sea-green.min.css">
</head>

<body>
	<!-- 引入共同的頁首 -->
	
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	
    <div class="administrator container">
        <div class="row">
            <!-- 功能選單開始 -->
			<jsp:include page="/WEB-INF/views/_00_util/adminUtil/jsp/admin.jsp" />
			<!-- 功能選單結束 -->
            <main class="col-8">
                <div class="adinfo">
                    <div>
                        <fieldset>    
                            <legend align="center">近期廣告</legend>
                            <div class="splide">
                            	<div class="splide__track">
                            		<ul class="splide__list">
		                                <li class="splide__slide"><img src="https://picsum.photos/150/150" class="ad-photo"></li>
		                                <li class="splide__slide"><img src="https://picsum.photos/150/150" class="ad-photo"></li>
		                                <li class="splide__slide"><img src="https://picsum.photos/150/150" class="ad-photo"></li>
		                                <li class="splide__slide"><img src="https://picsum.photos/150/150" class="ad-photo"></li>
		                                <li class="splide__slide"><img src="https://picsum.photos/150/150" class="ad-photo"></li>                          
		                            </ul>
	                            </div>
                            </div>
                        </fieldset>
                    </div>
                    <div>
                        <fieldset>
                            <legend align="center">預定廣告</legend>
	                           <img src="https://picsum.photos/180/180" class="ad-photo">
	                           <img src="https://picsum.photos/180/180" class="ad-photo">
	                           <img src="https://picsum.photos/180/180" class="ad-photo">
                        </fieldset>
                    </div>
                    <div class="adinfo-mid">
                        <label for="">廣告名稱 :</label>
                        <input type="text" placeholder="請輸入酷炫廣告名稱" maxlength="30" style="margin-left: 2.8rem";>
                    </div>
                    <div class="adinfo-mid">
                        <label for="">廣告上架日期 :</label>
                        <input type="date" value="1" step="1" min="0" style="width: 130px; margin-left: 0.3rem";> 
                        <label for="" style="margin-left: 0.5rem"> ~ </label>
                        <input type="date" value="1" step="1" min="0" style="width: 130px; margin-left: 0.5rem";>
                    </div>
                    <div class="adinfo-mid">
                        <label for="">廣告網址 :</label>
                        <input type="text" placeholder="請輸入酷炫廣告網址" maxlength="30" style="margin-left: 2.8rem";>
                    </div>
                    <div class="adinfo-mid">
                        <label for="">優惠券圖片:</label>
                        <div style="display: flex;">
                            <label for="file">
                                <i class="fas fa-image adinfo-photo" style="margin-top: 2rem; font-size: 18px;">
                                    ☛選擇圖片<input type="file" id="file" accept=".jpeg,.png" style="display: none;">
                                </i>
                            </label>
                            <div class="item">
                                <img src="https://picsum.photos/500/250" id="headImg" style="margin-left: 1.8rem; margin-top: -25px;">
                            </div>
                        </div>
                        <div>
                            <a href="#">
                                <button class="adinfo-button">儲存</button>
                            </a>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
    <!-- -------------------------------引入共同的頁尾---------------------------------------- -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	<!-- -------------------------------引入共同的頁尾----------------------------------------- -->
	
	<script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@2.4.21/dist/js/splide.min.js"></script>
    <script>

        document.addEventListener( 'DOMContentLoaded', function () {
            new Splide( '.splide', {               
            	perPage: 3,
            	rewind : true,
        	} ).mount();
            } );

	</script>
</body>
</html>