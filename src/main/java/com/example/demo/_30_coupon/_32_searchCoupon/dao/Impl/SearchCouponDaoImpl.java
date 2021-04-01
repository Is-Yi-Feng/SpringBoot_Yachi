package com.example.demo._30_coupon._32_searchCoupon.dao.Impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo._00_util.Springboot2Hibernate5;
import com.example.demo._02_model.entity.CouponBean;
import com.example.demo._30_coupon._32_searchCoupon.dao.SearchCouponDao;
import com.example.demo._30_coupon._32_searchCoupon.service.SearchCouponService;
@Transactional
@Repository
public class SearchCouponDaoImpl implements SearchCouponDao {
	
	
	@Autowired
	Springboot2Hibernate5 factory;



// =================================失敗之後再試試看================================	
//	@Override
//	@SuppressWarnings({ "unchecked", "rawtypes" })
//	public List<Map<String,Object>> getCouponByCouponName(String coupon_Name){
//		Session session = sessionFactory.getCurrentSession();
//		String sql = " SELECT coupon_id, coupon_amount, coupon_begin, coupon_end, "
//				+ " coupon_info, coupon_memo, coupon_name, coupon_rule "
//				+ "	FROM coupon "
//				+ "	WHERE coupon_name LIKE = :coupon_Name " ;
//				
//		//===============設定結果集:設定結果型態List<Map<String,Object>>======================================	
//				Query q = session.createNativeQuery(sql);
//				q.unwrap(NativeQueryImpl.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
//				
//				List<Map<String,Object>> ans = q.setParameter("coupon_Name", "%" + coupon_Name +"%").list();
//				
//				System.out.println("ans==========" + ans);
//				return ans;
//	}

	


	
	// ==================================	查詢對應到的字串優惠券==================================	
		@SuppressWarnings("unchecked")
		public List<CouponBean> getCouponByCouponName(String coupon_name) {
			Session session = factory.getCurrentSession();
			String hql = "FROM CouponBean  Where coupon_name LIKE :coupon_name ";
			List<CouponBean> list = session.createQuery(hql)
											.setParameter("coupon_name","%"+coupon_name+"%")
											.getResultList();
			System.out.println("===============dao==========");
			return list;
		}

	

}
