package com.example.demo._50_shop._53_shopRegister.controller;

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

import com.example.demo._02_model.entity.NightMarketBean;
import com.example.demo._02_model.entity.ShopBean;
import com.example.demo._02_model.entity.ShopTypeBean;
import com.example.demo._10_member.dao.MemberDao;
import com.example.demo._10_member.entity.Member;
import com.example.demo._10_member.service.MemberServiceImpl;
import com.example.demo._50_shop._53_shopRegister.service.NightMarketService;
import com.example.demo._50_shop._53_shopRegister.service.ShopService;
import com.example.demo._50_shop._53_shopRegister.service.ShopTypeService;




@Controller
@RequestMapping("/_50_shop/_53_shopRegister")
@SessionAttributes({"LoginOK"})
public class ShopController {
	
	@Autowired
	ShopTypeService shopTypeService;
	
	@Autowired
	NightMarketService nightMarketService;
	
	@Autowired
	ShopService shopService;
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	ServletContext context;
	
	
	@GetMapping("modifyShop/{shopId}")
	public String showUpdateForm(Model model, @PathVariable Integer shopId) {
		ShopBean shopBean = shopService.getShop(shopId);
		model.addAttribute("shopBean", shopBean);
		return "/_50_shop/_53_shopRegister/UpdateShop";
	}
	
	@PostMapping("modifyShop/{shopId}")
	public String updateForm(@ModelAttribute ShopBean bean,  
			Model model, BindingResult result, 
			RedirectAttributes redirectAttributes,
			@PathVariable Integer shopId
			) {
		long sizeInBytes = -1;
		MultipartFile picture = bean.getShop_image();
		if(picture.getSize() == 0) {
			ShopBean original = shopService.getShop(shopId);
			bean.setShop_pic(original.getShop_pic());
			bean.setShop_file_name(original.getShop_file_name());
		}else {
			sizeInBytes = picture.getSize();
			String originalFilename = picture.getOriginalFilename();
			if(originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				bean.setShop_file_name(originalFilename);
			}
			if (picture != null && !picture.isEmpty()) {
				try {
					byte[] b = picture.getBytes();
					Blob blob = new SerialBlob(b);
					bean.setShop_pic(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
		}
			bean.setShop_id(shopId);
			shopService.updateShop(bean);
		
		return "redirect:/_50_shop/_53_shopRegister/modifyShop/1";
	}
	
	@GetMapping("InsertShop")
	public String sendingEmptyForm(Model model) {
		ShopBean shop = new ShopBean();
		model.addAttribute("shopBean", shop);
		return "/_50_shop/_53_shopRegister/InsertShop";
	}
	
	@PostMapping("InsertShop")
	public String processFormData(@ModelAttribute("shopBean") ShopBean shopBean,  
			Model model, BindingResult result, 
			HttpServletRequest request,
			RedirectAttributes ra
			) {
		Member mb = (Member) model.getAttribute("LoginOK");
		mb.toString();
		MultipartFile picture = shopBean.getShop_image();
		String originalFilename = picture.getOriginalFilename();
		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			shopBean.setShop_file_name(originalFilename);
		}
		if(picture != null && !picture.isEmpty()) {
			try {
//				需要先得到byte[]，才能透過SerialBlob(byte[] b) 得到Blob的物件
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				shopBean.setShop_pic(blob);
			}catch (Exception e) {
				throw new RuntimeException("照片上傳時發生異常: " + e.getMessage());
			}
		}
		shopBean.setMemberBean(mb);
		shopService.saveShop(shopBean);
//		mb.setShopBean(shopService.getShopByShopName(shopBean.getShop_name()));
		mb.setShopBean(shopBean);
//		memberService.updateMember(mb);
		memberDao.save(mb);
		ra.addFlashAttribute("shopregister", mb.getShopBean());
		
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/getPicture/{shop_id}")
	public ResponseEntity<byte[]> getPicture(
			HttpServletResponse resp, 
			@PathVariable Integer shop_id){
		String filePath = "/data/images/mediumPic/noImage1.PNG"; //預設圖片路徑
		byte[] pic = null;
		String filename = "";
		int len = 0;
		HttpHeaders headers = new HttpHeaders();
		ShopBean shop = shopService.getShop(shop_id);
		if(shop != null) {
			Blob blob = shop.getShop_pic();
			filename = shop.getShop_file_name();
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

	
	
	@ModelAttribute
	public List<ShopTypeBean> getShopType() {
		return shopTypeService.getShopType();
	}
	
	@ModelAttribute
	public List<NightMarketBean> getMarkets(){
		return nightMarketService.getAllMarkets();
	}
}
