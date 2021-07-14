package DAO;

import java.util.List;

import users.BookOrders;

public interface BookOrderDAO {
	
	public boolean saveOrders(List<BookOrders> blist);
	public List<BookOrders> getBook(String email);
	public List<BookOrders> getAllBook();

}
