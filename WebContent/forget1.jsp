 <%@page import="java.sql.*" %>
   <%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "mydb";
String userid = "Infant Rashmi";
String password = "Rashmi#18";
boolean check=false;
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null,rst=null,resultSet1=null,res=null,resultset=null;

%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);

/*String phno=(String)session.getAttribute("phno_session");
if(phno==null)
{
	response.sendRedirect("login.jsp");
}*/
String phno1=request.getParameter("phno");

PreparedStatement pst=connection.prepareStatement("select * from customers where phno=? ");
pst.setString(1, phno1);
String newpass=request.getParameter("newpass");

//String phno=request.getParameter("phno");
//out.println("Hii");
//String sql ="select * from customers where phno='phno' ";
res = pst.executeQuery();
int purchaseno=0;
while(res.next()){
	//String password=res.getString("password");
	PreparedStatement pst2=connection.prepareStatement("Update customers set password=? where phno=? ");

                  pst2.setString(1,newpass);
                  pst2.setString(2,phno1);
                  pst2.executeUpdate();
                  check=true;
                 // out.println("password changed");
                  response.sendRedirect("forgetredirect.jsp");
                  %>
                  <%
                  
}
if(!check)
{
	RequestDispatcher rd = request.getRequestDispatcher("forget.jsp");
out.println("<h1><font color=red>Phone No is wrong</font></h1>");

rd.include(request, response);
}
connection.close();
} catch (Exception e) {
	
e.printStackTrace();
}
%>