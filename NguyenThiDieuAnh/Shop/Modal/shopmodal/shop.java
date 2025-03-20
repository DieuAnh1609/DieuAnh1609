package shopmodal;

public class shop {
	private String masanpham;
	private String tensanpham;
	private String size;
	private String mausac;
	private Long soluong;
	private Long gia;
	private String maloai;
	private String anh;
	private String xuatxu;
	public shop(String masanpham, String tensanpham, String size, String mausac, Long soluong, Long gia, String maloai,
			String anh, String xuatxu) {
		super();
		this.masanpham = masanpham;
		this.tensanpham = tensanpham;
		this.size = size;
		this.mausac = mausac;
		this.soluong = soluong;
		this.gia = gia;
		this.maloai = maloai;
		this.anh = anh;
		this.xuatxu = xuatxu;
	}
	public shop() {
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
	public Long getSoluong() {
		return soluong;
	}
	public void setSoluong(Long soluong) {
		this.soluong = soluong;
	}
	public Long getGia() {
		return gia;
	}
	public void setGia(Long gia) {
		this.gia = gia;
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
	public String getXuatxu() {
		return xuatxu;
	}
	public void setXuatxu(String xuatxu) {
		this.xuatxu = xuatxu;
	}
	
	
}
