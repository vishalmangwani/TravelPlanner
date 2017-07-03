

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateServlet
 */
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
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
		
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String contact=request.getParameter("contact");
		String address=request.getParameter("address");
		
		String state=request.getParameter("state");
		String city=request.getParameter("city");
		String password=request.getParameter("password");
		String emailid=request.getParameter("emailid");
		String dob=request.getParameter("dob");
		String que=request.getParameter("ques");
		String ans=request.getParameter("ans");
		
		
		
		System.out.println(fname);
		System.out.println(lname);
		System.out.println(contact);
		System.out.println(address);
		
		System.out.println(state);
		System.out.println(city);
		System.out.println(password);
		System.out.println(dob);
		System.out.println(que);
		System.out.println(ans);
		if(fname.equals("")||lname.equals("")||contact.equals("")||address.equals("")||state.equals("")||city.equals("")||password.equals("")||dob.equals("")||que.equals("")||ans.equals(""))
		{
response.getWriter().write("all fields are mandatery");
			}
		else
		{
			try
			{
				Class.forName("com.ibm.db2.jcc.DB2Driver");
				Connection con=DriverManager.getConnection("jdbc:db2://localhost:50000/sample", "Abhishek", "microsoft");
				PreparedStatement ps=con.prepareStatement("update  abhishek.register set(fname,lname,contact,address,state,city,password,dob,ques,ans)=(?,?,?,?,?,?,?,?,?,?)where emailid=?");
				System.out.println("connected");
				ps.setString(1,fname);
				ps.setString(2,lname);
				ps.setString(3,contact);
				ps.setString(4,address);

				ps.setString(5,state);
				ps.setString(6,city);
				ps.setString(7,password);
				ps.setString(8,dob);
				ps.setString(9,que);
				ps.setString(10,ans);
				System.out.println("hello");
				ps.setString(11,emailid);
				int i=ps.executeUpdate();
				con.commit();
				PreparedStatement ps1=con.prepareStatement("update login1 set(password,ques,ans)=(?,?,?)where emailid=?");
				
				ps1.setString(1,password);
				ps1.setString(2,que);
				ps1.setString(3, ans);
				ps1.setString(4, emailid);
				int j=ps1.executeUpdate();
				//con.commit();			
				if(i!=0&&j!=0)
				{
					getServletContext().getRequestDispatcher("/login.jsp").forward(request,response);
				}
				else
				{
					String message="Please try again";
					request.setAttribute("msg",message);
					getServletContext().getRequestDispatcher("/update.jsp").include(request,response);
				}
			}
			
		
			
		
		catch(Exception e)
			{
			e.printStackTrace();
			response.getWriter().write("<html><body><center><h1><strong>");
			response.getWriter().write("Error Occured  Try Again");
				
			}
		
		}
		
	}


	}



				
		
		
		
	