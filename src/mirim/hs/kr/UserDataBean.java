package mirim.hs.kr;

import java.sql.Date;

public class UserDataBean {

	private String id;
	private String pw;
	private String name;
	private String phone;
	private int part;
	private int point;
	private int ticket;
	private Date today;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getPart() {
		return part;
	}
	public void setPart(int part) {
		this.part = part;
	}
	
	
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getTicket() {
		return ticket;
	}
	public void setTicket(int ticket) {
		this.ticket = ticket;
	}
	
	
	public Date getToday() {
		return today;
	}
	public void setToday(Date today) {
		this.today = today;
	}
	@Override
	public String toString() {
		return "UserDataBean [id=" + id + ", pw=" + pw + ", name=" + name + ", phone=" + phone + ", part=" + part
				+ ", point=" + point + ", ticket=" + ticket + ", today=" + today + "]";
	}


	
	
	
}