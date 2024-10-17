package com.kh.order;

import java.util.HashMap;
import java.util.List;

import org.apache.catalina.tribes.util.Arrays;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kh.cart.CartDTO;
import com.kh.category.GoodsDTO;
import com.kh.mybatis.SqlMapConfig;
import com.kh.mypage.refund.Beans_DAO_DTO.MyDTO;

public class OrderDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession session;

	public OrderDAO() {
		session = factory.openSession(true);
	}

	public List<MyDTO> getProducts(String product_id) {
		List<MyDTO> result = session.selectList("Order.getProducts", product_id);
		return result;
	}

	public List<GoodsDTO> getByList(String[] itemIdsArray) {
		List<GoodsDTO> result = session.selectList("Order.getbylist", itemIdsArray);
		return result;
	}

	public boolean insertOrderedList(String product_id, String user_id) {
		boolean result = false;
		HashMap<String, String> data = new HashMap<String, String>();
		data.put("product_id", product_id);
		data.put("user_id", user_id);
		session.insert("Order.insertOrderedList", data);
		return result;
	}

	// 장바구니 db 내의 상품 리스트 가져오기
	public List<CartDTO> searchCart(String user_id) {
		List<CartDTO> result = session.selectList("Order.carttoorder", user_id);
		return result;
	}

	// 장바구니(cart) db에서 구매할 상품 삭제
	public boolean deleteCart(String[] itemIdsArray) {
		boolean result = false;
		if (session.delete("Order.deletecart", itemIdsArray) == 1) {
			result = true;
		}
		return result;
	}

	// 주문내역(ordered) db에 구매한 상품 추가
	public boolean cartToOrder(String user_id, String itemID) {
		boolean result = false;
		HashMap<String, String> datas = new HashMap<String, String>();
		datas.put("user_id", user_id);
		datas.put("itemID", itemID);

		if (session.insert("Order.insertToOrdered", datas) == 1) {
			result = true;
		}
		return result;
	}

}
