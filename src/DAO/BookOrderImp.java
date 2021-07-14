package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import users.BookOrders;

public class BookOrderImp implements BookOrderDAO {
	private Connection conn;

	public BookOrderImp(Connection conn) {
		super();
		this.conn = conn;
	}

	

	public boolean saveOrders(List<BookOrders> blist) {
		boolean f = false;
		try {
			String sql = "insert into bookorders(orderId,userName,email,address,phone,bookName,author,price,payment) values(?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps=conn.prepareStatement(sql);
			for(BookOrders b:blist) {
				ps.setString(1, b.getOder_Id());
				ps.setString(2, b.getUserName());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getFullAddress());
				ps.setString(5, b.getPhone());
				ps.setString(6, b.getBookName());
				ps.setString(7, b.getAuthor());
				ps.setString(8, b.getPrice());
				ps.setString(9, b.getPayment());
				ps.addBatch();
				
			}
		int[] count=ps.executeBatch();
		conn.commit();
		f=true;
		conn.setAutoCommit(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}



	
	public List<BookOrders> getBook(String email) {
		List<BookOrders> list=new ArrayList<>();
		BookOrders o=null;
		try {
			String sql="select * from bookorders where email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				o=new BookOrders();
				o.setId(rs.getInt(1));
				o.setOder_Id(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFullAddress(rs.getString(5));
				o.setPhone(rs.getString(6));
				o.setBookName(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPayment(rs.getString(10));
				list.add(o)	;		
				}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}




	public List<BookOrders> getAllBook() {
		List<BookOrders> list=new ArrayList<>();
		BookOrders o=null;
		try {
			String sql="select * from bookorders ";
			PreparedStatement ps=conn.prepareStatement(sql);
			//ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				o=new BookOrders();
				o.setId(rs.getInt(1));
				o.setOder_Id(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFullAddress(rs.getString(5));
				o.setPhone(rs.getString(6));
				o.setBookName(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPayment(rs.getString(10));
				list.add(o)	;		
				}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}

}
