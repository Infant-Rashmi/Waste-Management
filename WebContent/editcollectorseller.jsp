<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<head>

<title>Edit Seller</title>
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
  <a href="collectorprofile.jsp" >Profile</a> 
   <a href="collectorsidebuyer.jsp" >Buyers</a>
  <a href="collectorsideseller.jsp" class="active" >Sellers</a>
  
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
                            String sql = "select * from purchaseorder where id='"+id+"'";
                             rs=st.executeQuery(sql);  
                            while(rs.next()){
                            %>
                            	<%-- <input type="hidden" name="id" value='<%=rs.getString(1)%>'/> --%>
                            	 <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">Name</label>
                                    <div class="col-md-6">
                                        <input type="text" id="id" class="form-control" name="name" value='<%=rs.getString(1)%>'>
                                    </div>
                                </div>
                                
								<div class="form-group row">
                                    <label for="phone_number" class="col-md-4 col-form-label text-md-right">Total</label>
                                    <div class="col-md-6">
                                        <input type="text" id="phone_number" class="form-control" name="total" value='<%=rs.getString(23)%>'>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="email_address" class="col-md-4 col-form-label text-md-right">Paid or not</label>
                                    <div class="col-md-6">
                                        <input type="text" id="email_address" class="form-control" name="paid" value='<%=rs.getString(24)%>'>
                                    </div>
                                </div>     
                                <div class="form-group row">
                                    <label for="email_address" class="col-md-4 col-form-label text-md-right">Payment Mode</label>
                                    <div class="col-md-6">
                                        <input type="text" id="email_address" class="form-control" name="mode" value='<%=rs.getString(25)%>'>
                                    </div>
                                </div>   
                                <div class="form-group row">
                                    <label for="email_address" class="col-md-4 col-form-label text-md-right">Collected or not</label>
                                    <div class="col-md-6">
                                        <input type="text" id="email_address" class="form-control" name="collect" value='<%=rs.getString(26)%>'>
                                    </div>
                                </div>   
                                <div class="form-group row">
                                    <label for="email_address" class="col-md-4 col-form-label text-md-right">Will Collect</label>
                                    <div class="col-md-6">
                                        <input type="text" id="email_address" class="form-control" name="willcollect" value='<%=rs.getString(28)%>'>
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
String e=request.getParameter("name");
String a=request.getParameter("total");
String b=request.getParameter("paid");
String c=request.getParameter("mode");
String d=request.getParameter("collect");
String f=request.getParameter("willcollect");
if(a!=null)
{
	String query="update purchaseorder set name=?,total=?,paid_or_not=?,paymentmode=?,collected_or_not=?,willcollect=?  where id='"+id+"'";
	stmt=con.prepareStatement(query);
	stmt.setString(1,e);
	stmt.setString(2,a);
	stmt.setString(3,b);
	stmt.setString(4,c);
	stmt.setString(5,d);
	stmt.setString(6,f);
	stmt.executeUpdate();
	response.sendRedirect("collectorsideseller.jsp");
}
%>
