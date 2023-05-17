package com.shoe.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.shoe.dao.*;
import com.shoe.model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/user-login")
public class UserLogin extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String email = request.getParameter("login-email");
			String password = request.getParameter("login-password");

		UserDao udao = new UserDao(DBconnection.getConnection());
		User user = udao.userLogin(email, password);
		if (user != null) {
			request.getSession().setAttribute("user", user);
//			System.out.print("user logged in");
			response.sendRedirect("pages.jsp");
		} else {
			out.println("there is no user");
		}

		} catch (ClassNotFoundException|SQLException e) {
			e.printStackTrace();
		}
	}
}
