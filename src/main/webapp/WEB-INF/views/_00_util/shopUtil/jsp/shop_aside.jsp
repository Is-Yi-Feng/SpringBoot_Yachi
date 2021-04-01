<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
				<h3>商家管理頁面</h3>
				

				<div class="item">
				<a href="<c:url value='/_50_shop/_53_shopRegister/modifyShop/${LoginOK.shopBean.shop_id}' />">
						<button>
							<span>商家資料</span>
						</button>
					</a>
				</div>
				<div class="item">
					<a href="#">
						<button>
							<span>商家商品</span>
						</button>
					</a>
				</div>
				<div class="item">
					<a href="<c:url value='/_50_shop/_51_coupon/InsertCoupon/${LoginOK.shopBean.shop_id}' />">
						<button>
							<span>優惠券管理</span>
						</button>
					</a>
				</div>
				<div class="item">
					<a href="#">
						<button>
							<span>報表</span>
						</button>
					</a>
				</div>
				<div class="item">
					<a href="<c:url value='/_50_shop/_54_showShops/ShowShops/${LoginOK.shopBean.shop_id}' />">
						<button>
							<span>商家頁面</span>
						</button>
					</a>
				</div>
				
				<div class="item">
					<a href="<c:url value='/doLogout'/>" onclick="return window.confirm('確定登出嗎?');">
						<button>
							<span>登出</span>
						</button>
					</a>
				</div>
			</div>
		</aside>
</body>
</html>