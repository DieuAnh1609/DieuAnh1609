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

import adminmodal.dangnhapadminbo;
import nl.captcha.Captcha;

/**
 * Servlet implementation class loginAdminController
 */
@WebServlet("/loginAdminController")
public class loginAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	public loginAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			try {
			
			String un= request.getParameter("txtun");
			String pass= request.getParameter("txtpass");
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
				  RequestDispatcher rd= request.getRequestDispatcher("loginAdmin.jsp");
				  rd.forward(request, response);
			  }
			  if(un!=null&&pass!=null){
				  dangnhapadminbo dnbo = new dangnhapadminbo();
				  String kt=dnbo.KtDangNhap(un, pass);
				  if(kt!=null){
					  session.setAttribute("dnadmin",kt);
					  response.sendRedirect("homeAdminController");
					  return;

				  } else {
					  tb="Dang nhap sai";
					  if(session.getAttribute("dem") == null)
						  session.setAttribute("dem",(int)0);
					  int dem=(int)session.getAttribute("dem");
					  dem++;
					  session.setAttribute("dem", dem);
					  
				}

			  }
			  	
				RequestDispatcher rd=request.getRequestDispatcher("loginAdmin.jsp");
				rd.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
