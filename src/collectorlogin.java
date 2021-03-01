
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


@WebServlet("/collectorlogin")
public class collectorlogin extends HttpServlet
{
    public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
    {
      HttpSession session=request.getSession(true);
      response.setContentType("text/html");
      PrintWriter out=response.getWriter();
      String details="";
      boolean check=false;
     
      if(!request.getParameter("phno").equals("1"))
      {
       String phno=request.getParameter("phno");
       String pass=request.getParameter("pass");
      
       try
       {
    	   Class.forName("com.mysql.jdbc.Driver");
    	      Connection con=null;
    	      con= DriverManager.getConnection("jdbc:mysql://localhost/mydb","Infant Rashmi","Rashmi#18");
        PreparedStatement pst;
        ResultSet rst;

        pst=con.prepareStatement("select * from Collector where Contactno=? and Password=? ");
        pst.setString(1, phno);
        pst.setString(2, pass);
       
       
        
     
        rst=pst.executeQuery();
     if(rst.next() )
        {
            check=true;
            session.setAttribute("phno_session", phno);
            RequestDispatcher rd=request.getRequestDispatcher("collectorprofile.jsp");
            
           rd.forward(request, response);
           session.setMaxInactiveInterval(3000); // 30 seconds
           response.sendRedirect("collectorprofile.jsp");
            

            con.close();
        }

    if(!check)
        {
    	RequestDispatcher rd = request.getRequestDispatcher("collectorlogin.jsp");
        out.println("<h1><font color=red>Either phone number or password is wrong.</font></h1>");
        rd.include(request, response);
        }

        con.close();
       }

       
       
       catch(Exception ex)
       {
          out.println("  "+ex);
       }
       finally
       {

       }
      }
      out.println(details);
      out.close();
    }
}
