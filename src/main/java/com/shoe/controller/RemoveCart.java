package com.shoe.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoe.model.Carts;

@WebServlet("/remove-from-cart")
public class RemoveCart extends HttpServlet{

	private static final long serialVersionUID = -5045590044963825864L;
	
	protected void doGet(HttpServletRequest rq, HttpServletResponse rs)
			throws ServletException, IOException {
		rs.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = rs.getWriter()) {
			String bookId = rq.getParameter("id");

			

			if (bookId != null) {
				ArrayList<Carts> cart_list = (ArrayList<Carts>) rq.getSession().getAttribute("cart-list");
				if (cart_list != null) {
					for (Carts c : cart_list) {
						if (c.getId() == Integer.parseInt(bookId)) {
							cart_list.remove(cart_list.indexOf(c));
							break;
						}
					}
				}
				rs.sendRedirect("cartItems.jsp");

			} else {
				rs.sendRedirect("cartItems.jsp");
			}

		}
	}
}
