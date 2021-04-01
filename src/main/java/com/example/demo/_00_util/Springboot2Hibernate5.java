package com.example.demo._00_util;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.springframework.stereotype.Component;



// 這是SpringBoot中要能取用SessionFactory的配置  不需要搭配 hibernate.cfg.xml

@Component
public class Springboot2Hibernate5 {
	
	@PersistenceContext
	EntityManager em;
	
	public Session getCurrentSession() {
	    Session session = em.unwrap( Session.class );
	    return session;
	}
	
}
