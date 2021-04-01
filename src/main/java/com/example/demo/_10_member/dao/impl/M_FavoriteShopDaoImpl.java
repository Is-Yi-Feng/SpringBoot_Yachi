package com.example.demo._10_member.dao.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.hibernate.query.internal.NativeQueryImpl;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo._00_util.Springboot2Hibernate5;
import com.example.demo._02_model.entity.FavoriteShopListBean;
import com.example.demo._02_model.entity.ShopBean;
import com.example.demo._10_member.dao.M_FavoriteShopDao;

@Repository
public class M_FavoriteShopDaoImpl implements M_FavoriteShopDao {

	@Autowired
	Springboot2Hibernate5 factory;

//	==========================找出memberId的FavoriteShopListBean對應表單所有資訊================================================
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map<String,Object>> getMyFavoriteShopByMemberId(Integer memberId){
		Session session = factory.getCurrentSession();
		String sql = " SELECT fsl.subscribe_time, s.shop_id, s.shop_name, s.shop_media, s.shop_info, s.shop_addr, "
				+ " s.shop_phone, s.shop_hours, s.shop_hyperlink, s.shop_owner, s.shop_score, s.shop_memo, "
				+ "	s.shop_file_name, s.shop_pic "
				+ " FROM shop s "
				+ " LEFT JOIN shop_shoplist sl ON sl.FK_Shop_id = s.shop_id "
				+ " LEFT JOIN favorite_shoplist fsl ON fsl.shop_list_id = sl.FK_ShopList_id "
				+ " WHERE fsl.FK_member_id = :memberId ";
				
		//===============設定結果集:設定結果型態List<Map<String,Object>>======================================	
				Query q = session.createNativeQuery(sql);
				q.unwrap(NativeQueryImpl.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
				
				List<Map<String,Object>> ans = q.setParameter("memberId", memberId).list();
				return ans;
	}
//	==========================shop================================================
	@Override
	public ShopBean  getShopBy_shop_id(Integer shop_id) {
		System.out.println("=================dao=======================");
		Session session = factory.getCurrentSession();
		
		ShopBean sb = session.get(ShopBean.class, shop_id);
		
		return  sb;
	}

//	==========================delete================================================
	@Override
	public void deleteSingleFavoriteShopByMemberId(Integer memberId, Integer shop_id) {
		Session session = factory.getCurrentSession();
		ShopBean cp = session.get(ShopBean.class, shop_id);
		String hql = "FROM FavoriteShopListBean WHERE memberBean.memberId = :mid";
		FavoriteShopListBean favoriteShopListBean = new FavoriteShopListBean();
		try {
			favoriteShopListBean = (FavoriteShopListBean) session.createQuery(hql).setParameter("mid", memberId)
					.getSingleResult();//每個人只會有一筆shopList
		} catch (Exception e) {
			e.printStackTrace();
		}
		Set<ShopBean> shops = new HashSet<ShopBean>();
		System.out.println(favoriteShopListBean.getShop_list_id());
		shops = favoriteShopListBean.getShops();
		shops.remove(cp);
		favoriteShopListBean.setShops(shops);
		
		session.update(favoriteShopListBean);

	}
	
	@Override
	public Set<ShopBean> getMyFavoriteShopByMemberId2(Integer memberId){
		Session session = factory.getCurrentSession();
		String hql = "FROM FavoriteShopListBean WHERE memberBean.memberId = :mid";
		List<FavoriteShopListBean> favoriteShopListBeans = session.createQuery(hql).setParameter("mid", memberId).getResultList();
		Set<ShopBean> shops = new HashSet<ShopBean>();
		for (FavoriteShopListBean favoriteShopListBean:favoriteShopListBeans) {
			shops = favoriteShopListBean.getShops();
			}
		//===============設定結果集:設定結果型態List<Map<String,Object>>======================================	
			
				return shops;
	}

}
