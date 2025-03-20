package loaiModal;

public class loai {
	private String maLoai;
	private String tenLoai;
	// PHát sinh tạo , get set
	
	
	
	public loai(String maLoai, String tenLoai) {
		super();
		this.maLoai = maLoai;
		this.tenLoai = tenLoai;
	}
	
	public loai() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getMaLoai() {
		return maLoai;
	}

	public void setMaLoai(String maLoai) {
		this.maLoai = maLoai;
	}
	public String getTenLoai() {
		return tenLoai;
	}
	public void setTenLoai(String tenLoai) {
		this.tenLoai = tenLoai;
	}
	
	
}
