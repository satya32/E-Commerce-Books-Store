<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">										
<title>order success</title>
<%@ include file="all-components/allCss.jsp"%>
</head>
<body style="background-color: #f7eeee">
	<%@ include file="all-components/navbar.jsp"%>
	<div class="container text-center mt-3">
		<i class="fas fa-check-circle fa-5x text-success"></i>
		<h1>Thank You</h1>
		<h2>Your Order Successfully Placed</h2>
		<h5>with in 7 days your product will be delivered in your address</h5>
		<a href="index.jsp" class="btn btn-primary mt-3"> Home</a>
		<a href="orders.jsp" class="btn btn-danger mt-3">View Order</a>
		

	</div>
</body>
</html>