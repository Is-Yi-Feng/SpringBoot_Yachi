//package _02_model.entity;
//
//import java.io.Serializable;
//import java.sql.Blob;
//import java.sql.Clob;
//import java.sql.Date;
//import java.util.LinkedHashSet;
//import java.util.Set;
//
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.JoinTable;
//import javax.persistence.ManyToMany;
//import javax.persistence.OneToOne;
//import javax.persistence.Table;
//
//@Entity
//@Table(name = "Member")
//public class MemberBean implements Serializable{
//	private static final long serialVersionUID = 1L;
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	private Integer member_id;
//	private String name;
//	private String account;
//	private String password;
//	private String sex;
//	private Date birthday;
//	private String phone;
//	private String email;
//	private String address;
//	private String member_type;  //權限
//	private Date register_time;
//	private Blob image;
//	private String code;  //驗證碼
//	private Integer status;  //驗證狀態
//	private Clob memo;
//	
//	
//	
//	@OneToOne
//	@JoinColumn(name = "FK_shop_id")
//	private ShopBean shopBean;
//	
//	
//	public MemberBean() {
//		
//	}
//	
//	
//	
//	public MemberBean(Integer member_id, String name, String account, String password, String sex, Date birthday,
//			String phone, String email, String address, String member_type, Date register_time, Blob image, String code,
//			Integer status, Clob memo, ShopBean shopBean) {
//		super();
//		this.member_id = member_id;
//		this.name = name;
//		this.account = account;
//		this.password = password;
//		this.sex = sex;
//		this.birthday = birthday;
//		this.phone = phone;
//		this.email = email;
//		this.address = address;
//		this.member_type = member_type;
//		this.register_time = register_time;
//		this.image = image;
//		this.code = code;
//		this.status = status;
//		this.memo = memo;
//		this.shopBean = shopBean;
//	}
//	public ShopBean getShopBean() {
//		return shopBean;
//	}
//	public void setShopBean(ShopBean shopBean) {
//		this.shopBean = shopBean;
//	}
//	public String getName() {
//		return name;
//	}
//	public void setName(String name) {
//		this.name = name;
//	}
//	public String getAccount() {
//		return account;
//	}
//	public void setAccount(String account) {
//		this.account = account;
//	}
//	public String getPassword() {
//		return password;
//	}
//	public void setPassword(String password) {
//		this.password = password;
//	}
//	public String getSex() {
//		return sex;
//	}
//	public void setSex(String sex) {
//		this.sex = sex;
//	}
//	public Date getBirthday() {
//		return birthday;
//	}
//	public void setBirthday(Date birthday) {
//		this.birthday = birthday;
//	}
//	public String getPhone() {
//		return phone;
//	}
//	public void setPhone(String phone) {
//		this.phone = phone;
//	}
//	public String getEmail() {
//		return email;
//	}
//	public void setEmail(String email) {
//		this.email = email;
//	}
//	public String getAddress() {
//		return address;
//	}
//	public void setAddress(String address) {
//		this.address = address;
//	}
//	
//	public Integer getMember_id() {
//		return member_id;
//	}
//	public void setMember_id(Integer member_id) {
//		this.member_id = member_id;
//	}
//	public String getMember_type() {
//		return member_type;
//	}
//	public void setMember_type(String member_type) {
//		this.member_type = member_type;
//	}
//	public Date getRegister_time() {
//		return register_time;
//	}
//	public void setRegister_time(Date register_time) {
//		this.register_time = register_time;
//	}
//	public Blob getImage() {
//		return image;
//	}
//	public void setImage(Blob image) {
//		this.image = image;
//	}
//	public String getCode() {
//		return code;
//	}
//	public void setCode(String code) {
//		this.code = code;
//	}
//	public Integer getStatus() {
//		return status;
//	}
//	public void setStatus(Integer status) {
//		this.status = status;
//	}
//	public Clob getMemo() {
//		return memo;
//	}
//	public void setMemo(Clob memo) {
//		this.memo = memo;
//	}	
//}
