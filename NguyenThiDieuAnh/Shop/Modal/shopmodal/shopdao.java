package shopmodal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ketnoimodal.KetNoi;

public class shopdao {
	public ArrayList<shop> getShop()throws Exception{
		ArrayList<shop> ds = new ArrayList<shop>();
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		String sql = "SELECT * FROM SanPham";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			String maSanpham = rs.getString("masanpham");
			String tenSanpham = rs.getString("tensanpham");
			String size = rs.getString("size");
			String mauSac = rs.getString("mausac");
			Long gia = rs.getLong("gia");
			Long soLuong= rs.getLong("soluong");
			String maLoai = rs.getString("maloai");
			String anh = rs.getString("anh");
			String xuatXu= rs.getString("xuatxu");
			
			ds.add(new shop(maSanpham, tenSanpham, size, mauSac, soLuong, gia, maLoai, anh, xuatXu));
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
	
	public ArrayList<shop> getSanPhamPhanTrang(int pageNumber) throws Exception {
	    ArrayList<shop> ds = new ArrayList<shop>();
	    KetNoi kn = new KetNoi();
	    kn.ketnoi();
	    String sql = "SELECT * FROM SanPham ORDER BY MaSanPham OFFSET (? - 1)*9 ROWS FETCH NEXT 9 ROWS ONLY";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setInt(1, pageNumber);
	    ResultSet rs = cmd.executeQuery();
	    while (rs.next()) {
	    	String maSanpham = rs.getString("masanpham");
			String tenSanpham = rs.getString("tensanpham");
			String size = rs.getString("size");
			String mauSac = rs.getString("mausac");
			Long gia = rs.getLong("gia");
			Long soLuong= rs.getLong("soluong");
			String maLoai = rs.getString("maloai");
			String anh = rs.getString("anh");
			String xuatXu= rs.getString("xuatxu");

			ds.add(new shop(maSanpham, tenSanpham, size, mauSac, soLuong, gia, maLoai, anh, xuatXu));
	    }

	    rs.close();
	    kn.cn.close();
	    return ds;
	}
	
	
	public ArrayList<shop> getSanPhamPhanTrangTheoLoai(int pageNumber,String category) throws Exception {
	    ArrayList<shop> ds = new ArrayList<shop>();
	    KetNoi kn = new KetNoi();
	    kn.ketnoi();
	    String sql = "SELECT * FROM SanPham WHERE MaLoai = ? ORDER BY MaSanPham OFFSET (? - 1)*9 ROWS FETCH NEXT 9 ROWS ONLY";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setString(1, category);
	    cmd.setInt(2, pageNumber);
	    ResultSet rs = cmd.executeQuery();
	    while (rs.next()) {
	    	String maSanpham = rs.getString("masanpham");
			String tenSanpham = rs.getString("tensanpham");
			String size = rs.getString("size");
			String mauSac = rs.getString("mausac");
			Long gia = rs.getLong("gia");
			Long soLuong= rs.getLong("soluong");
			String maLoai = rs.getString("maloai");
			String anh = rs.getString("anh");
			String xuatXu= rs.getString("xuatxu");

			ds.add(new shop(maSanpham, tenSanpham, size, mauSac, soLuong, gia, maLoai, anh, xuatXu));
	    }

	    rs.close();
	    kn.cn.close();
	    return ds;
	}
	
	
	
	public int layTongSoLuongSanPham() throws Exception {
        KetNoi kn = new KetNoi();
        kn.ketnoi();

        try (
        	PreparedStatement cmd = kn.cn.prepareStatement("SELECT COUNT(*) FROM SanPham");
            ResultSet rs = cmd.executeQuery()
        ) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } 
            kn.cn.close();
     

        return 0;
    }
	
	
	  public int layTongSoLuongSanPhamTheoLoai(String category) throws Exception {
	        KetNoi kn = new KetNoi();
	        kn.ketnoi();

	        try (
	            PreparedStatement cmd = kn.cn.prepareStatement("SELECT COUNT(*) FROM SanPham WHERE MaLoai = ?");
	        ) {
	            cmd.setString(1, category);
	            ResultSet rs = cmd.executeQuery();

	            if (rs.next()) {
	                return rs.getInt(1);
	            }
	        } 
	            kn.cn.close();
	        return 0;
	    }
	  
	  public ArrayList<shop> TimSanPhamTheoTuKhoa(String keyword) throws Exception {
	        KetNoi kn = new KetNoi();
	        kn.ketnoi();
	        ArrayList<shop> ds = new ArrayList<>();

	        try (
	        		PreparedStatement cmd = kn.cn.prepareStatement("SELECT * FROM SanPham WHERE TenSanPham LIKE ?");

	        ) {
	        	cmd.setString(1, "%" + keyword + "%");
	            ResultSet rs = cmd.executeQuery();

	            while (rs.next()) {
	            	String maSanpham = rs.getString("masanpham");
	    			String tenSanpham = rs.getString("tensanpham");
	    			String size = rs.getString("size");
	    			String mauSac = rs.getString("mausac");
	    			Long gia = rs.getLong("gia");
	    			Long soLuong= rs.getLong("soluong");
	    			String maLoai = rs.getString("maloai");
	    			String anh = rs.getString("anh");
	    			String xuatXu= rs.getString("xuatxu");

	    	        ds.add(new shop(maSanpham, tenSanpham, size, mauSac, soLuong, gia, maLoai, anh, xuatXu));
	            }
	        } 
	            kn.cn.close();
	        return ds;
	    }
	  
}
