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
   	<link rel="stylesheet" href="<c:url value='/_00_util/memberUtil/css/reset.css'/>">
	<link rel="stylesheet" href="<c:url value='/_00_util/memberUtil/css/member_update2.css'/>">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<title>chatroom</title>
	<script type="text/javascript">

        var websocket = null;
        var members = new Set([]);
        
      //先取得網址字串，假設此頁網址為「index.aspx?id=U001&name=GQSM」
        var url = location.href;
        var id = `${sessionScope.LoginOK.username}`;
        
        //再來用去尋找網址列中是否有資料傳遞(QueryString)
        if(url.indexOf('?')!=-1)
        {
            //之後去分割字串把分割後的字串放進陣列中
            var ary1 = url.split('?');
            //此時ary1裡的內容為：
            //ary1[0] = 'index.aspx'，ary1[1] = 'id=U001&name=GQSM'
            
            //下一步把後方傳遞的每組資料各自分割
			//var ary2 = ary1[1].split('&');
            //此時ary2裡的內容為：
            //ary2[0] = 'id=U001'，ary2[1] = 'name=GQSM'
            
            //最後如果我們要找id的資料就直接取ary[0]下手，name的話就是ary[1]
            var ary2 = ary1[1].split('=');
            //此時ary3裡的內容為：
            //ary3[0] = 'id'，ary3[1] = 'U001'
            
            //取得id值
            id = ary2[1];
            
            //console.log(id);
            
        }

        if ('WebSocket' in window) {
            var host = window.location.host;
            var url = "ws://"+host+"/yachi/websocket/socketServer.do";
            websocket = new WebSocket(url);
        }

        else if ('MozWebSocket' in window) {
            websocket = new MozWebSocket("ws://localhost:8080/dmoeHSM/websocket/socketServer.do");
        }
        else {
            websocket = new SockJS("http://localhost:8080/chat/sockjs/socketServer.do");
        }

        websocket.onopen = onOpen;
        websocket.onmessage = onMessage;
        websocket.onerror = onError;
        websocket.onclose = onClose;
        
        function onOpen(openEvt) {
            //alert("connection status: success");
        }

        function onMessage(evt) {

            //從session.sendmessage來，透過evt.data取得資料
          
            evt.stopPropagation();  //停止冒泡事件
            evt.preventDefault()
            
            temp1 = evt.data;
           	ary3 = temp1.split(':');
           	console.log("ary3==" + ary3[0]);
           	console.log(id);
            
            console.log(temp1);
            
            if(temp1.indexOf("add%")!=-1){
            	ary2 = temp1.split('%');
            	console.log(ary2[1]);
            	members.add(ary2[1]);
            	showMember();
            	
            }else if(temp1.indexOf("delete%")!=-1){
            	ary2 = temp1.split('%');
            	members.delete(ary2[1]);
            	showMember();
            }else if(ary3[0].trim() == id){
           		//writeToScreen(temp1); 
           		writeLocalToScreen(temp1);
            }else{
            	writeRemoteToScreen(temp1)
            }
        }

        function onError() {
            //發生異常
            writeToScreen(evt.message)
        }

        function onClose() {
            alert("connection status: closed");
        }

        //點選close時觸發的function
        function closeWebSocket() {	
        	websocket.send("delete%");
            websocket.close();
        }

        //浏览器刷新前关闭websockek

        function fnUnloadHandler() {
            websocket.onclose();
        }

        function doSend() {
            if (websocket.readyState == websocket.OPEN) {
                var msg = document.getElementById("inputMsg").value;
                //后台将调用handleTextMessage方法接收该消息               
                temp = id + " : " + msg;
                websocket.send(temp);
                //alert("send success!");               
                document.getElementById("inputMsg").value = "";
            } else {
                alert("send failed!\nconnection is closed!");
            }
        }

        function writeToScreen(message) {

            var pre = document.createElement("p");
            pre.style.wordWrap = "break-word";
            pre.innerHTML += message;
            document.body.appendChild(pre);
            
           
            
        }
        
        function writeLocalToScreen(message){
        	var messageBox = document.getElementById("messageBox");
        	 ary2 = message.split(':');
             
             let local = document.createElement('div');
             local.className = 'user local';  //travel.setAttribute('class', 'travelLocation')
             messageBox.appendChild(local);
             
             let avatar = document.createElement('div');
             avatar.className = 'avatar';
             
             let pic = document.createElement('pic');
             pic.className = 'pic';
             
             
             let img = document.createElement('img');
             img.src = "http://localhost:8080/yachi/_00_init/getMemberImage?memberId=" + ${sessionScope.LoginOK.memberId};
             
             let name = document.createElement('div');
             name.className = 'name';
             name.innerText = ary2[0];
             
             let txt = document.createElement('div');
             txt.className = 'txt';
             txt.innerText = ary2[1];
             
             pic.appendChild(img);
             avatar.appendChild(pic);
             avatar.appendChild(name);
             
             local.appendChild(avatar);
             local.appendChild(txt);
             messageBox.scrollTop = messageBox.scrollHeight
        }
        
        function writeRemoteToScreen(message){
        	var messageBox = document.getElementById("messageBox");
        	 ary2 = message.split(':');
             
             let remote = document.createElement('div');
             remote.className = 'user remote';  //travel.setAttribute('class', 'travelLocation')
             messageBox.appendChild(remote);
             
             let avatar = document.createElement('div');
             avatar.className = 'avatar';
             
             let pic = document.createElement('pic');
             pic.className = 'pic';
             
             
             let img = document.createElement('img');
             img.src = "http://localhost:8080/yachi/_00_init/getMemberImageByName?username=" + ary2[0];
             
             let name = document.createElement('div');
             name.className = 'name';
             name.innerText = ary2[0];
             
             let txt = document.createElement('div');
             txt.className = 'txt';
             txt.innerText = ary2[1];
             
             pic.appendChild(img);
             avatar.appendChild(pic);
             avatar.appendChild(name);
             
             remote.appendChild(avatar);
             remote.appendChild(txt);
             messageBox.scrollTop = messageBox.scrollHeight
        }

        function showMember(){
        	member = document.getElementById('member');
        	/* member.innerText = [...members].join();  */
        	memberList = [...members].join();
        	ary4 = memberList.split(',');
        	console.log(ary4);
        	var memberBox = document.getElementById('memberBox');
        	memberBox.innerHTML = "";
        	
        	for(let i = 0; i < ary4.length; i++){
        		
        	
        	
        	
        	let avatar = document.createElement('div');
        	avatar.className = 'avatar';
        	memberBox.appendChild(avatar);
        	
        	let pic = document.createElement('pic');
            pic.className = 'pic';
            
            
            let img = document.createElement('img');
            img.src = "http://localhost:8080/yachi/_00_init/getMemberImageByName?username=" + ary4[i];
            pic.appendChild(img);
            
            let name = document.createElement('div');
            name.className = 'name';
            name.innerText = ary4[i];
            
            avatar.appendChild(pic);
            avatar.appendChild(name);
            
            }
        	
        }
    </script>

