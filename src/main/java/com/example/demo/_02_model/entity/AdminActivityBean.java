package com.example.demo._02_model.entity;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="Admin_Activity")
public class AdminActivityBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer adminactivity_id;
	
	private String adminactivity_name;
	
	private Date adminactivity_end;
	
	private Date adminactivity_begin;
	
	private String adminactivity_content;
	
	@Column(columnDefinition = "mediumblob")
	private Blob adminactivity_pic;	
	private String adminfile_name;	
	@Transient
	private MultipartFile adminactivity_image;
	
	public Integer getAdminactivity_id() {
		return adminactivity_id;
	}
	public void setAdminactivity_id(Integer adminactivity_id) {
		this.adminactivity_id = adminactivity_id;
	}
	public String getAdminactivity_name() {
		return adminactivity_name;
	}
	public void setAdminactivity_name(String adminactivity_name) {
		this.adminactivity_name = adminactivity_name;
	}
	public Date getAdminactivity_end() {
		return adminactivity_end;
	}
	public void setAdminactivity_end(Date adminactivity_end) {
		this.adminactivity_end = adminactivity_end;
	}
	public Date getAdminactivity_begin() {
		return adminactivity_begin;
	}
	public void setAdminactivity_begin(Date adminactivity_begin) {
		this.adminactivity_begin = adminactivity_begin;
	}
	public String getAdminactivity_content() {
		return adminactivity_content;
	}
	public void setAdminactivity_content(String adminactivity_content) {
		this.adminactivity_content = adminactivity_content;
	}
	public Blob getAdminactivity_pic() {
		return adminactivity_pic;
	}
	public void setAdminactivity_pic(Blob adminactivity_pic) {
		this.adminactivity_pic = adminactivity_pic;
	}
	public String getAdminfile_name() {
		return adminfile_name;
	}
	public void setAdminfile_name(String adminfile_name) {
		this.adminfile_name = adminfile_name;
	}
	public MultipartFile getAdminactivity_image() {
		return adminactivity_image;
	}
	public void setAdminactivity_image(MultipartFile adminactivity_image) {
		this.adminactivity_image = adminactivity_image;
	}

	
}
	