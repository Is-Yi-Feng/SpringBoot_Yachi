package com.example.demo._80_home.controller;

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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo._02_model.entity.NightMarketBean;
import com.example.demo._02_model.entity.ProductBean;
import com.example.demo._02_model.entity.ShopBean;
import com.example.demo._80_home.service.SearchService;


@Controller
public class SearchController {

	@Autowired
	SearchService searchService;
	
	// 暫時先註解
//	@Autowired
//	ProductService productService;
	
	@Autowired
	ServletContext context;
	
	// 查詢所有的商品 --> 依商品名稱
	@RequestMapping("/search/product")
	public String searchProductsByName(@RequestParam String product_name,Model model) {
				
		List<ProductBean> list = searchService.getAllProductsByName(product_name);
		
		if(product_name == "") {
			
			model.addAttribute("keyword","?");
			model.addAttribute("list",list);

			return "/_17_home/searchALL";
		}
				
		model.addAttribute("keyword",product_name);
		model.addAttribute("list",list);
		
			
		return "/_17_home/searchALL";
	}
	
	
	// 查詢所有的商品 --> 依特定的商品名稱   商品價格由大至小排列
	@RequestMapping("/search/product/high/{product_name}")
	public String searchProductsByHighPrice(@PathVariable String product_name,Model model) {
		
		List<ProductBean> list = searchService.getAllProductsByHighPrice(product_name);
		
		model.addAttribute("keyword",product_name);
		model.addAttribute("list",list);
		
		return "/_17_home/searchALL";
	}
	
	// 查詢所有的商品 --> 依特定的商品名稱   商品價格由小至大排列
	@RequestMapping("/search/product/low/{product_name}")
	public String searchProductsByLowPrice(@PathVariable String product_name,Model model) {
		
		List<ProductBean> list = searchService.getAllProductsByLowPrice(product_name);
		
		for (ProductBean productBean : list) {
			System.out.println(productBean.getProduct_name()+"--->"+productBean.getProduct_price());
		}
		
		model.addAttribute("keyword",product_name);
		model.addAttribute("list",list);
		
		return "/_17_home/searchALL";
	}
	
	// 查詢所有的商品 --> 依特定的商品名稱  依使用者輸入商品價格低 ~ 到商品價格高
	@RequestMapping("/search/product/range/{product_name}")
	public String searchProductsByBetweenPrice(@PathVariable String product_name,
											   @RequestParam Double lowPrice,
											   @RequestParam Double highPrice,Model model) {
		
		List<ProductBean> list = searchService.getAllProductsByBetweenPrice(product_name,lowPrice, highPrice);
		
		
		model.addAttribute("keyword",product_name);
		model.addAttribute("list",list);
		
		return "/_17_home/searchALL";
	}
	
	// 查詢所有的商品  --> 顯示商城全部的商品 
	@RequestMapping("/search/ALLproducts")
	public String searchALLProducts(Model model) {
		
		List<ProductBean> list = searchService.getALLProducts();
		
		model.addAttribute("keyword","商城的商品");
		model.addAttribute("list",list);
		
		return "/_17_home/searchALL";
	}
	

	// 查詢所有的商品 --> 依照最新上架的日期
	@RequestMapping("/test07")
	@ResponseBody
	public String searchReleaseNewProduct() {
		
		List<ProductBean> list = searchService.getReleaseNewProduct();
		
		for (ProductBean pBean : list) {
			System.out.println(pBean.getProduct_name()+" --> "+pBean.getProduct_release());
		}
		
		return "測試成功";
	}
	
	
	// 查詢所有的商品 --> 依照商品的類型
	@RequestMapping("/test08/{product_type_id}")
	@ResponseBody
	public String searchProductTypeBean(@PathVariable Integer product_type_id) {
		
		Set<ProductBean> set = searchService.getProductTypeBean(product_type_id);
		
		for (ProductBean pTypeBean : set) {
			System.out.println(pTypeBean.getProduct_name());
		}
		
		return "測試成功";
	}
	

	// Like模糊搜尋夜市 
	@RequestMapping("/search/night")
	public String searchNight(@RequestParam String market_name) {
		
		String marketName = "";
		
		List<NightMarketBean> list = searchService.searchNight(market_name);
		
		for (NightMarketBean nightMarketBean : list) {
			marketName = nightMarketBean.getMarketURL();
		}
		
		
		return "redirect:"+marketName;
	}
	
	// 查詢所有的優惠券 (優惠券有效期限大於當前時間) 尚未過期
//	@RequestMapping("/test02")
//	@ResponseBody
//	public String searchCouponNoExpired() {
//		
//		List<CouponBean> list = searchService.getAllCouponNoExpired();
//		for (CouponBean couponBean : list) {
//			System.out.println(couponBean.getCoupon_name());
//		}
//		
//		return "測試成功";
//	}
	
	
	
	
	
	// 查詢所有的商家 --> 依商家名稱
	@RequestMapping("/test09")
	@ResponseBody
	public String searchShopByName(@RequestParam String shop_name) {
		
		List<ShopBean> list = searchService.getAllShopByName(shop_name);
		
		for (ShopBean shopBean : list) {
			System.out.println(shopBean.getShop_name());
		}
		
		return "測試成功";

	}
	
	// 依商家的類型找出所有的商家 
	@RequestMapping("/test10/{shop_type_id}")
	@ResponseBody
	public String searchShopByShop_type_id(@PathVariable Integer shop_type_id) {
		
		Set<ShopBean> set = searchService.getAllShopBean(shop_type_id);
		
		for (ShopBean shopBean : set) {
			System.out.println(shopBean.getShop_name());
		}
		
		return "測試成功";
	}

	
	
//	從資料庫撈Blob型態，讓商品頁出現產品(圖片一)
//	ResponseEntity<Byte[]> => 回應本體的資料型態(blob 需轉成 位元組型態才可讀取)
//	@RequestMapping(value = "/searchProductPicture/{product_id}")
//	public ResponseEntity<byte[]> getPicture(
//			HttpServletResponse resp, 
//			@PathVariable Integer product_id){
//		String filePath = "/data/images/mediumPic/noImage1.PNG"; //預設圖片路徑
//		byte[] pic = null;
//		String filename = "";
//		int len = 0;
//		HttpHeaders headers = new HttpHeaders();
//		ProductBean productBean = productService.getProductById(product_id); 
//		if(productBean != null) {
//			Blob blob = productBean.getProduct_pic();
//			filename = productBean.getFilename();
//			if(blob != null) {
//				try {
//					len = (int) blob.length();  //取得照片大小
//					pic = blob.getBytes(1, len); //???   jdbc相關類別都是1開頭
//				} catch (SQLException e) {
//					throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
//				}
//			}else { //如果沒有照片
//				pic = toByteArray(filePath);
//				filename = filePath;
//			}
//		}else {
//			pic = toByteArray(filePath);
//			filename = filePath;
//		}
//		headers.setCacheControl(CacheControl.noCache().getHeaderValue()); //請瀏覽器不要快取圖片內容
//		String mimeType = context.getMimeType(filename);
//		MediaType mediaType = MediaType.valueOf(mimeType); //把字串轉成 mediaType 型別的物件
//		System.out.println("mediatype = " + mediaType);
//		headers.setContentType(mediaType);
//		ResponseEntity<byte[]> responoEntity = new ResponseEntity<>(pic, headers, HttpStatus.OK); 
//		return responoEntity;
//	}
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
