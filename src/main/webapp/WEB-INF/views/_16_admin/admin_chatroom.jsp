<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>客服回應</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value='/_00_util/adminUtil/css/normalize.css'/>">
     <link rel="stylesheet" href="<c:url value='/_00_util/allUtil/css/background.css'/>">
    <link rel="stylesheet" href="<c:url value='/_00_util/adminUtil/css/admin_chatroom.css'/>">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    

</head>
<body>
	<!-- 引入共同的頁首 -->
	
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	
	<div class="chatroom container">
            <div class="row">
            <!-- 功能選單開始 -->
			<jsp:include page="/WEB-INF/views/_00_util/adminUtil/jsp/admin.jsp" />
			<!-- 功能選單結束 -->
                <main class="col-8">
                    <div class="dialogue">
                        <div class="user remote">
                            <div class="avatar">
                                <div class="pic">
                                    <img src="https://picsum.photos/100/100" alt="">
                                </div>
                                <div class="name">Shawn</div>
                            </div>
                            <div class="txt">
                                Hey, Senorita~
                            </div>
                        </div>
                        <div class="user local">
                            <div class="avatar">
                                <div class="pic">
                                    <img src="https://picsum.photos/50/50" alt="">
                                </div>
                                <div class="name">Camila</div>
                            </div>
                            <div class="txt">
                                What's wrong?
                            </div>
                        </div>
                        <div class="user remote">
                            <div class="avatar">
                                <div class="pic">
                                    <img src="https://picsum.photos/100/100" alt="">
                                </div>
                                <div class="name">Shawn</div>
                            </div>
                            <div class="txt">
                                Do you have a date on the weekend?
                            </div>
                        </div>
                        <div class="user local">
                            <div class="avatar">
                                <div class="pic">
                                    <img src="https://picsum.photos/50/50" alt="">
                                </div>
                                <div class="name">Camila</div>
                            </div>
                            <div class="txt">
                                Ooh la la la~
                            </div>
                        </div>
                        <div class="user remote">
                            <div class="avatar">
                                <div class="pic">
                                    <img src="https://picsum.photos/100/100" alt="">
                                </div>
                                <div class="name">Shawn</div>
                            </div>
                            <div class="txt">
                                Do you have a date on the weekend?
                            </div>
                        </div>
                        <div class="user local">
                            <div class="avatar">
                                <div class="pic">
                                    <img src="https://picsum.photos/50/50" alt="">
                                </div>
                                <div class="name">Camila</div>
                            </div>
                            <div class="txt">
                                Ooh la la la~
                            </div>
                        </div>

                    </div>
                </main>
            </div>
        </div>
<!-- -------------------------------引入共同的頁尾---------------------------------------- -->
<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
<!-- -------------------------------引入共同的頁尾----------------------------------------- -->
</body>
</html>