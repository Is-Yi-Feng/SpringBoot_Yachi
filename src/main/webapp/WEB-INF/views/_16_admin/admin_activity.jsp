<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>平台優惠活動</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value='/_00_util/allUtil/css/background.css'/>">
    <link rel="stylesheet" href="<c:url value='/_00_util/adminUtil/css/normalize.css'/>">
    <link rel="stylesheet" href="<c:url value='/_00_util/adminUtil/css/admin_activity.css'/>">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
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
                <div class="active">
                	<form:form method="POST" modelAttribute="AdminActivityBean" enctype="multipart/form-data" name="myForm">
                    <div>
                        <fieldset>
                            <legend align="center">優惠活動</legend>
                         	<c:forEach var="adminactivities" varStatus="stat" items="${adminactivityList}">
								<a href="<c:url value='/admin/modifyAdminActivity/${adminactivities.adminactivity_id}' />">
								${adminactivities.adminactivity_name} ----->時間:${adminactivities.adminactivity_begin}至${adminactivities.adminactivity_end}</a><br>
							</c:forEach>
<!--                             <a href="#">2020/01/30-2020/02/15 月老助你一指傳情</a><br><br> -->
<!--                             <a href="#">2020/01/20-2020/02/25 金牛報喜</a><br><br> -->
                        </fieldset>
                    </div>
<!--                     <div> -->
<!--                         <fieldset> -->
<!--                             <legend align="center">過期優惠活動</legend> -->
<!--                             <a href="#">2020/08/09-2020/09/01 中元節活動，集點換旺旺</a><br><br> -->
<!--                             <a href="#">2020/09/15-2020/10/01 慶中秋，月餅買十送一優惠券</a><br><br> -->
<!--                             <a href="#">2020/11/11 1111購物節，集優惠券換老婆餅</a><br><br> -->
<!--                         </fieldset> -->
<!--                     </div> -->
                    <div style="border: 2px solid black; border-radius: 20px; padding: 2rem;">
	                    <div class="active-mid">
	                        <label for="">優惠活動名稱 :</label>
	                        <form:input type="text" path="adminactivity_name" id="adminactivity_name" placeholder="輸入活動名稱" maxlength="30" size="75px"/>
	                    </div>
	                    <div class="active-mid">
	                        <label for="">優惠活動日期 : 開始</label>
	                        <form:input type="date" path="adminactivity_begin" id="adminactivity_begin" style="margin-left: 5px;"/>
	                        <label for=""> ~ </label>
	                        <form:input type="date" path="adminactivity_end" id="adminactivity_end" style="margin-right: 5px;"/>
	                        <label for="">結束</label>
	                    </div>
	                    <div style="display: flex;">
	                        <label for="">優惠活動內文 :</label>
	                        <div class='active-functionbar'>
	                            <table>
	                            <tr>
	                                <td><b>B</b></td>
	                                <td><I>I</I></td>
	                                <td style="text-decoration: underline;">U</td>
	                            </tr> 
	                            </table>
	                        </div>
	                    </div>
	                        <div>
	                            <form:textarea path="adminactivity_content" id="adminactivity_content" style="resize: none; width: 550px; height: 200px;"></form:textarea>
	                        </div>
	                    
	                    <div class="active-img">
	                        <label for="">優惠活動圖片 :</label>
	                        <div style="display: flex;">
	                            <label for="file">
                                	<i class="coupon-photo" style="margin-top: 2rem; font-size: 18px;">
                              			<form:input type="file" id="adminactivity_image" path="adminactivity_image" accept=".jpeg,.png" style="margin-left: 0px;"/>  <!--  style="display: none;" -->
                                	</i>
                            	<div class="item">
                                	<img src="${pageContext.request.contextPath}/data/images/smallPic/coupon2.png" id="headImg1" style="width:200px; height: 200px;border: solid 1px #ddd">
                            	</div>
                            </label>
	                        </div>
	                    </div>
	                    <div class="active-btn">
	                        
	                            <button type="submit" class="active-button">儲存</button>
	                    </div>
                    </div>
                    </form:form>
                </div>
            </main>
        </div>
    </div>
    <!-- -------------------------------引入共同的頁尾---------------------------------------- -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	<!-- -------------------------------引入共同的頁尾----------------------------------------- -->
	
    <script>
	$(document).ready(function(){
	  $('#adminactivity_image').change(function(){
		  readURL(this);
	  })
	  //因為單選的關係，所以有檔案一定是在第0個。
	  function readURL(input){
		  if(input.files && input.files[0]){
		    let reader = new FileReader();
		    reader.onload = function (e) { //讀出來是二進位檔案
		    	$('#headImg1').attr('src', e.target.result);
// 		    	$('#headImg1').attr({src:this.result , width:`200px`,height:`200px`});
		    }
		    reader.readAsDataURL(input.files[0]); 
		  }
		}
	});

	</script>
</body>
</html>