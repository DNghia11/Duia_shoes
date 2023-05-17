package com.shoe.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import com.shoe.dao.*;
import com.shoe.model.DBconnection;
import com.shoe.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/user-singup")
public class UserRegister extends HttpServlet{
	

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = resp.getWriter()) {
			User user = new User();
			user.setFullName(req.getParameter("register-name"));
			user.setEmail(req.getParameter("register-email"));
			user.setPassWord(req.getParameter("register-password"));
			String rePassword = req.getParameter("register-repass");
			user.setId(0);
			if(!user.getPassWord().equals(rePassword)) {
				resp.sendRedirect("login.jsp");
			}
			else{
				UserDao ud = new UserDao(DBconnection.getConnection());
				user = ud.checkEx(user.getEmail());
				if(user==null) {
					ud.userRegister(user);
					resp.sendRedirect("pages.jsp");
				}
				else {
					
				}
			}

		} catch (ClassNotFoundException|SQLException e) {
			e.printStackTrace();
		}
	}
}
