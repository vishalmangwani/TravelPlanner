
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public DeleteAction() {
        super();
      
    }

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mail=request.getParameter("deleteoption");
		System.out.println(mail);
		String mail1 = mail;
		String driver="com.ibm.db2.jcc.DB2Driver";
		String url="jdbc:db2://localhost:50000/sample";
		String username="Abhishek";
		String password="microsoft";
		
		
		try
		{
			Class.forName(driver);
			Connection con=DriverManager.getConnection(url, username, password);
			PreparedStatement ps1=con.prepareStatement("delete from login1 where emailid=? ");
			//PreparedStatement ps=con.prepareStatement("delete from register where emailid=? ");
			ps1.setString(1, mail);
		//	ps.setString(1, mail);
		//	int i=ps.executeUpdate();
			int j =ps1.executeUpdate();
			if(j>0){
				Class.forName(driver);
				Connection con1=DriverManager.getConnection(url, username, password);
				
				PreparedStatement ps=con.prepareStatement("delete from register where emailid=? ");
				
				ps.setString(1, mail1);
				int i=ps.executeUpdate();
		if(i>0) {
			response.sendRedirect("http://localhost:8091/Travel/delete.jsp");
				}
		else
			response.sendRedirect("/blank");
	
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
			response.getWriter().write("<html><body><center><h1><strong>");
			response.getWriter().write("Error Occured  Try Again");
		response.getWriter().write("</strong></h1></center></body></html>");
		}
	}
}


