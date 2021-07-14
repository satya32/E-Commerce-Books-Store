<%@page import="users.UserEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="java.sql.*"%>
<%@ page import="DAO.BooksDAOImp"%>
<%@ page import="DbConnection.Dbconnect"%>
<%@ page import="users.BookDetails"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All New Books</title>
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
	<c:if test="${not empty addCart }">
		<div class="alert alert-success text-center" role="alert">${ addCart}</div>
		<c:remove var="addCart" scope="session" />
	</c:if>
	<div class="container-fliud">
		<div class="row p-3">
			<%
				BooksDAOImp dao = new BooksDAOImp(Dbconnect.getCon());
				List<BookDetails> list = dao.getAllNewBook();
				for (BookDetails b : list) {
			%>
			<div class="col-md-3">
				<div class="card mt-2">
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
							Categories:
							<%=b.getCategories()%></p>
						<div class="footer">
							<%
						if(us==null){
						%>
						<a href="login.jsp" class="btn btn-danger btn-sm "><i class="fasfa-cart-arrow-down"></i>Add Cart</a>
						<% 
						} else{
						%>
						<a href="cartServlet?bid=<%=b.getBookID() %>&&uid=<%=us.getId() %> "class="btn btn-danger btn-sm "><i class="fasfa-cart-arrow-down"></i>Add Cart</a>
						<%
						}
						%>
							 <a href="viewsBooks.jsp?bid=<%=b.getBookID()%>" class="btn btn-success btn-sm ">View Details</a>
							 <a href="" class="btn btn-danger btn-sm"><i
								class="fas fa-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>

		</div>
	</div>
	<%@ include file="all-components/footer.jsp"%>
</body>
</html>