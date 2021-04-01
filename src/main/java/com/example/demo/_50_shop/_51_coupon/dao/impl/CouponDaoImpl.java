package com.example.demo._50_shop._51_coupon.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo._00_util.Springboot2Hibernate5;
import com.example.demo._02_model.entity.CouponBean;
import com.example.demo._02_model.entity.CouponUsedBean;
import com.example.demo._02_model.entity.ShopBean;
import com.example.demo._50_shop._51_coupon.dao.CouponDao;



@Repository
public class CouponDaoImpl implements CouponDao{
	
	
	@Autowired
	Springboot2Hibernate5 factory;
	
	@Override
	public CouponBean getCoupon(int couponId) {
		Session session = factory.getCurrentSession();
		CouponBean cb = session.get(CouponBean.class, couponId);
		return cb;
	}
	
	@Override
	public ShopBean getShop(int shopId) {
		Session session = factory.getCurrentSession();
		ShopBean cb = session.get(ShopBean.class, shopId);
		return cb;
	}

	@Override
	public int saveCoupon(CouponBean bean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(bean);
		n++;
		return n;
	}

	@Override
	public List<CouponBean> getAllCoupons() {
		List<CouponBean> list = null;
		String hql = "FROM CouponBean";
		Session session = factory.getCurrentSession();

		list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public List<CouponBean> getShopCoupons(int shopId) {
		List<CouponBean> list = null;
        Session session = factory.getCurrentSession();
        String hql = "FROM CouponBean cb WHERE cb.shopBean.shop_id = :sid";
        list = session.createQuery(hql)
        			  .setParameter("sid", shopId)
        			  .getResultList();
		return list;
	}

	@Override
	public int updateCoupon(CouponBean bean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.update(bean);
		n++;
		return n;
	}

	@Override
	public int deleteCoupon(int couponId) {
		int n = 0;
		Session session = factory.getCurrentSession();
		CouponBean cb = new CouponBean();
		cb.setCoupon_id(couponId);
		session.delete(cb);
		n++;
		return n;
	}

	@Override
	public void saveCouponUsed(CouponUsedBean couponUsedBean) {
//		int n = 0;//可不寫
		Session session = factory.getCurrentSession();
		session.save(couponUsedBean);
//		n++;//可不寫
//		System.out.println("n" + n );
		
		}

	

//@SuppressWarnings("unchecked")
//	@Override
//	public List<Map<String,Object>> queryCoupon(String queryCoupon) {
//		Session session = factory.getCurrentSession();
//		String sql = " SELECT coupon_id, coupon_amount, coupon_begin, coupon_end, coupon_info, coupon_memo, "
//				+ " coupon_name, coupon_pic, coupon_rule, file_name " 
//				+ " FROM coupon " 
//				+ " WHERE coupon_name LIKE :queryCoupon ";
//				
//		//===============�]�w���G��:�]�w���G���AList<Map<String,Object>>======================================	
//				
//				Query q = session.createNativeQuery(sql);
//				q.unwrap(NativeQueryImpl.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
//				
//				List<Map<String,Object>> ans = 
//										q.setParameter("queryCoupon","%" + queryCoupon + "%").list();
//				System.out.println("=========================================");
//				System.out.println("queryCoupon=" + queryCoupon);
//				System.out.println("ans=" +ans);
//				return ans;
//	}
	

	

}
