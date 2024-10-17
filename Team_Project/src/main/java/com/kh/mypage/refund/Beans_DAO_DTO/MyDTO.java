package com.kh.mypage.refund.Beans_DAO_DTO;

public class MyDTO {
	// User Table 
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_phone;
	private String user_gender;
	private String user_address;
	
	// Product Table
	private String product_id;
    private String brand;
    private String product_name;
    private int price_amount;
    private int normal_price;
    private int sale_rate;
    private String image_url;
    private String CATEGORY;
    private String subCategory;
    
    // Cart Table
    private String cart_num;
//    private String user_id;
//    private String product_id;
    
    // Ordered Table 
    private String ordered_num;
//    private String USER_ID;
//    private String PRODUCT_ID;
    private String ordered_date;
    private String refunded_date;
    private String refund_status;
    
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getPrice_amount() {
		return price_amount;
	}
	public void setPrice_amount(int price_amount) {
		this.price_amount = price_amount;
	}
	public int getNormal_price() {
		return normal_price;
	}
	public void setNormal_price(int normal_price) {
		this.normal_price = normal_price;
	}
	public int getSale_rate() {
		return sale_rate;
	}
	public void setSale_rate(int sale_rate) {
		this.sale_rate = sale_rate;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	public String getCATEGORY() {
		return CATEGORY;
	}
	public void setCATEGORY(String cATEGORY) {
		CATEGORY = cATEGORY;
	}
	public String getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	public String getCart_num() {
		return cart_num;
	}
	public void setCart_num(String cart_num) {
		this.cart_num = cart_num;
	}
	public String getOrdered_num() {
		return ordered_num;
	}
	public void setOrdered_num(String ordered_num) {
		this.ordered_num = ordered_num;
	}
	public String getOrdered_date() {
		return ordered_date;
	}
	public void setOrdered_date(String ordered_date) {
		this.ordered_date = ordered_date;
	}
	public String getRefunded_date() {
		return refunded_date;
	}
	public void setRefunded_date(String refunded_date) {
		this.refunded_date = refunded_date;
	}public String getRefund_status() {
		return refund_status;
	}
	public void setRefund_status(String refund_status) {
		this.refund_status = refund_status;
	}
    
    
}
