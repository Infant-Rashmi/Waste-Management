<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Your Waste</title>
<script type="text/javascript">
function sync()
{
	
  var n1 = document.getElementById('paper');
  var n2 = document.getElementById('paper1');
  
 n2.value=n1.value;
  mul();
  var n3 = document.getElementById('plastic');
  var n4 = document.getElementById('plastic1');
 n4.value=n3.value;
  mul();
  var n5 = document.getElementById('metal');
  var n6 = document.getElementById('metal1');
  n6.value = n5.value;
  mul();
  var n7 = document.getElementById('dress');
  var n8 = document.getElementById('dress1');
  n8.value = n7.value;
  mul();
  var n9 = document.getElementById('glass');
  var n10 = document.getElementById('glass1');
 n10.value = n9.value;
  mul();
  var n11 = document.getElementById('rubber');
  var n12 = document.getElementById('rubber1');
 n12.value = n11.value;
  mul();
}


function mul()
{
	
	var n1=document.getElementById('paper').value;
	var n2=document.getElementById('paper2').value;
	if(n1=="")
	{
	n1=0;
	}
var r1=parseInt(n1)*parseInt(n2);
		
		document.getElementById('paper3').value=r1;
		total();
		var n3=document.getElementById('plastic').value;
		var n4=document.getElementById('plastic2').value;
		if(n3=="")
			{
			n3=0;
			}
		var r2=parseInt(n3)*parseInt(n4);
			document.getElementById('plastic3').value=r2;
			total();
			var n5=document.getElementById('metal').value;
			var n6=document.getElementById('metal2').value;
			if(n5=="")
				{
				n5=0;
				}
			var r3=parseInt(n5)*parseInt(n6);
				document.getElementById('metal3').value=r3;
				total();
				var n7=document.getElementById('dress').value;
				var n8=document.getElementById('dress2').value;
				if(n7=="")
					{
					n7=0;
					}
				var r4=parseInt(n7)*parseInt(n8);
				document.getElementById('dress3').value=r4;
				total();
					var n9=document.getElementById('glass').value;
					var n10=document.getElementById('glass2').value;
					if(n9=="")
						{
						n9=0;
						}
					var r5=parseInt(n9)*parseInt(n10);
						document.getElementById('glass3').value=r5;
						total();
						var n11=document.getElementById('rubber').value;
						var n12=document.getElementById('rubber2').value;
						if(n11=="")
							{
							n11=0;
							}
						var r6=parseInt(n11)*parseInt(n12);
							document.getElementById('rubber3').value=r6;
		
}

function total()
{
	var n1=document.getElementById('paper3').value;
	var n2=document.getElementById('plastic3').value;
	var n3=document.getElementById('metal3').value;
	var n4=document.getElementById('dress3').value;
	var n5=document.getElementById('glass3').value;
	var n6=document.getElementById('rubber3').value;
	var result=parseInt(n1)+parseInt(n2)+parseInt(n3)+parseInt(n4)+parseInt(n4)+parseInt(n5)+parseInt(n6);
	document.getElementById('total').value=result;
	
}
</script>
 <link rel="stylesheet" type="text/css" href="sellerstyle.css" media="screen"/>
</head>
<body>
<br><br><br>
<form action="sellprocess" method="get">
<div class="wrapper">


<h1 align="center" style="color:black">Seller</h1>
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
ResultSet resultSet = null,rst=null,resultSet1=null,res=null;

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

