package DAO;

import java.util.List;

import users.BookDetails;

public interface BooksDAO {
public boolean addBooks(BookDetails b);
public List<BookDetails> getAllBooks();

public BookDetails getBookById(int id);
public boolean updateEditBooks(BookDetails b);
public boolean deleteBook(int id);
public List<BookDetails> getNewBook();
public List<BookDetails> getRecentBook();
public List<BookDetails> getOldBook();
public List<BookDetails> getAllRecentBook();
public List<BookDetails> getAllNewBook();
public List<BookDetails> getAllOldBook();
public List<BookDetails> getBookByOld(String category,String email);
public boolean oldBookDelete(String email,String cat,int id);
public List<BookDetails> getBookBySearch(String ch);





}
