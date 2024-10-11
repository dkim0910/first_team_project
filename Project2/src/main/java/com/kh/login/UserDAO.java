package com.kh.login;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kh.mybatis.SqlMapConfig;

public class UserDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession session;
	
	public UserDAO() {
		session = factory.openSession(true);
	}
	
	// 회원가입
	public boolean join(UserDTO user) {
		boolean result = false;
		if(session.insert("Member.join",user)==1) {
			result = true;
		}
		return result;
	}
	
	// id 중복체크
	 public boolean checkId(String user_id) {
		 boolean result = false;
		 int cnt = 0;
		 cnt = session.selectOne("Member.checkId", user_id);
		 if(cnt == 1) {
			 result = true;
		 }
		 return result;
	 }
	
	// 로그인
	public UserDTO login(String user_id, String user_pw) {
		UserDTO member = null;
		HashMap<String, String> datas = new HashMap<>();
		datas.put("user_id", user_id);
		datas.put("user_pw", user_pw);
		member = session.selectOne("Member.login", datas);
		return member;
	}
	
	// 아이디 찾기
	public UserDTO searchByname(String user_name, String user_phone) {
		UserDTO member = null;
		Map<String, String> params = new HashMap<>();
		params.put("user_name", user_name);
		params.put("user_phone", user_phone);
		member = session.selectOne("Member.searchByname", params);
		return member;		 
	}
	
	//	로그인성공시 이름보여주는 메서드
	public UserDTO nameView(String user_name) {
		UserDTO name = null;
	    name = session.selectOne("Member.nameView", user_name);
	    return name;		 
	}
}
