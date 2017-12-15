package com.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.common.SendEmail;
import com.dao.UserDao;
import com.entity.Address;
import com.entity.User;

@Service
@Transactional
public class UserService {
	@Autowired
	private UserDao userDao;

	// 上传图片获取图片地址，保存用户的信息并且发送激活邮件
	public boolean register(User user, MultipartFile imagefile, String realPath)
			throws IOException, GeneralSecurityException, MessagingException {
		// 保存图片
		if (!"".equals(imagefile.getOriginalFilename())) {
			String originalFilename = imagefile.getOriginalFilename();
			user.setImgurl("images" + "\\" + originalFilename);
			byte[] bytes = imagefile.getBytes();
			File file = new File(realPath + "\\" + originalFilename);
			FileOutputStream fo = new FileOutputStream(file);
			fo.write(bytes);
			fo.flush();
			fo.close();
		}
		// 设置用户的其他信息
		user.setTime(new Date());
		user.setRole("用户");
		//设置激活码
		int a = (int) ((Math.random() * 9 + 1) * 100000);
		String s = String.valueOf(a);
		user.setActivationcode(s);
		//设置用户状态
		user.setStatus(0);
		// 保存用户
		System.out.println("注册保存用户！");
		boolean result1 = userDao.insert(user);
		//保存完成后发送邮件
		if (result1 == true) {
			// 邮件的内容
			StringBuffer sb = new StringBuffer("点击下面链接激活账号，尽快激活！</br>");
			sb.append("<a href=\"http://localhost:8080/e-shop/activate.action?email=");
			sb.append(user.getEmail());
			sb.append("&validateCode=");
			sb.append(user.getActivationcode());
			sb.append("\">http://localhost:8080/e-shop/activate.action/email=");
			sb.append(user.getEmail());
			sb.append("&validateCode=");
			sb.append(user.getActivationcode());
			sb.append("</a>");
			// 发送邮件
			System.out.println("发送邮件");
			return SendEmail.send(user.getEmail(), sb.toString());
		} else {			 
			return false;
		}
	}

	//修改用户信息
	public boolean updateInfo(User user, MultipartFile imagefile, String realPath) throws IOException {
		// 保存图片
		if (!"".equals(imagefile.getOriginalFilename())) {
			String originalFilename = imagefile.getOriginalFilename();
			user.setImgurl("images" + "\\" + originalFilename);
			byte[] bytes = imagefile.getBytes();
			File file = new File(realPath + "\\" + originalFilename);
			FileOutputStream fo = new FileOutputStream(file);
			fo.write(bytes);
			fo.flush();
			fo.close();
		}
		System.out.println(user.getEmail()+"email");
		boolean result = userDao.updateUser(user);
		return result;
	}
	// ajax验证用户名是否存在,返回响应字符串信息
	public String ajaxValidate(String userName) {
		// TODO Auto-generated method stub
		if (!"".equals(userName)) {
			List<String> userList = userDao.getAllUsername();
			if (userList.contains(userName)) {
				System.out.println(1);
				return "<font color='red'>用户名已存在</font>";
			} else {
				// String regEx = "/^[a-zA-Z_0-9]{3,10}$/"; // 编写正则表达式的规则
				// Pattern pat = Pattern.compile(regEx);
				// Matcher mat = pat.matcher(userName);
				// boolean rs = mat.find();
				// if (rs) {
				// return "<font color='green'>用户名可用</font>";
				// } else {
				// return "<font color='red'>用户名不符合规范</font>";
				// }
				System.out.println(2);
				return "";
			}
		} else {
			System.out.println(3);
			return "<font color='red'>用户名为空</font>";
		}
	}

	// 激活账号，更改用户的状态信息
	public boolean processActivate(String email, String validateCode) {
		// 数据访问层，通过email获取用户信息
		User user = userDao.getUserByEmail(email);
		//验证激活码是否正确
		if (user.getActivationcode().equals(validateCode)) {
			return userDao.updateUserState(user);
		}
		return false;

	}

	// 验证用户名密码，返回信息
	public String login(String username, String password) {
		//根据用户名获得用户
		User user = userDao.getUserByUsername(username);
		if (user != null) {
			if (user.getStatus() == 1) {
				if (user.getPassword().equals(password)) {
					return user.getRole();
				} else {
					return "密码不正确";
				}
			} else {
				if(user.getStatus() ==0) {
					return "该账号未激活";
				}
				return"该账号被拉黑";
			}
		} else {
			return "用户名不存在";
		}
	}

	//根据用户名获得用户
	public User getUserByUserName(String username) {
		return userDao.getUserByUsername(username);
	}

	// 注销用户
	public void loginOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		session.invalidate();
		System.out.println("注销用户");
	}

	public void loginOut2(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("admin");
		session.invalidate();
		System.out.println("注销管理员");
	}
	//根据用户获得用户所有收货地址
	public List<Address> getAddresses(User user) {
		// TODO Auto-generated method stub
		List<Address>addresses = userDao.getAddresses(user);
		System.out.println(addresses);
		return addresses;
	}

	//给用户添加新的收货地址
	public boolean addAddress(User user, Address address) {
		boolean result = userDao.addAddress(user,address);
		return result;
	}

	//根据用户和地址id设置当前收货地址
	public User setCurrentAddress(User user, int addressid) {
		// TODO Auto-generated method stub
		User u = userDao.setCurrentAddress(user,addressid);
		System.out.println("当前地址收货人"+u.getAddress().getName());
		return u;
	}

	//根据id获得地址
	public Address getAddress(int id) {
		Address address = userDao.getAddress(id);
		return address;
	}

	//更新地址
	public boolean updateAddress(Address address) {
		boolean result = userDao.updateAddress(address);
		return result;
	}

	//根据用户id和地址id删除地址
	public boolean deleteAddress(int addressid, int userid) {
		boolean  result = userDao.deleteAddress(addressid,userid);
		return result;
	}

	//根据用户获得当前收货地址
	public Address getCurrentAddress(User user) {
		Address address = userDao.getCurrentAddress(user);
		return address;
	}

	//根据用户查询获得用户
	public User getUser(User user) {
		User u = userDao.getUserById(user.getId());	
		return u;
	}

	public List<User> getAllUser() {
		List<User>userList = userDao.getAllUser();
		return userList;
	}

	
}
