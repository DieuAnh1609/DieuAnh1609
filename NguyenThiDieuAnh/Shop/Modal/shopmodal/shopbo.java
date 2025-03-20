package shopmodal;

import java.util.ArrayList;

public class shopbo {
	shopdao sdao = new shopdao();
	ArrayList<shop> ds;
	
	  public ArrayList<shop> getShop() throws Exception{ 
		  ds= sdao.getShop(); 
		  return  ds; 
		  }
	 
	
	public ArrayList<shop> getSanPhamPhanTrang(int PageNumber) throws Exception{
		ds=  sdao.getSanPhamPhanTrang(PageNumber);
		return ds;
	}
	
	public int layTongSoLuongSanPham() throws Exception {   
        return sdao.layTongSoLuongSanPham();
    }
    
    public int layTongSoLuongSanPhamTheoLoai(String category) throws Exception {
       
        return  sdao.layTongSoLuongSanPhamTheoLoai(category);
    }

    public ArrayList<shop> getSanPhamPhanTrangTheoLoai(int PageNumber, String category) throws Exception {
    	return  sdao.getSanPhamPhanTrangTheoLoai(PageNumber, category);
    }
	
	
	 public ArrayList<shop> TimSanPhamTheoTuKhoa(String keyword) throws Exception {
	        return sdao.TimSanPhamTheoTuKhoa(keyword);
	    }
}
