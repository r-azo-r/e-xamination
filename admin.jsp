<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,java.util.Random,java.io.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>About Us</title>
<link href="images/styles.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="rad.js"></script>
</head>

<body>

 <div id="HEADER">
            <h1>e-Xamination</h1>
            <h4>Exams are not boring anymore!</h4>
            <ul>
                
                <li><a href="index.jsp">Home</a></li>
                <li><a href="admin.jsp?msg=remu">Remove User</a></li>
                <li><a href="admin.jsp?msg=viewlog">View Log</a></li>
                <li><a href="admin.jsp">Admin Home</a></li>
            </ul>
            <div class="Visual"> </div>
        
	
</div>
<div id="CONTENT">
  <div id="TEXT">
    
    <%!
    public static class dbconnecta
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
    class adminserv extends dbconnecta
        {
              public String fillListBox(HttpServletResponse response,String query)

                 {String temp="";

                 try{
                  
                  executeQuery(response,"select * from logintable where type in(2,3)");
                  out = response.getWriter();
                  
				  //out.println("<form name='remuform' method='get' action='admin.jsp'><input type='hidden' name='msg' value='remu' /><input type='hidden' name='msg2' value='remu2' /><input type='hidden' id='name' name='name' value='' /><select name='ulbx' id='ulbx' onblur=remuser()>");
				  temp+="<form name='remuform' method='get' action='admin.jsp'><input type='hidden' name='msg' value='remu' /><input type='hidden' name='msg2' value='remu2' /><input type='hidden' id='name' name='name' value='' />Select User to be removed:<select name='ulbx' id='ulbx' onblur=remuser()>";
                  while(rs.next())
                      {
                      // out.println("<option value='"+rs.getString("name")+"'>"+rs.getString("name")+"</option>");
                       temp+="<option value='"+rs.getString("name")+"'>"+rs.getString("name")+"</option>";
                      }

                  //out.println("</select>");
				  temp+="</select>";
                  //out.println("<input name='b1' type='submit' value='click'  /></form>");
				  temp+="       <input name='b1' type='submit' value='  Go   '  /></form>";
                  //out.println(rs.getString("ques"));
                  }
                   catch(Exception e)
                           {
                       out.println(e);
                       }
					   return temp;
             }
               public String removeUser(HttpServletRequest request,HttpServletResponse response,String query)
               {
				String temp="";
                 try{

                  out = response.getWriter();
                  //out.println("<a href='admin.jsp'>Admin Home</a><br>");

                  String name=request.getParameter("name");
                  executeQuery(response,"select * from logintable where name='"+name+"'");



                   rs.first();
                   //out.println(rs.getString("pwd"));
                   rs.deleteRow();
                   //out.println("<font color='red'>Selected User Deleted</font>");
				   temp="<font color='red'>Selected User Deleted</font>";
                  }
                   catch(Exception e)
                           {
                       out.println(e);
                       }
					return temp;
                 }
        }
%>

<%

try
 {
  dbconnecta obj=new dbconnecta();
  adminserv objs=new adminserv();
//to display admin home
  if(request.getParameter("msg")==null || request.getParameter("msg").equals(""))
      {
       //out.println("<a href='admin.jsp?msg=viewlog'>View Log</a>");
      // out.println("<a href='admin.jsp?msg=remu'>Remove User</a>");
       
      }

else if(request.getParameter("msg")!=null && request.getParameter("msg").equals("viewlog"))
{
      // out.println("<a href='admin.jsp?'>Admin Home</a>");
    //VIEW SCORES OF ALL USERS
       obj.executeQuery(response,"select * from logtable");
if(!obj.rs.first())
     {out.println("No records exist");}
else{
%>

<table border="1" align="center">
<tr><th>Name</th><th>Score</th><th>Date</th><th>TestId</th></tr>

<%
}
obj.rs.beforeFirst();
while(obj.rs.next())
  {
   
   out.println("<tr>");
   out.println("<td>"+obj.rs.getString(1)+"</td><td>"+obj.rs.getString("score")+"</td><td>"+obj.rs.getString("dte")+"</td><td>"+obj.rs.getString("testid")+"</td>");
   out.println("</tr>");
  }
  out.println("</table>");
  //SCORE VIEW ENDS
}
else if(request.getParameter("msg")!=null && request.getParameter("msg").equals("remu"))
{
    //do nothing
    
    //out.println("calling function");
   // out.println("hi from 1st if");
    if(request.getParameter("msg2")==null)
        out.println(objs.fillListBox(response,""));
    if(request.getParameter("msg2")!=null && request.getParameter("msg2").equals("remu2"))
        {
        
        out.println(objs.removeUser(request,response,""));
        }
}

   //obj.rs.close();
  //obj.stmt.close();
  //obj.con.close();



}	
  //db con ends
catch(SQLException e)
{
	out.println("SQL Exception:"+e);
}
catch(Exception e)
{
 out.println("Error:"+e);
}

%>
</div></div>
</body>
</html>
