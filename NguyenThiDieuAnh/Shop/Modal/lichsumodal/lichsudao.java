package lichsumodal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import ketnoimodal.KetNoi;

public class lichsudao {
	public ArrayList<lichsu> getlichsu() throws Exception{
		ArrayList<lichsu> ds = new ArrayList<lichsu>();
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		String sql = "SELECT * FROM Vlichsu";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		//b6: Duyet rs
		while(rs.next()) {
			String hoten = rs.getString("hoten") ;
			String tensanpham = rs.getString("tensanpham");
		
			Long soluongmua = rs.getLong("SoLuongMua");
			Long gia = rs.getLong("gia");
			String tien = rs.getString("ThanhTien");
			
		
			Long tien2 = Long.parseLong(tien);
			Date ngaymua = rs.getDate("NgayMua");
			Boolean damua = rs.getBoolean("damua");
			Long makh = rs.getLong("makh");
			ds.add(new lichsu(hoten, tensanpham, soluongmua,  gia,  tien2,  ngaymua,
					 damua, makh));
		}
		//b7: dong
		rs.close();
		kn.cn.close();
		return ds;

	}
}
