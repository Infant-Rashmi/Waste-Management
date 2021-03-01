<%@page import="java.sql.*" %>
<html>
<head>

<title> Coupon </title>
<style>
.coupon {
  border: 5px dotted #bbb; /* Dotted border */
  width: 80%;
  border-radius: 15px; /* Rounded border */
  margin: 0 auto; /* Center the coupon */
  max-width: 600px;
}
body
{
background-color:#241c6c;
}
.container {
  padding: 2px 16px;
  background-color: #f1f1f1;
}

.promo {
  background: #ccc;
  padding: 3px;
}

.expire {
  color: red;
}



</style>
<style>
 .btn1
 {
 background-color: white;
  color: #241c6c;
  padding: 15px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;}
</style>
</head>
<body>
<a href="home1.jsp" class="btn1"><i class="fa fa-home"></i> Back</a>
<div class="coupon">
  <div class="container">
  
    <h3>Your Gift Card</h3>
  </div>
  <img src="coupon1.jpg" alt="Avatar" style="width:100%;">
  <div class="container" style="background-color:white">
    <h2><b>Thanks For Doing Business With Us!</b></h2>
    <p>Do enjoy purchasing your favorite items in Shopper's Stop using our Gift Card.</p>
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
ResultSet resultSet = null,rst=null,resultSet1=null,res=null,resultset=null;

%>
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
int purchaseno=0;
while(res.next()){

%>
<%  purchaseno=res.getInt("purchaseno");

PreparedStatement pst1=connection.prepareStatement("select * from purchaseorder where id=? ");
            	
            	pst1.setInt(1, purchaseno);
          resultset=pst1.executeQuery();
while(resultset.next()){
%>

<h3>Amount <%=resultset.getString("total") %></h3>
<%} %>

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}%>
 
 
  </div>
  <form action="coupon">
  <div class="container">
  <%
  int n=14;
  String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"+ "0123456789"+ "abcdefghijklmnopqrstuvxyz"; 
  StringBuilder sb = new StringBuilder(n); 

  for (int i = 0; i < n; i++) 
  { 
      int index= (int)(AlphaNumericString.length()* Math.random()); 
      sb.append(AlphaNumericString.charAt(index)); 
  } 
  
  %>

    <p>Use Gift Card Code: <span class="promo"><%=sb.toString() %></span></p>
   
  </div>
  </form>
</div>

</body>
</html>