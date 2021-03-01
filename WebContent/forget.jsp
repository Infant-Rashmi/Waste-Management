<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
   <head>
      <title>Reset Password</title>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:300i,400,700&display=swap" rel="stylesheet">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
      <script>
      function validateForm() {
    	  
      var decimal=  /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
  	if(document.forms["myform"]["newpass"].value.match(decimal)) 
  	{ 
		return true;
  //	return true;
  	}
  	else
  	{ 
  	alert('Enter minimum 8 characters,1 small letter,1 capital letter,1 special caharcter!');
  	return false;
  	}
  	
      }
      </script>
      <style>
         body {
         background-color: #241c6c;
         font-family: Nunito Sans;
         }
         .btn {
         background-color: #241c6c;
         width: 100%;
         color: #fff;
         padding: 10px;
         font-size: 18px;
         }
         .btn:hover {
         background-color: #2d3436;
         color: #fff;
         }
         input {
         height: 50px !important;
         }
         .form-control:focus {
         border-color: #18dcff;
         box-shadow: none;
         }
         h3 {
         color: #241c6c;
         font-size: 36px;
         }
         .cw {
         width: 35%;
         }
         @media(max-width: 992px) {
         .cw {
         width: 60%;
         }
         }
         @media(max-width: 768px) {
         .cw {
         width: 80%;
         }
         }
         @media(max-width: 492px) {
         .cw {
         width: 90%;
         }
         }
      </style>
   </head>
  
   <body>
     
      <div class="container d-flex justify-content-center align-items-center vh-100">
         <div class="bg-white text-center p-5 mt-3 center">
            <h3>Forgot Password </h3>
         
            <form class="pb-3"  name="myform" action="forget1.jsp" onsubmit="return validateForm()">
               <div class="form-group">
                  <input type="text" name="phno" class="form-control" placeholder="Your Phone Number" required>
                  <br>
                   <input type="text" name="newpass" class="form-control" placeholder="Enter new password" required>
                 
                  
            
                  
               </div>
               <button type="submit" class="btn" >Reset Password</button>
            </form>
             <a href="login.jsp" class="btn" style="float:right;height:48px;color:white;"><i class="fa fa-home"></i> Back </a>
         </div>
      </div>
   </body>
</html>