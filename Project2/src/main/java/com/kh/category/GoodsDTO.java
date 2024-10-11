package com.kh.category;

public class GoodsDTO {
	private String PRODUCT_ID;
	private String BRAND;	
	private String PRODUCT_NAME	;	
	private int PRICE_AMOUNT;	
	private int NORMAL_PRICE;	
	private int SALE_RATE;		
	private String IMAGE_URL;	
	private String CATEGORY	;
	private String SUBCATEGORY;
	
	public String getPRODUCT_ID() {
		return PRODUCT_ID;
	}
	public void setPRODUCT_ID(String pRODUCT_ID) {
		PRODUCT_ID = pRODUCT_ID;
	}
	public String getBRAND() {
		return BRAND;
	}
	public void setBRAND(String bRAND) {
		BRAND = bRAND;
	}
	public String getPRODUCT_NAME() {
		return PRODUCT_NAME;
	}
	public void setPRODUCT_NAME(String pRODUCT_NAME) {
		PRODUCT_NAME = pRODUCT_NAME;
	}
	public int getPRICE_AMOUNT() {
		return PRICE_AMOUNT;
	}
	public void setPRICE_AMOUNT(int pRICE_AMOUNT) {
		PRICE_AMOUNT = pRICE_AMOUNT;
	}
	public int getNORMAL_PRICE() {
		return NORMAL_PRICE;
	}
	public void setNORMAL_PRICE(int nORMAL_PRICE) {
		NORMAL_PRICE = nORMAL_PRICE;
	}
	public int getSALE_RATE() {
		return SALE_RATE;
	}
	public void setSALE_RATE(int sALE_RATE) {
		SALE_RATE = sALE_RATE;
	}
	public String getIMAGE_URL() {
		return IMAGE_URL;
	}
	public void setIMAGE_URL(String iMAGE_URL) {
		IMAGE_URL = iMAGE_URL;
	}
	public String getCATEGORY() {
		return CATEGORY;
	}
	public void setCATEGORY(String cATEGORY) {
		CATEGORY = cATEGORY;
	}
	public String getSUBCATEGORY() {
		return SUBCATEGORY;
	}
	public void setSUBCATEGORY(String sUBCATEGORY) {
		SUBCATEGORY = sUBCATEGORY;
	}
}
