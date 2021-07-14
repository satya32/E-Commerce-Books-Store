<%@page import="java.util.List"%>
<%@page import="DbConnection.Dbconnect"%>
<%@page import="DAO.BookOrderImp"%>
<%@page import="DAO.BookOrderDAO"%>
<%@page import="users.BookOrders"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Orders</title>
<%@ include file="allCss.jsp"%>
</head>
<body style="background-color: #f7eeee">
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty user }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<h4 class="text-center">Hello Admin</h4>
	<table class="table table-striped">
		<thead class="bg-primary">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col"> Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">PaymentType</th>
			</tr>
		</thead>
		<tbody>
		
		<%
		
		BookOrderImp dao=new BookOrderImp(Dbconnect.getCon());
		List<BookOrders> blist=dao.getAllBook();
		for(BookOrders b: blist){
		%>
		<tr>
				<th scope="row"><%=b.getOder_Id() %></th>
				<td><%=b.getUserName() %></td>
				<td><%=b.getEmail() %></td>
				<td><%=b.getFullAddress() %></td>
				<td><%=b.getPhone() %></td>
				<td><%=b.getBookName() %></td>
				<td><%=b.getAuthor() %></td>
				<td><%=b.getPrice() %></td>
				<td><%=b.getPayment() %></td>
				

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