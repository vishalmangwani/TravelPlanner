

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession; 
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class LoginServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginServlet1() {
        super();

    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid=request.getParameter("userid");
		String passwrd=request.getParameter("password");
		String driver="com.ibm.db2.jcc.DB2Driver";
		String url="jdbc:db2://localhost:50000/sample";
		String username="Abhishek";
		String password="microsoft";
		
		
		
		
		if(userid.equals("")||passwrd.equals(""))
		{
			response.getWriter().write("<html><body><center><h1><strong>");
			response.getWriter().write("emailid or password cannot be empty");
		response.getWriter().write("</strong></h1></center></body></html>");
	getServletContext().getRequestDispatcher("/login.jsp").include(request, response);
		}
		
		
		
		
		
		
		
		else
		{
			try
	{
				Class.forName(driver);
		Connection con=DriverManager.getConnection(url, username, password);
	PreparedStatement ps=con.prepareStatement("select * from login1 where emailid=? and password=?");
	ps.setString(1, userid);
	ps.setString(2, passwrd);
	ResultSet rs=ps.executeQuery();	
	

			if(rs.next())
			{
				
				HttpSession session=request.getSession();
				session.setAttribute("emailid", userid);
				getServletContext().getRequestDispatcher("/Homepage.jsp").forward(request, response);
				
			}
			else
			{
				response.getWriter().write("<html><body><center><h1><strong>");
				response.getWriter().write("Email and password Invalid");
			response.getWriter().write("</strong></h1></center></body></html>");
		getServletContext().getRequestDispatcher("/login.jsp").include(request, response);
			}
			
	}
			catch(Exception e)
			{
				
				e.printStackTrace();
				response.getWriter().write("<html><body><center><h1><strong>");
				response.getWriter().write("Error Occured  Try Again");
			response.getWriter().write("</strong></h1></center></body></html>");
				getServletContext().getRequestDispatcher("/index.html").include(request, response); 
			}
			
			
			
			
			
			
		}
		
		
	}

}
