import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import daobjects.DBConnect;
import javax.servlet.annotation.WebServlet;

@WebServlet("/buyprocess")
public class buyprocess extends HttpServlet
{
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
    {
      response.setContentType("text/html");
      PrintWriter out=response.getWriter();


     Connection co;
     PreparedStatement pst;

     try
     {
      
      String name=request.getParameter("name");
      
      String phno=request.getParameter("phno");
      String address=request.getParameter("address");
      String area=request.getParameter("area");
      String paperq=request.getParameter("paper1");
      String paperp=request.getParameter("paper2");
      String papersu=request.getParameter("paper3");
     // out.println(paperp);
      String plasticq=request.getParameter("plastic1");
      String plasticp=request.getParameter("plastic2");
      String plasticsu=request.getParameter("plastic3");
      out.println(plasticsu);
      String metalq=request.getParameter("metal1");
      String metalp=request.getParameter("metal2");
      String metalsu=request.getParameter("metal3");
      out.println(metalsu);
      String dressq=request.getParameter("dress1");
      String dressp=request.getParameter("dress2");
      String dresssu=request.getParameter("dress3");
      String glassq=request.getParameter("glass1");
      String glassp=request.getParameter("glass2");
      String glasssu=request.getParameter("glass3");
      String rubberq=request.getParameter("rubber1");
      String rubberp=request.getParameter("rubber2");
      String rubbersu=request.getParameter("rubber3");
      String total=request.getParameter("total");
      out.println(total);
      
      co=DBConnect.getCon();
      pst=co.prepareStatement("insert into purchaseorderbuyer (name,phno,address,area,paperq,paperp,papersu,plasticq,plasticp,plasticsu,metalq,metalp,metalsu,dressq,dressp,dresssu,glassq,glassp,glasssu,rubberq,rubberp,rubbersu,total,paid_or_not) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

      pst.setString(1,name);
      pst.setString(2,phno);
      pst.setString(3,address);
      pst.setString(4,area);
      pst.setString(5,paperq);
      pst.setString(6,paperp);
      pst.setString(7,papersu);
      pst.setString(8, plasticq);
      pst.setString(9, plasticp);
      pst.setString(10, plasticsu);
      pst.setString(11, metalq);
      pst.setString(12, metalp);
      pst.setString(13, metalsu);
      pst.setString(14, dressq);
      pst.setString(15,dressp);
      pst.setString(16, dresssu);
      pst.setString(17, glassq);
      pst.setString(18, glassp);
      pst.setString(19, glasssu);
      pst.setString(20, rubberq);
      pst.setString(21, rubberp);
      pst.setString(22, rubbersu);
      pst.setString(23, total);
      pst.setString(24, "no");
      pst.executeUpdate();

      co.close();
      RequestDispatcher rd=request.getRequestDispatcher("paymentmode.jsp");
      rd.forward(request, response);
     }
     catch(Exception e)
     {
       out.println("     "+e);
     }
     out.close();
    }
}
