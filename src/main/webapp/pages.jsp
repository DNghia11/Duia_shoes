<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.shoe.model.*"%>
<%@page import="com.shoe.dao.*"%>
<%@page import="java.util.List" %>
<%@page import="java.util.*"%>
<%
User user = (User) request.getSession().getAttribute("user");
if (user != null) {
    request.setAttribute("person", user);
}

ProductsDao pd = new ProductsDao(DBconnection.getConnection());
List<Products> products = pd.getAllProducts();
%>
<%
ArrayList<Carts> cart_list = (ArrayList<Carts>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
 <%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>DUIA Shoes</title>
	<link rel="stylesheet" href="<c:url value='/template/user/style.css'/>"/>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
</head>
<body>
	<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="pages.jsp">DUIA Shoes</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="pages.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Contact</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Products</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">All Shoes</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Men</a></li>
                                <li><a class="dropdown-item" href="#!">Woment</a></li>
                            </ul>
                        </li>
                    </ul>
					<% 
					if(user != null){
					%>
						<form class="d-flex">
	                        <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
								<a class="btn btn-outline-dark mt-auto" href="cartItems.jsp">
									<i class="bi-cart-fill me-1"></i>
									Cart
									<span class="badge bg-dark text-white ms-1 rounded-pill">${cart_list.size()}</span>
								</a>
                        	</ul>
	                        <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
	                        	<li class="nav-item"><a class="btn btn-outline-dark mt-auto" href="user-logout">Log Out</a></li>
	                        </ul>                      
                    </form>                   
					<%
					}else{
					%>
						<form class="d-flex">
	                        <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
	                        	<li class="nav-item"><a class="btn btn-outline-dark mt-auto" href="<c:url value='/login.jsp'/>">Log In</a></li>
	                        </ul>
                    	</form>
                   	<%
					}
                  	%>
                </div>
            </div>
        </nav>
               <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Wellcome to DUIA</h1>
                    <p class="lead fw-normal text-white-50 mb-0"></p>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<%
                 if(!products.isEmpty()){
                    for(Products p : products){ %>
                    <div class="col mb-5">
                        <div class="card h-100">
                                <img class="card-img-top" src="assets/Products-img/<%= p.getImage() %>" alt="..." />
                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h5 class="fw-bolder"><%= p.getName() %></h5>
                                       <!-- Product category-->
                                       <%= p.getCategory() %>
                                        <!-- Product reviews-->
                                        <div class="d-flex justify-content-center small text-warning mb-2">
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                        </div>
                                        <!-- Product price-->
                                        <%= p.getPrice() %> $
                                    </div>
                                </div>
                                <!-- Product actions-->
                               	<div class="mt-3 d-flex justify-content-center">
                               		<div style="padding:5px">
                               			<a class="btn btn-outline-dark mt-auto" href="views?id=<%=p.getId()%>">View options</a>
                               		</div>
                               		<div style="padding:5px">
                               			<a class="btn btn-outline-dark mt-auto" href="carts?id=<%=p.getId()%>">
                               				<i class="bi-cart-fill me-1"></i>
                               				Add Cart
                               			</a>
                               		</div>
                                </div>
                                
						</div>
                     </div>
					<%}
                      }
                     %>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
        	 <!-- test -->
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
         <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>