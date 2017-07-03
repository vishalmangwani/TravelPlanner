
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/**
 * Servlet implementation class save
 */
public class save extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public save() {
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
		
		
		
		
		String emailid=request.getParameter("emailid");
		String lat=request.getParameter("lat");
		String longitude=request.getParameter("long");

		String url="jdbc:db2://localhost:50000/sample";
		String driver="com.ibm.db2.jcc.DB2Driver";
		String username="Abhishek";
		String password= "microsoft";
		
		try
		{
			Class.forName(driver);
			Connection con=DriverManager.getConnection(url, username, password);
			try 
			{
				if(lat.equals(""))
				{
					
				}
				else
				{
					PreparedStatement ps=con.prepareStatement("insert into places(lat)values(?)");
					ps.setString(1, lat);
					//ps.setString(2, emailid);
					int i=ps.executeUpdate();
				}
				if(longitude.equals(""))
				{
					
				}
				else
				{
					PreparedStatement ps=con.prepareStatement("update places set long=?");
					ps.setString(1, longitude);
					//ps.setString(2, emailid);
					int i1=ps.executeUpdate();
				}
			}
				catch(Exception e)
				{
					e.printStackTrace();
					response.getWriter().write("<html><body><center><h1><strong>");
					response.getWriter().write("updation Failed-1 Try Again");
					response.getWriter().write("</strong></h1></center></body></html>");
					getServletContext().getRequestDispatcher("/update1").include(request, response);
				}
				
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
