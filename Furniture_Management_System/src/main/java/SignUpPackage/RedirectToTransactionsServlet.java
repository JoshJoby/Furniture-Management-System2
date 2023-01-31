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

/**
 * Servlet implementation class RedirectToTransactionsServlet
 */
@WebServlet("/RedirectToTransactionPage.jsp")
public class RedirectToTransactionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public static LinkedList<InvoiceModel> selectedProds = new LinkedList<InvoiceModel>();
    public static String subtotal, tax, shipping, total;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RedirectToTransactionsServlet() {
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
		InvoiceDB idb = new InvoiceDB();
		CartDB cdb = new CartDB();
		if((request.getParameter("buttonTransactions") == null) ? false : true){
			for(CartModel cm : HomeServlet.chosenProds) {
				InvoiceModel invoiceModel = new InvoiceModel(
						HomeServlet.transactionID,
						(SignInServlet.userEmail),
						cm.getProdID(),
						(SignInServlet.userName),
						(SignInServlet.userAddress),
						(SignInServlet.userCountry),
						HomeServlet.transactionDate,
						cm.getProdName(),
						cm.getProdCost(),
						cm.getProdCategory(),
						cm.getProdSelectedQuantity(),
						cm.getTotalProdCost()
						);
				selectedProds.push(invoiceModel);
			}
			idb.insertIntoCartDB(selectedProds);
			HomeServlet.transactionID =(int)((Math.random()*(999999-100000) + 100000))+"";
			System.out.println("SUCCESS !");
			HomeServlet.chosenProds.clear();
			CartDB.existingProds.clear();
			cdb.clearCart(SignInServlet.userEmail);
		}
		
		if((request.getParameter("viewOrderHistoryBtn") == null) ? false : true){
			selectedProds = idb.getFullViewRows(SignInServlet.userEmail, (request.getParameter("viewOrderHistoryBtn")));
		}
		
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/RedirectToTransactionPage.jsp");
		requestDispatcher.forward(request, response);
		return;	
	}

}
