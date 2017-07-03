
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>


<%
String driver="com.ibm.db2.jcc.DB2Driver";
String url="jdbc:db2://localhost:50000/sample";
String username="Abhishek";
String password="microsoft";
try
{
	Class.forName(driver);
Connection con=DriverManager.getConnection(url, username, password);
    out.println("DETAILS HERE");
    Statement st1=con.createStatement();
    ResultSet rs1=st1.executeQuery("select * from register");
    
    out.println("<form method='post' action='DeleteUser.jsp'>");
    out.println("<br><h2>FROM::<select  name='from'>");
    while(rs1.next())
    {
    out.println("<option value='"+rs1.getString(8)+"'>"+rs1.getString(8)+"</option>");	
    }
    out.println("</select><br>");
    
    Statement st2=con.createStatement();
    ResultSet rs2=st1.executeQuery("select * from register");
    out.println("<h2> TO::<select  name='to'>");
    while(rs2.next())
    {
    out.println("<option value='"+rs2.getString(5)+"'>"+rs2.getString(5)+"</option>");	
    }
    out.println("</select><br>");
    out.println("<input type='submit'  value='VIEW USERS'>");
    out.println("</form>");
    
    if(request.getParameter("from")!=null)
    {
    String from=request.getParameter("from");
    String to=request.getParameter("to");
    
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from register where fname>='"+from+"' and lname<='"+to+"' ");
    out.println("<form method='post' action='DeleteAction'>");
    out.println("<br><br><br><br><center><table border=1>");
    out.println("<th></th><th>Userid</th><th>Email</th><th>FirstName</th><th>Lastname</th><th>Date of Birth</th><th>Address</th><th>Phoneno</th><th>PASSWORD</th></tr>");
    while(rs.next())
    {
 	   out.println("<tr>");
 	   out.println("<td>"+rs.getString(1)+"</td>");
 	   out.println("<td>"+rs.getString(2)+"</td>");
 	   out.println("<td>"+rs.getString(4)+"</td>");
 	   out.println("<td>"+rs.getString(5)+"</td>");
 	   out.println("<td>"+rs.getString(6)+"</td>");
 	   out.println("<td>"+rs.getString(7)+"</td>");
 	   out.println("<td>"+rs.getString(8)+"</td>");
 	   out.println("<td>"+rs.getString(3)+"</td>");
 	   
 	   out.println("</tr>");
 	   
    }
    out.println("</table>");
    out.println("<input type='submit' value='DELETE'></form>");
    }
 }
catch(Exception e)
{
	out.println(e);
}
%>



</body>
</html>