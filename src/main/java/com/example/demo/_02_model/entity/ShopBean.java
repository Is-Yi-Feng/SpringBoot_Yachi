package com.example.demo._02_model.entity;
import java.io.Serializable;
import java.sql.Blob;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.example.demo._10_member.entity.Member;


@Entity
@Table(name = "Shop")
public class ShopBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer shop_id;
	
	@OneToOne(mappedBy = "shopBean")
	private Member memberBean;
	
	private String shop_name;
	
	private Blob shop_media;
	
	@Column(length = 65535,columnDefinition = "Text")
	private String shop_info;
	
	private String shop_addr;
	
	private String shop_phone;
	
	private String shop_hours;
	
	private String shop_hyperlink;
	
	private String shop_owner;
	
	
	
	private Double shop_score;
	
	
	private String shop_memo;
	
	private String shop_file_name;
	
	private Blob shop_pic;
	
	@Transient
	private MultipartFile shop_image;
	
	@ManyToOne
	@JoinColumn(name = "FK_shop_type_id")
	private ShopTypeBean shopTypeBean;
	
	@ManyToOne
	@JoinColumn(name = "FK_nightmarket_id")
	private NightMarketBean nightMarketBean;
	
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "shopBean",fetch = FetchType.EAGER)
	private Set<ShopMenuBean> shopMenus = new LinkedHashSet<ShopMenuBean>();
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "shopBean")
	private Set<CouponBean> coupons = new LinkedHashSet<CouponBean>();
	
	@ManyToMany(cascade = CascadeType.ALL, mappedBy = "shops")
	private Set<FavoriteShopListBean> shoplist = new LinkedHashSet<FavoriteShopListBean>();
	
	
	public ShopBean() {
		
	}
	

	public ShopBean(Member memberBean, String shop_name, Blob shop_media, String shop_info, String shop_addr,
			String shop_phone, String shop_hours, String shop_hyperlink,
			Double shop_score, String shop_memo, ShopTypeBean shopTypeBean,
			NightMarketBean nightMarketBean, Set<ShopMenuBean> shopMenus) {
		super();
		this.memberBean = memberBean;
		this.shop_name = shop_name;
		this.shop_media = shop_media;
		this.shop_info = shop_info;
		this.shop_addr = shop_addr;
		this.shop_phone = shop_phone;
		this.shop_hours = shop_hours;
		this.shop_hyperlink = shop_hyperlink;

		this.shop_score = shop_score;  //不設置欄位，應該是平價統計後的結果
		this.shop_memo = shop_memo;
		this.shopTypeBean = shopTypeBean;
		this.nightMarketBean = nightMarketBean;
		this.shopMenus = shopMenus;
	}

	

	public Set<ShopMenuBean> getShopMenus() {
		return shopMenus;
	}

	public void setShopMenus(Set<ShopMenuBean> shopMenus) {
		this.shopMenus = shopMenus;
	}

	public NightMarketBean getNightMarketBean() {
		return nightMarketBean;
	}

	public void setNightMarketBean(NightMarketBean nightMarketBean) {
		this.nightMarketBean = nightMarketBean;
	}

	public ShopTypeBean getShopTypeBean() {
		return shopTypeBean;
	}

	public void setShopTypeBean(ShopTypeBean shopTypeBean) {
		this.shopTypeBean = shopTypeBean;
	}

	

	public Integer getShop_id() {
		return shop_id;
	}

	public void setShop_id(Integer shop_id) {
		this.shop_id = shop_id;
	}

	

	public Member getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(Member memberBean) {
		this.memberBean = memberBean;
	}

	public String getShop_name() {
		return shop_name;
	}

	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}

	public Blob getShop_media() {
		return shop_media;
	}

	public void setShop_media(Blob shop_media) {
		this.shop_media = shop_media;
	}

	public String getShop_info() {
		return shop_info;
	}

	public void setShop_info(String shop_info) {
		this.shop_info = shop_info;
	}

	public String getShop_addr() {
		return shop_addr;
	}

	public void setShop_addr(String shop_addr) {
		this.shop_addr = shop_addr;
	}

	public String getShop_phone() {
		return shop_phone;
	}

	public void setShop_phone(String shop_phone) {
		this.shop_phone = shop_phone;
	}

	public String getShop_hours() {
		return shop_hours;
	}

	public void setShop_hours(String shop_hours) {
		this.shop_hours = shop_hours;
	}

	

	public String getShop_hyperlink() {
		return shop_hyperlink;
	}

	public void setShop_hyperlink(String shop_hyperlink) {
		this.shop_hyperlink = shop_hyperlink;
	}

	

	public Double getShop_score() {
		return shop_score;
	}

	public void setShop_score(Double shop_score) {
		this.shop_score = shop_score;
	}

	

	public String getShop_memo() {
		return shop_memo;
	}

	public void setShop_memo(String shop_memo) {
		this.shop_memo = shop_memo;
	}


	public Set<CouponBean> getCoupons() {
		return coupons;
	}


	public void setCoupons(Set<CouponBean> coupons) {
		this.coupons = coupons;
	}


	public Set<FavoriteShopListBean> getShoplist() {
		return shoplist;
	}


	public void setShoplist(Set<FavoriteShopListBean> shoplist) {
		this.shoplist = shoplist;
	}
	
	


	public String getShop_file_name() {
		return shop_file_name;
	}


	public void setShop_file_name(String shop_file_name) {
		this.shop_file_name = shop_file_name;
	}


	public Blob getShop_pic() {
		return shop_pic;
	}


	public void setShop_pic(Blob shop_pic) {
		this.shop_pic = shop_pic;
	}


	public MultipartFile getShop_image() {
		return shop_image;
	}


	public void setShop_image(MultipartFile shop_image) {
		this.shop_image = shop_image;
	}
	
	


	public String getShop_owner() {
		return shop_owner;
	}


	public void setShop_owner(String shop_owner) {
		this.shop_owner = shop_owner;
	}


	@Override
	public String toString() {
		return "ShopBean [shop_id=" + shop_id + ", memberBean=" + memberBean + ", shop_name=" + shop_name
				+ ", shop_media=" + shop_media + ", shop_info=" + shop_info + ", shop_addr=" + shop_addr
				+ ", shop_phone=" + shop_phone + ", shop_hours=" + shop_hours + ", shop_hyperlink=" + shop_hyperlink
				+ ", shop_score=" + shop_score + ", shop_memo=" + shop_memo + ", shopTypeBean=" + shopTypeBean
				+ ", nightMarketBean=" + nightMarketBean + ", shopMenus=" + shopMenus
				+  "]";
	}
	
	
	

}