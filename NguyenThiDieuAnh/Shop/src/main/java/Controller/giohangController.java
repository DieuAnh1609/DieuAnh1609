package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import giohangmodal.giohangbo;

/**
 * Servlet implementation class giohangController
 */
@WebServlet("/giohangController")
public class giohangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public giohangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String masanpham = request.getParameter("ms");
		String tensanpham = request.getParameter("ts");
		String size = request.getParameter("size");
		String mausac = request.getParameter("mausac");
		String gia = request.getParameter("gia");
			
		giohangbo gh = null;
		HttpSession session = request.getSession();
		if(session.getAttribute("gh")==null){
			gh = new giohangbo();
			session.setAttribute("gh", gh);
		}
		gh = (giohangbo)session.getAttribute("gh");
		gh.Them(masanpham, tensanpham, size, mausac, Long.parseLong(gia),(long) 1);
		session.setAttribute("gh", gh);
		response.sendRedirect("htgioController");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
