package com.example.demo._50_shop._52_shopmenu.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
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

import com.example.demo._02_model.entity.ShopMenuBean;
import com.example.demo._10_member.entity.Member;
import com.example.demo._50_shop._52_shopmenu.service.ShopMenuService;

@Controller
@RequestMapping("/_50_shop/_52_shopmenu")
@SessionAttributes({"LoginOK"})
public class ShopMenuController  {
	String noImage = "/images/NoImage.png";
	
	String inputDataForm = "_50_shop/_52_shopmenu/InsertShopItem"; 
	
	@Autowired
	ShopMenuService shopmenuservice;
//	
//	@Autowireds	
//	ShopTypeService shopTypeService;
//	
	@Autowired
	ServletContext context;
	
//	更新頁面時利用jsp的URL字尾={menu_id}的特性把剛改好的bean資料撈出來
	@GetMapping("modify/{menu_id}")
	public String showUpdateForm(Model model, @PathVariable Integer menu_id) {
		ShopMenuBean shopmenubean = shopmenuservice.getMenu(menu_id);
		model.addAttribute("shopmenubean", shopmenubean);
		return "_50_shop/_52_shopmenu/UpdateShopItem";
	}
	
//	VIEW端下令將編輯後的BEAN物件存入資料庫
	@PostMapping("modify/{menu_id}")
	public String updateForm(@ModelAttribute ShopMenuBean bean,  
			Model model, BindingResult result, 
			RedirectAttributes redirectAttributes,
			@PathVariable Integer menu_id
			) {
		
		MultipartFile picture = bean.getProductImage();
		if (picture.getSize() == 0) {
			// 表示使用者並未挑選圖片
			ShopMenuBean original = shopmenuservice.getMenu(menu_id);
			bean.setMenu_photo(original.getMenu_photo());
		} else {
			String originalFilename = picture.getOriginalFilename();
			if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				bean.setFileName(originalFilename);
			}

			// 建立Blob物件
			if (picture != null && !picture.isEmpty()) {
				try {
					byte[] b = picture.getBytes();
					Blob blob = new SerialBlob(b);
					bean.setMenu_photo(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
		}
		bean.setMenu_id(menu_id);
		Member mb = (Member) model.getAttribute("LoginOK");
		bean.setShopBean(mb.getShopBean());
		shopmenuservice.updateMenu(bean);
		
		return "redirect:/_50_shop/_52_shopmenu/InsertShopItem/"+ mb.getShopBean().getShop_id();
	}
//	
	@GetMapping("delete/{menu_id}")
	public String deleteCoupon(@PathVariable Integer menu_id, Model model) {
		shopmenuservice.deleteMenu(menu_id);
		Member mb = (Member) model.getAttribute("LoginOK");
	
		return "redirect:/_50_shop/_52_shopmenu/InsertShopItem/"+ mb.getShopBean().getShop_id();
	}

//	準備空白的bean給jsp的form
	@GetMapping("/InsertShopItem")	
	public String sendingEmptyForm(Model model, HttpSession session) {
//		form裡的資料透過這裡與bean物件互動
		Member mb = (Member) model.getAttribute("LoginOK");
		ShopMenuBean shopmenubean = new ShopMenuBean();
		int shopId = mb.getShopBean().getShop_id();
		model.addAttribute("shopmenubean", shopmenubean);
//		把相關的商品透過陳列到view端，
//		List<ShopMenuBean> shopmenu = shopmenuservice.getAllMenu();
		List<ShopMenuBean> shopmenu = shopmenuservice.getShopMenu(shopId);
		model.addAttribute("shopmenu", shopmenu);
		return "_50_shop/_52_shopmenu/InsertShopItem";
	}
	
	@GetMapping("/InsertShopItem/{shopId}")
	public String sendingEmptyFormAndShop(Model model, @PathVariable Integer shopId) {
		ShopMenuBean shopmenubean = new ShopMenuBean();
		model.addAttribute("shopmenubean", shopmenubean);
		List<ShopMenuBean> shopmenu = shopmenuservice.getShopMenu(shopId);
		
		model.addAttribute("shopmenu", shopmenu);
		return "/_50_shop/_52_shopmenu/InsertShopItem";
	}
	
//	jsp回傳bean給controller存入資料庫
	@PostMapping("/InsertShopItem/{shopId}")
	public String processFormData(
			@ModelAttribute("shopmenubean") ShopMenuBean bean,
			BindingResult result, Model model,
			HttpServletRequest request
			) {
		Member mb = (Member) model.getAttribute("LoginOK");
		bean.setShopBean(mb.getShopBean());
		
		MultipartFile picture = bean.getProductImage();

		if (picture.getSize() == 0) {
			// 表示使用者並未挑選圖片
//			Member original = memberService.get(id);
//			member.setImage(original.getImage());
		} else {
			String originalFilename = picture.getOriginalFilename();
			if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				bean.setFileName(originalFilename);
			}

			// 建立Blob物件
			if (picture != null && !picture.isEmpty()) {
				try {
					byte[] b = picture.getBytes();
					Blob blob = new SerialBlob(b);
					bean.setMenu_photo(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
		}
		shopmenuservice.saveMenu(bean);
		return "redirect:/_50_shop/_52_shopmenu/InsertShopItem";
	}
//	讀取縮圖使用
	@GetMapping("/picture/{menu_id}")
	public ResponseEntity<byte[]> getPicture(@PathVariable("menu_id") Integer id ,Model model) {
		byte[] body = null;
		ResponseEntity<byte[]> re = null;
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
//		String id_2;
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
//		ShopMenuBean get_id = (ShopMenuBean)model.getAttribute("menu_id");
//		if(id==null) {
//			 id=get_id.getMenu_id();
//		}
		ShopMenuBean shopmenu = shopmenuservice.getMenu(id);
		if (shopmenu == null) {
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		}
		String filename = shopmenu.getFileName();
		if (filename != null) {
			if (filename.toLowerCase().endsWith("jfif")) {
				mediaType = MediaType.valueOf(context.getMimeType("dummy.jpeg"));
			} else {
				mediaType = MediaType.valueOf(context.getMimeType(filename));
				headers.setContentType(mediaType);
			}
		}
		Blob blob = shopmenu.getMenu_photo();
		if (blob != null) {
			body = blobToByteArray(blob);
		} else {
			String path = noImage;
			
			body = fileToByteArray(path);
			}
		re = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);
		return re;
	}
	private byte[] fileToByteArray(String path) {
		byte[] result = null;
		try (InputStream is = context.getResourceAsStream(path);
				ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			result = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public byte[] blobToByteArray(Blob blob) {
		byte[] result = null;
		try (InputStream is = blob.getBinaryStream(); ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			result = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}
}
