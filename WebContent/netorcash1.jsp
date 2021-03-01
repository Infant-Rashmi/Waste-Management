<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@page import="java.sql.*" %>
 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "mydb";
String userid = "Infant Rashmi";
String password = "Rashmi#18";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null,co=null;
Statement statement = null;
ResultSet res = null,resultSet=null;
%>
<% try{
	String area=request.getParameter("area");
    String address=request.getParameter("address");
    String payment=request.getParameter("payment");
    	 co=DriverManager.getConnection(connectionUrl+database, userid, password);
      
      PreparedStatement pst1=co.prepareStatement("select * from purchaseorderbuyer ");
      //pst1.setString(1, phno);
     resultSet = pst1.executeQuery();
     if(resultSet.last()){
     
   int id=resultSet.getInt("id");
   out.println(id);
     PreparedStatement pst2=co.prepareStatement("Update purchaseorderbuyer set paymentmode=?,paid_or_not=?,collected_or_not=?,area=?,address=? where id=? ");
   
     pst2.setString(1,"cash");
     pst2.setString(2,"no");
     pst2.setString(3,"no");
    	
     pst2.setString(4,area);
     pst2.setString(5,address);
     pst2.setInt(6,id);
     pst2.executeUpdate();
     response.sendRedirect("thankyou.jsp");
     //out.println("Success");
   
     }
     co.close();
     } catch (Exception e) {
     e.printStackTrace();
     }
%>
