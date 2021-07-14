package users;

public class BookOrders {
	private int id;
	private String oder_Id;
	private String author;
	private String BookName;
	private String userName;
	private String email;
	private String phone;
	private String fullAddress;
	private String payment;
	private String price;

	public BookOrders() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public String getPrice() {
		return price;
	}


	public void setPrice(String price) {
		this.price = price;
	}


	public String getBookName() {
		return BookName;
	}


	public void setBookName(String bookName) {
		BookName = bookName;
	}


	public String getAuthor() {
		return author;
	}


	public void setAuthor(String author) {
		this.author = author;
	}


	public String getOder_Id() {
		return oder_Id;
	}


	public void setOder_Id(String oder_Id) {
		this.oder_Id = oder_Id;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFullAddress() {
		return fullAddress;
	}

	public void setFullAddress(String fullAddress) {
		this.fullAddress = fullAddress;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	@Override
	public String toString() {
		return "BookOrders [id=" + id + ", userName=" + userName + ", email=" + email + ", phone=" + phone
				+ ", fullAddress=" + fullAddress + ", payment=" + payment + "]";
	}

}
