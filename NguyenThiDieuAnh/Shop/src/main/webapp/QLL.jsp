<%@page import="shopmodal.shop"%>
<%@page import="shopmodal.shopbo"%>
<%@page import="loaiModal.loai"%>
<%@page import="java.util.ArrayList"%>
<%@page import="loaiModal.loaibo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
        body {
            background-color: #FFFFFF; /* Hồng nhạt */
            color: #333;
        }
        h1 {
    		text-align: center; /* Căn giữa */
    		color: #FFC0CB; /* Màu hồng nhạt */
    		font-weight: bold; /* Làm đậm tiêu đề */
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
        .list-group-item {
            background-color: #FFC0CB; /* Hồng nhạt */
            color: #333;
            border: 1px solid #FFB6C1; /* Thêm viền */
            border-radius: 12px; /* Bo góc */
            transition: background-color 0.3s, transform 0.3s;
        }
        .list-group-item:hover {
            background-color: #FF69B4; /* Hồng đậm */
            color: #FFF;
            transform: scale(1.05); /* Hiệu ứng phóng to nhẹ */
        }
        .panel {
            border: none;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        .panel-body {
            text-align: center; /* Căn giữa cho nội dung */
        }
        .panel-body img {
            width: 100%;
            height: auto;
            border-radius: 8px;
        }
        .panel-body strong,
        .panel-body p {
            display: block; /* Đảm bảo các phần tử đều nằm trong các dòng riêng biệt */
            margin: 10px 0;
        }
        .highlighted-text {
            color: #FFFFFF; /* Màu chữ trắng */
            padding: 10px;
            font-size: 14px;
            line-height: 30px; /* Căn chỉnh theo chiều dọc của menu */
            display: inline-block;
        }
        .btn-buy {
            background-color: #FF69B4;
            color: #FFF;
            border: none;
            border-radius: 20px;
            padding: 10px 20px;
            font-size: 14px;
            font-weight: bold;
            transition: all 0.3s;
        }
        .btn-buy:hover {
            background-color: #FFC0CB;
            color: #000;
        }
        .pagination-container {
            display: flex;
            gap: 5px;
            justify-content: center;
            margin-top: 20px;
        }
        .btn-white {
            background-color: #FFB6C1;
            color: #333;
            border-radius: 12px;
            padding: 10px 20px;
            font-size: 14px;
            font-weight: bold;
            border: none;
            transition: background-color 0.3s, color 0.3s;
        }
        .btn-white:hover {
            background-color: #FF69B4;
            color: #FFF;
        }
		.table-bordered {
    		border: 4px solid #FFB6C1; 
    		border-radius: 8px; 
    		overflow: hidden;
		}

		.table th, .table td {
    		border: 1px solid #FFB6C1;/
    		text-align: center;
    		padding: 10px;
}
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-xs navbar-inverse">
        <div class="container-fluid">
            <ul class="nav navbar-nav">
                <li><a href="homeAdminController">Trang chủ</a></li>
                <li><a href="QLSPController">Quản lý sản phẩm</a></li>
                <li><a href="QLLController">Quản lý loại</a></li>
                <li><a href="QLDHController">Quản lý đơn hàng</a></li>
                <li><a href="QLKHController">Quản lý khách hàng</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
               <% 
                if (session.getAttribute("admin") != null) { 
                %>
                    <li><a href="loginAdminController"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                    
                <% 
                } else { 
                %>
                    <li><a href="logoutController"><span class="glyphicon glyphicon-user"></span> Log out</a></li>
                <% 
                } 
                %>
            </ul>
        </div>
    </nav>
    <!-- Content Wrapper -->
    <div class="content-wrapper">
        <!-- Content Header -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="text-center " style="font-weight: bold;">Quản Lý Loại</h1>
                    </div>
                </div>
            </div>
        </section>
        <!-- Main Content -->
       <%
       loaibo lbo = new loaibo();
       ArrayList<loai> ds = lbo.getLoai();
       shopbo sbo = new shopbo();
       ArrayList<shop> dsShop = sbo.getShop();
   %>
              <div class="container">
   	<form method="post" action="QLLController" enctype="multipart/form-data">
       	<table class="table table-bordered table-striped table-hover" style="margin-top: 20px">
   	 		<%String maloai = (String)request.getAttribute("maloai");
   	 		String tenloai = (String)request.getAttribute("tenloai");
   			if(maloai != null)
   			{%>
	        <tr>
	            <th class="text-center">Mã Loại</th>
	            <td><input type="text" name="txtmaloai" value="<%= maloai %>"></td>
	            <th class="text-center">Tên Loại</th>
	            <td><input type="text" name="txttenloai" value="<%= tenloai %>"></td>
	        
	        </tr>
	 
	    
	      
	        <%}else {%>
	        <tr>
	            <th class="text-center">Mã Loại</th>
	            <td><input type="text" name="txtmaloai" value=""></td>
	            <th class="text-center">Tên Loại</th>
	            <td><input type="text" name="txttenloai" value=""></td>
	           
	        </tr>
	 
	      
	  
	        
	        <%} %>
	        <tr>
	            <td colspan="6" class="text-center" style="width: 100px; ">
	                <input style="width: 120px " type="submit" name="action" value="Thêm" class="btn btn-primary btn-white">
	                <input style="width: 120px" type="submit" name="action" value="Cập nhật" class="btn btn-success btn-white">
	            </td>

	        </tr>

	</table>
	</form>
	  <h1 class="text-center " style="font-weight: bold;">Danh Sách Loại Sản Phẩm</h1>
	<form method="post" action="QLLController" >
        <table class="table table-bordered table-striped ">
        	<thead>
	            <tr style="color: black;">
	                <th >Mã loại</th>
	                <th>Tên loại</th>
	                <th>Sửa loại</th>
	                <th>Xóa loại</th>
	            </tr>
	        </thead>
    
        <% for (int i = 0; i < ds.size(); i++) { %>
            <tr>
                <td><%= ds.get(i).getMaLoai() %></td>
                <td><%= ds.get(i).getTenLoai() %></td>
              
                <td>
                	<!-- <input type="submit" name="sl" value="Select" class="btn btn-success"> -->
                	 <a href="QLLController?maloai=<%=ds.get(i).getMaLoai()%>&tenloai=<%= ds.get(i).getTenLoai()%>"
                	  class="btn btn-success btn-white">Sửa</a>
                </td>
                <td>
                <a href="QLLController?maloaixoa=<%=ds.get(i).getMaLoai()%>" class="btn btn-danger btn-white">Xóa</a>
                </td>
            </tr>
        <% } %>
       </table>
	</form>
	</div>

    </div>
</div>
</body>
</html>