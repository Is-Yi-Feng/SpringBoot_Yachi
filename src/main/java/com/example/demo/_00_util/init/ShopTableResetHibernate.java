package com.example.demo._00_util.init;
//
///*  
//    程式說明：建立表格與設定初始測試資料。
//    表格包括：Book, BookCompany, Member, Orders, OrderItems
// 
//*/

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.sql.Blob;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.example.demo._00_util.util.HibernateUtils;
import com.example.demo._00_util.util.SystemUtils2018;
import com.example.demo._02_model.entity.ShopBean;

//這是原始的 Hibernate程式 需要搭配 hibernate.cfg.xml

public class ShopTableResetHibernate {
	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元

	public static void main(String args[]) {

		String line = "";

		int count = 0;
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try { 
			tx = session.beginTransaction();
			File file = new File("data/shops.dat");
			
			// 2. 由"data/shops.dat"逐筆讀入shop表格內的初始資料，然後依序新增
			// 到Book表格中
			try (
				FileInputStream fis = new FileInputStream(file);
				InputStreamReader isr = new InputStreamReader(fis, "UTF8");
				BufferedReader br = new BufferedReader(isr);
			) {
				while ((line = br.readLine()) != null) {
					System.out.println("line=" + line);
					// 去除 UTF8_BOM: \uFEFF
					if (line.startsWith(UTF8_BOM)) {
						line = line.substring(1); 
					}
					String[] token = line.split("\\|");
//					ShopBean shopBean = new ShopBean();  //新增用
					
					Integer shop_id = Integer.valueOf(token[0].trim());
					ShopBean shopBean = session.get(ShopBean.class, shop_id); //更新用
					
					String shop_name = token[1].trim();
					String shop_hours = token[2].trim();
					Blob shop_pic = SystemUtils2018.fileToBlob(token[3].trim());
					String shop_info = token[4].trim();
					String shop_phone = token[5].trim();
					String shop_addr = token[6].trim();
					
					// 店加種類 與 夜市外鍵 沒有id
//					shopBean.setShop_id(shop_id);
//					shopBean.setShop_name(shop_name);
//					shopBean.setShop_hours(shop_hours);
					shopBean.setShop_pic(shop_pic);//存圖片
					shopBean.setShop_file_name(SystemUtils2018.extractFileName(token[3].trim()));//圖片路徑
//					shopBean.setShop_pic(null);//存圖片
//					shopBean.setShop_file_name(null);//圖片路徑
//					shopBean.setShop_info(shop_info);
//					shopBean.setShop_phone(shop_phone);
//					shopBean.setShop_addr(shop_addr);
					
				
//					session.save(shopBean);
					session.update(shopBean);
					System.out.println("更新一筆shopBean紀錄成功");
				}
				// 印出資料新增成功的訊息
				session.flush();
				System.out.println("更新shopBean紀錄成功");
			}catch (Exception ex) {
				ex.printStackTrace();
			}

            tx.commit();
		} catch (Exception e) {
			System.err.println("新建表格時發生例外: " + e.getMessage());
			e.printStackTrace();
			tx.rollback();
		} 
        factory.close();
	}

}