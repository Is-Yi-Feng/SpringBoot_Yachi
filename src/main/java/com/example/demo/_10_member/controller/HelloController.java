package com.example.demo._10_member.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo._10_member.entity.Member;
import com.example.demo._10_member.service.MemberServiceImpl;

@Controller
public class HelloController {
	
	@Autowired
	MemberServiceImpl memberServiceImpl;
	
	// 首頁的映射
//	@RequestMapping({"/","/index"}) 
//	public String jspHome(Model model) {
//		
//		return "index";  //視圖指定向index.jsp
//	}
	
	// 標頭的映射 因為登入方式改成Security
//	@RequestMapping("/_00_util/allUtil/jsp/header") 
//	public String header_fragment(Model model,HttpSession session) {
//		
//		String name = SecurityContextHolder.getContext()
//				.getAuthentication().getName();
//		Member member = memberServiceImpl.findUsername(name);
//		
//		session.setAttribute("LoginOK",member);
//		
//		return "/_00_util/allUtil/jsp/header"; 
//	}
	
	
//	@Autowired
//	ServletContext servletContext;
	
//	@GetMapping("/_00_init/getMemberImage")   
//	public ResponseEntity<byte[]>  getMemberImage(@RequestParam("memberId") 
//													Integer memberId) {
//		InputStream is = null;
//		OutputStream os = null;
//		String fileName = null;
//		String mimeType = null;
//		byte[] media = null;
//		ResponseEntity<byte[]> responseEntity = null;
//		HttpHeaders headers = new HttpHeaders();
//		MediaType mediaType = null;
//		Blob blob = null;
//		try {
//			Member member = memberServiceImpl.findByMemberId(Integer.valueOf(memberId));
//			if (member != null) {
//				blob = member.getImage();
//				if (blob != null) {
//					is = blob.getBinaryStream();
//				}
//				fileName = member.getFileName();
//			}
//			// 如果圖片的來源有問題，就送回預設圖片(/images/NoImage.png)	
//			if (is == null) {
//				fileName = "NoImage.png" ; 
//				is = servletContext.getResourceAsStream(
//						"/images/" + fileName);
//			}
//			// 由圖片檔的檔名來得到檔案的MIME型態
//			mimeType = servletContext.getMimeType(fileName);
//			ByteArrayOutputStream baos = new ByteArrayOutputStream();
//			// 由InputStream讀取位元組，然後由OutputStream寫出
//			int len = 0;
//			byte[] bytes = new byte[8192];
//			
//			while ((len = is.read(bytes)) != -1) {
//				baos.write(bytes, 0, len);
//			}
//			media = baos.toByteArray();
//			mediaType = MediaType.valueOf(mimeType);
//			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
//			headers.setContentType(mediaType);
//			responseEntity =  new ResponseEntity<>(media, headers, HttpStatus.OK);
//		} catch(Exception ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("_00_init.util.RetrieveBookImageServlet#doGet()發生Exception: " + ex.getMessage());
//		} finally{
//			try {
//				if (is != null) is.close();
//			} catch(IOException e) {
//				;
//			}
//			try {
//				if (os != null) os.close();
//			} catch(IOException e) {
//				;
//			}
//		}
//		return responseEntity;
//	}	
	
}
