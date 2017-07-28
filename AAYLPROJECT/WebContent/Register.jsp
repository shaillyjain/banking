<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<link href="style.css" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
function dil(form)
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
	
	
    if(document.F1.password.value!=document.F1.repassword.value)
    {
	   alert("Check Confirm PWD"); 
	   document.F1.repassword.value=""
	   document.F1.repassword.focus()	
	   return false
	}
	
	
	if(!isNaN(document.F1.phone.value))
   {
	   if(document.F1.phone.value >9999999999 )
	   {
		 alert("entered correct number")
		 document.F1.phone.value=""
		 document.F1.phone.focus()
         return false   
	   }
   }
   else
   {
       alert("This  field  must  be  number")
	   document.F1.phone.value=""
	   return false
   }
	
	
	

   if(!isNaN(document.F1.amount.value))
   {
	   if(document.F1.amount.value < 500)
	   {
		 alert("Minimum Balance should be 500 /-")
		 document.F1.amount.value=""
		 document.F1.amount.focus()
         return false   
	   }
   }
   else
   {
       alert("This  field  must  be  number")
	   document.F1.amount.value=""
	   return false
   }
   
   
 return true   
   }
</SCRIPT>
</head>
<body>
<div id="top_links">
  

<div id="header">
	<h1>Registration page<span class="style1"></span></h1>
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





<form name = "F1"  onSubmit="return dil(this)" action = "LoginServices" method = "post">
<table cellpadding="0" cellspacing="0" id="content1">
<tr align="justify"><td class="con" valign="top"><div id="heade1"><h1>FIRSTNAME:</h1></div></td><td> <input type="text" name="fname" required/></td></tr>
<tr align="justify"><td class="con" valign="top"><div id="heade1"><h1>MIDDLENAME:</h1></div></td><td> <input type="text" name="mname" required/></td></tr>
<tr align="justify"><td class="con" valign="top"><div id="heade1"><h1>LASTNAME:</h1></div></td><td> <input type="text" name="lname" required/></td></tr>

<tr align="justify"><td class="con" valign="top"><div id="heade1"><h1>EMAILID:</h1></div></td><td> <input type="text" name="email" required/></td></tr>

<tr align="justify"><td class="con" valign="top"><div id="heade1"><h1>PASSWORD:</h1></div></td><td> <input type="password" name="pass" required/></td></tr>
<tr align="justify"><td class="con" valign="top"><div id="heade1"><h1>REPASSWORD:</h1></div></td><td> <input type="password" name="repassword" required/></td></tr>

<tr align="justify"><td class="con" valign="top"><div id="heade1"><h1>DATEOFBIRTH:</h1></div></td><td> <input type="date" name="dob" required/></td></tr>

<tr align="justify"><td class="con" valign="top"><div id="heade1"><h1>AMOUNT:</h1></div></td><td> <input type="number" name="amount" required/></td></tr>
					
<tr align="justify"><td class="con" valign="top"><div id="heade1"><h1>ADDRESS:</h1></div></td><td> <textarea id = "addr" name = "address" required></textarea></td></tr>
<tr align="justify"><td class="con" valign="top"><div id="heade1"><h1>PHONE:</h1></div></td><td> <input type="number" name="phone" required/></td></tr><br/><br/>
<br/><br/>
<tr align="justify"><td></td><td><input type="submit" value="Submit"/>
<INPUT TYPE=RESET VALUE="CLEAR"></td></tr>


</table>
</form>
</body>
</html>