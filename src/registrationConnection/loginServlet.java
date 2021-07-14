package registrationConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

//import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			userdaoImp dao=new userdaoImp(Dbconnect.getCon());
			
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			//System.out.print(email+" "+password);
			HttpSession session= req.getSession();
		if("admin@gmail.com".equals(email)&&"admin".equals(password)) 
		    {
				UserEntity us=new UserEntity();
				us.setName("admin");
				//System.out.println(us);
				session.setAttribute("user", us);
				resp.sendRedirect("Admin/home.jsp");
			}
	  else {
				UserEntity us=dao.login(email, password);
				//System.out.println(us);
				if(us!=null)
				{
					   session.setAttribute("user", us);
					//System.out.println(us);
				    resp.sendRedirect("index.jsp");
				}
				else {
						session.setAttribute("Failed", "email or password invalid");
						resp.sendRedirect("login.jsp");
					
				    }
				
			resp.sendRedirect("userhome.jsp");
				//resp.sendRedirect("userhome.jsp");
		}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
			
		


