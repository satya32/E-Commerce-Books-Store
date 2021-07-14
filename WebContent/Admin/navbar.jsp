<!--  <div class="container-fluid " style="height:10px; background-color:#3333ff"></div> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>


<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3>
				<i class="fas fa-book"></i> E-Book
			</h3>
		</div>
		<!-- <div class="col-md-6">
			<form class="d-flex">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-primary" type="submit">Search</button>
			</form>

		</div> -->
		<div class="col-md-3 ">
			<c:if test="${not empty user }">
				<a class="btn btn-success ms-5 text-white"><i
					class="fas fa-user-tie"></i> ${user.name}</a>
				<!--  <h5 class="text-center text-success">${user.name}</h5>-->
				<a data-bs-toggle="modal" data-bs-target="#staticBackdrop"
					class="btn btn-primary my-1"><i class="fas fa-sign-out-alt"></i>
					Logout</a>



			</c:if>
			<c:if test="${empty user }">
				<a href="../login.jsp" class="btn btn-success ms-5">Login</a>

				<a href="../signup.jsp" class="btn btn-primary">Register</a>


			</c:if>

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
				<a href=" ../logoutServlet" button type="button" class="btn btn-primary text-white">Logout</button></a>
				</div>
			</div>
			<div class="modal-footer">
				
			</div>
		</div>
	</div>
</div>

<!-- ------------------------------					    end logout model                                                     -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><i class="fas fa-home"></i></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="home.jsp">Home</a></li>

			</ul>
			
		</div>
	</div>
</nav>