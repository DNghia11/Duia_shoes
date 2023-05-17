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


@WebServlet("/quantity-inc-dec")
public class QuantityIncDec extends HttpServlet{
	private static final long serialVersionUID = -7724474729693957496L;
	
	
	protected void doGet(HttpServletRequest rq,HttpServletResponse rs) throws ServletException,IOException{
		rs.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = rs.getWriter()) {
			String action = rq.getParameter("action");
			int id = Integer.parseInt(rq.getParameter("id"));
			@SuppressWarnings("unchecked")
			ArrayList<Carts> cart_list = (ArrayList<Carts>) rq.getSession().getAttribute("cart-list");

			if (action != null && id >= 1) {
				if (action.equals("inc")) {
					for (Carts c : cart_list) {
						if (c.getId() == id) {
							int quantity = c.getQuantity();
							quantity++;
							c.setQuantity(quantity);
							rs.sendRedirect("cartItems.jsp");
						}
					}
				}

				if (action.equals("dec")) {
					for (Carts c : cart_list) {
						if (c.getId() == id && c.getQuantity() > 1) {
							int quantity = c.getQuantity();
							quantity--;
							c.setQuantity(quantity);
							break;
						}
					}
					rs.sendRedirect("cartItems.jsp");
				}
			} else {
				rs.sendRedirect("cartItems.jsp");
			}
		}
	}
}
