<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Savedplaces</title>
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
                   
                 	 <li><a href="Homepage.jsp">user</a></li>
                  	 <li><a href="Directions.jsp">Directions</a></li>
                    <li><a href="showplaces.jsp">SavedplacesMap</a></li>
                    <li><a href="showoff.jsp">ViewAddress</a></li>
                 
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


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>


 <%
 String abc=(String)session.getAttribute("emailid");
    try
    {
    	Class.forName("com.ibm.db2.jcc.DB2Driver");
    	String driver="jdbc:db2://localhost:50000/sample";
    	String url="Abhishek";
    	String pass="microsoft";
    	Connection con=DriverManager.getConnection(driver, url, pass);
    	PreparedStatement ps=con.prepareStatement("select * from places where userid=?");
    	ps.setString(1, abc);
    	ResultSet rs=ps.executeQuery();  
    	  
    	out.print("<table width=50% border=1>");  
    	out.print("<caption>"+abc+":</caption>"); 
    	
    	
    	
    	out.print("<tr><th>Place</td><td>Address</td><tr>");
    	while(rs.next())  
    	{  
    		
    		out.print("<tr><td>"+rs.getString("pname")
    				+"  </td><td>"+rs.getString("address")+"</td></tr>");    
    	                  
    	} 
    	out.print("</table>");  
    	
    }
    
    catch(Exception e){e.printStackTrace();}%>
    	
    	  
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