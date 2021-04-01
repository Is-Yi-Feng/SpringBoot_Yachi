package com.example.demo._20_shoppingMall._23_orderProcess.service.impl;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo._02_model.entity.CartBean;
import com.example.demo._02_model.entity.OrderBean;
import com.example.demo._02_model.entity.OrderItemBean;
import com.example.demo._02_model.entity.OrderStatusBean;
import com.example.demo._02_model.entity.PayTypeBean;
import com.example.demo._02_model.entity.ShipTypeBean;
import com.example.demo._20_shoppingMall._22_shoppingCart.dao.CartBeanDao;
import com.example.demo._20_shoppingMall._23_orderProcess.dao.OrderDao;
import com.example.demo._20_shoppingMall._23_orderProcess.dao.OrderItemDao;
import com.example.demo._20_shoppingMall._23_orderProcess.dao.OrderNumberDao;
import com.example.demo._20_shoppingMall._23_orderProcess.dao.OrderStatusDao;
import com.example.demo._20_shoppingMall._23_orderProcess.dao.PayTypeDao;
import com.example.demo._20_shoppingMall._23_orderProcess.dao.ShipTypeDao;
import com.example.demo._20_shoppingMall._23_orderProcess.service.OrderService;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {
	final Integer cancelStatus = 5;  //取消狀態碼
	final Integer unPayStatus = 1; //未付款狀態碼
	final Integer returnedStatus = 6; //退貨狀態碼
	
	@Autowired 
	OrderDao orderDao;
	@Autowired
	OrderNumberDao orderNumberDao;
	@Autowired
	OrderStatusDao orderStatusDao;
	@Autowired
	ShipTypeDao shipTypeDao;
	@Autowired
	PayTypeDao payTypeDao;
	@Autowired
	CartBeanDao cartBeanDao;
	@Autowired
	OrderItemDao orderItemDao;
	
	@Override
	public OrderBean createOrder(OrderBean orderBean) {
		
// 	 1. 新增訂單紀錄
		//狀態默認未付款
		OrderStatusBean OrderStatusBean = orderStatusDao.getStatusById(1);
		ShipTypeBean shipTypeBean = shipTypeDao.getShipTypeById(orderBean.getShipTypeBean().getShip_type_id());
		PayTypeBean payTypeBean = payTypeDao.getPayTypeById(orderBean.getPayTypeBean().getPay_type_id());
		
		//set OrderBean 外鍵欄位
		orderBean.setShipTypeBean(shipTypeBean);
		orderBean.setPayTypeBean(payTypeBean);
		orderBean.setOrderStatusBean(OrderStatusBean);
		
		//設定 訂單時間 與 配送日期
		Date nowDate = new Date();
		orderBean.setOrder_datetime(nowDate);//util.Date(當前訂單時間)
		long newTime = addDate(nowDate, 3); //訂單日期往後推三天
		orderBean.setShipping_date(new java.sql.Date(newTime)); //sql.Date(配送日期)
		
// 	 2. 新增訂單明細紀錄(訂單細項:訂單 = 多 : 1)
		//取出"購物車商品"轉成"訂單明細"
		List<CartBean> carts = cartBeanDao.findCartByMemberId(orderBean.getMemberBean().getMemberId());
		Set<OrderItemBean> orderItems = new HashSet<>();
		for(CartBean cart : carts) {
			OrderItemBean item = new OrderItemBean();
			item.setOrderBean(orderBean); //放入訂單號碼
			item.setProductBean(cart.getProductBean()); //取得商品訊息
			item.setAmount(cart.getCart_amount()); //取得某項商品購買數量
			item.setUnitPrice(cart.getProductBean().getProduct_price());//商品單價
			item.setDiscount(0.8); //設置折扣(尚未計算折扣後金額)
			orderItems.add(item); //添加item物件
		}
		//將訂單明細加入訂單
		orderBean.setItems(orderItems);  
		//檢查訂單的每一筆明細的訂購量是否夠下單
		checkStock(orderBean);
		
		//資料庫新建一筆OrderBean訂單
		orderDao.insertOrder(orderBean); //新建訂單紀錄會一起新建orderItem紀錄
		//依照訂單id 配給訂單一個有序號碼
		String orderNumber = orderDao.getOrderNumber(orderBean.getOrder_id());
//		orderDao.updateOrderNumberById(orderBean.getOrder_id());
//		OrderBean orderBeanN = orderDao.getOrderById(orderBean.getOrder_id());
		orderBean.setOrderNumber(orderNumber);
		System.out.println("訂單編號================>  " + orderBean.getOrderNumber());
		
// 	 3. 清除使用者購物車表格紀錄(也需要清除session的購物車紀錄)
		cartBeanDao.deleteCartByMemberId(orderBean.getMemberBean().getMemberId());
		
		return orderBean;
	}

	
	@Override
	public List<OrderBean> getAllOrdersByMemberId(Integer memberId) {
		List<OrderBean> list= orderDao.getAllOrdersByMemberId(memberId);
		return list;
	}


	@Override
	public OrderBean getOrderById(Integer orderNo) {
		OrderBean orderBean = orderDao.getOrderById(orderNo);
		return orderBean;
	}


	//檢查庫存量是否有超過訂購量
	@Override
	public void checkStock(OrderBean orderBean) {
		Set<OrderItemBean> items = orderBean.getItems();
		for(OrderItemBean item : items) {
			orderItemDao.updateProductStock(item);
		}
	}

	/**
	 * 取消訂單： 此兩步驟需同時成功或失敗，故在同一個交易中
	 * 1. 設定狀態為取消狀態
	 * 2. 加回已取消訂單細項的庫存數量
	 */

	@Override
	public void cancelOrder(OrderBean orderBean) {
		//判斷只有未付款才可以取消訂單
		if(orderBean.getOrderStatusBean().getStatus_id() == unPayStatus) {
			// 1. 設定狀態為取消狀態
			OrderStatusBean orderStatusBean = orderStatusDao.getStatusById(cancelStatus);
			orderBean.setOrderStatusBean(orderStatusBean);
			orderDao.updateOrderStatus(orderBean);
			
			// 2. 加回已取消訂單細項的庫存數量
			checkStock(orderBean);  //目前為取消狀態的orderBean
		}
	}

	
	//依據訂單號搜索訂單
	@Override
	public OrderBean queryOrder(String orderNumber) {
		return orderDao.queryOrder(orderNumber);
	}

	//指定日期加上天數
	public static long addDate(Date date, long day){
		long time = date.getTime(); // 得到指定日期的毫秒數
		day = day * 24 * 60 * 60 * 1000; // 要加上的天數轉換成毫秒數
		time += day; // 相加得到新的毫秒數
		return time; // 最後日期的總毫秒數
	}
	
	



	
}
