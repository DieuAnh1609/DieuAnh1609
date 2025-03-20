package Controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import khachhangmodal.khachhang;
import khachhangmodal.khachhangbo;
import khachhangmodal.khachhangdao;
import nl.captcha.Captcha;

/**
 * Servlet implementation class loginKHController
 */
@WebServlet("/loginKHController")
public class loginKHController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginKHController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		 
	}




	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
            String username = request.getParameter("txtun");
            String password = request.getParameter("txtpass");
            String tb=null;
			HttpSession session = request.getSession();
			Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
			request.setCharacterEncoding("UTF-8");
			String answer = request.getParameter("answer");
			int d = 0;
			if(session.getAttribute("dem")!= null)
			    d = (int)session.getAttribute("dem");
			if(answer != null)
			if(d>=3 && !captcha.isCorrect(answer)) {
				  RequestDispatcher rd= request.getRequestDispatcher("loginKH.jsp");
				  rd.forward(request, response);
			  }

            if (username != null && password != null) {
                khachhangdao dao = new khachhangdao();
                khachhang kh = dao.ktdangnhap(username, password);
                if (kh != null) {
                    request.getSession().setAttribute("dn", kh);
                    response.sendRedirect("shopController");  
                } else {
                	tb="Dang nhap sai";
					  if(session.getAttribute("dem") == null)
						  session.setAttribute("dem",(int)0);
					  int dem=(int)session.getAttribute("dem");
					  dem++;
					  session.setAttribute("dem", dem);
                }
            }
            RequestDispatcher rd = request.getRequestDispatcher("loginKH.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
		public static String ecrypt(String text) throws NoSuchAlgorithmException, UnsupportedEncodingException {
			String enrtext;
			MessageDigest msd = MessageDigest.getInstance("MD5");
			byte[] srctextbyte = text.getBytes("UTF-8");
			byte[] enrtextbyte = msd.digest(srctextbyte);
			BigInteger big = new BigInteger(1, enrtextbyte);
			enrtext = big.toString(16);
			return enrtext;
	}


}
