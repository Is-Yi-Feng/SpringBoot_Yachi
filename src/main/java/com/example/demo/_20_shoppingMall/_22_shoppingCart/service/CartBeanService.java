package com.example.demo._20_shoppingMall._22_shoppingCart.service;

import java.util.List;
import java.util.Map;

import com.example.demo._02_model.entity.CartBean;
import com.example.demo._10_member.entity.Member;
import com.example.demo._20_shoppingMall._22_shoppingCart.vo.MemberCartBeanVo;
import com.example.demo._20_shoppingMall._22_shoppingCart.vo.SessionCartVo;

public interface CartBeanService {
	public void addToCart(Integer memberId, Integer productId, Integer qty);

	public List<CartBean> findCartByMemberId(Integer memberId);
	
	//更新購物車的total(當產品價格改變須同步更新購物車表格的total)
	public void updateCartTotal();
	
	//刪除一筆購物車紀錄
	public void deleteCart(Integer cart_id);

	//根據使用者id的清空所有購物車紀錄
	public void deleteCartByMemberId(Integer memberId);
	
	public void udateCartById(Integer cid, Integer amount, Double price);

	public List<SessionCartVo> getCartVo(Map<Integer, Integer> sessionCart);

	public List<MemberCartBeanVo> getMemberCartVo(Integer memberId);
	
	//根據cart_id找member
	public Member getMemberById(Integer cart_id);
}
