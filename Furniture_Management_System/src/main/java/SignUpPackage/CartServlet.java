package SignUpPackage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import SignUpPackage.HomeServlet;
import java.sql.SQLException;
import java.util.LinkedList;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/cart.jsp")
public class CartServlet extends HttpServlet {
	public static boolean isAuth;
	private static final long serialVersionUID = 1L;
    String pName;
    LinkedList<CartModel> chosenProds = new LinkedList<CartModel>();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
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
	}	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			processRequest(request, response);
		} catch (ServletException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
//		System.out.println("\n\n" + request.getParameter("reloadTest") + "\n\n");
//		if(request.getParameter("reloadTest").equals("true")) {
//			System.out.println("page was refreshed ! ");
//		}
				
		
		isAuth = SignInServlet.isLoggedIn;
		String email = SignInServlet.userEmail;
		String name;
		UserDB udb = new UserDB();
		name = udb.getName(email);
		System.out.print(isAuth);
		request.setAttribute("isAuth", isAuth);
		request.setAttribute("name", name);			
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/cart.jsp");
		requestDispatcher.forward(request, response);
		return;
	}
}
