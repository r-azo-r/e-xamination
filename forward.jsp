<%--
    Document   : useless
    Created on : Oct 27, 2009, 1:28:13 AM
    Author     : Kshitij
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,java.util.Random,java.io.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
    <link href="images/styles.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="rad.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%!
      
        class ques
{
    String qdata;
    String qid;
    String a,b,c,d;
    String ans;
    //String subans;
    public ques(String qdata,String a,String b,String c,String d,String ans,String qid)
    {
        this.qdata=qdata;
        this.a=a;
        this.b=b;
        this.c=c;
        this.d=d;
        this.ans=ans;
	   this.qid=qid;

    }
    public ques()
    {}
    String displayques()
    {
      String temp;
      temp="<font size='+1'>"+qdata+"</font><br>"+form3();
      return temp;
    }
    String form()
    {
        String tp;
        tp="<form id=\"form1\" name=\"form1\" method=\"post\" >"+
         "<input name=\"op\" type=\"radio\" value=\"a\" />"+a+
         "<input name=\"op\" type=\"radio\" value=\"b\" />"+b+
          "<input name=\"op\" type=\"radio\" value=\"c\" />"+c+
          "<input name=\"op\" type=\"radio\" value=\"d\" />"+d+
          "</form><br>";
        return tp;
    }
	String form2()
     {
        String tmp;
        tmp=""+
		"<input name=\"r\" type=\"radio\" value=\"a\" id=\"ra\"/>"+a+
		"<br><input name=\"r\" type=\"radio\" value=\"b\" id=\"rb\"/>"+b+
		"<br><input name=\"r\" type=\"radio\" value=\"c\" id=\"rc\"/>"+c+
		"<br><input name=\"r\" type=\"radio\" value=\"d\" id=\"rd\"/>"+d+
		"<input name=\"subans\" id=\"subans\" type=\"hidden\" value=\"a\" />"+
            "<input name=\"subans\" id=\"qid\" type=\"hidden\" value=\"a\" />"+
            "<br><input name=\"\" type=\"button\" value=\"Submit Answer\"onclick=\"a()\"/>"+
		"";
       return tmp;
     }
     	String form3()
     {
        String tmp;
        tmp="<form action=\"forward.jsp\" method=\"post\" name=\"form2\">"+
		"<hr><input name=\"r\" type=\"radio\"  id=\"ra\" CHECKED/>"+a+
		"<br><input name=\"r\" type=\"radio\"  id=\"rb\"/>"+b+
		"<br><input name=\"r\" type=\"radio\"  id=\"rc\"/>"+c+
		"<br><input name=\"r\" type=\"radio\"  id=\"rd\"/>"+d+
		"<input name=\"subans\" id=\"subans\" type=\"hidden\" value=\"a\" />"+
            "<input name=\"qid\" id=\"qid\" type=\"hidden\" value=\""+qid+"\" />"+
            "<br><input name=\"\" type=\"submit\" value=\"Submit Answer\"onclick=\"a()\"/>"+
		"</form>";
       return tmp;
     }
}

        %>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            
        
	
</div>
<div id="CONTENT">
<div id="TEXT">
<div id="qbox">
         
        <%
           try
		   {
            //dbase connection start
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con = DriverManager.getConnection ("jdbc:odbc:exam");
            Statement stmt = con.createStatement();
            stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            
			
			//db con ends

			//setting session vars
             String counterstr="";
			 int counterint=-1;
			 //out.println( "<br>"+session.getAttribute("loginid")+"<br>");
			 if((session.getAttribute("counter"))==null) //for first time
                   {
					//out.println("<br>"+"ur first timer na"+"<br>");
					session.setAttribute("counter",new Integer(1));
					counterstr=session.getAttribute("counter").toString();
                    counterint=Integer.parseInt(counterstr);
					//out.println("<br>Counter:"+counterint+"<br>");
					//session.setAttribute("qid",new String(current.qid));
			       }

              else
			  {

			  counterstr=session.getAttribute("counter").toString();
              counterint=Integer.parseInt(counterstr);
              session.setAttribute("counter", new Integer(++counterint));
              //out.println("<br>Counter:"+counterint+"<br>");
			  }
              //inital session setup ends
   
   //counter=1 start         
            if(counterint==1)
 			{}
   //counter=1 end	
			
			
  //counter=11 start
 		else	if(counterint == 11)
{
 //insert last ques entry in db starts
  String subs=request.getParameter("subans");
 String qids=request.getParameter("qid");
 //int k=stmt.executeUpdate("INSERT INTO testtable ( name, qid, subans ) VALUES ('a', 1, 'a')");

int k=stmt.executeUpdate("insert into testtable(name,qid,subans,testid) values('"+session.getAttribute("loginid")+"',"+Integer.parseInt(qids)+",'"+subs+"','"+session.getId()+"')");
//out.println("<br>"+subs+"<br>"+qids+"   "+"      <br>");
 //last db entry ends
 con.close();
 response.sendRedirect("useless.jsp");
}
//couter=11end

//last case
else
{
 String subs=request.getParameter("subans");
 String qids=request.getParameter("qid");
 
 //int k=stmt.executeUpdate("INSERT INTO testtable ( name, qid, subans ) VALUES ('a', 1, 'a')");
int k=stmt.executeUpdate("insert into testtable(name,qid,subans,testid) values('"+session.getAttribute("loginid")+"',"+Integer.parseInt(qids)+",'"+subs+"','"+session.getId()+"')");
//stmt.executeUpdate("insert into testtable(name,qid,subans) values('"+session.getAttribute("loginid")+"',"+Integer.parseInt(qids)+",'"+subs+"')");
//out.println("<br><font color='blue'>"+subs+"<br>"+qids+"   "+" </font>    <br>");
}
        
  
                 
		//question filling
		//Random r=new Random();
			//rs.first();	 
			/*
			//random logic
			
			
			 
			out.println(" <font color='red'> "+it+" </font> ");
			int j=(2*counterint-1)-1;
			while(j!=0)
			{
			 rs.next();
			 j--;
			}
			for(int k=0;k<iterator;k++)
			{
			 rs.next();
			}
			if(rs.next()==false)
			 rs.last();*/
			//random logic ends
		//out.println("hi");
		//retrieving qsetfrom db
		
		/*
		Random r=new Random();
		int it=0;
			while(it!=2 || it!=1)
			 it = r.nextInt(3);
			int k=0;
			if(it==2)
			{
			 
			 while(k<(2*counterint))
			  rs.next();
			}
			else
			{
			 while(k<(2*counterint-1))
			  rs.next();
			}		*/	
		//	if(rs.getString(1)==null)
		//	 rs.last();
		//out.println("hi3");
		ques current=new ques();
		ResultSet rs = stmt.executeQuery("select * from questable ");
		//out.println("hi4");
		for(int jk=1;jk<=counterint;jk++)
		 rs.next();
		current=new ques(rs.getString("ques"),rs.getString("a"),rs.getString("b"),rs.getString("c"),rs.getString("d"),rs.getString("ans"),rs.getString("qid"));
		
			
//display ques and submit answer for tht question
out.println("Question"+counterint+":<br>"+current.displayques());
//out.println("<form action='forward.jsp' method='post'><input type='submit' value='GO GO GO!'/></form>");
//rs.close();
//stmt.close();
con.close();
	}
//end of try block

catch(ClassNotFoundException e)
{
	out.println("Class Not Found Exception:"+e);
}
catch(SQLException e)
{
	out.println("SQL Exception:"+e);
}
catch(Exception e)
{
 out.println("Error:"+e);
}

    %>
    </div></div></div>
    </body>
</html>
