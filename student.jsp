<%-- 
    Document   : student
    Created on : Oct 27, 2009, 1:01:09 AM
    Author     : Kshitij
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.io.*,java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
    	<link href="images/styles.css" rel="stylesheet" type="text/css" />
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%!
		public static class dbconnects
        {       public static  ResultSet rs;
                public  Connection con;
                public  Statement stmt;
                PrintWriter out ;

                public  void executeQuery(HttpServletResponse response,String query)
                {
                        try
                                {
                                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                                    con=DriverManager.getConnection("jdbc:odbc:exam");
                                    stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                                    out = response.getWriter();
                                    //out.println("hi");
                                    rs =stmt.executeQuery(query);
                                    //if(rs.first())
                                     //   out.println("hey"+rs.getString("ques"));

                                }
                        catch(Exception e )
                                {
                                        out.println(e);
                                }

                }
                public  void  executeUpdate(HttpServletResponse response,String query)
                {
                        try
                                {
                                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                                    con=DriverManager.getConnection("jdbc:odbc:exam");
                                    stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                                    out = response.getWriter();
                                    //out.println("hi");
                                    stmt.executeUpdate(query);


                                }
                        catch(Exception e )
                                {
                                       out.println(e);
                                }

                }
}
		%>
    </head>
    <body >
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
    <div id="CONTENT">
  <div id="TEXT">  
  <%
  try
 {
  dbconnects obj=new dbconnects();
  
//to display admin home
  if(request.getParameter("msg")==null || request.getParameter("msg").equals(""))
      {
       
       out.println("Welcome "+session.getAttribute("loginid").toString());
		
      }

  else if(request.getParameter("msg")!=null && request.getParameter("msg").equals("viewrep"))
{
      
    //VIEW SCORES OF ALL USERS
       obj.executeQuery(response,"select dte,score from logtable where name='"+session.getAttribute("loginid").toString()+"'");
if(!obj.rs.first())
     {out.println("No records exist");}
else{
%>

<table border="1" align="center">
<tr><th>Date</th><th>Score</th></tr>

<%
}
obj.rs.beforeFirst();
while(obj.rs.next())
  {
   
   out.println("<tr>");
   out.println("<td>"+obj.rs.getString("dte")+"</td><td>"+obj.rs.getString("score")+"</td>");
   out.println("</tr>");
  }
  out.println("</table>");
  //SCORE VIEW ENDS
}}finally{}
  %>
        
       
    </div></div>
    </body>
</html>
