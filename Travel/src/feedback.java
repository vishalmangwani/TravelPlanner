import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.*;

public class feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public feedback() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// TODO Auto-generated method stub
		 
		 String yname=request.getParameter("Full_Name");
			String email=request.getParameter("Email_Address");
			
			String tnumber=request.getParameter("Telephone_Number");
			String message=request.getParameter("Your_Message");
		 
		 
		 
		 
		 

		Properties props = new Properties();
		 Session session = Session. getInstance(props);
		 MimeMessage msg = new MimeMessage(session);
		 Transport t = null;
		 try {
		 Address bill = new InternetAddress("abhishekabi97@gmail.com" ,  "abhi" );
		 Address elliotte = new InternetAddress("abhishekabi97@gmail.com" );
		 msg. setText("Name:"+yname+"\nEmail:"+email+"tel:Number:"+tnumber+"Message:"+message );
		 msg. setFrom(bill);
		 msg. setRecipient(Message. RecipientType. TO, elliotte);
		 msg. setRecipient(Message. RecipientType.CC, elliotte);
		 msg. setRecipient(Message. RecipientType.BCC, elliotte);
		 msg. setSubject("Feedback" );
		 t = session. getTransport("smtps" );
		 t. connect("smtp.gmail.com" , "vamsihari14@gmail.com" , "vamsikrishna14" );
		 t. sendMessage(msg, msg. getAllRecipients());
		 } catch (MessagingException | UnsupportedEncodingException ex) {
		
		 ex. printStackTrace();
		 } finally { // Transport does not implement AutoCloseable :-(
		 if (t != null) {
		 try {
		 t. close();
		 } catch (MessagingException ex) {
		 }
		 }
		 }
		 response.getWriter().write("<html><body><center><h1><strong>");
			response.getWriter().write("Feedback Sent");
			response.getWriter().write("</strong></h1></center></body></html>");
			getServletContext().getRequestDispatcher("/index.html").include(request, response);		 
	
	}
		}

