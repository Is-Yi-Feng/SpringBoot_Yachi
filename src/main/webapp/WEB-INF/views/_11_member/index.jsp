<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/reset.css" type="text/css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    


<style>

</style>
</head>
<body style="background-color: #F3F8F2;">

	<!-- 引入共同的頁首 -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />


	<p>首頁測試用會員屬性表</p>
	<p>member requestScope:${requestScope.LoginOK}</p> 
    <p>member sessionScope:${sessionScope.LoginOK}</p> 
    
    <p>AdminLoginOK requestScope:${requestScope.AdminLoginOK}</p> 
    <p>AdminLoginOK sessionScope:${sessionScope.AdminLoginOK}</p> 

	<c:if test="${!empty LoginOK}">
		<a href="#"><font>登入成功 ! </font></a><br>
	    <a href="#"><font>${LoginOK.fullname} 歡迎回來 !</font></a>
<!-- 	    <script type="text/javascript"> -->
<!-- // 	    	$(document).ready(function(){ -->
					
<!-- // 	    		alert("登入成功 ! "); -->

<!-- // 	    	}); -->
<!-- 	    </script> -->
	</c:if>
	<br>
	<c:if test="${!empty errorInfo}">
		<p>這個帳號 : ${errorInfo} 已經有人註冊了</p>
		<p>${msg}</p>
	</c:if>
		
	<img src="<c:url value='/_00_init/getMemberImage?memberId=${LoginOK.memberId}'/>"
		   id="headImg" height='200px' width='200px'>
	
	
	
	<p>status : ${status}</p>
	<p>code : ${code}</p>	   
		   
		   
</body>
</html>
