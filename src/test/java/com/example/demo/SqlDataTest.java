package com.example.demo;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.example.demo._00_util.Springboot2Hibernate5;
import com.example.demo._01_config.SystemUtils2021;
import com.example.demo._02_model.entity.OrderNumberBean;
import com.example.demo._10_member.entity.Member;

@SpringBootTest
public class SqlDataTest {
	
	@Autowired
	SystemUtils2021 sUtils2021;
	
	@Autowired
	Springboot2Hibernate5 factory;
	
	Session session;
	Transaction tx;
	
	@BeforeEach
	public void init() {
		session = factory.getCurrentSession();
		tx = session.beginTransaction();
		
	}
	
	@AfterEach
	public void Destroyable() {
		try {
			System.out.println("3.-----------------commit()開始");
			tx.commit();
			System.out.println("4.-----------------commit()結束");
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void initOrderRandomNumber() {	
		String orderString ;
		for (int i = 1; i < 1100; i += 11) {			
			orderString = "YA" + String.format("%05d", i) + "CHI";		
			session.save(new OrderNumberBean(null,orderString));
		}	
	
	}
	
	@Test
	public void ProductTableResetHibernate() {
		
	
		
		
	}
	
	

}
