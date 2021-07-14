<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
	<%@ page import="DAO.BooksDAOImp" %>
	<%@ page import="DbConnection.Dbconnect" %>
	<%@ page import="users.BookDetails" %>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="ISO-8859-1">
<title>All Books</title>
<%@ include file="allCss.jsp"%>
</head>
<body style="background-color: #f7eeee">
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty user }">
	<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	
	<h4 class="text-center">Hello Admin</h4>
	<c:if test="${not empty success }">
							<h5 class="text-center text-success">${success}</h5>
							<c:remove var="success" scope="session" />
						</c:if>
						<c:if test="${not empty Failed }">
							<h5 class="text-center text-danger">${Failed}</h5>
							<c:remove var="Failed" scope="session" />
						</c:if>
	<table class="table table-striped">
		<thead class="bg-primary">
			<tr>
			    <th scope="col">ID</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
		<%
     BooksDAOImp dao= new BooksDAOImp(Dbconnect.getCon());
		List<BookDetails>list=dao.getAllBooks();
		for(BookDetails b:list){
		%>
		<tr>
		<td><%=b.getBookID() %></td>
		<td><img src="../books/<%=b.getPhoto() %> " style="width:50px; height:50px;"></td>
		<td><%=b.getBookName() %></td>
		<td><%=b.getAuthor() %></td>
		<td><%=b.getPrice() %></td>
		<td><%=b.getCategories() %></td>
		<td><%=b.getStatus() %></td>
		
		<td><a href="editbooks.jsp?id=<%=b.getBookID() %>" class="btn-btn-sm btn-primary mx-1">Edit</a> <a
			href="../delete?id=<%=b.getBookID() %>" class="btn-btn-sm btn-danger">Delete</a></td>
	</tr>
		<% 
		
		}
		%>
			
			
			
		</tbody>
	</table>
	<div style="margin-top: 300px;">
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>