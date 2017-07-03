import javax.mail.*;
import javax.mail.internet.*;

import java.io.UnsupportedEncodingException;
import java.util.*;

public class SendEmail1 {

	 public  static  void send(String to,final String password) {  
		// TODO Auto-generated method stub

		Properties props = new Properties();
		 Session session = Session. getInstance(props);
		 MimeMessage msg = new MimeMessage(session);
		 Transport t = null;
		 try {
		 Address bill = new InternetAddress("abhishekabi97@gmail.com" ,  "abi" );
		 Address elliotte = new InternetAddress(to );
		 msg. setText("Your EMail id:"+to+"\nPassword:"+password );
		 msg. setFrom(bill);
		 msg. setRecipient(Message. RecipientType. TO, elliotte);
		// msg. setRecipient(Message. RecipientType.CC, elliotte);
		// msg. setRecipient(Message. RecipientType.BCC, elliotte);
		 msg. setSubject("Registration Completed Successfully " );
		 t = session. getTransport("smtps" );
		 t. connect("smtp.gmail.com" , "abhishekabi97@gmail.com" , "discoverriders" );
		 t. sendMessage(msg, msg. getAllRecipients());
		 } catch (MessagingException | UnsupportedEncodingException ex) {
		
		 ex. printStackTrace();
		 System.out.println("Internet Connection error Email not sent");
		 } finally { // Transport does not implement AutoCloseable :-(
		 if (t != null) {
		 try {
		 t. close();
		 } catch (MessagingException ex) {
			 System.out.println("Internet Connection error Email not sent"); 
		 }
		 }
		 }
		 }
		}