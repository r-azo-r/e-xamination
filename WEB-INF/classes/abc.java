import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

class ques
{
    String qdata;
    String a,b,c,d;
    String ans;
    public ques(String qdata,String a,String b,String c,String d,String ans)
    {
        this.qdata=qdata;
        this.a=a;
        this.b=b;
        this.c=c;
        this.d=d;
        this.ans=ans;

    }
    public ques()
    {}
    String displayques()
    {
      String temp;
      temp=" "+qdata+"<br>"+form();
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

}
class abc extends HttpServlet
{
    static int a=0;   
public void doGet(HttpServletRequest request,HttpServletResponse response)
throws ServletException, IOException
{
 
  PrintWriter out = response.getWriter();
 

 out.println("Hello World<br />");
 try{
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  Connection con = DriverManager.getConnection ("jdbc:odbc:exam");
  Statement stmt = con.createStatement();
  ResultSet rs = stmt.executeQuery("select * from questable ");
  ques current=new ques();
   while (rs.next())
  {
   current=new ques(rs.getString("ques"),rs.getString("a"),rs.getString("b"),rs.getString("c"),rs.getString("d"),rs.getString("ans"));
  }
   rs.close();
   stmt.close();
   con.close();
     
       out.println("Q: "+current.displayques());

}

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
    out.println("hi this is "+e);
   }
}
}
