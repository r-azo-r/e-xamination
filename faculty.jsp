<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.io.*,java.sql.*,java.util.*,javax.servlet.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
    <link href="images/styles.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="rad.js"></script>
        <%!
        public static class dbconnect
        {       public static  ResultSet rs;
                public  Connection con;
                public  Statement stmt;


                public  void executeQuery(HttpServletResponse response,String query)
                {
                        try
                                {
                                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                                    con=DriverManager.getConnection("jdbc:odbc:exam");
                                    stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                                    PrintWriter out = response.getWriter();
                                    //out.println("hi");
                                    rs =stmt.executeQuery(query);
                                    //if(rs.first())
                                     //   out.println("hey"+rs.getString("ques"));

                                }
                        catch(Exception e )
                                {
                                        System.out.println(e);
                                }

                }
                public  void  executeUpdate(HttpServletResponse response,String query)
                {
                        try
                                {
                                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                                    con=DriverManager.getConnection("jdbc:odbc:exam");
                                    stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                                    PrintWriter out = response.getWriter();
                                    //out.println("hi");
                                    stmt.executeUpdate(query);


                                }
                        catch(Exception e )
                                {
                                        System.out.println(e);
                                }

                }
}
        class ques2 extends dbconnect
                {
             public String fillListBox(HttpServletResponse response,String query)

                 {
					String temp="";
                 try{
                  executeQuery(response,"select * from questable");
                  PrintWriter out = response.getWriter();
                  //out.println("<form name='remqform' method='get' action='faculty.jsp'><input type='hidden' name='msg' value='remq' /><input type='hidden' name='msg2' value='remq2' /><input type='hidden' id='aqid' name='aqid' value='' /><input type='hidden' name='qid'id='qid' value='' /><select name='qlbx' id='qlbx' onblur=remques()>");
				  temp+="Select Question to remove:<br><form name='remqform' method='get' action='faculty.jsp'><input type='hidden' name='msg' value='remq' /><input type='hidden' name='msg2' value='remq2' /><input type='hidden' id='aqid' name='aqid' value='' /><input type='hidden' name='qid'id='qid' value='' /><select name='qlbx' id='qlbx' onblur=remques()>";
				  
                  while(rs.next())
                      {
                       //out.println("<option value='"+rs.getInt("qid")+"'>"+rs.getString("ques")+"</option>");
					   temp+="<option value='"+rs.getInt("qid")+"'>"+rs.getString("ques")+"</option>";
                      }
					  
                  //out.println("</select>");
				  temp+="</select>";
                  //out.println("<input name='b1' type='submit' value='click'  /></form>");
				  temp+="<input name='b1' type='submit' value='Remove'  /></form>";
                  //out.println(rs.getString("ques"));
                  }
                   catch(Exception e)
                           {
                       }
					   return temp;
             }
             public String removeQuestion(HttpServletRequest request,HttpServletResponse response,String query)
               {
                 String temp="";
                 try{
                     int qid=1;
                     PrintWriter out = response.getWriter();
                  //out.println("<a href='faculty.jsp'>Faculty Home</a><br>");
                  qid=1;
                  qid=Integer.parseInt(request.getParameter("aqid"));
                  executeQuery(response,"select * from questable where qid="+qid);
                  
                  
                   
                   rs.first();
                   //out.println(rs.getString("ques"));
                   rs.deleteRow();
                   //out.println("<font color='red'>Selected Question Deleted</font>");
				   temp="<font color='red'>Selected Question Deleted</font>";
                  }
                   catch(Exception e)
                           {
                       }
					return temp;
                 }
             public String updateQuestion(HttpServletRequest request,HttpServletResponse response,String query)
  {				
                 String temp=""; 
                 try{
                     int qid=1;
                      PrintWriter out = response.getWriter();
                     if(request.getParameter("msg2")==null  )
                     {
                        
                        //out.println("<a href='faculty.jsp'>Faculty Home</a><br>");
                        executeQuery(response,"select * from questable");
                        //out.println("Select Question to Edit");
						temp="Select Question to Edit";
                        //out.println("<form name='edtqform' method='get' action='faculty.jsp'><input type='hidden' name='msg' value='edtq' /><input type='hidden' name='msg2' value='edtq2' /><input type='hidden' id='aqid' name='aqid' value='' /><input type='hidden' name='qid'id='qid' value='' /><select name='qlbx' id='qlbx' onblur=edtques()>");
                        temp+="<form name='edtqform' method='get' action='faculty.jsp'><input type='hidden' name='msg' value='edtq' /><input type='hidden' name='msg2' value='edtq2' /><input type='hidden' id='aqid' name='aqid' value='' /><input type='hidden' name='qid'id='qid' value='' /><select name='qlbx' id='qlbx' onblur=edtques()>";
						while(rs.next())
                         {
                            //out.println("<option value='"+rs.getInt("qid")+"'>"+rs.getString("ques")+"</option>");
							temp+="<option value='"+rs.getInt("qid")+"'>"+rs.getString("ques")+"</option>";
                         }
                        //out.println("</select>");
						temp+="</select>";
                        //out.println("<input name='b1' type='submit' value='click'  /></form>");
						temp+="<input name='b1' type='submit' value='Go'  /></form>";
                    }

                    else if(request.getParameter("msg2").equals("edtq2"))
                        {
                          executeQuery(response,"select * from questable where qid="+request.getParameter("aqid"));
                          rs.first();
                          int aqid=Integer.parseInt(request.getParameter("aqid"));
                          String q=rs.getString("ques");
                          String a=rs.getString("a");
                          String b=rs.getString("b");
                          String c=rs.getString("c");
                          String d=rs.getString("d");
                          String ans=rs.getString(8);
                          //out.println(q);
                          //out.println("<form name='editq2' method='get' action='faculty.jsp'><input type='hidden' id='aqid' name='aqid' value='"+aqid+"' /><input type='hidden' name='msg' value='edtq' /><input type='hidden' name='msg2' value='edtq3' />Question:<br><textarea name='ques' cols='20' rows='4' value="+q+">"+q+"</textarea><br>"+"Options<br><input name='opa' type='text' value='"+a+"'/><br><input name='opb' type='text' value='"+b+"'/><br><input name='opc' type='text' value='"+c+"'/><br><input name='opd' type='text' value='"+d+"'/><input name='ans' type='text' value='"+ans+"'/><input type='submit' value='Update' /></form>");
                          temp="<form name='editq2' method='get' action='faculty.jsp'><input type='hidden' id='aqid' name='aqid' value='"+aqid+"' /><input type='hidden' name='msg' value='edtq' /><input type='hidden' name='msg2' value='edtq3' />Question:<br><textarea name='ques' cols='20' rows='4' value="+q+">"+q+"</textarea><br>"+
                                  "<hr>Options<br><input name='opa' type='text' value='"+a+"'/><br><input name='opb' type='text' value='"+b+"'/><br><input name='opc' type='text' value='"+c+"'/><br><input name='opd' type='text' value='"+d+"'/><hr>Answer<br><input name='ans' type='text' value='"+ans+"'/><input type='submit' value='Update' /></form>";
						  //out.println(request.getParameter("aqid"));
                         }
                      else if(request.getParameter("msg2").equals("edtq3"))
                          {
                          //update changes
                           String q=request.getParameter("ques");
                           String a=request.getParameter("opa");
                           String b=request.getParameter("opb");
                           String c=request.getParameter("opc");
                           String d=request.getParameter("opd");
                           String ans=request.getParameter("ans");
                          // out.println("hyyyy");
                           int aqid=Integer.parseInt(request.getParameter("aqid"));
                           executeQuery(response,"select * from questable where qid="+request.getParameter("aqid"));
                           rs.first();
                           rs.updateString("ques",q);
                           rs.updateString("a",a);
                           rs.updateString("b",b);
                           rs.updateString("c",c);
                           rs.updateString("d",d);
                           rs.updateString("ans",ans);
                           rs.updateRow();
                           //out.println("<font color='red'>Selected Question Updated</font>");
						   temp="Selected Question Updated";
                           //out.println("<a href='faculty.jsp'>Faculty Home</a><br>");
                           //out.println(rs.getString("ques"));
                          }
                   
                   //rs.first();
                   //out.println(rs.getString("ques"));
                  
                   //out.println("<font color='red'>Selected Question Deleted</font>");
                  }
                   catch(Exception e)
                           {
                       }
					return temp;
                 }
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body >
        <script type="text/javascript" src="rad.js"></script>
      
         <div id="HEADER">
            <h1>e-Xamination</h1>
            <h4>Exams are not boring anymore!</h4>
            <ul>
                <li><a href="index.jsp">Home</a></li>                
                <li><a href='faculty.jsp?msg=remq'>Remove Question</a></li>
                <li><a href='faculty.jsp?msg=edtq'>Edit Question</a></li>
            	<li><a href='faculty.jsp?msg=addq'>Add Question</a></li>
                <li><a href="faculty.jsp">Faculty Home</a></li>
            </ul>
            <div class="Visual"> </div>
        
	
</div>
<div id="CONTENT">
  <div id="TEXT">
        <%try{
          //inserting into db
           if(request.getParameter("msg")!=null &&request.getParameter("msg").equals("insdb"))
            {String ques=request.getParameter("ques");
           String opa=request.getParameter("opa");
           String opb=request.getParameter("opb");
           String opc=request.getParameter("opc");
           String opd=request.getParameter("opd");
           String ans=request.getParameter("subans");
           dbconnect obj=new dbconnect();
         //obj.executeUpdate(response,"insert into questable(ques,a,b,c,d,ans) values('asc','asdasd','asdsadf','asfff','asdsad','d')");
           obj.executeUpdate(response,"insert into questable(ques,a,b,c,d,ans) values('"+ques+"','"+opa+"','"+opb+"','"+opc+"','"+opd+"','"+ans+"')");
           out.println("Question Succesfully entered");
           out.println("<a href='faculty.jsp?msg=addq'>Click here to add more questions</a>");

           //obj.executeQuery(response,"select * from questable");

           }

        //for adding questions
       else  if(request.getParameter("msg")!=null && request.getParameter("msg").equals("addq"))
            {
            //out.println("<a href='faculty.jsp'>Faculty Home</a>");
            String temp="<form name='addq'action='faculty.jsp?&msg=insdb'><input type='hidden' name='subans' value='' /><input type='hidden' name='msg' value='insdb' /><br>Question:<br><textarea name='ques' rows='4' cols='20'></textarea><hr><br>Choices<br>"+
               "<input type='text' name='opa' value='' /><br><input type='text' name='opb' value='' /><br><input type='text' name='opc' value='' />"+
"<br><input type='text' name='opd' value='' /><hr><br>Answer: <div id='options' onclick='a()'> a<input type='radio' name='' value='' id='ra'/> b<input type='radio' name='' value='' id='rb'/>"+
" c<input type='radio' name='' value='' id='rc'/> d<input type='radio' name='' value='' id='rd'/></div><hr><input type='submit' value='submit' onmouseover='a()'/>";
             out.println(temp);

             }
           else if(request.getParameter("msg")==null || request.getParameter("msg").equals(""))
		   {
              // out.println("<a href='faculty.jsp?msg=addq'>Add Questions</a><br>");
              // out.println("<a href='faculty.jsp?msg=remq'>Remove Questions</a><br>");
              // out.println("<a href='faculty.jsp?msg=edtq'>Edit Questions</a>");
               }
           else  if(request.getParameter("msg")!=null && request.getParameter("msg").equals("remq"))
               {
				   ques2 obj=new ques2();
				if(request.getParameter("msg2")==null)
				{
              // out.println("<a href='faculty.jsp'>Faculty Home</a><br>");
               
                out.println(obj.fillListBox(response,""));
				}
                if(request.getParameter("msg2")!=null && request.getParameter("msg2").equals("remq2"))
                    {
                      out.println(obj.removeQuestion(request,response,""));
                    }
                
                
               }
           else  if(request.getParameter("msg")!=null && request.getParameter("msg").equals("edtq"))
               {
				ques2 obj=new ques2();
                //out.println("<a href='faculty.jsp'>Faculty Home</a><br>");
               
                out.println(obj.updateQuestion(request,response,""));
               // if(request.getParameter("msg2")!=null && request.getParameter("msg2").equals("edtq2"))
                    //{
                   //   obj.removeQuestion(request,response,"");
                   // }


               }
        }
        catch(Exception e){
        out.println(e);}
        %>
</div></div>
    </body>
</html>
