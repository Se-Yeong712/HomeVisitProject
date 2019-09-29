package mirim.hs.kr;


public class HomeDataBean {
	
	private int homecode;
	private String id;
	private String address;
	private String content;
	private String quiz;
	private String answer;
	
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getQuiz() {
		return quiz;
	}
	public void setQuiz(String quiz) {
		this.quiz = quiz;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	@Override
	public String toString() {
		return "HomeDataBean [homecode=" + homecode + ", id=" + id + ", address=" + address + ", content=" + content
				+ ", quiz=" + quiz + ", answer=" + answer + "]";
	}
	

}
