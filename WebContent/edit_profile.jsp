<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit profile</title>
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
				<div class="card mt-4">
					<div class="card-body">
					<h4 class="text-center text-primary">Edit profile</h4>
					<c:if test="${not empty Failed }">
							<p class="text-center text-danger">${Failed}</p>
							<c:remove var="Failed" scope="session" />
						</c:if>
						<c:if test="${not empty success }">
							<p class="text-center text-success">${success}</p>
							<c:remove var="success" scope="session" />
						</c:if>
						
					<form action="profileServlet" method="post">
					<input type="hidden" value="${user.id }" name="id">
					<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label"> Full Name
								</label> <input type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="name" value="${user.name }">
							</div>

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Phone
								</label> <input type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="phone" value="${user.phone }">
							</div>

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="email" value="${user.email }">

							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" name="password" value="${user.password }">
							</div>
							
							<button type="submit" class="btn btn-primary">Update</button>
					
					
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
</body>
</html>