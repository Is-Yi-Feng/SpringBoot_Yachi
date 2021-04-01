package com.example.demo._20_shoppingMall._22_shoppingCart.dao.shoppingCartImpl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo._00_util.Springboot2Hibernate5;
import com.example.demo._02_model.entity.CartBean;
import com.example.demo._10_member.entity.Member;
import com.example.demo._20_shoppingMall._22_shoppingCart.dao.CartBeanDao;

@Repository
public class CartBeanDaoImpl implements CartBeanDao {

	@Autowired
	Springboot2Hibernate5 factory;
	
	//取得所有購物車
	@SuppressWarnings("unchecked")
	@Override
	public List<CartBean> getAllCarts() {
		Session session = factory.getCurrentSession();
		String hql = "FROM CartBean";
		List<CartBean> list = session.createQuery(hql)
									 .getResultList();
		return list;
	}
	
	@Override
	public void addToCart(CartBean cartBean) throws SQLException{
		Session session = factory.getCurrentSession();
		session.save(cartBean);
	}


	@SuppressWarnings("unchecked")
	@Override
	//判斷某會員是某要加入同樣商品到購物車
	public CartBean hasCart(Integer memberId, Integer productId) {
		Session session = factory.getCurrentSession();
		String hql =  " FROM CartBean c "
//					+ " JOIN ProductBean p "
//					+ " ON c.productBean.product_id = p.product_id "
					+ " WHERE c.memberBean.memberId = :memberId  "
					+ " AND c.productBean.product_id = :productId " ;
		
//		可能得到0或1筆，故不能使用getSingleResult()，否則會丟出例外
		List<CartBean> result = session.createQuery(hql)
									 .setParameter("memberId", memberId)
									 .setParameter("productId", productId)
									 .getResultList();
		
//		System.out.println("================");
//		System.out.println(result.get(0).getCart_id());
//		System.out.println("================");
		
		if(result == null || result.isEmpty()) {
			return null;
		}
		
		return result.get(0);
	}


	//更新價格
	@Override
	public void updateCartTotal(CartBean cartBean) {
		Session session = factory.getCurrentSession();
		Double newTotal = cartBean.getCart_total();//CartBean類別 已經計算好total
		Integer cart_id = cartBean.getCart_id(); 
		String hql = " UPDATE CartBean c "
				   + " SET c.cart_total = :newTotal "
				   + " WHERE c.cart_id = :cart_id ";
		session.createQuery(hql)
			   .setParameter("newTotal", newTotal)
			   .setParameter("cart_id", cart_id)
			   .executeUpdate();
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<CartBean> findCartByMemberId(Integer memberId) {
		Session session = factory.getCurrentSession();
		String hql = " FROM CartBean c WHERE c.memberBean.memberId = :memberId ";
		List<CartBean> list = session.createQuery(hql)
								     .setParameter("memberId", memberId)
								     .getResultList();
		
		if(list == null || list.isEmpty()) {
			return null;
		}
		return list;
	}

	@Override
	public void deleteCart(Integer cart_id) {
		Session session = factory.getCurrentSession();
		CartBean cartBean = session.get(CartBean.class, cart_id);
		if(cartBean != null) {
			cartBean.setMemberBean(null); //卸除外鍵
			cartBean.setProductBean(null);
			session.delete(cartBean);
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void deleteCartByMemberId(Integer memberId) {
		Session session = factory.getCurrentSession();
		String hql = " FROM CartBean c "
				   + " WHERE c.memberBean.memberId = :memberId ";
		List<CartBean> carts = session.createQuery(hql)
									  .setParameter("memberId", memberId)
									  .getResultList();
		if(carts != null) {
			for(CartBean cart : carts) {
				cart.setMemberBean(null);
				cart.setProductBean(null);
				session.delete(cart);
			}
		}
	}
	

	@Override
	public void updateCartById(Integer cid, Integer amount, Double total) {
		Session session = factory.getCurrentSession();
		String hql = " UPDATE CartBean "
				   + " SET cart_total = :total, cart_amount = :amount "
				   + " WHERE cart_id = :cid ";
		session.createQuery(hql)
			   .setParameter("total", total)
			   .setParameter("amount", amount)
			   .setParameter("cid", cid)
			   .executeUpdate();
					
	}

	@Override
	public Member getMemberById(Integer cart_id) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT memberBean "
				   + " FROM CartBean "
				   + " WHERE cart_id = :cart_id";
		
		Member member = (Member) session.createQuery(hql).setParameter("cart_id", cart_id).getSingleResult();
		return member;
	}


	

}
