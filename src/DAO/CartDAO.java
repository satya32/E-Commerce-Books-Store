package DAO;

import java.util.List;

import users.BookDetails;
import users.Cart;

public interface CartDAO {
	public boolean AddCart(Cart c);
	public List<Cart> getBookByUser(int UserId);
	public boolean deleteBook(int bid, int uid ,int cid);
 

}
