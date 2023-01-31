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
 * Servlet implementation class DashboardServlet
 */
@WebServlet("/dashboard.jsp")
public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static boolean isAuth;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashboardServlet() {
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
		UserDB udb = new UserDB();
		if((request.getParameter("updateUserDetailsBtn") == null) ? false : true){
			try {
				if(((request.getParameter("nameUpdate")).length()!=0) && !(request.getParameter("nameUpdate").equals(SignInServlet.userName1))) {
					
					udb.setName(SignInServlet.userEmail, request.getParameter("nameUpdate"));
					SignInServlet.userName1 = request.getParameter("nameUpdate");
				}
				
				if(((request.getParameter("surnameUpdate")).length()!=0) && !(request.getParameter("surnameUpdate").equals(SignInServlet.userName2))) {
					udb.setName2(SignInServlet.userEmail, request.getParameter("surnameUpdate"));
					SignInServlet.userName2 = request.getParameter("surnameUpdate");

				}	
				
				if(((request.getParameter("phnoUpdate")).length()!=0) && !(request.getParameter("phnoUpdate").equals(SignInServlet.userPhoneno))) {
					udb.setPhoneno(SignInServlet.userEmail, request.getParameter("phnoUpdate"));
					SignInServlet.userPhoneno = request.getParameter("phnoUpdate");

				}	
				
				if(((request.getParameter("addressUpdate")).length()!=0) && !(request.getParameter("addressUpdate").equals(SignInServlet.userAddress))) {
					udb.setAddress(SignInServlet.userEmail, request.getParameter("addressUpdate"));
					SignInServlet.userAddress = request.getParameter("addressUpdate");

				}	
				
				if(((request.getParameter("genderUpdate")).length()!=0) && !(request.getParameter("genderUpdate").equals(SignInServlet.userGender))) {
					udb.setGender(SignInServlet.userEmail, request.getParameter("genderUpdate"));
					SignInServlet.userGender = request.getParameter("genderUpdate");

				}	
				
				if(((request.getParameter("countryUpdate")).length()!=0) && !(request.getParameter("countryUpdate").equals(SignInServlet.userCountry))) {
					udb.setCountry(SignInServlet.userEmail, request.getParameter("countryUpdate"));
					SignInServlet.userCountry = request.getParameter("countryUpdate");

				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		if((request.getParameter("updatePasswordBtn") == null) ? false : true){
			try {
				if(udb.loginCheck(SignInServlet.userEmail, request.getParameter("oldPassword"))) {
					if(request.getParameter("newPassword").equals(request.getParameter("newPassword2"))) {
						udb.updatePassword(SignInServlet.userEmail, request.getParameter("newPassword"));
					}
					else System.out.println("Passwords do not match");
				}
				else System.out.println("Incorrect password");
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		
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
		name = udb.getName(email);
		System.out.print(isAuth);
		request.setAttribute("isAuth", isAuth);
		request.setAttribute("name", name);	RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/dashboard.jsp");
		requestDispatcher.forward(request, response);
		return;
	}

}
