
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

public class namecheck extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
                
            out.println("<html><head><title>namecheck servlet</title></head><body>Hello world");


            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con = DriverManager.getConnection("jdbc:odbc:exam");
            Statement stmt = con.createStatement();
            stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String loginid = request.getParameter("regname");
            String password = request.getParameter("regpwd");
            String type = request.getParameter("typelist");
            //out.println(loginid + "   " + password + "   " + type);
            int typeno = 0;

            if (type.equals("faculty")) {
                typeno = 2;
            }

            if (type.equals("student")) {
                out.println("hey");
                typeno = 3;
            }
            ResultSet rs = stmt.executeQuery("select * from logintable where name='" + loginid + "'");
            
            if (rs.first()) {
                //out.println("<font color='red'>" + loginid + " has already been taken.Select a different user id<font>");
                //ThreadGroup k=new ThreadGroup("abc");
                //k.wait(3000);
                response.sendRedirect("signup.jsp?msg=error");

               // out.println("welcome");
                //response.sendRedirect("signup.jsp");
            }
            else
            {
                stmt.executeUpdate("insert into logintable(name,pwd,type) values('" + loginid + "','"+password+"',"+typeno+")");
               response.sendRedirect("signup.jsp?msg=regdone");
			   //out.println("<br>Registration succesful<br>");
              //  out.println("<a href='sign.html'>CLick here to go back to Login page</a>");
            }

            out.println("</body></html>");
        } catch (Exception e) {
            out.println(e);
        } finally {
            out.close();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
