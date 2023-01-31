package SignUpPackage;

public class UserModel {
	private String email;
	public UserModel(String email, String password, String name1, String name2, String gender, String country,
			String toc, String news, String address, String phoneno) {
		this.email = email;
		this.password = password;
		this.name1 = name1;
		this.name2 = name2;
		this.gender = gender;
		this.country = country;
		this.toc = toc;
		this.news = news;
		this.address = address;
		this.phoneno = phoneno;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	private String phoneno;
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	private String password;   
	private String name1;
	private String name2;
	private String gender;
	private String country;
	private String toc;
	private String news;
	private String address;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName1() {
		return name1;
	}
	public void setName1(String name1) {
		this.name1 = name1;
	}
	public String getName2() {
		return name2;
	}
	public void setName2(String name2) {
		this.name2 = name2;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getToc() {
		return toc;
	}
	public void setToc(String toc) {
		this.toc = toc;
	}
	public String getNews() {
		return news;
	}
	public void setNews(String news) {
		this.news = news;
	}
	
}
