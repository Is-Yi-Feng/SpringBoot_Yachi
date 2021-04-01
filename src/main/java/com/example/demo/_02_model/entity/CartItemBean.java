//package _02_model.entity;
//
//import java.io.Serializable;
//
//import javax.persistence.CascadeType;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.ManyToOne;
//import javax.persistence.OneToOne;
//import javax.persistence.Table;
//
//@Entity
//@Table(name = "Cart_Item")
//public class CartItemBean implements Serializable{
//	private static final long serialVersionUID = 1L;
//	
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	private Integer cart_item_id;
//	
//	@ManyToOne
//	@JoinColumn(name="FK_cart_id")
//	private CartBean cartBean;
//	
//	@OneToOne(cascade = CascadeType.ALL)
//	@JoinColumn(name="FK_product_id")
//	private ProductBean productBean;
//	
//	private String cart_item_memo;
//	
//	private Integer cart_item_amount;
//
//	public Integer getCart_item_id() {
//		return cart_item_id;
//	}
//
//	public void setCart_item_id(Integer cart_item_id) {
//		this.cart_item_id = cart_item_id;
//	}
//
//	public CartBean getCartBean() {
//		return cartBean;
//	}
//
//	public void setCartBean(CartBean cartBean) {
//		this.cartBean = cartBean;
//	}
//
//	public ProductBean getProductBean() {
//		return productBean;
//	}
//
//	public void setProductBean(ProductBean productBean) {
//		this.productBean = productBean;
//	}
//
//	public String getCart_item_memo() {
//		return cart_item_memo;
//	}
//
//	public void setCart_item_memo(String cart_item_memo) {
//		this.cart_item_memo = cart_item_memo;
//	}
//	
//	
//
//	public Integer getCart_item_amount() {
//		return cart_item_amount;
//	}
//
//	public void setCart_item_amount(Integer cart_item_amount) {
//		this.cart_item_amount = cart_item_amount;
//	}
//
//	
//
//	public CartItemBean(Integer cart_item_id, CartBean cartBean, ProductBean productBean, String cart_item_memo,
//			Integer cart_item_amount) {
//		super();
//		this.cart_item_id = cart_item_id;
//		this.cartBean = cartBean;
//		this.productBean = productBean;
//		this.cart_item_memo = cart_item_memo;
//		this.cart_item_amount = cart_item_amount;
//	}
//
//	public CartItemBean() {
//		super();
//	}
//	
//	
//	
//	
//
//}
