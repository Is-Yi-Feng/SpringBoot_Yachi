<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/normalize.css'/>">
 <link rel="stylesheet" href="<c:url value='/_00_util/allUtil/css/background.css'/>">
<link rel="stylesheet"
	href="<c:url value='/_00_util/adminUtil/css/8_insertProduct.css'/>">
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
<title>insert product</title>
</head>
<body>
	<!-- 引入共同的頁首 -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	<!-- 頁首結束 -->

	<div class="container">
		<div class="row box">
		
			<!-- 功能選單開始 -->
			<jsp:include page="/WEB-INF/views/_00_util/adminUtil/jsp/admin.jsp" />
			<!-- 功能選單結束 -->
		
			<!-- 表單區域開始 -->
			<main class="col-8">
				<div class="formBox pt-3 pb-2 px-5">
					<div class="title">新增產品資料</div>
						<!-- 須加上此屬性form-data'，表單才具有檔案上傳能力 -->
															
					<form:form method="POST" modelAttribute="productBean" enctype="multipart/form-data" name="myForm">
						<div class="form-group row">
							<label for="product_name" class="col-sm-2 col-form-label">商品名稱</label>
							<div class="col-sm-10">
<!-- 						path="product_name" => 呼叫ProductBean 的 getProduct_name()-->
								<form:input type="text" path="product_name" class="form-control" id="product_name"/>
								<form:errors path="product_name" cssClass="error"/>
							</div>
						</div>
						<div class="form-group row">
							<label for="product_info" class="col-sm-2 col-form-label">商品資訊</label>
							<div class="col-sm-10">
<!-- 							path="product_info" => 呼叫ProductBean 的 getProduct_info() -->
								<form:textarea type="text" path="product_info" class="form-control textBar" id="product_info"/>
								<form:errors path="product_info" cssClass="error"/>
							</div>
						</div>
						<div class="form-group row">
							<label for="product_price" class="col-sm-2 col-form-label">商品價格</label>
							<div class="col-sm-10">
								<form:input type="number" path="product_price" min="0" class="form-control"
									id="product_price"/>
								<form:errors path="product_price" cssClass="error"/>
							</div>
						</div>
						<div class="form-group row">
							<label for="product_stock" class="col-sm-2 col-form-label">商品庫存</label>
							<div class="col-sm-10">
								<form:input type="number" path="product_stock" min="0" class="form-control"
									id="product_stock"/>
								<form:errors path="product_stock" cssClass="error"/>		
							</div>
						</div>
						<div class="form-group row">
							<label for="product_spec" class="col-sm-2 col-form-label">商品規格</label>
							<div class="col-sm-10">
								<form:input type="text" path="product_spec" min="0" class="form-control" id="product_spec"/>
							</div>
						</div>

						<div class="form-group row">
							<label for="productTypeBean.product_type_id" class="col-sm-2 col-form-label">商品種類</label>
							<div class="mb-3 col-10">
								<form:select path="productTypeBean.product_type_id" class="custom-select">
									<form:option value="-1" label="請選擇"/>
									<form:options items="${sortMap}"/>
								</form:select>
								<form:errors path="productTypeBean" cssClass="error"/>
							</div>
						</div>
						
						<!-- 選擇照片 -->
						<div class="row d-flex justify-content-around ">
							<div class="col-5 custom-file">
								<form:input type="file" path="productImage" class="custom-file-input" id="productImage"  accept="image/gif, image/jpeg, image/png"/>
								<label class="custom-file-label" for="productImage">圖片一</label>
							</div>
							<div class="col-5 custom-file">
								<form:input type="file" path="productImagesA" class="custom-file-input" id="productImageA"  accept="image/gif, image/jpeg, image/png"/>
								<label class="custom-file-label" for="productImageA">圖片二</label>
							</div>
						</div>	
						<!-- 選擇照片 -->

						<div class="row imageBox d-flex justify-content-around pt-4">
							<div class="image">
								<img id="image1"/>
							 </div>
							<div class="image">
								<img id="image2">
							</div>
							<!--<div class="image">
								<img src="${pageContext.request.contextPath}/images/Shinnosuke/Shinnosuke2.jpg" alt="">
							</div> -->
						
						</div>

						<div class="form-group row  d-flex justify-content-end mt-5">
							<div>
								<button id="inputAllBtn" type="button" class="btn btn-light mr-3">一鍵輸入</button>
							</div>
							<div>
								<button type="submit" id="btnAdd" class="btn btn-primary">新增</button>
							</div>
						</div>


					</form:form>
				</div>
			</main>
		<!-- 表單區域結束 -->
		
		</div>
		
	</div>
	<!-- -------------------------------引入共同的頁尾---------------------------------------- -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	<!-- -------------------------------引入共同的頁尾----------------------------------------- -->
	<script>
		$(document).ready(function(){
			//選擇圖片時會出現檔名(因bootstrap4.6此用法必須這樣寫才會出現)
		  $(".custom-file-input").change(function () {
		    $(this).next(".custom-file-label").html($(this).val().split("\\").pop());
		  });
		  
		  $('#productImage').change(function(){
			  readURL(this);
		  })
		  //因為單選的關係，所以有檔案一定是在第0個。
		  function readURL(input){
			  if(input.files && input.files[0]){
			    let reader = new FileReader();
			    reader.onload = function (e) { //讀出來是二進位檔案
			       $('#image1').attr('src', e.target.result);
			    }
			    reader.readAsDataURL(input.files[0]); 
			  }
		  }
		  $('#productImageA').change(function(){
			  readURLA(this);
		  })
		  //因為單選的關係，所以有檔案一定是在第0個。
		  function readURLA(input){
			  if(input.files && input.files[0]){
			    let reader = new FileReader();
			    reader.onload = function (e) { //讀出來是二進位檔案
			       $('#image2').attr('src', e.target.result);
			    }
			    reader.readAsDataURL(input.files[0]); 
			  }
		  }
		  
		  //一鍵輸入功能
		  //存取input標籤的值必須使用.val()方法
		  $('#inputAllBtn').click(function(){
			  $('#product_name').val("超輕量真空隨行杯");
			  $('#product_info').val("內噴陶瓷表層0毛孔處理，真實呈現飲品原味 抗酸鹼、異味不殘留 環保矽膠吸管設計，上山下海隨手即飲 保冰、續冰高達8小時 一體成形的陶瓷易潔層，簡單好清洗 尺寸：口直徑-9cm，底直徑-7cm，含蓋高度-17.5cm 容量：500ML 重量：330G±5% 材質：杯身內層304不鏽鋼、陶瓷塗層，吸管tritan 產地：台灣監製、中國製造");
			  $('#product_price').val("300.0");
			  $('#product_stock').val("5")
			  $('#product_spec').val("聯名款")
		  })
		});
		


	</script>
</body>
</html>