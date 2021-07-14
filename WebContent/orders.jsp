<%@page import="users.BookOrders"%>
<%@page import="java.util.List"%>
<%@page import="DbConnection.Dbconnect"%>
<%@page import="DAO.BookOrderImp"%>
<%@page import="users.UserEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>orders</title>
<%@ include file="all-components/allCss.jsp"%>
</head>
<body style="background-color: #f7eeee">
	<%@ include file="all-components/navbar.jsp"%>
	<c:if test="${empty user }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container">

		<h3 class="text-center text-primary">Your Order</h3>
		<table class="table mt-3 table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order ID</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>

				<%
					UserEntity u = (UserEntity) session.getAttribute("user");
					BookOrderImp dao = new BookOrderImp(Dbconnect.getCon());
					List<BookOrders> blist = dao.getBook(u.getEmail());
					for (BookOrders b : blist) {
				%>

				<tr>
					<th scope="row"><%=b.getOder_Id()%></th>
					<td><%=b.getUserName()%></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getPayment()%></td>
				</tr>

				<%
					}
				%>


			</tbody>
		</table>
	</div>
</body>
</html>