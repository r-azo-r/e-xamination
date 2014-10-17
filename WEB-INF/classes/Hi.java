import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
class ques
{
    String qdata;
    String a,b,c,d;
    char ans;
    public ques(String qdata,String a,String b,String c,String d,char ans)
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
public class Hi extends HttpServlet 
{
public void doGet(HttpServletRequest request,HttpServletResponse response)
throws ServletException, IOException 
{
PrintWriter out = response.getWriter();
out.println("Hello World<br />");
student obj=new student("ksh",20);
/*dbase a=new dbase();
try{
out.print(a.rs.getString("name"));}
catch(Exception e)
{
    out.println(e);
}*/
/*out.println(obj.toString());
out.println(obj.name);
out.println(obj.age);
*/



try{
        //HttpServletResponse a=new HttpServletResponse();
  // Load the Driver class.
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  // If you are using any other database then load the right driver here.

  //Create the connection using the static getConnection method
  Connection con = DriverManager.getConnection ("jdbc:odbc:exam");

  //Create a Statement class to execute the SQL statement
  Statement stmt = con.createStatement();

  //Execute the SQL statement and get the results in a Resultset
  ResultSet rs = stmt.executeQuery("select * from questable ");

  // Iterate through the ResultSet, displaying two values
  // for each row using the getString method
 ques set[]=new ques[20];
 int i=0;
 
  while (rs.next())
  {
   set[i]=null;
      //out.println(rs.getString("name"));
   set[i]=new ques(rs.getString("ques"),rs.getString("a"),rs.getString("b"),rs.getString("c"),rs.getString("d"));
   i++;
  }
  
  rs.close();
   stmt.close();
   con.close();
   for(int k=0;k<=i;k++)
   {
     if(set[k]!=null)
       out.println((k+1)+" "+set[k].displayques());
   }
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
class student
{
 String name;
 int age;
 public student(String name,int age)
 {
  this.name=name;
  this.age=age;
 }
 public String toString()
 { 
  return "Name:"+name+"   Age:"+age;
 }
}
class dbase
{ ResultSet rs;
    public dbase()
    {
       try{
        //HttpServletResponse a=new HttpServletResponse();
  // Load the Driver class.
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  // If you are using any other database then load the right driver here.

  //Create the connection using the static getConnection method
  Connection con = DriverManager.getConnection ("jdbc:odbc:exam");

  //Create a Statement class to execute the SQL statement
  Statement stmt = con.createStatement();

  //Execute the SQL statement and get the results in a Resultset
   rs = stmt.executeQuery("select * from logintable ");

  // Iterate through the ResultSet, displaying two values
  // for each row using the getString method

  if (rs.next())
  {
  //out.println(rs.getString(1));
  }
  else
  {
	 // a.out.println("wrong id/pwd");
  }
   //rs.close();
   stmt.close();
   con.close();

       }
   catch(ClassNotFoundException e)
   {
   	 //a.println("Class Not Found Exception:"+e);
   }
   catch(SQLException e)
   {
    	//a.println("SQL Exception:"+e);
   }
  }
 
}
