package admin;

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
 * Servlet implementation class delete
 */
@WebServlet("/delete")
public class delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			BooksDAOImp dao = new BooksDAOImp(Dbconnect.getCon());
			boolean f=dao.deleteBook(id);
			HttpSession session = req.getSession();
			if(f) {
				session.setAttribute("success", "Book delete successfully.");
				resp.sendRedirect("Admin/all_books.jsp");
			}else {
				session.setAttribute("Failed", "Something wrong on server");
				resp.sendRedirect("Admin/all_books.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
