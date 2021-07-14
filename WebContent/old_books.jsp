
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="DAO.BooksDAOImp"%>
<%@ page import="DbConnection.Dbconnect"%>
<%@ page import="users.BookDetails"%>
<%@ page import="java.util.List"%>
<%@page import="users.UserEntity"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Old Books</title>
<%@include file="all-components/allCss.jsp"%>
</head>
<body>
	<%@ include file="all-components/navbar.jsp"%>
	<c:if test="${not empty success }">
		<p class="text-center text-success">${success}</p>
		<c:remove var="success" scope="session" />
	</c:if>
	<c:if test="${not empty Failed }">
		<p class="text-center text-danger">${Failed}</p>
		<c:remove var="Failed" scope="session" />
	</c:if>
	<div class="container p-3">
		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
					UserEntity u = (UserEntity) session.getAttribute("user");
					String email = u.getEmail();
					BooksDAOImp dao = new BooksDAOImp(Dbconnect.getCon());
					List<BookDetails> list = dao.getBookByOld(email, "Old Book");
					for (BookDetails b : list) {
				%>
				<tr>

					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getCategories()%></td>
					<td><a href="deleteOldBook?email=<%=email%>&&id?=<%=b.getBookID()  %>"
						class="btn btn-sm btn-danger">Delete</a></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>