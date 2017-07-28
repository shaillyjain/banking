<%@page import="oracle.jdbc.OracleTypes"%>
<%@page import = "com.dao.*,java.sql.*,com.demo.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online banking</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>


<div id="top_links">
  

<div id="header">
	<h1>balance form<span class="style1"></span></h1>
 	<h2>Service</h2>	

</div>



<div id="navigation">
    <ul>
    <li><a href="balance1.jsp">BALANCE</a></li>
    <li><a href="deposit1.jsp">DEPOSIT</a></li>
    <li><a href="withdraw1.jsp">WITHDRAW</a></li>
    <li><a href="transfer1.jsp">TRANSFER</a></li>
    <li><a href="closeac1.jsp">CLOSE A/C</a></li>
   
    </ul>
</div>


<table style="width:897px; background:#FFFFFF; margin:0 auto;">
<tr >
 <td width="1200" valign="top">
 

<table><%
int accno=Integer.parseInt(request.getParameter("accno"));
String fname=request.getParameter("fname");
String pass=request.getParameter("pass");
int status=VerifyLogin.checkLogin(accno,fname,pass);
try {
if(status==1){
	out.print("Welcome    " + fname);

	Connection conn = DBUtil.getMyConnection();
	CallableStatement cs=conn.prepareCall("{call balance_xbbnljv(?,?)}");
	cs.setInt(1,accno);
    cs.registerOutParameter(2,OracleTypes.CURSOR);
	cs.executeUpdate();
	ResultSet rs = (ResultSet)cs.getObject(2);
	out.print("<table align='left' cellspacing='5' cellpadding='5'>");
	out.print("<tr><th>ACCOUNT NO</th><th>FIRST NAME</th><th>MIDDLE NAME</th><th>lAST NAME</th><th>DATE OF BIRTH</th><th>AMOUNT</th><th>ADDRESS</th><th>PHONE</th></tr>");
	while(rs.next()){
	    int accountno1=rs.getInt(1);
		session.setAttribute("accno",accountno1);
		
		System.out.print(accno);
		
		out.print("<tr>");
		out.print("<td>" + rs.getInt(1) + "</td>");
		out.print("<td>" + rs.getString(2) + "</td>");
		out.print("<td>" + rs.getString(3) + "</td>");
		out.print("<td>" + rs.getString(4) + "</td>");
		
		out.print("<td>" + rs.getDate(7) + "</td>");
		out.print("<td>" + rs.getInt(8) + "</td>");
		out.print("<td>" + rs.getString(9) + "</td>");
		out.print("<td>" + rs.getString(10) + "</td>");
		out.print("</tr>");
	
	}
	out.print("</table>");
	
	
	
}
else{
	out.print("Please check your username and Password");
	request.setAttribute("balance","Please check your username and Password");
	%>

<jsp:forward page="balance1.jsp"></jsp:forward> 
			<% 
			}
		 }catch (SQLException e) {
			e.printStackTrace();
		}
		
			%></table><%
%>
    	
</td>
</tr>
</table>
</body>
</html>