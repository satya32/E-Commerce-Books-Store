package registrationConnection;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.BooksDAOImp;
import DbConnection.Dbconnect;

/**
 * Servlet implementation class deleteOldBook
 */
@WebServlet("/deleteOldBook")
public class deleteOldBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteOldBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email=req.getParameter("email");
			int bid=Integer.parseInt(req.getParameter("id"));
			System.out.print(email+ bid);
			BooksDAOImp dao=new BooksDAOImp(Dbconnect.getCon());
			boolean f=dao.oldBookDelete(email, "Old Book",bid);
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("success", " OldBook Deleted");
				resp.sendRedirect("old_books.jsp");
			}else {
				session.setAttribute("Failed", "something wrong");
				resp.sendRedirect("old_books.jsp");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
