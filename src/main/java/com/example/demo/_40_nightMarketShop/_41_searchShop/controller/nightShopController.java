package com.example.demo._40_nightMarketShop._41_searchShop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo._02_model.entity.NightMarketBean;
import com.example.demo._02_model.entity.ShopBean;
import com.example.demo._50_shop._53_shopRegister.service.NightMarketService;
import com.example.demo._50_shop._53_shopRegister.service.ShopService;

@Controller
public class nightShopController {
	
	@Autowired
	ShopService shopService;
	@Autowired
	NightMarketService nightMarketService;
	
	//控制器方法
	@RequestMapping("/nightMarketShop")
	public String nightShop(Model model) {  //有東西要交給view 就放model
//		model.addAttribute("store", "方家雞肉飯"); // 底層是 forward()
		return "_14_nightShop/1_shop"; 
	}

	
	@RequestMapping("/MarketRaohe")		// 饒河夜市
	public String MarketRaohe(Model model) {  //有東西要交給view 就放model
		List<ShopBean> shops = shopService.getShopsByNightMarket(1);
		NightMarketBean nightMarketBean = nightMarketService.getNightMarketById(1);
		model.addAttribute("nightMarketBean", nightMarketBean);
		model.addAttribute("shops", shops);
		return "_13_nightMarket/MarketRaohe"; 
	}
	
	@RequestMapping("/MarketGongguan")		// 公館夜市
	public String MarketGongguan(Model model) {  //有東西要交給view 就放model
		List<ShopBean> shops = shopService.getShopsByNightMarket(7);
		NightMarketBean nightMarketBean = nightMarketService.getNightMarketById(7);
		model.addAttribute("nightMarketBean", nightMarketBean);
		model.addAttribute("shops", shops);
		return "_13_nightMarket/MarketGongguan"; 
	}
	
	@RequestMapping("/MarketHuaxi")		// 華西街夜市
	public String MarketHuaxi(Model model) {  //有東西要交給view 就放model
		List<ShopBean> shops = shopService.getShopsByNightMarket(2);
		NightMarketBean nightMarketBean = nightMarketService.getNightMarketById(2);
		model.addAttribute("nightMarketBean", nightMarketBean);
		model.addAttribute("shops", shops);
		return "_13_nightMarket/MarketHuaxi"; 
	}
	
	@RequestMapping("/MarketLinjiang")		// 臨江街夜市
	public String MarketLinjiang(Model model) {  
		List<ShopBean> shops = shopService.getShopsByNightMarket(5);
		NightMarketBean nightMarketBean = nightMarketService.getNightMarketById(5);
		model.addAttribute("nightMarketBean", nightMarketBean);
		model.addAttribute("shops", shops);
		return "_13_nightMarket/MarketLinjiang"; 
	}
	
//	@RequestMapping("/MarketMonga")		// 艋舺夜市
//	public String MarketMonga(Model model) {  
//		List<ShopBean> shops = shopService.getShopsByNightMarket(1);
//		NightMarketBean nightMarketBean = nightMarketService.getNightMarketById(1);
//		model.addAttribute("shops", shops);
//		return "_13_nightMarket/MarketMonga"; 
//	}
	
	@RequestMapping("/MarketNingxia")		// 寧夏夜市
	public String MarketNingxia(Model model) {  //有東西要交給view 就放model
		List<ShopBean> shops = shopService.getShopsByNightMarket(3);
		NightMarketBean nightMarketBean = nightMarketService.getNightMarketById(3);
		model.addAttribute("shops", shops);
		model.addAttribute("nightMarketBean", nightMarketBean);
		return "_13_nightMarket/MarketNingxia"; 
	}
	
	@RequestMapping("/MarketShilin")		// 士林夜市
	public String MarketShilin(Model model) {  //有東西要交給view 就放model
		List<ShopBean> shops = shopService.getShopsByNightMarket(4);
		NightMarketBean nightMarketBean = nightMarketService.getNightMarketById(4);
		model.addAttribute("nightMarketBean", nightMarketBean);
		model.addAttribute("shops", shops);
		return "_13_nightMarket/MarketShilin"; 
	}
	
	@RequestMapping("/MarketSouth")		// 南機場夜市
	public String MarketSouth(Model model) { 
		List<ShopBean> shops = shopService.getShopsByNightMarket(8);
		NightMarketBean nightMarketBean = nightMarketService.getNightMarketById(8);
		model.addAttribute("nightMarketBean", nightMarketBean);
		model.addAttribute("shops", shops);
		
		return "_13_nightMarket/MarketSouth"; 
	}
	
	@RequestMapping("/MarketYanping")		// 延三夜市
	public String MarketYanping(Model model) {  
		List<ShopBean> shops = shopService.getShopsByNightMarket(6);
		NightMarketBean nightMarketBean = nightMarketService.getNightMarketById(6);
		model.addAttribute("nightMarketBean", nightMarketBean);
		model.addAttribute("shops", shops);
		return "_13_nightMarket/MarketYanping"; 
	}
}
