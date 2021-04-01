package com.example.demo._90_admin._93_editCoupon.conroller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.example.demo._02_model.entity.AdminActivityBean;
import com.example.demo._02_model.entity.AdminCouponBean;
import com.example.demo._02_model.entity.AdminCouponTypeBean;
import com.example.demo._10_member.entity.Member;
import com.example.demo._90_admin._93_editCoupon.service.editCouponService;
import com.example.demo._90_admin._94_editActivity.service.editActivityService;

@Controller
@RequestMapping("/admin")
@SessionAttributes({ "LoginOK","admincouponList" , "adminactivityList"})
public class EditCouponController {

	@Autowired
	editCouponService editcouponService;
	
	@Autowired
	editActivityService editactivityService;

	@Autowired
	ServletContext context;

//	表單頁面控制器方法
//	@GetMapping("/admin_coupon")
//	public String getAddNewProductFormString(Model model) {
//		AdminCouponBean ac = new AdminCouponBean();
//		ac.setAdmincoupon_name("全店滿兩百折三十");
//		ac.setAdmincoupon_rule("消費每兩百元可使用一張");
//		ac.setAdmincoupon_amount(30);
//		Date utilDate = new Date();
//		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
//		ac.setAdmincoupon_begin(sqlDate);
//		ac.setAdmincoupon_consumption(400);
//		ac.setAdmincoupon_discount(60);
//		model.addAttribute("AdminCouponBean", ac); 
//		return "_16_admin/admin_coupon";
//	}
	
	//管理員首頁
	
	@RequestMapping("/administrator")
	public String administrator(Model model) {
		List<AdminCouponBean> couponList = editcouponService.getAllAdminCoupons();
//		model.getAttribute("admincouponList");  //需把"admincouponList"加到這個model裡才會正確顯示
		model.addAttribute("admincouponList", couponList);
		List<AdminActivityBean> activityList = editactivityService.getAllAdminActivities();
		model.addAttribute("adminactivityList", activityList);
		return "_16_admin/administrator"; 
	}
	
	@GetMapping("modifyAdminCoupon/{admincoupon_id}")
	public String showUpdateForm(Model model, @PathVariable Integer admincoupon_id) {
		
		AdminCouponBean admincouponBean = editcouponService.getAdminCoupon(admincoupon_id);
		model.addAttribute("AdminCouponBean", admincouponBean);
		return "_16_admin/admin_updatecoupon";
	}

	@PostMapping("modifyAdminCoupon/{admincoupon_id}")
	public String updateForm(@ModelAttribute AdminCouponBean bean, Model model, BindingResult result,
			RedirectAttributes redirectAttributes, @PathVariable Integer admincoupon_id) {
		long sizeInBytes = -1;
		MultipartFile picture = bean.getAdmincoupon_image();
		if (picture.getSize() == 0) {
			AdminCouponBean original = editcouponService.getAdminCoupon(admincoupon_id);
			bean.setAdmincoupon_pic(original.getAdmincoupon_pic());
			bean.setAdminfile_name(original.getAdminfile_name());
		} else {
			sizeInBytes = picture.getSize();
			String originalFilename = picture.getOriginalFilename();
			if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				bean.setAdminfile_name(originalFilename);
			}
			if (picture != null && !picture.isEmpty()) {
				try {
					byte[] b = picture.getBytes();
					Blob blob = new SerialBlob(b);
					bean.setAdmincoupon_pic(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
		}
		bean.setAdmincoupon_id(admincoupon_id);
		Member ac = (Member) model.getAttribute("LoginOK");
//		bean.setShopBean(mb.getShopBean());
		editcouponService.updateAdminCoupon(bean);

		return "redirect:/admin/administrator";
	}

	@GetMapping("deleteAdminCoupon/{admincouponId}")
	public String deleteAdminCoupon(@PathVariable Integer admincoupon_id) {
		editcouponService.deleteAdminCoupon(admincoupon_id);
		return "redirect:/admin_coupon";
	}

	@GetMapping("/InsertAdminCoupon")
	public String sendingEmptyForm(Model model, HttpSession session) {
		Member ac = (Member) model.getAttribute("LoginOK");
//		Member mb = (Member) session.getAttribute("member");
//		int shopId = ac.getShopBean().getShop_id();
		AdminCouponBean acb = new AdminCouponBean();
//		acb.setAdmincoupon_amount(5);
		model.addAttribute("AdminCouponBean", acb);
		System.out.println("===============111===============");
		List<AdminCouponBean> admincoupons = editcouponService.getAllAdminCoupons();
		System.out.println("===============2222===============");
		model.addAttribute("admincouponList",admincoupons);
		System.out.println("===============3333===============");
		return "/_16_admin/admin_coupon";
	}

	@PostMapping("/InsertAdminCoupon")
	public String processFormData(@ModelAttribute("AdminCouponBean") AdminCouponBean admincouponBean,
			BindingResult result, Model model, HttpServletRequest request) {
		System.out.println("===============4444===============");
		Member ac = (Member) model.getAttribute("LoginOK");
//		AdminCouponBean.setShopBean(ac.getShopBean());
		MultipartFile picture = admincouponBean.getAdmincoupon_image();
		String originalFilename = picture.getOriginalFilename();
		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			admincouponBean.setAdminfile_name(originalFilename);
		}
		if (picture != null && !picture.isEmpty()) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				admincouponBean.setAdmincoupon_pic(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}

		editcouponService.saveAdminCoupon(admincouponBean);

		return "redirect:/admin/administrator";
	}

	@RequestMapping(value = "/getPicture/{admincoupon_id}")
	public ResponseEntity<byte[]> getPicture(
			HttpServletResponse resp, 
			@PathVariable Integer admincoupon_id){
		String filePath = "/data/images/mediumPic/noImage1.PNG"; //預設圖片路徑
		byte[] pic = null;
		String filename = "";
		int len = 0;
		HttpHeaders headers = new HttpHeaders();
		AdminCouponBean acb = editcouponService.getAdminCoupon(admincoupon_id);
		if(acb != null) {
			Blob blob = acb.getAdmincoupon_pic();
			filename = acb.getAdminfile_name();
			if(blob != null) {
				try {
					
					len = (int) blob.length();  //取得照片大小
					pic = blob.getBytes(1, len); //???   jdbc相關類別都是1開頭
					
				} catch (SQLException e) {
					throw new RuntimeException("shopController的getPicture()發生SQLException: " + e.getMessage());
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
	
//	@ModelAttribute
//	public AdminCouponBean prepareAdminCouponBean(HttpServletRequest req) {
//		AdminCouponBean adminCouponBean = new AdminCouponBean();
//		return adminCouponBean;
//	}
	
//	得到種類id與對應的name
	@ModelAttribute("admincouponMap") 
	public Map<Integer, String> getSortList() {
		Map<Integer, String> admincouponMap = new HashMap<>();
		List<AdminCouponTypeBean> list = editcouponService.getSortList();
		for(AdminCouponTypeBean act : list) {  //取出每一個種類物件的(id,name) 放入map物件
			System.out.println();
			admincouponMap.put(act.getAdmincoupon_type_id(), act.getAdmincoupon_type_name());
			System.out.println(act);
		}
		return admincouponMap; 
	}
}
