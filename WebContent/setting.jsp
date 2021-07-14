<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Setting page</title>
<%@include file="all-components/allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #f7eeee">
<c:if test="${empty user }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
	<%@ include file="all-components/navbar.jsp"%>
	<div class="container">
	
	<h3 class="text-center mt-2">Hello,${user.name}</h3>
	
		
		<div class="row p-5">
			<div class="col-md-4">
				<a href="sell_book.jsp">
					<div class=" card">
						<div class="card-body text-center">
						<div class="text-primary">
							<i class="fas fa-book-open fa-3x"></i>
							</div>
							<h4>Sell Old Books</h4>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4">
				<a href="old_books.jsp">
					<div class=" card">
						<div class="card-body text-center">
						<div class="text-primary">
							<i class="fas fa-book-open fa-3x"></i>
							</div>
							<h4> Old Books</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="edit_profile.jsp">
					<div class=" card">
						<div class="card-body text-center">
						<div class="text-primary">
							<i class="fas fa-edit fa-3x"></i>
							</div>
							<h4>login & Security (Edit profile)</h4>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-6 mt-4">
				<a href=orders.jsp>
					<div class=" card">
						<div class="card-body text-center">
						<div class="text-danger">
							<i class="fas fa-box-open fa-3x"></i>
							</div>
							<h4>My Order</h4>
							<p>Track Your Order</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6 mt-4">
				<a href="helpline.jsp">
					<div class=" card">
						<div class="card-body text-center">
						<div class="text-primary">
							<i class="fas fa-user-circle fa-3x"></i>
							</div>
							<h4>Help Center</h4>
							<p>24*7 Service</p>
						</div>
					</div>
				</a>
			</div>
			
			
		</div>
	</div>
	<div style="margin-top: 200px;">
	<%@ include file="all-components/footer.jsp"%>
 </div>
	
</body>
</html>