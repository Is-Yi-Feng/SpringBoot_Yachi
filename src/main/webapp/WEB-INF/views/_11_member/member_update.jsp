<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<%--    	<link rel="stylesheet" href="<c:url value='/_00_util/memberUtil/css/reset.css'/>"> --%>
	<link rel="stylesheet" href="<c:url value='/_00_util/adminUtil/css/normalize.css'/>">
	<link rel="stylesheet" href="<c:url value='/_00_util/memberUtil/css/member_update2.css'/>">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
	<title>member_update</title>
	
	
	
	
	<script>
        $(function () {
             // change這個event只有代表改變，並不代表有檔案
         $('#file').change(function() { 
                // this代表<input id="file">  
                // files.length == 1 是長度為一的陣列
                let file = this.files[0]; 
                let reader = new FileReader();
                // new FileReader(); 用途是用來讀取檔案，標準的API
                // 如果要FileReader去讀檔案，必須給他一個檔案Object。
                // 它拿到檔案Object後會驅動onload事件
                // 給它URL的方式就是用 readAsDataURL( /*裡面放檔案Object*/ )
                // 所以我們才會放入 reader.readAsDataURL(input.files[0]);
                // onload事件讀出來的會是一個接近二進位檔案，所以可以直接給<img>
                // 所以這邊直接改變img 的 src 就可以了
                reader.readAsDataURL(file); 

                reader.onload = function(){     //成功讀取文件
                    $('#headImg').attr({
                        
                        // src = this.result 
                        // 或者是 src = e.target () 
                        // 只是function(e) 加上e 事件物件處理函數
                        src:this.result , 
                        width:`200px`,
                        height:`200px`
                    });
					$('#headImgg').attr({
                        
                        // src = this.result 
                        // 或者是 src = e.target () 
                        // 只是function(e) 加上e 事件物件處理函數
                        src:this.result , 
                        width:`200px`,
                        height:`200px`
                    });
                }
            });

             /* hover事件切換 如果只寫一個方法  
               那鼠標經過和離開都會觸發這個方法 slideToggle
            */
            // $('.menu-box').hover(function(){
            //     $(this).children('ul').slideToggle();
            // })

            $('.tab-list a').hover(function(){
                /* 為匹配的當前元素切換 class css類別 */
                $(this).toggleClass('liColor');
                
                /* 拿到當前(this) a 的索引號 */
                index = $(this).index();

                /* 讓上面和下面相應的索引號 eq() 顯示內容 
                    其餘siblings() 隱藏起來 */
                $('.tab-panel').eq(index).stop().fadeIn('slow').show().siblings().hide();

            },function(){
                /* 第二個方法處理滑鼠移開事件 */
                $(this).removeClass('liColor');
                $('.tab-panel').hide();
            })

            $('.tab-panel').hover(function(){
                index = $(this).index();
                $(this).css('background-color','white').show();
                $('.tab-list a').eq(index).addClass('liColor');
            },function(){
                $(this).hide();
                $('.tab-list a').eq(index).removeClass('liColor');
            })
            
         	// 跑馬燈每三秒執行一次
//             setInterval(function(){
//             $('#news li:first-child').slideUp(function(){

//                 $(this).appendTo($('#news')).slideDown();
//             });

//             },3000);


        });    

    </script>
     <style>
        /* 跑馬燈開始 */
/*         #Marquee{ */
/*             display: flex; */
/* /*             padding-left: 160px; */
/*             align-items: center;    */
/*         } */
/*         #Marquee h3{ */
/*             font-size: 1rem; */
/*             padding: 5px; */
/*         } */
/*         #Marquee ul{ */
            
/*             list-style:none; */
/* /*             height:30px; */
/*             overflow:hidden; */
            
            
/*         } */
/*         #Marquee ul li:first-child{ */
/*             margin: 7px 0; */

/*         } */
        /* 跑馬燈結束 */
        
        /* sex 選項*/
        .sex-css{
        	display: flex;
        	justify-content: center;
        	align-items: center;
        	margin-left:10px;
        	padding: 0 20px;
        }
        
        .sex-css label{
        	font-weight: bold;
        	margin: 0 5px;
        }
      
      
        
    </style>
	
</head>
<body>

	<!-- 引入共同的頁首 -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	
	<!-- 跑馬燈開始 -->
