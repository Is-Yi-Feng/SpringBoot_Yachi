package com.example.demo.test;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo._10_member.entity.Member;

@Transactional
@Service
public class memberTestService {
	
	@Autowired
	memDao memberDao;
	
	public Member getMember(Integer memberid) {
		return memberDao.getMember(memberid);
	}
	
	public List<Member> getMember2(String name) {
		return memberDao.getMember2(name);
	}

}
