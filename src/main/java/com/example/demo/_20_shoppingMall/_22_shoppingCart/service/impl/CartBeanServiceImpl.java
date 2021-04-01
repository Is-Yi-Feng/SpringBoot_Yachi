package com.example.demo._20_shoppingMall._22_shoppingCart.service.impl;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo._02_model.entity.CartBean;
import com.example.demo._02_model.entity.ProductBean;
import com.example.demo._10_member.dao.MemberDao;
import com.example.demo._10_member.entity.Member;
import com.example.demo._20_shoppingMall._21_product.dao.ProductDao;
import com.example.demo._20_shoppingMall._22_shoppingCart.dao.CartBeanDao;
import com.example.demo._20_shoppingMall._22_shoppingCart.service.CartBeanService;
import com.example.demo._20_shoppingMall._22_shoppingCart.vo.MemberCartBeanVo;
import com.example.demo._20_shoppingMall._22_shoppingCart.vo.SessionCartVo;
@Service
@Transactional
public class CartBeanServiceImpl implements CartBeanService {
	@Autowired
	CartBeanDao cartBeanDao;
	@Autowired
	ProductDao productDao;
	@Autowired
	MemberDao memberDao;

	
	
	@Transactional
	@Override
	public void addToCart(Integer memberId, Integer productId, Integer qty) {
		try {
			//判斷購物車某會員是否已經加入某商品至購物車
			CartBean cartBean = cartBeanDao.hasCart(memberId, productId);
			if(cartBean == null) {
				Member member = memberDao.findByMemberId(memberId);
				ProductBean productBean = productDao.getProductById(productId);
			
				cartBean = new CartBean();
//				封裝購物車資訊
				cartBean.setMemberBean(member);
				cartBean.setProductBean(productBean);
				cartBean.setCart_amount(qty); //從前端傳來的數量
				cartBean.setCart_total(cartBean.getCart_total());//存入總金額
				
			 
//				存入購物車
				cartBeanDao.addToCart(cartBean);
				
			}else { //購物車裡面已經存在會員id 與 產品id 
				cartBean.setCart_amount(cartBean.getCart_amount() + qty); //傳來的數量加上最原本的
				cartBeanDao.updateCartTotal(cartBean); //當購物車存在修改購物車價格(數量改了價格也要改)
			}
				
				
			//創建購物車
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	@Transactional
	public List<CartBean> findCartByMemberId(Integer memberId) {
		return cartBeanDao.findCartByMemberId(memberId);
	}

	@Override
	@Transactional
	//更新購物車的total(當產品價格改變須同步更新購物車表格的total)
	public void updateCartTotal() {
		List<CartBean> allCarts = cartBeanDao.getAllCarts();
		for(CartBean cart : allCarts) {
			if(cart.getCart_total() != null) {
				cartBeanDao.updateCartTotal(cart);
			}
		}
	}

	@Override
	@Transactional
	public void deleteCart(Integer cart_id) {
		cartBeanDao.deleteCart(cart_id);
	}

	
	@Override
	@Transactional
	public void deleteCartByMemberId(Integer memberId) {
		cartBeanDao.deleteCartByMemberId(memberId);
	}
	
	@Override
	@Transactional
	public void udateCartById(Integer cid, Integer amount, Double price) {
		//price 是前端傳的單一價格，必須先計算在送去資料庫
		Double total = (double) (amount * price);
		cartBeanDao.updateCartById(cid,amount,total);
	}

	@Override
	public List<SessionCartVo> getCartVo(Map<Integer, Integer> sessionCart) {
		Integer key = null;
		List<SessionCartVo> sessionCartVoList = new LinkedList<>();
		
		Iterator<Integer> iterator = sessionCart.keySet().iterator();
		while(iterator.hasNext()){
			key = iterator.next(); //product_id
			Integer value = sessionCart.get(key); //qty
			System.out.println("keyvalue==========="+ key + " : " + value);
		
		
			SessionCartVo sessionCartVo = new SessionCartVo();
			ProductBean  productBean = productDao.getProductById(key);

			System.out.println("productBean=========" + productBean);
			sessionCartVo.setProduct_id(productBean.getProduct_id());
			sessionCartVo.setProduct_spec(productBean.getProduct_spec());
			sessionCartVo.setProduct_name(productBean.getProduct_name()); //產品名稱
			sessionCartVo.setProduct_price(productBean.getProduct_price()); //產品價格
			sessionCartVo.setFilename(productBean.getFilename());
			sessionCartVo.setProduct_stock(productBean.getProduct_stock());
			sessionCartVo.setProduct_pic(productBean.getProduct_pic()); //產品照片
			sessionCartVo.setScQty(value);

			//把封裝好的sessionCartVo 加進 list裡面
			sessionCartVoList.add(sessionCartVo);
		  }
		return sessionCartVoList;
	}

	//在CartBean 的Table 找出某會員的所有購物車裝進 MemberCartBeanVo
	@Override
	public List<MemberCartBeanVo> getMemberCartVo(Integer memberId) {
		List<CartBean> carts = cartBeanDao.findCartByMemberId(memberId);
		List<MemberCartBeanVo> memberCartVoList = new LinkedList<>();
		if(carts != null) {
			for(CartBean cart : carts) {
				MemberCartBeanVo memberCartVo = new MemberCartBeanVo(); //須放在此才能每次new一個新的
				memberCartVo.setProduct_id(cart.getProductBean().getProduct_id());
				memberCartVo.setProduct_price(cart.getProductBean().getProduct_price());
				memberCartVo.setProduct_name(cart.getProductBean().getProduct_name());
				memberCartVo.setScQty(cart.getCart_amount());
				memberCartVo.setProduct_spec(cart.getProductBean().getProduct_spec());
				memberCartVo.setCart_id(cart.getCart_id());
				memberCartVoList.add(memberCartVo);
			}
		}
		return memberCartVoList;
	}

	@Override
	public Member getMemberById(Integer cart_id) {
		return cartBeanDao.getMemberById(cart_id);
	}

	


	
}
