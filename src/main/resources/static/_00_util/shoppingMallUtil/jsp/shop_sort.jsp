<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

/* 左半邊 */
aside{
    /* background: green; */
    position: absolute;
    left: 0;
    width: 20%;
    /* float: left; */      
   
}
.left_container{
    background: #EDD9D9;
    padding-top: 15px;
    height: auto;
    border-radius: 5px;
    
}
.onlineShop{
    display: flex;
    justify-content: center;
    background: #C39C9C;
    width: 80%;
    height: auto;
    margin: 0 auto;
    margin-top: 5px;
    color: #ffffff;
}
.onlineShop h3{
  margin: 5px;
}
.items{
    padding: 15px 0;
    margin-left: 20px;
}
.items a span{
  font-size: 1.2rem;
    color: #333333;
    text-decoration: none;
    letter-spacing: 6px;
    transition: .1s;
    cursor: pointer;
}
.items a span:hover{
    border-radius: 5px;
    background: #ffffff;
    opacity: 0.6;
}
.hr{
    width: 80%;
    margin: 0 auto;
    border: 1px solid rgba(255,255,255,.6);
}
</style>
</head>
<body>
	 <!-- leftSide start -->
            <aside>
                <div class="left_container">
                    <div class="onlineShop">
                        <h3>線上商城</h3>
                    </div>
                    <div class="items">
                            <a href='<c:url value='/DisplayPageProducts'/>'><span>最新商品</span></a>
                    </div>
                	<c:forEach var='sort' items='${sortList}'>
                    	<hr class="hr">
	                    <div class="items">         
	                    												
	                           <a href="<c:url value='/sortId=${sort.product_type_id}'/>"><span>${sort.product_type_name}</span></a>
	                    </div>
					</c:forEach>
                </div>
            </aside>
     <!-- leftSide over -->
</body>
</html>