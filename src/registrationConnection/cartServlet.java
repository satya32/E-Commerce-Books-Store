package registrationConnection;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.BooksDAOImp;
import DAO.CartDAOImp;
import DbConnection.Dbconnect;
import users.BookDetails;
import users.Cart;

/**
 * Servlet implementation class cartServlet
 */
@WebServlet("/cartServlet")
public class cartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			BooksDAOImp dao=new BooksDAOImp(Dbconnect.getCon());
			BookDetails b=dao.getBookById(bid);
			Cart c=new Cart();
			c.setBid(bid);
			c.setUserId(uid);
			c.setBookName(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			CartDAOImp dao2= new CartDAOImp(Dbconnect.getCon()); 
			boolean f=dao2.AddCart(c);
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("addCart" ," Book Added to cart");
				resp.sendRedirect("all_newBooks.jsp");
				//System.out.println("added");
				
			}else {
				session.setAttribute("Failed" ,"Book not Added to Cart");
				resp.sendRedirect("all_newBooks.jsp");
				//System.out.println("error");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
