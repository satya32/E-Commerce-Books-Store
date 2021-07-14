<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell books</title>
<%@ include file="all-components/allCss.jsp"%>
</head>
<body style="background-color: #f7eeee">
	<c:if test="${empty user }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@ include file="all-components/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class=" card-body">
						<c:if test="${not empty Failed }">
							<p class="text-center text-danger">${Failed}</p>
							<c:remove var="Failed" scope="session" />
						</c:if>
						<c:if test="${not empty success }">
							<p class="text-center text-success">${success}</p>
							<c:remove var="success" scope="session" />
						</c:if>
						<h5 class="text-center text-primary">Sell Old Books</h5>
						<form action="addOldBook" method="post"
							enctype="multipart/form-data">
							<input type="hidden" value="${user.email }" name="userobj">

							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="name">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="author">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="price">
							</div>
							<div class="mb-3">
								<label for="formFile" class="form-label">Uplode Photo </label> <input
									type="file" class="form-control" id="formFile" name="image">
							</div>
							<button type="submit" class="btn btn-primary text-center">Sell</button>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div style="margin-top: 80px;">
		<%@ include file="all-components/footer.jsp"%>
	</div>
</body>
</html>