package com.example.demo._10_member.mail;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.util.MailSSLSocketFactory;

public class MailUtil implements Runnable {
	private String email;// 收件人郵箱
	private String code;// 啟用碼

	public MailUtil(String email, String code) {
		this.email = email;
		this.code = code;
	}

	public void run() {
		// 1.建立連線物件javax.mail.Session
		// 2.建立郵件物件 javax.mail.Message
		// 3.傳送一封啟用郵件
		String from = "yachijava015@gmail.com";// 發件人電子信箱
		String host = "smtp.gmail.com"; // 指定傳送email的主機，此為gmail
		Properties properties = System.getProperties();// 獲取系統屬性
		properties.setProperty("mail.smtp.host", host);// 設定email伺服器
		properties.setProperty("mail.smtp.auth", "true");// 開啟認證
		try {
			MailSSLSocketFactory sf = new MailSSLSocketFactory();
			sf.setTrustAllHosts(true);
			properties.put("mail.smtp.ssl.enable", "true");
			properties.put("mail.smtp.ssl.socketFactory", sf);
			// 1.獲取預設session物件
			Session session = Session.getDefaultInstance(properties, new Authenticator() {
				public PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("yachijava015@gmail.com", (new Garbled()).getStr()); 
				}
			});
			// 2.建立郵件物件
			Message message = new MimeMessage(session);
			// 2.1設定發件人
			message.setFrom(new InternetAddress(from));
			// 2.2設定接收人
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			// 2.3設定郵件主題
			message.setSubject("YACHI帳號啟用");
			// 2.4設定郵件內容
			String content = "<html><head></head><body><h1>這是一封YACHI啟用郵件,啟用請點選以下連結</h1><h3><a "
					+ "href='http://localhost:8080/emailConfirm/code=" + code + "'>請點這裡</a></h3></body></html>";
			message.setContent(content, "text/html;charset=UTF-8");
			// 3.傳送郵件
			Transport.send(message);
			System.out.println("YACHI帳號啟用郵件成功傳送!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
