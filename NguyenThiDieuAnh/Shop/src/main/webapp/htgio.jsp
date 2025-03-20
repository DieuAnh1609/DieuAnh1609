<%@page import="giohangmodal.sanpham"%>
<%@page import="khachhangmodal.khachhang"%>
<%@page import="giohangmodal.giohangbo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="loaiModal.loai"%>
<%@page import="loaiModal.loaibo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Giỏ Hàng</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
        .table-hover tbody tr:hover {
            background-color: #FFB6C1; /* Màu hồng nhạt cho hover */
        }
        .table {
            background-color: #FFC0CB; /* Màu hồng nhạt cho bảng */
            border-radius: 8px;
            overflow: hidden;
        }
        .table th, .table td {
            text-align: center;
        }
        .btn-danger {
            background-color: #FF69B4;
            color: #FFF;
            border: none;
            border-radius: 20px;
            padding: 10px 20px;
            font-size: 14px;
            font-weight: bold;
            transition: all 0.3s;
        }
        .btn-danger:hover {
            background-color: #FFC0CB;
            color: #000;
        }
        .btn-link {
            color: #FF69B4;
            font-weight: bold;
        }
        .btn-link:hover {
            color: #FFC0CB;
        }
        .highlighted-text {
    		color: #FFFFFF; /* Màu chữ trắng */
    		padding: 10px;
    		font-size: 14px;
    		line-height: 30px; /* Căn chỉnh theo chiều dọc của menu */
    		display: inline-block;
		}
        .btn-primary {
        background-color: #4A90E2; /* Màu xanh dương */
        color: #FFF;
        border: none;
        border-radius: 20px;
        padding: 10px 20px;
        font-size: 14px;
        font-weight: bold;
        transition: all 0.3s;
    	}
    	.btn-primary:hover {
        background-color: #3E7BBE; /* Màu xanh dương đậm hơn khi hover */
        color: #FFF;
   	 	}
    	.action-buttons {
        margin-top: 20px; /* Đẩy nút xuống dưới */
        text-align: right; /* Căn nút sang bên phải */
    	}
        .search-form {
            background-color: #FFD1DC; /* Hồng nhạt */
            padding: 10px;
            border-radius: 8px;
            text-align: center;
        }
        .search-form input {
            width: 60%;
            max-width: 300px;
            border: none; /* Bỏ viền */
            border-radius: 20px;
            padding: 10px;
        }
        .search-form button {
            background-color: #FF69B4; /* Màu hồng cho nút */
            color: #FFF;
            border: none;
            border-radius: 20px;
            padding: 10px 20px;
            font-size: 14px;
            font-weight: bold;
        }
        .search-form button:hover {
            background-color: #FFC0CB; /* Hồng nhạt khi hover */
            color: #000;
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <ul class="nav navbar-nav">
            <li><a href="shopController">Trang chủ</a></li>
            <li><a href="htgioController">Giỏ hàng</a></li>
            <li><a href="xacnhanController">Đơn hàng</a></li>
            <li><a href="lichsuController">Lịch sử mua hàng</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <% 
            if (session.getAttribute("dn") == null) {
            %>
                <li><a href="loginKHController"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
            <% 
            } else {
                khachhang kh = (khachhang) session.getAttribute("dn");
            %>
                <li><a href="logoutController"><span class="glyphicon glyphicon-user"></span> Log out</a></li>
                <li class="highlighted-text"><%= kh.getHoten() %></li>
            <% 
            } 
            %>
        </ul>
    </div>
</nav>

<div class="container">


    <div class="row">
        <!-- Danh sách sản phẩm trong giỏ hàng -->
        <div class="col-sm-8">
            <form action="suaxoaController" method="post">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Chọn</th>
                            <th>Tên sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Cập nhật</th>
                            <th>Thành tiền</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        giohangbo gh = (giohangbo) session.getAttribute("gh");
                        if (gh != null && gh.getDs() != null) {
                            for (sanpham sp : gh.getDs()) {
                        %>
                        <tr>
                            <td><input type="checkbox" value="<%= sp.getMaSanPham() %>" name="ck"></td>
                            <td><%= sp.getTenSanPham() %></td>
                            <td><%= sp.getGia() %> VNĐ</td>
                            <td><%= sp.getSoLuong() %></td>
                            <td>
                                <input type="number" name="<%= sp.getMaSanPham() %>" style="width:50px">
                                
                            </td>
                            <td><%= sp.getThanhTien() %> VNĐ</td>
                            <td>
                            <button type="submit" name="butsua" value="<%= sp.getMaSanPham() %>" class="btn-link">
                                    Sửa
                                </button>
                                <a href="suaxoaController?ms=<%= sp.getMaSanPham() %>" class="btn-link">Xóa</a>
                            </td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="7" style="text-align: center;">Giỏ hàng trống</td>
                        </tr>
                        <%
                        }
                        %>
                    </tbody>
                </table>
                <!-- Tổng tiền -->
                <p>Tổng: <%= (gh != null) ? gh.Tong() : 0 %> VNĐ</p>
                <button type="submit" name="butxoa" value="Xóa" class="btn btn-danger">Xóa đã chọn</button>
            </form>

            <!-- ThanhToan giỏ hàng -->
            <div class="action-buttons">
    <form action="xacnhanController" method="post">
        <input type="submit" name="butxacnhan" value="Thanh Toan" class="btn-primary">
    </form>
</div>
        </div>
    </div>
</div>

</body>
</html>
