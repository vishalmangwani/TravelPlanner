


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
/**
 * Servlet implementation class adminServlet
 */
public class adminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
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
	PreparedStatement ps=con.prepareStatement("select * from admin where emailid=? and password=?");
	ps.setString(1, userid);
	ps.setString(2, passwrd);
	ResultSet rs=ps.executeQuery();	
	

			if(rs.next())
			{
				
				HttpSession session=request.getSession();
				session.setAttribute("emailid", userid);
				getServletContext().getRequestDispatcher("/view.jsp").forward(request, response);
				
			}
			else
			{
				response.getWriter().write("<html><body><center><h1><strong>");
				response.getWriter().write("Email and password Invalid");
			response.getWriter().write("</strong></h1></center></body></html>");
		getServletContext().getRequestDispatcher("/admin.jsp").include(request, response);
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