while(res.next()){

%>
<input type="hidden" name="name"  value="<%=res.getString("name") %>">

<input type="hidden" name="phno" value="<%=res.getString("phno")%>">
<input type="hidden" name="area" value="<%=res.getString("area")%>">
<input type="hidden" name="address" value="<%=res.getString("address")%>">
<span><i class="cart"></i></span>

<div class="items">
<div class="item">
<img src="paper.jpg" width="205px" height="170px" alt="Paper">
<br>

<!-- papers -->


<h2>Papers</h2>
<p>
Price:
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select sellprice from product where productname='paper' ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<h3>Rs <%=resultSet.getString("sellprice") %></h3>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</p>
<input type="number" id="paper" name="paper" onkeyup="sync()" placeholder="Enter quantity in kgs" >

</div>

<!-- plastic -->

<div class="item">
<img src="plastic.jpg" width="205px" height="170px" alt="Plastic">
<br>
<h2>Plastics</h2>
<p>
Price:
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select sellprice from product where productname='plastic' ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<h3>Rs <%=resultSet.getString("sellprice") %></h3>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</p>
<input type="numeric" name="plastic" id="plastic" onkeyup="sync()" placeholder="Enter quantity in kgs">

</div>


<!-- Metals -->


<div class="item">
<img src="metal.jpg" width="205px" height="170px" alt="Scrap Metals">
<br>
<h2>Scrap Metals</h2>
<p>
Price:
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select sellprice from product where productname='metal' ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<h3>Rs <%=resultSet.getString("sellprice") %></h3>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</p>
<input type="numeric" id="metal" name="metal" onkeyup="sync()" placeholder="Enter quantity in kgs">

</div>


<!-- Dresses-->
<div class="item">
<img src="dress.jpg" width="205px" height="170px"  alt="Dresses">
<br>
<h2>Dresses</h2>
<p>
Price:
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select sellprice from product where productname='Dress' ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<h3>Rs <%=resultSet.getString("sellprice") %></h3>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</p>
<input type="numeric" id="dress" name="dress" onkeyup="sync()" placeholder="Enter quantity in kgs">

</div>



<!-- Glasses -->

<div class="item">
<img src="glass.jpg" width="205px" height="170px" alt="Glasses">
<br>
<h2>Glasses</h2>
<p>
Price:
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select sellprice from product where productname='glass' ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<h3>Rs <%=resultSet.getString("sellprice") %></h3>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</p>
<input type="numeric" id="glass"  name="glass" onkeyup="sync()" placeholder="Enter quantity in kgs">

</div>


<!-- Rubber Waste-->

<div class="item">
<img src="rubberwaste.jpg" width="205px" height="170px" alt="Rubber Wastes">
<br>
<h2>Rubber Wastes</h2>
<p>
Price:
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select sellprice from product where productname='rubberwaste' ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<h3>Rs <%=resultSet.getString("sellprice") %></h3>
<%
int t1=Integer.parseInt(resultSet.getString("sellprice"));
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</p>
<input type="numeric" id="rubber" name="rubber" onkeyup="sync()" placeholder="Enter quantity in kgs">

</div>

</div>
</div>


<div class="cart-page">

<!-- Table -->

<table position="center"><tr><th>Product</th>
<th>Quantity</th>
<th>Price</th>
<th>Subtotal</th></tr>
<tr>
<td style="color:white"><b>Papers</b></td>
<td><input type="number" id="paper1" name="paper1" value=""  onkeyup="mul();"></td>
<td>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select sellprice from product where productname='paper' ";
resultSet = statement.executeQuery(sql);

if(resultSet.next()){
%>
<input type="text" name="paper2" value="<%=resultSet.getString("sellprice") %>" id="paper2" onkeyup="mul();">
<%
}


//String q1=request.getParameter("paper");
//out.println(q1);
//resultSet1=statement.executeQuery(sql1);
//String q2=resultSet1.getString("quantity");
//double q3=Double.parseDouble(q1)+Double.parseDouble(q2);


}
catch(Exception e)
{}

%>
</td>
<td><input type="number" id="paper3" name="paper3" value="0">
</td>
</tr>
<tr>
<td style="color:white"><b>Plastics</b></td>
<td><input type="number" id="plastic1" name="plastic1" value="" ></td>
<td>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select sellprice from product where productname='plastic' ";
resultSet = statement.executeQuery(sql);
if(resultSet.next()){
%>
<input type="text" name="plastic2" value="<%=resultSet.getString("sellprice") %>"  id="plastic2"  onkeyup="mul();">
<%
}
}
catch(Exception e)
{}
%>
</td>
<td><input type="number" id="plastic3" name="plastic3" value="0" ></td>
</tr>
<tr>
<td style="color:white"><b>Metals</b></td>
<td><input type="number" id="metal1" name="metal1" value="" ></td>
<td>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select sellprice from product where productname='metal' ";
resultSet = statement.executeQuery(sql);
if(resultSet.next()){
%>
<input type="text" name="metal2" value="<%=resultSet.getString("sellprice") %>"  id="metal2"  onkeyup="mul();">
<%
}
}
catch(Exception e)
{}
%>
</td>
<td>
<input type="number" id="metal3" name="metal3" value="0" ></td>
</tr>

<tr>
<td style="color:white"><b>Dresses</b></td>
<td><input type="number" id="dress1" value="" name="dress1" ></td>
<td>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select sellprice from product where productname='Dress' ";
resultSet = statement.executeQuery(sql);
if(resultSet.next()){
%>
<input type="text" name="dress2" value="<%=resultSet.getString("sellprice") %>" id="dress2"  onkeyup="mul();">
<%
}
}
catch(Exception e)
{}
%>
</td>
<td><input type="number" id="dress3" name="dress3" value="0" ></td>
</tr>
<tr>
<td style="color:white"><b>Glasses</b></td>
<td><input type="number" id="glass1" name="glass1" value="" ></td>
<td>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select sellprice from product where productname='glass' ";
resultSet = statement.executeQuery(sql);
if(resultSet.next()){
%>
<input type="text" name="glass2" value="<%=resultSet.getString("sellprice") %>" id="glass2"  onkeyup="mul();">
<%
}
}
catch(Exception e)
{}
%>
</td>
<td><input type="number" id="glass3" name="glass3" value="0" ></td>
</tr>
<tr>
<td style="color:white"><b>Rubber Wastes</b></td>
<td><input type="number" id="rubber1" name="rubber1" value="" ></td>
<td>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select sellprice from product where productname='rubberwaste' ";
resultSet = statement.executeQuery(sql);
if(resultSet.next()){
%>
<input type="text" name="rubber2" value="<%=resultSet.getString("sellprice") %>" id="rubber2"  onkeyup="mul();">
<%
}
}
catch(Exception e)
{}
%>
</td>
<td>
<input type="number" id="rubber3" name="rubber3" value="0" >
</td>
</tr>
<tr>
<td></td>
<td></td>
<td style="text-align:center;color:white"><h2>Total</h2></td>
<td><input type="number" id="total" name="total" ></td>

</tr>
<tr>
<td></td>
<td></td>
<td>

<button type="submit" style="padding:10px 35px;  text-align:center; cursor:pointer; margin:0 auto;background-color:orange;">Submit</button></td>


<td></td>
</tr>
</table>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</div>
</form>
</body>
</html>
