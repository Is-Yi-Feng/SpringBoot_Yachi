package com.example.demo.test;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo._00_util.Springboot2Hibernate5;
import com.example.demo._10_member.entity.Member;

@Repository
public class memDao {
		
	@Autowired
	Springboot2Hibernate5 factory;
	
	public Member getMember(Integer memberid) {
		
		Session session = factory.getCurrentSession();
		Member member = session.get(Member.class, memberid);
		
		return member;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Member> getMember2(String name) {
		
		Session session = factory.getCurrentSession();
		String hql = "from Member m where m.fullname like :name";
		
		List list = session.createQuery(hql)
						   .setParameter("name", "%"+name+"%")
						   .getResultList();
		
		return list;
	}
	
	
	public void update(Member member) {
		Session session = factory.getCurrentSession();
		session.update(member);
	}
	
}






