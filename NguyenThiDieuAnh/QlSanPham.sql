USE [master]
GO
/****** Object:  Database [QlSanPham]    Script Date: 1/10/2025 7:45:03 AM ******/
CREATE DATABASE [QlSanPham]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QlSanPham', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.DIEUANH\MSSQL\DATA\QlSanPham.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QlSanPham_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.DIEUANH\MSSQL\DATA\QlSanPham_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QlSanPham] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QlSanPham].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QlSanPham] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QlSanPham] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QlSanPham] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QlSanPham] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QlSanPham] SET ARITHABORT OFF 
GO
ALTER DATABASE [QlSanPham] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QlSanPham] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QlSanPham] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QlSanPham] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QlSanPham] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QlSanPham] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QlSanPham] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QlSanPham] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QlSanPham] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QlSanPham] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QlSanPham] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QlSanPham] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QlSanPham] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QlSanPham] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QlSanPham] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QlSanPham] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QlSanPham] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QlSanPham] SET RECOVERY FULL 
GO
ALTER DATABASE [QlSanPham] SET  MULTI_USER 
GO
ALTER DATABASE [QlSanPham] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QlSanPham] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QlSanPham] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QlSanPham] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QlSanPham] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QlSanPham] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QlSanPham', N'ON'
GO
ALTER DATABASE [QlSanPham] SET QUERY_STORE = ON
GO
ALTER DATABASE [QlSanPham] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QlSanPham]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 1/10/2025 7:45:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [nvarchar](50) NOT NULL,
	[TenSanPham] [nvarchar](255) NULL,
	[Size] [nvarchar](50) NULL,
	[MauSac] [nvarchar](50) NULL,
	[SoLuong] [bigint] NULL,
	[Gia] [bigint] NULL,
	[MaLoai] [nvarchar](50) NULL,
	[Anh] [nvarchar](50) NULL,
	[NgayNhap] [datetime] NULL,
	[XuatXu] [nvarchar](50) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 1/10/2025 7:45:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaChiTietHD] [bigint] IDENTITY(1,1) NOT NULL,
	[MaSanPham] [nvarchar](50) NULL,
	[SoLuongMua] [int] NULL,
	[MaHoaDon] [bigint] NOT NULL,
	[DaMua] [bit] NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaChiTietHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 1/10/2025 7:45:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [bigint] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SoDT] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[TenDN] [nvarchar](50) NULL,
	[Pass] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 1/10/2025 7:45:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [bigint] IDENTITY(1,1) NOT NULL,
	[MaKH] [bigint] NULL,
	[NgayMua] [datetime] NULL,
	[DaMua] [bit] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vxacnhan]    Script Date: 1/10/2025 7:45:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vxacnhan]
AS
SELECT dbo.KhachHang.HoTen, dbo.HoaDon.NgayMua, SUM(dbo.ChiTietHoaDon.SoLuongMua) AS SoLuongMua, SUM(dbo.SanPham.Gia) AS Gia, SUM(dbo.ChiTietHoaDon.SoLuongMua * dbo.SanPham.Gia) AS ThanhTien, 
                  dbo.ChiTietHoaDon.MaHoaDon
FROM     dbo.ChiTietHoaDon INNER JOIN
                  dbo.HoaDon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.HoaDon.MaHoaDon INNER JOIN
                  dbo.KhachHang ON dbo.HoaDon.MaKH = dbo.KhachHang.MaKH INNER JOIN
                  dbo.SanPham ON dbo.ChiTietHoaDon.MaSanPham = dbo.SanPham.MaSanPham
