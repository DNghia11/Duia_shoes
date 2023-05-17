<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<%@page import="com.shoe.model.*"%> 
<%@page import="com.shoe.dao.*"%>
<%@page import="java.util.List" %>
<%@page import="java.util.*"%>

<%
DecimalFormat dcf = new DecimalFormat("#.#");
request.setAttribute("dcf", dcf);
ArrayList<Carts> cart_list = (ArrayList<Carts>) session.getAttribute("cart-list");
List<Carts> cartProduct = null;
if (cart_list != null) {
	ProductsDao pd = new ProductsDao(DBconnection.getConnection());
	cartProduct = pd.getCartProduts(cart_list);
	double total = pd.getTotolCart(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Cart</title>
	<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="<c:url value='/template/user/cart/cartItems.css'/>"/>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<div class="container bootstrap snippets bootdey">
          
        <div class="row">
            <div class="col-md-12">
                    <div class="panel-body"> 
                        <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Product</th>
                                <th>Description</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th></th>
                            </tr>
                            </thead>

                            <tbody>
                             <%
								if (cart_list != null) {
									for (Carts c : cartProduct) {
								%>
                                <tr>
                                    <td><img src="assets/Products-img/<%= c.getImage() %>" class="img-cart"></td>
                                    <td><strong><%= c.getName()%></strong><p>Size : 26</p></td>
                                    <td>
                                    <form class="form-inline">
                                    	<a href="quantity-inc-dec?action=dec&id=<%= c.getId()%>" class="btn btn-default"><i class="fa fa-minus"></i></a>
                                        <input class="form-control" type="text" value="<%= c.getQuantity()%>">
                                        <a href="quantity-inc-dec?action=inc&id=<%= c.getId()%>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
                                    </form>
                                    </td>
                                    <td>$ <%= dcf.format(c.getPrice()) %></td>
                                    <td><a href="remove-from-cart?id=<%=c.getId() %>" class="btn btn-primary"><i class="fa fa-times"></i></a></td>
                                </tr>
                                <% }
								}
								%>
                            </tbody>
                                                            <tr>
                                    <td colspan="6">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="4" class="text-right"><strong>Total Product</strong></td>
                                    <td>$ ${total>0 ? dcf.format(total):0}</td>
                                </tr>
                        </table>
                    </div>
                </div>
                </div>
                <a href="pages.jsp" class="btn btn-success"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;Continue Shopping</a>
                <a href="#" class="btn btn-primary pull-right">Order<span class="glyphicon glyphicon-chevron-right"></span></a>
            </div>
       </div>
</html>