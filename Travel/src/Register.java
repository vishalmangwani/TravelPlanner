


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Register() {
        super();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String contact=request.getParameter("contact");
		String address=request.getParameter("address");
		String gender=request.getParameter("gender");
		String country=request.getParameter("country");
		String state=request.getParameter("state");
		String city=request.getParameter("city");
		String emailid=request.getParameter("userid");
		String password=request.getParameter("password");
		String password1=request.getParameter("repassword");
		String dob=request.getParameter("dob");
		String ques=request.getParameter("ques");
		String ans=request.getParameter("ans");
		//SendEmail1.send(emailid, password);
		System.out.println(fname+lname+contact+address+gender+country+state+city+emailid+password+password1+dob+ques+ans);
		if(fname.equals("")||lname.equals("")||contact.equals("")||address.equals("")||emailid.equals("")||password.equals("")||password1.equals("")||dob.equals("")||ans.equals(""))
		{
		String message="All Fields Are Mandatory";
		request.setAttribute("msg", message);
getServletContext().getRequestDispatcher("/register.jsp").include(request, response);
}
		else if(password.equals(password1))
		{
			try
			{
				Class.forName("com.ibm.db2.jcc.DB2Driver");
				Connection con=DriverManager.getConnection("jdbc:db2://localhost:50000/sample", "Abhishek", "microsoft");
			PreparedStatement ps=con.prepareStatement("insert into register(fname,lname,contact,address,gender,state,city,emailid,password,dob,ques,ans,country)values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, fname);
		ps.setString(2, lname);
		ps.setString(3, contact);
		ps.setString(4, address);
		ps.setString(5, gender);
		ps.setString(6, state);
		ps.setString(7, city);
		ps.setString(8, emailid);
		ps.setString(9, password);
		ps.setString(10, dob);
		ps.setString(11, ques);
		ps.setString(12, ans);
		ps.setString(13,country);
		int i=ps.executeUpdate();	
		PreparedStatement ps1=con.prepareStatement("insert into login1(emailid,password,ques,ans)values(?,?,?,?)");
		ps1.setString(1, emailid);
		ps1.setString(2, password);
		ps1.setString(3, ques);
				ps1.setString(4, ans);
				int j=ps1.executeUpdate();
				
					
		if(i!=0&&j!=0)
		{
			
                      	SendEmail1.send(emailid, password);
	response.getWriter().write("<html><body><center><h1><strong>");
	response.getWriter().write("You are Successfully registered");
	response.getWriter().write("</strong></h1></center></body></html>");
	getServletContext().getRequestDispatcher("/login.jsp").include(request, response); 
		}
		else
		{
			String message="Please Try Again";
			request.setAttribute("msg", message);
	                getServletContext().getRequestDispatcher("/register.jsp").include(request, response);
			
		}
			}
			catch(Exception e)
			{
				e.printStackTrace();
                                 
			response.getWriter().write("<html><body><center><h1><strong>");
			response.getWriter().write("Registeration Failed-1 Try Again");
			response.getWriter().write("</strong></h1></center></body></html>");
			getServletContext().getRequestDispatcher("/index.html").include(request, response);

			}
		}
		else
		{
			String message="Please enter the same password";
			request.setAttribute("msg", message);
	                 getServletContext().getRequestDispatcher("/register.jsp").include(request, response);
		}
		
	}

}
