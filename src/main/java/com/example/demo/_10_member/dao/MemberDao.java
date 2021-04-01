package com.example.demo._10_member.dao;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo._10_member.entity.Member;
import com.example.demo._10_member.entity.Role;



@Repository
public interface MemberDao extends JpaRepository<Member, Integer> {

	
	// 參數一定要和資料庫欄位名稱一致
	
	public Member findByUsername(String username);
	
	public Member findByMemberId(Integer memberId);
	
	public List<Member> findByRolesIn(Set<Role> roles);
	
	public Member findByCode(String code);
	
	
}	