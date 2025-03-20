<%@page import="lichsumodal.lichsu"%>
<%@page import="khachhangmodal.khachhang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="loaiModal.loai"%>
<%@page import="loaiModal.loaibo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Lịch Sử Mua Hàng</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<style>
    body {
        background-color: #FFD1DC; /* Hồng nhạt */
        color: #333;
    }
    .navbar-inverse {
        background-color: #FFB6C1; /* Hồng đậm */
        border-color: #FF69B4;
    }
    .navbar-inverse .navbar-brand,
    .navbar-inverse .navbar-nav>li>a {
        color: #FFFFFF;
    }
    .navbar-inverse .navbar-nav>li>a:hover {
        background-color: #FFC0CB; /* Hồng nhạt */
        color: #000;
    }
    .table th, .table td {
        text-align: center;
        vertical-align: middle;
    }
    .table-bordered th, .table-bordered td {
        border-color: #FFB6C1; /* Hồng nhạt viền */
    }
    .list-group-item:hover {
        background-color: #FF69B4; /* Hồng đậm */
        color: #FFF;
    }
    .highlighted-text {
    		color: #FFFFFF; /* Màu chữ trắng */
    		padding: 10px;
    		font-size: 14px;
    		line-height: 30px; /* Căn chỉnh theo chiều dọc của menu */
    		display: inline-block;
}
</style>

<body>
<nav class="navbar navbar-expand-xs navbar-inverse">
  <div class="container-fluid">



    <ul class="nav navbar-nav">
      <li><a href="shopController">Trang chủ</a></li>
       <li><a href="htgioController">Giỏ hàng</a></li>
     <li><a href="xacnhanController">Đơn hàng</a></li>
     <li><a href="lichsuController">Lịch sử mua hàng</a></li>
      
    </ul>
     <ul class="nav navbar-nav navbar-right">
      
      <% 
      khachhang kh = (khachhang)session.getAttribute("dn");
      	if(session.getAttribute("dn")== null){
      	
      %>
          <li><a href="loginKHController"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
          
		<%} else{ 
			
		
		
		%>
		<li><a href="logoutController"><span class="glyphicon glyphicon-user"></span> Log out</a></li>
	 		<li class="highlighted-text"> <%=kh.getHoten() %></li>
		<%} %>
    </ul>
  </div>
</nav>

<div class="container">
	<table class = "table">
		<tr>
				<td valign="top" width="900px">
				    <table class="table table-bordered">
				        <thead>
				         <%
							ArrayList<lichsu> dsls1 = (ArrayList<lichsu>) request.getAttribute("dslichsu");
							if (dsls1.size() > 0) {
%>
				            <tr>
				            
				                <th width="300px">Tên Sản phẩm</th>
				                <th width="120px">Số lượng mua</th>
				                <th width="100px">Giá</th>
				                <th width="100px">Thành tiền</th>
				                <th width="100px">Ngày mua</th>
						       <th width="120px">Mã khách hàng</th>
				            </tr>
				            <%
								} else {
    								out.print("Không có lịch sử mua hàng.");
								}
%>
				        </thead>
				        <tbody>
				            <%
				            if (kh != null) {
				                // Lấy về danh sách lịch sử
				                ArrayList<lichsu> dsls = (ArrayList<lichsu>) request.getAttribute("dslichsu");
				                if (dsls != null) {
				                int n = dsls.size();
				                for (int i = 0; i < n; i++) {
				                    lichsu s = dsls.get(i);
				                    if (s.getMakh() == kh.getMakh()) {%>
				                        <tr>
				                          
				                            <td><%= s.getTensanpham() %></td>
				                            <td><%= s.getSoLuongMua() %></td>
				                            <td><%= s.getGia() %></td>
				                            <td><%= s.getThanhTien() %></td>
				                            <td><%= s.getNgayMua() %></td>
				                            <td><%= s.getMakh() %><br>
				                        	<td style="color: #337ab7;"><% if(s.isDamua()== true){
				                        		out.print("Đã mua");
				                        	}else{
				                        		out.print("Chờ xác nhận");
				                        	}%>
				                            </td>
				                        </tr>
				                    <%}}} %>
				            <%} %>
				        </tbody>
				    </table>
				</td>
		</tr>
	</table>

</div>
  


</body>
</html>
