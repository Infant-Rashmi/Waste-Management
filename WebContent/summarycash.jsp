<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@page import="java.sql.*" %>
 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Summary</title>
<link rel="stylesheet" type="text/css" href="summarystyle.css">
</head>
<body style="background: #241c6c;">
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
Connection connection = null;
Statement statement = null;
ResultSet res = null,resultSet=null;
%>
<div class="wrapper">
<form name="summary" action="cashorcoupon.jsp" method="get">

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);

String phno=(String)session.getAttribute("phno_session");
if(phno==null)
{
	response.sendRedirect("login.jsp");
}

PreparedStatement pst=connection.prepareStatement("select * from customers where phno=? ");
pst.setString(1, phno);
//String phno=request.getParameter("phno");

//String sql ="select * from customers where phno='phno' ";
res = pst.executeQuery();

while(res.next()){
	
%>
<div class="form-group" style="background-color:#dddddd">
<h2 style="text-align:center;">Summary</h2>
<br/>
<label>Name</label>
<input type="text" name="name"  value="<%=res.getString("name") %>">
<br>
<br>





<label>Phone Number</label>
<input type="text" name="phno"  value="<%=res.getString("phno")%>">
<br>
<br>


<label>Address</label>
<input type="text" name="address" height:"212px" width:"80px" value="<%=res.getString("address")%>">
<br>
<br>



<label>Area</label>
<input type="text" name="area"  value="<%=res.getString("area")%>">
<br>
<br>

<label>Payment</label>

<input type="text" name="payment" value="cash">
<br>
<br>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
 statement=connection.createStatement();
 String ph_no=res.getString("phno");
 
 PreparedStatement pst1=connection.prepareStatement("select * from purchaseorder ");
 //pst1.setString(1, phno);
resultSet = pst1.executeQuery();
if(resultSet.last()){
%>


<label>Amount</label>

<input type="text" name="amount" value="<%=resultSet.getString("total") %>">
<br>
<br>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

<button type="submit" class="btn btn-warning" style="background:#241c6c;color:white;">Confirm Order</button>

</div>

</div>
</form>
</body>
</html>