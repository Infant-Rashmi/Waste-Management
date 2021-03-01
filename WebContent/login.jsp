<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapodn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js">
        </script>
 <style>
 .btn {
    height: 100px;
    border-radius: 2px;
     font-size: 15px;
    font-weight: bold;
}</style>
 <script>
function validateForm() {
	 var phoneno = /^\d{10}$/;
if(document.forms["myForm"]["phno"].value.match(phoneno))
     {
	var decimal=  /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
	if(document.forms["myForm"]["pass"].value.match(decimal)) 
	{ 
	return true;
	}
	else
	{ 
	alert('Enter minimum 8 characters,1 small letter,1 capital letter,1 special caharcter!');
	return false;
	}   
    return true;
    }
    else
      {
    	 alert("Enter 10 digit valid mobile number");
    	 return false;
      }

      
      
}

</script>
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

<body onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="" style="background:#241c6c;">
 <a href="welcome.jsp" class="btn1"><i class="fa fa-home"></i> Home</a>
    <div class="wrapper" style="background:white;box-shadow:8px 8px 10px #000;">
      
    <h1 style="color:#241c6c">Login</h1>
    <form name="myForm" action="LoginValidation" onsubmit="return validateForm()" >
  
            <input type="text" placeholder="Phone Number" name="phno"  style="color:black" required>
            <input type="password" placeholder="Password" name="pass" style="color:black" required>
            
         
            <input type="submit" value="Login"  style="background:#241c6c;color:white;">
    </form>  
    <div class="bottom-text">
            <lable style="color:black">&nbsp If you don't have an account</lable> <a href="register.jsp"style="display:inline-block;color:blue;float:left;">Register</a>
            <br>
            <br>
             <a href="forget.jsp" style="color:blue;">Forgot Password?</a>
    </div>
      
    </div>



</body>
<script>
    $(document).ready(function() {
        function disableBack() { window.history.forward() }

        window.onload = disableBack();
        window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
    });
</script>
</html>

