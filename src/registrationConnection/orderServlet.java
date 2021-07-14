package registrationConnection;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.BookOrderImp;
import DAO.CartDAOImp;
import DbConnection.Dbconnect;
import users.BookOrders;
//import users.BookDetails;
import users.Cart;

/**
 * Servlet implementation class orderServlet
 */
@WebServlet("/orderServlet")
public class orderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session=req.getSession();
			//int id=Integer.parseInt(req.getParameter("id"));
			int id=Integer.parseInt(req.getParameter("id"));
			System.out.println(id);
			String name=req.getParameter("name");
			String email=req.getParameter("email");
			String phone=req.getParameter("phone");
			String address=req.getParameter("address");
			String landmark=req.getParameter("landmark");
			String city=req.getParameter("city");
			String state=req.getParameter("state");
			String pincode=req.getParameter("pin");
			String payment=req.getParameter("payment");
			String fullAddress=address+","+ landmark+","+ city +","+ state +","+ pincode;
			//System.out.println(name+email+phone+fullAddress+payment);
			
			CartDAOImp dao=new CartDAOImp(Dbconnect.getCon());
			BookOrderImp dao2=new BookOrderImp(Dbconnect.getCon());
			//int i=dao2.getOrderNO();
			Random r=new Random();
			BookOrders o=null;
		    List<Cart> blist=dao.getBookByUser(id);
		    if(blist.isEmpty()) {
		    	session.setAttribute("Failed", "Add Items");
		    	resp.sendRedirect("checkout.jsp");
		    }else {
		    ArrayList<BookOrders> orderlist=new ArrayList<BookOrders>();
 		    for(Cart c:blist) {
 		    	o=new BookOrders();
 		   
 		    	
		    	o.setOder_Id("BOOK-ORD-00"+r.nextInt(1000));
		    	o.setUserName(name);
		    	o.setEmail(email);
		    	o.setPhone(phone);
		    	o.setFullAddress(fullAddress);
		    	o.setBookName(c.getBookName());
		    	o.setAuthor(c.getAuthor());
		    	o.setPrice(c.getPrice()+"");
		    	o.setPayment(payment);
		    	orderlist.add(o);
		     	//i++;
		    	//System.out.println(c.getBookName()+""+c.getAuthor()+""+c.getAuthor());
		    }
			
			
			if("noselect".equals(payment)) {
				session.setAttribute("Failed", "Choose Payment Method");
				resp.sendRedirect("checkout.jsp");
			}else {
				boolean f=dao2.saveOrders(orderlist);
				if(f) {
					resp.sendRedirect("order_success.jsp");
					//System.out.println("order success");
				}else {
					session.setAttribute("Failed", "Choose Payment Method");
					resp.sendRedirect("checkout.jsp");
					System.out.println("order failed");
				}
			}
		    }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
