<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,java.util.*,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <script type="text/javascript" src="rad.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Sign Up</title>
        <link href="images/styles.css" rel="stylesheet" type="text/css" />
    </head>
    <body>

        <div id="HEADER">
            <h1>e-Xamination</h1>
            <h4>Exams are not boring anymore!</h4>
            <ul>
                <li><a href="contact.html">Contact Us</a></li>
                <li><a href="about.html">About Us</a></li>
                <li><a href="signup.jsp">Sign Up</a></li>
                <li><a href="sign.html">Sign In</a></li>
                <li><a href="index.jsp">Home</a></li>
            </ul>
            <div class="Visual"> </div>
        </div>

 <div id="CONTENT">
    
 <form name="regform" id="regform" method="post" action="http://localhost:8080/wen/namecheck">        
<center>
<div id="formbox">
<fieldset> <legend align="center" class="logintitle">SIGN UP</legend>
 
<table cellspacing="10">
  <tr><td width="98">Name</td><td width="145"><input name="regname" type="text" onblur="isempty()"/></td><td width="128" id="errorname" style="visibility:hidden"><font color="red">Enter ID</font></td></tr>
                    <tr><td>Password</td><td><input name="regpwd" id="regpwd" type="password" /></td>
                        <td id="errorpwd" style="visibility:hidden"><font color="red">Password Mismatch</font></td></tr>
                    <tr><td>Cofirm Password</td><td><input name="regpwd2" id="regcpwd" type="password"  onblur="confirmpwd();submitcontrol();"/></td></tr>
                    <tr><td>Select Type</td><td>
                            <select name="typelist">
                                <option value="faculty">Faculty</option>
                                <option value="student" selected="selected">Student</option>
                            </select></td></tr>
                    <tr><td></td><td><input name="submit" type="submit" value="Submit" disabled="disabled"/></td><td><input name="" type="reset" value="Reset" /></td></tr>
                    </table></fieldset></div></center>
                    <%
                         if(request.getParameter("msg")!=null && request.getParameter("msg").equals("error"))
                            out.println("<label style='color:#F00'>Username already exists select a different username</label>");
                %>
                 <%
                         if(request.getParameter("msg")!=null && request.getParameter("msg").equals("regdone"))
                           { 
						    out.println("<label style='color:'#09f'>Registration successful</label>");
							out.println("Click here to go to <a href='sign.html'>Login page</a>");
						   }
                %>
            
</form></div>
    </body>
</html>
