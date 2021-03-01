<%@page import="daobjects.DBProcess"%>
<%@page import="daobjects.DBConnect"%>
<%@page import="vaobjects.FormDetails"%>

<jsp:useBean id="obj_formdetails" class="vaobjects.FormDetails" scope="session"/>

<%
		
	        DBProcess dbprocess=new DBProcess();
	
	        try
	        {
	           
	           String name=obj_formdetails.getname();          
	           String phno=obj_formdetails.getPhno();
	           String address=obj_formdetails.getAddress();
	           String area=obj_formdetails.getArea();
	           String email=obj_formdetails.getEmail();
	           String password=obj_formdetails.getPassword();
	           
	          
	
	           String result=dbprocess.savecustomer(name,phno,address,area,email,password);
	
	           if(result.equals("success"))
	            {
	              response.sendRedirect("login.jsp");
	               out.println("<a href='register.jsp'>Back</a>");
	            }
	            else
	            {
	            	 out.println(" Registration Failed     :");
	            	RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
	               
	                  rd.include(request, response);
	              
	               //out.println("<a href='register.jsp'>Back</a>");
	            }
	        }
	        catch(Exception ex)
	        {
	        	
	            out.println(ex);
	        }
		
%>