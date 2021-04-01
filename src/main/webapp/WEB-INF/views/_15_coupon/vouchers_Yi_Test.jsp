<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    
    <link rel="stylesheet" href="<c:url value='/_00_util/allUtil/css/normalize.css'/>">
    <link rel="stylesheet" href="<c:url value='/_00_util/shoppingMallUtil/css/4_shopping_cart.css'/>">
    <link rel="stylesheet" href="<c:url value='/_00_util/shoppingMallUtil/css/2_mix.css'/>">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    <script src="<c:url value='/_00_util/allUtil/javascript/jquery-3.5.1.js'/>"></script>
    <script src="<c:url value='/_00_util/allUtil/javascript/jquery-ui.js'/>"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="<c:url value='/WEB-INF/views/_00_util/allUtil/css/reset.css'/>">
<link rel="stylesheet" href="<c:url value='/WEB-INF/views/_00_util/homeUtil/css/home.css'/>">

<link rel="stylesheet" href="<c:url value='/test/reset.css'/>">
<link rel="stylesheet" href="<c:url value='/test/header.css'/>">

</head>
<body>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />

  <div class="row row-cols-1 row-cols-md-3 " style="padding:0px 100px 100px 100px">
  
  	<c:forEach var="coupon" items="${allCoupon}">
  	
	   <div class="col mb-4">
	     <div class="card h-100">
	        <a href=" <c:url value='/vouchers_interface'/>">
	       <img	src="<c:url value='/_00_init/getCouponImage?coupon_id=${coupon.coupon_id}'/>" class="card-img-top" alt="...">
	  	  </a>  
	       <div class="card-body">
	         <h5 class="card-title">${coupon.coupon_name}<i class="far fa-star" id="collect"></i></h5>
	         <p class="card-text">${coupon.coupon_memo}</p>
	       </div>
	     </div>
	   </div>
	   
	</c:forEach>
    
  </div>









  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous">
  </script>
  <script > 
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
          }
      })
  });
  const collect = document.getElementById('collect');
  collect.addEventListener('click', function (e) {
      Swal.fire({
          position: 'top-end',
          icon: 'success',
          title: '成功收藏優惠卷',
          showConfirmButton: false,
          timer: 1500
      })
  });
});
  </script>

</body>

</html>


<!-- 僅供學術研究使用 如有侵權煩請告知 E-mail: a830425tw@gmail.com -->
<!-- 僅供學術研究使用 如有侵權煩請告知 E-mail: a830425tw@gmail.com -->
<!-- 僅供學術研究使用 如有侵權煩請告知 E-mail: a830425tw@gmail.com -->