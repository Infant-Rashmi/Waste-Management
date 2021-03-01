import daobjects.DBConnect;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSet;

@WebServlet("/LoginValidation")
public class LoginValidation extends HttpServlet
{
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
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
      // String role=request.getParameter("role");
       try
       {
        Connection con=DBConnect.getCon();
        PreparedStatement pst;
        ResultSet rst;

        pst=con.prepareStatement("select * from customers where phno=? and password=? ");
        pst.setString(1, phno);
        pst.setString(2, pass);
       
       
        
      // String k= pst.getString("name");
        //pst.setString(3, "customer");
        rst=pst.executeQuery();

        if(rst.next() )
        {
            check=true;
            session.setAttribute("phno_session", phno);
            RequestDispatcher rd=request.getRequestDispatcher("home1.jsp");
           rd.forward(request, response);
           session.setMaxInactiveInterval(30000); // 30 seconds
           response.sendRedirect("welcome.jsp");
            
            con.close();
        }

    if(!check)
        {
    	RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
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