<!--      <div id="Marquee"> -->
<!--         <h3>最新優惠消息:</h3> -->
<!--         <ul id="news"> -->
<!--             <li>東西很貴不要買 !</li> -->
<!--             <li>還沒做完</li> -->
<!--             <li>目前網路商店全館免運</li> -->
<!--         </ul> -->
<!--     </div> -->
    <!-- 跑馬燈結束 -->
	

	<div class="main-member">
	<!-- 功能選單開始 -->
	<jsp:include page="/WEB-INF/views/_00_util/memberUtil/jsp/member_aside.jsp" />
	<!-- 功能選單結束 -->
	
<!--         <aside> -->
<!--             <div class="function"> -->
<!--                 <h3>會員中心</h3> -->
<!-- 				<div class="item"> -->
				
<%-- 		            <img src='<c:url value='/_00_init/getMemberImage?memberId=${LoginOK.memberId}' /> ' --%>
<!-- 		                  id="headImgg" height='200px' width='200px'> -->
		                  					
<!-- 	            </div> -->
<!--                 <div class="item"> -->
<%--                    	<a href="<c:url value='/member/update/${LoginOK.memberId}'/>"> --%>
<!--                         <button><span>基本資料</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="item"> -->
<%--                     <a href="<c:url value='/_23_orderProcess/orderList'/>"> --%>
<!--                         <button><span>訂單查詢</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="item"> -->
<%--                     <a href="<c:url value='/member/keep/coupons'/>"> --%>
<!--                         <button><span>我的優惠券</span></button> -->
<!--                     </a>                     -->
<!--                 </div> -->
<!--                 <div class="item"> -->
<%--                     <a href="<c:url value="/queryFavoriteShop"/>">  --%>
<!--                         <button><span>喜愛商家</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="item"> -->
<!--                     <a href="#"> -->
<!--                         <button><span>通知</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<%--                  <c:if test="${empty LoginOK.shopBean.shop_id}">	 --%>
<!--                 <div class="item"> -->
<%--                     <a href="<c:url value='/_50_shop/_53_shopRegister/InsertShop' />"> --%>
<!--                         <button><span>申請商家</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<%--                 </c:if> --%>
<!--                 <div class="item"> -->
<!--                     <a href="#"> -->
<!--                         <button><span>新增信用卡</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="item"> -->
<%--                     <a href="<c:url value='/doLogout'/>" onclick="return window.confirm('確定登出嗎?');"> --%>
<!--                         <button><span>登出</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </aside> -->

        <main>

            <form:form method="POST" modelAttribute="member" class="info" enctype="multipart/form-data">
				
				<div class="item">
		            <img src='${pageContext.request.contextPath}/_00_init/getMemberImage?memberId=${LoginOK.memberId}'
		                  id="headImg" height='200px' width='200px'>				
	            </div>
            	<div>
            		<label for="file" class="editPhoto">
	                    <i class="fas fa-image">編輯會員照片
	                    <form:input type="file" id="file" path="memberMultipartFile" accept=".jpeg,.png" 
	                    style="display: none;"/></i>
	                </label>
            	</div>
            
                <div>
                    <h3> 姓名 : </h3>
                    <form:label path="fullname">
                    <form:input path="fullname" type="text" id="name"/>
                    </form:label>
                </div>
                <div>
                    <h3> 密碼 : </h3>
                    <form:label path="password">
                    <form:input path="password" type="password" id="password"/>
                    </form:label>
                </div>
                <div>
                    <h3> 性別 : </h3>
                    <form:label path="sex" class="sex-css">
                    <form:radiobutton path="sex" value="Male" label="Male" />
            		<form:radiobutton path="sex" value="Female" label="Female" />
            		<form:radiobutton path="sex" value="Others" label="Others" />
                    </form:label>
                </div>
                <div>
                    <h3> 生日 : </h3>
                    <form:label path="birthday">
                    <form:input path="birthday" type="date" id="date" />
                    </form:label>
                </div>
                <div>
                    <h3> 手機號碼 : </h3>
                    <form:label path="phone">
                    <form:input path="phone" id="tel"/>
                    </form:label>
                </div>
                <div>
                    <h3> email : </h3>
                    <form:label path="email">
                    <form:input path="email" type="email" id="email" />
                    </form:label>
                </div>
                <div>
                    <h3> 地址 : </h3>
                    <form:label path="address">
                    <form:input path="address" type="text" id="address" />
                    </form:label>
                </div>

                <div>
                    <form:button type="submit" 
                    onclick="return window.confirm('確定修改嗎?');"><i class="far fa-address-card"></i>修改資料</form:button>
                    
                </div>
   
            </form:form>
        </main>

    </div>
<!-- -------------------------------引入共同的頁尾---------------------------------------- -->
<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
<!-- -------------------------------引入共同的頁尾----------------------------------------- -->
</body>
</html>