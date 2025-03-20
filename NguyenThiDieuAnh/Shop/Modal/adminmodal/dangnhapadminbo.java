package adminmodal;


public class dangnhapadminbo {
	dangnhapadmindao dndao = new dangnhapadmindao();
	public String KtDangNhap(String tendn, String matkhau) throws Exception{
		return dndao.KtDangNhap(tendn, matkhau);
	}
}
