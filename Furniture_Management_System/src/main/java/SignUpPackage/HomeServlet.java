package SignUpPackage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.LinkedList;
import java.util.Locale;

import SignUpPackage.SignInServlet;
/**
 * Servlet implementation class SignInServlet
 */
@WebServlet("/home.jsp")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static boolean isAuth;
	public static String productName;
   	public static LinkedList<CartModel> chosenProds = new LinkedList<CartModel>();
	public static String transactionID =(int)((Math.random()*(999999-100000) + 100000))+"";
	public static String transactionDate = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH).format(LocalDateTime.now());
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeServlet() {
    	ProdDB pdb = new ProdDB();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {
			processRequest(request, response);
		} catch (ServletException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		response.getWriter().append("Served at: ").append(request.getContextPath());

	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if((request.getAttribute("buttonProd") == null) ? false : true){
		System.out.println("Button is clicked!");
		request.setAttribute("product", "product1");
		}
		else{System.out.println("Button is not clicked!");}	
		try {
			processRequest(request, response);
		} catch (ServletException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {

		

		
		isAuth = SignInServlet.isLoggedIn;
		String email = SignInServlet.userEmail;
		String name;
		UserDB udb = new UserDB();
		CartDB cdb = new CartDB();
		name = udb.getName(email);
		System.out.print(isAuth);
//		productName = request.getAttribute("product").toString();
		request.setAttribute("isAuth", isAuth);
		request.setAttribute("name", name);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/home.jsp");
		requestDispatcher.forward(request, response);
		return;
	}

}
