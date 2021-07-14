package users;

public class BookDetails {
	private int bookID;
	private String bookName;
	private String author;
	private String price;
	private String categories;
	private String status;
	private String photo;
	private String email;

	public BookDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public BookDetails(String bookName, String author, String price, String categories, String status, String photo,
			String email) {
		super();
		this.bookName = bookName;
		this.author = author;
		this.price = price;
		this.categories = categories;
		this.status = status;
		this.photo = photo;
		this.email = email;
	}



	public int getBookID() {
		return bookID;
	}

	public void setBookID(int bookID) {
		this.bookID = bookID;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getCategories() {
		return categories;
	}

	public void setCategories(String categories) {
		this.categories = categories;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "BookDetails [bookID=" + bookID + ", bookName=" + bookName + ", author=" + author + ", price=" + price
				+ ", categories=" + categories + ", status=" + status + ", photo=" + photo + ", email=" + email + "]";
	}

}
