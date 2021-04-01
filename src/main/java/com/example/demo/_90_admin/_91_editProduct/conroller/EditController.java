package com.example.demo._90_admin._91_editProduct.conroller;

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
import javax.sql.rowset.serial.SerialBlob;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo._02_model.entity.ProductBean;
import com.example.demo._02_model.entity.ProductTypeBean;
import com.example.demo._20_shoppingMall._21_product.exception.ProductNotFoundException;
import com.example.demo._20_shoppingMall._21_product.service.ProductService;
import com.example.demo._20_shoppingMall._21_product.service.ProductTypeService;
import com.example.demo._20_shoppingMall._22_shoppingCart.service.CartBeanService;
import com.example.demo._90_admin._91_editProduct.validator.ProductValidator;
// 產品狀態碼 0:上架 1:刪除 2:下架
@SessionAttributes({"sessionCart","sessionCartVoList","memberCartVoList"})
@Controller
public class EditController {
	@Autowired
	ProductTypeService productTypeService;
	@Autowired
	ProductService productService;
	@Autowired
	CartBeanService cartBeanService;
	@Autowired
	ServletContext context;
	
//	產品維護頁面
	@RequestMapping("/admin/admin_editProduct")
	public String admin(Model model) {  
		List<ProductBean> list = productService.getAllProducts();
//		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//預設值setLenient(true)(鬆散之意，1995-19-48 27:90:100)也會過，所以要改成falses
//		dateFormat.setLenient(false);
//		Date nowTime = new Date();
//		dateFormat.format(nowTime);
//		model.addAttribute("nowTime",nowTime); 
		model.addAttribute("editProducts", list);
		return "_16_admin/admin_editProduct"; 
	}
	
	
	/**
	 * step1.抵達表單頁面的路徑是：@GetMapping("/products/add") 
	 * step2.此表單預設action為"/products/add"
	 * step3.表單送出使用post方法，故再加上路徑則會走標註@PostMapping("/products/add") 的控制器方法
	 */
	
//	表單頁面控制器方法
	@GetMapping("/products/add")
	public String getAddNewProductFormString(Model model) {
		ProductBean pb = new ProductBean();
//		pb.setProduct_name("商品名稱不知道要取什麼-1");  
//		pb.setProduct_info("因為不知道要賣什麼所以商品資訊也不知道要填什麼");
//		pb.setProduct_price(111.0);
		model.addAttribute("productBean", pb); //將pb 加入model中
		return "_16_admin/insertProduct";
	}
	
	
	/**
	 * action 屬性的預設值，原本頁面的路徑
	 */
	
	
//	按表單提交鈕送出會來這支控制器處理
	@PostMapping("/products/add")  // 路徑與上一支方法一樣，但是此處請求方法是Post 所以會來找這一支控制器
	public String processAddNewProductForm(
			Model model,
			@Valid @ModelAttribute("productBean") ProductBean productBean,
			BindingResult result,
			RedirectAttributes redirectAttributes) {
//		新增產品需傳入ProductBean參數(從上model取出)
//		@ModelAttribute用在方法參數內：可直接從參數取值(又稱數據綁定)

//		資料檢查條件(使用validator)
		ProductValidator validator = new ProductValidator();
		validator.validate(productBean, result);		
		if(result.hasErrors()) {
			List<ObjectError> list =  result.getAllErrors();//把所有錯誤裝在list裡面
			for(ObjectError error : list) {
				System.out.println("====>有錯誤:" + error);
			}
			return "_16_admin/insertProduct";
		}
		String[] suppressedFields = result.getSuppressedFields();
		if(suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		if(productBean.getProduct_stock() == null) {
			productBean.setProduct_stock(0);
		}
		

//		圖片上傳1
//		step1: 從前端取得使用者上傳圖片的路徑
		MultipartFile productImage = productBean.getProductImage();//圖片本身1
		MultipartFile productImageA = productBean.getProductImagesA();//圖片2
		String originalFilename = productImage.getOriginalFilename();
		String originalFilenameA = productImageA.getOriginalFilename();//圖片2
		
		productBean.setFilename(originalFilename);
		productBean.setFilenameA(originalFilenameA);//圖片2
		
//		step1: 從前端取得使用者上傳圖片的路徑(多張圖片)
//		List<MultipartFile> files = productBean.getProductImages();
//		List<String> fileNames = new ArrayList<>();
//		if(files != null && files.size() > 0) {
//			for(int i = 0; i < files.size(); i++) {
//				String originalFilename = files.get(i).getOriginalFilename();
//				fileNames.add(originalFilename);
//				fileNames.get(i);
//				ProductBean productBean = new ProductBean();
//				productBean.setFilename0(originalFilename);
//			}
//			
//		}
		
//		step2: 建立Blob物件，交由 Hibernate寫入資料庫
		if(productImage != null && !productImage.isEmpty()) {
			try {
//				需要先得到byte[]，才能透過SerialBlob(byte[] b) 得到Blob的物件
				byte[] b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				productBean.setProduct_pic(blob);
			}catch (Exception e) {
				throw new RuntimeException("照片上傳時發生異常1: " + e.getMessage());
			}
		}
		if(productImageA != null && !productImageA.isEmpty()) {
			try {
//				需要先得到byte[]，才能透過SerialBlob(byte[] b) 得到Blob的物件
				byte[] b = productImageA.getBytes();
				Blob blob = new SerialBlob(b);
				productBean.setProduct_picA(blob);
			}catch (Exception e) {
				throw new RuntimeException("照片上傳時發生異常2: " + e.getMessage());
			}
		}
		productService.addProduct(productBean);  //必須先存到資料庫
		
//		step3: 把檔案上傳到server端
//		取得副檔名，因為不需要使用者上傳的檔名
//		判斷使用者是否有上傳照片，若有照片才執行以下
		if(originalFilename != "") {
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			
//		存在應用系統的更目錄"/"(C:/_JSP/tomcat9/webapps/mvcExercise)
			String rootDirectory = context.getRealPath("/");
			try {
				File imageFolder = new File(rootDirectory,"userUploads"); //存在應用系統更目錄下的userUploads資料夾
				if(!imageFolder.exists())
					imageFolder.mkdirs();
				File file = new File(imageFolder, "Product_" + productBean.getProduct_id() + ext); //將檔案變成 File物件，
				productImage.transferTo(file);// 把照片轉到指定位置(需要傳入File物件)
			}catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳時發生異常: " + e.getMessage());
			}
		}
		return "redirect:/admin/admin_editProduct";
	}
	
	
	/**
	 * 當控制器方法傳回此種型別的物件時，分派器會將它的內容依照Http協定的格式，送回給提出請求的前端裝置。
	 * ResponseEntity 類別內含三種資訊
	 * 1. 回應本體
	 * 2. 回應標頭
	 * 3. 狀態碼
	 */
	
//	從資料庫撈Blob型態，讓商品頁出現產品(圖片一)
//	ResponseEntity<Byte[]> => 回應本體的資料型態(blob 需轉成 位元組型態才可讀取)
	@RequestMapping(value = "/getProductPictureA/{product_id}")
	public ResponseEntity<byte[]> getPicture(
			HttpServletResponse resp, 
			@PathVariable Integer product_id){
		String filePath = "/data/images/mediumPic/noImage1.PNG"; //預設圖片路徑
		byte[] pic = null;
		String filename = "";
		int len = 0;
		HttpHeaders headers = new HttpHeaders();
		ProductBean productBean = productService.getProductById(product_id); 
		if(productBean != null) {
			Blob blob = productBean.getProduct_pic();
			filename = productBean.getFilename();
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
	
//	從資料庫撈Blob型態，讓商品頁出現產品(圖片二)
//	ResponseEntity<Byte[]> => 回應本體的資料型態(blob 需轉成 位元組型態才可讀取)
	@RequestMapping(value = "/getProductPictureB/{product_id}")
	public ResponseEntity<byte[]> getPictureA(
			HttpServletResponse resp, 
			@PathVariable Integer product_id){
		String filePath = "/data/images/mediumPic/noImage1.PNG"; //預設圖片路徑
		byte[] pic = null;
		String filename = "";
		int len = 0;
		HttpHeaders headers = new HttpHeaders();
		ProductBean productBean = productService.getProductById(product_id); 
		if(productBean != null) {
			Blob blob = productBean.getProduct_picA();
			filename = productBean.getFilenameA();
			if(blob != null) {
				try {
					len = (int) blob.length();  //取得照片大小
					pic = blob.getBytes(1, len); //???   jdbc相關類別都是1開頭
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPictureA()發生SQLException: " + e.getMessage());
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
	

	//刪除一筆紀錄
//	@DeleteMapping("/productDelete/{product_id}") 
//	public String deleteProduct(@PathVariable("product_id") Integer product_id) {
//		productService.deleteProduct(product_id);
//		return "redirect:/admin/admin_editProduct";
//	}
	
	//不會真的從資料庫刪除，而是更新狀態
	@GetMapping("/productDelete/{product_id}")
	public String deleteProduct(@PathVariable("product_id") Integer product_id) {
		productService.deleteProduct(product_id);
		return "redirect:/admin/admin_editProduct";
	}
	
	
	
	
	// 當使用者需要修改時，本方法送回含有會員資料的表單，讓使用者進行修改(GET)
	// 由這個方法送回修改記錄的表單
	@GetMapping(value = "/productUpdate/{product_id}")
	public String showDataForm(@PathVariable("product_id") Integer product_id, Model model) {
		ProductBean productBean = productService.getProductById(product_id);
		model.addAttribute(productBean); //預設識別字串==>"productBean"
		return"_16_admin/updateProduct";
	}
	
	// 當將瀏覽器送來修改過的會員資料時，由本方法負責檢核，若無誤則寫入資料庫
	@PostMapping(value = "/productUpdate/{product_id}")
	public String updateProduct(
			@ModelAttribute("productBean") ProductBean productBean,
			Model model,
			@PathVariable("product_id") Integer product_id,
			BindingResult result,
			RedirectAttributes redirectAttributes
//			HttpServletRequest request
			) {
		
//		資料檢查條件(使用validator)
		ProductValidator validator = new ProductValidator();
		validator.validate(productBean, result);
		if(result.hasErrors()) {
			List<ObjectError> list =  result.getAllErrors(); //把所有錯誤裝在list裡面
			for(ObjectError error : list) {
				System.out.println("====>有錯誤:" + error);
			}
			return "_16_admin/updateProduct";
		}
		
		long sizeInBytes = -1;
		System.out.println("===============================111==============================");
		
		//找到對應的種類
//		ProductTypeBean ps = productBean.getProductTypeBean();
//		productBean.setProduct_type_id(ps.getProduct_type_id());
//		ProductTypeBean productTypeBean = productTypeService.getTypeById(productBean.getProductTypeBean().getProduct_type_id());
//		productBean.setProductTypeBean(productTypeBean);
		System.out.println("=============" + productBean.toString() + "========================");
		
		//照片
		MultipartFile picture = productBean.getProductImage();
		MultipartFile productImageA = productBean.getProductImagesA();//圖片2
		
		//表示使用者未挑選圖片
		if(picture.getSize() == 0) {
			sizeInBytes = -1;
		}else {
			sizeInBytes = picture.getSize();
			String originalFilename = picture.getOriginalFilename();
			if(originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				productBean.setFilename(originalFilename);
			}
			// 建立Blob物件
			if (picture != null && !picture.isEmpty()) {
				try {
					byte[] b = picture.getBytes();
					Blob blob = new SerialBlob(b);
					productBean.setProduct_pic(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
		}
		//圖片二
		if(productImageA.getSize() == 0) {
			sizeInBytes = -1;
		}else {
			sizeInBytes = productImageA.getSize();
			String originalFilename = productImageA.getOriginalFilename();
			if(originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				productBean.setFilenameA(originalFilename);
			}
			// 建立Blob物件
			if (productImageA != null && !productImageA.isEmpty()) {
				try {
					byte[] b = productImageA.getBytes();
					Blob blob = new SerialBlob(b);
					productBean.setProduct_picA(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
		}
		productService.updateProduct(productBean);
		//更新購物車的total(當產品價格改變須同步更新購物車表格的total)
		cartBeanService.updateCartTotal();
		//更新側邊購物車的total(未完成)
		
		
		System.out.println("===============================222============================");
		return "redirect:/admin/admin_editProduct";
	}
	
	/**
	 * 批量刪除與下架
	 */
	@RequestMapping("/productManage/{selected_id}/{cmd}")
	public String deleteAll(Model model,
			HttpServletRequest request,
			@PathVariable("selected_id") String selected_id,
			@PathVariable("cmd") String cmd
			) {
		System.out.println(selected_id); //10+9+7+6+5
		String[] selectArray = selected_id.split("\\+");
		for(int i = 0; i < selectArray.length; i++) {
			Integer product_id = Integer.parseInt(selectArray[i]);
			if(cmd.equalsIgnoreCase("del")) {
				productService.deleteProduct(product_id);
			}else if(cmd.equalsIgnoreCase("down")){
				productService.downProduct(product_id);
			}
		}
		return "redirect:/admin/admin_editProduct";
	}
	
	
	
	
	/**
	 * 會先執行加@ModelAttribute註釋的控制器方法
	 * 並將結果添加到model中
	 */
	
	
	@ModelAttribute("productBean")
	public ProductBean getProductBean(
			@PathVariable(value="product_id", required = false) Integer product_id
			) {
		
		ProductBean productBean = null;
		if (product_id == null) {
			productBean = new ProductBean();
			productBean.setProduct_stock(-99);
			System.out.println("==========================bean是null=======================");
			//...
			//...
		} else {
			System.out.println("product_id=" + product_id);
			productBean = productService.getProductById(product_id);
		}
		return productBean;
	}
	
	
	
	
//	得到種類id與對應的name
	@ModelAttribute("sortMap") 
	public Map<Integer, String> getSortList() {
		Map<Integer, String> sortMap = new HashMap<>();
		List<ProductTypeBean> list = productTypeService.getSortList();
		for(ProductTypeBean ps : list) {  //取出每一個種類物件的(id,name) 放入map物件
			sortMap.put(ps.getProduct_type_id(), ps.getProduct_type_name());
		}
		return sortMap; 
	}

	
//	說明前端瀏覽器只能傳送的欄位(必須現在前端送來的欄位)
	@InitBinder
	public void whiteListing(WebDataBinder binder) {
		binder.setAllowedFields(
			"product_name",
			"product_price",
			"product_stock",
			"product_info"	,
			"product_spec",
			"productTypeBean.product_type_id",
			"productImage",
			"productImagesA"
		);
	}
	
//	使用Model
	@ExceptionHandler({ProductNotFoundException.class})
	public String handleErrorModel
	(Model model, HttpServletRequest request, ProductNotFoundException exception ) {
		model.addAttribute("invalidProductId",  exception.getProduct_id());
		model.addAttribute("exception",  exception);
		model.addAttribute("message", exception.getMessage() + "使用Model 而非 ModelAndView");
		model.addAttribute("url", request.getRequestURL() + "?" + request.getQueryString());
		return "_12_shoppingmall/productNotFound";
	}
	
	
// 未處理的例外都由此方法handle
//	@ExceptionHandler({Throwable.class})
//	public String handleError2
//	(Model model, HttpServletRequest request, Throwable exception ) {
//		model.addAttribute("exception",  exception);
//		model.addAttribute("message", exception.getMessage() + "(處理大多數例外)");
//		model.addAttribute("url", request.getRequestURL() + "?" + request.getQueryString());
//		return "_00_util/allUtil/jsp/DisplaySystemException";
//	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	@RequestMapping("/admin/administrator")
//	public String administrator(Model model) {  
//
//		return "_16_admin/administrator"; 
//	}
//	@RequestMapping("/admin_coupon")
//	public String admin_coupon(Model model) { 
//
//		return "_16_admin/admin_coupon"; 
//	}
	@RequestMapping("/admin/admin_chatroom")
	public String admin_chatroom(Model model) {  

		return "_16_admin/admin_chatroom"; 
	}
	@RequestMapping("/admin/admin_announcement")
	public String admin_announcement(Model model) {  

		return "_16_admin/admin_announcement"; 
	}
	@RequestMapping("/admin/admin_adinfo")
	public String admin_adinfo(Model model) {  

		return "_16_admin/admin_adinfo"; 
	}
//	@RequestMapping("/admin/admin_activity")
//	public String admin_activity(Model model) {  
//
//		return "_16_admin/admin_activity"; 
//	}
	
	@RequestMapping("/admin/admin_checkShop")
	public String admin_checkoutShop(Model model) {  

		return "_16_admin/admin_checkShop"; 
	}
	
//	產品維護頁面
//	@RequestMapping("/admin_editProduct")
//	public String admin(Model model) {  
//
//		return "_16_admin/admin_editProduct"; 
//	}
}
