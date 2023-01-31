package SignUpPackage;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;
public class ProdDB {
	static Connection con;
	static Statement s;
	ResultSet rs;
	
	public ProdDB() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/USERDB1", "root", "root");
			s = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			s.executeUpdate("CREATE DATABASE IF NOT EXISTS USERDB1");
			s.executeUpdate("USE USERDB1");
			s.executeUpdate("CREATE TABLE IF NOT EXISTS PRODUCTS (PRODID VARCHAR(30) PRIMARY KEY, PRODNAME VARCHAR(100), PRODPRICE FLOAT(9,2), PRODRATING INT, PRODIMAGE1 VARCHAR(100), PRODQUANTITY INT, PRODDESC VARCHAR(500), PRODCATEGORY VARCHAR(50))");
			insertProducts();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	} 
	
	public void insertProducts() {
		boolean flag;
		try {
			rs = s.executeQuery("SELECT * FROM PRODUCTS");
			int x = 0;
			while(rs.next())
				x++;
				
			if(x==0) 
				flag = false;
			else
				flag = true;
			String[] categories = {"Table", "Sofa", "Bed"};
			
			if(!flag) {
				
				s.executeUpdate("INSERT INTO PRODUCTS VALUES(\'product1\', \'Large size white swing chair with free accessiories\', 969.99 , 4, "
						+ " \'assets/prodImages/swing_chair_1.jpeg\',"
						+ " 50,"						
				 		+ "\'Material                                               :  Cotton, <br>\r\n"
				 		+ "Colour                                                 : White, <br>\r\n"
				 		+ "Brand                                                  : Patiofy, <br>\r\n"
				 		+ "Product Dimensions                           : 35L x 30W Centimeters, <br>\r\n"
				 		+ "Maximum Weight Recommendation  :   120 Kilograms, <br>\r\n"
				 		+ "Item Weight                                        :     2 Kilograms, <br>\r\n"
				 		+ "Seating Capacity                                :1.00 <br>\', "
				 		+ "\'Chair\');");
				
				
				s.executeUpdate("INSERT INTO PRODUCTS VALUES(\'product2\', \'Square cushioned wooden stool\', " + 3295 + ".99 , 5, "
						+ " \'assets/prodImages/square_stool_2.jpeg\',"
						+ " 10,"
				 		+ "\'Product Dimensions    :     40D x 40W x 35H Centimeters, <br>\r\n"
				 		+ "Colour                          :  Gold, <br>\r\n"
				 		+ "Brand                           :   THE GOOD THINGS INC, <br>\r\n"
				 		+ "Base Material              : Wood, <br>\r\n"
				 		+ "Frame Material           : Wood, <br>\r\n"
				 		+ "Item Shape    :    Square, <br>\r\n"
				 		+ "Seat Height    :    20 Inches, <br>\r\n"
				 		+ "Item Weight     :   3 Kilograms, <br>\r\n"
				 		+ "Care Instructions   :     Vacuum Cleaning, <br>\r\n"
				 		+ "Size     :   16X16X14, <br>\', "
				 		+ "\'Stool\');");
				
				
				s.executeUpdate("INSERT INTO PRODUCTS VALUES(\'product3\', \'Beautiful antique wooden  table\', " + 399 + ".99 , 4, "
						+ " \'assets/prodImages/antique_table_3.jpeg\',"
						+ " 30,"
				 		+ "\'Product Dimensions  :      30D x 30W x 33H Centimeters, <br>\r\n"
				 		+ "Colour    :    White, <br>Item Shape      :  Round, <br>\r\n"
				 		+ "Brand     :   UHUD CRAFTS, <br>\r\n"
				 		+ "Table design       : End Table, <br>\r\n"
				 		+ "Special Feature       : Collapsible, <br>\r\n"
				 		+ "Style      :  Modern, <br>\r\n"
				 		+ "Seating Capacity   :     1.00, <br>\r\n"
				 		+ "Room Type    :    Living Room, <br>\r\n"
				 		+ "Top Material     :    Wood, Mango Wood, <br>\', "
				 		+ "\'Table\');");
		
				
				for(int i=4; i<75; i++) {

				s.executeUpdate("INSERT INTO PRODUCTS VALUES(\'product" + i + "\', \'productName" + i + " and cats and dogs and cats and dogs and cats and dogs and cats and dogs and cats\', " + i*1000 + ".99 , 3"
						 + ",  \'https://picsum.photos/id/"+ i +"/1000/1000.jpg\',"
						 		+ " 20, \'This is Product Number " + i + " and is designed for testing purposes. Handle with care and perform all the required tests!\', \'" + categories[i%3] +"\');");
				}
			}
			else {
				System.out.println("Records already exist!");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public ResultSet getAllProducts() throws SQLException {
		rs = s.executeQuery("SELECT * FROM PRODUCTS");	
		return rs;
	}
	
	public ResultSet getCorrectProduct(String pName) throws SQLException {
		rs = s.executeQuery("SELECT * FROM PRODUCTS WHERE PRODNAME = \'" + pName + "\'");
		return rs;
	}
	
	public ResultSet getSimilarProducts(String pName) throws SQLException {
		rs = s.executeQuery("SELECT * FROM PRODUCTS WHERE PRODNAME LIKE \'" + pName.substring(0,3) + "%\'");	
		return rs;

	}
	
	public ResultSet checkIfProdExistsInDB(String pName) {        //imma use for search results
		boolean flag = false;
		try {
			System.out.println(pName);
			rs = s.executeQuery("SELECT * FROM PRODUCTS WHERE PRODNAME = \'" + pName + "\'");	
			int x = 0;
			while(rs.next())
				x++;
			if(x==0) 
				System.out.println("Not found, viewing similar results");
			else {
				System.out.println("Product found directly");
				rs.beforeFirst();
				return rs;
			}

			rs.beforeFirst();
			
			rs = s.executeQuery("SELECT * FROM PRODUCTS WHERE PRODNAME LIKE \'" + pName.substring(0,3) + "%\'");	
			x = 0;
			while(rs.next())
				x++;
			if(x==0) {
				System.out.println("Not found at all");
				return null;
			}
			else {
				System.out.println("Found similar results");
				rs.beforeFirst();
				return rs;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	
	public String getProdID(String prodID) {
		return prodID;
	}
	
	public String getProdName(String prodID) throws SQLException {
		String prodName = "";
		rs = s.executeQuery("SELECT PRODNAME FROM PRODUCTS WHERE PRODID = \"" + prodID + "\"");
		while(rs.next()) {
			prodName = rs.getString(1);	
		}
		return prodName;
	}
	public float getProdPrice(String prodID) throws SQLException {
		float prodPrice = 0.0f;
		rs = s.executeQuery("SELECT PRODPRICE FROM PRODUCTS WHERE PRODID = \"" + prodID + "\"");
		while(rs.next()) {
			prodPrice = rs.getFloat(1);	
		}
		return prodPrice;
	}
	public int getProdRating(String prodID) throws SQLException {
		int prodRating = 0;
		rs = s.executeQuery("SELECT PRODRATING FROM PRODUCTS WHERE PRODID = \"" + prodID + "\"");
		while(rs.next()) {
			prodRating = rs.getInt(1);	
		}
		return prodRating;
	}
	public String getProdImage1(String prodID) throws SQLException {
		String prodImage1 = "";
		rs = s.executeQuery("SELECT PRODIMAGE1 FROM PRODUCTS WHERE PRODID = \"" + prodID + "\"");
		while(rs.next()) {
			prodImage1 = rs.getString(1);	
		}
		return prodImage1;
	}
	public String getProdImage2(String prodID) throws SQLException {
		String prodImage2 = "";
		rs = s.executeQuery("SELECT PRODIMAGE2 FROM PRODUCTS WHERE PRODID = \"" + prodID + "\"");
		while(rs.next()) {
			prodImage2 = rs.getString(1);	
		}
		return prodImage2;
	}
	public String getProdImage3(String prodID) throws SQLException {
		String prodImage3 = "";
		rs = s.executeQuery("SELECT PRODIMAGE3 FROM PRODUCTS WHERE PRODID = \"" + prodID + "\"");
		while(rs.next()) {
			prodImage3 = rs.getString(1);	
		}
		return prodImage3;
	}
	public int getProdQuantity(String prodID) throws SQLException {
		int prodQuantity = 0;
		rs = s.executeQuery("SELECT PRODQUANTITY FROM PRODUCTS WHERE PRODID = \"" + prodID + "\"");
		while(rs.next()) {
			prodQuantity = rs.getInt(1);	
		}
		return prodQuantity;
	}
	public String getProdDesc(String prodID) throws SQLException {
		String prodDesc = "";
		rs = s.executeQuery("SELECT PRODDESC FROM PRODUCTS WHERE PRODID = \"" + prodID + "\"");
		while(rs.next()) {
			prodDesc = rs.getString(1);	
		}
		return prodDesc;
	}
	
	public String getProdCategory(String prodID) throws SQLException {
		String prodDesc = "";
		rs = s.executeQuery("SELECT PRODCATEGORY FROM PRODUCTS WHERE PRODID = \"" + prodID + "\"");
		while(rs.next()) {
			prodDesc = rs.getString(1);	
		}
		return prodDesc;
	}
}
