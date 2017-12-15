package com.service;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.Page;
import com.dao.FoodDao;
import com.dao.OrderDao;
import com.dao.UserDao;
import com.entity.Address;
import com.entity.CartBean;
import com.entity.Food;
import com.entity.Order;
import com.entity.OrderDetail;
import com.entity.User;

@Service
@Transactional
public class OrderService {
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private FoodDao foodDao;

	public Order commitOrder(CartBean cart, User user,Address address) {
		//把订单和订单详情插入数据库
		Order order = new Order();
		order.setState("nopay");
		order.setTime(new Date());	
		order.setTelephone(address.getTelephone());
		order.setName(address.getName());
		order.setArea(address.getArea());
		order.setStreet(address.getStreet());
		order.setFulladdress(address.getFulladdress());
		Set<OrderDetail>oo = new HashSet<OrderDetail>();
		double total = 0.00;
		for(int i =0;i<cart.size();i++) {
			OrderDetail orderdetail = new OrderDetail();
			orderdetail.setOrder(order);
			orderdetail.setFood(cart.get(i).getFood());
			orderdetail.setCount(cart.get(i).getFoodCount());
			orderdetail.setText(cart.get(i).getText());
			orderdetail.setSum();
			total+=orderdetail.getSum();
			oo.add(orderdetail);
		}		
		order.setOrderdetails(oo);
		order.setTotal(total);
		//插入订单和订单详情级联保存相关信息
		boolean result = orderDao.insert(user,oo,order);	
		//清空购物车
		boolean result2 = foodDao.emptyCart(cart);			
		if(result ==true && result2 == true) {
			return order;
		}
		return null;
	}

	//根据订单id获得订单详情
	public List<OrderDetail> getOrderDetails(int id) {
		List<OrderDetail>detailLsit = orderDao.getOrderDetails(id);
		System.out.println("订单详情"+detailLsit);
		return detailLsit;
	}

	//根据用户获得所有订单
	public List<Order> getOrders(User u) {
		List<Order>orders= orderDao.getOrders(u);
		System.out.println("所有订单"+orders);
		return orders;
	}

	//根据id获得订单
	public Order getOrder(int id) {
		Order order = orderDao.getOrder(id);
		return order;
	}

	//根据用户获得当前地址
	public Address getCurrentAddress(User user) {
		Address address = orderDao.getCurrentAddress(user);
		System.out.println("当前地址"+address);
		return address;
	}

	//根据订单状态和当前页获得一个page
	public Page getPage(String current_page, String state) {
		Page page = new Page();
		int count = 0;
		if(state.equals("all")) {
			count = orderDao.getAllCount();
		}else {
			count = orderDao.getCount(state);
		}			
		System.out.println("记录条数"+count);
		page.setColumn_count(count);
		page.setColumn_page(3);
		if (current_page != null) {
			page.setCurrent_page(Integer.parseInt(current_page));
		}
		System.out.println("当前页" + page.getCurrent_page());
		return page;
	}

	//根据page和state获取部分订单
	public List<Order> getOrderByStates(String state, Page page) {
		List<Order> subList = new ArrayList<Order>();
		if (state.equals("all")) {
			System.out.println("1111111");
			subList = orderDao.getSomeOrder(page);
		} else {
			System.out.println("222222");
			subList = orderDao.getSomeFoodByState(page, state);
		}
		System.out.println(subList);
		return subList;
	}

	//根据获取得订单状态更新订单状态
	public boolean updateOrderState(String oid,String state,String action) {
		int id = Integer.parseInt(oid);
		String os;
		if("cancel".equals(action)) {
			if("nopay".equals(state)) {
				os="fail";
				return orderDao.updateOrderState(id,os);
			}else{
				os="norepay";
				return orderDao.updateOrderState(id,os);
			}
		}else {
			if("nopay".equals(state)) {
				os="pay";
				return orderDao.updateOrderState(id,os);
			}else if("pay".equals(state)) {
				os="sending";
				return orderDao.updateOrderState(id,os);
			}else if("sending".equals(state)) {
				os="senddone";
				return orderDao.updateOrderState(id,os);
			}else if("senddone".equals(state)) {
				os="done";
				return orderDao.updateOrderState(id,os);
			}else if("norepay".equals(state)) {
				os="fail";
				return orderDao.updateOrderState(id,os);
			}else {
				return false;
			}
		}
		
	}
}
