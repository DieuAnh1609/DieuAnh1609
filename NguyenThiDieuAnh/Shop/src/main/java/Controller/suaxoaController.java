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
 * Servlet implementation class suaxoaController
 */
@WebServlet("/suaxoaController")
public class suaxoaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public suaxoaController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			giohangbo gh=(giohangbo)session.getAttribute("gh");
			if(gh!=null){
				if(request.getParameter("butxoa")!=null){//Xoa chon
					String[] d= request.getParameterValues("ck");
					for(String st:d){
						gh.Xoa(st);
					}
				}
				if(request.getParameter("ms")!=null){//Xoa tung dong
					String ms=request.getParameter("ms");
					gh.Xoa(ms);
				}
				if(request.getParameter("butsua")!=null){ //Sua so luong
					String ms=request.getParameter("butsua");
					String sl= request.getParameter(ms);
					gh.Them(ms, "","", "" ,(long)0, Long.parseLong(sl));
				}
				session.setAttribute("gh",gh);
				response.sendRedirect("htgioController");
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
