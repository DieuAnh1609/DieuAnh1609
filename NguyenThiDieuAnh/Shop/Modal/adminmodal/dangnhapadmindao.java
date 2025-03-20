package adminmodal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import ketnoimodal.KetNoi;

public class dangnhapadmindao {
	public String KtDangNhap(String tendn, String matkhau) throws Exception{
	     KetNoi kn = new KetNoi();
	     kn.ketnoi();
	     String sql = "SELECT * FROM DangNhap WHERE TenDangNhap=? and  MatKhau=?";
	     PreparedStatement cmd = kn.cn.prepareStatement(sql);
	     cmd.setString(1, tendn);
	     cmd.setString(2, matkhau);
	     ResultSet rs = cmd.executeQuery();
	     String kq=null;
	     while (rs.next()) {
	    	 kq=tendn;
	     }rs.close();
	     kn.cn.close();
		return kq;
	}
}
