package com.example.demo._50_shop._51_coupon.contorller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo._02_model.entity.CouponBean;
import com.example.demo._02_model.entity.ShopTypeBean;
import com.example.demo._10_member.entity.Member;
import com.example.demo._50_shop._51_coupon.service.CouponService;
import com.example.demo._50_shop._53_shopRegister.service.ShopTypeService;




@Controller
@RequestMapping("/_50_shop/_51_coupon")
@SessionAttributes({"LoginOK"})
public class CouponController {
	
	
	
	String inputDataForm = "_06_coupon/InsertCoupon"; 
	
	@Autowired
	CouponService couponService;
	
	@Autowired
	ShopTypeService shopTypeService;
	
	@Autowired
	ServletContext context;
	
	
	
	@GetMapping("modifyCoupon/{couponId}")
	public String showUpdateForm(Model model, @PathVariable Integer couponId) {
		CouponBean couponBean = couponService.getCoupon(couponId);
		model.addAttribute("couponBean", couponBean);
		return "/_50_shop/_51_coupon/UpdateCoupon";
	}
	
	@PostMapping("modifyCoupon/{couponId}")
	public String updateForm(@ModelAttribute CouponBean bean,  
			Model model, BindingResult result, 
			RedirectAttributes redirectAttributes,
			@PathVariable Integer couponId
			) {
		long sizeInBytes = -1;
		MultipartFile picture = bean.getCoupon_image();
		if(picture.getSize() == 0) {
			CouponBean original = couponService.getCoupon(couponId);
			bean.setCoupon_pic(original.getCoupon_pic());
			bean.setFile_name(original.getFile_name());
		}else {
			sizeInBytes = picture.getSize();
			String originalFilename = picture.getOriginalFilename();
			if(originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				bean.setFile_name(originalFilename);
			}
			if (picture != null && !picture.isEmpty()) {
				try {
					byte[] b = picture.getBytes();
					Blob blob = new SerialBlob(b);
					bean.setCoupon_pic(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
		}
		bean.setCoupon_id(couponId);
		Member mb = (Member) model.getAttribute("LoginOK");
		bean.setShopBean(mb.getShopBean());
		couponService.updateCoupon(bean);
		
		
		return "redirect:/_50_shop/_51_coupon/InsertCoupon/" + mb.getShopBean().getShop_id();
	}
	
	
	@GetMapping("deleteCoupon/{couponId}")
	public String deleteCoupon(@PathVariable Integer couponId, Model model) {
		couponService.deleteCoupon(couponId);
		Member mb = (Member) model.getAttribute("LoginOK");
		return "redirect:/_50_shop/_51_coupon/InsertCoupon/" + mb.getShopBean().getShop_id();
	}

	@GetMapping("/InsertCoupon")	
	public String sendingEmptyForm(Model model, HttpSession session) {
		Member mb = (Member) model.getAttribute("LoginOK");
//		Member mb = (Member) session.getAttribute("member");
		int shopId = mb.getShopBean().getShop_id();
		List<CouponBean> coupons = couponService.getShopCoupons(shopId);
		model.addAttribute("coupons", coupons);
		return "/_50_shop/_51_coupon/InsertCoupon";
	}
	
	@GetMapping("/InsertCoupon/{shopId}")	
	public String sendingEmptyFormAndShop(Model model, @PathVariable Integer shopId) {
		CouponBean couponBean = new CouponBean();
		model.addAttribute("couponBean", couponBean);
		List<CouponBean> coupons = couponService.getShopCoupons(shopId);
		
		model.addAttribute("coupons", coupons);
		return "/_50_shop/_51_coupon/InsertCoupon";
	}
	
	@PostMapping("/InsertCoupon/{shopId}")
	public String processFormData(
			@ModelAttribute("couponBean") CouponBean couponBean,
			BindingResult result, Model model,
			HttpServletRequest request
			) {
		Member mb = (Member) model.getAttribute("LoginOK");
		couponBean.setShopBean(mb.getShopBean());
		MultipartFile picture = couponBean.getCoupon_image();
		String originalFilename = picture.getOriginalFilename();
		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			couponBean.setFile_name(originalFilename);
		}
		if (picture != null && !picture.isEmpty()) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				couponBean.setCoupon_pic(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		
		couponService.saveCoupon(couponBean);
		
		return "redirect:/_50_shop/_51_coupon/InsertCoupon/" + mb.getShopBean().getShop_id();
	}
	
	
	
	@RequestMapping(value = "/getPicture/{couponId}")
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
	
	
	
	@ModelAttribute
	public CouponBean prepareCouponBean(HttpServletRequest req) {
		CouponBean couponBean = new CouponBean();
		return couponBean;
	}
	
	@ModelAttribute
	public List<ShopTypeBean> getShopType() {
		return shopTypeService.getShopType();
	}
}
