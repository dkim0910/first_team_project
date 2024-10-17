package com.kh.main_page;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kh.mypage.refund.Beans_DAO_DTO.MyDTO;
import com.kh.mypage.refund.mybatis.My_SqlMapConfig;

public class MainDAO {
	SqlSessionFactory factory = My_SqlMapConfig.getFactory();
	SqlSession session;
	
	public MainDAO() {
		session = factory.openSession(true);
	}

    // 전체 테이블 검색
    public List<MyDTO> getAllProducts() {
        List<MyDTO> products;
        products = session.selectList("MainMapper.getAllProducts"); // MyBatis Mapper XML에서 정의된 쿼리 호출
        return products;
    }

    
    
}
