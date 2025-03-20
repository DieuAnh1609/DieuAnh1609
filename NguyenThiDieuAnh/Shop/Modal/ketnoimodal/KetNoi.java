package ketnoimodal;

import java.sql.Connection;
import java.sql.DriverManager;

public class KetNoi {
	public static Connection cn;
    public void ketnoi() throws Exception {
       try {
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           System.out.println("OK ");
           String url ="jdbc:sqlserver://LAPTOP-B1HS5NQ5\\DIEUANH:1433;databaseName=QlSanPham;user=sa; password=123";
           cn = DriverManager.getConnection(url);
           System.out.println("Kết nối cơ sở dữ liệu thành công");
       } catch (Exception e) {
           e.printStackTrace();
       }
              
   }
}
