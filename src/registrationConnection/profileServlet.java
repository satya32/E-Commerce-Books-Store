package registrationConnection;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.userdaoImp;
import DbConnection.Dbconnect;
import users.UserEntity;

/**
 * Servlet implementation class profileServlet
 */
@WebServlet("/profileServlet")
public class profileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public profileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			//System.out.print(id);
			String name = req.getParameter("name");
			String phone = req.getParameter("phone");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			UserEntity us=new UserEntity();
			//System.out.print(us);
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phone);
			HttpSession session = req.getSession();

			userdaoImp dao=new userdaoImp(Dbconnect.getCon());
			boolean f=dao.checkPassword(id, password);
			//System.out.print(f);
		if(f) {
				
				boolean f2=dao.updateProfile(us);
				
				if(f2){
					session.setAttribute("success", "Profile Update  successful.....");
					resp.sendRedirect("edit_profile.jsp");
				}else {
					session.setAttribute("Failed", "Something wrong on server.....");
					resp.sendRedirect("edit_profile.jsp");
				}
				
				
		}else {
				session.setAttribute("Failed", "Your Password is incurrect");
				resp.sendRedirect("edit_profile.jsp");
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
