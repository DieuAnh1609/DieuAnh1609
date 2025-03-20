package chitiethoadon;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import adminmodal.adminxacnhan;
import ketnoimodal.KetNoi;

public class chitiethoadondao {
	public int Them(String MaSanPham,long SoLuongMua,long MaHoaDon) throws Exception{
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		String sql = "INSERT INTO ChiTietHoaDon (MaSanPham,SoLuongMua,MaHoaDon) VALUES (?,?,?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, MaSanPham);
		//chuyen ngay util sang ngay sql de truyen vao tham so thu 2
		
		cmd.setLong(2, SoLuongMua);
		cmd.setLong(3, MaHoaDon);
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	public ArrayList<adminxacnhan> getxacnhan() throws Exception{
		ArrayList<adminxacnhan> ds = new ArrayList<adminxacnhan>();
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		//b2: tao cau lenh sql
		String sql = "SELECT * FROM Vxacnhan";
		//b3: tao cau lenh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//b4: truyen tham so vao cau lenh neu co
		//b5: thuc hien cau lenh
		ResultSet rs = cmd.executeQuery();
		//b6: Duyet rs
		while(rs.next()) {
			String HoTen = rs.getString("HoTen");
			Date NgayMua = rs.getDate("NgayMua");
			int SoLuongMua = rs.getInt("SoLuongMua");
			Long Gia = rs.getLong("Gia");
			Long ThanhTien = rs.getLong("ThanhTien");
			Long MaHoaDon = rs.getLong("MaHoaDon");

			ds.add(new adminxacnhan(HoTen, NgayMua, SoLuongMua, Gia, ThanhTien, MaHoaDon, false));
		}
		//b7: dong
		rs.close();
		kn.cn.close();
		return ds;

	}
	
	public int CapNhat(Long MaHoaDon) throws Exception{
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		String sql = "UPDATE ChiTietHoaDon SET DaMua = 1 WHERE MaHoaDon = ?";
			
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, MaHoaDon);
	
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	public void xoaAdminXacNhan(Long mact) throws Exception {
	    KetNoi kn = new KetNoi();
	    kn.ketnoi();

	    String sql = "DELETE FROM HoaDon WHERE MaHoaDon = ?";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setLong(1, mact);

	    cmd.executeUpdate();
	    cmd.close();
	    kn.cn.close();
	}

	public void Capnhatsoluong(Long mct, Long sl) throws Exception {
	    KetNoi kn = new KetNoi();
	    kn.ketnoi();

	    String sql = "UPDATE ChiTietHoaDon SET SoLuongMua = ? WHERE MaChiTietHD = ?";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setLong(1, sl);
	    cmd.setLong(2, mct); 

	     cmd.executeUpdate();

	    cmd.close();
	    kn.cn.close();
	}
}
