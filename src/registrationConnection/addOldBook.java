package registrationConnection;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import DAO.BooksDAOImp;
import DbConnection.Dbconnect;
import users.BookDetails;

/**
 * Servlet implementation class addOldBook
 */
@WebServlet("/addOldBook")
@MultipartConfig
public class addOldBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addOldBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse respo) throws ServletException, IOException {
		try {
			String bookName = req.getParameter("name");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String categories = "Old Book";
			String status = "Active";
			Part part = req.getPart("image");
			String useremail=req.getParameter("userobj");
			String fileName = part.getSubmittedFileName();
			//System.out.print("selected image file name"+ fileName);
			BookDetails b = new BookDetails(bookName, author, price, categories, status, fileName,useremail);
			 //System.out.print(b);
			BooksDAOImp dao = new BooksDAOImp(Dbconnect.getCon());
			String path=getServletContext().getRealPath("")+"books";
			//System.out.print(path);
			File file=new File(path);
			part.write(path + File.separator +fileName);
			boolean f = dao.addBooks(b);
			HttpSession session = req.getSession();
			
			if (f) {
				session.setAttribute("success", "Book add successfully.");
				respo.sendRedirect("sell_book.jsp");

			} else {
				session.setAttribute("Failed", "Something wrong on server");
				respo.sendRedirect("sell_books.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
