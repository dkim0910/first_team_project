package com.kh.category;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kh.mybatis.SqlMapConfig;

public class GoodsDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession session;
	
	public GoodsDAO() {
		session = factory.openSession(true);
	}
	
	// 특정 카테고리 정보 list
	public List<GoodsDTO> searchCategory(String category, String subcategory) {
		List<GoodsDTO> result = null;
		HashMap<String, String> datas = new HashMap<>();
		datas.put("category", category);
		datas.put("subcategory", subcategory);
		result = session.selectList("Category.search", datas);
		return result;
	}
	
	// 선택한 상품 1개의 정보 
	public GoodsDTO searchgoods(String PRODUCT_ID) {
		GoodsDTO result = null;
		result = session.selectOne("Category.goodsinfo",PRODUCT_ID);
		return result;
	}
	
	// 장바구니 db에 상품 저장
	public void addgoods(String user_id, String PRODUCT_ID) {
		HashMap<String, String> datas = new HashMap<>();
		datas.put("user_id", user_id);
		datas.put("PRODUCT_ID", PRODUCT_ID);
		session.insert("Category.addtocart",datas);
	}
	
	
}
