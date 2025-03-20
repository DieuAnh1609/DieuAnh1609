package adminmodal;

import java.util.ArrayList;

public class adminquanlybo {
	adminquanlydao aqldao = new adminquanlydao();
	public int ThemSanPham(String maSanPham, String tenSanPham, String size, String mauSac,  Long soLuong, 
			Long gia,String maLoai,String anh, String ngaynhap, String xuatXu) throws Exception{
		return aqldao.ThemSanPham(maSanPham, tenSanPham, size, mauSac, soLuong, gia, maLoai, anh, ngaynhap, xuatXu);
	}
	public void xoa(String maSanPham) throws Exception{
		 aqldao.xoa(maSanPham);
	}
	public int CapNhat(String maSanPham, String tenSanPham, String size, String mauSac,  Long soLuong, 
			Long gia,String maLoai,String anh, String ngaynhap, String xuatXu) throws Exception{
		return aqldao.CapNhat(maSanPham, tenSanPham, size, mauSac, soLuong, gia, maLoai, anh, ngaynhap, xuatXu);
	}
	
	public int ThemLoai(String maLoai, String temLoai) throws Exception{
		return aqldao.ThemLoai(maLoai, maLoai);
	}
	public void xoaLoai(String maLoai) throws Exception{
		 aqldao.xoaLoai(maLoai);
	}
	public int CapNhatLoai(String maLoai, String tenLoai) throws Exception{
		return aqldao.CapNhatLoai(maLoai,tenLoai);
	}
}
