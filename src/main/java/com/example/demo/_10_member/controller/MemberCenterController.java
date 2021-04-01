package com.example.demo._10_member.controller;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo._02_model.entity.CouponBean;
import com.example.demo._02_model.entity.FavoriteCouponListBean;
import com.example.demo._10_member.entity.Member;
import com.example.demo._10_member.service.MemberServiceImpl;
import com.example.demo._30_coupon._33_editCoupon.service.FavoriteCouponService;
import com.example.demo._50_shop._51_coupon.service.CouponService;





@Controller
@RequestMapping("/member")
@SessionAttributes("LoginOK")
public class MemberCenterController {
	
	@Autowired
	ServletContext context;
	
	@Autowired
	MemberServiceImpl memberServiceImpl;
	
	@Autowired
	CouponService couponService;
	
	@Autowired
	FavoriteCouponService favoriteCouponService;
		
	// 會員修改資料頁面渲染
	@GetMapping("/update/{memberId}")
	public String update(@PathVariable Integer memberId) {
		
		return "/_11_member/member_update";
	}
	
	// 會員收藏優惠券頁面渲染
	@GetMapping("/keep/coupons")
	public String keepCoupon(Model model) {
		
		Member mb = (Member) model.getAttribute("LoginOK");

		List<FavoriteCouponListBean> couponlist = 
				favoriteCouponService.getFavoriteCouponByMemberId(mb.getMemberId());
		
		Set<CouponBean> coupons = null;
		
		for (FavoriteCouponListBean favoriteCouponListBean : couponlist) {
			coupons = favoriteCouponListBean.getCoupons();			
		}
		
		model.addAttribute("coupons",coupons);
			
		return "/_11_member/member_coupon";
	}
	
	// 會員刪除喜愛優惠券
	@GetMapping("/delete/{coupon_id}")
	public String deleteCoupon(@PathVariable Integer coupon_id,Model model) {

		Member mb = (Member) model.getAttribute("LoginOK");
					
		favoriteCouponService.deleteSingleFavoriteCouponByMemberId(mb.getMemberId(), coupon_id);

		
		return "redirect:/member/keep/coupons";
	}
	
	
	
	// 會員修改資料表單提交
	@PostMapping("/update/{memberId}")
	public String update(Member member){
	
		MultipartFile picture = member.getMemberMultipartFile();
		String originalFilename = picture.getOriginalFilename();
		
		String ext = "";
		if (originalFilename.lastIndexOf(".") > -1) {
			ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		}
		
		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			member.setFileName(originalFilename);
		}
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (picture != null && !picture.isEmpty()) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				member.setImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		
		memberServiceImpl.insertMember(member);
		
		return "redirect:/";
	}
	

	@ModelAttribute("member")
	public Member editMember(
		 @PathVariable(value="memberId", required = false) Integer memberId
		,Model model) {
		System.out.println("@ModelAttribute修飾的方法執行中");
		Member member = null;
		if (memberId != null) {		
			
			member = (Member) model.getAttribute("LoginOK");

			System.out.println("在@ModelAttribute修飾的方法 讀到物件:" + member);
		} else {
			member = new Member();
			System.out.println("在@ModelAttribute修飾的方法 無法讀取物件:" + member);
		}
		return member;
	}
	
	
	// 顯示來自資料庫優惠券的圖片
	@RequestMapping(value = "/getCouponPicture/{couponId}")
	public ResponseEntity<byte[]> getPicture(
			HttpServletResponse resp, 
			@PathVariable Integer couponId){
		String filePath = "/data/images/mediumPic/noImage1.PNG"; //預設圖片路徑
		byte[] pic = null;
		String filename = "";
		int len = 0;
		HttpHeaders headers = new HttpHeaders();
		CouponBean couponBean = couponService.getCoupon(couponId); 
		if(couponBean != null) {
			Blob blob = couponBean.getCoupon_pic();
			filename = couponBean.getFile_name();
			if(blob != null) {
				try {
					len = (int) blob.length();  //取得照片大小
					pic = blob.getBytes(1, len); //???   jdbc相關類別都是1開頭
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
				}
			}else { //如果沒有照片
				pic = toByteArray(filePath);
				filename = filePath;
			}
		}else {
			pic = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue()); //請瀏覽器不要快取圖片內容
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType); //把字串轉成 mediaType 型別的物件
		System.out.println("mediatype = " + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responoEntity = new ResponseEntity<>(pic, headers, HttpStatus.OK); 
		return responoEntity;
	}
	//	將照片以位元組陣列方式讀入
	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int)size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		}catch (FileNotFoundException e) {
			e.printStackTrace();
		}catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
	
}
