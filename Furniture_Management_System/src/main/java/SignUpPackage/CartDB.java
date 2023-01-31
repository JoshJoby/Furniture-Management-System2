package SignUpPackage;
import java.sql.*;
import SignUpPackage.CartModel;
import java.util.LinkedList;
import java.util.List;
import jakarta.servlet.http.HttpServletRequest;
import SignUpPackage.UserDB;
public class CartDB {
	Connection con;
	Statement s;
	ResultSet rs;
	public static String totalCost;
   	public static LinkedList<CartModel> existingProds = new LinkedList<CartModel>();

	public CartDB() {
		UserDB udb = new UserDB();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/USERDB1", "root", "root");
			s = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			s.executeUpdate("CREATE DATABASE IF NOT EXISTS USERDB1");
			s.executeUpdate("USE USERDB1");
			System.out.println("Creating cart table");
			
			s.executeUpdate("CREATE TABLE IF NOT EXISTS CART(EMAIL VARCHAR(30), PRODID VARCHAR(30), "																																																				
					+ "PRODNAME LONGTEXT, PRODCOST FLOAT(9,2), PRODIMAGE1 VARCHAR(100), PRODQUANTITY INT, "
					+ "PRODDESC LONGTEXT, PRODCATEGORY VARCHAR(50), PRODTOTALCOST FLOAT(9,2), PRODSELECTEDQUANTITY INT, "
					+ "FOREIGN KEY(EMAIL) REFERENCES USERS(EMAIL), "
					+ "FOREIGN KEY(PRODID) REFERENCES PRODUCTS(PRODID));");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
	public void insertIntoCartDB(String email, CartModel cartModel) {
		try {
			System.out.println("\n" + email + " user logged in!");
			if(email!=null) {
				String command = "INSERT INTO CART VALUES(\"%s\", \"%s\",\"%s\",%f,\"%s\",%d, \"%s\", \"%s\", %f, %d)";
				command = String.format(command, email, cartModel.getProdID(), cartModel.getProdName(), 
						cartModel.getProdCost(), cartModel.getProdImage(), cartModel.getProdQuantity(), cartModel.getProdDesc(),
						cartModel.getProdCategory(), cartModel.getTotalProdCost(), cartModel.getProdSelectedQuantity());
				s.executeUpdate(command);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void updateProdQuantity(String prodID, String email, int prodQuantity, float prodPrice) {
		String command = "UPDATE CART SET PRODSELECTEDQUANTITY = " + (prodQuantity) + ", PRODTOTALCOST = " + (prodQuantity*prodPrice) + " WHERE EMAIL = \'" + email + "\' AND PRODID = \'" + prodID + "\'";
		System.out.println(command);
		try {
			s.executeUpdate(command);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void getExistingUserProducts(String email) throws SQLException {
		System.out.println("SELECT * FROM CART WHERE EMAIL = \'" + email + "\' " );
		rs = s.executeQuery("SELECT * FROM CART WHERE EMAIL = \'" + email + "\' " );
		while(rs.next()) {
			CartModel cartmodel = new CartModel(
					rs.getString(2),
					rs.getString(3),
					rs.getString(5),
					rs.getString(7),
					rs.getFloat(4),
					rs.getInt(6),
					rs.getFloat(9),
					rs.getInt(10),	
					rs.getString(8)
					);
			existingProds.push(cartmodel);
		}
	}
	
	public void removeProductFromDB(String email, String prodID) {
		String command = "DELETE FROM CART WHERE EMAIL = \'" +  email + "\' AND PRODID = \'" + prodID + "\'";
		System.out.println(command);
		try {
			s.executeUpdate(command);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String getProdID(String prodID) {
		return prodID;
	}
	
	public void clearCart(String email) throws SQLException {
		try {
			String command = "DELETE FROM CART WHERE EMAIL = \'" + email + "\';";
			s.executeUpdate(command);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String getProdName(String prodID) throws SQLException {
		String prodName = "";
		rs = s.executeQuery("SELECT PRODNAME FROM CART WHERE PRODID = \"" + prodID + "\"");
		while(rs.next()) {
			prodName = rs.getString(1);	
		}
		return prodName;
	}
	public float getProdPrice(String prodID) throws SQLException {
		float prodPrice = 0.0f;
		rs = s.executeQuery("SELECT PRODPRICE FROM CART WHERE PRODID = \"" + prodID + "\"");
		while(rs.next()) {
			prodPrice = rs.getFloat(1);	
		}
		return prodPrice;
	}
	public int getProdRating(String prodID) throws SQLException {
		int prodRating = 0;
		rs = s.executeQuery("SELECT PRODRATING FROM CART WHERE PRODID = \"" + prodID + "\"");
		while(rs.next()) {
			prodRating = rs.getInt(1);	
		}
		return prodRating;
	}
	public String getProdImage1(String prodID) throws SQLException {
		String prodImage1 = "";
		rs = s.executeQuery("SELECT PRODIMAGE1 FROM CART WHERE PRODID = \"" + prodID + "\"");
		while(rs.next()) {
			prodImage1 = rs.getString(1);	
		}
		return prodImage1;
	}
	public String getProdImage2(String prodID) throws SQLException {
		String prodImage2 = "";
		rs = s.executeQuery("SELECT PRODIMAGE2 FROM CART WHERE PRODID = \"" + prodID + "\"");
		while(rs.next()) {
			prodImage2 = rs.getString(1);	
		}
		return prodImage2;
	}
	public String getProdImage3(String prodID) throws SQLException {
		String prodImage3 = "";
		rs = s.executeQuery("SELECT PRODIMAGE3 FROM CART WHERE PRODID = \"" + prodID + "\"");
		while(rs.next()) {
			prodImage3 = rs.getString(1);	
		}
		return prodImage3;
	}
	public int getProdQuantity(String prodID) throws SQLException {
		int prodQuantity = 0;
		rs = s.executeQuery("SELECT PRODQUANTITY FROM CART WHERE PRODID = \"" + prodID + "\"");
		while(rs.next()) {
			prodQuantity = rs.getInt(1);	
		}
		return prodQuantity;
	}
	public String getProdDesc(String prodID) throws SQLException {
		String prodDesc = "";
		rs = s.executeQuery("SELECT PRODDESC FROM CART WHERE PRODID = \"" + prodID + "\"");
		while(rs.next()) {
			prodDesc = rs.getString(1);	
		}
		return prodDesc;
	}
}
