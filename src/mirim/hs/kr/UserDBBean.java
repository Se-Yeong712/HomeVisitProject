package mirim.hs.kr;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import sun.security.action.GetIntegerAction;


public class UserDBBean {
	
	private static UserDBBean instance = new UserDBBean();
	public static UserDBBean getInstance() {
		return instance;
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

				x = 1;	
			}
			else {
				x=0;	
			}
			
		}
		else {
			x=-1;
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
	




public int getTodayCheck(String id) throws Exception{
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Date sysdate = new Date(System.currentTimeMillis());
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	int x=0;
	
	try {
		
		conn = getConnection();
		String sql = "select point, today from usertbl where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();

		
		if(rs.next()) {
			
			String time1 = dateFormat.format(rs.getDate("today"));
			String time2 = dateFormat.format(sysdate);
			
			if(time1.compareTo(time2) != 0){
				updateTodayCheck(id, rs.getInt("point")+3);
				x=1;
				System.out.println("sysdate");
			}
			
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


public void updateTodayCheck(String id, int point) throws Exception{
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		
		conn = getConnection();
		String sql = "update usertbl set point=?, today=sysdate where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,point);
		pstmt.setString(2,id);
		
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




public int getPoint(String id) throws Exception{
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int point=0;
	
	try {
		
		conn = getConnection();
		String sql = "select point from usertbl where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();

		
		if(rs.next()) {
			point =  rs.getInt("point");

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
	return point;
	
}



public void updatePoint(String id, int point) throws Exception{
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		
		conn = getConnection();
		String sql = "update usertbl set point=point+? where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,point);
		pstmt.setString(2,id);
		
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

public void updateTicket(String id, int ticket) throws Exception{
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		
		conn = getConnection();
		String sql = "update usertbl set ticket=ticket-? where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,ticket);
		pstmt.setString(2,id);
		
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
	
	
public void updatechange(UserDataBean user) throws Exception{
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		
		conn = getConnection();
		String sql = "update usertbl set point=?, ticket=ticket+? where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,user.getPoint());
		pstmt.setInt(2, user.getTicket());
		pstmt.setString(3,user.getId());
		
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
	

}
