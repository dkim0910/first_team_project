package com.kh.mypage.refund.Beans_DAO_DTO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kh.mypage.refund.mybatis.My_SqlMapConfig;

public class MyDAO {
	SqlSessionFactory factory = My_SqlMapConfig.getFactory();
	SqlSession session;
	
	public MyDAO() {
		session = factory.openSession(true);
	}

    // 전체 테이블 검색
    public List<MyDTO> getAllProducts() {
        List<MyDTO> products;
        products = session.selectList("MyMapper.getAllProducts"); // MyBatis Mapper XML에서 정의된 쿼리 호출
        return products;
    }

	// 환불페이지에 필요한 요소 가지고 오기
	public List<MyDTO> getRefunds(String userid){
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		
		List<MyDTO> refunds = new ArrayList<>();
		refunds = session.selectList("MyMapper.getRefunds", datas);	
		
		return refunds;
	}

	// 주문 내역
	public List<MyDTO> getOrdered(String userid) {
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		
		List<MyDTO> refunds = new ArrayList<>();
		refunds = session.selectList("MyMapper.getOrdered", datas);
		
		return refunds;
	}

	// 회원 삭제 및 회원 카트랑 주문 내역 삭제 (모든 테이블에서 이 값의 user_id면 삭제)
	public void deleteUser(String userid) {
	    // Ordered 테이블에서 USER_ID가 'admin'인 데이터 삭제
	    session.delete("MyMapper.deleteFromOrdered", userid);

	    // Cart 테이블에서 USER_ID가 'admin'인 데이터 삭제
	    session.delete("MyMapper.deleteFromCart", userid);

	    // Users 테이블에서 USER_ID가 'admin'인 데이터 삭제
	    session.delete("MyMapper.deleteFromUsers", userid);
	}

	// 환불 하면 "환불 완료"랑 sysdate update 하는거
	public List<MyDTO> finishedRefund(String userid, String ordernum) {
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("ordernum", ordernum);
		
		List<MyDTO> refunds = new ArrayList<>();
		refunds = session.selectList("MyMapper.finishedRefund", datas);	
		
		return refunds;
	}

	// 세일중인 아웃터 가지고 오기 (이벤트 페이지)
	public List<MyDTO> getOuterSale() {
		List<MyDTO> outers;
		outers = session.selectList("MyMapper.selectOuter");
		
		return outers;
	}

	// 3만원 이하의 제품들 가지고 오기 (이벤트 페이지)
	public List<MyDTO> underthree() {
		List<MyDTO> underthree;
		underthree = session.selectList("MyMapper.underthree");
		return underthree;
	}

    
    
    
    
    
}
