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
import users.BookDetails;

/**
 * Servlet implementation class editBooks
 */
@WebServlet("/editBooks")
public class editBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editBooks() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String bookName = req.getParameter("name");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			//String categories = req.getParameter("categories");
			String status = req.getParameter("status");
			BookDetails b=new BookDetails();
			b.setBookID(id);
			b.setBookName(bookName);
			b.setAuthor(author);
			b.setStatus(status);
			b.setPrice(price);
			BooksDAOImp dao = new BooksDAOImp(Dbconnect.getCon());
			boolean f=dao.updateEditBooks(b);
			HttpSession session = req.getSession();
			if(f) {
				session.setAttribute("success", "Book update successfully.");
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
