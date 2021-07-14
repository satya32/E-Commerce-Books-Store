<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Address</title>
<%@ include file="all-components/allCss.jsp"%>
</head>
<body style="background-color: #f7eeee">
	<%@ include file="all-components/navbar.jsp"%>
	<div class="container">
		<div class="row p-4">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
					<h3 class="text-center text-success">Add Address</h3>
					<form class="row g-3">
					<div class="form-group col-md-6">
								<label for="inputPassword4">Address</label> <input
									type="text" class="form-control" id="inputPassword4"
									placeholder="Password">
							</div>
							<div class="form-group col-md-6">
								<label for="inputEmail4">Landmark </label> <input type="text"
									class="form-control" id="inputEmail4" placeholder="Email">
							</div>
							<div class="form-group col-md-4">
								<label for="inputPassword4">City</label> <input
									type="text" class="form-control" id="inputPassword4">
							</div>
							<div class="form-group col-md-4">
								<label for="inputEmail4">State</label> <input type="number"
									class="form-control" id="inputEmail4" >
							</div>
							<div class="form-group col-md-4">
								<label for="inputPassword4">Pin Code</label> <input
									type="number" class="form-control" id="inputPassword4"
									placeholder="Password">
							</div>
							<div class="text-center text-white">
							<button class="btn btn-warning">Add Address</button>
							</div>
					
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
</body>
</html>