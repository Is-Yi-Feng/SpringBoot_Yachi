<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<!--     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous"> -->
<!--     <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script> -->
<!--     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script> -->
</head>
<style>
	copyright{
		margin-top: 100px;
	}
	.logo img{
		max-width: 100px;
	}
	hr{
		border-color: #aaa;
		margin-top: 10px;
	}
</style>
<body>
	<div data-aos="fade-zoom-in"
     data-aos-easing="ease-in-back"
     data-aos-delay="200"
     data-aos-offset="0">
	
	<footer>
		<hr class="">
		<div class="copyright text-dark text-center p-1">
			<div class="logo">
				<a href="<c:url value='/home' />"> 
				<img src="<c:url value='/data/images/smallPic/yachiLogo50.png'/>">
			</a>
				<span>Copyright © 2021 Yachi . All rights reserved.</span>
		</div>
			<p>※國立臺北科技大學Java & Android程式設計人才養成班_第15屆第三組※<br>
				※僅供學術研究使用，如有侵權請來信告知※<br>
				※信箱:yachijava015@gmail.com※<br>
			</p>
		</div>
	</footer>
	</div>
	<script>
  		AOS.init();
	</script>
</body>
</html>