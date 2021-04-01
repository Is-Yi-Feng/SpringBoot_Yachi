<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value='/_00_util/memberUtil/css/reset.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/_00_util/memberUtil/css/LoginAndRegister.css'/>" type="text/css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <title>Document</title>
        
    <script>
        $(function () {

            // 右邊註冊按鈕事件
//             $('#register-now').click(function(){

//                 $('#container').addClass('toRightAction');

//             });

            // 登入按鈕事件
            $('#login-now').click(function(){

                $('#container').removeClass('toRightAction');

            });

        });

    </script>
    <style>
    	.error{
        color:red;
    	font-size:8px;
        display: flex;
        width:100px;
        flex-wrap:wrap;
        justify-content: center;
        align-items: center;
        position: absolute;
        top: 5px;
        right: -110.5px;
        margin-bottom: 5px;

      }
      
      .homeicon i{
      	color: orange;
      	font-size: 30px;
      }
      
    </style>
<body >

    <div class="container" id="container">

      <div class="form-container register-container">       

      </div>


      <div class="form-container login-container">

        <form:form action="findPwd" method="POST" modelAttribute="member">
          
          <h2>會員找回密碼</h2>

          <div class="social-container">
            <a href="<c:url value='/home'/>" class="social homeicon"><i class="fas fa-home"></i></a>
          </div>

          <span></span>
                    
          <div class="input-div">
             <form:label path="username">帳號</form:label>
             <form:input path="username" name="username" type="text"/>
             <span Class="error">${accountError}</span>
          </div>

          <div class="input-div">
            <form:label path="email">email</form:label>
            <form:input path="email" name="email" type="email"/>
            <span Class="error">${emailError}</span>
         </div>
                      
          <form:button type="submit" class="btn">寄出驗證信</form:button>

        </form:form>
        
        
      </div>

      <div class="over-container">

        <div class="over">

          <div class="over-item over-left">

            <div class="img-box">
              <img src="<c:url value='/data/images/smallPic/yachiLogo50.png'/>" alt="">
            </div>

            <h2>已有帳號?</h2>
            <p>請使用你的帳號進行登入</p>
            <button class="over-btn" id="login-now">登入</button>
          </div>

          <div class="over-item over-right">

            <div class="img-box">
              <img src="<c:url value='/data/images/smallPic/yachiLogo50.png'/>" alt="">
            </div>

<!--             <h2>沒有帳號?</h2> -->
<!--             <p>立即註冊加入我們</p> -->
<!--             <button class="btn over-btn" id="register-now">註冊</button> -->
          </div>

        </div>

      </div>

    </div>

</body>
    
</html>