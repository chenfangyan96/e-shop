package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.common.Page;
import com.entity.Address;
import com.entity.CartBean;
import com.entity.Order;
import com.entity.OrderDetail;
import com.entity.User;
import com.service.FoodService;
import com.service.OrderService;
import com.service.UserService;

@Controller
public class OrderAction {
	@Autowired
	private OrderService orderService;
	@Autowired
	private FoodService foodService;
	@Autowired
	private UserService userService;
		
	//检测地址
	@RequestMapping("/checkAddress")
	public String checkAddress(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("U");
		//根据user获得当前收货地址
		Address address = userService.getCurrentAddress(user);
		if(address==null) {
			model.addAttribute("msg", "您的当前地址没有设定，请前去设定");
			model.addAttribute("url", "getAddresses.action");
			return "erreo2";
		}else {
			model.addAttribute("address", address);
			return "user/sureAddress";
		}
	}
	
	//生成订单
	@RequestMapping("/commitOrder")
	public String commitOrder(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("U");
		//获得当前购物车
		CartBean cartbean = foodService.getMyCart(user);
		//获取购物车商品信息
		CartBean cart = foodService.addFoodCart(cartbean);
		//根据user获得当前收货地址
		Address address = userService.getCurrentAddress(user);
		if(cart.isEmpty()||cart == null) {
			model.addAttribute("msg", "购物车为空，请返回");
			model.addAttribute("url", "user/myCart.jsp");
			return "erreo2";
		}
		//提交订单并且清空购物车
		Order order = orderService.commitOrder(cart,user,address);
		if(order!=null) {
			model.addAttribute("order", order);	
			List<OrderDetail>detailLsit = orderService.getOrderDetails(order.getId());						
			model.addAttribute("detailLsit", detailLsit);
			return "user/showOrder";
		}		
		model.addAttribute("msg", "订单生成失败，请重新生成");
		model.addAttribute("url", "user/myCart.jsp");
		return "erreo2";
		
	}
	
	//根据用户获得所有订单
	@RequestMapping("/getOrders")
	public String getOrders(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		User u =(User) session.getAttribute("U");		
		List<Order>orders= orderService.getOrders(u);
		model.addAttribute("orders", orders);		
		return "user/myOrders";
		
	}
	
	//（根据订单id获得该订单所有订单详情）查询订单
	@RequestMapping("/getOrderDetail")
	public String getOrderDetail(HttpServletRequest request,Model model) {
		String id = request.getParameter("id");
		String action = request.getParameter("action");
		Order order  = orderService.getOrder(Integer.parseInt(id));
//		List<OrderDetail>detailLsit = orderService.getOrderDetails(Integer.parseInt(id));
		model.addAttribute("order", order);
//		model.addAttribute("detailLsit", detailLsit);
		if("back".equals(action)) {
			return "admin/showOrderDetail";
		}
		return "user/showOrder";
		
	}
	
	//根据订单状态分页获取订单
	@RequestMapping("/showOrders")
	public String showOrders(HttpServletRequest request,Model model) {
		String state = request.getParameter("action");
		String current_page = request.getParameter("current_page");	
		Page page = orderService.getPage(current_page,state);
		List<Order>orders = orderService.getOrderByStates(state,page);
		model.addAttribute("page", page);
		model.addAttribute("orders", orders);
		model.addAttribute("action", state);
		return "admin/showOrders";
		
	}
		
	//修改订单的状态信息
		@RequestMapping("/updateOrderState")
		public String updateOrderState(HttpServletRequest request,Model model) {
			String oid = request.getParameter("id");
			String state = request.getParameter("state");
			String action = request.getParameter("action");
			System.out.println("订单号"+oid);
			System.out.println("订单状态"+state);
			System.out.println("操作"+action);
			boolean result = orderService.updateOrderState(oid,state,action);
			if(result == true) {
				Order order = orderService.getOrder(Integer.parseInt(oid));
				model.addAttribute("order", order);
				return "redirect:getOrderDetail.action?id="+oid;
			}
			model.addAttribute("msg", "操作失败，请重新尝试");
			model.addAttribute("url", "getOrderDetail.action?id="+oid);
			return "erreo2";
			
		}
}
