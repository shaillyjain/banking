package com.demo;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import javax.servlet.RequestDispatcher;

import com.dao.DBUtil;

public class VerifyLogin {
	
	
	public static int checkLogin(int accno,String fname,String pass){
		int status=0;
		  Connection conn = DBUtil.getMyConnection();
		while(true){
		  try {
			CallableStatement cs=conn.prepareCall("{call verifybal_16050(?,?,?,?)}");
			
			cs.setInt(1,accno);
			cs.setString(2,fname);
			cs.setString(3,pass);
			cs.registerOutParameter(4,Types.INTEGER);
			cs.executeUpdate();
			int flag=cs.getInt(4);
			if(flag==1) {
			
			
			status=flag;
			break;
		}
			
			else{
				
				System.out.println("Please check your name and Password");
				
				}
			
		  }catch (SQLException e) {
			e.printStackTrace();
			}
}
		return status;	
}
}
