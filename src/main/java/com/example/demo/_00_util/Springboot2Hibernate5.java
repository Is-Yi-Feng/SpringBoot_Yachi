package com.example.demo._00_util;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import javax.validation.constraints.Email;

import org.hibernate.Session;
import org.springframework.stereotype.Component;



// 這是SpringBoot中要能取用SessionFactory的配置  不需要搭配 hibernate.cfg.xml

@Component
public class Springboot2Hibernate5 {
	
	@PersistenceContext
	EntityManager em;
	
	@Transactional
	public Session getCurrentSession() {
	    Session session = em.unwrap( Session.class );
	    return session;
	}
	
}
