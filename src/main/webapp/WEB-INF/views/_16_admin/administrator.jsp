<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>管理員首頁</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<c:url value='/_00_util/adminUtil/css/normalize.css'/>">
 <link rel="stylesheet" href="<c:url value='/_00_util/allUtil/css/background.css'/>">
<link rel="stylesheet"
	href="<c:url value='/_00_util/adminUtil/css/administrator.css'/>">
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
<script src="https://kit.fontawesome.com/a076d05399.js"></script>


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
				<div class="status">
					<div class="status-nav">
						<h3>平台優惠活動</h3>
						<div class="space"></div>
						<a class="readmore" href="#">readmore...</a>
					</div>
					<hr>
					<div>
					<c:forEach var="adminactivities" varStatus="stat" items="${adminactivityList}">
						<a href="<c:url value='/admin/modifyAdminActivity/${adminactivities.adminactivity_id}' />">
						${adminactivities.adminactivity_name} ----->時間:${adminactivities.adminactivity_begin}至${adminactivities.adminactivity_end}</a><br>
					</c:forEach>
					</div>
				</div>
				<div class="status">
					<div class="status-nav">
						<h3>平台優惠券</h3>
						<div class="space"></div>
						<a class="readmore" href="#">readmore...</a>
					</div>
					<hr>
					<div> 
					<c:forEach var="admincoupons" varStatus="stat" items="${admincouponList}">
						<a href="<c:url value='/admin/modifyAdminCoupon/${admincoupons.admincoupon_id}' />">${admincoupons.admincoupon_name} ----->
						時間:${admincoupons.admincoupon_begin}至${admincoupons.admincoupon_end}----->剩:${admincoupons.admincoupon_amount}張</a><br>
					</c:forEach>
					</div>
				</div>
				<div class="status">
					<div class="status-nav">
						<h3>廣告資訊</h3>
						<div class="space"></div>
						<a class="readmore" href="#">readmore...</a>
					</div>
					<hr>
					<div>
						<a href="#">2020/08/09-2020/09/01 鎮瀾宮媽祖廟 水餃買十送十</a><br> <a
							href="#">2020/08/09-2020/09/01 鎮瀾宮媽祖廟 消波塊買十送十</a><br> <a
							href="#">2020/11/11-2020/12/12 鄭太吉有限公司 慶記買十送十</a><br> <a
							href="#">2020/12/25 蕭家班有限公司 慶記買十送十</a><br>
					</div>
				</div>
				<div class="status">
					<div class="status-nav">
						<h3>客服回應</h3>
						<div class="space"></div>
						<a class="readmore" href="#">readmore...</a>
					</div>
					<hr>
					<div>
						<a href="#">2020/08/09 23:59 sjw說:請問中元節活動什麼意思？消費亡者？好笑嗎？低級當有趣</a><br>
						<a href="#">2020/09/15 23:59
							sjw說:請問中秋節活動什麼意思？消費嫦娥？你把吳剛放在哪裡？低級當有趣</a><br> <a href="#">2020/11/11
							08:59 菜雞說:請問台積電可以買嗎？</a><br> <a href="#">2021/03/31 10:00
							總監說:看得出來有準備拉</a><br>
					</div>
				</div>
				<div class="status">
					<div class="status-nav">
						<h3>審核商家</h3>
						<div class="space"></div>
						<a class="readmore" href="#">readmore...</a>
					</div>
					<hr>
					<div>
						<a href="#">2020/07/05 頤宮中餐廳Le Palais 申請店家</a><br> <a
							href="#">2020/09/13 教父牛排 申請店家</a><br> <a href="#">2020/10/10
							鮨野村 申請店家</a><br> <a href="#">2020/10/25 大腕燒肉專門店 申請店家</a><br>
					</div>
				</div>
				<div class="status">
					<div class="status-nav">
						<h3>公告</h3>
						<div class="space"></div>
						<a class="readmore" href="#">readmore...</a>
					</div>
					<hr>
					<div>
						<a href="#">2020/07/05 饒河夜市 胡椒餅 成為Yachi店家</a><br> <a href="#">2020/08/09
							中原活動開始</a><br> <a href="#">2020/08/29 遼寧夜市 客家湯圓 成為Yachi店家</a><br>
						<a href="#">2020/10/01 師大夜市 我家牛排 已下架</a><br>
					</div>
				</div>
				<div class="status">
					<div class="status-nav">
						<h3>申訴單</h3>
						<div class="space"></div>
						<a class="readmore" href="#">readmore...</a>
					</div>
					<hr>
					<div>
						<a href="#">2020/07/05 06:00 sjw用戶檢舉 yachi 性別欄無LGBTQ+可選擇</a><br>
						<a href="#">2020/07/07 8:00 karen用戶檢舉 岡山羊肉爐教壞我家小孩</a><br> <a
							href="#">2020/07/08 06:00 sjw用戶檢舉 川普 BLM</a><br> <a href="#">2020/07/08
							06:00 sjw用戶檢舉 拜登 老人失智</a><br>
					</div>
				</div>
			</main>
		</div>
	</div>
	<!-- -------------------------------引入共同的頁尾---------------------------------------- -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	<!-- -------------------------------引入共同的頁尾----------------------------------------- -->
	<script type="text/javascript">
		$('.readmore').click(function(){
			$('.status').toggleClass("status1")
		})
	
	</script>
	
	
</body>
</html>