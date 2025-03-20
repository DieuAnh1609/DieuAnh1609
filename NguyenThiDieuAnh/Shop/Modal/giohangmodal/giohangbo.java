package giohangmodal;

import java.util.ArrayList;

public class giohangbo {
	public ArrayList<sanpham> ds = new ArrayList<sanpham>();
	
	public ArrayList<sanpham> getDs() {
		return ds;
	}

	public void Them(String masanpham, String tensanpham,String size, String mausac, Long gia, Long soluong) {
		for(sanpham sp : ds) {
			if(sp.getMaSanPham().equals(masanpham)) {
				sp.setSoLuong(sp.getSoLuong()+soluong);
				return;
			}
		}
		
		ds.add(new sanpham(masanpham, tensanpham, size, mausac, soluong, gia, soluong));
	}
	
	public void Xoa(String masanpham) {
		for(sanpham sp : ds) {
			if(sp.getMaSanPham().equals(masanpham)) {
				ds.remove(sp);
				break;
			}
		}
	}
	
	public void Sua(String masanpham, Long soluongMoi) {
	    for (sanpham sp : ds) {
	        if (sp.getMaSanPham().equals(masanpham)) {
	            sp.setSoLuong(soluongMoi); // Cập nhật lại số lượng
	            break;
	        }
	    }
	}
	
	
	public long Tong() {
		long s = 0;
		for(sanpham sp : ds) 
			s = s + sp.getThanhTien();
			return s;
		
	}
}
