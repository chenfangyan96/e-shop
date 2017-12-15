package com.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.entity.Address;
import com.entity.User;
import com.service.UserService;

@Controller
public class UserAction {
	@Autowired
	private UserService userService;

	//注册用户
	@RequestMapping("/register")
	public String register(HttpServletRequest request, User user, @RequestParam MultipartFile imagefile, Model model)
			throws IOException, GeneralSecurityException, MessagingException {
		// 获得图片上传的路径
		String realPath = request.getServletContext().getRealPath("/images");
		//将用户添加导数据库
		boolean result = userService.register(user, imagefile, realPath);
		if (result == true) {
			model.addAttribute("msg", "恭喜注册成功!");
			return "success";
		}
		model.addAttribute("msg", "注册失败，请检查网络连接!");
		return "erreo";

	}

	//更新用户信息
		@RequestMapping("/updateInfo")
		public String updateInfo(HttpServletRequest request, User user, @RequestParam MultipartFile imagefile, Model model) throws IOException {
			// 获得图片上传的路径
			String realPath = request.getServletContext().getRealPath("/images");
			//更新用户信息
			boolean result = userService.updateInfo(user, imagefile, realPath);
			if (result == true) {
				return "redirect:getUser.action";
			}
			model.addAttribute("msg", "更新用户信息失败");
			model.addAttribute("url", "getUser.action");
			return "erreo2";
		}
	//点击邮件中的激活链接激活账号
	@RequestMapping("/activate")
	public String activate(HttpServletRequest request, HttpServletResponse response)
			throws IOException, GeneralSecurityException, MessagingException {
		String email = request.getParameter("email");// 获取email
		String validateCode = request.getParameter("validateCode");// 激活码
		// 调用激活方法
		boolean result = userService.processActivate(email, validateCode);
		if (result == true) {
			request.setAttribute("msg", "您已经成功激活!");
			return "success";
		}
		request.setAttribute("msg", "激活失败，请重试！");
		return "erreo";

	}

	//ajax验证用户名是否可用
	@RequestMapping("/ajaxValidate")
	@ResponseBody
	public void ajaxValidate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = request.getParameter("username");
		response.setCharacterEncoding("utf-8");
		//根据用户名获得验结果
		String result = userService.ajaxValidate(username);
		response.getWriter().write(result);
		response.getWriter().flush();
	}

	//登录用户
	@RequestMapping("/login")
	public String login(@RequestParam String username, @RequestParam String password, Model model,
			HttpServletRequest request) {
		//判断用户名密码返回结果
		String result = userService.login(username, password);
		//根据用户名获得用户
		User user = userService.getUserByUserName(username);
		HttpSession session = request.getSession();
		String msg1 = "用户名不存在";
		String msg2 = "该账号未激活";
		String msg3 = "密码不正确";
		String msg4 = "该账号被拉黑";
		System.out.println(result);
		if (result.equals(msg1)) {
			model.addAttribute("erreo1", msg1);
			return "login";
		} else if (result.equals(msg2)) {
			model.addAttribute("erreo1", msg2);
			return "login";
		} else if (result.equals(msg3)) {
			model.addAttribute("erreo2", msg3);
			return "login";
		}else if (result.equals(msg4)) {
			model.addAttribute("erreo1", msg4);
			return "login";
		} else {
			if (result.equals("用户")) {
				session.setAttribute("U", user);
				return "redirect:getFoods.action?typeid=0&columnpage=6";
			} else {
				session.setAttribute("admin", user);
				return "admin/index";
			}
		}

	}

	//注销用户
	@RequestMapping("/loginOut")
	public String loginOut(HttpServletRequest request) {
		userService.loginOut(request);
		return "index";

	}

	@RequestMapping("/loginOut2")
	public String loginOut2(HttpServletRequest request) {
		userService.loginOut2(request);
		return "admin/index";

	}
	//获得该用户所有收货地址
	@RequestMapping("/getAddresses")
	public String getAddresses(HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("U");
		//根据用户获得
		List<Address>addresses = userService.getAddresses(user);
		model.addAttribute("addresses", addresses);
		return "user/myAddresses";
		
	}
	
	//添加信息收货地址
	@RequestMapping("/addAddress")
	public String addAddress(HttpServletRequest request,Address address,Model model) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("U");
		//添加地址
		boolean result = userService.addAddress(user,address);
		if(result==true) {
			return "redirect:getAddresses.action";
		}
		model.addAttribute("msg", "添加失败，请重新添加");
		model.addAttribute("url", "user/addAddress.jsp");
		return "erreo2";
	
	}

	//设置当前收货地址
	@RequestMapping("/setCurrentAddress")
	public String setCurrentAddress(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		String id = (String) request.getParameter("id");
		User user = (User) session.getAttribute("U");
		int addressid = Integer.parseInt(id);
		User u = userService.setCurrentAddress(user,addressid);
		//更新session中的用户
		session.setAttribute("U", u);
		return "redirect:getAddresses.action";
	
	}

	//获得单个地址
	@RequestMapping("/getAddress")
	public String showAddress(HttpServletRequest request,Model model) {
		String id = (String) request.getParameter("id");
		int addressid = Integer.parseInt(id);
		Address address = userService.getAddress(addressid);
		model.addAttribute("address", address);
		return "user/showAddress";
	
	}

	//更新地址信息
	@RequestMapping("/updateAddress")
	public String updateAddress(Address address,Model model) {
		boolean result = userService.updateAddress(address);
		if(result==false) {
			model.addAttribute("msg", "更新失败，请返回重新更新");
			model.addAttribute("url", "getAddress.action?id="+address.getId());
			return "erreo2";
		}
		return "redirect:getAddresses.action";
	
	}
	
	//删除该地址
	@RequestMapping("/deleteAddress")
	public String deleteAddress(HttpServletRequest request,Model model) {
		String id = (String) request.getParameter("id");
		int addressid = Integer.parseInt(id);
		String uid = (String) request.getParameter("uid");
		int userid = Integer.parseInt(uid);
		boolean result = userService.deleteAddress(addressid,userid);
		if(result==true) {
			return "redirect:getAddresses.action";
		}
		model.addAttribute("msg", "删除失败，请返回");
		model.addAttribute("url", "getAddresses.action");
		return "erreo2";
	
	}
	
	//获得最新的用户信息
	@RequestMapping("/getUser")
	public String showUser(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("U");
		User u  = userService.getUser(user);
		session.setAttribute("U", u);
		return "user/account";
	
	}
	
	//编辑超链接的实现
	@RequestMapping("/editInfo")
	public String editInfo(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		model.addAttribute("edit", 1);
		return "user/account";
	
	}
		
	//后台显示所有用户
	@RequestMapping("/showUser")
	public String showUser(Model model) {
		List<User>userList = userService.getAllUser();
		model.addAttribute("userList", userList);
		return "admin/showUser";

	}
}
