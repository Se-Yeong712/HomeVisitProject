package mirim.hs.kr;

public class ApplyDataBean {
	
	private int applycode;
	private int homecode;
	private String id;
	private int applycount;
	private int result;
	private String admin;
	
	public int getApplycode() {
		return applycode;
	}
	public void setApplycode(int applycode) {
		this.applycode = applycode;
	}
	public int getHomecode() {
		return homecode;
	}
	public void setHomecode(int homecode) {
		this.homecode = homecode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getApplycount() {
		return applycount;
	}
	public void setApplycount(int applycount) {
		this.applycount = applycount;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	
	
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	@Override
	public String toString() {
		return "ApplyDataBean [applycode=" + applycode + ", homecode=" + homecode + ", id=" + id + ", applycount="
				+ applycount + ", result=" + result + ", admin=" + admin + "]";
	}

	
	
	
	
	


}
