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
		<div class="col-md-6">
			<form class="d-flex" action="search.jsp" method="post">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search" name="ch">
				<button class="btn btn-primary" type="submit">Search</button>
			</form>

		</div>
			<c:if test="${not empty user }">
			<div class="col-md-3">
			<a href="checkout.jsp"><i class="fas fa-cart-plus fa-2x mx-1"></i></a>
			
				<a href="login.jsp" class="btn btn-success ms-5"><i class="fas fa-user"></i> ${user.name}</a> 
				<a href="logoutServlet" class="btn btn-primary"><i class="fas fa-sign-out-alt"></i> Logout</a>

			</div>
		</c:if>

		<c:if test="${empty user }">
			<div class="col-md-3">
				<a href="login.jsp" class="btn btn-success ms-5">Login</a> <a
					href="signup.jsp" class="btn btn-primary">Register</a>

			</div>
		</c:if>

	</div>


</div>



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
					aria-current="page" href="index.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="all_recentBooks.jsp"><i class="fas fa-book-open"></i>
						Recent Book</a></li>
				<li class="nav-item dropdown"><a class="nav-link active"
					href="all_oldBooks.jsp"><i class="fas fa-book-open"></i> Old
						Book </a></li>
				<li class="nav-item"><a class="nav-link active"
					href="all_newBooks.jsp" tabindex="-1" aria-disabled="true"><i
						class="fas fa-book-open"></i> New Book</a></li>
			</ul>
			<form class="d-flex">

				<a href="setting.jsp" class="btn btn-outline-primary" type="submit">
					<i class="fas fa-cog "></i> Setting
				</a>
				<button class="btn btn-outline-primary mx-2" type="submit">
					<i class="fas fa-phone-square-alt"></i> Contact Us
				</button>
			</form>
		</div>
	</div>
</nav>