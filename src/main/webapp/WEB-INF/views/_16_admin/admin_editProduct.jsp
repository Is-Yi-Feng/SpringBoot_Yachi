<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/normalize.css'/>">
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/background.css'/>">
<link rel="stylesheet"
	href="<c:url value='/_00_util/adminUtil/css/9_editProduct.css'/>">
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
<title>Edit Product</title>
</head>
<body>
	<!-- -------------------------------引入共同的頁首開始------------------------------------- -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	<!-- -------------------------------引入共同的頁首結束------------------------------------- -->


	<form method='POST'>
		<input type='hidden' name='_method' value='DELETE'>
	</form>

	<div class="container pt-4">
		<div class="row">

			<!-- -------------------------功能選單開始 --------------------------------------->
			<jsp:include page="/WEB-INF/views/_00_util/adminUtil/jsp/admin.jsp" />
			<!-- -------------------------功能選單結束 --------------------------------------->
			



			<!-- -------------------------商品明細區域開始-------------------------------------- -->
			<main class="col-8">
				<div class="editBtn">
					<a href="<c:url value='/products/add'/>" id="insertProduct">新增商品</a>
					<a href="#" id="downProduct">下架商品</a> <a href="#"
						id="deleteProduct">刪除商品</a>

				</div>

				<div id="productTab">
					<div id="tab_nav">
						<a href="javascript:;" class="tab_selected onsale">商品上架中</a> <a
							href="javascript:;">商品已下架</a> <a href="javascript:;">商品缺貨中</a>
					</div>
					<div class="tabs_content content_selected">

						<div class="tabs_panel product_info" style="display: block;">
							<div class="itemsList">

								<c:choose>
									<c:when test="${empty editProducts}">
                        			目前沒有任何產品上架哦....<a
											href="<c:url value='/products/add'/>">立即上架</a>
										<br>
									</c:when>
									<c:otherwise>
										<div class="table">
											<div class="thead">
												<div class="tr">
													<div class="th checkBox">
														<input type="checkbox" id="selectAll"> 
														<label for="selectAll"></label><br>
													</div>
													<div class="th pic">圖片</div>
													<div class="th name">商品名稱</div>
													<div class="th price">價格</div>
													<div class="th count">庫存</div>
													<div class="th upDate">順序</div>
													<div class="th edit">修改</div>
													<div class="th delete">刪除</div>
												</div>
											</div>
											<div class="tbody">

												<c:forEach var='product' items='${editProducts}'>
													<c:if test="${product.product_status == 0}">
														<div class="tr">
															<div class="td checkBox">
																<input type="checkbox" id="product_id${product.product_id}" name="product_id"
																	value="${product.product_id}"> <label for="product_id"></label>
															</div>
															<div class="td pic">
																<img
																	src="<c:url value='/getProductPictureA/${product.product_id}'/>">
															</div>
															<div class="td name">
																<a
																	href="<c:url value='/productUpdate/${product.product_id}'/>">${product.product_name}</a>
																<div>
																	<span>${product.product_spec}</span>
																</div>
															</div>
															<div class="td price">
																<span>NT$ ${product.product_price }</span>
															</div>
															<div class="td count">
																<span>${product.product_stock }</span>
															</div>
															<div class="td upDate">
																<span>${product.product_id }</span>
															</div>
															<div class="td edit">
																<a
																	href="<c:url value='/productUpdate/${product.product_id}'/>"><i
																	class="fas fa-pen"></i></a>
															</div>
															<div class="td delete">

																<a class="deleteLink"
																	href="<c:url value='/productDelete/${product.product_id}'/>"><i
																	class="fas fa-trash"></i></a>
															</div>
														</div>
													</c:if>
												</c:forEach>

											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>


						<div class="tabs_panel noSale">
							<div class="itemsList">
								<div class="table">
									<div class="thead">
										<div class="tr">

											<div class="th pic">圖片</div>
											<div class="th name">商品名稱</div>
											<div class="th price">價格</div>
											<div class="th count">數量</div>
<!-- 											<div class="th upDate">下架時間</div> -->
											<div class="th edit">修改</div>
											<div class="th delete">刪除</div>
										</div>
									</div>
									<div class="tbody">
									
										<c:forEach var='product' items='${editProducts}'>
											<c:if test="${product.product_status == 2}">
												<div class="tr">
													<div class="td pic">
														<img src="<c:url value='/getProductPictureA/${product.product_id}'/>">
													</div>
													<div class="td name">
														<a  style="color:gray; href="<c:url value='/productUpdate/${product.product_id}'/>">${product.product_name}</a>
														<div>
															<span>${product.product_spec}</span>
														</div>
													</div>
													<div class="td price">
														<span>NT$ ${product.product_price }</span>
													</div>
													<div class="td count">
														<span>${product.product_stock }</span>
													</div>
<!-- 													<div class="td upDate"> -->
<!-- 														<span>2021-02-28</span> -->
<!-- 													</div> -->
													<div class="td edit">
														<a href="<c:url value='/productUpdate/${product.product_id}'/>"><i class="fas fa-pen"></i></a>
													</div>
													<div class="td delete">
														<a href="<c:url value='/productDelete/${product.product_id}'/>"><i class="fas fa-trash"></i></a>
													</div>
												</div>
											</c:if>
										</c:forEach>

									</div>
								</div>
							</div>
						</div>




						<div class="tabs_panel noStock">
							<div class="title">
								<span>商品缺貨囉! 趕緊補貨去<i class="fas fa-arrow-down"></i><i class="fas fa-arrow-down"></i><i class="fas fa-arrow-down"></i></span>
							</div>
							<div class="itemsList">

								<div class="table">
									<div class="thead">
										<div class="tr">

											<div class="th pic">圖片</div>
											<div class="th name">商品名稱</div>
											<div class="th price">價格</div>
											<div class="th count">數量</div>
