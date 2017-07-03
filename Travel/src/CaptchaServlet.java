import java.awt.Color;
import java.awt.Font;
import java.awt.GradientPaint;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CaptchaServlet
 */
public class CaptchaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CaptchaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int width=155;
		int height=50;
		BufferedImage bufferimage=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
		Graphics2D g2d=bufferimage.createGraphics();
		GradientPaint gp=new GradientPaint(0,0,Color.RED,0,height/2,Color.WHITE,true);
		g2d.setPaint(gp);
		Font f=new Font("Tahoma",Font.BOLD,22);
		g2d.setFont(f);
		g2d.fillRect(0,0,width, height);
		g2d.setColor(new Color(0,153,255));
		String data="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	    String captcha="";
	    char ch[]=data.toCharArray();
	    for(int i=0;i<6;i++)
	    {
	    	int j=(int)((Math.random())*62);
	    	captcha=captcha+ch[j];
	    }
	    HttpSession session=request.getSession();
	    session.setAttribute("captca",captcha);
	    g2d.drawString(captcha,10,35);
	    g2d.dispose();
	    response.setContentType("image/png");
	    ServletOutputStream os=response.getOutputStream();
	    ImageIO.write(bufferimage,"png",os);
	os.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}