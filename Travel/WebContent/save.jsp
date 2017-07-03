<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page import="java.sql.*"%>  
  
<%  
try
{
String abc=(String)session.getAttribute("emailid");
if(abc==null){out.print("Null value");}

else{
String placeid=request.getParameter("pid");  
String pname=request.getParameter("pname"); 
String address=request.getParameter("address");
Class.forName("com.ibm.db2.jcc.DB2Driver");
Connection con=DriverManager.getConnection("jdbc:db2://localhost:50000/sample", "Abhishek", "microsoft");
PreparedStatement ps=con.prepareStatement("insert into places(userid,placeid,address,pname) values(?,?,?,?)");
ps.setString(1,abc);
ps.setString(2,placeid);
ps.setString(3,address);
ps.setString(4,pname);
int i=ps.executeUpdate();
if(i!=0)
{
	
              	

response.getWriter().write("Inserted successfully");


}
}

%>  
<input type=hidden name="emailid" value=<%=abc %> >

<% 
}
catch(Exception e)
	{
		e.printStackTrace();
	}
%>




</body>
</html>