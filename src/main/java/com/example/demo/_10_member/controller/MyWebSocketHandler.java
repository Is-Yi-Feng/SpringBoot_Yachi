package com.example.demo._10_member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.websocket.EndpointConfig;
import javax.websocket.OnOpen;
import javax.websocket.Session;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class MyWebSocketHandler extends TextWebSocketHandler {

//   @Override
//   protected void handleTextMessage(WebSocketSession session, TextMessage message)
//         throws Exception {
//
//      String clientMessage = message.getPayload();

//      if (clientMessage.startsWith("Hello") || clientMessage.startsWith("Hi")) {
//         session.sendMessage(new TextMessage("Hello! What can i do for you?"));
//    	
//         session.sendMessage(new TextMessage(clientMessage));
//      } else {
//         session.sendMessage(
//               new TextMessage("This is a simple hello world example of using Spring WebSocket."));
//      }
//      session.sendMessage(new TextMessage("echo: "+message.getPayload()));
//   }

//   @OnOpen
//   public void open(Session session,EndpointConfig config) {
//	   Set<Session> sessions = session.getOpenSessions();
//	   for(Session s:sessions) {
//		   try {
//			   s.getBasicRemote().sendText("hello everyone");
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//	   }
//   }

	// 裝線上使用者的容器

	private static final Map<String, WebSocketSession> users;

	static {
		users = new HashMap<>();
	}
	// public MyWebSocketHandler() { }

	/**
	 * 
	 * 建立连接后触发的回调
	 * 
	 * 记录用户的连接标识，便于后面发信息，
	 * 
	 * 这里我是记录将id记录在Map集合中。
	 * 
	 * 一个Map中不能包含相同的key，每个key只能映射一个value,根据先后put的顺序覆盖
	 * 
	 * @param session
	 * 
	 * @throws Exception
	 * 
	 */

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		System.out.println("成功連線");
		// 這邊的session只有該使用者
		String userName = getClientId(session);
		if (userName != null) {
			System.out.println("使用者" + userName + "登錄！");
			users.put(userName, session);
//			session.sendMessage(new TextMessage("server:成功建立socket連線"));
			System.out.println("目前線上使用者" + users.size() + ": " + users);
		}
		Set<String> clientIds = users.keySet();
		for (String clientId : clientIds) {
			try {
				WebSocketSession session2 = users.get(clientId);
				if (session2.isOpen()) {
//					session2.sendMessage(new TextMessage(userName + "已上線"));
					for(String name : clientIds) {
						session2.sendMessage(new TextMessage("add%" + name));
					}
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		// userName為空時，代表使用者沒有輸入名字，會造成後續程式問題，因此不儲存使用者
		// 所以要分表使用者有沒有重複應該在這裡？但如果使用會員系統就不會有重複問題
	}

	

	@Override  //斷開socket連線後才執行，所以此時的session已經無法傳送訊息
	public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {

		String userName = getClientId(session);
		System.out.println("\n使用者" + userName + "已退出: " + closeStatus);
		users.remove(userName);
		System.out.println("剩餘使用者" + users.size() + ": " + users);
		
		
	}

	//收到訊息時就會傳到此方法

//   @Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) {
		// 從js中的websocket.send傳來

//       System.out.println("client:"+message.getPayload());
//       WebSocketMessage message1 = new TextMessage("server:"+message);
		
		String raw = message.getPayload();
		
		if(raw.indexOf("@") != -1) {
			sendMessageToUser(message);
		}else if(raw.indexOf("delete%") != -1){
			Set<String> clientIds = users.keySet();

			for (String clientId : clientIds) {
				try {
					WebSocketSession session1 = users.get(clientId);
					if (session1.isOpen()) {
						message = new TextMessage(message.getPayload());
						session1.sendMessage(message);
						session1.sendMessage(new TextMessage("delete%" + getClientId(session)));
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
		}else {
			sendMessageToAllUsers(message,session);
			
		}
		
		

		

//       try {
//           session.sendMessage(message1);
//       } catch (IOException e) {
//
//           e.printStackTrace();
//       }
	}

	/**
	 * 
	 * 传输消息出错时触发的回调
	 * 
	 * 连接出错处理，主要是关闭出错会话的连接，和删除在Map集合中的记录
	 * 
	 * @param session
	 * 
	 * @param exception
	 * 
	 * @throws Exception
	 * 
	 */

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {

		if (session.isOpen()) {
			session.close();
		}
		System.out.println("連接出現問題");
		users.remove(getClientId(session));
	}

	/**
	 * 
	 * 是否处理分片消息
	 * 
	 * @return
	 * 
	 */

	public boolean supportsPartialMessages() {
		return false;
	}

	//指定人私訊

	public boolean sendMessageToUser(TextMessage message) {
		
		String raw = message.getPayload();
		String[] parts = raw.split("@");
		String[] target = parts[0].split(":");
		String person = target[1].trim();
		String origin = target[0].trim();
		
		try {
			WebSocketSession session = users.get(person);
			if (session.isOpen()) {
				message = new TextMessage(target[0] + " : " + parts[1]);
				session.sendMessage(message);
			}
			session = users.get(origin);
			if (session.isOpen()) {
				message = new TextMessage(target[0] + " : " + parts[1]);
				session.sendMessage(message);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

//		if (users.get(clientId) == null)
//			return false;
//
//		WebSocketSession session = users.get(clientId);
//
//		System.out.println("sendMessage:" + session);
//
//		if (!session.isOpen())
//			return false;
//		try {
//			session.sendMessage(message);
//		} catch (IOException e) {
//			e.printStackTrace();
//			return false;
//		}
		return true;
	}

	//廣播訊息

	public boolean sendMessageToAllUsers(TextMessage message, WebSocketSession session) {
		boolean allSendSuccess = true;

//		Set<String> clientIds = users.keySet();
//
//		WebSocketSession session = null;
//
//		for (String clientId : clientIds) {
//			try {
//				session = users.get(clientId);
//				if (session.isOpen()) {
//					session.sendMessage(message);
//				}
//			} catch (IOException e) {
//				e.printStackTrace();
//				allSendSuccess = false;
//			}
//		}
		Set<String> clientIds = users.keySet();

		for (String clientId : clientIds) {
			try {
				WebSocketSession session1 = users.get(clientId);
				if (session1.isOpen()) {
					message = new TextMessage(message.getPayload());
					session1.sendMessage(message);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return allSendSuccess;
	}

	//取得clientid
	
	private String getClientId(WebSocketSession session) {
		try {
			String clientId = (String) session.getAttributes().get("123");
			return clientId;
		} catch (Exception e) {
			return null;
		}
	}
}
