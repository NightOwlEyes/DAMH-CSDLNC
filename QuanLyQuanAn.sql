USE [master]
GO
/****** Object:  Database [QuanLyQuanAn]    Script Date: 24/06/2025 15:17:54 ******/
CREATE DATABASE [QuanLyQuanAn]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyQuanAn', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QuanLyQuanAn.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyQuanAn_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QuanLyQuanAn_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QuanLyQuanAn] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyQuanAn].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyQuanAn] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyQuanAn] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyQuanAn] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyQuanAn] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyQuanAn] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyQuanAn] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyQuanAn] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyQuanAn] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyQuanAn] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyQuanAn] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyQuanAn] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyQuanAn] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyQuanAn] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyQuanAn] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyQuanAn] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyQuanAn] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyQuanAn] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyQuanAn] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyQuanAn] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyQuanAn] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyQuanAn] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyQuanAn] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyQuanAn] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyQuanAn] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyQuanAn] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyQuanAn] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyQuanAn] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyQuanAn] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyQuanAn] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyQuanAn] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QuanLyQuanAn] SET QUERY_STORE = ON
GO
ALTER DATABASE [QuanLyQuanAn] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QuanLyQuanAn]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 24/06/2025 15:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaNhanVien] [int] NULL,
	[NgayLap] [datetime] NULL,
	[TongTien] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DoanhThuNgay]    Script Date: 24/06/2025 15:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DoanhThuNgay] AS
SELECT 
    CAST(NgayLap AS DATE) AS Ngay,
    SUM(TongTien) AS TongDoanhThu
