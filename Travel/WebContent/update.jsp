<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update</title>
<link rel="stylesheet" href="css/style.css">
</head>


<%
if(true)
{
	try
	{
		String userid=(String)session.getAttribute("emailid");
		Class.forName("com.ibm.db2.jcc.DB2Driver");
		Connection con=DriverManager.getConnection("jdbc:db2://localhost:50000/sample", "Abhishek", "microsoft");
		PreparedStatement ps=con.prepareStatement("select * from register where emailid=?");
		ps.setString(1,userid);
		ResultSet rs=ps.executeQuery();
	    
		
	
	
%>	
<body>
		
		<form method="post" class="c1" action="UpdateServlet">
		<table>
		<h1 align="center">Update</h1>
	<%while(rs.next()) 
		{
		%>
		 <caption><h2>Update</h2> </caption>
            <tr>
                <td >First Name </td><td><input type="text" name="fname" value="<%=rs.getString(1)%>" required></input></td>
            </tr>
			<tr>
                <td >Last Name </td><td><input type="text" name="lname" value="<%=rs.getString(2)%>" required></input>
                </td>
            </tr>
			<tr>
                <td >Mobile No</td><td><input type="tel" name="contact"  value="<%=rs.getString(3)%>"required></input></td>
				 </tr>
			<tr>
			
				<tr><td>Address</td>
 				<td><textarea name="address" id="emailBody" cols="18" rows="5"  value="<%=rs.getString(4)%>"></textarea></td>
 				</tr>
 				
 			<tr>			
	<td>State</td>
	<td>		
	<select  name="state"required>
  <option value="<%=rs.getString(5)%>"disabled="disabled"><%=rs.getString(5)%>" Select</option>
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
	<td>State/Place</td>
	<td>		
	<select  name="city"required>
  <option value="<%=rs.getString(6)%>"disabled="disabled"><%=rs.getString(6)%>"Select</option>
  <option value="Hyderabad">Hyderabad</option>
  <option value="Delhi">Delhi</option>
  <option value="Mumbai">Mumbai</option>
  <option value="Kolkata" >Kolkata</option>
  <option value="Bangalore">Bangalore</option>
  <option value="Chaennai">Chaennai</option>
  
  
  
  
</select>
</td></tr> 
			 
			 <tr>
                <td > Password  </td><td><input type="password" name="password" value="<%=rs.getString(7)%>"  required></input>
                </td>
            </tr>
			<tr>
			<td >Birthday</td><td><input type="date" name="dob" value="<%=rs.getString(8)%>" required></input></td>
			 </tr>

	 
	
			
	<tr>			
	<td>Security Question</td>
	<td>		
	<select  name="ques"required>
  <option value="<%=rs.getString(8)%>"disabled="disabled"><%=rs.getString(9)%>" Select</option>
  <option value="what is your place of birth?">what is your place of birth?</option>
  <option value="what is your Mobile Number?">what is your Mobile Number?</option>
  <option value="what is your favourite pet?">what is your favourite pet?</option>
  <option value="what is your school name?" >what is your school name?</option>
  <option value="what is your date of birth?">what is your date of birth?</option>
  <option value="what is your Goal?">what is your Goal?</option>
  
  
  
  
</select>
</td></tr>         
                     
  <tr>
                <td >Answer</td><td><input type="text" name="ans" value="<%=rs.getString(10)%>" size="20"  required></input></td>
            </tr>
			   <tr>
                <td>
				  
				   <input type="reset" value="Reset"  ></input> 
                    <input type="submit" name="Submit" value="update"  ></input>
                </td>
            </tr>	
			
			
        </table>  
 </form>
<%}
	}

	catch(Exception e)
	{
		e.printStackTrace();
	}
}
else
{
	//getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
}
%>	 
 </body>
</html>