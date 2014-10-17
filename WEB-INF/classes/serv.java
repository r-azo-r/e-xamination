/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author Kshitij
 */
class ques
{
    String qdata;
    String a,b,c,d;
    public ques(String qdata,String a,String b,String c,String d)
    {
        this.qdata=qdata;
        this.a=a;
        this.b=b;
        this.c=c;
        this.d=d;
    
    }
    String displayques()
    {
      return this.qdata;

    }
}
class dbconnect
{
    Connection con;
    Statement stmt;
    ResultSet rs;
 public dbconnect()
 {
     try
     {

          Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
          con = DriverManager.getConnection ("jdbc:odbc:exam");
          stmt = con.createStatement();
          stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
          ResultSet rs = stmt.executeQuery("select * from questable");
          if(rs.first())
              givestr();

     }
     catch(Exception e)
     {

     }
 }
 String givestr() throws Exception
 {
     return rs.getString("ques");
 }
}

public class serv extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
	
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            // TODO output your page here

		Connection con;
    	        Statement stmt;
    	        ResultSet rs;
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
          	con = DriverManager.getConnection ("jdbc:odbc:exam");
                stmt = con.createStatement();
                	stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                 rs = stmt.executeQuery("select * from questable");

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet serv</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet serv at " + request.getContextPath () + "</h1>");
            
         
           
            //out.println(rs.getString("ques"));
  		         
            out.println("<br>now closing<br>");
            out.println("</body>");
            out.println("</html>");
 //dbconnect obj=new  dbconnect();
//ques a =new ques("wats ur name","aa","bb","cc","dd");
         
        }
        catch(Exception e)
        {}
        finally {
            out.close();
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}


