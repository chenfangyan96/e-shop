package com.entity;

import java.util.ArrayList;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="cartbean")
public class CartBean extends ArrayList<Food_Cart>{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@OneToOne(mappedBy="cartbean")
	private User user;
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public CartBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	//为购物车加入新的商品
	public boolean add(Food_Cart bcb) {
		super.add(bcb);
		return true;
	}

	//获取购物车中的商品
	public Food_Cart get(int index) {
		return super.get(index);
	}

	//获得购物车中的商品种类数
	public int size() {
		return super.size();
	}

	//循环判断购物车中是否有该商品
	public boolean hasFood(Food food) {
		for (int i = 0; i < this.size(); i++) {
			if (this.get(i).getFood().getId()== food.getId()) {			
				return true;
			}
		}
		return false;
	}

	//根据购物车中商品的id删除商品
	public void delete(int id) {
		for (int i = 0; i < this.size(); i++) {
			if (this.get(i).getFood().getId() == id) {
				super.remove(i);
			}
		}
	}

	//获得购物车中商品的总价
	public double getTotalCost() {
		double totalCost = 0;
		for (int i = 0; i < this.size(); i++) {
			totalCost = totalCost +this.get(i).getSum();
		}
		return totalCost;
	}
}
