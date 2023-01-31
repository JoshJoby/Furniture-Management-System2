package SignUpPackage;
import java.sql.*;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/SignUp.jsp")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    UserDB udb;
    boolean isPageVisible = false;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        this.udb = new UserDB();
        // TODO Auto-generated constructor stub
    }
    
    public boolean getPageVisible() {
    	return isPageVisible;
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String newPassword2;
		char enc[] = password.toCharArray();
		char test[] = new char[password.length()];
		int i=0;
		for(char c : enc) {
			c += 7;
			test[i++] = c;
		}
		newPassword2 = new String(test);
		System.out.println(newPassword2);
		String name1 = request.getParameter("name1");
		String name2 = request.getParameter("name2");
		String gender = request.getParameter("radiogroup1");
		String address = request.getParameter("address");		
		String phno = request.getParameter("phno");
		String country = request.getParameter("country");
		String toc = request.getParameter("cb1");
		if(toc.equals("on")) toc = "1";
		else if (toc==null) toc = "0";
		String news = request.getParameter("cb2");
		if (news==null) news = "0";
		else if (news.equals("on")) news = "1";
		request.setAttribute("isPageVisible", isPageVisible);

		UserDB udb = new UserDB();
		if(udb.checkIfUserExistsInDB(email)) {
			System.out.println("User exists already!");
			isPageVisible = true;
			request.setAttribute("isPageVisible", isPageVisible);
		}
		else {
		isPageVisible = false;
		request.setAttribute("isPageVisible", isPageVisible);
		UserModel UM = new UserModel(email, newPassword2, name1, name2, gender, country, toc, news, address, phno);
		udb.insertUserIntoDB(UM);
		System.out.println("Successful account creation!");
		response.sendRedirect("SignIn.jsp");
		return;
		}
		
		
		
		
		
		// TODO Auto-generated method stub
		processRequest(request, response);	
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("isPageVisible", isPageVisible);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/SignUp.jsp");
		requestDispatcher.forward(request, response);
		return;
	}

}
