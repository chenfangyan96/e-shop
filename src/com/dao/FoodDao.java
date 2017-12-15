package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.common.Page;
import com.entity.CartBean;
import com.entity.Food;
import com.entity.Food_Cart;
import com.entity.Type;
import com.entity.User;

@Repository
public class FoodDao {
	@Autowired
	private SessionFactory sessionFactory;

	
    //分页获取部分商品
	public List<Food> getSomeFood(Page page) {
		// TODO Auto-generated method stub
		String hql = " from Food";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		int begin = 0;
		if (page.getPage_count() == 0 || page.getPage_count() == 1) {
			begin = 0;
		} else if (page.getCurrent_page() == page.getPage_count()) {
			begin = (page.getPage_count() - 1) * page.getColumn_page();
		} else {
			begin = (page.getCurrent_page() - 1) * page.getColumn_page();
		}
		query.setFirstResult(begin);
		if(page.getColumn_page()==0) {
			query.setMaxResults(0);
		}
		query.setMaxResults(page.getColumn_page());
		List<Food> subList = query.list();
		return subList;
	}

	//获取所有商品的记录总和
	public int getAllCount() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(id) from Food";
		Query query = session.createQuery(hql);
		Long o = (Long) query.uniqueResult();
		int count = o.intValue();
		return count;
	}

	//根据商品类型分页获取部分商品
	public List<Food> getSomeFoodById(Page page,int typeid) {
		String hql = " from Food f where f.type.id=?";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter(0, new Integer(typeid));
		int begin = 0;
		if (page.getPage_count() == 0 || page.getPage_count() == 1) {
			begin = 0;
		} else if (page.getCurrent_page() == page.getPage_count()) {
			begin = (page.getPage_count() - 1) * page.getColumn_page();
		} else {
			begin = (page.getCurrent_page() - 1) * page.getColumn_page();
		}
		query.setFirstResult(begin);
		query.setMaxResults(page.getColumn_page());
		List<Food> subList = query.list();
		return subList;
	}

	//根据id获取商品的总记录条数
	public int getCountById(int typeid) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(f.id) from Food f where f.type.id=?";
		Query query = session.createQuery(hql);
		System.out.println(typeid);
		query.setParameter(0, new Integer(typeid));
		Long o = (Long) query.uniqueResult();
		int count = o.intValue();
		return count;
	}

	//根据id过得商品
	public Food getFoodById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Food food = session.get(Food.class, id);
		return food;
	}

	//根据用户获得购物车没有返回null
	public CartBean getMyCart(User user) {
		Session session = sessionFactory.getCurrentSession();
		User u = session.get(User.class, user.getId());
		CartBean cart = u.getCartbean();
		return cart;
	}

	//为用户创建一个新的购物车并且返回该购物车
	public CartBean creatCart(User user) {
		Session session = sessionFactory.getCurrentSession();
		User u = session.get(User.class, user.getId());
		CartBean c = new CartBean();
		u.setCartbean(c);
		c.setUser(u);
		session.save(c);
		session.flush();
		return c;
	}

	//根据购物车id查询所有 购物车中的信息
	public List<Food_Cart> getFoodCarts(CartBean cartbean) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Food_Cart c where c.cartBean.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, cartbean.getId());
		List<Food_Cart>foodcarts = query.list();
		return foodcarts;
	}

	//根据商品更新购物车中的信息
	public boolean updateFoodCart(CartBean cartbean,Food food, String text, int count) {
		Session session = sessionFactory.getCurrentSession();	
		try {
			String hql = "from Food_Cart c where c.cartBean.id=?and c.food.id=?";
			Query query = session.createQuery(hql);
			query.setParameter(0, cartbean.getId());
			query.setParameter(1, food.getId());
			Food_Cart foodcart = (Food_Cart) query.uniqueResult();
			foodcart.setFoodCount(foodcart.getFoodCount()+count);
			if(foodcart.getText().equals("")) {
				foodcart.setText(text);
			}else if(!text.equals("")){
				foodcart.setText(foodcart.getText()+";"+text);
			}
			foodcart.setSum();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
		return true;
	}

	//添加信息购物车信息
	public Food_Cart  addFoodCart(CartBean cartbean, Food food, String text, int count) {
		Session session = sessionFactory.getCurrentSession();
		Food_Cart foodcart = new Food_Cart();
		try {
			foodcart.setFood(food);
			foodcart.setText(text);
			foodcart.setSum();
			foodcart.setCartBean(cartbean);
			foodcart.setFoodCount(count);
			session.save(foodcart);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return foodcart;
	}

	//根据购物车id删除购物车商品
	public boolean emptyCart(CartBean cart) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "delete from Food_Cart f where f.cartBean.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, cart.getId());
		int i = query.executeUpdate();
		if(i==0) {
			return false;
		}
		return true;
	}

	//根据商品id删除购物车信息
	public boolean deleteFoodCart(int foodid) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "delete from Food_Cart f where f.food.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, foodid);
		int i = query.executeUpdate();
		System.out.println(i);
		if(i==0) {
			return false;
		}
		return true;
	}

	//更新购物车中商品数量
	public boolean updateFoodCount(int count, int foodid) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Food_Cart f where f.food.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, foodid);
		Food_Cart foodcart = (Food_Cart) query.uniqueResult();
		foodcart.setFoodCount(count);
		foodcart.setSum();
		return true;
	}

	//根据商品id获得购物车中商品的数量
	public int getFoodCount(int foodid) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Food_Cart f where f.food.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, foodid);
		Food_Cart foodcart = (Food_Cart) query.uniqueResult();
		int count = foodcart.getFoodCount();
		return count;
	}

	//获取所有的商品类型
	public List<Type> getAllType() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Type";
		Query query = session.createQuery(hql);
		List<Type>typeList = query.list();		
		return typeList;
	}

	//根据类型id获取类型
	public Type getTypeById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Type type = session.get(Type.class, id);
		return type;
	}

	//向数据库中插入商品数据
	public boolean insert(Food food,Type type) {
		boolean result = false;
		Session session = sessionFactory.getCurrentSession();
		food.setType(type);
		session.save(food);
		Food u = session.get(Food.class, food.getId());
		System.out.println(u.getDetail());
		if (u != null) {
			result = true;
		}
		return result;
	}

	//根据商品类型名获得商品类型
	public Type getTypeByName(String typename) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Type t where t.name=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, typename);
		Type type = (Type) query.uniqueResult();
		return type;
	}

	//根据id删除商品
	public boolean deleteFood(int id) {
		Session session = sessionFactory.getCurrentSession();		
		Food food = session.get(Food.class, id);
		session.delete(food);
		return true;
	}

	//根据id数组删除商品
	public boolean deleteFoods(int[] ids) {
		Session session = sessionFactory.getCurrentSession();	
		for(int a: ids) {
			Food food = session.get(Food.class, a);
			session.delete(food);
		}
		
		return true;
	}

	//根据用户查询购物车中商品数量
	public int getCartFoodCount(CartBean cartBean) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(f.id) from Food_Cart f where f.cartBean.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, new Integer(cartBean.getId()));
		Long o = (Long) query.uniqueResult();
		int count = o.intValue();
		return count;
	}
	
	//分页获得购物车部分记录
	public List<Food_Cart> getFoodCartsByPage(CartBean cartbean,Page page) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Food_Cart c where c.cartBean.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, cartbean.getId());
		int begin = 0;
		if (page.getPage_count() == 0 || page.getPage_count() == 1) {
			begin = 0;
		} else if (page.getCurrent_page() == page.getPage_count()) {
			begin = (page.getPage_count() - 1) * page.getColumn_page();
		} else {
			begin = (page.getCurrent_page() - 1) * page.getColumn_page();
		}
		query.setFirstResult(begin);
		query.setMaxResults(page.getColumn_page());
		List<Food_Cart>foodcarts = query.list();
		return foodcarts;
	}
	
}
