package SignUpPackage;
import SignUpPackage.InvoiceViewModel;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

public class FeedbackDB {
	Connection con;
	Statement s;
	ResultSet rs;
   	public static LinkedList<FeedbackModel> existingProds = new LinkedList<FeedbackModel>();

	public FeedbackDB() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/USERDB1", "root", "root");
			s = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			s.executeUpdate("CREATE DATABASE IF NOT EXISTS USERDB1");
			s.executeUpdate("USE USERDB1");
			
			s.executeUpdate("CREATE TABLE IF NOT EXISTS FEEDBACK(EMAIL VARCHAR(30), NAME VARCHAR(30), PHONENO VARCHAR(30),DATEOFFEEDBACK DATE, FEEDBACKTEXT VARCHAR(250), FOREIGN KEY(EMAIL) REFERENCES USERS(EMAIL));");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
	public void insertIntoCartDB(FeedbackModel feedbackModel) {
		try {
			System.out.println("Inserting.....");
			String command = "INSERT INTO FEEDBACK VALUES(\"%s\", \"%s\", \"%s\",\"%s\", \"%s\")";
			command = String.format(command, feedbackModel.getEmail(), feedbackModel.getName(), feedbackModel.getPhno(), feedbackModel.getDate(), feedbackModel.getFeedback());
			System.out.println(command);
			s.executeUpdate(command);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
