<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en"> 
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>cart content</title>
    <link rel="stylesheet" href="<c:url value='/_00_util/shoppingMallUtil/css/5_cart_content.css'/>">
    <link rel="stylesheet" href="<c:url value='/_00_util/allUtil/css/background.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">   
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
	<link rel="stylesheet" href="<c:url value='/_00_util/allUtil/css/normalize.css'/>">
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<script src="<c:url value='/_00_util/allUtil/javascript/jquery-3.5.1.js'/>"></script>
    <script src="<c:url value='/_00_util/allUtil/javascript/jquery-ui.js'/>"></script>
</head>
<body>
	<!------------------------------??????????????????-------------------------- -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	<!------------------------------??????????????????-------------------------- -->
	
	<!-----------------------------???????????????----------------------------- -->
	  <div class="container chart_box">
		  <div class="row justify-content-center chart">
			<div data-aos="fade-up"
			data-aos-duration="1000">
			  <ul class="shop_list d-flex ">
					<li class="circle_box step1">
						<span>01</span>	
						<span class="chart_name">????????????</span>
					</li>
				
				<li class="circle_box step2">
					<span>02</span>
					<span class="chart_name">????????????</span>
				</li>
				<li class="circle_box step3">
					<span>03</span>
					<span class="chart_name">????????????</span>
				</li>
			  </ul>
			  </div>
			
		  </div>
	  </div>
	  <!-----------------------------???????????????----------------------------- -->


	<div class="container shop_title_box">
        <!--Start  ??????????????? -->
        <div class="shopping_title">
            <i class="fas fa-shopping-cart"></i>
            <span>?????????</span>
            <!-- ???????????????????????? -->
            <c:if test='${empty cartList}'>
            	<span>(0)</span>
            </c:if>
            <c:if test='${!empty cartList}'>
            	<span>(${cartList.size()})</span>
            </c:if>
            
        </div>
        <!---------- End ??????????????? -------------------------->

		
        <!--Start ??????????????? -->
        <form id="shopping_form" method="POST">
        <input type='hidden' name='_method' value='DELETE'>
            <!-- <input type="hidden">  ?????????????????????-->
            <div class="shopping_items">
                <div class="table">
                    <div class="thead">
                        <div class="tr">
                            <div class="th index">??????</div>
                            <div class="th pic"></div>
                            <div class="th name">????????????</div>
                            <div class="th stock"></div>
                            <div class="th price">??????</div>
                            <div class="th count">??????</div>
                            <div class="th total">??????</div>
                            <div class="th delete">??????</div>
                        </div>
                    </div>
                    
                    
                    <div class="tbody">
                    	<c:if test='${empty cartList}'>
                    		<div class="emptyCart">
	                   			<a href="<c:url value='/DisplayPageProducts' />" 
	                   			style="display: block;color: #444;font-size: 1.1rem; height: 100px;line-height: 100px;">
	                   				?????????????????????! ??????????????????
	                   			</a>
                   			</div>
                    	</c:if>
                    	<c:set value='0' var='sum'/>
                    	<c:forEach var='cart' items='${cartList }' varStatus='i'>
<%--                     		<c:if test="${cart.productBean.product_status == 0 }"> --%>
		                        <div class="tr">
		                       		<div class="td price">
		                                <span>${i.count}</span>
		                            </div>
		                            <div class="td pic">
		                                <img src="<c:url value='/getProductPictureA/${cart.productBean.product_id}'/>">
		                            </div>
		                            <div class="td name">
		                                <a href="<c:url value='/singleProduct?id=${cart.productBean.product_id}'/>">${cart.productBean.product_name }</a>
		                                <div>
		                                    <span>${cart.productBean.product_spec }</span>
		                                </div>
		                            </div>
									<div class="td stock">
										<c:if test="${cart.productBean.product_stock == 0}">
		                                	<span style="color: rgb(211, 73, 73);">??????????????????<br>??????????????????!</span><br>
		                                	
										</c:if>
										<!--???????????? == 2 ????????????????????????????????????????????????????????? -->
	<%-- 									<c:if test="${cart.productBean.product_status == 2 }"> --%>
	<!-- 										<span style="color: rgb(211, 73, 73);">??????????????? ??????????????????!</span> -->
	<%-- 									</c:if> --%>
										<c:if test="${cart.productBean.product_stock < cart.cart_amount && cart.productBean.product_stock > 0}">
											<span style="color: rgb(211, 73, 73);">???????????????${cart.productBean.product_stock}<br>?????????????????????</span>
										</c:if>
		                            </div>
		                            <div class="td price">
		                                <span>NT$ ${cart.productBean.product_price }</span>
		                            </div>
		                            <div class="td count">
		                            	
		                                <select name="qty" id="selectAmount" onchange='updateAmount(${cart.cart_id}, this.options[this.options.selectedIndex].value,${cart.productBean.product_price})'>
		                                	<c:forEach var="num" begin="1" end="10" >
		                                		<option value="${num}" <c:if test="${cart.cart_amount == num}">selected</c:if>>${num}</option> 
		                                	</c:forEach>
	<%-- 	                                	<c:forEach var="num" begin="1" end="10" > --%>
	<%-- 	                                		<option value="${num}" <c:if test="${cart.cart_amount == num}">selected</c:if>>${num}</option>  --%>
	<%-- 	                                	</c:forEach> --%>
		                                </select>
		                                
		                            </div>
		                            <div class="td total">
		                                <span>NT$ ${cart.cart_total }</span>
		                            </div>
		                            <div class="td delete">
		                            	
		                                <a class="deleteLink" href="<c:url value='/cartDelete/${cart.cart_id}'/>"><i class="far fa-trash-alt"></i></a>
		                            </div>
		                        </div>
