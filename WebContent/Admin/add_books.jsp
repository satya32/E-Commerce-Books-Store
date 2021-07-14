<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Books</title>
<%@ include file="allCss.jsp"%>

</head>
<body style="background-color: #f7eeee">
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty user }">
	<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3 ">
					<div class="card-body ">
						<h4 class="text-center">Add Books</h4>
						<c:if test="${not empty success }">
							<p class="text-center text-success">${success}</p>
							<c:remove var="success" scope="session" />
						</c:if>
						<c:if test="${not empty Failed }">
							<p class="text-center text-danger">${Failed}</p>
							<c:remove var="Failed" scope="session" />
						</c:if>
						<form action="../BooksAdd" method="post"
							enctype="multipart/form-data">

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
							<div class="form-group">
								<label for="exampleFormControlSelect1">Book Categories</label> <select
									class="form-control" id="exampleFormControlSelect1"
									name="categories">
									<option>--select--</option>
									<option>New Book</option>
									
								</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControlSelect1">Status</label> <select
									class="form-control" id="exampleFormControlSelect1"
									name="status">
									<option>--select--</option>
									<option>Active</option>
									<option>Inactive</option>

								</select>
							</div>
							<div class="mb-3">
								<label for="formFile" class="form-label">Uplode Photo
									</label> <input type="file" class="form-control" 
									id="formFile" name="image">
							</div>


							<button type="submit" class="btn btn-primary text-center">Add</button>
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