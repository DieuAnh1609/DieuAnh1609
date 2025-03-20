package Controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import chitiethoadon.chitiethoadonbo;
import giohangmodal.giohangbo;
import giohangmodal.sanpham;
import hoadon.hoadonbo;
import khachhangmodal.khachhang;


/**
 * Servlet implementation class xacnhanController
 */
@WebServlet("/xacnhanController")
public class xacnhanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xacnhanController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			if(session.getAttribute("dn")==null) { // chua dang nhap
				response.sendRedirect("homeController");
			}
			giohangbo gh = (giohangbo)session.getAttribute("gh");
			khachhang kh = (khachhang)session.getAttribute("dn");
			//Them vao 1 hoa don
			hoadonbo hdbo = new hoadonbo();
			Date NgayMua = new Date();
			long MaKH = kh.getMakh();
			hdbo.Them(MaKH, NgayMua, false);
			//Them vao chiTietHD
			
			chitiethoadonbo ctbo = new chitiethoadonbo();
			for(sanpham sp:gh.ds)
				ctbo.Them(sp.getMaSanPham(), sp.getSoLuong(), hdbo.getMaxHd());
			session.removeAttribute("gh");//Xoa gio
			response.sendRedirect("lichsuController");
		} catch (Exception e) {
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
