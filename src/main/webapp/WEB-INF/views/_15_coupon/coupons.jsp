<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
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
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
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
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">




<script type="text/JavaScript">
// window.onload = function(){ 
// 	var btn = document.getElementById("btn");
// 	var result = document.getElementById("Result")
// 	btn.onclick = function(){
// 	    var queryString = document.getElementById("queryString").value;
// 	   	var xhr = new XMLHttpRequest();
	   	
// // 	   	xhr.open("POST", "<c:url value='/_30_coupon/_33_editCoupon/controller/Coupon_Controller/queryCoupon' />", true);
	   	
// 	   	xhr.open("POST", "<c:url value='/queryCoupon' />", true);
	   	
//  	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
//  	   	xhr.send("queryString=" + queryString);
	  //XMLHttpRequest物件的屬性
	  //Ch03
	  //屬性名稱 說明
	  //readyState 記錄XMLHttpRequest的狀態
	  //onreadystatechange 存放一個方法(或方法名稱)，當readyState屬性值改變
	  //時此方法就會被呼叫
	  //status 儲存伺服器回傳的Http狀態碼(如200、404、500等)
	  //statusText 儲存伺服器回傳的Http文字簡訊(如OK、Not Found等)
	  //responseText 伺服器的回應內容，為一個字串
	  //responseXML 伺服器的回應內容，為XML文件
// 	   	xhr.onreadystatechange = function() {
// // 		// 向伺服器提出的請求已經收到回應
// 	        if (xhr.readyState === 4) {
// // 	        // status: HTTP通訊協定的狀態碼伺服器，
// // 	        // 200表示Server成功的處理請求
// 	            if (xhr.status === 200) {
// // 	          	// getResponseHeader: 取得回應內容的MIME Type
// 	                 var type = xhr.getResponseHeader("Content-Type");   
// 	                // 判斷回應類型，這裡使用 JSON
// 	                 if (type.indexOf("application/json") === 0) {               
// 	                        var obj = JSON.parse(xhr.responseText);
// 	                        alert(xhr.responseText);
// 	                        if (obj != null ) {
// // 	                        		result.innerHTML =
// // 	                                '您的查詢的優惠劵：' + obj.querylist + "<br>" ; //查詢的優惠劵結果應該在這顯示
// 	                        } else {
// 	                        	result.innerHTML = "搜尋錯誤";
// 	                        }
// 	                    }
// 	                } else {
// 	                    alert("搜尋錯誤1: " + xhr.status + ", " + xhr.responseText);
// 	                }
// 	            } 
// 	    	}
	    }
};
 </script>
<style type="text/css">
.pos {
	position: absolute;
	right: 16px;
}

.rule {
	color: #ff3100;
}

.amount {
	color: orange;
}
.cardBox{
	transition:.3s;
}
.cardBox:hover{
	transform: scale(1.08);
}
</style>


</head>
<body>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />

	<!-- <table> -->
	<!--    <tr height='36'>  -->
	<!--      <td width='120' align='right'>查詢優惠劵：</td> -->
	<!--      <td><input id='queryString' type="text" name="queryString" size = "20"></td> -->
	<!--    </tr> -->

	<!--    <tr height='48'>  -->
	<!--      <td colspan='2' align='center'><input id='btn' type="button" value="確定"></td>   -->
	<!--    </tr> -->
	<!-- </table> -->
	<!-- <hr> -->
	<!-- <div id='Result'  style='height:70px; line-height: 30px;'> -->
	<%-- <c:forEach var='result' items='${result}'> --%>
	<%-- 				搜尋結果${result} --%>
	<%-- </c:forEach> --%>

	<!-- </div> -->
	
<%-- 	<form action="<c:url value="/searchCoupons"/>"> --%>
<!-- 		<a>搜尋優惠券</a> -->
<!-- 		<input type="text" name="coupon_name" id=""> -->
<!-- 		<input type="submit" value="搜尋"> -->
<!-- 	</form> -->
	
	<div class="row row-cols-1 row-cols-md-3 "
		style="padding: 0px 130px 130px 130px">
		<c:forEach var='coupon' items='${coupons}'>
			<div class="col mb-4">
				<div class="shadow p-3  bg-white rounded card h-100 cardBox">
					<div data-aos="flip-left">
						<a
							href="<spring:url value='/coupon?coupon_id=${coupon.coupon_id}' />">
							<img
							src="<c:url value='/getCouponPicture/${coupon.coupon_id}' />"
							class="card-img-top" alt="..." />
						</a>
						<div class="card-body">
							<h5 class="card-title">
								${coupon.coupon_name}
								<div id="collect " class="pos rule">${coupon.coupon_rule}</div>
								<%-- 							${coupon.coupon_name} <i class="far fa-star" id="collect"></i> --%>
							</h5>
							<div class="card-text">
								${coupon.coupon_info}
								<div id="collect " class="pos  amount">剩餘${coupon.coupon_amount}份
								</div>
								<%-- 							<div id="collect " class="pos">開始時間${coupon.coupon_begin} --%>
								<%-- 								結束時間${coupon.coupon_end} --%>
								<!-- 							</div> -->
							</div>
						</div>
					</div>

				</div>
			</div>
		</c:forEach>
	</div>

<script>
  AOS.init();
</script>

<!-- -------------------------------引入共同的頁尾---------------------------------------- -->
<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
<!-- -------------------------------引入共同的頁尾----------------------------------------- -->
</body>

</html>


<!-- 僅供學術研究使用 如有侵權煩請告知 E-mail: a830425tw@gmail.com -->
<!-- 僅供學術研究使用 如有侵權煩請告知 E-mail: a830425tw@gmail.com -->
<!-- 僅供學術研究使用 如有侵權煩請告知 E-mail: a830425tw@gmail.com -->
