package adminmodal;

import java.sql.PreparedStatement;

import ketnoimodal.KetNoi;

public class adminquanlydao {
	public int ThemSanPham(String maSanPham, String tenSanPham, String size, String mauSac,  Long soLuong, 
			Long gia,String maLoai,String anh, String ngaynhap, String xuatXu) throws Exception{
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		//b2: tao cau lenh sql
		String sql = "INSERT INTO SanPham (MaSanPham, TenSanPham, Size,MauSac, SoLuong,Gia, MaLoai, Anh, NgayNhap, XuatXu)" + "VALUES(?,?,?,?,?,?,?,?,?,?)";
		//B3 tao cau lenh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1,maSanPham);
		cmd.setString(2,tenSanPham);
		cmd.setString(3,size);
		cmd.setString(4,mauSac);	
		cmd.setLong(5,soLuong);
		cmd.setLong(6,gia);
		cmd.setString(7,maLoai);
		cmd.setString(8,anh);
		cmd.setString(9,ngaynhap);
		cmd.setString(10,xuatXu);
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
		
	}
	public void xoa(String maSanPham) throws Exception{
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		
		String sql = "DELETE FROM SanPham WHERE MaSanPham = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, maSanPham);
		
		cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
	}
	public int CapNhat(String maSanPham, String tenSanPham, String size, String mauSac,  Long soLuong, 
			Long gia,String maLoai,String anh, String ngaynhap, String xuatXu) throws Exception {
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			
			String sql = "UPDATE SanPham "
			        + "SET MaSanPham = ?, "
			        + "    TenSanPham = ?, "
			        + "    Size = ?, "
			        + "    MauSac = ?, "
			        + "    SoLuong = ?, "
			        + "    Gia = ?, "
			        + "    MaLoai = ?, "
			        + "    Anh = ?, "
			        + "    NgayNhap = ?, "
			        + "    XuatXu = ? "
			        + "WHERE MaSanPham = ?";
			
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setString(1,maSanPham);
			cmd.setString(2,tenSanPham);
			cmd.setString(3,size);
			cmd.setString(4,mauSac);	
			cmd.setLong(5,soLuong);
			cmd.setLong(6,gia);
			cmd.setString(7,maLoai);
			cmd.setString(8,anh);
			cmd.setString(9,ngaynhap);
			cmd.setString(10,xuatXu);
			cmd.setString(11,maSanPham);// Thêm tham số để chỉ định mã sách cần cập nhật
			
			int kq = cmd.executeUpdate();
			cmd.close();
			kn.cn.close();
			
			return kq;
		}
	
	public int ThemLoai(String maLoai, String tenLoai) throws Exception{
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		//b2: tao cau lenh sql
		String sql = "INSERT INTO Loai (MaLoai, TenLoai)" + "VALUES(?,?)";
		//B3 tao cau lenh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1,maLoai);
		cmd.setString(2,tenLoai);		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
		
	}
	
	public void xoaLoai(String maLoai) throws Exception{
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		
		String sql = "DELETE FROM Loai WHERE MaLoai = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, maLoai);
		
		cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
	}
	

	
	public int CapNhatLoai(String maLoai, String tenLoai) throws Exception {
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			
			String sql = "UPDATE Loai SET MaLoai =?, TenLoai = ? WHERE MaLoai= ? ";
		
			
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setString(1, maLoai);
			cmd.setString(2, tenLoai);			
			cmd.setString(3, maLoai); // Thêm tham số để chỉ định mã sách cần cập nhật
			
			int kq = cmd.executeUpdate();
			cmd.close();
			kn.cn.close();
			
			return kq;
		}
}
