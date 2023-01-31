package SignUpPackage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedList;
import SignUpPackage.SignInServlet;
import SignUpPackage.CartDB;


/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/Redirect.jsp")
public class RedirectServlet extends HttpServlet {
	public static boolean isAuth;
	private static final long serialVersionUID = 1L;
    String pID;
    LinkedList<CartModel> chosenProds = new LinkedList<CartModel>();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RedirectServlet() {
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
	
	int getSelectedProdQuantity(String prodID) {
		int len = 0;
		return len;
		
	}

	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
//		System.out.println("\n\n" + request.getParameter("reloadTest") + "\n\n");
//		if(request.getParameter("reloadTest").equals("true")) {
//			System.out.println("page was refreshed ! ");
//		}
		
		ProdDB pdb = new ProdDB();
		CartDB cdb = new CartDB();
		if((request.getParameter("buttonProdCart") == null) ? false : true){
			   	CartModel cartmodel = null;
			   	int flag=0;
				System.out.println("Button is clicked! In home.jsp");
				String pID = (request.getParameter("buttonProdCart").toString());
				System.out.println(pID);
				System.out.println(SignInServlet.isLoggedIn + " This is the current sign in state!");

//				if(!SignInServlet.isLoggedIn) {
//					HomeServlet.chosenProds.clear();
//					CartDB.existingProds.clear();
//				}
				cdb.getExistingUserProducts(SignInServlet.userEmail);
				for(CartModel cm : CartDB.existingProds) {
					System.out.println(cm.getProdID());
					if(cm.getProdID().equals(pID)) {
						System.out.println("Element is present in the linked list of existing products within the database");
						cm.setProdSelectedQuantity(cm.getProdSelectedQuantity() + 1);
						cdb.updateProdQuantity(pID, SignInServlet.userEmail, cm.getProdSelectedQuantity(), cm.getProdCost());
//						flag=1;
						break;
					}
				}
				for(CartModel cm : HomeServlet.chosenProds) {
					System.out.println(cm.getProdID());
					if(cm.getProdID().equals(pID)) {
						System.out.println("Element is present in the linked list");
						cm.setProdSelectedQuantity(cm.getProdSelectedQuantity() + 1);
						cm.setTotalProdCost(cm.getProdSelectedQuantity() * cm.getProdCost());
						flag=1;
						break;
					}
				}
				if(flag==0) {
				try {
					 cartmodel = new CartModel(
							pdb.getProdID(pID),
							pdb.getProdName(pID),
							pdb.getProdImage1(pID),
							pdb.getProdDesc(pID),
							pdb.getProdPrice(pID),
							pdb.getProdQuantity(pID),
							pdb.getProdPrice(pID)*1, 
							1,
							pdb.getProdCategory(pID));
					 HomeServlet.chosenProds.push(cartmodel);
					 HomeServlet.chosenProds.sort((a,b)->(a.getProdName()).compareTo(b.getProdName()));

					 cartmodel = new CartModel( 
//							(String)request.getAttribute("email"),
							pdb.getProdID(pID),
							pdb.getProdName(pID),
							pdb.getProdImage1(pID),
							pdb.getProdDesc(pID),
							pdb.getProdPrice(pID),
							pdb.getProdQuantity(pID),
							pdb.getProdPrice(pID)*1, 
							1,
							pdb.getProdCategory(pID));
					cdb.insertIntoCartDB(SignInServlet.userEmail, cartmodel);
							 
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				}

				request.setAttribute("chosenProds", HomeServlet.chosenProds);
				for(CartModel cm : HomeServlet.chosenProds) {
				System.out.println("___________________________________");
				System.out.println(cm.getProdImage());
				System.out.println(cm.getProdDesc());
				System.out.println(cm.getProdCost());
				System.out.println(cm.getProdQuantity());
				System.out.println(cm.getTotalProdCost());
			}
		}
		
		String pID;
		if((request.getParameter("removeButton") == null) ? false : true){
			pID = (request.getParameter("removeButton"));
			System.out.println("Remove Button is clicked for : " + (request.getParameter("removeButton")));
			CartModel cartmodel = null;
			for(CartModel cm : HomeServlet.chosenProds) {
				if(cm.getProdID().equals(pID)) {
					HomeServlet.chosenProds.remove(cm);
					CartDB.existingProds.remove(cm);
					cdb.removeProductFromDB(SignInServlet.userEmail, pID);
					break;
				}
			}
			request.setAttribute("chosenProds", HomeServlet.chosenProds);
			System.out.println("Product removed : " + pID);
			for(CartModel cm : HomeServlet.chosenProds) {
			System.out.println("___________________________________");
			System.out.println(cm.getProdID());
			System.out.println(cm.getProdImage());
			System.out.println(cm.getProdDesc());
			System.out.println(cm.getProdCost());
			System.out.println(cm.getProdQuantity());
			System.out.println(cm.getTotalProdCost());
		}

		}
		else{System.out.println("Remove Button is not clicked!");}	
		
		isAuth = SignInServlet.isLoggedIn;
		String email = SignInServlet.userEmail;
		String name;
		UserDB udb = new UserDB();
		name = udb.getName(email);
		System.out.print(isAuth);
		request.setAttribute("isAuth", isAuth);
		request.setAttribute("name", name);			
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/Redirect.jsp");
		requestDispatcher.forward(request, response);
		return;
	}
}
