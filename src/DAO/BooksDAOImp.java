package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import users.BookDetails;

public class BooksDAOImp implements BooksDAO{
	private Connection conn;
	
	public BooksDAOImp(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addBooks(BookDetails b) {
		boolean f=false;
		try {
			String sql="Insert into bookdetails(bookName,author,price,bookCategory,status,photos,email) values(?,?,?,?,?,?,?)";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, b.getBookName());
			st.setString(2, b.getAuthor());
			st.setString(3, b.getPrice());
			st.setString(4, b.getCategories() );
			st.setString(5, b.getStatus());
			st.setString(6, b.getPhoto());
			st.setString(7, b.getEmail());
		int i=	st.executeUpdate();
		if(i==1) {
			f=true;
			
		}

		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return f;
	}

	
	public List< BookDetails> getAllBooks() {
		List<BookDetails> list =new ArrayList<>();
		BookDetails b=null;
		try {
			String sql="select * from bookdetails";
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs=st.executeQuery();
			while(rs.next()) {
				b=new BookDetails();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategories(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	
	public BookDetails getBookById(int id) {
		BookDetails b=null;
		try {
			String sql="select * from bookdetails where book_ID=?";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setInt(1, id);
			ResultSet rs=st.executeQuery();
			while(rs.next()) {
				b=new BookDetails();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategories(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	
	public boolean updateEditBooks(BookDetails b) {
		boolean f=false;
		try {
			String sql="update bookdetails set bookName=?,author=?,price=?,status=? where  book_ID=? ";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, b.getBookName());
			st.setString(2, b.getAuthor());
			st.setString(3, b.getPrice());	
			st.setString(4, b.getStatus());
			st.setInt(5, b.getBookID());
			int i=st.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	
	public boolean deleteBook(int id) {
		boolean f=false;
		String sql="delete from bookdetails where book_ID=?";
		try {
			PreparedStatement st = conn.prepareStatement(sql);
			st.setInt(1, id);
			int i=st.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return f;
	}

	
	public List<BookDetails> getNewBook() {
		List<BookDetails> list =new ArrayList<>();
		BookDetails b=null;
		try {
			String sql="select * from bookdetails where bookCategory=? and status=? order by book_ID DESC ";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, "New Book");
			st.setString(2, "Active");
			
			ResultSet rs=st.executeQuery();
			int i=1;
			
			while(rs.next()&&i<=4) {
				b=new BookDetails();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategories(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	
	public List<BookDetails> getRecentBook() {
		List<BookDetails> list =new ArrayList<>();
		BookDetails b=null;
		try {
			String sql="select * from bookdetails where status=? order by book_ID DESC ";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, "Active");
			
			ResultSet rs=st.executeQuery();
			int i=1;
			
			while(rs.next()&&i<=4) {
				b=new BookDetails();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategories(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}

	
	public List<BookDetails> getOldBook() {
		List<BookDetails> list =new ArrayList<>();
		BookDetails b=null;
		try {
			String sql="select * from bookdetails where bookCategory=? and status=? order by book_ID DESC ";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, "Old Book");
			st.setString(2, "Active");
			
			ResultSet rs=st.executeQuery();
			int i=1;
			
			while(rs.next()&&i<=4) {
				b=new BookDetails();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategories(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	
	public List<BookDetails> getAllRecentBook() {
		List<BookDetails> list =new ArrayList<>();
		BookDetails b=null;
		try {
			String sql="select * from bookdetails where status=? order by book_ID DESC ";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, "Active");
			
			ResultSet rs=st.executeQuery();
			
			
			while(rs.next()) {
				b=new BookDetails();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategories(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
		
	}

	
	public List<BookDetails> getAllNewBook() {
		List<BookDetails> list =new ArrayList<>();
		BookDetails b=null;
		try {
			String sql="select * from bookdetails where bookCategory=? and status=? order by book_ID DESC ";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, "New Book");
			st.setString(2, "Active");
			
			ResultSet rs=st.executeQuery();
	
			
			while(rs.next()) {
				b=new BookDetails();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategories(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}

	
	public List<BookDetails> getAllOldBook() {
		List<BookDetails> list =new ArrayList<>();
		BookDetails b=null;
		try {
			String sql="select * from bookdetails where bookCategory=? and status=? order by book_ID DESC ";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, "Old Book");
			st.setString(2, "Active");
			
			ResultSet rs=st.executeQuery();
			
			
			while(rs.next()) {
				b=new BookDetails();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategories(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}

	
	public List<BookDetails> getBookByOld(String email, String cate) {
		List<BookDetails> list =new ArrayList<>();
		BookDetails b=null;
		try {
			String sql="select * from bookdetails where bookCategory=? and email=? ";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, cate);
			st.setString(2, email);
			
			ResultSet rs=st.executeQuery();
			
			
			while(rs.next()) {
				b=new BookDetails();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategories(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}

	
	public boolean oldBookDelete(String email, String cat,int id) {
		boolean f=false;
		try {
			String sql="select * from bookdetails where bookCategory=? and email=? and book_ID=? ";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, cat);
			st.setString(2, email);
			st.setInt(3, id);
			int i=st.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	
	public List<BookDetails> getBookBySearch(String ch) {
		List<BookDetails> list =new ArrayList<>();
		BookDetails b=null;
		try {
			String sql="select * from bookdetails where bookName like ? or author like ? or bookCategory like ? and status=? ";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, "%"+ch+"%");
			st.setString(2,"%"+ch+"%");
			st.setString(3,"%"+ch+"%");
			st.setString(4,"Active");
			
			ResultSet rs=st.executeQuery();
			
			
			while(rs.next()) {
				b=new BookDetails();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategories(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}

	
	
 
}
