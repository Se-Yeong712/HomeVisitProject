package mirim.hs.kr;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class UserDBBean {
	
	private static UserDBBean instance = new UserDBBean();
	public static UserDBBean getInstance() {
		return instance;
		//싱글톤패턴 -> db작업은 하나만 있으면 되니까 static으로 만듬
	}
	
	private Connection getConnection() throws Exception{
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="EVENT";
		String pass="1234";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(url, user, pass);
		
		
		return conn;
		
	}//getConnection
	
	
public void insertMember(UserDataBean member) throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			
			conn = getConnection();
			String sql = "insert into usertbl (ID, PW, NAME, PHONE, PART) values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getPhone());
			pstmt.setInt(5, member.getPart());
			
			pstmt.executeUpdate();
						
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally{
			if(pstmt!=null){
				try{pstmt.close();} catch(Exception e){}
			}
			if(conn!=null){
				try{conn.close();} catch(Exception e){}
			}		
		}	
	}



public int userCheck(String id, String pw) throws Exception{
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int x = -1;
	String dbpass="";
	try {
		
		conn = getConnection();
		String sql = "select pw from usertbl where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();

		
		if(rs.next()) {
			dbpass = rs.getString("pw");
			if(dbpass.equals(pw)) {

				x = 1;	//인증성공
			}
			else {
				x=0;	//비밀번호 틀림
			}
			
		}
		else {
			x=-1;	//해당 아이디 없음.
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}finally{
		if(rs!=null){
			try{rs.close();} catch(Exception e){}
		}
		if(pstmt!=null){
			try{pstmt.close();} catch(Exception e){}
		}
		if(conn!=null){
			try{conn.close();} catch(Exception e){}
		}
	
	}
	
	
	return x;
	
}
	
	
public UserDataBean getMember(String id) throws Exception{
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	UserDataBean login = null;
	
	try {
		
		conn = getConnection();
		String sql = "select * from usertbl where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		login = new UserDataBean();

		
		if(rs.next()) {
			login.setId(rs.getString("id"));
			login.setPw(rs.getString("pw"));
			login.setName(rs.getString("name"));
			login.setPart(rs.getInt("part"));
			login.setPoint(rs.getInt("point"));
			login.setTicket(rs.getInt("ticket"));
			login.setToday(rs.getDate("today"));
			
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}finally{
		if(rs!=null){
			try{rs.close();} catch(Exception e){}
		}
		if(pstmt!=null){
			try{pstmt.close();} catch(Exception e){}
		}
		if(conn!=null){
			try{conn.close();} catch(Exception e){}
		}
	
	}
	return login;
}
	
	
	
public List<UserDataBean> getMemberList() throws Exception{
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<UserDataBean> userlist = null;
	
	
	try {
		
		conn = getConnection();
		String sql = "select * from usertbl";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		userlist = new ArrayList<>();

		while(rs.next()) {
			UserDataBean user = new UserDataBean();
			user.setId(rs.getString("id"));
			user.setName(rs.getString("Name"));
			user.setPart(rs.getInt("part"));
			userlist.add(user);
		}
		

		
	} catch (Exception e) {
		e.printStackTrace();
	}finally{
		if(rs!=null){
			try{rs.close();} catch(Exception e){}
		}
		if(pstmt!=null){
			try{pstmt.close();} catch(Exception e){}
		}
		if(conn!=null){
			try{conn.close();} catch(Exception e){}
		}
	
	}
	
	return userlist;
	
}	
	
	
	

}
