package com.shoe.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/views")
public class ViewProducts extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 9218850190602699091L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()){
			
			request.getRequestDispatcher("/items.jsp").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
