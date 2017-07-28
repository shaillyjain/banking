package com.model;

import java.io.Serializable;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import com.dao.DBUtil;

public class User implements Serializable{
		 static long count;
		 private  long accno;
		 private  String fname;
		 private  String mname;
		 private  String lname;
		 private  String email;
		 private  String pass;
		 private  Date date;
		 private  int amount;
		 private  String address;
		 private  String phone;
		 
		 
	
		 public User() {
			 
			 
			 User.genaccno();
				this.accno= ++count;
		 }


		public static void genaccno(){
			 Connection conn = DBUtil.getMyConnection();
			 try {
				CallableStatement cs = conn.prepareCall("{call getaccno(?)}");
				cs.registerOutParameter(1,Types.NUMERIC);
				int n = cs.executeUpdate();
				if(n>0){
					
					System.out.println("command executed!!!");
				}
				
				//count = cs.getLong(1);
				
			} catch (SQLException e) {
				count = 100000;
			}
			 
		 }
		 
		 
		public String getFname() {
			return fname;
		}

       public void setFname(String fname) {
			this.fname = fname;
		}


		public String getMname() {
			return mname;
		}


		public void setMname(String mname) {
			this.mname = mname;
		}

		public String getLname() {
			return lname;
		}


		public void setLname(String lname) {
			this.lname = lname;
		}


		public String getEmail() {
			return email;
		}


		public void setEmail(String email) {
			this.email = email;
		}


		public String getPass() {
			return pass;
		}

		public void setPass(String pass) {
			this.pass = pass;
		}


		

		public Date getDate() {
			return date;
		}


		public void setDate(Date date) {
			this.date = date;
		}


		public int getAmount() {
			return amount;
		}


		public void setAmount(int amount) {
			this.amount = amount;
		}


		public String getAddress() {
			return address;
		}


		public void setAddress(String address) {
			this.address = address;
		}


		public String getPhone() {
			return phone;
		}


		public void setPhone(String phone) {
			this.phone = phone;
		}


		public long getAccno() {
			return accno;
		}

		static{
			count=10000;
		}

	/*	public User(String fname, String mname, String lname, String email, String pass, Date date, int amount, String address, String phone)
		{
			User.genaccno();
			this.accno= ++count;
			//this.accno= fname.substring(0,3);
			this.fname = fname;
			this.mname = mname;
			this.lname = lname;
			this.email = email;
			this.pass = pass;
			this.date = date;
			this.amount = amount;
			this.address = address;
			this.phone = phone;
			

		}
*/		 
		 
		 
		 
	
	
	
	
	
	

}
