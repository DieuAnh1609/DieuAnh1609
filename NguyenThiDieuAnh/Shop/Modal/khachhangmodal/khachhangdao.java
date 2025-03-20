package khachhangmodal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import ketnoimodal.KetNoi;


public class khachhangdao {
	public khachhang ktdangnhap(String tendn, String pass) throws Exception{
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		String sql = "SELECT * FROM KhachHang WHERE TenDN= ? and Pass= ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1,tendn);
		cmd.setString(2, pass);
		ResultSet rs = cmd.executeQuery();
		khachhang kh =null;

		if(rs.next()) {		
			long makh = rs.getLong("makh");
			String hoten = rs.getString("hoten");
			String diachi = rs.getString("diachi");
			String sodt = rs.getString("sodt");			
			String email = rs.getString("email");					
			kh = new khachhang(makh,hoten,diachi,sodt,email,tendn,pass);

		}
		rs.close();
		kn.cn.close();
		return kh;
	}
	
}

