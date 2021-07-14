package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

//import com.sun.org.apache.bcel.internal.generic.NEWARRAY;

import users.BookDetails;
import users.Cart;

public class CartDAOImp implements CartDAO{
 private Connection conn;
 public CartDAOImp(Connection conn) {
	 this.conn=conn;
	 
 }

	public boolean AddCart(Cart c) {
		boolean f=false;
		try {
			String sql="Insert into cart(bid,uid, bookName,author,price,totalPrice) values(?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, c.getBid());
			ps.setInt(2, c.getUserId());
			ps.setString(3, c.getBookName());
			ps.setString(4, c.getAuthor());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalPrice());
		int i=ps.executeUpdate();
		if(i==1) {
			f=true;
		}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return f;
	}

	
	public List<Cart> getBookByUser(int UserId) {
		List<Cart> list=new ArrayList<>();
		Cart c=null;
		double totalPrice=0.00;
		
		try {
			String sql="select * from cart where uid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, UserId);
			ResultSet st=ps.executeQuery();
			while(st.next()) {
				c=new Cart();
				c.setCid(st.getInt(1));
				c.setBid(st.getInt(2));
				c.setUserId(st.getInt(3));
				c.setBookName(st.getString(4));
				c.setAuthor(st.getString(5));
				c.setPrice(st.getDouble(6));
				totalPrice=totalPrice+st.getDouble(7);
				c.setTotalPrice(totalPrice);
				list.add(c);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	public boolean deleteBook(int bid, int uid,int cid) {
		boolean f=false;
		try {
			String sql="delete from Cart where bid=? and uid=? and cid=?";
			
				PreparedStatement st = conn.prepareStatement(sql);
				st.setInt(1, bid);
				st.setInt(2, uid);
				st.setInt(3, cid);
				int i=st.executeUpdate();
				if(i==1) {
					f=true;
				}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
		}
	
	

}
