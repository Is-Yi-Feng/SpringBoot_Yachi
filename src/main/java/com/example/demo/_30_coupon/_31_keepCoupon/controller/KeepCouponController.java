//package _30_coupon._31_keepCoupon.controller;
//
//import org.springframework.stereotype.Controller;

//@Controller  //spring mvc 控制器
//public class KeepCouponController {
	
//	@Autowired
//	ProductService service;
	
	
//	
////	控制器方法
//	@RequestMapping("/welcome")
//	public String nightShop(Model model) {  //有東西要交給view 就放model
////		model.addAttribute("store", "方家雞肉飯"); // 底層是 forward()
//		return "_14_nightShop/1_shop"; 
//	}
//	
//	
//	//商品主頁(找出所有產品)
//	@RequestMapping({"/shopping.store"})
//	public String store(Model model) {
//		List<ProductBean> list = service.getAllProducts();
//		model.addAttribute("products", list);
//		return "_12_shoppingmall/2_shopping";
//	}
//
//	
//	//更新產品價格
//	@RequestMapping("/update/price")
//	public String updatePrice(Model model) {
//		service.updateAllPrice();
//		return "redirect:/shopping.store";  
//		//此處的導向是要寫控制器名稱(RequestMapping的名稱)
//		//而不是 真正的視圖名稱
//	} 
//	
//	//依分類查詢
////	@RequestMapping("queryBySort")
////	public String getSortList(Model model) {
////		List<Product_sort> list = service.getAllSorts();
////		model.addAttribute("sortList", list);
////		return "2_shopping";
////	}
//	
//
//	
//	//依種類顯示(請求路徑會變動)
////	@RequestMapping("/sort={sortId}")
////	public String getProductsBySort(Model model, @PathVariable("sortId") int sortId) {
////		List<ProductBean> products = service.getProductBySort(sortId);
////		ProductTypeBean ps = service.getSortById(sortId);
////		model.addAttribute("products", products);
////		model.addAttribute("sort", ps); // 依據產品種類顯示title
////		return "_12_shoppingmall/2_shopping";
////	}
//	
//	
//	
////	查詢單筆產品資料
//	@RequestMapping("/singleProduct")
//	public String getProductById(@RequestParam("id") Integer id,Model model) {
//		model.addAttribute("product", service.getProductById(id));
//		return "_12_shoppingmall/3_productDetail";
//	}
//	
//	
//	/**
//	 * step1.抵達表單頁面的路徑是：@GetMapping("/products/add") 
//	 * step2.此表單預設action為"/products/add"
//	 * step3.表單送出使用post方法，故再加上路徑則會走標註@PostMapping("/products/add") 的控制器方法
//	 */
//	
////	表單頁面控制器方法
//	@GetMapping("/products/add")
//	public String getAddNewProductFormString(Model model) {
//		ProductBean pb = new ProductBean();
//		pb.setProduct_name("商品名稱不知道要取什麼-1");  
//		pb.setProduct_info("因為不知道要賣什麼所以商品資訊也不知道要填什麼");
//		pb.setProduct_price(111.0);
//		model.addAttribute("productBean", pb); //將pb 加入model中
//		return "_16_admin/insertProduct";
//	}
//	
//	
//	/**
//	 * action 屬性的預設值，原本頁面的路徑
//	 */
//	
//	
////	新增表單成功
//	@PostMapping("/products/add")  // 路徑與上一支方法一樣，但是此處請求方法是Post 所以會來找這一支控制器
//	public String processAddNewProductForm(@ModelAttribute("productBean") ProductBean pb) {
////		新增產品需傳入ProductBean參數(從上model取出)
////		@ModelAttribute用在方法參數內：可直接從參數取值(又稱數據綁定)
////		資料檢查條件寫在這...
//		service.addProduct(pb);  
//		return "redirect:/shopping.store";
//	}
//	
//	
//	
//	/**
//	 * 會先執行加@ModelAttribute註釋的控制器方法
//	 * 並將結果添加到model中
//	 */
//	
////	得到種類id與對應的name
////	@ModelAttribute("sortMap") 
////	public Map<Integer, String> getSortList() {
////		Map<Integer, String> sortMap = new HashMap<>();
////		List<ProductTypeBean> list = service.getSortList();
////		for(ProductTypeBean ps : list) {  //取出每一個種類物件的(id,name) 放入map物件
////			sortMap.put(ps.getProduct_type_id(), ps.getProduct_type_name());
////		}
////		return sortMap; 
////	}
////	
////	@ModelAttribute("sortList")   
////	public List<ProductTypeBean> getSorList() {
////	    return service.getSortList();
////	}
//	
//	
////	@RequestMapping("sortList")
////	public List<String> getSortList(){
////		return service.getAllSorts();
////	}
//	
//	
////	@RequestMapping("/productDetail.html")
////	public String showProductInfo() {
////		return "3_productDetail";
////	}
//	
//	@RequestMapping("/carContent.html")
//	public String showCarContent() {
//		return "_12_shoppingmall/5_cartContent";
//	}
//	
//	@RequestMapping("/orderDetail.html")
//	public String showOrderDetail() {
//		return "_12_shoppingmall/6_orderDetail";
//	}
//}
