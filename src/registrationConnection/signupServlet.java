package registrationConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.DAO.userDAOImp;
//import com.DB.Dbconnection;
//import com.entity.Users;

import DAO.userdaoImp;
import DbConnection.Dbconnect;
import users.UserEntity;

/**
 * Servlet implementation class signupServlet
 */
@WebServlet("/signupServlet")
public class signupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public signupServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);

		try {
			String name = req.getParameter("name");
			String phone = req.getParameter("phone");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String check = req.getParameter("check");

			UserEntity us = new UserEntity();
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phone);
			us.setPassword(password);

			HttpSession session = req.getSession();
			if (check != null) {
				userdaoImp dao = new userdaoImp(Dbconnect.getCon());
				boolean f2=dao.checkUser(email);
					if(f2) {
					
					boolean f = dao.userRegister(us);

					if (f) {

						session.setAttribute("success", "Registratio is successful.....");
						resp.sendRedirect("signup.jsp");
					} else {

						session.setAttribute("Failed", "Plaease try again......");
						resp.sendRedirect("signup.jsp");
					}
					
					
				}else {
					
					session.setAttribute("Failed", "Your Email already present Please Login !");
					resp.sendRedirect("signup.jsp");
					
					
				}
			} else {
				session.setAttribute("Failed", "Plaease check terms and condition......");
				resp.sendRedirect("signup.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
	}
}
