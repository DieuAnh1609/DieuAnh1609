package adminmodal;

public class adminquanly {
	private String masanpham;
	private String tensanpham;
	private String size;
	private String mausac;
	private Long gia;
	private Long soluong;	
	private String maloai;
	private String anh;
	private String ngaynhap;
	private String xuatxu;
	public adminquanly(String masanpham, String tensanpham, String size, String mausac, Long gia, Long soluong,
			String maloai, String anh, String ngaynhap, String xuatxu) {
		super();
		this.masanpham = masanpham;
		this.tensanpham = tensanpham;
		this.size = size;
		this.mausac = mausac;
		this.gia = gia;
		this.soluong = soluong;
		this.maloai = maloai;
		this.anh = anh;
		this.ngaynhap = ngaynhap;
		this.xuatxu = xuatxu;
	}
	public adminquanly() {
		super();
	}
	public String getMasanpham() {
		return masanpham;
	}
	public void setMasanpham(String masanpham) {
		this.masanpham = masanpham;
	}
	public String getTensanpham() {
		return tensanpham;
	}
	public void setTensanpham(String tensanpham) {
		this.tensanpham = tensanpham;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getMausac() {
		return mausac;
	}
	public void setMausac(String mausac) {
		this.mausac = mausac;
	}
	public Long getGia() {
		return gia;
	}
	public void setGia(Long gia) {
		this.gia = gia;
	}
	public Long getSoluong() {
		return soluong;
	}
	public void setSoluong(Long soluong) {
		this.soluong = soluong;
	}
	public String getMaloai() {
		return maloai;
	}
	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	public String getNgaynhap() {
		return ngaynhap;
	}
	public void setNgaynhap(String ngaynhap) {
		this.ngaynhap = ngaynhap;
	}
	public String getXuatxu() {
		return xuatxu;
	}
	public void setXuatxu(String xuatxu) {
		this.xuatxu = xuatxu;
	}
	
	
}
