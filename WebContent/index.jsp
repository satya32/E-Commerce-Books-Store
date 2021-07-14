<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="DAO.BooksDAOImp"%>
<%@ page import="DbConnection.Dbconnect"%>
<%@ page import="users.BookDetails"%>
<%@ page import="users.UserEntity"%>
<%@ page import="java.util.List"%>

<%@ page import="users.BookDetails"%>
<%-- --<jsp:directive.page import="com.DB.Dbconnection"/>--%>
<%-- <%@ page import="com.DB.Dbconnection" %> --%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-Book</title>
<%@include file="all-components/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("image/sp.jpg");
	height: 50vh;
	background-size: cover;
	background-repeat: no-repeat;
}

.card:hover {
	background-color: #efdcdc;
}
</style>
</head>
<body style="background-color: #f7eeee">
	<%
		UserEntity us = (UserEntity) session.getAttribute("user");
	%>
	<%@ include file="all-components/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-danger">E-Commerce Books Store</h2>

	</div>
	<%--
	<% Connection conn=Dbconnection.getCon();
	out.println(conn);
	%>
	--%>
	<!--  Start Recent book container -->

	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
			<%
				BooksDAOImp dao2 = new BooksDAOImp(Dbconnect.getCon());
				List<BookDetails> list2 = dao2.getRecentBook();
				for (BookDetails b : list2) {
			%>
			<div class="col-md-3  ">
				<div class="card crd-ho ">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p>
							Book :
							<%=b.getBookName()%></p>
						<p>
							Author:
							<%=b.getAuthor()%></p>
						<p>
							<%
								if (b.getCategories().equals("Old Book")) {
							%>
							Categories:
							<%=b.getCategories()%></p>
						<div class="footer">
							<a href="viewsBooks.jsp?bid=<%=b.getBookID()%>"
								class="btn btn-success btn-sm "> View Details</a> <a href=""
								class="btn btn-danger btn-sm"><i class="fas fa-rupee-sign"></i>
								<%=b.getPrice()%></a>
						</div>
						<%
							} else {
						%>
						Categories:<%=b.getCategories()%></p>
						<div class="footer">
							<%
								if (us == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm "><i class="fas fa-cart-arrow-down"></i>Add Cart</a>
							<%
								} else {
							%>
							<a
								href="cartServlet?bid=<%=b.getBookID()%>&&uid=<%=us.getId()%> "
								class="btn btn-danger btn-sm "><i class="fas fa-cart-arrow-down"></i>Add Cart</a>
							<%
								}
							%>
							<a href="viewsBooks.jsp?bid=<%=b.getBookID()%>"
								class="btn btn-success btn-sm ">View Details</a> <a href=""
								class="btn btn-danger btn-sm"><i class="fas fa-rupee-sign"></i>
								<%=b.getPrice()%></a>

						</div>
						<%
							}
						%>


					</div>
				</div>
			</div>
			<%
				}
			%>

		</div>
		<div class="text-center mt-2">
			<a href="all_recentBooks.jsp"
				class="btn btn-success btn-sm text-white">View All</a>
		</div>
	</div>
	<!--End Recent book container -->
	<!--  Start New book container -->
	<hr>
	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">

			<%
				BooksDAOImp dao = new BooksDAOImp(Dbconnect.getCon());
				List<BookDetails> list = dao.getNewBook();
				for (BookDetails b : list) {
			%>
			<div class="col-md-3">
				<div class="card ">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p>
							Book :
							<%=b.getBookName()%></p>
						<p>
							Author:
							<%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getCategories()%></p>
						<div class="footer">
							<%
								if (us == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm "><i
								class="fasfa-cart-arrow-down"></i><i class="fas fa-cart-arrow-down"></i>Add Cart</a>
							<%
								} else {
							%>
							<a
								href="cartServlet?bid=<%=b.getBookID()%>&&uid=<%=us.getId()%> "
								class="btn btn-danger btn-sm "><i
								class="fasfa-cart-arrow-down"><i class="fas fa-cart-arrow-down"></i></i>Add Cart</a>
							<%
								}
							%>
							<a href="viewsBooks.jsp?bid=<%=b.getBookID()%>"
								class="btn btn-success btn-sm ">View Details</a> <a href=""
								class="btn btn-danger btn-sm"><i class="fas fa-rupee-sign"></i>
								<%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>



		</div>
		<div class="text-center mt-2">
			<a href="all_newBooks.jsp" class="btn btn-success btn-sm text-white">View
				All</a>
		</div>
	</div>
	<!--End New book container -->
	<!--  Start Old book container -->
	<hr>
	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">
			<%
				BooksDAOImp dao3 = new BooksDAOImp(Dbconnect.getCon());
				List<BookDetails> list3 = dao2.getOldBook();
				for (BookDetails b : list3) {
			%>
			<div class="col-md-3  ">
				<div class="card crd-ho ">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p>
							Book :
							<%=b.getBookName()%></p>
						<p>
							Author:
							<%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getCategories()%></p>

						<div class="footer">
							<a href="viewsBooks.jsp?bid=<%=b.getBookID()%>"
								class="btn btn-success btn-sm "> View Details</a> <a href=""
								class="btn btn-danger btn-sm"><i class="fas fa-rupee-sign"></i>
								<%=b.getPrice()%></a>
						</div>


					</div>
				</div>
			</div>
			<%
				}
			%>

		</div>
		<div class="text-center mt-2">
			<a href="all_oldBooks.jsp" class="btn btn-success btn-sm text-white">View
				All</a>
		</div>
	</div>
	<!--End Old book container -->
	<%@ include file="all-components/footer.jsp"%>

</body>
</html>