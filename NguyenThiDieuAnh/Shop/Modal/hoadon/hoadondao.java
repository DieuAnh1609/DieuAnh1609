package hoadon;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import ketnoimodal.KetNoi;

public class hoadondao {
	public int Them(long MaKH,Date NgayMua,boolean DaMua) throws Exception{
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		String sql = "INSERT INTO HoaDon (MaKH,NgayMua,DaMua) VALUES (?,?,?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, MaKH);
		//chuyen ngay util sang ngay sql de truyen vao tham so thu 2
		
		cmd.setDate(2, new java.sql.Date(NgayMua.getTime()));
		cmd.setBoolean(3, false);
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	public long getMaxHd() throws Exception{
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		String sql = "SELECT MAX(MaHoaDon) AS MaxHĐ FROM hoadon";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		long max = 0;
		if(rs.next()) {
			max = rs.getLong(1);
		}
		rs.close();
		kn.cn.close();
		return max;
	}
}
