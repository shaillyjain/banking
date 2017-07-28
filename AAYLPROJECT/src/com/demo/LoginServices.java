package com.demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Types;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DBUtil;
import com.model.*;




public class LoginServices extends HttpServlet{
	
	 static Connection conn = DBUtil.getMyConnection();
	
	public void doPost( HttpServletRequest req,  HttpServletResponse res) throws IOException, ServletException{
		
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		
		java.util.Date date=null;
		java.sql.Date sDate = null;
		SimpleDateFormat formatter;
		
		
		String dob = req.getParameter("dob");
		
		
		
		
		
		formatter = new SimpleDateFormat("dd/MM/yyyy");  
		
        try {

                date =  formatter.parse(dob);

                sDate = new java.sql.Date(date.getTime());

        } catch (ParseException e) {

                // TODO Auto-generated catch block

                e.printStackTrace();

        } 

        
        User u= new User();

		u.setAddress(req.getParameter("address"));
		u.setAmount(Integer.parseInt(req.getParameter("amount")));
		u.setDate(sDate);
		u.setEmail(req.getParameter("email"));
		u.setFname(req.getParameter("fname"));
		u.setLname(req.getParameter("lname"));
		u.setMname(req.getParameter("mname"));
		u.setPass(req.getParameter("pass"));
		u.setPhone(req.getParameter("phone"));
		
		
		//Date dob1=(Date)Formatter. req.getParameter("dob");
		 
		
			try {
			
				CallableStatement cs = conn.prepareCall("{call register_16050(?,?,?,?,?,?,?,?,?,?,?)}");
				
				cs.setLong(1, u.getAccno());
				cs.setString(2, u.getFname());
				cs.setString(3, u.getMname());
				cs.setString(4, u.getLname());
				cs.setString(5, u.getEmail());
				cs.setString(6, u.getPass());
				cs.setDate(7, u.getDate());
				cs.setInt(8, u.getAmount());
				cs.setString(9, u.getAddress());
				cs.setString(10, u.getPhone());
				cs.registerOutParameter(11,Types.INTEGER);
			
				 cs.executeUpdate();
				int flag = cs.getInt(11);
				
				if(flag>0){
				
					
					out.println("<h1><font color = 'white'> register  successfully!!!</font></h1>");
					RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
					rd.include(req, res);
				}
				
				
				//else{
			
					//out.println("<h1><font color = 'white'>register unsuccessfully!!!</font</h1>");
					//RequestDispatcher rd = req.getRequestDispatcher("Register.jsp");
					//rd.include(req, res);
				
				//}
				
				
				
				
			} catch (SQLException e) {
				out.println("<h1><font color = 'white'>register unsuccessfully!!!</font</h1>");
				RequestDispatcher rd = req.getRequestDispatcher("Register.jsp");
				rd.include(req, res);
				//e.printStackTrace();
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			
			
			
			
		
	}
	
	}