<!-- 											<div class="th upDate">下架時間</div> -->
											<div class="th edit">修改</div>
											<div class="th delete">刪除</div>
										</div>
									</div>
									<div class="tbody">
									
										<c:forEach var='product' items='${editProducts}'>
											<c:if test="${product.product_stock == 0}">
												<div class="tr">
													<div class="td pic">
														<img src="<c:url value='/getProductPictureA/${product.product_id}'/>">
													</div>
													<div class="td name">
														<a  style="color:gray; href="<c:url value='/productUpdate/${product.product_id}'/>">${product.product_name}</a>
														<div>
															<span>${product.product_spec}</span>
														</div>
													</div>
													<div class="td price">
														<span>NT$ ${product.product_price }</span>
													</div>
													<div  class="td count">
														<span style="color: red;">${product.product_stock }</span>
													</div>
<!-- 													<div class="td upDate"> -->
<!-- 														<span>2021-02-28</span> -->
<!-- 													</div> -->
													<div class="td edit">
														<a href="<c:url value='/productUpdate/${product.product_id}'/>"><i class="fas fa-pen"></i></a>
													</div>
													<div class="td delete">
														<a href="<c:url value='/productDelete/${product.product_id}'/>"><i class="fas fa-trash"></i></a>
													</div>
												</div>
											</c:if>
										</c:forEach>

									</div>
								</div>
							</div>



						</div>

					</div>
				</div>
			</main>
			<!-- -------------------------商品明細區域結束-------------------------------------- -->

		</div>
	</div>
	<!-- -------------------------------引入共同的頁尾---------------------------------------- -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	<!-- -------------------------------引入共同的頁尾----------------------------------------- -->
	
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
	<script>
    $(function () {
	    $('#tab_nav a').click(function(){ 
	        // 當點擊tabs-nav的元素a時  替當前(this)的a超連結增加.tab_selected類  
	        // 其餘兄弟類 siblings() remove .change類
	        $(this).addClass('tab_selected').siblings().removeClass('tab_selected');
	
	        // 點擊的同時 拿到當前 a 超連結的索引號
	        let index = $(this).index();     //  index從0開始
	        // console.log(index);
	
	        // 讓下面對應的索引號  .tabs-content 的子元素.tabs-panel[index] 渲染出來  
	        // 其他 子元素 兄弟類 siblings() 的 .tabs_panel 隱藏
	        // 找出 panel 的 index 對應到 #tab_nav a 的 index
	        $('.tabs_content .tabs_panel').eq(index)  
	        .addClass('show_panel animated_tabs').show().siblings().hide();
	
	    });
		
	    
	    
	    
	});
    $('.deleteLink').click(function() {
			Swal.fire({
	    		  title: '確定要刪除此筆紀錄?',
	    		  text: "刪掉就沒救了喔!",
	    		  icon: 'warning',
	    		  showCancelButton: true,
	    		  confirmButtonColor: '#3085d6',
	    		  cancelButtonColor: '#d33',
	    		  confirmButtonText: '沒錯刪掉它!'
	    		}).then((result) => {
	    		  if (result.isConfirmed) {
	    			let href = $(this).attr('href');
//           	$('form').attr('action', href).submit();  //原本delete請求的方式
						axios.get(href).then(() => {
							window.location.reload();
						}).then(() => {
							Swal.fire(
		                   		      'Deleted!',
		                   		      'Your file has been deleted.',
		                   		      'success'
			                    	)
						})
          	   	window.location = href;  //改用get方式更改資料庫狀態碼
          	  	
	    		  }
	    		})
    	return false;
    });
  //當刪除產品按鈕點擊時(jquery 的箭頭涵式裡面包住的$(this)指的是window)

  //checkbox 
  $('#selectAll').click(function(){
	if($(this).is(":checked")) {
		$(":checkbox").prop("checked", true);//所有选择框都选中
		let checkPid = new Array();	
		$('input:checkbox:checked[name="product_id"]').each(function(i) {
			 checkPid[i] = this.value; 
			//  console.log(checkPid[i]);
		})
		// console.log($('input:checkbox:checked[name="product_id"]').each(function(i) { checkPid[i] = this.value; }));
	} else {
		$(":checkbox").prop("checked", false);
	}
  });
  
  function selectedCheck(){
	let checkedNum = $("input[name='product_id']:checked").length;
	//判斷至少需勾選一項
	if (checkedNum == 0) {
		alert("請至少選擇一項");
		return false;
    }
	let checkList = new Array();	
	$('input[name="product_id"]:checked').each(function() {
		checkList.push($(this).val()); //產品id的集合
	})
	checkId = checkList.join("+");  //使用"+"將陣列合併成字串(這樣才有辦法送到後端)
	console.log(checkId);
  }


  //刪除按鈕
  $('#deleteProduct').on("click",function(){
	
	selectedCheck();

	let yes = confirm("確定刪除勾選的項目")
	if(yes){
		let href = "<c:url value='/productManage/" + checkId + "/del'/>";
		$('#deleteProduct').attr('href', href).submit();
		}
  })

  //下架按鈕
  	$('#downProduct').on("click",function(){
		selectedCheck();
		let yes = confirm("確定下架勾選的項目")
		if(yes){
			let href = "<c:url value='/productManage/" + checkId + "/down'/>";
			$('#downProduct').attr('href', href).submit();
		}
	  })
</script>

</body>
</html>