<style>
* {
	margin: 0;
	padding: 0;
	list-style: none;
}

html, body {
	height: 100%;
}

body {
	display: flex;
	justify-content: center;
	align-items: center;
}

.dialogue {
	width: 530px;
	padding: 20px;
	height:700px;
	/*box-shadow: 0 0 10px #3e92cc;*/
	background-color: #f3f5f7;
}

.local {
	justify-content: flex-end;
}

.user {
	display: flex;
	align-items: flex-start;
	margin-bottom: 20px;
}

.user .avatar {
	width: 60px;
	text-align: center;
	flex-shrink: 0;
}

.user .pic {
	border-radius: 50px;
	overflow: hidden;
}

.user .pic img {
	width: 100%;
	vertical-align: middle;
}

.user .txt {
	background-color: #aaa;
	padding: 16px;
	border-radius: 10px;
	position: relative;
}

.remote .txt {
	margin-left: 20px;
	margin-right: 80px;
	color: #a1b4c5;
	background-color: #fff;
}

.local .txt {
	margin-left: 80px;
	margin-right: 20px;
	order: -1;
	background-color: #3e92cc;
	color: #FFF;
}

.remote .txt::before, .local .txt::before {
	content: '';
	position: absolute;
	top: 10px;
	border-top: 10px solid transparent;
	border-bottom: 10px solid transparent;
}

