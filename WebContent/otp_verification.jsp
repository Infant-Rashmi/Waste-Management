<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>otp verification</title>
<style>
body{
  font-family: Calibri, Helvetica, sans-serif;
  background-color: #2F4F4F;
  
}
.sub{
background-color:#2F4F4F;
border:none;
color:white;
padding:15px 25px;
margin-top:25px;
text-align:center;
font-size:15px;
box-shadow:0 8px 16px 0 rgba(0,0,0,0.2);
position:relative;
-ms-transform:translate(-50%,-50%);
transform:translate(-50%,-50%);
left:50%;

}
.header
{
font-family:"Cursive";
padding: 60px;
  text-align: center;
  background-image:url("https://www.utshockey.org/wp-content/uploads/2015/11/RegisterNow_small.jpg");
  object-fit:fill;
 
  color: white;
  font-size: 30px;
}
.b1{
background-color:#2F4F4F;
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
color:BLACK;
font-family: Calibri, Helvetica, sans-serif;
font-size:15;

}
.container {
    padding: 50px;
  background-color: #5F9EA0;
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
<script>
function validate()
{
	if(document.getElementById("otp").value==document.getElementById("otp1").value)
		{
		return true;
		}
	else
		{
		alert("OTP wrong");
		return false;
		}
}
</script>
</head>
<body onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="">

<form method="post" action = "StoreDetails.jsp" onsubmit="return validate();">
<div class="container">
<label>OTP</label>
<input type="text" id="otp" name="otpvalue"/>
<input type="submit" value="submit" />
<input type="hidden" id="otp1" value="<%= request.getAttribute("Message")%>"/>

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
