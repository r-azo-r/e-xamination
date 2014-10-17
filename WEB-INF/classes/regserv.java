import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
public class regserv extends HttpServlet {
public void init(ServletConfig config)
throws ServletException {
// Always pass the ServletConfig object to the super class
super.init(config);
}

//Process the HTTP Get request
public void doGet(HttpServletRequest request,
HttpServletResponse response)
throws ServletException, IOException {
response.setContentType("text/html");
PrintWriter out = response.getWriter();
out.println("<html>");
out.println("<head><title>regserv</title></head>");
out.println("<body>");
// Prints the REQUEST_METHOD sent by the client
out.println("Your request method was " + request.getMethod()
+ "\n");
out.println("</body></html>");
out.close();
}
//Process the HTTP Post request
public void doPost(HttpServletRequest request,
HttpServletResponse response)
throws ServletException, IOException {
response.setContentType("text/html");
PrintWriter out = response.getWriter();
out.println("<html>");
out.println("<head><title>regserv</title></head>");

out.println("<body>");
// Prints the REQUEST_METHOD sent by the client
out.println("Your request method was " + request.getMethod()
+ "\n");
try{String k=request.getParameter("regname");
out.println(k);}
catch(Exception e){out.println("error1"+e);}
out.println("</body></html>");
out.close();
}
//Get Servlet information
public String getServletInfo() {
return "regserv Information";
}
}