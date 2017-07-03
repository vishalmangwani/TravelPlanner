

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class MsgServlet
 */
public class MsgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MsgServlet() {
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
	
		String value=request.getParameter("t1");
		
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			
			Connection con=DriverManager.getConnection("jdbc:db2://localhost:50000/sample", "Abhishek", "microsoft");
			PreparedStatement ps=con.prepareStatement("insert into place(loc)values(?)");
			ps.setString(1, value);
			int i=ps.executeUpdate();
			
			if(i!=0)
			{
				
	                      	
		
		response.getWriter().write("valid");
		
		 
			}
			
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	//ps.setString(1, value);
		
		
	
	
	
	}

}
