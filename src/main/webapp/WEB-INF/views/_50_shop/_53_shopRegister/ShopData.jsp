<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shopping</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<link rel="stylesheet"
	href="<c:url value='/_00_util/shopUtil/css/normalize.css'/>">
<link rel="stylesheet"
	href="<c:url value='/_00_util/shopUtil/css/shop_register1.css'/>">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/javascript/header.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<!-- MATERIAL DESIGN ICONIC FONT
<link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css"> -->


</head>
<body>

	<!-- 引入共同的頁首 -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	
	<div class="main-member">
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



		<main>


	<!-- 商家註冊頁面開始 -->
	<div  >
		<div style="margin:20px;">
		<button onclick="location.href='${pageContext.request.contextPath}/_50_shop/_55_shopData/DataFromSex'">顧客男女比</button>
		<button onclick="location.href='${pageContext.request.contextPath}/_50_shop/_55_shopData/DataFromCoupon'">優惠券使用數量</button>
		<button onclick="location.href='${pageContext.request.contextPath}/_50_shop/_55_shopData/DataFromTime'">期間優惠券使用數量</button>
		<button onclick="location.href='${pageContext.request.contextPath}/_50_shop/_55_shopData/DataFromAge'">顧客年齡分佈</button>
		<button onclick="location.href='${pageContext.request.contextPath}/_50_shop/_55_shopData/DataFromAll'">全部資料</button>
		</div>
		
		
		
		<div style="width:800px;height:600px;margin:100px auto;">
			<canvas id="example" width="200px" height="100px"></canvas>
			<div style="margin:70px auto">
			${detail}
			</div>
		</div>
		
		
		
	</div>
	</main>
	</div>
<script>
        var ctx = document.getElementById( "example" ),
            example = new Chart(ctx, {
                // 參數設定[註1]
                type: ${type}, // 圖表類型
                data: {
                    labels: ${label}, // 標題
                    datasets: [{
                        label: "次數", // 標籤
                        data: ${data}, // 資料
                        backgroundColor: ${backgroundColor},
                        borderWidth: 1 // 外框寬度
                    }]
                },
                options: {
                    title: {
                        text: ${text},
                        display: true,
                        fontSize: 20
                    },
                    legend: {
                        position: 'right'
                    },
                    scales: {
                        yAxes: [{
                            display: true,
                            ticks: {
                                beginAtZero: true
                            }
                        }]
                    }
                }
            });

          
    </script>
	
	
</body>
</html>