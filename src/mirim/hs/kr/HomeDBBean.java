package mirim.hs.kr;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HomeDBBean {

	private static HomeDBBean instance = new HomeDBBean();
	public static HomeDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception{
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="EVENT";
		String pass="1234";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(url, user, pass);
		
		
		return conn;
		
	}
	
	
	
	
public void insertHome(HomeDataBean home) throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			
			conn = getConnection();
			String sql = "insert into hometbl (ID, address, content, quiz, answer) values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, home.getId());
			pstmt.setString(2, home.getAddress());
			pstmt.setString(3, home.getContent());
			pstmt.setString(4, home.getQuiz());
			pstmt.setString(5, home.getAnswer());
			
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


public List<HomeDataBean> getHomeList() throws Exception{
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<HomeDataBean> homelist = null;

	try {
		
		conn = getConnection();
		String sql = "select * from hometbl order by homecode";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		homelist = new ArrayList<>();
		

		while(rs.next()) {
			HomeDataBean home = new HomeDataBean();
			home.setHomecode(rs.getInt("homecode"));
			home.setId(rs.getString("id"));
			home.setAddress(rs.getString("address"));
			home.setContent(rs.getString("content"));
			home.setQuiz(rs.getString("quiz"));
			home.setAnswer(rs.getString("answer"));

			
			homelist.add(home);
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
	
	return homelist;
	
}	


public HomeDataBean getHome(int homecode) throws Exception{
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	HomeDataBean home = null;

	try {
		
		conn = getConnection();
		String sql = "select * from hometbl where homecode=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, homecode);
		rs = pstmt.executeQuery();
		
		

		if(rs.next()) {
			home = new HomeDataBean();
			home.setHomecode(rs.getInt("homecode"));
			home.setId(rs.getString("id"));
			home.setAddress(rs.getString("address"));
			home.setContent(rs.getString("content"));
			home.setQuiz(rs.getString("quiz"));
			home.setAnswer(rs.getString("answer"));

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
	
	return home;
	
}	
	
	
	
}
