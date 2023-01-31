package SignUpPackage;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;
public class UserDB {
	Connection con;
	Statement s;
	ResultSet rs;
	
	public UserDB() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/USERDB1", "root", "root");
			s = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			s.executeUpdate("CREATE DATABASE IF NOT EXISTS USERDB1");
			s.executeUpdate("USE USERDB1");
			s.executeUpdate("CREATE TABLE IF NOT EXISTS USERS (EMAIL VARCHAR(30) PRIMARY KEY, "
					+ "PASSWORD VARCHAR(30), NAME1 VARCHAR(30), NAME2 VARCHAR(30), GENDER VARCHAR(10), "
					+ "PHONENO VARCHAR(10), ADDRESS VARCHAR(100), COUNTRY VARCHAR(30), TOC INT(2), NEWS INT(2))");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
	public int noOfExistingUsersInDb() throws SQLException {
		int len = 0;
		rs = s.executeQuery("SELECT EMAIL FROM USERS");
		while(rs.next()) {
			len++;
		}
		return len;
	}
	
	public boolean checkIfUserExistsInDB(String email) {
		boolean flag = false;
		try {
			System.out.println(email);
			rs = s.executeQuery("SELECT EMAIL FROM USERS");
			
			int x = 0;
			while(rs.next())
				x++;
			if(x==0) 
				return false;
			
			rs.beforeFirst();
			while(rs.next()) {
				String testName;
				testName = rs.getString(1);
				if(testName.equals(email)) {
					System.out.println("exists");
					return true;
				}
				else {
					flag = false;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean insertUserIntoDB(UserModel user1) {
		String testName = user1.getName1() + user1.getName2();
		try {
			
			String command = "INSERT INTO USERS VALUES(\"%s\", \"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\", %s, %s)";
			command = String.format(command, user1.getEmail(), user1.getPassword(), user1.getName1(), 
					user1.getName2(), user1.getGender(), user1.getPhoneno() ,user1.getAddress(), user1.getCountry(), user1.getToc(),
					user1.getNews());
			s.executeUpdate(command);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
  	}
	
	public boolean loginCheck(String email, String password) throws SQLException {
		boolean flag = false;
		String passwordEncrypted = "";
		if(checkIfUserExistsInDB(email)) {
			rs = s.executeQuery("SELECT PASSWORD FROM USERS WHERE EMAIL = \"" + email + "\"");
			while(rs.next()) {
				passwordEncrypted = rs.getString(1);	
			}
//			System.out.println(passwordEncrypted);

			char dec[] = passwordEncrypted.toCharArray();
			char test[] = new char[dec.length];
			int i = 0;
			for(char c : dec) {
				c -= 7;
				test[i++] = c;
			}
			String passwordDecrypted = new String(test);
			System.out.println(password);
			System.out.print(passwordDecrypted);
			
			if(password.equals(passwordDecrypted)) {
				System.out.print("Succesful login");
				return true;
			}
			else {
				System.out.print("Incorrect Password");
				return false;
			}
		}
		else {
			System.out.println("User does not exist");
		return flag;
		}
	}

	public void updatePassword(String email, String password) throws SQLException{
		
			char dec[] = password.toCharArray();
			char test[] = new char[dec.length];
			int i = 0;
			for(char c : dec) {
				c += 7;
				test[i++] = c;
			}
			String passwordEncrypted = new String(test);
			System.out.println(password);
			System.out.print(passwordEncrypted);
			
			s.executeUpdate("UPDATE USERS SET PASSWORD = \"" + passwordEncrypted + "\" WHERE EMAIL = \"" + email + "\"");


	}
	
	public String getName(String email) throws SQLException {
		String usernamel = "";
		rs = s.executeQuery("SELECT NAME1 FROM USERS WHERE EMAIL = \"" + email + "\"");
		while(rs.next()) {
			usernamel = rs.getString(1);	
		}
		return usernamel;
	}	
	
	public void setName(String email, String str1) throws SQLException {
		s.executeUpdate("UPDATE USERS SET NAME1 = \"" + str1 + "\" WHERE EMAIL = \"" + email + "\"");
	}
	
	
	public String getName2(String email) throws SQLException {
		String username2 = "";
		rs = s.executeQuery("SELECT NAME2 FROM USERS WHERE EMAIL = \"" + email + "\"");
		while(rs.next()) {
			username2 = rs.getString(1);	
		}
		return username2;
	}
	
	public void setName2(String email, String str1) throws SQLException {
		s.executeUpdate("UPDATE USERS SET NAME2 = \"" + str1 + "\" WHERE EMAIL = \"" + email + "\"");
	}
	
	public String getAddress(String email) throws SQLException {
		String address = "";
		rs = s.executeQuery("SELECT ADDRESS FROM USERS WHERE EMAIL = \"" + email + "\"");
		while(rs.next()) {
			address = rs.getString(1);	
		}
		return address;
	}
	
	public void setAddress(String email, String str1) throws SQLException {
		s.executeUpdate("UPDATE USERS SET ADDRESS = \"" + str1 + "\" WHERE EMAIL = \"" + email + "\"");
	}
	
	public String getFullName(String email) throws SQLException {
		String fullName = "";
		rs = s.executeQuery("SELECT NAME1, NAME2 FROM USERS WHERE EMAIL = \"" + email + "\"");
		while(rs.next()) {
			fullName = rs.getString(1) + " " +  rs.getString(2);	
		}
		return fullName;
	}
	
	public String getCountry(String email) throws SQLException {
		String country = "";
		rs = s.executeQuery("SELECT COUNTRY FROM USERS WHERE EMAIL = \"" + email + "\"");
		while(rs.next()) {
			country = rs.getString(1);	
		}
		return country;
	}
	
	public void setCountry(String email, String str1) throws SQLException {
		s.executeUpdate("UPDATE USERS SET COUNTRY = \"" + str1 + "\" WHERE EMAIL = \"" + email + "\"");
	}
	
	public String getGender(String email) throws SQLException {
		String gender = "";
		rs = s.executeQuery("SELECT GENDER FROM USERS WHERE EMAIL = \"" + email + "\"");
		while(rs.next()) {
			gender = rs.getString(1);	
		}
		return gender;
	}
	
	public void setGender(String email, String str1) throws SQLException {
		s.executeUpdate("UPDATE USERS SET GENDER = \"" + str1 + "\" WHERE EMAIL = \"" + email + "\"");
	}
	
	public String getPhoneno(String email) throws SQLException {
		String phoneno = "";
		rs = s.executeQuery("SELECT PHONENO FROM USERS WHERE EMAIL = \"" + email + "\"");
		while(rs.next()) {
			phoneno = rs.getString(1);	
		}
		return phoneno;
	}
	
	public void setPhoneno(String email, String str1) throws SQLException {
		s.executeUpdate("UPDATE USERS SET PHONENO = \"" + str1 + "\" WHERE EMAIL = \"" + email + "\"");
	}
}
