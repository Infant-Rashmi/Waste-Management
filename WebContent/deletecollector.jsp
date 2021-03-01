<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="java.sql.Statement" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%
String Id=request.getParameter("d");
int id=Integer.parseInt(Id);
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con= DriverManager.getConnection("jdbc:mysql://localhost/mydb","Infant Rashmi","Rashmi#18");
String sql = "delete from Collector where Id='"+id+"'";  
Statement st=con.createStatement();  
st.executeUpdate(sql);
response.sendRedirect("collector1.jsp");
%>
