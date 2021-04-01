<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>公告</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value='/_00_util/adminUtil/css/normalize.css'/>">
     <link rel="stylesheet" href="<c:url value='/_00_util/allUtil/css/background.css'/>">
    <link rel="stylesheet" href="<c:url value='/_00_util/adminUtil/css/admin_announcement.css'/>">
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
                <div class="announcement">
                    <div>
                        <fieldset>
                            <legend align="center">近期公告</legend>
                            <a href="#">2020/07/05 饒河夜市 胡椒餅 成為Yachi店家</a><br><br>
                            <a href="#">2020/08/09 中原活動開始</a><br><br>
                            <a href="#">2020/08/29 遼寧夜市 客家湯圓 成為Yachi店家</a><br><br>
                            <a href="#">2020/10/01 師大夜市 我家牛排 已下架</a><br><br>

                        </fieldset>
                    </div>
                    <div>
                        <fieldset style="height: 850px;">
                            <legend align="center">建立公告</legend>
                            <div class="announcement-mid">
                                <label for="">公告名稱 :</label>
                                <input type="text" placeholder="請輸入公告名稱" maxlength="30" style="margin-left: 2.8rem";>
                            </div>
                            <div class="announcement-mid">
                                <label for="">公告日期 :</label>
                                <input type="date" value="1" step="1" min="0" style="width: 180px; margin-left: 2.8rem";> 
                                <label for="" style="margin-left: 0.5rem"> ~ </label>
                                <input type="date" value="1" step="1" min="0" style="width: 180px; margin-left: 0.5rem";>
                            </div>
                            <div class="announcement-mid" style="display: flex; margin-bottom: 0px;">
                                <label for="">公告內文 :</label>
                                <div class='announcement-functionbar'>
                                    <table style="margin-left: 2.5rem;">
                                    <tr>
                                        <td><a href="#" style="color: #fff;"><b>B</b></a></td>
                                        <td><a href="#" style="color: #fff;"><I>I</I></a></td>
                                        <td style="text-decoration: underline;"><a href="#" style="color: #fff;">U</a></td>
                                    </tr> 
                                    </table>
                                </div>
                            </div>
                                <div>
                                    <textarea style="resize: none; width: 500px; height: 200px;"></textarea>
                                </div>
                            <div class="announcement-img">
                                <label for="">優惠活動圖片 :</label>
                                <div style="display: flex;">
                                    <label for="file">
                                        <i class="fas fa-image announcement-photo" style="margin-top: 2rem;">
                                            ☛選擇圖片<input type="file" id="file" accept=".jpeg,.png" style="display: none;">
                                        </i>
                                    </label>
                                    <div class="item">
                                        <img src="https://picsum.photos/500/250" id="headImg" style="margin-left: 25px; margin-top: -35px;">
                                    </div>
                                </div>
                            </div>
                            <div>
                                <a href="#">
                                    <button class="announcement-button">儲存</button>
                                </a>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </main>
        </div>
    </div>
    <!-- -------------------------------引入共同的頁尾---------------------------------------- -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	<!-- -------------------------------引入共同的頁尾----------------------------------------- -->
</body>
</html>   