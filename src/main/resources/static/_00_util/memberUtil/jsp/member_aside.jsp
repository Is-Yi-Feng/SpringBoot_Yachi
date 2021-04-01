<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<title></title>
</head>

<body>
	<aside>
		<div class="function">
			<h3>會員中心</h3>
			<div class="item">

				<img
					src='<c:url value='/_00_init/getMemberImage?memberId=${LoginOK.memberId}' /> '
					id="headImgg" height='200px' width='200px'>

			</div>
			<div class="item">
				<a href="<c:url value='/member/update/${LoginOK.memberId}'/>">
					<button>
						<span>基本資料</span>
					</button>
				</a>
			</div>
			<div class="item">
				<a href="<c:url value='/_23_orderProcess/orderList'/>">
					<button>
						<span>訂單查詢</span>
					</button>
				</a>
			</div>
			<div class="item">
				<a href="<c:url value='/member/keep/coupons'/>">
					<button>
						<span>我的優惠券</span>
					</button>
				</a>
			</div>
			<div class="item">
				<a href="<c:url value="/queryFavoriteShop"/>">
					<button>
						<span>喜愛商家</span>
					</button>
				</a>
			</div>
			<div class="item">
				<a href="#">
					<button>
						<span>通知</span>
					</button>
				</a>
			</div>
			<c:if test="${empty LoginOK.shopBean.shop_id}">
				<div class="item">
					<a href="<c:url value='/_50_shop/_53_shopRegister/InsertShop' />">
						<button>
							<span>申請商家</span>
						</button>
					</a>
				</div>
			</c:if>
			<div class="item">
				<a href="#">
					<button>
						<span>新增信用卡</span>
					</button>
				</a>
			</div>
			<div class="item">
				<a href="<c:url value='/doLogout'/>"
					onclick="return window.confirm('確定登出嗎?');">
					<button>
						<span>登出</span>
					</button>
				</a>
			</div>
		</div>
	</aside>
</body>
</html>