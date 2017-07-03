

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
 * Servlet implementation class update
 */
public class update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update() {
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
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String dob=request.getParameter("dob");
		String contact=request.getParameter("contact");
		String address=request.getParameter("address");
		String state=request.getParameter("state");
		
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
					if(fname.equals(""))
					{
						
					}
					else
					{
						PreparedStatement ps=con.prepareStatement("update register set fname=? where emailid=?");
						ps.setString(1, fname);
						ps.setString(2, emailid);
						int i=ps.executeUpdate();
					}
					
					if(lname.equals(""))
					{
						
					}
					else
					{
						PreparedStatement ps1=con.prepareStatement("update register set lname=? where emailid=?");
						ps1.setString(1, lname);
						ps1.setString(2, emailid);
						int i1=ps1.executeUpdate();	
					}
					if(dob.equals(""))
					{
						
					}
					else
					{
						PreparedStatement ps2=con.prepareStatement("update register set dob=? where emailid=?");
						ps2.setString(1, dob);
						ps2.setString(2, emailid);
						int i2=ps2.executeUpdate();	
					}
					if(contact.equals(""))
					{
						
					}
					else
					{
						PreparedStatement ps3=con.prepareStatement("update register set contact=? where emailid=?");
						ps3.setString(1, contact);
						ps3.setString(2, emailid);
						int i3=ps3.executeUpdate();	
					}
					if(address.equals(""))
					{
						
					}
					else
					{
						PreparedStatement ps4=con.prepareStatement("update register set address=? where emailid=?");
						ps4.setString(1, address);
						ps4.setString(2, emailid);
						int i4=ps4.executeUpdate();	
					}
					if(state.equals("Default"))
					{
						
					}
					else
					{
						PreparedStatement ps5=con.prepareStatement("update register set state=? where emailid=?");
						ps5.setString(1, state);
						ps5.setString(2, emailid);
						int i5=ps5.executeUpdate();	
					}
					    
						response.getWriter().write("<html><body><center><font color=#151B54><strong>");
						response.getWriter().write("Updation successful.....");
						response.getWriter().write("</strong></font></center></body></html>");
						getServletContext().getRequestDispatcher("/profile.jsp").include(request, response);
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
