package SignUpPackage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet implementation class ProdServlet
 */
@WebServlet("/prod.jsp")
public class ProdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static boolean isAuth;
    public static String pName;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProdServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if((request.getParameter("buttonProd") == null) ? false : true){
			System.out.println("Button is clicked!");
			pName = (request.getParameter("buttonProd").toString());
//			System.out.println((request.getParameter("buttonProd").toString()));
			request.setAttribute("product", pName);
			}
			else{System.out.println("More Info Button is not clicked!");}
		
		if((request.getParameter("buttonNotLoggedIn") == null) ? false : true){
			System.out.println("Button is clicked! but not logged in");
			pName = (request.getParameter("buttonNotLoggedIn").toString());
//			System.out.println((request.getParameter("buttonProd").toString()));
			request.setAttribute("product", pName);
			}
			else{System.out.println("More Info Button is not clicked!");}
		try {		
//			pName = HomeServlet.productName;
//			System.out.println(pName);
//			request.setAttribute("productName", pName);


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
		isAuth = SignInServlet.isLoggedIn;
		String email = SignInServlet.userEmail;
		String name;
		UserDB udb = new UserDB();
		ProdDB pdb = new ProdDB();
		name = udb.getName(email);
		System.out.print(isAuth);
		request.setAttribute("isAuth", isAuth);
		request.setAttribute("name", name);		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/prod.jsp");
		requestDispatcher.forward(request, response);
		return;
	}

}
