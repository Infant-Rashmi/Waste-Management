<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body{
  font-family: Calibri, Helvetica, sans-serif;
  background-color: pink;
}
.container {
    padding: 50px;
  background-color: lightblue;
}

input[type=text], input[type=password], textarea {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}
input[type=text]:focus, input[type=password]:focus {
  background-color: orange;
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
<script type="text/javascript">

function regvalidation()
{
	
	//var username=document.getElementById("name");
	//var phoneno= document.getElementById("phone").value;
	//var add=document.getElementById("address");
	//var emailid=document.getElementById("email");
	//var pass=document.getElementById("psw").value;
	//var passrepeat=document.getElementById("psw-repeat").value;
	//var phone_expression=/^[6-9][0-9]{9}$/;
	
	var reg=/^[6-9][0-9]{9}$/;
	var passregex=/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
	 if(!document.forms["Regform"]["phone"].value.match(reg))
		{
		alert("Please enter valid phone number");
		return false;
		} 

	if(!document.forms["Regform"]["psw"].value.match(passregex))
		{
		alert("Password doesn't satisfy");
		return false;
		} 
	if(!document.forms["Regform"]["psw"].value.match(document.forms["Regform"]["psw-repeat"].value))
	
		{
		alert("Password doesn't match");
		return false;
		}
		return true;
}
	

</script>
</head>
<body>
<form action="otp.jsp">
<label>Enter OTP</label>
<input type="text" name="otp" placeholder="Enter otp" size="10" required/>
<button type="button" onclick="otp.jsp" >Click for OTP</button></a>
</form>
<form  method="post" name="Regform" onsubmit="return regvalidation()"  action="Process.jsp">
  <div class="container">
  <center>  <h1> Registeration Form</h1> </center>
  <hr>
  <label>Name </label> 
<input type="text" name="name" placeholder= "Name" size="15" required /> 

<label> 
Phone :
</label>
<input type="text" name="phone" id="phone" placeholder="phone no." size="10"/ required> 



<br>
<label>Address:</label>

<textarea cols="80" rows="5" placeholder="Address" value="address" required>
</textarea>
 <label for="email"><b>Email</b></label>
 <input type="text" placeholder="Enter Email" name="email" required/>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" id="psw" required/>

    <label for="psw-repeat"><b>Re-type Password</b></label>
    <input type="password" placeholder="Retype Password" name="psw-repeat" id="psw-repeat" required/>
    <input type="submit" value="Submit"/>
</form>


</body>
</html>

