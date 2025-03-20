<%@page import="java.util.ArrayList"%>
<%@page import="khachhangmodal.khachhang"%>
<%@page import="shopmodal.shop"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Trang Chủ</title>
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
        /* Thanh tìm kiếm */
        .search-form {
            margin-bottom: 20px;
            background-color: #FFD1DC; /* Hồng nhạt */
            padding: 10px;
            border-radius: 8px;
            text-align: center; /* Căn giữa */
        }
        .search-form input {
            margin-right: 10px;
            width: 60%;
            max-width: 300px;
            border: none; /* Bỏ viền */
            border-radius: 20px; /* Bo góc */
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
            transition: all 0.3s;
        }
        .search-form button:hover {
            background-color: #FFC0CB; /* Hồng nhạt khi hover */
            color: #000;
        }
        
    </style>
</head>
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
                khachhang kh = (khachhang) session.getAttribute("dn");
                if (kh == null) {
                %>
                    <li><a href="registerController"><span class="glyphicon glyphicon-log-in"></span> Register</a></li>
                    <li><a href="loginKHController"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                <% 
                } else { 
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
        <!-- Form tìm kiếm sản phẩm -->
        <div class="row">
            <div class="col-sm-12 search-form">
                <form action="shopController" method="get" class="form-inline">
                    <input type="text" name="txttk" class="form-control" placeholder="Tìm kiếm sản phẩm...">
                    <button type="submit" class="btn btn-primary">Search</button>
                </form>
            </div>
        </div>

        <div class="row">
            <!-- Sidebar danh mục -->
            <div class="col-sm-2">
                <c:if test="${not empty dsloai}">
                    <c:forEach var="l" items="${dsloai}">
                        <a href="shopController?ml=${l.maLoai}" class="list-group-item">
                            ${l.tenLoai}
                        </a>
                    </c:forEach>
                </c:if>
            </div>

            <!-- Hiển thị sản phẩm -->
            <div class="col-sm-10">
                <div class="row">
                    <%
                    ArrayList<shop> ds = (ArrayList<shop>) request.getAttribute("dssanpham");
                    if (ds != null && !ds.isEmpty()) {
                        for (int i = 0; i < ds.size(); i++) {
                            shop s = ds.get(i);
                    %>
                        <div class="col-sm-4 col-md-4">
                            <div class="panel">
                                <div class="panel-body">
                                    <img src="<%= s.getAnh() %>" alt="Product Image" class="img-responsive">
                                    <strong><%= s.getTensanpham() %></strong>
                                    <p>Giá: <%= s.getGia() %> VNĐ</p>
                                    <a href="giohangController?ms=<%= s.getMasanpham() %>&ts=<%= s.getTensanpham() %>&gia=<%= s.getGia() %>" class="btn btn-buy">Đặt Mua</a>
                                </div>
                            </div>
                        </div>
                    <%
                        }
                    } else {
                    %>
                        <p>Không có sản phẩm nào để hiển thị.</p>
                    <%
                    }
                    %>
                </div>
            </div>
        </div>

        <!-- Phân trang -->
        <c:if test="${not empty endP}">
            <div class="pagination-container">
                <c:forEach var="it" begin="1" end="${endP}">
                    <a href="shopController?index=${it}" class="btn btn-default">${it}</a>
                </c:forEach>
            </div>
        </c:if>
    </div>
</body>
</html>
