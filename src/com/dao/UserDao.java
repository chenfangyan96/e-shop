package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.Address;
import com.entity.Food;
import com.entity.User;

@Repository
public class UserDao {
	@Autowired
	private SessionFactory sessionFactory;

	public boolean insert(User user) {
		boolean result = false;
		Session session = sessionFactory.getCurrentSession();
		session.save(user);
		User u = session.get(User.class, user.getId());
		if (u != null) {
			result = true;
		}
		session.clear();
		return result;
	}

	//获得数据库所有用户的用户名
	public List<String> getAllUsername() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select u.username from User u";
		Query query = session.createQuery(hql);
		List<String> userList = query.list();
		return userList;

	}

	// 根据email获取user
	public User getUserByEmail(String email) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select u from User u where u.email=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, email);
		User user = (User) query.uniqueResult();
		return user;
	}

	// 更新账户的状态信息
	public boolean updateUserState(User user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		try {
			User u = session.get(User.class, user.getId());
			u.setStatus(1);
			session.flush();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	
	// 根据用户名获取用户
	public User getUserByUsername(String username) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select u from User u where u.username=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, username);
		User user = (User) query.uniqueResult();
		return user;
	}

	// 查询用户的所有收货地址
	public List<Address> getAddresses(User user) {
		String hql = " from Address a where a.user.id=?";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter(0, new Integer(user.getId()));
		List<Address> addresses = query.list();
		if(addresses.isEmpty()) {
			return null;
		}
		return addresses;
	}

	// 为用户新增收货地址
	public boolean addAddress(User user, Address address) {
		Session session = sessionFactory.getCurrentSession();
		try {
			User u = session.get(User.class, user.getId());
			u.getAddresses().add(address);
			address.setUser(u);
			session.save(address);
			session.flush();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	//更新用户设置当前地址，返回更新后的用户
	public User setCurrentAddress(User user, int addressid) {
		Session session = sessionFactory.getCurrentSession();
		User u = new User();
		try {
			u = session.get(User.class, user.getId());
			Address address = session.get(Address.class, addressid);
			u.setAddress(address);
			session.flush();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}

	//根据地址id获取地址
	public Address getAddress(int id) {
		Session session = sessionFactory.getCurrentSession();
		Address address=session.get(Address.class, id);
		return address;
	}

	//更新地址（只更新页面修改的信息）
	public boolean updateAddress(Address address) {
		Session session = sessionFactory.getCurrentSession();		
		try {
			Address a = session.get(Address.class, address.getId());
			a.setName(address.getName());
			a.setTelephone(address.getTelephone());
			a.setArea(address.getArea());
			a.setStreet(address.getStreet());
			a.setFulladdress(address.getFulladdress());
			session.flush();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	//若改地址为当前地址设置当前地址为空，从user中的地址集合中移除该地址
	public boolean deleteAddress(int addressid, int userid) {
		Session session = sessionFactory.getCurrentSession();	
		User user = new User();
		try {
			Address address=  session.get(Address.class, addressid);
			user = session.get(User.class, userid);
			if(user.getAddress()==address) {
				user.setAddress(null);
			}
			address.setUser(null);
			user.getAddresses().remove(address);
			session.delete(address);
			session.flush();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	//根据session中user的id获取user，再获取user中的address属性
	public Address getCurrentAddress(User user) {
		Session session = sessionFactory.getCurrentSession();
		Address address = new Address();
		try {
			User u = session.get(User.class, user.getId());
			address = u.getAddress();	
			session.flush();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return address;
	}

	//根据用户id获得用户
	public User getUserById(int id) {
		Session session = sessionFactory.getCurrentSession();
		User user = session.get(User.class, id);
		return user;
	}

	//更新用户信息
	public boolean updateUser(User user) {
		Session session = sessionFactory.getCurrentSession();
		User u = session.get(User.class, user.getId());
		u.setEmail(user.getEmail());
		u.setImgurl(user.getImgurl());
		return true;
	}

	//获取所有用户
	public List<User> getAllUser() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from User u where u.role=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, "用户");
		List<User>userList=query.list();
		return userList;
	}

	
}
