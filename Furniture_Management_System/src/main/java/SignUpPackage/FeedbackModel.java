package SignUpPackage;

public class FeedbackModel {
	String email;
	String date;
	String feedback;
	String name;
	String phno;
	public FeedbackModel(String email, String name, String phno, String date, String feedback) {
		super();
		this.email = email;
		this.date = date;
		this.feedback = feedback;
		this.name = name;
		this.phno = phno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhno() {
		return phno;
	}
	public void setPhno(String phno) {
		this.phno = phno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
}
