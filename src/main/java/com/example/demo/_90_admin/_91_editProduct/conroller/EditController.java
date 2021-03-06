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
// ??????????????? 0:?????? 1:?????? 2:??????
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
	
//	??????????????????
	@RequestMapping("/admin/admin_editProduct")
	public String admin(Model model) {  
		List<ProductBean> list = productService.getAllProducts();
//		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//?????????setLenient(true)(???????????????1995-19-48 27:90:100)???????????????????????????falses
//		dateFormat.setLenient(false);
//		Date nowTime = new Date();
//		dateFormat.format(nowTime);
//		model.addAttribute("nowTime",nowTime); 
		model.addAttribute("editProducts", list);
		return "_16_admin/admin_editProduct"; 
	}
	
	
	/**
	 * step1.?????????????????????????????????@GetMapping("/products/add") 
	 * step2.???????????????action???"/products/add"
	 * step3.??????????????????post??????????????????????????????????????????@PostMapping("/products/add") ??????????????????
	 */
	
//	???????????????????????????
	@GetMapping("/products/add")
	public String getAddNewProductFormString(Model model) {
		ProductBean pb = new ProductBean();
//		pb.setProduct_name("?????????????????????????????????-1");  
//		pb.setProduct_info("?????????????????????????????????????????????????????????????????????");
//		pb.setProduct_price(111.0);
		model.addAttribute("productBean", pb); //???pb ??????model???
		return "_16_admin/insertProduct";
	}
	
	
	/**
	 * action ??????????????????????????????????????????
	 */
	
	
//	???????????????????????????????????????????????????
	@PostMapping("/products/add")  // ????????????????????????????????????????????????????????????Post ?????????????????????????????????
	public String processAddNewProductForm(
			Model model,
			@Valid @ModelAttribute("productBean") ProductBean productBean,
			BindingResult result,
			RedirectAttributes redirectAttributes) {
//		?????????????????????ProductBean??????(??????model??????)
//		@ModelAttribute????????????????????????????????????????????????(??????????????????)

//		??????????????????(??????validator)
		ProductValidator validator = new ProductValidator();
		validator.validate(productBean, result);		
		if(result.hasErrors()) {
			List<ObjectError> list =  result.getAllErrors();//?????????????????????list??????
			for(ObjectError error : list) {
				System.out.println("====>?????????:" + error);
			}
			return "_16_admin/insertProduct";
		}
		String[] suppressedFields = result.getSuppressedFields();
		if(suppressedFields.length > 0) {
			throw new RuntimeException("??????????????????????????????: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		if(productBean.getProduct_stock() == null) {
			productBean.setProduct_stock(0);
		}
		

//		????????????1
//		step1: ?????????????????????????????????????????????
		MultipartFile productImage = productBean.getProductImage();//????????????1
		MultipartFile productImageA = productBean.getProductImagesA();//??????2
		String originalFilename = productImage.getOriginalFilename();
		String originalFilenameA = productImageA.getOriginalFilename();//??????2
		
		productBean.setFilename(originalFilename);
		productBean.setFilenameA(originalFilenameA);//??????2
		
//		step1: ?????????????????????????????????????????????(????????????)
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
		
//		step2: ??????Blob??????????????? Hibernate???????????????
		if(productImage != null && !productImage.isEmpty()) {
			try {
//				???????????????byte[]???????????????SerialBlob(byte[] b) ??????Blob?????????
				byte[] b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				productBean.setProduct_pic(blob);
			}catch (Exception e) {
				throw new RuntimeException("???????????????????????????1: " + e.getMessage());
			}
		}
		if(productImageA != null && !productImageA.isEmpty()) {
			try {
//				???????????????byte[]???????????????SerialBlob(byte[] b) ??????Blob?????????
				byte[] b = productImageA.getBytes();
				Blob blob = new SerialBlob(b);
				productBean.setProduct_picA(blob);
			}catch (Exception e) {
				throw new RuntimeException("???????????????????????????2: " + e.getMessage());
			}
		}
		productService.addProduct(productBean);  //????????????????????????
		
//		step3: ??????????????????server???
//		?????????????????????????????????????????????????????????
//		??????????????????????????????????????????????????????????????????
		if(originalFilename != "") {
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			
//		??????????????????????????????"/"(C:/_JSP/tomcat9/webapps/mvcExercise)
			String rootDirectory = context.getRealPath("/");
			try {
				File imageFolder = new File(rootDirectory,"userUploads"); //?????????????????????????????????userUploads?????????
				if(!imageFolder.exists())
					imageFolder.mkdirs();
				File file = new File(imageFolder, "Product_" + productBean.getProduct_id() + ext); //??????????????? File?????????
				productImage.transferTo(file);// ???????????????????????????(????????????File??????)
			}catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("???????????????????????????: " + e.getMessage());
			}
		}
		return "redirect:/admin/admin_editProduct";
	}
	
	
	/**
	 * ????????????????????????????????????????????????????????????????????????????????????Http?????????????????????????????????????????????????????????
	 * ResponseEntity ????????????????????????
	 * 1. ????????????
	 * 2. ????????????
	 * 3. ?????????
	 */
	
