package com.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="foodcart")
public class Food_Cart {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private int foodCount;//针对一个购物车中某本书的数量
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="foodid")
	private Food food;
	@ManyToOne
	@JoinColumn(name="cartbeanid")
	private CartBean cartBean;
	private String text;//对于该商品的备注信息
	private double sum;//该商品的总价
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public double getSum() {
		return this.getFood().getPrice()*this.getFoodCount();
	}
	public void setSum() {
		this.sum = this.foodCount*this.getFood().getPrice();
	}
	public int getFoodCount() {
		return foodCount;
	}
	public void setFoodCount(int foodCount) {
		this.foodCount = foodCount;
	}
	public Food getFood() {
		return food;
	}
	public void setFood(Food food) {
		this.food = food;
	}
	public CartBean getCartBean() {
		return cartBean;
	}
	public void setCartBean(CartBean cartBean) {
		this.cartBean = cartBean;
	}
	
}
