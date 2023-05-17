package com.shoe.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import com.shoe.model.*;

@WebServlet("/carts")
public class CartItems extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest res,HttpServletResponse reps)throws ServletException,IOException{
		reps.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = reps.getWriter()){
			ArrayList<Carts> cartList = new ArrayList<>();
            int id = Integer.parseInt(res.getParameter("id"));
            Carts cm = new Carts();
            cm.setId(id);
            cm.setQuantity(1);
            HttpSession session = res.getSession();
            @SuppressWarnings("unchecked")
			ArrayList<Carts> cart_list = (ArrayList<Carts>) session.getAttribute("cart-list");
            if (cart_list == null) {
                cartList.add(cm);
                session.setAttribute("cart-list", cartList);
                reps.sendRedirect("pages.jsp");
            } else {
                cartList = cart_list;

                boolean exist = false;
                for (Carts c : cart_list) {
                    if (c.getId() == id) {
                        exist = true;
                        out.println("<h3 style='color:crimson; text-align: center'>Item Already in Cart. <a href='cartItems.jsp'>GO to Cart Page</a></h3>");
                    }
                }

                if (!exist) {
                    cartList.add(cm);
                    reps.sendRedirect("pages.jsp");
                }
            }
		}
	}
}
