<%-- 
    Document   : useless
    Created on : Oct 27, 2009, 1:28:13 AM
    Author     : Kshitij
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,java.util.*,java.io.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="images/styles.css" rel="stylesheet" type="text/css" />
        <title>JSP Page</title>
    </head>
    <body>
 			 <div id="HEADER">
            <h1>e-Xamination</h1>
            <h4>Exams are not boring anymore!</h4>
            <ul>
                <li><a href="index.jsp">Home</a></li>                
               
                <li><a href='student.jsp?msg=viewrep'>View Report</a></li>
            	<li><a href='forward.jsp'>Take Test</a></li>
                <li><a href="student.jsp">Student Home</a></li>
            </ul>
            <div class="Visual"> </div>
        
	
</div>  
<div id=""> 
    
        Congrats <%=session.getAttribute("loginid").toString().toUpperCase()%> on succesful completion of test.
    <%
     try
		   {
            //dbase connection start
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con = DriverManager.getConnection ("jdbc:odbc:exam");
            Statement stmt = con.createStatement();
            stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("SELECT count(*) as score FROM testtable WHERE name='"+session.getAttribute("loginid")+"' and testid='"+session.getId()+"' and qid in (select qid from questable where testtable.subans=questable.ans)");
            //out.println("Hi");
			String score="0";
			if(rs.next())
			 score=rs.getString("score");
	      out.println("<br>Your score:<b>"+score+"</b>");
	   //db con ends
	   
           java.util.Date a=new java.util.Date();
	   //out.println(a.toString());
         //  out.println(session.getId().toString());
           int j=stmt.executeUpdate("insert into logtable(name,score,dte,testid) values('"+session.getAttribute("loginid")+"',"+Integer.parseInt(score)+",'"+a.toString()+"','"+session.getId().toString()+"')");
           //if(j>0)
           //out.println("<font color='red'><br>Log updated</font>")   ;
            }
            catch(ClassNotFoundException e)
           {
            out.println("Class Not Found Exception:"+e);
           }
           catch(SQLException e)
           {
            out.println("SQL Exception:"+e);
           }
    %>
    </body>
</html>