//	???????????????Blob?????????????????????????????????(?????????)
//	ResponseEntity<Byte[]> => ???????????????????????????(blob ????????? ???????????????????????????)
	@RequestMapping(value = "/getProductPictureA/{product_id}")
	public ResponseEntity<byte[]> getPicture(
			HttpServletResponse resp, 
			@PathVariable Integer product_id){
		String filePath = "/data/images/mediumPic/noImage1.PNG"; //??????????????????
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
					len = (int) blob.length();  //??????????????????
					pic = blob.getBytes(1, len); //???   jdbc??????????????????1??????
				} catch (SQLException e) {
					throw new RuntimeException("ProductController???getPicture()??????SQLException: " + e.getMessage());
				}
			}else { //??????????????????
				pic = toByteArray(filePath);
				filename = filePath;
			}
		}else {
			pic = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue()); //????????????????????????????????????
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType); //??????????????? mediaType ???????????????
		System.out.println("mediatype = " + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responoEntity = new ResponseEntity<>(pic, headers, HttpStatus.OK); 
		return responoEntity;
	}
	
//	???????????????Blob?????????????????????????????????(?????????)
//	ResponseEntity<Byte[]> => ???????????????????????????(blob ????????? ???????????????????????????)
	@RequestMapping(value = "/getProductPictureB/{product_id}")
	public ResponseEntity<byte[]> getPictureA(
			HttpServletResponse resp, 
			@PathVariable Integer product_id){
		String filePath = "/data/images/mediumPic/noImage1.PNG"; //??????????????????
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
					len = (int) blob.length();  //??????????????????
					pic = blob.getBytes(1, len); //???   jdbc??????????????????1??????
				} catch (SQLException e) {
					throw new RuntimeException("ProductController???getPictureA()??????SQLException: " + e.getMessage());
				}
			}else { //??????????????????
				pic = toByteArray(filePath);
				filename = filePath;
			}
		}else {
			pic = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue()); //????????????????????????????????????
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType); //??????????????? mediaType ???????????????
		System.out.println("mediatype = " + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responoEntity = new ResponseEntity<>(pic, headers, HttpStatus.OK); 
		return responoEntity;
	}
	
	
	
//	???????????????????????????????????????
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
	

	//??????????????????
