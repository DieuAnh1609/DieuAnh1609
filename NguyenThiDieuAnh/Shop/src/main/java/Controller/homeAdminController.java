package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import giohangmodal.giohangbo;
import loaiModal.loaibo;
import shopmodal.shop;
import shopmodal.shopbo;

/**
 * Servlet implementation class homeAdminController
 */
@WebServlet("/homeAdminController")
public class homeAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public homeAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");

            loaibo lbo = new loaibo();
            shopbo sbo = new shopbo();

            String indexP = request.getParameter("index");
            int index = (indexP != null && indexP.matches("\\d+")) ? Integer.parseInt(indexP) : 1; // Kiểm tra giá trị của index

            String ml = request.getParameter("ml");
            String key = request.getParameter("txttk");

            ArrayList<shop> ds = new ArrayList<>();
            if (ml != null) {
                int totalRecords = sbo.layTongSoLuongSanPhamTheoLoai(ml);
                int endPage2 = (totalRecords % 9 == 0) ? totalRecords / 9 : (totalRecords / 9) + 1;
                request.setAttribute("endP", endPage2);
                ds = sbo.getSanPhamPhanTrangTheoLoai(index, ml);
            } else if (key != null) {
                ds = sbo.TimSanPhamTheoTuKhoa(key);
                request.setAttribute("endP", 1); // Chỉ 1 trang nếu tìm kiếm
            } else {
                int totalRecords = sbo.layTongSoLuongSanPham();
                int endPage = (totalRecords % 9 == 0) ? totalRecords / 9 : (totalRecords / 9) + 1;
                request.setAttribute("endP", endPage);
                ds = sbo.getSanPhamPhanTrang(index);
            }

            HttpSession session = request.getSession();
            
            request.setAttribute("dssanpham", ds);
            request.setAttribute("dsloai", lbo.getLoai());

            RequestDispatcher rd = request.getRequestDispatcher("homeAdmin.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();  // Có thể ghi vào log thay vì chỉ in ra lỗi
            request.setAttribute("errorMessage", "Có lỗi xảy ra, vui lòng thử lại sau.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
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
