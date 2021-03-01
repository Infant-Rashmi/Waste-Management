<%@page import="java.sql.*" %>
<html>

  <head>

    <title>
      Make your Choice
    </title>
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
    @charset "ISO-8859-1";
.head
{
  text-align: right;
  background:#241c6c;
}
.btn1 {
  background-color: #241c6c;
  border: none;
  color: white;
  padding: 12px 30px;
  font-size: 20px;
  cursor: pointer;
  border-radius:12px;
  box-shadow:0 8px 16px 0 rgba(0,0,0,0.2);
  
  
}
h1
{
  text-align: center;
  color:white;
  margin-top:40px;
  text-shadow:1px 1px #241c6c;
  letter-spacing:1px;
}
.btn1:hover {
  background-color: RoyalBlue;
}
.btn1:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

.btn 
{
  float:right;
  background-color:white;
  display:inline-block;
  color:#241c6c;
  padding:15px 32px;
  font-size:20px;
  border-radius:12px;
  border:1px solid white;
  margin-left:5px;
  margin-bottom:5px;
  box-shadow:0 8px 16px 0 rgba(0,0,0,0.2);
}
#cont
{
  display: block;
  text-align: center;

  margin: auto;
}
#btn2
{
  display: block;
  margin: auto;

  text-align: center;
}
.center 
{
  text-align: center;
  margin: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}
.coupon
{
background-image:url(coupon.jpg);
background-size:cover;
width:300px;
height:200px;
font-size:2rem;
border-radius:10px;
}
</style>
  </head>

  <body style="background:white;">
  
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
ResultSet resultSet = null,rst=null,resultSet1=null,res=null,res1=null;

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


<%
      if (session != null) {
         if (session.getAttribute("phno_session") != null) {
         
            out.print("Hello " + res.getString("name") + " ,Welcome to your Profile");
            purchaseno=res.getInt("purchaseno");%>
         




    <div class="head">
      <h1><br><b>
          What would you like to do?</b>
          </h1>
         
          <button class="btn">
      &nbsp;
        <i class="fas fa-user-circle" onclick="window.location.href = 'userprofile.jsp';"></i>
        &nbsp;
      </button>
      
    
      <button class="btn" onclick="window.location.href = 'welcome.jsp';">
      &nbsp;<i class="fas fa-sign-out-alt"></i>&nbsp;
      </button>
     
      
    
 
     
      <hr style="border:1px solid white;width:100%;border-width:3px;">
      
    </div>


    <div class="container">
      <div class="center">
        <div id="cont">
          <button class="btn1" onclick="window.location.href = 'buyer.jsp';" >BUY&nbsp;
            <i class="fas fa-shopping-cart"></i></button>
        </div>
<br>
<br>
        <div id="btn2">
          <button class="btn1" onclick="window.location.href = 'seller.jsp';">SELL <i class="fas fa-store"></i></button>
        </div>

      </div>

    </div>
     <%  if(purchaseno>0)
            {
    	
            	PreparedStatement pst1=connection.prepareStatement("select * from purchaseorder where id=? ");
            	
            	pst1.setInt(1, purchaseno);
            	
            	res1 = pst1.executeQuery();
            	
            	while(res1.next()){
            		
            		String paymentmode=res1.getString("paymentmode");
                    String collected_or_not=res1.getString("collected_or_not");
                    if(paymentmode.equals("coupon") && collected_or_not.equals("yes") )
                    {
                    	
            %>
            <button class="coupon" onclick="window.location.href ='coupon.jsp';" style="background-image: url(coupon.jpg)">Collect Your Coupon</button>
  
<%} }}%>
   

  <% } else {
            response.sendRedirect("login.jsp");
         }
         //response.sendRedirect("seller.jsp");
      }
   %>
    
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
    
     

  </body>

</html>