//	@DeleteMapping("/productDelete/{product_id}") 
//	public String deleteProduct(@PathVariable("product_id") Integer product_id) {
//		productService.deleteProduct(product_id);
//		return "redirect:/admin/admin_editProduct";
//	}
	
	//???????????????????????????????????????????????????
	@GetMapping("/productDelete/{product_id}")
	public String deleteProduct(@PathVariable("product_id") Integer product_id) {
		productService.deleteProduct(product_id);
		return "redirect:/admin/admin_editProduct";
	}
	
	
	
	
	// ???????????????????????????????????????????????????????????????????????????????????????????????????(GET)
	// ??????????????????????????????????????????
	@GetMapping(value = "/productUpdate/{product_id}")
	public String showDataForm(@PathVariable("product_id") Integer product_id, Model model) {
		ProductBean productBean = productService.getProductById(product_id);
		model.addAttribute(productBean); //??????????????????==>"productBean"
		return"_16_admin/updateProduct";
	}
	
	// ?????????????????????????????????????????????????????????????????????????????????????????????????????????
	@PostMapping(value = "/productUpdate/{product_id}")
	public String updateProduct(
			@ModelAttribute("productBean") ProductBean productBean,
			Model model,
			@PathVariable("product_id") Integer product_id,
			BindingResult result,
			RedirectAttributes redirectAttributes
//			HttpServletRequest request
			) {
		
//		??????????????????(??????validator)
		ProductValidator validator = new ProductValidator();
		validator.validate(productBean, result);
		if(result.hasErrors()) {
			List<ObjectError> list =  result.getAllErrors(); //?????????????????????list??????
			for(ObjectError error : list) {
				System.out.println("====>?????????:" + error);
			}
			return "_16_admin/updateProduct";
		}
		
		long sizeInBytes = -1;
		System.out.println("===============================111==============================");
		
		//?????????????????????
//		ProductTypeBean ps = productBean.getProductTypeBean();
//		productBean.setProduct_type_id(ps.getProduct_type_id());
//		ProductTypeBean productTypeBean = productTypeService.getTypeById(productBean.getProductTypeBean().getProduct_type_id());
//		productBean.setProductTypeBean(productTypeBean);
		System.out.println("=============" + productBean.toString() + "========================");
		
		//??????
		MultipartFile picture = productBean.getProductImage();
		MultipartFile productImageA = productBean.getProductImagesA();//??????2
		
		//??????????????????????????????
		if(picture.getSize() == 0) {
			sizeInBytes = -1;
		}else {
			sizeInBytes = picture.getSize();
			String originalFilename = picture.getOriginalFilename();
			if(originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				productBean.setFilename(originalFilename);
			}
			// ??????Blob??????
			if (picture != null && !picture.isEmpty()) {
				try {
					byte[] b = picture.getBytes();
					Blob blob = new SerialBlob(b);
					productBean.setProduct_pic(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("????????????????????????: " + e.getMessage());
				}
			}
		}
		//?????????
		if(productImageA.getSize() == 0) {
			sizeInBytes = -1;
		}else {
			sizeInBytes = productImageA.getSize();
			String originalFilename = productImageA.getOriginalFilename();
			if(originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				productBean.setFilenameA(originalFilename);
			}
			// ??????Blob??????
			if (productImageA != null && !productImageA.isEmpty()) {
				try {
					byte[] b = productImageA.getBytes();
					Blob blob = new SerialBlob(b);
					productBean.setProduct_picA(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("????????????????????????: " + e.getMessage());
				}
			}
		}
		productService.updateProduct(productBean);
		//??????????????????total(??????????????????????????????????????????????????????total)
		cartBeanService.updateCartTotal();
		//????????????????????????total(?????????)
		
		
		System.out.println("===============================222============================");
		return "redirect:/admin/admin_editProduct";
	}
	
	/**
	 * ?????????????????????
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
	 * ???????????????@ModelAttribute????????????????????????
	 * ?????????????????????model???
	 */
	
	
	@ModelAttribute("productBean")
	public ProductBean getProductBean(
			@PathVariable(value="product_id", required = false) Integer product_id
			) {
		
		ProductBean productBean = null;
		if (product_id == null) {
			productBean = new ProductBean();
			productBean.setProduct_stock(-99);
			System.out.println("==========================bean???null=======================");
			//...
			//...
		} else {
			System.out.println("product_id=" + product_id);
			productBean = productService.getProductById(product_id);
		}
		return productBean;
	}
	
	
	
	
//	????????????id????????????name
	@ModelAttribute("sortMap") 
	public Map<Integer, String> getSortList() {
		Map<Integer, String> sortMap = new HashMap<>();
		List<ProductTypeBean> list = productTypeService.getSortList();
		for(ProductTypeBean ps : list) {  //??????????????????????????????(id,name) ??????map??????
			sortMap.put(ps.getProduct_type_id(), ps.getProduct_type_name());
		}
		return sortMap; 
	}

	
//	??????????????????????????????????????????(?????????????????????????????????)
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
	
//	??????Model
	@ExceptionHandler({ProductNotFoundException.class})
	public String handleErrorModel
	(Model model, HttpServletRequest request, ProductNotFoundException exception ) {
		model.addAttribute("invalidProductId",  exception.getProduct_id());
		model.addAttribute("exception",  exception);
		model.addAttribute("message", exception.getMessage() + "??????Model ?????? ModelAndView");
		model.addAttribute("url", request.getRequestURL() + "?" + request.getQueryString());
		return "_12_shoppingmall/productNotFound";
	}
	
	
// ?????????????????????????????????handle
//	@ExceptionHandler({Throwable.class})
//	public String handleError2
//	(Model model, HttpServletRequest request, Throwable exception ) {
//		model.addAttribute("exception",  exception);
//		model.addAttribute("message", exception.getMessage() + "(?????????????????????)");
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
	
//	??????????????????
//	@RequestMapping("/admin_editProduct")
//	public String admin(Model model) {  
//
//		return "_16_admin/admin_editProduct"; 
//	}
}
