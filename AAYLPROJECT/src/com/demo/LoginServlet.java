package com.demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DBUtil;

public class LoginServlet extends HttpServlet{
	 static Connection conn = DBUtil.getMyConnection();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		String email=req.getParameter("email");
		String password=req.getParameter("pass");

		if(conn!=null) {
			try {
				CallableStatement cs=conn.prepareCall("{call login_16050(?,?,?)}");
				cs.setString(1,email);
				cs.setString(2,password);
				cs.registerOutParameter(3,Types.INTEGER);
				cs.executeUpdate();
				int flag=cs.getInt(3);
				if(flag==1) {
					HttpSession hs=req.getSession();
					hs.setAttribute("em", email);
					hs.setAttribute("pass", password);
					out.print("Welcome    ");
					RequestDispatcher rd=req.getRequestDispatcher("Home.jsp");
					rd.include(req, resp);
				}		
				else {
					out.print("Please check your name and Password");
					req.setAttribute("check","Please check your name and Password");
					RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
					rd.include(req, resp);
					
					out.close();
					
				}
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
		}
		
	}
}






