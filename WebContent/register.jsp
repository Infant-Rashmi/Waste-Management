<!DOCTYPE html>
<html>
<head>
<title>Register</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
 <link rel="stylesheet" href="css/sidebar.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js">
        </script>
<style>
body{
  font-family: Calibri, Helvetica, sans-serif;
  background-color: #241c6c;
  
}
.sub{
background-color:white;
border:none;
color:#241c6c;
padding:15px 25px;
margin-top:25px;
text-align:center;
font-size:15px;
box-shadow:0 8px 16px 0 rgba(0,0,0,0.2);
position:relative;
-ms-transform:translate(-50%,-50%);
transform:translate(-50%,-50%);
left:50%;
text-style:bold;

}
.header
{
font-family:"Cursive";
padding: 60px;
  text-align: center;
  background-image:url("https://www.google.com/url?sa=i&url=https%3A%2F%2Fnorthernoaks.greatheartsamerica.org%2Facademy-life%2Fsummer-programs%2Fregister-now-button-cropped-v2%2F&psig=AOvVaw0Q01mgsWwOe8qSR7wuJUws&ust=1613151113100000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCPiG7YGu4u4CFQAAAAAdAAAAABAw");
  object-fit:fill;
 
  color: white;
  font-size: 30px;
}
.b1{
background-color:#17c0eb;
border:none;
color:white;
padding:15px 25px;
text-align:center;
font-size:10px;
box-shadow:0 8px 16px 0 rgba(0,0,0,0.2);
}
img
{
margin-left:auto;
margin-right:auto;
display:block;
width:50%;
}
label{
color:white;
font-family: Calibri, Helvetica, sans-serif;
font-size:15;

}
.container {
    padding: 50px;
  background-color: #241c6c;
}

input[type=text], input[type=password], textarea {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: white;
}
input[type=text]:focus, input[type=password]:focus {
  background-color:white;
  outline: none;
}
 div {
            padding: 10px 0;
         }
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}
.registerbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}
.registerbtn:hover {
  opacity: 1;
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
<script type="text/javascript">

function regvalidation()
{
	
	
	var reg=/^[6-9][0-9]{9}$/;
	var passregex=/^(?=.\d)(?=.[a-z])(?=.[A-Z])(?=.[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
	 if(!document.forms["Regform"]["phno"].value.match(reg))
		{
		alert("Please enter valid phone number");
		return false;
		} 
	 var reg1=/^[A-Za-z_ ]+$/;
	 if(!document.forms["Regform"]["name"].value.match(reg1))
		{
		alert("Name Should contain only alphabets");
		return false;
		} 

	//if(!document.forms["Regform"]["psw"].value.match(passregex))
		//{
		//alert("Password doesn't satisfy");
		//return false;
		//} 
	if(!document.forms["Regform"]["password"].value.match(document.forms["Regform"]["psw-repeat"].value))
	
		{
		alert("Password doesn't match");
		return false;
		}
		return true;
}


	

</script>
</head>
<body onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="">
 <a href="login.jsp" class="btn1"><i class="fa fa-home"></i> Login</a>

<form   name="Regform" onsubmit="return regvalidation()" action="regvalidation" method="get">
  <div class="container">
  <img src="regimg.jpg">
  <br>
  <br>
  <hr style="width:50%">
  <label>Name </label> 
<input type="text" name="name" id="name" placeholder= "Name" size="15" onkeyup=sync() required /> 

<label> 
Phone
</label>
<input type="text" name="phno" id="phno" placeholder="Phone" size="10" required/> 
<!--  <label>Enter OTP</label>
<input type="text" name="otp" placeholder="Enter otp" size="10" required/>

<button type ="button" class="b1">Click for OTP</button>-->
<br><br>
<label>Address</label>

<textarea cols="80" rows="5" placeholder="Address" name="address" required>
</textarea>
<label>Area</label>
<textarea placeholder="Area"  name="area" required>
</textarea>
 <label for="email">Email</label>
 <input type="text" placeholder="Enter Email" name="email" required/>

    <label for="psw">Password</label>
    <input type="password" placeholder="Enter Password" name="password" id="pass" required/>

    <label for="psw-repeat">Re-type Password</label>
    <input type="password" placeholder="Retype Password" name="psw-repeat" id="psw-repeat" required/>
  
    	
  <input type="submit"class="sub" value="Submit"/>
    
    </div>
</form>


</body>
<script>
    $(document).ready(function() {
        function disableBack() { window.history.forward() }

        window.onload = disableBack();
        window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
    });
</script>
</html>