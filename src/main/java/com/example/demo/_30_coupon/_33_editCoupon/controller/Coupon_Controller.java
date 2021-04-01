package com.example.demo._30_coupon._33_editCoupon.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.demo._02_model.entity.CouponBean;
import com.example.demo._02_model.entity.CouponUsedBean;
import com.example.demo._02_model.entity.ShopBean;
import com.example.demo._10_member.entity.Member;
import com.example.demo._30_coupon._33_editCoupon.service.FavoriteCouponService;
import com.example.demo._50_shop._51_coupon.service.CouponService;
import com.example.demo._50_shop._53_shopRegister.service.ShopService;



@Controller
@SessionAttributes(value = { "coupon", "allCoupon", "LoginOK" })
public class Coupon_Controller {

//@Controller呼叫@Service呼叫@Repository(Dao)
	@Autowired
	CouponService couponService;
	
	

	@Autowired
	ServletContext context;
	
	@Autowired
	ShopService shopService;

	@Autowired
	SessionFactory factory;
	@Autowired
	FavoriteCouponService favoriteCouponService;
//	=============================== 優惠劵 ============================================

	@RequestMapping("/coupons")
	public String list(Model model) {
		List<CouponBean> list = couponService.getAllCoupons();
		model.addAttribute("coupons", list);
		return "_15_coupon/coupons";
	}
//	=============================== 優惠劵介面 ============================================

	@RequestMapping("/coupon")
	public String getCouponById(@RequestParam("coupon_id") Integer coupon_id,
			Model model) {
		model.addAttribute("coupon", couponService.getCoupon(coupon_id));
		return "_15_coupon/coupon";
	}
	
//	=============================== 會員收藏優惠券 ============================================
	@GetMapping("/addfavorite/add/{coupon_Id}")
	public String addfavorite(Model model, @PathVariable Integer coupon_Id) {
		Member mb = (Member) model.getAttribute("LoginOK");
		
		try {
			favoriteCouponService.saveFavoriteCoupon(couponService.getCoupon(coupon_Id), mb);
		} catch (Exception e) {
			return "redirect:/coupon?coupon_id=" + coupon_Id;
		}

		return "redirect:/coupon?coupon_id=" + coupon_Id;
	}
	
	@GetMapping("/addFavoriteInShop/add/{coupon_Id}")
	public String addFavoriteInShop(Model model, @PathVariable Integer coupon_Id, HttpServletRequest req) {
		Member mb = (Member) model.getAttribute("LoginOK");
		CouponBean couponBean =  couponService.getCoupon(coupon_Id);
		ShopBean shopBean = couponBean.getShopBean();
		
		try {
			favoriteCouponService.saveFavoriteCoupon(couponService.getCoupon(coupon_Id), mb);
		} catch (Exception e) {
			return "redirect:/_50_shop/_54_showShops/ShowShops/" + shopBean.getShop_id();
		}

		return "redirect:/_50_shop/_54_showShops/ShowShops/" + shopBean.getShop_id();
	}
	

	
//	 =============================== 使用優惠券 ============================================
			@GetMapping("/useCoupon/{coupon_Id}")
			public String useCoupon(Model model, @PathVariable Integer coupon_Id) {
				CouponBean couponBean = couponService.getCoupon(coupon_Id);
				
//				System.out.println(couponBean.getShopBean());
				
				Integer shop_id = couponBean.getShopBean().getShop_id();
				ShopBean shopBean = couponService.getShop(shop_id);
//				ShopBean shopBean = couponBean.getShopBean();
				Member mb = (Member) model.getAttribute("LoginOK");
				Timestamp coupon_used_time = new Timestamp(System.currentTimeMillis());
				
				
//				System.out.println("============================controller=======================" );
//				System.out.println("coupon_Id=== " + coupon_Id);
//				System.out.println("couponBean=== " + couponBean);
//				System.out.println("mb=== " + mb);
//				System.out.println("shopBean=== " + shopBean);
//				System.out.println("========================controller==========================" );
				Integer amount = couponBean.getCoupon_amount();
				System.out.println("amount====" + amount);
				if(amount > 0) {
					CouponUsedBean couponUsedBean = new CouponUsedBean();
					couponUsedBean.setCouponBean(couponBean);
					couponUsedBean.setMemberBean(mb);
					couponUsedBean.setShopBean(shopBean);
					couponUsedBean.setCoupon_used_time(coupon_used_time);
					couponBean.setCoupon_amount(amount-1);
					couponService.updateCoupon(couponBean);
					
					couponService.saveCouponUsed(couponUsedBean);
				}else {
					
				}
				
				return "redirect:/coupons";
			}
	



	
	
//	=============================== 轉圖檔 ============================================

	@RequestMapping(value = "/getCouponPicture/{coupon_Id}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer coupon_Id) {
		String filePath = "/images/coupon/nonepic.jpg";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		CouponBean bean = couponService.getCoupon(coupon_Id);
		if (bean != null) {
			Blob blob = bean.getCoupon_pic();
			filename = bean.getFile_name(); // 照片的檔案名稱
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType =" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}

	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}

}
