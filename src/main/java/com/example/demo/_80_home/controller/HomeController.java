package com.example.demo._80_home.controller;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.demo._02_model.entity.AdminActivityBean;
import com.example.demo._02_model.entity.NightMarketBean;
import com.example.demo._10_member.entity.Member;
import com.example.demo._10_member.service.MemberServiceImpl;
import com.example.demo._50_shop._53_shopRegister.service.NightMarketService;
import com.example.demo._90_admin._94_editActivity.service.editActivityService;


@Controller
@SessionAttributes({ "LoginOK","sessionCartVoList","memberCartVoList","adminactivityBeanList"})
public class HomeController {
	
	@Autowired
	MemberServiceImpl memberServiceImpl;
		
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	NightMarketService nightMarketService;
	
	@Autowired
	editActivityService editactivityService;
	
	
	// 首頁的映射
	@RequestMapping({"/","/home"}) 
	public String jspHome(Model model,HttpSession session) {
		
		
		String name = SecurityContextHolder.getContext()
										   .getAuthentication().getName();
		Member member = memberServiceImpl.findUsername(name);
		
		if(member != null) {			
			model.addAttribute("LoginOK",member);
		}
		
		List<AdminActivityBean> list = editactivityService.getCurrentAdminActivity();
		NightMarketBean night1 = nightMarketService.getNightMarketById(1);
		NightMarketBean night2 = nightMarketService.getNightMarketById(2);
		NightMarketBean night3 = nightMarketService.getNightMarketById(3);
		NightMarketBean night4 = nightMarketService.getNightMarketById(4);
		NightMarketBean night5 = nightMarketService.getNightMarketById(5);
		NightMarketBean night6 = nightMarketService.getNightMarketById(6);
		NightMarketBean night7 = nightMarketService.getNightMarketById(7);
		NightMarketBean night8 = nightMarketService.getNightMarketById(8);
//		session.setAttribute("adminactivityBeanList", list);
		model.addAttribute("adminactivityBeanList", list);
		
		model.addAttribute("night1", night1);
		model.addAttribute("night2", night2);
		model.addAttribute("night3", night3);
		model.addAttribute("night4", night4);
		model.addAttribute("night5", night5);
		model.addAttribute("night6", night6);
		model.addAttribute("night7", night7);
		model.addAttribute("night8", night8);
		
		
		return "_17_home/home";  	
	}
	
	// 標頭的映射 
	@RequestMapping("/_00_util/allUtil/jsp/header") 
	public String header_fragment() {
		
		return "/_00_util/allUtil/jsp/header"; 
	}
	
	
//	=============================== 紅豆餅介面 ============================================

	@RequestMapping("/RedBean_pies")
	public String RedBean_pies(Model model) {
		return "_15_coupon/RedBean_pies";
	}
	
//	=============================== 吐司介面 ============================================

	@RequestMapping("/bread")
	public String bread(Model model) {
		return "_15_coupon/bread";
	}
	
	
	// 測試頁面的映射
	@RequestMapping("/index") 
	public String testHome(Model model,HttpServletRequest request) {
		
		HttpSession session = request.getSession();		
		Member mem = (Member) session.getAttribute("LoginOK");		
		System.out.println("測試session有沒有被抓到 --> "+ mem );
		
		return "/_11_member/index";  //視圖邏輯名稱指定向index.jsp
	}
	
	
	
	// 顯示會員照片
	@GetMapping("/_00_init/getMemberImage")   
	public ResponseEntity<byte[]>  getMemberImage(@RequestParam("memberId") 
													Integer memberId) {
		InputStream is = null;
		OutputStream os = null;
		String fileName = null;
		String mimeType = null;
		byte[] media = null;
		ResponseEntity<byte[]> responseEntity = null;
		HttpHeaders headers = new HttpHeaders();
		MediaType mediaType = null;
		Blob blob = null;
		try {
			Member member = memberServiceImpl.findByMemberId(Integer.valueOf(memberId));
			if (member != null) {
				blob = member.getImage();
				if (blob != null) {
					is = blob.getBinaryStream();
				}
				fileName = member.getFileName();
			}
			// 如果圖片的來源有問題，就送回預設圖片(/images/NoImage.png)	
			if (is == null) {
				fileName = "blank-profile.png" ; 
				is = servletContext.getResourceAsStream(
						"/data/images/" + fileName);
			}
			// 由圖片檔的檔名來得到檔案的MIME型態
			mimeType = servletContext.getMimeType(fileName);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			// 由InputStream讀取位元組，然後由OutputStream寫出
			int len = 0;
			byte[] bytes = new byte[8192];
			
			while ((len = is.read(bytes)) != -1) {
				baos.write(bytes, 0, len);
			}
			media = baos.toByteArray();
			mediaType = MediaType.valueOf(mimeType);
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
			headers.setContentType(mediaType);
			responseEntity =  new ResponseEntity<>(media, headers, HttpStatus.OK);
		} catch(Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("_00_init.util.RetrieveBookImageServlet#doGet()發生Exception: " + ex.getMessage());
		} finally{
			try {
				if (is != null) is.close();
			} catch(IOException e) {
				;
			}
			try {
				if (os != null) os.close();
			} catch(IOException e) {
				;
			}
		}
		return responseEntity;
	}
	
	

}
