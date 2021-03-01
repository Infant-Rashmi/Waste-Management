<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<head>

<title>Logot</title>
 <link rel="stylesheet" href="css/sidebar.css">
<!-- <link rel="stylesheet" href="css/seller.css">--> 
<link rel="stylesheet" href="css/admincollector.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</head>
<body>
<div class="row">
<div class="col-4">
<div class="sidebar">
  <a  href="admin.jsp" class="active">Admin</a>
  <a href="buyerdetails.jsp" >Buyer</a>
  <a href="sellerdetails.jsp" >Seller</a>
  <a href="collector.jsp">Collector</a>
  <a href="logout">Logout</a>
</div>

</div>
 </div></body>
    