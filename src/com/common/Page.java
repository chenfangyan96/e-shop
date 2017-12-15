package com.common;

public class Page {
	private int column_count = 0; //记录总条数
	private int page_count = 0; //总页数
	private int column_page; //每页有多少条记录
	private int current_page = 1; //当前页
	
	
	public Page() {
		super();
		setPage_count();
		// TODO Auto-generated constructor stub
	}
	public int getColumn_count() {
		return column_count;
	}
	public void setColumn_count(int column_count) {
		this.column_count = column_count;
		if(this.column_page != 0) {
			setPage_count();
		}
	}
	public int getPage_count() {
		return page_count;
	}
	public void setPage_count() {
		int n = 0;
		if(this.column_page != 0) {
			n = (this.column_count % this.column_page) == 0 
					? (this.column_count / this.column_page) 
							: (this.column_count / this.column_page +1) ;
		}
		this.page_count = n;
	}
	public int getColumn_page() {
		return column_page;
	}
	public void setColumn_page(int column_page) {
		this.column_page = column_page;
		if(this.column_page != 0) {
			setPage_count();
		}
	}
	public int getCurrent_page() {
		return current_page;
	}
	public void setCurrent_page(int current_page) {
		this.current_page = current_page;
	}
	public boolean isFirst_page() {
		boolean flag = false;
		if(current_page == 1) {
			flag = true;
		}
		return flag;
	}
	public boolean isLast_page() {
		boolean flag = false;
		if(current_page == page_count) {
			flag = true;
		}
		return flag;
	}
	public void setPage_count(int page_count) {
		this.page_count = page_count;
	}
	
}