WHERE  (dbo.ChiTietHoaDon.DaMua = 0)
GROUP BY dbo.KhachHang.HoTen, dbo.HoaDon.NgayMua, dbo.ChiTietHoaDon.MaHoaDon
GO
/****** Object:  View [dbo].[VDoanhThu]    Script Date: 1/10/2025 7:45:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VDoanhThu]
AS
SELECT dbo.KhachHang.HoTen, dbo.HoaDon.NgayMua, SUM(dbo.ChiTietHoaDon.SoLuongMua) AS Expr1, SUM(dbo.SanPham.Gia) AS Expr2, SUM(dbo.ChiTietHoaDon.SoLuongMua * dbo.SanPham.Gia) AS ThanhTien, 
                  dbo.ChiTietHoaDon.MaHoaDon
FROM     dbo.ChiTietHoaDon INNER JOIN
                  dbo.HoaDon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.HoaDon.MaHoaDon INNER JOIN
                  dbo.SanPham ON dbo.ChiTietHoaDon.MaSanPham = dbo.SanPham.MaSanPham INNER JOIN
                  dbo.KhachHang ON dbo.HoaDon.MaKH = dbo.KhachHang.MaKH
WHERE  (dbo.HoaDon.DaMua = 0)
GROUP BY dbo.KhachHang.HoTen, dbo.HoaDon.NgayMua, dbo.ChiTietHoaDon.MaHoaDon
GO
/****** Object:  View [dbo].[Vlichsu]    Script Date: 1/10/2025 7:45:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vlichsu]
AS
SELECT dbo.KhachHang.HoTen, dbo.SanPham.TenSanPham, dbo.ChiTietHoaDon.SoLuongMua, dbo.SanPham.Gia, dbo.ChiTietHoaDon.SoLuongMua * dbo.SanPham.Gia AS ThanhTien, dbo.HoaDon.NgayMua, dbo.HoaDon.DaMua, 
                  dbo.KhachHang.MaKH
FROM     dbo.ChiTietHoaDon INNER JOIN
                  dbo.HoaDon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.HoaDon.MaHoaDon INNER JOIN
                  dbo.SanPham ON dbo.ChiTietHoaDon.MaSanPham = dbo.SanPham.MaSanPham INNER JOIN
                  dbo.KhachHang ON dbo.HoaDon.MaKH = dbo.KhachHang.MaKH
GO
/****** Object:  Table [dbo].[DangNhap]    Script Date: 1/10/2025 7:45:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangNhap](
	[TenDangNhap] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_DangNhap] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 1/10/2025 7:45:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [nvarchar](50) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_Loai] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 

INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (1, N'SP01', 1, 2, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (2, N'SP02', 2, 1, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (3, N'SP04', 1, 5, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (4, N'SP09', 2, 3, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (5, N'SP03', 5, 6, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (6, N'SP05', 2, 2, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (7, N'SP01', 5, 3, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (8, N'SP03', 1, 13, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (9, N'SP06', 1, 13, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (10, N'SP08', 1, 13, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (11, N'SP03', 1, 14, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (12, N'SP05', 1, 14, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (13, N'SP07', 1, 14, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (14, N'SP02', 1, 15, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (15, N'SP09', 1, 15, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (16, N'SP07', 1, 15, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (17, N'SP01', 1, 16, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (18, N'SP08', 1, 16, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (19, N'SP09', 1, 16, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (20, N'SP03', 1, 17, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (21, N'SP07', 1, 17, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (22, N'SP01', 1, 18, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (23, N'SP07', 1, 18, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (24, N'SP09', 1, 21, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (25, N'SP01', 1, 22, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (26, N'SP02', 2, 23, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (27, N'SP13', 1, 23, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (28, N'SP18', 1, 24, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (29, N'SP16', 1, 25, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (30, N'SP01', 1, 26, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (31, N'SP02', 1, 26, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (32, N'SP19', 1, 27, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (33, N'SP01', 1, 28, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (34, N'SP07', 1, 28, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (35, N'SP10', 1, 29, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (36, N'SP11', 1, 34, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (37, N'SP14', 1, 35, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (38, N'SP07', 1, 36, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (39, N'SP03', 1, 37, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (40, N'SP03', 1, 38, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaSanPham], [SoLuongMua], [MaHoaDon], [DaMua]) VALUES (41, N'SP12', 1, 38, NULL)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF
GO
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau]) VALUES (N'admin', N'123')
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau]) VALUES (N'admin1', N'321')
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (1, NULL, CAST(N'2025-01-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (2, NULL, CAST(N'2024-12-31T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (3, NULL, CAST(N'2025-01-03T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (4, NULL, CAST(N'2024-11-09T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (5, NULL, CAST(N'2025-01-01T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (6, NULL, CAST(N'2024-12-31T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (7, NULL, CAST(N'2025-01-04T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (8, NULL, CAST(N'2024-12-09T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (9, 1, CAST(N'2025-01-08T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (10, 1, CAST(N'2025-01-08T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (11, 1, CAST(N'2025-01-08T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (12, 1, CAST(N'2025-01-08T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (13, 1, CAST(N'2025-01-08T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (14, 1, CAST(N'2025-01-08T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (15, 1, CAST(N'2025-01-08T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (16, 1, CAST(N'2025-01-08T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (17, 1, CAST(N'2025-01-08T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (18, 1, CAST(N'2025-01-08T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (19, 1, CAST(N'2025-01-08T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (20, 1, CAST(N'2025-01-08T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (21, 1, CAST(N'2025-01-08T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (22, 1, CAST(N'2025-01-08T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (23, 1, CAST(N'2025-01-08T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (24, 1, CAST(N'2025-01-08T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (25, 1, CAST(N'2025-01-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (26, 1, CAST(N'2025-01-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (27, 1, CAST(N'2025-01-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (28, 2, CAST(N'2025-01-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (29, 1, CAST(N'2025-01-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (30, 1, CAST(N'2025-01-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (31, 1, CAST(N'2025-01-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (32, 1, CAST(N'2025-01-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (33, 1, CAST(N'2025-01-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (34, 1, CAST(N'2025-01-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (35, 1, CAST(N'2025-01-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (36, 1, CAST(N'2025-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (37, 1, CAST(N'2025-01-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKH], [NgayMua], [DaMua]) VALUES (38, 1, CAST(N'2025-01-10T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SoDT], [Email], [TenDN], [Pass]) VALUES (1, N'Nguyễn Thị Diệu Anh', N'Huế', N'0787797089', N'nguyendieuanh16923@gmail.com', N'dieuanh', N'123')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SoDT], [Email], [TenDN], [Pass]) VALUES (2, N'Nguyễn Thị Diệu Linh', N'Huế', N'0775425324', N'dieulinh610@gmail.com', N'dieulinh', N'321')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SoDT], [Email], [TenDN], [Pass]) VALUES (3, N'Nguyễn Anh Vũ', N'Huế', N'0901304528', N'nguyenanhvu1976@gmail.com', N'anhvu', N'1234')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SoDT], [Email], [TenDN], [Pass]) VALUES (4, N'Lê Thị Thanh Nhàn', N'Huế', N'0344242303', N'nhangle611@gmail.com', N'thanhnhan', N'12345')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SoDT], [Email], [TenDN], [Pass]) VALUES (5, N'Nguyễn Thị Diệu Huyền', N'Hue', N'0935516371', N'dieuhuyen122@gmail.com', N'dieuhuyen', N'c6f057b86584942e415435ffb1fa93d4')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SoDT], [Email], [TenDN], [Pass]) VALUES (9, N'thanhdanh', N'Hue', N'038626299', N'thanhdanh@gmail.com', N'thanhdanh', N'698d51a19d8a121ce581499d7b701668')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (N'Ao khoac', N'Áo khoác')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (N'Ao len', N'Áo len')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (N'Ao so mi', N'Áo sơ mi')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (N'Ao thun', N'Áo thun')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (N'Chan vay', N'Chân váy')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (N'Dam', N'Đầm')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (N'Do ngu', N'Đồ ngủ')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (N'Quan', N'Quần')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP01', N'Áo baby tee nữ', N'M, L', N'Trắng', 35345, 73000, N'Ao thun', N'images/aobabytee.jpg', CAST(N'2024-09-12T00:00:00.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP02', N'Áo nơ nổi be', N'M, L', N'Be', 48167, 115000, N'Ao thun', N'images/aono.jpg', CAST(N'2024-10-10T00:00:00.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP03', N'Áo sơ mi nữ ', N'S, M, L', N'Xanh', 12213, 95000, N'Ao so mi', N'images/aosomi.jpg', CAST(N'2024-12-14T00:00:00.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP04', N'Áo Khoác Cardigan Viền Xanh Nâu', N'S, M, L', N'Nâu', 11135, 130000, N'Ao khoac', N'images/aokhoac.jpg', CAST(N'2024-08-07T00:00:00.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP05', N' Áo len croptop tay ngắn buộc nơ đan ', N'Free size', N'Xám', 10978, 159000, N'Ao len', N'images/aolen.jpg', CAST(N'2024-11-09T00:00:00.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP06', N'Đầm trễ vai', N'S, M, L', N'Trắng', 2354, 236000, N'Dam', N'images/dam.jpg', CAST(N'2024-12-02T00:00:00.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP07', N'Chân váy bèo ren tầng xòe ngắn coquette', N'S, M, L', N'Trắng', 76834, 75000, N'Chan vay', N'images/chanvay.jpg', CAST(N'2024-09-11T00:00:00.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP08', N'Quần Ống Rộng Nữ Vải Đũi Mát', N'S, M, L', N'Đen', 15034, 99000, N'Quan', N'images/quan.jpg', CAST(N'2024-11-20T00:00:00.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP09', N'Bộ đồ ngủ kẻ caro', N'Free size', N'Xanh lá', 23988, 129000, N'Do ngu', N'images/dongu.jpg', CAST(N'2024-10-22T00:00:00.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP10', N'Áo thun tăm viền khuy vàng đính cổ nơ dài tay ', N'Free size', N'Trắng', 567, 119000, N'Ao thun', N'images/aothuntam.jpg', CAST(N'2024-08-12T00:00:00.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP11', N'Áo thun tay nữ lỡ form rộng', N'Free size', N'Trắng Hồng', 127497, 116000, N'Ao thun', N'images/aothun.jpg', CAST(N'2024-05-12T00:00:00.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP12', N'Áo Khoác Nỉ Hoodie Zip Form Boxy', N'M, L, XL', N'Đen', 56517, 239000, N'Ao khoac', N'images/aokhoacni.jpg', CAST(N'2024-08-27T00:00:00.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP13', N' Chân váy cạp cao xếp ly', N'S, M, L', N'Xám', 112, 484000, N'Chan vay', N'images/chanvay1.jpg', CAST(N'2024-12-02T00:00:00.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP14', N'Quần Short Jeans lửng ', N'S, M, L', N'Xanh', 59941, 109000, N'Quan', N'images/quan4.jpg', CAST(N'2024-11-20T00:00:00.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP15', N'Quần cạp cao chiết ly eo dáng ống suông', N'S, M, L', N'Trắng', 13, 375000, N'Quan', N'images/quan2.jpg', CAST(N'2024-07-20T00:00:00.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP16', N'Quần Jean Ống Rộng', N'S, M, L', N'Xanh Retro', 9577, 200000, N'Quan', N'images/quan3.jpg', CAST(N'2024-09-27T00:00:00.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP17', N'ÁO JENNIFER', N'Free size', N'Đen', 15, 269000, N'Ao khoac', N'images/aokhoac1.jpg', CAST(N'2024-12-09T00:00:00.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP18', N'OLOEY Đồ ngủ pijama đồ mặc nhà nữ', N'Free Size', N'Đen', 545025, 152000, N'Do ngu', N'images/dongu3.jpg', CAST(N'2024-08-12T00:00:00.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP19', N'BỘ NGỦ NỮ CAXA 🦋', N'Free Size', N'Cam', 91560, 67000, N'Do ngu', N'images/dongu2.jpg', CAST(N'2024-06-19T00:00:00.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP20', N'Đầm tiểu thư công chúa ', N'S, M, L, XL', N'Đỏ', 3422, 110000, N'Dam', N'images/dam1.jpg', CAST(N'2024-08-27T00:00:00.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP21', N'Đầm nữ xinh tiểu thư sang chảnh', N'XS, S, L, XL', N'Xám', 2324, 245000, N'Dam', N'images/dam2.jpg', CAST(N'2024-12-19T00:00:00.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP22', N'Đâm Đen Phối Cổ Sơmi Kèm Nơ', N'S, M, L', N'Đen', 2443, 175000, N'Dam', N'images/dam3.jpg', CAST(N'2024-07-29T00:00:00.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP23', N'Áo Len Nữ Mới Cho Mùa Thu', N'Free Size', N'Đỏ', 4977, 165000, N'Ao len', N'images/aolen1.jpg', CAST(N'2024-12-01T00:00:00.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP24', N'Áo len bông gấu choàng khăn', N'S, M, L', N'Trắng', 24, 119000, N'Ao len', N'images/aolen2.jpg', CAST(N'2024-10-09T00:00:00.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP25', N'Áo sơ mi trơn dài tay form rộng', N'S, M, L, XL', N'Vàng chanh', 180, 74000, N'Ao so mi', N'images/aosomi1.jpg', CAST(N'2024-06-10T00:00:00.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP26', N'Đầm tiểu thư chất dạ nhũ đính cúc Khí chất sang chảnh', N'M, L', N'Trắng', 125, 250000, N'Dam', N'images/dam5.png', CAST(N'2025-01-09T14:45:06.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP27', N'Chân Váy Midi Chất Voan Tơ Dáng Dài', N'Free Size', N'Trắng', 14908, 78000, N'Chan vay', N'images/chanvaydai.png', CAST(N'2025-01-09T14:39:30.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP28', N'Áo Sơ Mi Tay Ngắn SỌC Dáng Rộng', N'M, L, XL', N'Xanh', 6554, 125000, N'Ao so mi', N'images/aosomitayngan.png', CAST(N'2025-01-09T14:41:40.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP29', N'Áo khoác phao mác cao su', N'M, L, XL', N'Trắng, Nâu', 24564, 500000, N'Ao khoac', N'images/aokhoacphao.png', CAST(N'2025-01-09T14:47:37.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP30', N'Áo Len Dáng Rộng From Dài Tay Dài Cổ Tim', N'Free Size', N'Hồng', 6567, 275000, N'Ao len', N'images/aolendangdai.png', CAST(N'2025-01-09T14:49:36.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP31', N'Áo Sơ Mi Nữ Thiết Kế Viền Cổ Áo Xinh Xắn', N'S, M, L', N'Trắng', 987, 225000, N'Ao so mi', N'images/aosominu.png', CAST(N'2025-01-09T14:51:46.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP32', N'Chân Váy Nữ Xếp Ly', N'S, M, L, XL', N'Xám', 677654, 219000, N'Chan vay', N'images/chanvaynu.png', CAST(N'2025-01-09T15:02:09.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP33', N'Chân váy xếp ly cạp cao dáng chữ A dáng xò', N'S, M, L,XL, XXL', N'Xám', 57953, 109000, N'Chan vay', N'images/chanvayxam.png', CAST(N'2025-01-09T15:08:19.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP34', N'Bộ Đồ Ngủ Xuân Thu Nữ Retro Hàn Quốc', N'M, L, XL,XXL', N'Vàng', 1256, 144000, N'Do ngu', N'images/bodongu.png', CAST(N'2025-01-09T15:10:38.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP35', N'Áo khoác dù thể thao 2 lớp chống nắng chống gió thoáng mát', N'M, L, XL', N'Đỏ', 54353, 190000, N'Ao khoac', N'images/aokhoacdu.png', CAST(N'2025-01-09T15:16:55.000' AS DateTime), N'Việt Nam')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [Size], [MauSac], [SoLuong], [Gia], [MaLoai], [Anh], [NgayNhap], [XuatXu]) VALUES (N'SP36', N'Áo Khoác Nỉ Phối Sọc Form Rộng', N'M, L, XL', N'Xám', 9876, 189000, N'Ao khoac', N'images/aokhoacni.png', CAST(N'2025-01-09T15:18:27.000' AS DateTime), N'Việt Nam')
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_SanPham]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang1] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang1]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Loai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_Loai]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HoaDon"
            Begin Extent = 
               Top = 56
               Left = 296
               Bottom = 219
               Right = 490
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SanPham"
            Begin Extent = 
               Top = 38
               Left = 984
               Bottom = 201
               Right = 1178
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "KhachHang"
            Begin Extent = 
               Top = 129
               Left = 546
               Bottom = 292
               Right = 740
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VDoanhThu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VDoanhThu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[30] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 53
               Left = 904
               Bottom = 216
               Right = 1098
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HoaDon"
            Begin Extent = 
               Top = 102
               Left = 570
               Bottom = 265
               Right = 764
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SanPham"
            Begin Extent = 
               Top = 69
               Left = 317
               Bottom = 232
               Right = 511
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "KhachHang"
            Begin Extent = 
               Top = 56
               Left = 54
               Bottom = 219
               Right = 248
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1356
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vlichsu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vlichsu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[32] 2[9] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -1605
      End
      Begin Tables = 
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HoaDon"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KhachHang"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 170
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "SanPham"
            Begin Extent = 
               Top = 7
               Left = 774
               Bottom = 170
               Right = 968
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vxacnhan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vxacnhan'
GO
USE [master]
GO
ALTER DATABASE [QlSanPham] SET  READ_WRITE 
GO
