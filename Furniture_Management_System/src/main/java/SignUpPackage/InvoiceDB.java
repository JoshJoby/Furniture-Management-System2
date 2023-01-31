package SignUpPackage;
import SignUpPackage.InvoiceViewModel;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

public class InvoiceDB {
	Connection con;
	Statement s;
	ResultSet rs;
   	public static LinkedList<CartModel> existingProds = new LinkedList<CartModel>();
   	public static LinkedList<InvoiceViewModel> rowsFromDB = new LinkedList<InvoiceViewModel>();

	public InvoiceDB() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/USERDB1", "root", "root");
			s = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			s.executeUpdate("CREATE DATABASE IF NOT EXISTS USERDB1");
			s.executeUpdate("USE USERDB1");
			System.out.println("Creating TRANSACTION table");
			
			s.executeUpdate("CREATE TABLE IF NOT EXISTS TRANSACTIONS(TRANSACTIONSID VARCHAR(10), EMAIL VARCHAR(30), PRODID VARCHAR(100), "
					+ "ADDRESS VARCHAR(100), DATEOFTRANSACTION DATE, "
					+ "PRODNAME VARCHAR(100), PRODCATEGORY VARCHAR(50), PRODCOST FLOAT(9,2), PRODSELECTEDQUANTITY INT, "
					+ "PRODTOTALCOST FLOAT(9,2),  "
					+ "FOREIGN KEY(EMAIL) REFERENCES USERS(EMAIL), "
					+ "FOREIGN KEY(PRODID) REFERENCES PRODUCTS(PRODID));");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
	public void insertIntoCartDB(LinkedList<InvoiceModel> selectedProds) {
		try {
			for(InvoiceModel invoiceModel : selectedProds) {
			String command = "INSERT INTO TRANSACTIONS VALUES(\"%s\", \"%s\", \"%s\", \"%s\", \"%s\", \"%s\", \"%s\", %f, %d, %f)";
			command = String.format(command, invoiceModel.getTransactionID(), invoiceModel.getEmail(), invoiceModel.getProdID(),
					invoiceModel.getAddress(), invoiceModel.getDateOfPurchase(), invoiceModel.getProdName(),
					invoiceModel.getProdCategory(), invoiceModel.getProdCost(), invoiceModel.getProdQuantity(), invoiceModel.getProdTotalCost());
			s.executeUpdate(command);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int getNumOfOrders(String email) throws SQLException {
			int len = 0;
			rs = s.executeQuery("SELECT COUNT(*) FROM TRANSACTIONS WHERE EMAIL = \"" + email + "\"");
			while(rs.next()) {
				len = rs.getInt(1);	
			}			
			return len;			
	}
	
	public LinkedList<InvoiceViewModel> getViewRows(String email) throws SQLException{
	   	 LinkedList<InvoiceViewModel> rows = new LinkedList<InvoiceViewModel>();
		rs = s.executeQuery("SELECT DISTINCT(TRANSACTIONSID), DATEOFTRANSACTION, COUNT(*), SUM(PRODTOTALCOST) FROM TRANSACTIONS WHERE EMAIL = \""+ email + "\" GROUP BY TRANSACTIONSID");
		while(rs.next()) {
			InvoiceViewModel ivm = new InvoiceViewModel(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
			rows.push(ivm);	
		}		
		return rows;
	}
	
	public LinkedList<InvoiceModel> getFullViewRows(String email, String transactionID) throws SQLException{
	   	 LinkedList<InvoiceModel> rows = new LinkedList<InvoiceModel>();
		rs = s.executeQuery("SELECT * FROM TRANSACTIONS WHERE EMAIL = \""+ email + "\" AND TRANSACTIONSID = \"" + transactionID + "\"");
		while(rs.next()) {
			InvoiceModel ivm = new InvoiceModel(rs.getString(1), rs.getString(2), rs.getString(3), 
					SignInServlet.userName1+" "+SignInServlet.userName2, rs.getString(4), SignInServlet.userCountry, 
					rs.getString(5), rs.getString(6), rs.getFloat(8), rs.getString(7), rs.getInt(9), 
					rs.getFloat(10));
			rows.push(ivm);	
		}		
		return rows;
	}
	
}
