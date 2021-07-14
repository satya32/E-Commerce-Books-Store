package registrationConnection;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CartDAOImp;
import DbConnection.Dbconnect;

/**
 * Servlet implementation class removeServlet
 */
@WebServlet("/removeServlet")
public class removeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public removeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bid=Integer.parseInt(req.getParameter("bid"));
		int uid=Integer.parseInt(req.getParameter("uid"));
		int cid=Integer.parseInt(req.getParameter("cid"));
		CartDAOImp dao=new CartDAOImp(Dbconnect.getCon());
		boolean f=dao.deleteBook(bid,uid,cid);
		HttpSession session=req.getSession();
		if(f) {
			session.setAttribute("success", "Book removed from cart");
			resp.sendRedirect("checkout.jsp");
		}else {
			session.setAttribute("Failed", "something wrong");
			resp.sendRedirect("checkout.jsp");
		}
	}

}
