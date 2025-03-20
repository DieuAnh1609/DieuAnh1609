package giohangmodal;

public class sanpham {
	public String MaSanPham;
	public String TenSanPham;
	public String Size;
	public String MauSac;
	public Long SoLuong;
	public Long Gia;
	public Long ThanhTien;
	public sanpham(String maSanPham, String tenSanPham, String size, String mauSac, Long soLuong, Long gia,
			Long thanhTien) {
		super();
		MaSanPham = maSanPham;
		TenSanPham = tenSanPham;
		Size = size;
		MauSac = mauSac;
		SoLuong = soLuong;
		Gia = gia;
		ThanhTien = soLuong * gia;
	}
	public sanpham() {
		super();
	}
	public String getMaSanPham() {
		return MaSanPham;
	}
	public void setMaSanPham(String maSanPham) {
		MaSanPham = maSanPham;
	}
	public String getTenSanPham() {
		return TenSanPham;
	}
	public void setTenSanPham(String tenSanPham) {
		TenSanPham = tenSanPham;
	}
	public String getSize() {
		return Size;
	}
	public void setSize(String size) {
		Size = size;
	}
	public String getMauSac() {
		return MauSac;
	}
	public void setMauSac(String mauSac) {
		MauSac = mauSac;
	}
	public Long getSoLuong() {
		return SoLuong;
	}
	public void setSoLuong(Long soLuong) {
		SoLuong = soLuong;
	}
	public Long getGia() {
		return Gia;
	}
	public void setGia(Long gia) {
		Gia = gia;
	}
	public Long getThanhTien() {
		return SoLuong*Gia;
	}
	public void setThanhTien(Long thanhTien) {
		ThanhTien = thanhTien;
	}
	
	
}
