<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.io.*,java.sql.*"%>
<HEAD><TITLE>Login!!!</TITLE></HEAD>
<body>
    <h1>
<%
   
   
   String loginid=request.getParameter("id");
   String password=request.getParameter("pwd");
   String type=request.getParameter("typelist");
   int typeno=0;
   if(type.equals("admin"))
       typeno=1;

   if(type.equals("faculty"))
       typeno=2;

   if(type.equals("student"))
       typeno=3;
   String username="";
   boolean status=false;
     try
 {

  // Load the Driver class.
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  // If you are using any other database then load the right driver here.

  //Create the connection using the static getConnection method
  Connection con = DriverManager.getConnection ("jdbc:odbc:exam");

  //Create a Statement class to execute the SQL statement
  Statement stmt = con.createStatement();

  //Execute the SQL statement and get the results in a Resultset
  
  //ResultSet rs = stmt.executeQuery("select * from logintable ");
  stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
  ResultSet rs = stmt.executeQuery("select * from logintable where name='"+loginid+"'and pwd='"+password+"' and type="+typeno);
  // Iterate through the ResultSet, displaying two values
  // for each row using the getString method
  
  if(rs.first())
  {
  status=true;
  out.println("<br>"+session.getId()+"<br>");
  session.setAttribute("loginid",loginid);

  out.print("Welcome "+rs.getString("name"));
  if(type.equals("student") )
     {
      response.sendRedirect("student.jsp");
     }
  if(type.equals("admin") )
     {
      response.sendRedirect("admin.jsp");
     }
  if(type.equals("faculty") )
     {
      response.sendRedirect("faculty.jsp");
     }
  }
  else
 {
	  out.println("wrong id/pwd");
 }
   rs.close();
   stmt.close();
   con.close();

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

    </h1>
</body>