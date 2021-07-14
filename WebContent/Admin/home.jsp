<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin :home</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: none;
}

a:hover {
	background-color: transparent !important;
}
</style>


</head>
<body style="background-color: #f7eeee">

	<%@include file="navbar.jsp"%>
	<c:if test="${empty user }">
	<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<div class="container">
		<div class="row p-5">
			<div class="col-md-3">
				<a href="add_books.jsp">
					<div class="card m-2">
						<div class="card-body text-center text-primary">
							<i class="far fa-plus-square fa-3x"></i><br>
							<h4>Add Books</h4>
							-------------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="all_books.jsp">
					<div class="card m-2">
						<div class="card-body text-center text-danger">
							<i class="fas fa-book-open fa-3x"></i></i><br>
							<h4>All Books</h4>
							-------------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card m-2 ">
						<div class="card-body text-center text-warning">
							<i class="fas fa-box-open fa-3x"></i></i><br>
							<h4>Orders</h4>
							-------------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a data-bs-toggle="modal" data-bs-target="#staticBackdrop">
					<div class="card m-2">
						<div class="card-body text-center text-primary">
							<i class="fas fa-sign-out-alt fa-3x"></i></i><br>
							<h4>Logout</h4>
							-------------
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<!-- ------------------------------------------        Logout model  --------                                                -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Confirmation</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="text-center">
						<h4>Do You want to logout</h4>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<a href=" ../logoutServlet" button type="button"
							class="btn btn-primary text-white">Logout
							</button>
						</a>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<!-- ------------------------------					    end logout model                                                     -->
	<div style="margin-top: 250px;">
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>