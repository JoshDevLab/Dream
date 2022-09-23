package jjy.login.model;

import java.sql.SQLException;
import java.util.*;

public interface InterLoginDAO {

	/** 아이디(userid), 비밀번호(passwd) 를 paraMap 에 저장해 일치하는 사용자가 있는지 조회하는 메소드(select)  */
	LoginDTO selectOneUser(Map<String, String> userinfoMap) throws SQLException;


}
