<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<head>

<title>Edit Admin</title>
 <link rel="stylesheet" href="css/sidebar.css">
<!-- <link rel="stylesheet" href="css/seller.css">--> 
<link rel="stylesheet" href="css/admincollector.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">

</head>
<body>
<div class="row">
<div class="col-4">
<div class="sidebar">
<br>

<p class="text-center"><i class="material-icons" title="dashboard" style="font-size:30px">dashboard</i>DASHBOARD</p>
<br>
  <a  href="admin1.jsp" class="active">Admin</a>
  <a href="buyerdetails.jsp" >Buyer</a>
  <a href="sellerdetails.jsp" >Seller</a>
  <a href="collector1.jsp">Collector</a>
  <a href="welcome.jsp">Logout</a>
</div>
  
  <%
     
 Class.forName("com.mysql.jdbc.Driver").newInstance();
      Connection con= DriverManager.getConnection("jdbc:mysql://localhost/mydb","Infant Rashmi","Rashmi#18");
      PreparedStatement stmt=null;
      ResultSet rs=null;
      Statement st=null;
      
      
      //rs.next();
     
  %>
</div>
    <div class="col-8">
        <main class="my-form">
        
    <div class="cotainer-fluid mt-100">
        <div class="row">
             <div class="col-lg-8">
                    <div class="card">/
                       <!--  <div class="card-header">Register</div>-->
                        <div class="card-body">
                            <form name="my-form" action="" method="post">
                            <%
                            st=con.createStatement();  
                            String Id=request.getParameter("u");
                            int id=Integer.parseInt(Id);
                            String sql = "select * from Admin where Id='"+id+"'";
                             rs=st.executeQuery(sql);  
                            while(rs.next()){
                            %>
                            	<%-- <input type="hidden" name="id" value='<%=rs.getString(1)%>'/> --%>
                            	 <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">Id</label>
                                    <div class="col-md-6">
                                        <input type="text" id="id" class="form-control" name="id" value='<%=rs.getString(1)%>'>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">User Name</label>
                                    <div class="col-md-6">
                                        <input type="text" id="user_name" class="form-control" name="username" value='<%=rs.getString(2)%>'>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">Password</label>
                                    <div class="col-md-6">
                                        <input type="text" id="Password" class="form-control" name="password" value='<%=rs.getString(3)%>'>
                                    </div>
                                </div>

								<div class="form-group row">
                                    <label for="phone_number" class="col-md-4 col-form-label text-md-right">Contact Number</label>
                                    <div class="col-md-6">
                                        <input type="text" id="phone_number" class="form-control" name="contactno" value='<%=rs.getString(4)%>'>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="email_address" class="col-md-4 col-form-label text-md-right">E-Mail</label>
                                    <div class="col-md-6">
                                        <input type="text" id="email_address" class="form-control" name="email-address" value='<%=rs.getString(5)%>'>
                                    </div>
                                </div>                  
                              <%
                              }
                              %>
                              <div class="col-md-6 offset-md-4">                          
                              <div class="text-center">
            <button type="submit" class="btn btn-primary text-center" style='margin-right: 25px'>Save</button>
              </div>                
     </div>
        </div>
					</div>			
                               
                            </form>
                        </div>
                    </div>

        </div>
       
        
</main>
    
    

    </div>
</div>
</body>
</html>
<%
String e=request.getParameter("id");
String a=request.getParameter("username");
String b=request.getParameter("password");
String c=request.getParameter("contactno");
String d=request.getParameter("email-address");
if(a!=null && b!=null && c!=null && d!=null && e!=null)
{
	String query="update Admin set Id=?,Username=?,Password=?,Contactno=?,mailId=? where Id='"+id+"'";
	stmt=con.prepareStatement(query);
	stmt.setString(1,e);
	stmt.setString(2,a);
	stmt.setString(3,b);
	stmt.setString(4,c);
	stmt.setString(5,d);
	stmt.executeUpdate();
	response.sendRedirect("admin1.jsp");
}
%>
