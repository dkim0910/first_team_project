package com.kh.mypage.refund.frontcontroller;

import java.util.List;

import com.kh.mypage.refund.Action.Action;
import com.kh.mypage.refund.Action.ActionForward;
import com.kh.mypage.refund.Beans_DAO_DTO.MyDAO;
import com.kh.mypage.refund.Beans_DAO_DTO.MyDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProductAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        ActionForward forward = new ActionForward();
    	
        // 전체 데이터 베이스의 내용 테이블로 출력
    	MyDAO productDAO = new MyDAO();
        List<MyDTO> products = productDAO.getAllProducts();
        
        request.setAttribute("products", products);
        
        forward.setRedirect(false);
        forward.setPath("/productList.jsp");
        
        return forward; // 포워딩
    }
}
