<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="DAO.BooksDAOImp" %>
	<%@ page import="DbConnection.Dbconnect" %>
	<%@ page import="users.BookDetails" %>
	<%@ page import="java.sql.*"%>
<%@ page import="users.BookDetails" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Books</title>
<%@ include file="allCss.jsp"%>

</head>
<body style="background-color: #f7eeee">
	<%@ include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3 ">
					<div class="card-body ">
						<h4 class="text-center">Edit Books</h4>
						
						<%
						int id=Integer.parseInt(request.getParameter("id"));
						BooksDAOImp dao=new BooksDAOImp(Dbconnect.getCon());
						BookDetails b=dao.getBookById(id);
						%>
						<form action="../editBooks" method="post">
							<input type="hidden"name="id" value="<%=b.getBookID() %>">

							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="name" value="<%=b.getBookName() %>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="author" value="<%=b.getAuthor() %>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="price" value="<%=b.getPrice() %>">
							</div>
							
							<div class="form-group">
								<label for="exampleFormControlSelect1">Status</label> <select
									class="form-control" id="exampleFormControlSelect1" 
									name="status">
									<% if("Active".equals(b.getStatus())){
								     %>
								     <option>Active</option>
								     <option>Inactive</option>
								     <%
									}else{%>
									<option>Inactive</option>
									<option>Active</option>
									<% }
									
									%>
				
								</select>
							</div>
							<br>
							<button type="submit" class="btn btn-primary text-center">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="margin-top: 150px;">
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>