FROM HoaDon
GROUP BY CAST(NgayLap AS DATE);
GO
/****** Object:  Table [dbo].[CongThucMon]    Script Date: 24/06/2025 15:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongThucMon](
	[MaMonAn] [int] NOT NULL,
	[MaNL] [int] NOT NULL,
	[DinhLuong] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMonAn] ASC,
	[MaNL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 24/06/2025 15:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaChiTiet] [int] IDENTITY(1,1) NOT NULL,
	[MaHoaDon] [int] NULL,
	[MaMonAn] [int] NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietKiemKe]    Script Date: 24/06/2025 15:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietKiemKe](
	[MaKiemKe] [int] NOT NULL,
	[MaNL] [int] NOT NULL,
	[TonThucTe] [decimal](10, 2) NOT NULL,
	[ChenhLech] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKiemKe] ASC,
	[MaNL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPhieuNhap]    Script Date: 24/06/2025 15:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuNhap](
	[MaPhieuNhap] [int] NOT NULL,
	[MaNL] [int] NOT NULL,
	[SoLuong] [decimal](10, 2) NULL,
	[DonGia] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhap] ASC,
	[MaNL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPhieuXuat]    Script Date: 24/06/2025 15:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuXuat](
	[MaPhieuXuat] [int] NOT NULL,
	[MaNL] [int] NOT NULL,
	[SoLuong] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuXuat] ASC,
	[MaNL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatBan]    Script Date: 24/06/2025 15:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatBan](
	[MaDatBan] [int] IDENTITY(1,1) NOT NULL,
	[MaKhachHang] [int] NULL,
	[SoNguoi] [int] NULL,
	[Ngay] [datetime] NULL,
	[GhiChu] [nvarchar](255) NULL,
	[MaNhanVien] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDatBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 24/06/2025 15:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](100) NULL,
	[SoDienThoai] [nvarchar](15) NULL,
	[Email] [nvarchar](100) NULL,
	[DiemTichLuy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonAn]    Script Date: 24/06/2025 15:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonAn](
	[MaMonAn] [int] IDENTITY(1,1) NOT NULL,
	[TenMon] [nvarchar](100) NOT NULL,
	[Gia] [decimal](10, 2) NOT NULL,
	[MoTa] [nvarchar](255) NULL,
	[ConBan] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMonAn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 24/06/2025 15:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](255) NOT NULL,
	[MaVaiTro] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguyenLieu]    Script Date: 24/06/2025 15:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguyenLieu](
	[MaNL] [int] IDENTITY(1,1) NOT NULL,
	[TenNL] [nvarchar](100) NOT NULL,
	[DonViTinh] [nvarchar](50) NULL,
	[TonKho] [decimal](10, 2) NULL,
	[TonToiThieu] [decimal](10, 2) NULL,
	[HanSuDung] [date] NULL,
	[GhiChu] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 24/06/2025 15:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](100) NULL,
	[SoDienThoai] [nvarchar](15) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[Email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 24/06/2025 15:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[SoDienThoai] [nvarchar](15) NULL,
	[Email] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[MaNguoiDung] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuKiemKe]    Script Date: 24/06/2025 15:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuKiemKe](
	[MaKiemKe] [int] IDENTITY(1,1) NOT NULL,
	[MaPhieuNhap] [int] NOT NULL,
	[NgayKiemKe] [date] NULL,
	[MaNhanVien] [int] NOT NULL,
 CONSTRAINT [PK__PhieuKie__D611C31F5F0A3A5D] PRIMARY KEY CLUSTERED 
(
	[MaKiemKe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 24/06/2025 15:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPhieuNhap] [int] IDENTITY(1,1) NOT NULL,
	[NgayNhap] [date] NULL,
	[MaNCC] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuXuat]    Script Date: 24/06/2025 15:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuXuat](
	[MaPhieuXuat] [int] IDENTITY(1,1) NOT NULL,
	[NgayXuat] [date] NULL,
	[LyDo] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuXuat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VaiTro]    Script Date: 24/06/2025 15:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VaiTro](
	[MaVaiTro] [int] IDENTITY(1,1) NOT NULL,
	[TenVaiTro] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaVaiTro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CongThucMon] ([MaMonAn], [MaNL], [DinhLuong]) VALUES (1, 1, CAST(0.20 AS Decimal(10, 2)))
INSERT [dbo].[CongThucMon] ([MaMonAn], [MaNL], [DinhLuong]) VALUES (1, 2, CAST(0.30 AS Decimal(10, 2)))
INSERT [dbo].[CongThucMon] ([MaMonAn], [MaNL], [DinhLuong]) VALUES (1, 3, CAST(0.10 AS Decimal(10, 2)))
INSERT [dbo].[CongThucMon] ([MaMonAn], [MaNL], [DinhLuong]) VALUES (2, 2, CAST(0.25 AS Decimal(10, 2)))
INSERT [dbo].[CongThucMon] ([MaMonAn], [MaNL], [DinhLuong]) VALUES (2, 3, CAST(0.15 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 

INSERT [dbo].[ChiTietHoaDon] ([MaChiTiet], [MaHoaDon], [MaMonAn], [SoLuong], [DonGia]) VALUES (1, 1, 1, 2, CAST(50000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHoaDon] ([MaChiTiet], [MaHoaDon], [MaMonAn], [SoLuong], [DonGia]) VALUES (2, 2, 2, 2, CAST(45000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF
GO
INSERT [dbo].[ChiTietKiemKe] ([MaKiemKe], [MaNL], [TonThucTe], [ChenhLech]) VALUES (1, 1, CAST(45.00 AS Decimal(10, 2)), CAST(-5.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietKiemKe] ([MaKiemKe], [MaNL], [TonThucTe], [ChenhLech]) VALUES (1, 2, CAST(17.00 AS Decimal(10, 2)), CAST(-3.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietKiemKe] ([MaKiemKe], [MaNL], [TonThucTe], [ChenhLech]) VALUES (2, 3, CAST(29.00 AS Decimal(10, 2)), CAST(-1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[ChiTietPhieuNhap] ([MaPhieuNhap], [MaNL], [SoLuong], [DonGia]) VALUES (1, 1, CAST(50.00 AS Decimal(10, 2)), CAST(12000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietPhieuNhap] ([MaPhieuNhap], [MaNL], [SoLuong], [DonGia]) VALUES (1, 2, CAST(20.00 AS Decimal(10, 2)), CAST(80000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietPhieuNhap] ([MaPhieuNhap], [MaNL], [SoLuong], [DonGia]) VALUES (2, 3, CAST(30.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[ChiTietPhieuXuat] ([MaPhieuXuat], [MaNL], [SoLuong]) VALUES (1, 1, CAST(5.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietPhieuXuat] ([MaPhieuXuat], [MaNL], [SoLuong]) VALUES (1, 2, CAST(3.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietPhieuXuat] ([MaPhieuXuat], [MaNL], [SoLuong]) VALUES (2, 3, CAST(2.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[DatBan] ON 

INSERT [dbo].[DatBan] ([MaDatBan], [MaKhachHang], [SoNguoi], [Ngay], [GhiChu], [MaNhanVien]) VALUES (1, 1, 4, CAST(N'2025-06-25T18:00:00.000' AS DateTime), N'Gần cửa sổ', 1)
INSERT [dbo].[DatBan] ([MaDatBan], [MaKhachHang], [SoNguoi], [Ngay], [GhiChu], [MaNhanVien]) VALUES (2, 2, 2, CAST(N'2025-06-25T19:00:00.000' AS DateTime), N'Tầng 2', 2)
SET IDENTITY_INSERT [dbo].[DatBan] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNhanVien], [NgayLap], [TongTien]) VALUES (1, 1, CAST(N'2025-06-24T12:00:00.000' AS DateTime), CAST(100000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNhanVien], [NgayLap], [TongTien]) VALUES (2, 2, CAST(N'2025-06-24T12:30:00.000' AS DateTime), CAST(90000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [SoDienThoai], [Email], [DiemTichLuy]) VALUES (1, N'Trần Minh', N'0933445566', N'minhtran@gmail.com', 100)
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [SoDienThoai], [Email], [DiemTichLuy]) VALUES (2, N'Ngọc Ánh', N'0944556677', N'anhngoc@gmail.com', 50)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[MonAn] ON 

INSERT [dbo].[MonAn] ([MaMonAn], [TenMon], [Gia], [MoTa], [ConBan]) VALUES (1, N'Cơm tấm sườn', CAST(50000.00 AS Decimal(10, 2)), N'Cơm tấm + sườn nướng + rau', 1)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMon], [Gia], [MoTa], [ConBan]) VALUES (2, N'Bún thịt nướng', CAST(45000.00 AS Decimal(10, 2)), N'Bún + thịt nướng + nước mắm', 1)
SET IDENTITY_INSERT [dbo].[MonAn] OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [MaVaiTro]) VALUES (1, N'admin1', N'123456', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [MaVaiTro]) VALUES (2, N'staff01', N'123456', 2)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
GO
SET IDENTITY_INSERT [dbo].[NguyenLieu] ON 

INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [DonViTinh], [TonKho], [TonToiThieu], [HanSuDung], [GhiChu]) VALUES (1, N'Gạo', N'kg', CAST(100.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(N'2025-08-01' AS Date), N'Gạo tấm')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [DonViTinh], [TonKho], [TonToiThieu], [HanSuDung], [GhiChu]) VALUES (2, N'Thịt heo', N'kg', CAST(50.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(N'2025-07-15' AS Date), N'Tươi mỗi sáng')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [DonViTinh], [TonKho], [TonToiThieu], [HanSuDung], [GhiChu]) VALUES (3, N'Rau sống', N'kg', CAST(30.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(N'2025-06-30' AS Date), N'Rau hữu cơ')
SET IDENTITY_INSERT [dbo].[NguyenLieu] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDienThoai], [DiaChi], [Email]) VALUES (1, N'Cty Gạo Miền Tây', N'0987111222', N'Cần Thơ', N'gao@mt.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDienThoai], [DiaChi], [Email]) VALUES (2, N'Thực Phẩm Xanh', N'0977555666', N'Q12, HCM', N'tpxanh@gmail.com')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [SoDienThoai], [Email], [DiaChi], [MaNguoiDung]) VALUES (1, N'Nguyễn Văn A', N'0909123456', N'vana@gmail.com', N'Q1, HCM', 1)
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [SoDienThoai], [Email], [DiaChi], [MaNguoiDung]) VALUES (2, N'Lê Thị B', N'0912345678', N'b.le@gmail.com', N'Tân Bình, HCM', 2)
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
GO
SET IDENTITY_INSERT [dbo].[PhieuKiemKe] ON 

INSERT [dbo].[PhieuKiemKe] ([MaKiemKe], [MaPhieuNhap], [NgayKiemKe], [MaNhanVien]) VALUES (1, 1, CAST(N'2025-06-23' AS Date), 1)
INSERT [dbo].[PhieuKiemKe] ([MaKiemKe], [MaPhieuNhap], [NgayKiemKe], [MaNhanVien]) VALUES (2, 2, CAST(N'2025-06-24' AS Date), 2)
SET IDENTITY_INSERT [dbo].[PhieuKiemKe] OFF
GO
SET IDENTITY_INSERT [dbo].[PhieuNhap] ON 

INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNCC]) VALUES (1, CAST(N'2025-06-20' AS Date), 1)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNCC]) VALUES (2, CAST(N'2025-06-21' AS Date), 2)
SET IDENTITY_INSERT [dbo].[PhieuNhap] OFF
GO
SET IDENTITY_INSERT [dbo].[PhieuXuat] ON 

INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [LyDo]) VALUES (1, CAST(N'2025-06-22' AS Date), N'Nấu bữa trưa')
INSERT [dbo].[PhieuXuat] ([MaPhieuXuat], [NgayXuat], [LyDo]) VALUES (2, CAST(N'2025-06-23' AS Date), N'Nấu bữa chiều')
SET IDENTITY_INSERT [dbo].[PhieuXuat] OFF
GO
SET IDENTITY_INSERT [dbo].[VaiTro] ON 

INSERT [dbo].[VaiTro] ([MaVaiTro], [TenVaiTro]) VALUES (1, N'Admin')
INSERT [dbo].[VaiTro] ([MaVaiTro], [TenVaiTro]) VALUES (2, N'Staff')
SET IDENTITY_INSERT [dbo].[VaiTro] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NguoiDun__55F68FC07A115C4C]    Script Date: 24/06/2025 15:17:54 ******/
ALTER TABLE [dbo].[NguoiDung] ADD UNIQUE NONCLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__NhanVien__C539D763393F9C2B]    Script Date: 24/06/2025 15:17:54 ******/
ALTER TABLE [dbo].[NhanVien] ADD UNIQUE NONCLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HoaDon] ADD  DEFAULT (getdate()) FOR [NgayLap]
GO
ALTER TABLE [dbo].[HoaDon] ADD  DEFAULT ((0)) FOR [TongTien]
GO
ALTER TABLE [dbo].[KhachHang] ADD  DEFAULT ((0)) FOR [DiemTichLuy]
GO
ALTER TABLE [dbo].[MonAn] ADD  DEFAULT ((1)) FOR [ConBan]
GO
ALTER TABLE [dbo].[NguyenLieu] ADD  DEFAULT ((0)) FOR [TonKho]
GO
ALTER TABLE [dbo].[NguyenLieu] ADD  DEFAULT ((0)) FOR [TonToiThieu]
GO
ALTER TABLE [dbo].[PhieuKiemKe] ADD  CONSTRAINT [DF__PhieuKiem__NgayK__7B5B524B]  DEFAULT (getdate()) FOR [NgayKiemKe]
GO
ALTER TABLE [dbo].[PhieuNhap] ADD  DEFAULT (getdate()) FOR [NgayNhap]
GO
ALTER TABLE [dbo].[PhieuXuat] ADD  DEFAULT (getdate()) FOR [NgayXuat]
GO
ALTER TABLE [dbo].[CongThucMon]  WITH CHECK ADD FOREIGN KEY([MaMonAn])
REFERENCES [dbo].[MonAn] ([MaMonAn])
GO
ALTER TABLE [dbo].[CongThucMon]  WITH CHECK ADD FOREIGN KEY([MaNL])
REFERENCES [dbo].[NguyenLieu] ([MaNL])
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([MaMonAn])
REFERENCES [dbo].[MonAn] ([MaMonAn])
GO
ALTER TABLE [dbo].[ChiTietKiemKe]  WITH CHECK ADD  CONSTRAINT [FK__ChiTietKi__MaKie__7F2BE32F] FOREIGN KEY([MaKiemKe])
REFERENCES [dbo].[PhieuKiemKe] ([MaKiemKe])
GO
ALTER TABLE [dbo].[ChiTietKiemKe] CHECK CONSTRAINT [FK__ChiTietKi__MaKie__7F2BE32F]
GO
ALTER TABLE [dbo].[ChiTietKiemKe]  WITH CHECK ADD FOREIGN KEY([MaNL])
REFERENCES [dbo].[NguyenLieu] ([MaNL])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD FOREIGN KEY([MaPhieuNhap])
REFERENCES [dbo].[PhieuNhap] ([MaPhieuNhap])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD FOREIGN KEY([MaNL])
REFERENCES [dbo].[NguyenLieu] ([MaNL])
GO
ALTER TABLE [dbo].[ChiTietPhieuXuat]  WITH CHECK ADD FOREIGN KEY([MaPhieuXuat])
REFERENCES [dbo].[PhieuXuat] ([MaPhieuXuat])
GO
ALTER TABLE [dbo].[ChiTietPhieuXuat]  WITH CHECK ADD FOREIGN KEY([MaNL])
REFERENCES [dbo].[NguyenLieu] ([MaNL])
GO
ALTER TABLE [dbo].[DatBan]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[DatBan]  WITH CHECK ADD  CONSTRAINT [FK_DatBan_NhanVien] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[DatBan] CHECK CONSTRAINT [FK_DatBan_NhanVien]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD FOREIGN KEY([MaVaiTro])
REFERENCES [dbo].[VaiTro] ([MaVaiTro])
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[PhieuKiemKe]  WITH CHECK ADD  CONSTRAINT [FK__PhieuKiem__MaPhi__7C4F7684] FOREIGN KEY([MaPhieuNhap])
REFERENCES [dbo].[PhieuNhap] ([MaPhieuNhap])
GO
ALTER TABLE [dbo].[PhieuKiemKe] CHECK CONSTRAINT [FK__PhieuKiem__MaPhi__7C4F7684]
GO
ALTER TABLE [dbo].[PhieuKiemKe]  WITH CHECK ADD  CONSTRAINT [FK_PhieuKiemKe_NhanVien] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[PhieuKiemKe] CHECK CONSTRAINT [FK_PhieuKiemKe_NhanVien]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
USE [master]
GO
ALTER DATABASE [QuanLyQuanAn] SET  READ_WRITE 
GO
