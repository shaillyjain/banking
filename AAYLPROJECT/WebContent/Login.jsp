<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Banking</title>

<SCRIPT LANGUAGE="JavaScript">
function validate(form)
{
   for(var i=0; i<form.elements.length; i++)
   {
		if(form.elements[i].value == "")
		{
		   alert("Fill out all Fields")
		   document.F1.fname.focus()
		   return false
		}
   }

  
   if(!isNaN(document.F1.fname.value))
   {
       alert("User Name  must  be  character & can't be null")
	   document.F1.fname.value=""
	   document.F1.fname.focus()
	   return false
   }

   if(!isNaN(document.F1.pass.value))
   {
       alert("pass  must  be  character & can't be null")
	   document.F1.pass.value=""
	   document.F1.pass.focus()
	   return false
   }
   
   return true   
}
</SCRIPT>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>

<div id="top_links">
  

<div id="header">
	<h1>Login page<span class="style1"></span></h1>
 	<h2>Service</h2>	

</div>


<div id="navigation">
    <ul>
   
 <li><a href="Login.jsp">HOME</a></li>
    <li><a href="#"></a></li>
   
    <li><a href="Register.jsp">REGISTRATION</a></li>
     <li><a href="#"></a></li>

    <li><a href="Aboutus.jsp">ABOUT US</a></li>
     <li><a href="#"></a></li>
   
    <li><a href="Contactus.jsp">CONTACT US</a></li>
 </ul>
</div>


	
<form name=F1 method="post" onSubmit="return validate(this)" action="LoginServlet" >
<table cellpadding="0" cellspacing="0" id="content1">



			 <%if(request.getAttribute("welcome")!=null)
			{
			out.print("<div>"); 
			out.print("<font color='blue'><font size='4'>"+request.getAttribute("welcome"));
			
			out.print("</div>"); 
			}
			
			 %>
			 <%if(request.getAttribute("check")!=null)
			{
			out.print("<div>"); 
			out.print("<font color='blue'><font size='4'>"+request.getAttribute("check"));
			
			out.print("</div>"); 
			}
			
			 %>
				


<tr align="justify">
<td class="con" valign="top">
<div id="heade1"><h1>Email Id :</h1></div>
</td>
<td> <input type="text" name="email"></br></td></tr>


<tr align="justify">
<td class="con" valign="top">
<div id="heade1"><h1>password :</h1></div>
</td>
<td> <input type="password" name="pass" id="pass"></br></td></tr>


			
<tr><td></td><td><input type="submit" value="Login ">&nbsp &nbsp &nbsp  &nbsp  &nbsp <a href="Register.jsp">Signup</a> </td></tr>
</table>
</form>


<div id="footer_top">
  <div id="footer_navigation">
  

  </div>
  
  <div id="footer_copyright" >
 Copyright © Banking</div>
</div>


</body>
</html>








<body>


    
				
   

















