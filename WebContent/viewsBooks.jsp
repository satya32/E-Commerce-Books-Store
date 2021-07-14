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
<title>Views Details</title>
<%@include file="all-components/allCss.jsp"%>
</head>
<body style="background-color: #f7eeee">
	<%
		UserEntity us = (UserEntity) session.getAttribute("user");
	%>
	<%@ include file="all-components/navbar.jsp"%>
	<%
		int bid = Integer.parseInt(request.getParameter("bid"));
		BooksDAOImp dao = new BooksDAOImp(Dbconnect.getCon());
		BookDetails b = dao.getBookById(bid);
	%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img alt="" src="books/<%=b.getPhoto()%>"
					style="height: 150px; widht: 150px"><br>
				<h4 class="mt-3">
					Book Name: <span class="text-success"><%=b.getBookName()%></span>
				</h4>
				<h4>
					Author Name: <span class="text-success"><%=b.getAuthor()%></span>
				</h4>
				<h4>
					Categories: <span class="text-success"><%=b.getCategories()%></span>
				</h4>
			</div>

			<div class="col-md-6 text-center p-5 border bg-white ">
				<h2><%=b.getBookName()%></h2>
				<%
					if ("Old Book".equals(b.getCategories())) {
				%>
				<h5 class="text-primary">Contact To seller</h5>
				<h5 class="text-primary">
					<i class="fas fa-envelope-square"></i> Email:<%=b.getEmail()%></h5>
				<%
					}
				%>
				<h5 class="text-primary">Contact To seller</h5>
				<h5 class="text-primary">
					<i class="fas fa-envelope-square"></i> Email:<%=b.getEmail()%></h5>

				<div class="row mt-5">
					<div class="col-md-4 text-danger text-center">
						<i class="fas fa-money-bill-wave fa-2x"></i>
						<p>Cash on Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center">
						<i class="fas fa-undo-alt fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>

				</div>
				
				<%
				if ("Old Book".equals(b.getCategories())){
				%>
				<div class="footer mt-2">
					<a href="index.jsp" class="btn btn-success btn-sm "><i
						class="fas fa-cart-plus"></i> Continue shopping</a> <a href=""
						class="btn btn-danger btn-sm"><i class="fas fa-rupee-sign"></i>
						<%=b.getPrice() %></a>
				</div>
				
				<%
				} else{
					
				%>
				
				<div class="footer mt-2">
					<%
								if (us == null) {
							%>
							<a href="login.jsp" class="btn btn-success btn-sm  "><i class="fas fa-cart-arrow-down"></i>Add Cart</a>
							<%
								} else {
							%>
							<a
								href="cartServlet?bid=<%=b.getBookID()%>&&uid=<%=us.getId()%> "
								class="btn btn-success btn-sm "><i class="fas fa-cart-arrow-down"></i>Add Cart</a>
							<%
								}
							%>
						 <a href=""
						class="btn btn-danger btn-sm"><i class="fas fa-rupee-sign"></i>
						<%=b.getPrice() %></a>
				</div>
				
				<%
				}
				%>
				
			</div>

		</div>
	</div>
</body>
</html>