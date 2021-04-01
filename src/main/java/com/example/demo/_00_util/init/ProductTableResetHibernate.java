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
import com.example.demo._02_model.entity.ProductBean;


// 這是原始的 Hibernate程式  需要搭配 hibernate.cfg.xml
public class ProductTableResetHibernate {
	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元

	public static void main(String args[]) {

		String line = "";

		int count = 0;
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try { 
			tx = session.beginTransaction();
			File file = new File("data/products.dat");
			
			// 2. 由"data/book.dat"逐筆讀入Book表格內的初始資料，然後依序新增
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
					//依據product_id 取得 productBean
					Integer product_id = Integer.valueOf(token[0].trim());
					ProductBean productBean = session.get(ProductBean.class, product_id);
					
					// 讀取圖片檔
					Blob blobPic = SystemUtils2018.fileToBlob(token[1].trim());
					Blob blobPicA = SystemUtils2018.fileToBlob(token[2].trim());
					
					productBean.setProduct_pic(blobPic);
					productBean.setProduct_picA(blobPicA);
//					productBean.setProduct_pic(null);
//					productBean.setProduct_picA(null);
					
					productBean.setFilename(SystemUtils2018.extractFileName(token[1].trim()));
					productBean.setFilenameA(SystemUtils2018.extractFileName(token[2].trim()));
//					productBean.setFilename(null);
//					productBean.setFilenameA(null);
					
					
					
				
					session.update(productBean);
					System.out.println("更新一筆ProductBean紀錄成功");
				}
				// 印出資料新增成功的訊息
				session.flush();
				System.out.println("更新ProductBean紀錄成功");
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