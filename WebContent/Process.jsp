<jsp:useBean id="obj_formdetails" class="vaobjects.FormDetails" scope="session">
    <jsp:setProperty name="obj_formdetails" param="name" property="name"/>
    <jsp:setProperty name="obj_formdetails" param="phno" property="phno"/>
    <jsp:setProperty name="obj_formdetails" param="address" property="address"/>
    <jsp:setProperty name="obj_formdetails" param="area" property="area"/>
    <jsp:setProperty name="obj_formdetails" param="email" property="email"/>
    <jsp:setProperty name="obj_formdetails" param="password" property="password"/>
</jsp:useBean>


<%@page import ="java.io.BufferedReader"%>
<%@page import ="java.io.InputStreamReader"%>
<%@page import ="java.io.OutputStreamWriter" %>
<%@page import ="java.net.HttpURLConnection "%>
<%@page import ="java.net.URL" %>
<%@page import ="java.net.URLConnection" %>
<%@page import ="java.net.URLEncoder" %>
<%@page import= "java.util.Random "%>
<%@page import="vaobjects.FormDetails"%>


<% 
try {
	    //int SentOTP=9999;
	    System.out.println("otp sent");
	    Random rand=new Random();
	    int SentOTP=rand.nextInt(999999);
	    String appName = "WASTE MANAGEMENT"; //change this to your appname
	  // System.out.println(obj_formdetails.getPhno());
		String number = obj_formdetails.getPhno();
	    // String number=request.getParameter("phno");
	    //String number = FormDetails.getPhno();
		String apiKey = "apikey=" + "toKpcNYHNaA-ivWRRSO6JplPCS4rNoHzU6BUkTkGgy";
		String message = "&message=" + "Greetings from " + appName + ", your OTP is " +SentOTP;
		String sender = "&sender=" + "MOHRAM";
		String numbers = "&numbers=" + number;			
		HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?").openConnection();
		String data = apiKey + numbers + message + sender;
		conn.setDoOutput(true);
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
		conn.getOutputStream().write(data.getBytes("UTF-8"));
		final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		final StringBuffer stringBuffer = new StringBuffer();
		String line;
		while ((line = rd.readLine()) != null)
		{
			stringBuffer.append(line);
		}
		rd.close();
		//out.println(stringBuffer.toString());
		request.setAttribute("Message", SentOTP);
			getServletContext().getRequestDispatcher("/otp_verification.jsp").forward(
					request, response);
		%>
		
		
		<%
	} 

	catch (Exception e) {
	System.out.println("Error SMS "+e);
	out.println("Error "+e);
	}
	finally{
		
		
		
	}


%>