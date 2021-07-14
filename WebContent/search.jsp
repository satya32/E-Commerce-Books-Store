<%@page import="users.UserEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="DAO.BooksDAOImp"%>
<%@ page import="DbConnection.Dbconnect"%>
<%@ page import="users.BookDetails"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Recent Books</title>
<%@include file="all-components/allCss.jsp"%>
<style type="text/css">
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
	<div class="container-fliud">
		<div class="row p-3">

			<%
			String ch=request.getParameter("ch");
				BooksDAOImp dao2 = new BooksDAOImp(Dbconnect.getCon());
				List<BookDetails> list2 = dao2.getBookBySearch(ch);
				for (BookDetails b : list2) {
			%>
			<div class="col-md-3  ">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhoto()%>"
							style="width: 100px; height: 150px" class="img-thumblin">
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
								class="btn btn-success btn-sm "> View Details</a> <a href=""
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
	</div>
	
</body>
</html>