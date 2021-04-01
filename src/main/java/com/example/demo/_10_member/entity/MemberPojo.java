package com.example.demo._10_member.entity;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;

import org.springframework.web.multipart.MultipartFile;

import com.example.demo._02_model.entity.ShopBean;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.sun.istack.NotNull;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
//@Entity
//@Table
public class MemberPojo implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer memberId;
	
	
	@NotBlank(message = "帳號不能為空")
	private String username;
	
	// 不允許特殊符號、數字、英文字母以外的字元輸入
	// 密碼長度4到10個字元
	// 至少要有一個特殊符號
	// 至少要有一個大寫或小寫的英文字母
	// 至少要有一個0-9的數字
	@Pattern(regexp = "^(?!.*[^\\x21-\\x7e])(?=.{4,10})(?=.*[\\W])(?=.*[a-zA-Z])(?=.*\\d).*$" 
	,message = "大小寫英文加數字長度最低為4且要有特殊符號")
	private String password;
	
	@NotBlank(message = "你沒有名子?")
	private String fullname;
	
	private String sex;
	
//	@Temporal(TemporalType.DATE)
//	@Past(message = "你來自未來?") @NotNull 
	private Date birthday;
	
	@NotNull
	@Pattern(regexp = "^09(?=\\d{8}).{8}$",message = "必須是09XX-XXX-XXX")
	private String phone;
	
	@Email
	@Pattern(regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$",
	message = "請輸入正確格式的信箱")
	private String email;
	
	private String address;
	private Integer status;
	private String code;
	
	private Timestamp registerTime;
	
	@JsonIgnore
	@Column(columnDefinition = "mediumblob")
	private Blob image;
	private String fileName;
	
	@JsonIgnore
	@Transient
	MultipartFile memberMultipartFile;
	
	@OneToOne
	@JoinColumn(name = "FK_shop_id")
	private ShopBean shopBean;
	
	// ‎Member 表存儲認證，Role 儲存權限（許可權）。 
	// 使用者和角色之間是多對多關係，因為使用者可以有一個或多個角色，角色也可以分配給一個或多個使用者。 
	// 所以需要中間表 member_role 來實現多對多關聯。‎

	 @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	    @JoinTable(                              				   //配置中介表的訊息
	        name = "Member_Role",								
	        joinColumns = @JoinColumn(name = "fk_member_id"),        //建立當前表在中介表的外鍵
	        inverseJoinColumns = @JoinColumn(name = "fk_roles_id")
	        )
	private Set<Role> roles;


}
