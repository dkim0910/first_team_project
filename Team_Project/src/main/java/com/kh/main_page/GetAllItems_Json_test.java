package com.kh.main_page;

import java.io.IOException;
import java.util.List;

import org.json.simple.JSONObject;

import com.kh.mypage.refund.Action.Action;
import com.kh.mypage.refund.Action.ActionForward;
import com.kh.mypage.refund.Beans_DAO_DTO.MyDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class GetAllItems_Json_test implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		MainDAO maindao = new MainDAO();
		System.out.println("here3");
		List<MyDTO> getAllProducts = maindao.getAllProducts();
//		request.setAttribute("getAllProducts", getAllProducts);
		
		JSONObject products = new JSONObject();
		products.put("product_name", getAllProducts.get(0).getProduct_name());
		
		System.out.println(getAllProducts.get(0).getBrand());
		System.out.println(getAllProducts.get(1).getBrand());
		System.out.println(getAllProducts.get(2).getBrand());
		
//		forward.setRedirect(false);
//		forward.setPath("/main-page/main.jsp");
		
		System.out.println("here5");
		
		try {
			response.getWriter().write(products.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
//		return forward;
		return null;
	}

}
