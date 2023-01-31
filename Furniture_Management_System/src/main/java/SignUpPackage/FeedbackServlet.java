package SignUpPackage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class FeedbackServlet
 */
@WebServlet("/RedirectToHome.jsp")
public class FeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedbackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = (request.getParameter("form_name")==null ? null : request.getParameter("form_name"));
		System.out.println(name);
		String phno = (request.getParameter("form_phone")==null ? null : request.getParameter("form_phone"));
		System.out.println(phno);
		String reaction1 = (request.getParameter("upsetBox")==null ? null : request.getParameter("upsetBox"));
		String reaction2 = request.getParameter("okayBox")==null ? null : request.getParameter("okayBox");
		String reaction3 = request.getParameter("alrightBox")==null ? null : request.getParameter("alrightBox");
		String reaction4 = request.getParameter("happyBox")==null ? null : request.getParameter("happyBox");
		String reaction5 = request.getParameter("thrilledBox")==null ? null : request.getParameter("thrilledBox");
		String feedback = request.getParameter("feedbackText")==null ? null : request.getParameter("feedbackText");
		System.out.println(reaction1);
		System.out.println(reaction2);
		System.out.println(reaction3);
		System.out.println(reaction4);
		System.out.println(reaction5);
		
		FeedbackModel fml = null;
		FeedbackDB fdb = new FeedbackDB();
		if(reaction1!=null && feedback!=null) {
			fml = new FeedbackModel(SignInServlet.userEmail, name, phno, HomeServlet.transactionDate ,reaction1+", "+feedback );
			fdb.insertIntoCartDB(fml);
		}
		else if(reaction2!=null && feedback!=null) {
			fml = new FeedbackModel(SignInServlet.userEmail, name, phno,HomeServlet.transactionDate ,reaction2+", "+feedback );
			fdb.insertIntoCartDB(fml);
		}
		else if(reaction3!=null && feedback!=null) {
			fml = new FeedbackModel(SignInServlet.userEmail, name, phno,HomeServlet.transactionDate ,reaction3+", "+feedback );
			fdb.insertIntoCartDB(fml);
		}		
		else if(reaction4!=null && feedback!=null) {
			fml = new FeedbackModel(SignInServlet.userEmail, name, phno,HomeServlet.transactionDate ,reaction4+", "+feedback );
			fdb.insertIntoCartDB(fml);
		}		
		else if(reaction5!=null && feedback!=null) {
			fml = new FeedbackModel(SignInServlet.userEmail, name, phno,HomeServlet.transactionDate ,reaction5+", "+feedback );
			fdb.insertIntoCartDB(fml);
		}
		else if(feedback!=null) {
			fml = new FeedbackModel(SignInServlet.userEmail, name, phno,HomeServlet.transactionDate , "No reaction, " + feedback );
			fdb.insertIntoCartDB(fml);
		}
		
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/RedirectToHome.jsp");
		requestDispatcher.forward(request, response);
		return;
	}
	
}
