<%@page import="java.util.List"%>
<%@page import="users.Cart"%>
<%@page import="users.UserEntity"%>
<%@page import="DbConnection.Dbconnect"%>
<%@page import="DAO.CartDAOImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Page</title>
<%@include file="all-components/allCss.jsp"%>
</head>
<body>
	<%@ include file="all-components/navbar.jsp"%>
	<c:if test="${empty user }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<c:if test="${not empty success }">
		<div class="alert alert-success text-center" role="alert">${ success}</div>
		<c:remove var="success" scope="session" />
	</c:if>
	<c:if test="${not empty Failed }">
		<div class="alert alert-danger text-center" role="alert">${Failed }</div>
		<c:remove var="Failed" scope="session" />
	</c:if>

	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">
				<div class="card bg-white mt-4">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Items</h3>
						<table class="table table-striped"">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
									UserEntity u = (UserEntity) (session.getAttribute("user"));
									CartDAOImp dao = new CartDAOImp(Dbconnect.getCon());
									List<Cart> cart = dao.getBookByUser(u.getId());
									double totoalPrice = 0.00;
									for (Cart c : cart) {
										totoalPrice = c.getTotalPrice();
								%>
								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="removeServlet?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()  %>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>

								<%
									}
								%>
								<tr>

									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totoalPrice%></td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card-body">
					<h3 class="text-center text-success">Your Details For Orders</h3>
					<form action="orderServlet" method="post" class="row g-3">
					<input type="hidden" value="${user.id }" name="id">
						
							<div class="form-group col-md-6">
								<label for="inputEmail4">Name</label> <input type="text" name="name"
									class="form-control" id="inputEmail4" value="<%=u.getName() %>" required="required">
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">Email</label> <input
									type="email" class="form-control" id="inputPassword4"
									value="<%=u.getEmail() %>"  name="email" required>
							</div>
							<div class="form-group col-md-6">
								<label for="inputEmail4">Mobile No</label> <input type="number" name="phone"
									class="form-control" id="inputEmail4" value="<%=u.getPhone() %>" required >
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">Address</label> <input name="address"
									type="text" class="form-control" id="inputPassword4" 
								required >
							</div>
							<div class="form-group col-md-6">
								<label for="inputEmail4">Landmark </label> <input type="text"
									class="form-control" id="inputEmail4" name="landmark" required>
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">City</label> <input name="city"
									type="text" class="form-control" id="inputPassword4" required>
							</div>
							<div class="form-group col-md-6">
								<label for="inputEmail4">State</label> <input type="text"
									class="form-control" id="inputEmail4" name="state" required>
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">Pin Code</label> <input
									type="number" class="form-control" id="inputPassword4"
									name="pin" required>
							</div>
						
						<div class="form-group">
							<label>Payment Mode</label> <select class="form-select" name="payment"> 
								<option value="noselect">---Select---</option>
								<option value="COD">Cash on Delivery</option>
							</select>
						</div>
						<div class="text-center">
							<button class="btn btn-warning">Order Now</button>
							<a href="index.jsp" class="btn btn-success">Continue Shopping</a>
						</div>
						</form>
				</div>
				
			</div>


		</div>
	</div>
	
</body>
</html>