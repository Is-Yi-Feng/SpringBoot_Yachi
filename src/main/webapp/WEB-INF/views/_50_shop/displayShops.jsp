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
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/normalize.css'/>">
<link rel="stylesheet"
href="<c:url value='/_00_util/allUtil/css/background.css'/>">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
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
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
/* 	卡片樣式 */
div.card {
	height: 480px;
	border-radius: 25px;
	box-shadow: 1px 1px 2px 1px #eeecef;
	border: 1px solid #eeecef;
}
.card_box{
	position: relative;
}
.goShopBtn{
	position: absolute;
    bottom: 0;
    left: 40%;
    margin-bottom: 5px;
}
/* 撐開卡片容器 */
.addSpace{
	width: inherit;
    height: 50px;
}

/* 夜市按鈕排版 */
.nightMarketBtnArea{
	margin-left:99px;
}
.marketBtn{
	margin-right:10px;
}

/* 評價星星 */
.ratings {
    position: relative;
    bottom: 20%;
/*     left: 4%; */
    vertical-align: middle;
    display: inline-block;
    color: #b1b1b1;
    overflow: hidden;
}
.full-stars {
    position: absolute;
    left: 0;
    top: 0;
    white-space: nowrap;
    overflow: hidden;
    color: #fde16d;
}
.empty-stars:before, .full-stars:before {
    content:"\2605\2605\2605\2605\2605";
    font-size: 15pt;
}
.empty-stars:before {
    -webkit-text-stroke: 1px #848484;
}
.full-stars:before {
    -webkit-text-stroke: 1px orange;
}
/* Webkit-text-stroke is not supported on firefox or IE */

/* Firefox */
@-moz-document url-prefix() {
    .full-stars {
        color: #ECBE24;
    }
}

/* 收藏按鈕 */
.favariteBtn{
	position: absolute;
    right: 0;

}
.favariteBtn a i{
    font-size: 1.3rem;
    color: #28daa9;
    transition:.1s;
}
.favariteBtn a i:hover{
    font-size: 1.5rem;
    color: #1db088;
}

/* 限制字數區域 */
/* .card { */
/* height: 400px; */
/* padding: 10px; */
/* border: #4caf50 2px solid; */
/* } */
/* .card-text { */
/* overflow:hidden; */
/* white-space: nowrap; */
/* text-overflow: ellipsis; */
/* display: -webkit-box; */
/* -webkit-line-clamp: 2; */
/* -webkit-box-orient: vertical; */
/* white-space: normal; */
/* } */



</style>




</head>
<body>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	
	<div class="nightMarketBtnArea">
		<div> 
		<button  class="btn btn-outline-primary marketBtn" onclick="location.href='${pageContext.request.contextPath}/_50_shop/_54_showShops/ShowShops'">全部</button>
		<button  class="btn btn-outline-primary marketBtn" onclick="location.href='${pageContext.request.contextPath}/_50_shop/_54_showShops/ShowNightMarketShops/1'">饒河夜市</button>
		<button  class="btn btn-outline-primary marketBtn" onclick="location.href='${pageContext.request.contextPath}/_50_shop/_54_showShops/ShowNightMarketShops/3'">寧夏夜市</button>
		<button  class="btn btn-outline-primary marketBtn" onclick="location.href='${pageContext.request.contextPath}/_50_shop/_54_showShops/ShowNightMarketShops/4'">士林夜市</button>
		<button  class="btn btn-outline-primary marketBtn" onclick="location.href='${pageContext.request.contextPath}/_50_shop/_54_showShops/ShowNightMarketShops/6'">延三夜市</button>
		<button  class="btn btn-outline-primary marketBtn" onclick="location.href='${pageContext.request.contextPath}/_50_shop/_54_showShops/ShowNightMarketShops/7'">公館夜市</button>
		<button  class="btn btn-outline-primary marketBtn" onclick="location.href='${pageContext.request.contextPath}/_50_shop/_54_showShops/ShowNightMarketShops/8'">南機場夜市</button>
		<button  class="btn btn-outline-primary marketBtn" onclick="location.href='${pageContext.request.contextPath}/_50_shop/_54_showShops/ShowNightMarketShops/5'">臨江街觀光夜市</button>
		<button  class="btn btn-outline-primary marketBtn" onclick="location.href='${pageContext.request.contextPath}/_50_shop/_54_showShops/ShowNightMarketShops/2'">華西街觀光夜市</button>
		</div>
	
	</div>

	<div class="row row-cols-1 row-cols-md-3"
		style="padding: 0px 100px 100px 100px;margin-top:50px;" >

		<c:forEach var="shop" items="${shopList}">
			<div class="col mb-4 card_box">
				<div class="card shadow p-3 mb-5 bg-body rounded ">
					<!-- 	     須放在此處排版才不會跑掉 -->
					<div data-aos="zoom-in-up">

						<a
							href="<c:url value='/_50_shop/_54_showShops/ShowShops/${shop.shop_id}' />">
							<img style="height: 250px;"
							src="<c:url value='/_50_shop/_53_shopRegister/getPicture/${shop.shop_id}'/>"
							class="card-img-top" alt="...">
						</a>

						<div class="card-body">
							<!--------------------------------------收藏按鈕------------------------------- -->
							<div class="favariteBtn">
								<a
									href="<c:url value='/_50_shop/_54_showShops/addFavoriteShop/${shop.shop_id}' />"
									onclick="return window.alert('收藏成功!');"><i
									class="fab fa-gratipay fa-2x"></i></a>
							</div>
							<!--------------------------------------收藏按鈕------------------------------- -->
							<div>
								<h3 class="card-title" style="display:inline-block;">${shop.shop_name}
									(${shop.nightMarketBean.market_name})
								</h3>
							
							</div>
							<div class="ratings">
								<div class="empty-stars"></div>
								<div class="full-stars" style="width: ${shop.shop_score * 20}%; "></div>
								
							</div>
								

							<p class="card-text">${shop.shop_info}</p>
							<div class="addSpace"></div>
						</div>
					</div>
					<div class="goShopBtn">
						<a
							href="<c:url value='/_50_shop/_54_showShops/ShowShops/${shop.shop_id}' />"><button
								type="button" class="btn btn-outline-primary">前往商家</button></a>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>


	<!--   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" -->
	<!--     integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"> -->
	<!--   </script> -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous">
		
	</script>
	<script>

		$(function(){
		    var len = 30; // 超過50個字以"..."取代
		    $(".card-text").each(function(i){
		        if($(this).text().length>len){
		            $(this).attr("title",$(this).text());
		            var text=$(this).text().substring(0,len-1)+"...";
		            $(this).text(text);
		        }
		    });
		});

	
	
	
		//   const using = document.getElementById('using');
		//   using.addEventListener('click', function (e) {
		//       Swal.fire({
		//           title: '確定要使用優惠劵嗎?',
		//           text: "",
		//           icon: 'warning',
		//           showCancelButton: true,
		//           confirmButtonColor: '#3085d6',
		//           cancelButtonColor: '#d33',
		//           confirmButtonText: '確定兌換',
		//           cancelButtonText: '取消'
		//       }).then((result) => {
		//           if (result.isConfirmed) {
		//               Swal.fire(
		//                   '兌換成功!',
		//                   '',
		//                   'success'
		//               )
		//           }
		//       })
		//   });
		//   const collect = document.getElementById('collect');
		//   collect.addEventListener('click', function (e) {
		//       Swal.fire({
		//           position: 'top-end',
		//           icon: 'success',
		//           title: '成功收藏優惠卷',
		//           showConfirmButton: false,
		//           timer: 1500
		//       })
		//   });
	</script>
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