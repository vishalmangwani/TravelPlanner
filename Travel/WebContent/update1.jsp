<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>update</title>
<meta name="keywords" content="travel and tour, free website template, CSS, HTML" />
<meta name="description" content="On the Roads" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />




</head>
<body>
<div id="templatemo_wrapper_outter">
<div id="templatemo_wrapper_inner">
<div id="templatemo_wrapper">
<div id="templatemo_container">

	<div id="templatemo_header">
    
    	<div id="header_left">
        
  		<center>      	
  		<div id="templatemo_menu">
  	<ul>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="Directions.jsp">Directions</a></li>
                  	<li><a href="update1.jsp" class="current">Update</a></li>
                  	<li><a href="profile.jsp">Profile</a></li>
                    <li><a href="contact.jsp">Contact Us</a></li>
                 
                </ul>    	
			</div> <!-- end of templatemo_menu -->
        
        	<div id="site_title">
                               	<h1>On the Roads-Trip Planner</h1>
                    
                
            </div></center>
        
        </div> <!-- end of header left -->
        
        
        <div class="cleaner"></div>
    
    </div> <!-- end of header -->
    
    <div id="templatemo_content_wrapper">
    
    	<div id="templatemo_content_outer">
        
        	<div id="templatemo_content">
            
            	<div class="content_section">
            	
            	
<%
	try
	{
		String abc=(String)session.getAttribute("emailid");
		Class.forName("com.ibm.db2.jcc.DB2Driver");
		Connection con=DriverManager.getConnection("jdbc:db2://localhost:50000/sample", "Abhishek", "microsoft");
		PreparedStatement ps=con.prepareStatement("select * from register where emailid=?");
		ps.setString(1,abc);
		ResultSet rs=ps.executeQuery();
%>
<form name="updation" action="update" method="POST">
		<table>
<%
		if(rs.next())
		{
%>

<table class="a" width="400px" >
		   <caption><h2>update</h2> </caption>
            <tr>
                <td >First Name </td><td><input type="text" name="fname"required></input></td>
            </tr>
			<tr>
                <td >Last Name </td><td><input type="text" name="lname" required></input>
                </td>
            </tr>
            <tr>
                <td >Birthday</td><td><input type="date" name="dob" required></input></td>
			 </tr>	
			 <tr>
                <td >Mobile No</td><td><input type="tel" name="contact" required></input></td>
			</tr>
			<tr>
 			<td>Address</td>
 			<td><textarea name="address" id="emailBody" cols="18" rows="5"></textarea></td>
			 </tr>
			<tr>			
	<td>State</td>
	<td>		
	<select  name="state"required>
  <option value="" >Select</option>
  <option value="A.P">Andhrapradesh</option>
  <option value="Telangana">Telangana</option>
  <option value="Tamilnadu">Tamilnadu</option>
  <option value="Maharashtra" >Maharashtra</option>
  <option value="WestBengal">WestBengal</option>
  <option value="Karnataka">Karnataka</option>
  <option value="Delhi">Delhi</option>
  
  
  
	</select>
	</td></tr>
		<tr>
			<td align=right><input type="reset" value="Reset"></td>
			<td><input type="submit" value="Update"></td>
		</tr>
	</table>
	<input type=hidden name="emailid" value=<%=abc %> >
<%
		}
%>
</form>


<%		
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
%>	












</div>
                
                             <div class="cleaner"></div>
                    
                
                	<div class="cleaner"></div>
                </div>
            
            </div><!-- end of templatemo_content -->
        </div> <!-- end of templatemo_content_outer -->
        
       
    
    <div id="templatemo_footer">
    
        
    
           
         
    <!-- end of footer -->

<div class="cleaner"></div>
</div>
</div>
</div>
</div>
</div>
















</body>
</html>