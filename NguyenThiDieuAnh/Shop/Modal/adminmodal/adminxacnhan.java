package adminmodal;

import java.util.Date;

public class adminxacnhan {
	private String HoTen;
	private Date NgayMua;
	private int SoLuongMua;
	private Long Gia;
	private Long ThanhTien;
	private Long MaHoaDon;
	private boolean DaMua;
	public adminxacnhan(String hoTen, Date ngayMua, int soLuongMua, Long gia, Long thanhTien, Long maHoaDon,
			boolean daMua) {
		super();
		HoTen = hoTen;
		NgayMua = ngayMua;
		SoLuongMua = soLuongMua;
		Gia = gia;
		ThanhTien = thanhTien;
		MaHoaDon = maHoaDon;
		DaMua = daMua;
	}
	public adminxacnhan() {
		super();
	}
	public String getHoTen() {
		return HoTen;
	}
	public void setHoTen(String hoTen) {
		HoTen = hoTen;
	}
	public Date getNgayMua() {
		return NgayMua;
	}
	public void setNgayMua(Date ngayMua) {
		NgayMua = ngayMua;
	}
	public int getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(int soLuongMua) {
		SoLuongMua = soLuongMua;
	}
	public Long getGia() {
		return Gia;
	}
	public void setGia(Long gia) {
		Gia = gia;
	}
	public Long getThanhTien() {
		return ThanhTien;
	}
	public void setThanhTien(Long thanhTien) {
		ThanhTien = thanhTien;
	}
	public Long getMaHoaDon() {
		return MaHoaDon;
	}
	public void setMaHoaDon(Long maHoaDon) {
		MaHoaDon = maHoaDon;
	}
	public boolean isDaMua() {
		return DaMua;
	}
	public void setDaMua(boolean daMua) {
		DaMua = daMua;
	}
	
	
}
