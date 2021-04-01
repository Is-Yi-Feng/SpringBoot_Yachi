package com.example.demo._10_member.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo._02_model.entity.ShopBean;
import com.example.demo._10_member.entity.Member;
import com.example.demo._10_member.service.M_FavoriteShopService;



@Controller
@SessionAttributes("LoginOK")
public class M_FavoriteShopController {

	@Autowired
	M_FavoriteShopService m_FavoriteShopService;

	@Autowired
	ServletContext servletContext;
	
// =============================== 會員查詢喜愛商家 ============================================
	@GetMapping("/queryFavoriteShop")
	public String queryFavoriteShop(Model model, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		Member mb = (Member) model.getAttribute("LoginOK");
		if (mb == null) {
			System.out.println("================請先登入================");
			redirectAttributes.addFlashAttribute("loginFisrt", "*請先登入");
			return "redirect:/LoginAndRegister";// 測試是否可以成功導向登入畫面
		} else {
			// ==========================得出會員的MemberId 傳入至dao取對應的所有值出來========
			Set<ShopBean> fslb = m_FavoriteShopService.getMyFavoriteShopByMemberId2(mb.getMemberId());
			model.addAttribute("fslbList", fslb);
			for (ShopBean shopBean : fslb) {
				System.out.println(shopBean.getShop_name());
			}
			return "_11_member/queryFavoriteShop";
		}
	}

////	=============================== 轉圖檔 ============================================
	@RequestMapping(value = "/getShopPicture/{shop_id}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getShopPicture(HttpServletResponse resp, @PathVariable  Integer shop_id) {
		String filePath = "/images/coupon/nonepic.jpg";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		ShopBean bean = m_FavoriteShopService.getShopBy_shop_id(shop_id);
		if (bean != null) {
			Blob blob = bean.getShop_pic();
			filename =  bean.getShop_file_name();
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
		String mimeType = servletContext.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType =" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}
	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = servletContext.getRealPath(filepath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = servletContext.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
	
////=============================== 刪除喜愛店家 ============================================

	@GetMapping(value = "/deleteFavoriteShop/{shop_id}")
	public String deleteFavoriteShop(@PathVariable Integer shop_id, Model model) {
		Member mb = (Member) model.getAttribute("LoginOK");
//		System.out.println("shop_id="+shop_id +"  "+ "mb.getMemberId() =" + mb.getMemberId());
		m_FavoriteShopService.deleteSingleFavoriteShopByMemberId(mb.getMemberId(), shop_id);
		return "redirect:/queryFavoriteShop";
	}
	
	@GetMapping(value = "/deleteFavoriteShop2/{shop_id}")
	public String deleteFavoriteShop2(@PathVariable Integer shop_id, Model model) {
		Member mb = (Member) model.getAttribute("LoginOK");
//		System.out.println("shop_id="+shop_id +"  "+ "mb.getMemberId() =" + mb.getMemberId());
		m_FavoriteShopService.deleteSingleFavoriteShopByMemberId(mb.getMemberId(), shop_id);
		return "redirect:/_50_shop/_54_showShops/ShowShops/" + shop_id;
	}
}
