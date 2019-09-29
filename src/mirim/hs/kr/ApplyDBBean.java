package mirim.hs.kr;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ApplyDBBean {

	private static ApplyDBBean instance = new ApplyDBBean();
	public static ApplyDBBean getInstance() {
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
	
	
	
	
	public void applyCheck(ApplyDataBean apply) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = getConnection();
			String sql = "select * from applytbl where homecode=? and id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, apply.getHomecode());
			pstmt.setString(2, apply.getId());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				//응모한 결과가 있음 -update
				updateApply(apply);
			}
			else {
				//응모한 결과 없음-insert
				insertApply(apply);
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
		
	}

	public ApplyDataBean getApply(String id) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ApplyDataBean apply = new ApplyDataBean();
		
		try {
			
			conn = getConnection();
			String sql = "select * from applytbl where id=? and result=1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				apply.setApplycode(rs.getInt("applycode"));
				apply.setHomecode(rs.getInt("homecode"));
				apply.setId(rs.getString("id"));
				apply.setApplycount(rs.getInt("applycount"));
				apply.setResult(rs.getInt("result"));
				apply.setAdmin(rs.getString("admin"));
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
		
		return apply;
	}
	
	
public void insertApply(ApplyDataBean apply) throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			
			conn = getConnection();
			String sql = "insert into applytbl (HOMECODE, ID, APPLYCOUNT,admin) values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, apply.getHomecode());
			pstmt.setString(2, apply.getId());
			pstmt.setInt(3,apply.getApplycount());
			pstmt.setString(4, apply.getAdmin());
			
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







public void updateApply(ApplyDataBean apply) throws Exception{
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		
		conn = getConnection();
		String sql = "update applytbl set applycount=applycount+? where homecode=? and id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,apply.getApplycount());
		pstmt.setInt(2,apply.getHomecode());
		pstmt.setString(3,apply.getId());
		
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




public List<ApplyDataBean> getApplyList(String id) throws Exception{
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<ApplyDataBean> applylist = null;
	
	
	try {
		
		conn = getConnection();
		String sql = "select * from applytbl where id=? order by applycount desc";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		applylist = new ArrayList<>();

		while(rs.next()) {
			ApplyDataBean apply = new ApplyDataBean();
			apply.setApplycode(rs.getInt("applycode"));
			apply.setHomecode(rs.getInt("homecode"));
			apply.setId(rs.getString("id"));
			apply.setApplycount(rs.getInt("applycount"));
			apply.setResult(rs.getInt("result"));
			apply.setAdmin(rs.getString("admin"));
			applylist.add(apply);
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
	
	return applylist;
	
}







public List<ApplyDataBean> getApplyAdmin(String admin) throws Exception{
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<ApplyDataBean> applylist = null;
	
	
	try {
		
		conn = getConnection();
		String sql = "select * from applytbl where admin=? order by applycount desc";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, admin);
		rs = pstmt.executeQuery();
		
		applylist = new ArrayList<>();

		while(rs.next()) {
			ApplyDataBean apply = new ApplyDataBean();
			apply.setApplycode(rs.getInt("applycode"));
			apply.setHomecode(rs.getInt("homecode"));
			apply.setId(rs.getString("id"));
			apply.setApplycount(rs.getInt("applycount"));
			apply.setResult(rs.getInt("result"));
			apply.setAdmin(rs.getString("admin"));
			applylist.add(apply);
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
	
	return applylist;
	
}

public void updateResult(int homecode, String id) throws Exception{
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		
		conn = getConnection();
		String sql = "update applytbl set result=1 where homecode=? and id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,homecode);
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


}
