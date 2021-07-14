<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook:login</title>
</head>

	<%@ include file="all-components/allCss.jsp"%>
</head>
<body style="background-color: #f7eeee">
	<%@ include file="all-components/navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Login Page</h4>
						<c:if test="${not empty Failed }">
							<p class="text-center text-danger">${Failed}</p>
							<c:remove var="Failed" scope="session" />
						</c:if>
						<c:if test="${not empty success }">
							<p class="text-center text-success">${success}</p>
							<c:remove var="success" scope="session" />
						</c:if>
						
						
						<form action="loginServlet" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="email">

							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" name="password">
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Login</button>
								<br> <a href="signup.jsp">Create account</a>
							</div>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>

<div style="margin-top: 250px;">
	<%@ include file="all-components/footer.jsp"%>
 </div>
</body>

</html>