.remote .txt::before {
	border-right: 10px solid #fff;
	left: -10px;
}

.local .txt::before {
	border-left: 10px solid #3e92cc;
	right: -10px;
}

.bottom {
	display: flex;
}

.inputArea {
	margin-right: 10px;
}

.typeArea {
	width: 400px;
	height: 30px;
	border-radius: 10px;
	font-size: 15px;
}

.enterArea {
	display: flex;
}

a:link {
	color: #aaa;
}

a:visited {
	color: #333;
}

.messageBox {
	height: 627px;
	overflow: auto;
}

.container {
	display: flex;
}

.memberBox {
	/* border:1px solid #333; */
	width: 70px;
	/* display: flex; */
	padding: 5px;
	background-color: #bbb;
	/* box-shadow: 0 0 10px #3e92cc; */
	overflow: auto;
	height: 700px;
}

.memberBox .pic {
	border-radius: 50px;
	/* border: 1px solid red; */
	overflow: hidden;
}

.memberBox .pic img {
	width: 100%;
	vertical-align: middle;
}

.memberBox .name {
	margin-left: 15px;
}

.container {
	box-shadow: 0 0 10px #3e92cc;
	height: 700px;
	width: 600px;
}

.memberBox .avatar {
	margin-top: 10px;
}
</style>

</head>
<body onbeforeunload="fnUnloadHandler();">

	<!-- 引入共同的頁首 -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	
	
	

	<div class="main-member">
        <aside>
            <div class="function">
                <h3>會員中心</h3>
				<div class="item">
				
		            <img src='<c:url value='/_00_init/getMemberImage?memberId=${LoginOK.memberId}' /> '
		                  id="headImgg" height='200px' width='200px'>
		                  					
	            </div>
                <div class="item">
                   	<a href="<c:url value='/member/update/${LoginOK.memberId}'/>">
                        <button><span>基本資料</span></button>
                    </a>
                </div>
                <div class="item">
                    <a href="<c:url value='/_23_orderProcess/orderList'/>">
                        <button><span>訂單查詢</span></button>
                    </a>
                </div>
                <div class="item">
                    <a href="<c:url value='/member/keep/coupons'/>">
                        <button><span>我的優惠券</span></button>
                    </a>                    
                </div>
                <div class="item">
                    <a href="<c:url value="/queryFavoriteShop"/>"> 
                        <button><span>喜愛商家</span></button>
                    </a>
                </div>
                <div class="item">
                    <a href="#">
                        <button><span>通知</span></button>
                    </a>
                </div>
                 <c:if test="${empty LoginOK.shopBean.shop_id}">	
                <div class="item">
                    <a href="<c:url value='/_50_shop/_53_shopRegister/InsertShop' />">
                        <button><span>申請商家</span></button>
                    </a>
                </div>
                </c:if>
                <div class="item">
                    <a href="#">
                        <button><span>新增信用卡</span></button>
                    </a>
                </div>
                <div class="item">
                    <a href="<c:url value='/doLogout'/>" onclick="return window.confirm('確定登出嗎?');">
                        <button><span>登出</span></button>
                    </a>
                </div>
            </div>
        </aside>

        <main>
		<div class="container" style="margin:30px auto;">
		<div class="memberBox" id="memberBox"></div>
		<div class="main">
			<div class="dialogue">
				<div id="messageBox" class="messageBox"></div>

				<div class="bottom">
					<div class="inputArea">
						<input type="text" class="typeArea" id="inputMsg">
					</div>
					<div class="enterArea">
						<a href="#"><i class="fas fa-images fa-2x"
							style="margin-right: 10px;"></i></a> <a onclick="doSend();"><i
							class="fas fa-paper-plane fa-2x"></i></a>
					</div>
				</div>
			</div>


		</div>
	</div>
        </main>

    </div>

</body>
</html>