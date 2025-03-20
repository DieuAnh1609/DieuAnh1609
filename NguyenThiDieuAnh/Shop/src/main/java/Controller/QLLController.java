package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import adminmodal.adminquanlybo;
import loaiModal.loaibo;

/**
 * Servlet implementation class QLLController
 */
@WebServlet("/QLLController")
public class QLLController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QLLController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		 DiskFileItemFactory factory = new DiskFileItemFactory();
		 DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		 ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
		try {
			adminquanlybo tbo = new adminquanlybo();

			if(request.getContentLength()<=0) {//Chay lan dau
				String maloai = request.getParameter("maloai");
				String tenloai = request.getParameter("tenloai");
			
			

				if(maloai != null) {
					request.setAttribute("maloai", maloai.trim());
					request.setAttribute("tenloai", tenloai.trim());
				
				}
				
				String maloaixoa = request.getParameter("maloaixoa");
				if (maloaixoa != null) {
				    tbo.xoaLoai(maloaixoa);
				}
				loaibo lbo= new loaibo();
				HttpSession session = request.getSession();
			}
			String maloai = null;
			String tenloai = null;
		
			String action = null;
			List<FileItem> fileItems = upload.parseRequest(request);//Lấy về các đối tượng gửi lên
			//duyệt qua các đối tượng gửi lên từ client gồm file và các control
			for (FileItem fileItem : fileItems) {
			
				String tentk = fileItem.getFieldName();

				if (tentk.equals("txtmaloai")) {
				    maloai = fileItem.getString("UTF-8");
				}
				if (tentk.equals("txttenloai")) {
				    tenloai = fileItem.getString("UTF-8");
				}
				
				if (tentk.equals("action")) {
					action = fileItem.getString("UTF-8");
				}
				
			}
		
			if(action.equals("Thêm")) {
				 if(!maloai.isEmpty() ) {
					 tbo.ThemLoai(maloai,  tenloai);
				 }
			}else if (action.equals("Cập nhật")){
				tbo.CapNhatLoai(maloai,  tenloai);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		 RequestDispatcher rds= request.getRequestDispatcher("QLL.jsp");
		 rds.forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
