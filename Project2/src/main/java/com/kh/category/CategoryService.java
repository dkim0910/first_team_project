package com.kh.category;

import java.util.List;

import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CategoryService {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)  {
		ActionForward forward = new ActionForward();
		GoodsDAO gdao = new GoodsDAO();
		
		String category = request.getParameter("category");
		String subcategory = request.getParameter("subcategory");
		
		List<GoodsDTO> categoryList = gdao.searchCategory(category, subcategory);
		request.setAttribute("categoryList", categoryList);
		
		forward.setRedirect(false);
		forward.setPath("/category/categoryDetail/categoryDetail.jsp");
		
		return forward;
	}
}
