package com.example.demo;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.sql.Blob;

import org.hibernate.Session;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo._00_util.util.SystemUtils2018;
import com.example.demo._02_model.entity.OrderNumberBean;
import com.example.demo._02_model.entity.ProductBean;

@SpringBootTest
public class SqlDataTest {
	
	
	@Autowired
	Session session;
		
	@Transactional
	@Test
	public void initOrderRandomNumber() {	
		String orderString ;
		for (int i = 1; i < 110; i += 11) {			
			orderString = "YA" + String.format("%05d", i) + "CHI";		
			session.save(new OrderNumberBean(null,orderString));
		}	
	
	}
	
	@Transactional
	@Test
	public void editOrderRandomNumber() {	
		
		OrderNumberBean bean = session.get(OrderNumberBean.class, 1);
		bean.setRandom_code("123");
		session.update(bean);
	}
	
	
	
	@Test
	public void ProductTableResetHibernate() {
		
		String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元
		String line = "";
		File file = new File("data/products.dat");
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
					
					productBean.setFilename(SystemUtils2018.extractFileName(token[1].trim()));
					productBean.setFilenameA(SystemUtils2018.extractFileName(token[2].trim()));

//					session.update(productBean);
					session.saveOrUpdate(productBean);
					System.out.println("更新一筆ProductBean紀錄成功");
				}
				// 印出資料新增成功的訊息
//				session.flush();
				System.out.println("更新ProductBean紀錄成功");
			}catch (Exception ex) {
				ex.printStackTrace();
			}
	}	

}
