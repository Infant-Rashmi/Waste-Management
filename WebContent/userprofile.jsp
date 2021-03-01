<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%> 
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>User Profile</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
 <link rel="stylesheet" href="css/sidebar.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
a
{
font-size: 50px;
color:#241c6c;
}
body {
	color: #241c6c;
	background: #f5f5f5;
	font-family: 'Varela Round', sans-serif;
	font-size: 13px;
}
.form-control, .form-control:focus, .input-group-addon {
	border-color: #e1e1e1;
	border-radius: 0;
}
.signup-form {
	width: 390px;
	margin: 0 auto;
	padding: 30px 0;
}
.signup-form h2 {
	color: #241c6c;
	margin: 0 0 15px;
	text-align: center;
}
.signup-form .lead {
	font-size: 14px;
	margin-bottom: 30px;
	text-align: center;
}
.signup-form form {		
	border-radius: 1px;
	margin-bottom: 15px;
	background: #fff;
	border: 1px solid #f3f3f3;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}
.signup-form .form-group {
	margin-bottom: 20px;
}
.signup-form label {
	font-weight: normal;
	font-size: 13px;
}
.signup-form .form-control {
	min-height: 38px;
	box-shadow: none !important;
	border-width: 0 0 1px 0;
}	
.signup-form .input-group-addon {
	max-width: 42px;
	text-align: center;
	background: none;
	border-bottom: 1px solid #e1e1e1;
	padding-left: 5px;
}
.signup-form .btn, .signup-form .btn:active {        
	font-size: 16px;
	font-weight: bold;
	background: #241c6c !important;
	border-radius: 3px;
	border: none;
	min-width: 140px;
}
.signup-form .btn:hover, .signup-form .btn:focus {
	background: #241cbc !important;
}
.signup-form a {
	color: #17c0eb;
	text-decoration: none;
}	
.signup-form a:hover {
	text-decoration: underline;
}
.signup-form .fa {
	font-size: 21px;
	position: relative;
	top: 8px;
}
.signup-form .fa-paper-plane {
	font-size: 17px;
}
.signup-form .fa-check {
	color: #fff;
	left: 9px;
	top: 18px;
	font-size: 7px;
	position: absolute;
}

</style>
<script>
$(document).ready(function(){
	// Activate tooltip
	$('[data-toggle="tooltip"]').tooltip();
	
	// Select/Deselect checkboxes
	var checkbox = $('table tbody input[type="checkbox"]');
	$("#selectAll").click(function(){
		if(this.checked){
			checkbox.each(function(){
				this.checked = true;                        
			});
		} else{
			checkbox.each(function(){
				this.checked = false;                        
			});
		} 
	});
	checkbox.click(function(){
		if(!this.checked){
			$("#selectAll").prop("checked", false);
		}
	});
});
</script>
</head>
<body>
 
  
  <a href="home1.jsp">Back</a>
</div> 

   <%
    
  Class.forName("com.mysql.jdbc.Driver");
      
     Connection con= DriverManager.getConnection("jdbc:mysql://localhost/mydb", "Infant Rashmi","Rashmi#18");
     PreparedStatement stmt=null; 
     ResultSet rs=null;
     Statement st=null;
     
     
  %> 



<div class="col-10">
	<div class="container">
        <div class="signup-form">	
    <form action="userprofile.jsp" method="post">
    <%
    st=con.createStatement();
    String phone=(String)session.getAttribute("phno_session");

  
  String sql = "select name,phno,address,area,email,password from customers where phno='"+phone+"'";
  
  
  
   rs=st.executeQuery(sql);     
                            while(rs.next()){
                            %>
                          
		<h2>Profile</h2>
        <div class="form-group">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-user"></i></span>
				<input type="text" class="form-control" name="name" placeholder="Username" value='<%=rs.getString(1)%>' required="required">
			</div>
        </div>
        <div class="form-group">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-lock"></i></span>
				<input type="text" class="form-control" name="phno" placeholder="Phone Number" value='<%=rs.getString(2)%>' required="required">
			</div>
        </div>
      <div class="form-group">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-address-book"></i></span>
				<input type="text" class="form-control" name="address" placeholder="Address" value='<%=rs.getString(3)%>' required="required">
			</div>
        </div> 
        <div class="form-group">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
				<input type="text" class="form-control" name="area" placeholder="Area" value='<%=rs.getString(4)%>' required="required">
			</div>
        </div>
        <div class="form-group">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-user"></i></span>
				<input type="email" class="form-control" name="email" placeholder="Email" value='<%=rs.getString(5)%>' required="required"> 
			</div>
        </div>
        <div class="form-group">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-paper-plane"></i></span>
				<input type="text" class="form-control" name="pass" placeholder="Password" value='<%=rs.getString(6)%>' required="required">
			</div>
        </div>
		
		   
		<div class="form-group">
            <button type="submit" class="btn btn-primary btn-block btn-lg">Save</button>
        </div>
		<%}%>
    </form>
	
</div>
      </div>
</div>
</div>


</body>
<!-- <script>
    $(document).ready(function() {
        function disableBack() { window.history.forward() }

        window.onload = disableBack();
        window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
    });
</script> -->
</html>
<%
String a=request.getParameter("name");
String b=request.getParameter("phno");
String c=request.getParameter("address"); 
String d=request.getParameter("area");
String e=request.getParameter("email");
String f=request.getParameter("pass");


if(a!=null && b!=null &&  d!=null &&f!=null)
{
	String query="update customers set name=?,phno=?,address=?,area=?,email=?,password=? where phno='"+phone+"'";
	stmt=con.prepareStatement(query);
	
	
	
	stmt.setString(1,a);
	stmt.setString(2,b);
	stmt.setString(3,c); 
	stmt.setString(4,d);
	stmt.setString(5,e);
	stmt.setString(6,f);
	stmt.executeUpdate();
	response.sendRedirect("home1.jsp");
}
%>