<%-- 	                        </c:if> --%>
	                        <c:set var='sum' value='${sum + cart.cart_total}'/>
 						</c:forEach>
 						
                    </div>
                </div>
            </div>
		</form>

        
        <!---------- End ??????????????? -------------------------->

        <!-- ???????????? -->
        <div class="totalBox">
            <div class="total">
                <div>????????????</div>
                <span>NT$ ${sum}</span>
            </div>
        </div>

        <!-- ?????? -->
        <div class="shopBtn">
            <div class="btn">
                <a href="<c:url value='/DisplayPageProducts' />">????????????</a>
            </div>
            
            <c:choose>
            	<c:when test="${!empty cartList}">
            		<div class="confirmBtn">
		                <a href="<c:url value='/checkout' />">????????????</a>
		            </div>
            	</c:when>
            	<c:otherwise>
            		<div class="confirmBtn">
		                <a style="cursor: no-drop; href="javascript:;">????????????</a>
		            </div>
            	</c:otherwise>
            </c:choose>
            
            
            
        </div>
        
        
        
    </div>
<!-- -------------------------------?????????????????????---------------------------------------- -->
<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
<!-- -------------------------------?????????????????????----------------------------------------- -->    
    <script>
    
//     	let newCount = 0;
//     	let selectAmount = document.getElementById('selectAmount');
// 		selectAmount.addEventListener('change',changeItemCount);
// 		function changeItemCount(e){
// 			newCount = e.target.value;
// 			console.log(newCount);
// 			// console.log(`\${cart.productBean.product_price}`);
// 			// let product_price = '${cart.productBean.product_price}';
// 			// console.log(product_price);
		
// 		}
		
		function updateAmount(id,amount,price){
// 			amount = newCount;
// 			this.id = id;
// 			this.amount = amount;
// 			this.price = price;
// 			alert(id);
// 			alert(amount);
// 			alert(price);
			location.href="<c:url value='/update/" + id + "/" + amount + "/" + price + "'/>";				
		}
    	$(function(){
       		
// 			
//     		function updateAmount(cart_id, num, product_price){

    		
			let xhr = new XMLHttpRequest();
			xhr.addEventListener('readystatechange',callState);
			xhr.open("GET","<c:url value='/allProducts' />",true)
			xhr.send();

			function callState(){
				if(xhr.readyState == 4 && xhr.status == 200){
					console.log(xhr.responseText);
					products = JSON.parse(xhr.responseText)
					console.log(products);
					for(let i = 0; i < products.length; i++){
						price = products[i].product_price;
						console.log(price);
					}
				}
			}
			
			let selectAmount = document.getElementById('selectAmount');
			selectAmount.addEventListener('change',changeItemCount);
			function changeItemCount(e){
				newCount = e.target.value;
				console.log(newCount);
				
				
			}
			
			
    		
    		$('.deleteLink').click(function() {
    			Swal.fire({
  	    		  title: '??????!?????????????????????!?',
  	    		  icon: 'warning',
  	    		  showCancelButton: true,
  	    		  confirmButtonColor: '#3085d6',
  	    		  cancelButtonColor: '#d33',
  	    		  confirmButtonText: '????????????!'
  	    		}).then((result) => {
  	    		  if (result.isConfirmed) {
  	    			let href = $(this).attr('href');
              	   	$('form').attr('action', href).submit();
  	    		  }
  	    		})
        		return false;
       		});

    	})
    </script>
    <script>
		AOS.init();
	</script>
</body>
</html>