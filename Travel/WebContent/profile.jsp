<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
     <%@page import="java.sql.DriverManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User profile</title>
<meta name="keywords" content="travel and tour, free website template, CSS, HTML" />
<meta name="description" content="On the Roads" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />

<link rel="Stylesheet" type="text/css" href="css/style.css ">
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
                 
                  	<li><a href="update1.jsp">Update</a></li>
                  	<li><a href="profile.jsp" class="current">Profile</a></li>
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
		String userid=(String)session.getAttribute("emailid");
		Class.forName("com.ibm.db2.jcc.DB2Driver");
		Connection con=DriverManager.getConnection("jdbc:db2://localhost:50000/sample", "Abhishek", "microsoft");
		PreparedStatement ps=con.prepareStatement("select * from register where emailid=?");
		ps.setString(1,userid);
		ResultSet rs=ps.executeQuery();
%>


<form method="post" class="c1" >
		<table>
		<h1 align="center"></h1>
	<%if(rs.next()) 
		{
		%>
		 <caption><h2>Profile</h2> </caption>
            <tr>
                <td >First Name </td><td><%=rs.getString(1)%></td>
            </tr>
			<tr>
                <td >Last Name </td><td> <%=rs.getString(2)%>
                </td>
            </tr>
			<tr>
                <td >Mobile No</td><td><%=rs.getString(3)%></td>
				 </tr>
			<tr>
			
				<tr><td>Address</td>
 				<td><%=rs.getString(4)%></td>
 				</tr>
 				
 			<tr>			
	<td>State</td>
	<td>		
	<%=rs.getString(6)%>
  
  
</select> 
</table>  
 </form>


<%
	}
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