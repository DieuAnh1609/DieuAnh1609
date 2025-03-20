package xacnhanmodal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import ketnoimodal.KetNoi;

public class xacnhandao {
	public ArrayList<xacnhan> getlichsu() throws Exception{
		ArrayList<xacnhan> ds = new ArrayList<xacnhan>();
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		//b2: tao cau lenh sql
		String sql = "SELECT * FROM Vxacnhan";
		//b3: tao cau lenh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//b4: truyen tham so vao cau lenh neu co
		//b5: thuc hien cau lenh
		ResultSet rs = cmd.executeQuery();
		//b6: Duyet rs
		while(rs.next()) {
			String hoten = rs.getString("hoten") ;
			Date ngaymua = rs.getDate("NgayMua");
			Long soluongmua = rs.getLong("SoLuongMua");
			Long gia = rs.getLong("gia");
			String tien = rs.getString("ThanhTien");
			Long tien2 = Long.parseLong(tien);
			String mahoadon = rs.getString("mahoadon") ;
			Boolean damua = rs.getBoolean("damua");
			ds.add(new xacnhan());

		}
		//b7: dong
		rs.close();
		kn.cn.close();
		return ds;
	}
	}
