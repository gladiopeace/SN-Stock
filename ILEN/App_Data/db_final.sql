CREATE DATABASE [ILENDB]
GO
USE [ILENDB]
GO
/****** Object:  UserDefinedFunction [dbo].[fnTinhTongDiemTheoMaKQDG]    Script Date: 6/17/2015 3:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fnTinhTongDiemTheoMaKQDG]
(
	@maKQDG int
)
returns float
begin
	declare @kq float
	select @kq =  sum(C.diem)
	from
	(select Sum(A.TongDiem * B.TrongSo/100) as diem
	from ChiTietDanhGia as A
	inner join NhomTieuChi as B
	on A.MaNhomTC = B.MaNTC
	where A.MaTCCha is null and A.MaKQDG = @maKQDG
	group by B.MaNTC, B.TrongSo) as C
	return @kq
end

GO
/****** Object:  Table [dbo].[AdminDV]    Script Date: 6/17/2015 3:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdminDV](
	[MaDV] [int] NOT NULL,
	[TenDN] [varchar](50) NOT NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[GioiTinh] [bit] NULL,
	[NgaySinh] [datetime] NULL,
	[MatKhauMD] [varchar](50) NOT NULL,
	[Hinh] [varchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[DienThoai] [varchar](20) NULL,
	[TrangThai] [bit] NULL,
	[MaVTCV] [int] NULL,
 CONSTRAINT [PK_AdminDV_1] PRIMARY KEY CLUSTERED 
(
	[MaDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BieuMauDanhGia]    Script Date: 6/17/2015 3:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BieuMauDanhGia](
	[MaBM] [int] IDENTITY(1,1) NOT NULL,
	[MaVTCV] [int] NOT NULL,
	[TenBM] [nvarchar](1000) NOT NULL,
	[TenBMEN] [varchar](1000) NULL,
	[Chon] [bit] NOT NULL,
	[NgayTao] [datetime] NULL,
	[MoTa] [nvarchar](max) NULL,
	[MoTaEN] [varchar](max) NULL,
	[MaDV] [int] NOT NULL,
	[MaCK] [int] NOT NULL,
 CONSTRAINT [PK_BieuMauDanhGia] PRIMARY KEY CLUSTERED 
(
	[MaBM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BoPhan]    Script Date: 6/17/2015 3:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BoPhan](
	[MaBP] [int] IDENTITY(1,1) NOT NULL,
	[TenBP] [nvarchar](1000) NOT NULL,
	[MaDV] [int] NOT NULL,
	[TenBPEN] [varchar](1000) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_BoPhan] PRIMARY KEY CLUSTERED 
(
	[MaBP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CapDoTheoTieuChi]    Script Date: 6/17/2015 3:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CapDoTheoTieuChi](
	[Ma] [int] IDENTITY(1,1) NOT NULL,
	[MaCD] [int] NOT NULL,
	[MaTC] [int] NOT NULL,
	[GiaTri] [float] NOT NULL,
	[Chon] [bit] NOT NULL,
 CONSTRAINT [PK_DiemTheoTieuChi] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CapDoTieuChi]    Script Date: 6/17/2015 3:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CapDoTieuChi](
	[MaCD] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](max) NULL,
	[TenEN] [nvarchar](max) NULL,
	[GiaTri] [float] NOT NULL,
	[DonViTinh] [nchar](10) NULL,
	[MoTa] [nvarchar](max) NULL,
	[MaDV] [int] NOT NULL,
	[Chon] [bit] NOT NULL,
 CONSTRAINT [PK_Diem] PRIMARY KEY CLUSTERED 
(
	[MaCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietDanhGia]    Script Date: 6/17/2015 3:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDanhGia](
	[MaCTDG] [int] IDENTITY(1,1) NOT NULL,
	[MaTCTheoBM] [int] NOT NULL,
	[MaCD] [int] NOT NULL,
	[MaKQDG] [int] NOT NULL,
	[TongDiem] [float] NOT NULL,
	[MaTC] [int] NOT NULL,
	[MaTCCha] [int] NULL,
	[MaNhomTC] [int] NOT NULL,
 CONSTRAINT [PK_ChiTietDanhGia] PRIMARY KEY CLUSTERED 
(
	[MaCTDG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChuKyDanhGia]    Script Date: 6/17/2015 3:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChuKyDanhGia](
	[MaCK] [int] IDENTITY(1,1) NOT NULL,
	[TenCK] [nvarchar](1000) NOT NULL,
	[TenCKEN] [varchar](1000) NULL,
	[BatDau] [datetime] NOT NULL,
	[KetThuc] [datetime] NOT NULL,
	[TrangThai] [int] NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[MoTaEN] [varchar](max) NULL,
	[MaDV] [int] NOT NULL,
 CONSTRAINT [PK_ChuKyDanhGia] PRIMARY KEY CLUSTERED 
(
	[MaCK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChuyenMon]    Script Date: 6/17/2015 3:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChuyenMon](
	[MaCM] [int] IDENTITY(1,1) NOT NULL,
	[TenCM] [nvarchar](1000) NOT NULL,
	[TenCMEN] [varchar](1000) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[MaDV] [int] NOT NULL,
 CONSTRAINT [PK_ChuyenMon] PRIMARY KEY CLUSTERED 
(
	[MaCM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DanhMucHienThi]    Script Date: 6/17/2015 3:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DanhMucHienThi](
	[Ma] [varchar](100) NOT NULL,
	[TenVN] [nvarchar](1000) NOT NULL,
	[TenEN] [varchar](1000) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[TenGoi] [nvarchar](1000) NULL,
	[CallName] [varchar](1000) NULL,
	[ThuTuHienThi] [int] NULL,
	[ViewOrder] [int] NULL,
 CONSTRAINT [PK_DanhMucHienThi] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DanhMucQuanTri]    Script Date: 6/17/2015 3:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DanhMucQuanTri](
	[MaDM] [varchar](200) NOT NULL,
	[TenDM] [nvarchar](200) NOT NULL,
	[TenDMEN] [varchar](200) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_DanhMucQuanTri] PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DonVi]    Script Date: 6/17/2015 3:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DonVi](
	[MaDV] [int] IDENTITY(1,1) NOT NULL,
	[TenDV] [nvarchar](1000) NOT NULL,
	[TenDVEN] [varchar](1000) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[DienThoai] [varchar](20) NULL,
	[Fax] [varchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[Logo] [nvarchar](500) NULL,
	[TrangThai] [bit] NULL,
	[TongSoTK] [int] NULL,
	[Website] [nvarchar](50) NULL,
	[MaNVAdmin] [varchar](50) NULL,
 CONSTRAINT [PK_Donvi] PRIMARY KEY CLUSTERED 
(
	[MaDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KetQuaDanhGia]    Script Date: 6/17/2015 3:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KetQuaDanhGia](
	[MaKQDG] [int] NOT NULL,
	[NgayDG] [datetime] NOT NULL,
	[NguoiDG] [varchar](50) NOT NULL,
	[NguoiDuocDG] [varchar](50) NOT NULL,
	[CoHieuLuc] [bit] NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
	[HienThi] [bit] NULL,
	[MaBM] [int] NULL,
	[KetLuan] [nvarchar](max) NULL,
	[KetLuanEN] [varchar](max) NULL,
 CONSTRAINT [PK_KetQuaDanhGia] PRIMARY KEY CLUSTERED 
(
	[MaKQDG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NgoaiNgu]    Script Date: 6/17/2015 3:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NgoaiNgu](
	[MaNN] [int] IDENTITY(1,1) NOT NULL,
	[TenNN] [nvarchar](200) NOT NULL,
	[TenNNEN] [varchar](200) NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_NgoaiNgu] PRIMARY KEY CLUSTERED 
(
	[MaNN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NgoaiNguCuaNhanVien]    Script Date: 6/17/2015 3:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NgoaiNguCuaNhanVien](
	[Ma] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [varchar](50) NOT NULL,
	[MaNN] [int] NOT NULL,
	[TrinhDo] [nvarchar](200) NULL,
 CONSTRAINT [PK_NgoaiNguCuaNhanVien] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 6/17/2015 3:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [varchar](50) NOT NULL,
	[HoTen] [nvarchar](200) NOT NULL,
	[GioiTinh] [bit] NULL,
	[NgaySinh] [datetime] NULL,
	[DienThoai] [varchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[Diachi] [nvarchar](max) NULL,
	[NgayHD] [datetime] NULL,
	[MaCM] [int] NOT NULL,
	[MaVTCV] [int] NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[MaVT] [int] NOT NULL,
	[Hinh] [nvarchar](200) NULL,
	[STT] [int] IDENTITY(1,1) NOT NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhomTieuChi]    Script Date: 6/17/2015 3:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhomTieuChi](
	[MaNTC] [int] IDENTITY(1,1) NOT NULL,
	[MaDV] [int] NOT NULL,
	[TenNTC] [nvarchar](1000) NOT NULL,
	[TenNTCEN] [varchar](1000) NULL,
	[TrongSo] [float] NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[Chon] [bit] NOT NULL,
 CONSTRAINT [PK_NhomTieuChi] PRIMARY KEY CLUSTERED 
(
	[MaNTC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 6/17/2015 3:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Quyen](
	[Ma] [int] IDENTITY(1,1) NOT NULL,
	[MaVT] [int] NOT NULL,
	[MaDM] [varchar](200) NOT NULL,
	[Xem] [bit] NULL,
	[Them] [bit] NULL,
	[Xoa] [bit] NULL,
	[Sua] [bit] NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SuperAdmin]    Script Date: 6/17/2015 3:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SuperAdmin](
	[TenDN] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[Hinh] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NULL,
	[DienThoai] [varchar](20) NULL,
	[HoTen] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_SuperAdmin] PRIMARY KEY CLUSTERED 
(
	[TenDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThangDo]    Script Date: 6/17/2015 3:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThangDo](
	[MaBM] [int] NOT NULL,
	[Tu] [float] NOT NULL,
	[Den] [float] NOT NULL,
	[KetQua] [nvarchar](1000) NOT NULL,
	[KetQuaEN] [varchar](1000) NULL,
	[MoTa] [nvarchar](max) NULL,
	[MoTaEN] [varchar](max) NULL,
	[NgayApDung] [datetime] NOT NULL,
	[CoHieuLuc] [bit] NOT NULL,
 CONSTRAINT [PK_ThangDo] PRIMARY KEY CLUSTERED 
(
	[MaBM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TieuChi]    Script Date: 6/17/2015 3:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TieuChi](
	[MaTC] [int] IDENTITY(1,1) NOT NULL,
	[MaNTC] [int] NOT NULL,
	[MaDTTC] [int] NULL,
	[TenTC] [nvarchar](1000) NOT NULL,
	[TenTCEN] [varchar](1000) NULL,
	[TrongSo] [float] NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[MaTCCha] [int] NULL,
	[Chon] [bit] NOT NULL,
 CONSTRAINT [PK_TieuChi] PRIMARY KEY CLUSTERED 
(
	[MaTC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TieuChiTheoBieuMau]    Script Date: 6/17/2015 3:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TieuChiTheoBieuMau](
	[Ma] [int] IDENTITY(1,1) NOT NULL,
	[MaBM] [int] NOT NULL,
	[MaTC] [int] NOT NULL,
	[TrongSo] [float] NOT NULL,
	[Chon] [bit] NOT NULL,
 CONSTRAINT [PK_TieuChiTheoBieuMau] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VaiTro]    Script Date: 6/17/2015 3:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VaiTro](
	[MaVT] [int] IDENTITY(1,1) NOT NULL,
	[TenVT] [nvarchar](200) NOT NULL,
	[TenVTEN] [varchar](200) NULL,
	[MoTa] [nvarchar](max) NULL,
	[MaDV] [int] NULL,
 CONSTRAINT [PK_VaiTro] PRIMARY KEY CLUSTERED 
(
	[MaVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ViTriCongViec]    Script Date: 6/17/2015 3:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ViTriCongViec](
	[MaVTCV] [int] IDENTITY(1,1) NOT NULL,
	[MaBP] [int] NOT NULL,
	[TenVTCV] [nvarchar](1000) NULL,
	[TenVTCVEN] [varchar](1000) NULL,
	[TrangThai] [bit] NULL,
	[MoTa] [nvarchar](max) NULL,
	[MoTaEN] [varchar](max) NULL,
 CONSTRAINT [PK_ViTriCongViec] PRIMARY KEY CLUSTERED 
(
	[MaVTCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AdminDV] ([MaDV], [TenDN], [HoTen], [GioiTinh], [NgaySinh], [MatKhauMD], [Hinh], [Email], [DienThoai], [TrangThai], [MaVTCV]) VALUES (1, N'GiaDinh', N'Admin Gia Dinh', 1, NULL, N'', NULL, N'admingd@gmail.com', N'23345', 1, NULL)
SET IDENTITY_INSERT [dbo].[BieuMauDanhGia] ON 

INSERT [dbo].[BieuMauDanhGia] ([MaBM], [MaVTCV], [TenBM], [TenBMEN], [Chon], [NgayTao], [MoTa], [MoTaEN], [MaDV], [MaCK]) VALUES (1, 1, N'biểu mẫu mới', N'', 1, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[BieuMauDanhGia] ([MaBM], [MaVTCV], [TenBM], [TenBMEN], [Chon], [NgayTao], [MoTa], [MoTaEN], [MaDV], [MaCK]) VALUES (2, 1, N'sssss', N'', 0, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[BieuMauDanhGia] ([MaBM], [MaVTCV], [TenBM], [TenBMEN], [Chon], [NgayTao], [MoTa], [MoTaEN], [MaDV], [MaCK]) VALUES (3, 1, N'dfsaf', N'', 0, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[BieuMauDanhGia] ([MaBM], [MaVTCV], [TenBM], [TenBMEN], [Chon], [NgayTao], [MoTa], [MoTaEN], [MaDV], [MaCK]) VALUES (4, 3, N'dfsafddd', N'', 0, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[BieuMauDanhGia] ([MaBM], [MaVTCV], [TenBM], [TenBMEN], [Chon], [NgayTao], [MoTa], [MoTaEN], [MaDV], [MaCK]) VALUES (5, 3, N'dfsafddd dsf', N'', 0, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[BieuMauDanhGia] ([MaBM], [MaVTCV], [TenBM], [TenBMEN], [Chon], [NgayTao], [MoTa], [MoTaEN], [MaDV], [MaCK]) VALUES (6, 3, N'ds safsfas asf', N'', 0, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[BieuMauDanhGia] ([MaBM], [MaVTCV], [TenBM], [TenBMEN], [Chon], [NgayTao], [MoTa], [MoTaEN], [MaDV], [MaCK]) VALUES (7, 1, N'biểu mẫu mới lu o day ah?', N'', 0, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[BieuMauDanhGia] ([MaBM], [MaVTCV], [TenBM], [TenBMEN], [Chon], [NgayTao], [MoTa], [MoTaEN], [MaDV], [MaCK]) VALUES (8, 1, N'biểu mẫu mới', N'', 0, NULL, NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[BieuMauDanhGia] OFF
SET IDENTITY_INSERT [dbo].[BoPhan] ON 

INSERT [dbo].[BoPhan] ([MaBP], [TenBP], [MaDV], [TenBPEN], [MoTa], [TrangThai]) VALUES (1, N'Sản', 1, N'Khoa san', N'khong mo ta gi', 1)
INSERT [dbo].[BoPhan] ([MaBP], [TenBP], [MaDV], [TenBPEN], [MoTa], [TrangThai]) VALUES (4, N'test', 1, N'abc', N'test', 1)
INSERT [dbo].[BoPhan] ([MaBP], [TenBP], [MaDV], [TenBPEN], [MoTa], [TrangThai]) VALUES (8, N'khoa san', 3, N'khoa san', N'khoa san', 1)
INSERT [dbo].[BoPhan] ([MaBP], [TenBP], [MaDV], [TenBPEN], [MoTa], [TrangThai]) VALUES (9, N'asdfasdf', 6, N'asdfasf', N'asdfasdf', 1)
INSERT [dbo].[BoPhan] ([MaBP], [TenBP], [MaDV], [TenBPEN], [MoTa], [TrangThai]) VALUES (10, N'Cap cuu', 2, N'Emmergency', N'', 1)
INSERT [dbo].[BoPhan] ([MaBP], [TenBP], [MaDV], [TenBPEN], [MoTa], [TrangThai]) VALUES (1010, N'Ban giám đóc', 7, N'Ban giam doc', N'', 1)
INSERT [dbo].[BoPhan] ([MaBP], [TenBP], [MaDV], [TenBPEN], [MoTa], [TrangThai]) VALUES (1011, N'bo phan ngoi choi xoi nuoc', 7, N'bo phan ngoi choi xoi nuoc', N'', 1)
SET IDENTITY_INSERT [dbo].[BoPhan] OFF
SET IDENTITY_INSERT [dbo].[CapDoTheoTieuChi] ON 

INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (1, 1, 1, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (2, 5, 2, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (3, 1, 4, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (4, 1, 5, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (5, 1, 7, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (6, 1, 9, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (7, 1, 10, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (8, 1, 11, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (9, 1, 12, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (10, 1, 14, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (11, 1, 15, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (12, 1, 16, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (13, 1, 17, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (14, 1, 18, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (15, 1, 19, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (16, 1, 20, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (17, 1, 21, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (18, 1, 22, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (19, 1, 23, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (20, 1, 24, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (21, 1, 25, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (22, 1, 26, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (23, 1, 27, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (24, 1, 28, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (25, 1, 29, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (26, 1, 30, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (27, 1, 31, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (28, 1, 33, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (29, 1, 34, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (30, 1, 35, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (31, 1, 36, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (32, 1, 37, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (33, 1, 39, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (34, 1, 40, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (35, 1, 41, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (36, 1, 42, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (37, 1, 43, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (38, 1, 44, 0.25, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (39, 2, 1, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (40, 6, 2, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (41, 2, 4, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (42, 2, 5, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (43, 2, 7, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (44, 2, 9, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (45, 2, 10, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (46, 2, 11, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (47, 2, 12, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (48, 2, 14, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (49, 2, 15, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (50, 2, 16, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (51, 2, 17, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (52, 2, 18, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (53, 2, 19, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (54, 2, 20, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (55, 2, 21, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (56, 2, 22, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (57, 2, 23, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (58, 2, 24, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (59, 2, 25, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (60, 2, 26, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (61, 2, 27, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (62, 2, 28, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (63, 2, 29, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (64, 2, 30, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (65, 2, 31, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (66, 2, 33, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (67, 2, 34, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (68, 2, 35, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (69, 2, 36, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (70, 2, 37, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (71, 2, 39, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (72, 2, 40, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (73, 2, 41, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (74, 2, 42, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (75, 2, 43, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (76, 2, 44, 0.5, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (77, 3, 1, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (78, 7, 2, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (79, 3, 4, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (80, 3, 5, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (81, 3, 7, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (82, 3, 9, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (83, 3, 10, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (84, 3, 11, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (85, 3, 12, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (86, 3, 14, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (87, 3, 15, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (88, 3, 16, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (89, 3, 17, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (90, 3, 18, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (91, 3, 19, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (92, 3, 20, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (93, 3, 21, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (94, 3, 22, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (95, 3, 23, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (96, 3, 24, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (97, 3, 25, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (98, 3, 26, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (99, 3, 27, 0.75, 1)
GO
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (100, 3, 28, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (101, 3, 29, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (102, 3, 30, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (103, 3, 31, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (104, 3, 33, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (105, 3, 34, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (106, 3, 35, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (107, 3, 36, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (108, 3, 37, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (109, 3, 39, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (110, 3, 40, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (111, 3, 41, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (112, 3, 42, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (113, 3, 43, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (114, 3, 44, 0.75, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (115, 4, 1, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (116, 8, 2, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (117, 4, 4, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (118, 4, 5, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (119, 4, 7, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (120, 4, 9, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (121, 4, 10, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (122, 4, 11, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (123, 4, 12, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (124, 4, 14, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (125, 4, 15, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (126, 4, 16, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (127, 4, 17, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (128, 4, 18, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (129, 4, 19, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (130, 4, 20, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (131, 4, 21, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (132, 4, 22, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (133, 4, 23, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (134, 4, 24, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (135, 4, 25, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (136, 4, 26, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (137, 4, 27, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (138, 4, 28, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (139, 4, 29, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (140, 4, 30, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (141, 4, 31, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (142, 4, 33, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (143, 4, 34, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (144, 4, 35, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (145, 4, 36, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (146, 4, 37, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (147, 4, 39, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (148, 4, 40, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (149, 4, 41, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (150, 4, 42, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (151, 4, 43, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (152, 4, 44, 1, 1)
SET IDENTITY_INSERT [dbo].[CapDoTheoTieuChi] OFF
SET IDENTITY_INSERT [dbo].[CapDoTieuChi] ON 

INSERT [dbo].[CapDoTieuChi] ([MaCD], [Ten], [TenEN], [GiaTri], [DonViTinh], [MoTa], [MaDV], [Chon]) VALUES (1, N'muc 0', N'level 0', 0.25, NULL, NULL, 1, 1)
INSERT [dbo].[CapDoTieuChi] ([MaCD], [Ten], [TenEN], [GiaTri], [DonViTinh], [MoTa], [MaDV], [Chon]) VALUES (2, N'muc 1', N'level 1', 0.5, NULL, NULL, 1, 1)
INSERT [dbo].[CapDoTieuChi] ([MaCD], [Ten], [TenEN], [GiaTri], [DonViTinh], [MoTa], [MaDV], [Chon]) VALUES (3, N'muc 2', N'level 3', 0.75, NULL, NULL, 1, 1)
INSERT [dbo].[CapDoTieuChi] ([MaCD], [Ten], [TenEN], [GiaTri], [DonViTinh], [MoTa], [MaDV], [Chon]) VALUES (4, N'muc 3', N'level 3', 1, NULL, NULL, 1, 1)
INSERT [dbo].[CapDoTieuChi] ([MaCD], [Ten], [TenEN], [GiaTri], [DonViTinh], [MoTa], [MaDV], [Chon]) VALUES (5, N'Duoi 5 nam', N'Duoi 5 nam', 0.25, NULL, NULL, 1, 1)
INSERT [dbo].[CapDoTieuChi] ([MaCD], [Ten], [TenEN], [GiaTri], [DonViTinh], [MoTa], [MaDV], [Chon]) VALUES (6, N'Tu 5 den 10 nam', N'Tu 5 den 10 nam', 0.5, NULL, NULL, 1, 1)
INSERT [dbo].[CapDoTieuChi] ([MaCD], [Ten], [TenEN], [GiaTri], [DonViTinh], [MoTa], [MaDV], [Chon]) VALUES (7, N'Tu 10 den 20 nam', N'Tu 10 den 20 nam', 0.75, NULL, NULL, 1, 1)
INSERT [dbo].[CapDoTieuChi] ([MaCD], [Ten], [TenEN], [GiaTri], [DonViTinh], [MoTa], [MaDV], [Chon]) VALUES (8, N'Tren 20 nam', N'Tren 20 nam', 1, NULL, NULL, 1, 1)
INSERT [dbo].[CapDoTieuChi] ([MaCD], [Ten], [TenEN], [GiaTri], [DonViTinh], [MoTa], [MaDV], [Chon]) VALUES (10, N'Kem', N'Kem', 0.333333333, NULL, NULL, 1, 1)
INSERT [dbo].[CapDoTieuChi] ([MaCD], [Ten], [TenEN], [GiaTri], [DonViTinh], [MoTa], [MaDV], [Chon]) VALUES (11, N'Trung binh', N'Trung binh', 0.666666666, NULL, NULL, 1, 1)
INSERT [dbo].[CapDoTieuChi] ([MaCD], [Ten], [TenEN], [GiaTri], [DonViTinh], [MoTa], [MaDV], [Chon]) VALUES (12, N'Kha', N'Kha', 1, NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[CapDoTieuChi] OFF
SET IDENTITY_INSERT [dbo].[ChuKyDanhGia] ON 

INSERT [dbo].[ChuKyDanhGia] ([MaCK], [TenCK], [TenCKEN], [BatDau], [KetThuc], [TrangThai], [MoTa], [MoTaEN], [MaDV]) VALUES (1, N'Chu ky danh gia mua xuan', N'Chu ky danh gia mua xuan English', CAST(0x0000A56300000000 AS DateTime), CAST(0x0000A56500000000 AS DateTime), 1, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[ChuKyDanhGia] OFF
SET IDENTITY_INSERT [dbo].[ChuyenMon] ON 

INSERT [dbo].[ChuyenMon] ([MaCM], [TenCM], [TenCMEN], [MoTa], [MaDV]) VALUES (1, N'Đại học', N'University', N'Đại học', 1)
INSERT [dbo].[ChuyenMon] ([MaCM], [TenCM], [TenCMEN], [MoTa], [MaDV]) VALUES (2, N'Thạc sỹ', N'Master    ', N'Thạc sỹ', 1)
INSERT [dbo].[ChuyenMon] ([MaCM], [TenCM], [TenCMEN], [MoTa], [MaDV]) VALUES (3, N'Tiến sỹ', N'PhD       ', N'Tiến sỹ', 1)
INSERT [dbo].[ChuyenMon] ([MaCM], [TenCM], [TenCMEN], [MoTa], [MaDV]) VALUES (4, N'Giáo sư', N'Prof      ', N'Giáo sư', 1)
SET IDENTITY_INSERT [dbo].[ChuyenMon] OFF
INSERT [dbo].[DanhMucHienThi] ([Ma], [TenVN], [TenEN], [MoTa], [TenGoi], [CallName], [ThuTuHienThi], [ViewOrder]) VALUES (N'BoPhan', N'Bộ phận', N'Department', N'Hồ sơ nhân viên', N'Bộ phận', NULL, NULL, NULL)
INSERT [dbo].[DanhMucHienThi] ([Ma], [TenVN], [TenEN], [MoTa], [TenGoi], [CallName], [ThuTuHienThi], [ViewOrder]) VALUES (N'Chao', N'Xin chào', N'Hi', N'Sử dụng ở Common master', N'Câu chào ở Tragn chủ', NULL, NULL, NULL)
INSERT [dbo].[DanhMucHienThi] ([Ma], [TenVN], [TenEN], [MoTa], [TenGoi], [CallName], [ThuTuHienThi], [ViewOrder]) VALUES (N'ChaoMung', N'Chào mừng 123', N'Welcome', N'Trang chủ', N'Câu chào mừng ở Trang chủ', NULL, NULL, NULL)
INSERT [dbo].[DanhMucHienThi] ([Ma], [TenVN], [TenEN], [MoTa], [TenGoi], [CallName], [ThuTuHienThi], [ViewOrder]) VALUES (N'ChuyenMon', N'Chuyên môn', N'Diploma', N'Hồ sơ nhân viên', N'Chuyên môn', NULL, NULL, NULL)
INSERT [dbo].[DanhMucHienThi] ([Ma], [TenVN], [TenEN], [MoTa], [TenGoi], [CallName], [ThuTuHienThi], [ViewOrder]) VALUES (N'DanhMuc', N'Danh mục', N'Categories', N'Sử dụng ở menu', N'Danh mục', NULL, NULL, NULL)
INSERT [dbo].[DanhMucHienThi] ([Ma], [TenVN], [TenEN], [MoTa], [TenGoi], [CallName], [ThuTuHienThi], [ViewOrder]) VALUES (N'DiaChi', N'Địa chỉ', N'Address', N'Hồ sơ nhân viên', N'Địa chỉ', NULL, NULL, NULL)
INSERT [dbo].[DanhMucHienThi] ([Ma], [TenVN], [TenEN], [MoTa], [TenGoi], [CallName], [ThuTuHienThi], [ViewOrder]) VALUES (N'HoTen', N'Họ tên', N'Full name', N'Hồ sơ nhân viên', N'Họ tên', NULL, NULL, NULL)
INSERT [dbo].[DanhMucHienThi] ([Ma], [TenVN], [TenEN], [MoTa], [TenGoi], [CallName], [ThuTuHienThi], [ViewOrder]) VALUES (N'MnDanhGia', N'Đánh giá', N'Vote', N'Menu đánh giá', N'Đánh giá', NULL, 2, 2)
INSERT [dbo].[DanhMucHienThi] ([Ma], [TenVN], [TenEN], [MoTa], [TenGoi], [CallName], [ThuTuHienThi], [ViewOrder]) VALUES (N'MnTrangChu', N'Trang chủ', N'Home', N'Menu trang chủ', N'Trang chủ', NULL, 1, 1)
INSERT [dbo].[DanhMucHienThi] ([Ma], [TenVN], [TenEN], [MoTa], [TenGoi], [CallName], [ThuTuHienThi], [ViewOrder]) VALUES (N'NgayHD', N'Ngày hợp đồng', N'Apply date', N'Hồ sơ nhân viên', N'Ngày hợp đồng', NULL, NULL, NULL)
INSERT [dbo].[DanhMucHienThi] ([Ma], [TenVN], [TenEN], [MoTa], [TenGoi], [CallName], [ThuTuHienThi], [ViewOrder]) VALUES (N'NgaySinh', N'Ngày sinh', N'Birthdate', N'Hồ sơ nhân viên', N'Ngày sinh', NULL, NULL, NULL)
INSERT [dbo].[DanhMucHienThi] ([Ma], [TenVN], [TenEN], [MoTa], [TenGoi], [CallName], [ThuTuHienThi], [ViewOrder]) VALUES (N'TaiKhoan', N'Tài khoản', N'Account', N'Sử dụng ở Common master', N'Tài khoản', NULL, NULL, NULL)
INSERT [dbo].[DanhMucHienThi] ([Ma], [TenVN], [TenEN], [MoTa], [TenGoi], [CallName], [ThuTuHienThi], [ViewOrder]) VALUES (N'Thoat', N'Thoát', N'Exit', N'Sử dụng ở Common master', N'Thoát', NULL, NULL, NULL)
INSERT [dbo].[DanhMucHienThi] ([Ma], [TenVN], [TenEN], [MoTa], [TenGoi], [CallName], [ThuTuHienThi], [ViewOrder]) VALUES (N'ThongTin', N'Thông tin cá nhân', N'Persioal Information', N'Hồ sơ nhân viên', N'Thông tin', NULL, NULL, NULL)
INSERT [dbo].[DanhMucHienThi] ([Ma], [TenVN], [TenEN], [MoTa], [TenGoi], [CallName], [ThuTuHienThi], [ViewOrder]) VALUES (N'TieuDeTrang', N'Bệnh viện hạnh phúc', N'Hanh phuc hospital', N'Bệnh viện hạnh phúc', N'Tiêu đề trang', NULL, NULL, NULL)
INSERT [dbo].[DanhMucQuanTri] ([MaDM], [TenDM], [TenDMEN], [MoTa]) VALUES (N'QLBoPhan.aspx', N'Quản lý bộ phận', N'Department managerment', NULL)
INSERT [dbo].[DanhMucQuanTri] ([MaDM], [TenDM], [TenDMEN], [MoTa]) VALUES (N'QLChuyenMon.aspx', N'Quản lý chuyên môn', N'Degree management', NULL)
INSERT [dbo].[DanhMucQuanTri] ([MaDM], [TenDM], [TenDMEN], [MoTa]) VALUES (N'QLDanhMucQuanTri.aspx', N'Quản lý danh mục quản trị', N'Admin categories', NULL)
INSERT [dbo].[DanhMucQuanTri] ([MaDM], [TenDM], [TenDMEN], [MoTa]) VALUES (N'QLDiem.aspx', N'Quản lý thang điểm', N'Score management', NULL)
INSERT [dbo].[DanhMucQuanTri] ([MaDM], [TenDM], [TenDMEN], [MoTa]) VALUES (N'QLDonVi.aspx', N'Quản lý đơn vị', N'Company management', NULL)
INSERT [dbo].[DanhMucQuanTri] ([MaDM], [TenDM], [TenDMEN], [MoTa]) VALUES (N'QLNgoaiNgu.aspx', N'Quản lý ngoại ngữ', N'Languages management', NULL)
INSERT [dbo].[DanhMucQuanTri] ([MaDM], [TenDM], [TenDMEN], [MoTa]) VALUES (N'QLNhanVien.aspx', N'Quản lý nhân viên', N'Employee management', NULL)
INSERT [dbo].[DanhMucQuanTri] ([MaDM], [TenDM], [TenDMEN], [MoTa]) VALUES (N'QLNhomTieuChi.aspx', N'Quản lý nhóm tiêu chí', N'Criteria management', NULL)
INSERT [dbo].[DanhMucQuanTri] ([MaDM], [TenDM], [TenDMEN], [MoTa]) VALUES (N'QLVaiTro.aspx', N'Quản lý vai trò', N'Role management', NULL)
SET IDENTITY_INSERT [dbo].[DonVi] ON 

INSERT [dbo].[DonVi] ([MaDV], [TenDV], [TenDVEN], [DiaChi], [DienThoai], [Fax], [Email], [Logo], [TrangThai], [TongSoTK], [Website], [MaNVAdmin]) VALUES (1, N'Bệnh viện Gia Định', N'', N'benh vien gia dinh tp hcm', N'123456789', N'123456789', N'abc@gmail.com', N'1.jpg', 1, 30, N'giadinh.com.vn', NULL)
INSERT [dbo].[DonVi] ([MaDV], [TenDV], [TenDVEN], [DiaChi], [DienThoai], [Fax], [Email], [Logo], [TrangThai], [TongSoTK], [Website], [MaNVAdmin]) VALUES (2, N'Bệnh viện 105', N'', N'Tan Chanh Hiep', N'123456789', N'234567', N'abc@gmail.com', N'2.jpg', 1, 6, N'giomoico.com', NULL)
INSERT [dbo].[DonVi] ([MaDV], [TenDV], [TenDVEN], [DiaChi], [DienThoai], [Fax], [Email], [Logo], [TrangThai], [TongSoTK], [Website], [MaNVAdmin]) VALUES (3, N'Bệnh viện Từ Dũ', NULL, N'Q.6', N'123456789', N'1234567', N'abc@gmail.com', NULL, 1, 12, NULL, NULL)
INSERT [dbo].[DonVi] ([MaDV], [TenDV], [TenDVEN], [DiaChi], [DienThoai], [Fax], [Email], [Logo], [TrangThai], [TongSoTK], [Website], [MaNVAdmin]) VALUES (4, N'Benh vien quan doi 108', N'', N'So 3, D2, Van Thanh Bac, Binh Thanh', N'2345', N'123456789', N'abc@gmail.com', N'', 1, 34, N'', NULL)
INSERT [dbo].[DonVi] ([MaDV], [TenDV], [TenDVEN], [DiaChi], [DienThoai], [Fax], [Email], [Logo], [TrangThai], [TongSoTK], [Website], [MaNVAdmin]) VALUES (6, N'a', N'a', N'a', N'a', N'a', N'a', NULL, 1, 20, NULL, NULL)
INSERT [dbo].[DonVi] ([MaDV], [TenDV], [TenDVEN], [DiaChi], [DienThoai], [Fax], [Email], [Logo], [TrangThai], [TongSoTK], [Website], [MaNVAdmin]) VALUES (7, N'ilen', N'ilen', N'khong biet', N'1234', N'1234', N'ilen@gmail.com', NULL, 1, 15, NULL, NULL)
INSERT [dbo].[DonVi] ([MaDV], [TenDV], [TenDVEN], [DiaChi], [DienThoai], [Fax], [Email], [Logo], [TrangThai], [TongSoTK], [Website], [MaNVAdmin]) VALUES (8, N'test', N'', N'test', N'test', N'test', N'test', N'', 1, NULL, N'test', NULL)
INSERT [dbo].[DonVi] ([MaDV], [TenDV], [TenDVEN], [DiaChi], [DienThoai], [Fax], [Email], [Logo], [TrangThai], [TongSoTK], [Website], [MaNVAdmin]) VALUES (9, N'co hinh', N'', N'co hinh', N'co hinh', N'co hinh', N'co hinh', N'', 1, NULL, N'co hinh', NULL)
INSERT [dbo].[DonVi] ([MaDV], [TenDV], [TenDVEN], [DiaChi], [DienThoai], [Fax], [Email], [Logo], [TrangThai], [TongSoTK], [Website], [MaNVAdmin]) VALUES (10, N'Benh vien abc', N'', N'ha noi', N'12345', N'12323454', N'abc@gmail.com', N'', 1, NULL, N'abc.com.vn', NULL)
INSERT [dbo].[DonVi] ([MaDV], [TenDV], [TenDVEN], [DiaChi], [DienThoai], [Fax], [Email], [Logo], [TrangThai], [TongSoTK], [Website], [MaNVAdmin]) VALUES (11, N'asdf', N'', N'asdf', N'a', N'asdf', N'asdf', N'11.png', 1, NULL, N'asdf', NULL)
INSERT [dbo].[DonVi] ([MaDV], [TenDV], [TenDVEN], [DiaChi], [DienThoai], [Fax], [Email], [Logo], [TrangThai], [TongSoTK], [Website], [MaNVAdmin]) VALUES (12, N'hoa', N'', N'q.12', N'23454356456', N'355462412345', N'hoa@gmail.com', N'12.jpg', 1, NULL, N'hoa.com.vn', NULL)
SET IDENTITY_INSERT [dbo].[DonVi] OFF
SET IDENTITY_INSERT [dbo].[NgoaiNgu] ON 

INSERT [dbo].[NgoaiNgu] ([MaNN], [TenNN], [TenNNEN], [MoTa]) VALUES (1, N'Tiếng Anh', N'English', N'nothing')
INSERT [dbo].[NgoaiNgu] ([MaNN], [TenNN], [TenNNEN], [MoTa]) VALUES (2, N'Tiếng Nga', N'Russia', NULL)
INSERT [dbo].[NgoaiNgu] ([MaNN], [TenNN], [TenNNEN], [MoTa]) VALUES (3, N'Tiếng Pháp', N'French', NULL)
INSERT [dbo].[NgoaiNgu] ([MaNN], [TenNN], [TenNNEN], [MoTa]) VALUES (4, N'Tiếng Đức', N'Germany', N'')
SET IDENTITY_INSERT [dbo].[NgoaiNgu] OFF
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [NgaySinh], [DienThoai], [Email], [Diachi], [NgayHD], [MaCM], [MaVTCV], [MatKhau], [MaVT], [Hinh], [STT], [TrangThai]) VALUES (N'NV00002', N'Le Cong Hoa', 0, CAST(0x00006FDA00000000 AS DateTime), N'090909090', N'hoa@gmail.com', N'q.12', CAST(0x0000A4A600000000 AS DateTime), 2, 3, N'123', 2, N'NV00002.jpg', 4, 1)
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [NgaySinh], [DienThoai], [Email], [Diachi], [NgayHD], [MaCM], [MaVTCV], [MatKhau], [MaVT], [Hinh], [STT], [TrangThai]) VALUES (N'NV00005', N'Vu Dinh Long', 1, CAST(0x00006E4400000000 AS DateTime), N'090909090', N'long@hcmutrans.edu.vn', N'', CAST(0x0000A49500000000 AS DateTime), 4, 3, N'123', 1, N'NV00005.jpg', 5, 1)
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [NgaySinh], [DienThoai], [Email], [Diachi], [NgayHD], [MaCM], [MaVTCV], [MatKhau], [MaVT], [Hinh], [STT], [TrangThai]) VALUES (N'NV00006', N'Vu Dinh Long', 1, CAST(0x00006FB100000000 AS DateTime), N'090909090', N'long@hcmutrans.edu.vn', N'', CAST(0x0000A49500000000 AS DateTime), 2, 3, N'123', 2, N'NV00006.jpg', 6, 1)
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [NgaySinh], [DienThoai], [Email], [Diachi], [NgayHD], [MaCM], [MaVTCV], [MatKhau], [MaVT], [Hinh], [STT], [TrangThai]) VALUES (N'NV00007', N'Tran Van Truc Cap Cuu', 1, CAST(0x0000A48600000000 AS DateTime), N'123', N'abc@gmail.com', N'asdfasdf', CAST(0x0000A4A800000000 AS DateTime), 1, 2, N'123', 4, N'NV00007.jpg', 7, 1)
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [NgaySinh], [DienThoai], [Email], [Diachi], [NgayHD], [MaCM], [MaVTCV], [MatKhau], [MaVT], [Hinh], [STT], [TrangThai]) VALUES (N'NV00008', N'Test', 1, CAST(0x0000A4C000000000 AS DateTime), N'13452345', N'23452345', N'asdfasdfasdf', CAST(0x0000A4D100000000 AS DateTime), 1, 1, N'123', 4, N'NV00008.jpg', 1002, 1)
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [NgaySinh], [DienThoai], [Email], [Diachi], [NgayHD], [MaCM], [MaVTCV], [MatKhau], [MaVT], [Hinh], [STT], [TrangThai]) VALUES (N'NV01003', N'Trần Ích Tắc', 1, CAST(0x0000826600000000 AS DateTime), N'2121212121', N'hoa@gmail.com', N'q.12', CAST(0x0000A4A600000000 AS DateTime), 1, 3, N'123', 3, N'NV01003.jpg', 1005, 1)
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [NgaySinh], [DienThoai], [Email], [Diachi], [NgayHD], [MaCM], [MaVTCV], [MatKhau], [MaVT], [Hinh], [STT], [TrangThai]) VALUES (N'NV01006', N'Le Hoa Hau', 0, CAST(0x0000A4A400000000 AS DateTime), N'090909090', N'hoa@gmail.com', N'q.12', CAST(0x0000A4A600000000 AS DateTime), 1, 2, N'123', 2, N'NV01006.jpg', 1007, 1)
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [NgaySinh], [DienThoai], [Email], [Diachi], [NgayHD], [MaCM], [MaVTCV], [MatKhau], [MaVT], [Hinh], [STT], [TrangThai]) VALUES (N'NV01008', N'Tran Van Test', 0, CAST(0x00007F4100000000 AS DateTime), N'090909090', N'hoa@gmail.com', N'', CAST(0x00008FE700000000 AS DateTime), 1, 1, N'123', 3, N'NV01008.jpg', 1008, 1)
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [NgaySinh], [DienThoai], [Email], [Diachi], [NgayHD], [MaCM], [MaVTCV], [MatKhau], [MaVT], [Hinh], [STT], [TrangThai]) VALUES (N'nv1', N'Nguyễn Văn A', 1, CAST(0x000081D500000000 AS DateTime), N'0909090909', N'a@gmail.com', N'tp hcm', CAST(0x00008F2A00000000 AS DateTime), 1, 1, N'123', 1, N'nv1.png', 1, 1)
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
SET IDENTITY_INSERT [dbo].[NhomTieuChi] ON 

INSERT [dbo].[NhomTieuChi] ([MaNTC], [MaDV], [TenNTC], [TenNTCEN], [TrongSo], [MoTa], [Chon]) VALUES (1, 1, N'KIẾN THỨC', N'khong biet', 30, N'30%', 1)
INSERT [dbo].[NhomTieuChi] ([MaNTC], [MaDV], [TenNTC], [TenNTCEN], [TrongSo], [MoTa], [Chon]) VALUES (2, 1, N'KỸ NĂNG VÀ KINH NGHIỆM CHUYÊN MÔN TRỰC - CẤP CỨU', N'khong biet', 30, N'30%', 1)
INSERT [dbo].[NhomTieuChi] ([MaNTC], [MaDV], [TenNTC], [TenNTCEN], [TrongSo], [MoTa], [Chon]) VALUES (3, 1, N'THÁI ĐỘ THỰC HIỆN CÔNG VIỆC', N'khong biet', 20, N'20%', 1)
INSERT [dbo].[NhomTieuChi] ([MaNTC], [MaDV], [TenNTC], [TenNTCEN], [TrongSo], [MoTa], [Chon]) VALUES (4, 1, N'KẾT QUẢ HOẠT ĐỘNG CHUYÊN MÔN', N'khong biet', 20, N'20%', 1)
INSERT [dbo].[NhomTieuChi] ([MaNTC], [MaDV], [TenNTC], [TenNTCEN], [TrongSo], [MoTa], [Chon]) VALUES (5, 1, N'test nhom tieu cho', NULL, 20, N'teste', 1)
SET IDENTITY_INSERT [dbo].[NhomTieuChi] OFF
INSERT [dbo].[SuperAdmin] ([TenDN], [MatKhau], [Hinh], [Email], [DienThoai], [HoTen]) VALUES (N'sa', N'202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, N'tran van ilen')
SET IDENTITY_INSERT [dbo].[TieuChi] ON 

INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (1, 1, NULL, N'TRÌNH ĐỘ CHUYÊN MÔN', NULL, 50, N'50% trong 30%', NULL, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (2, 1, NULL, N'THÂM NIÊN CÔNG TÁC', NULL, 20, N'40% trong 30%', NULL, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (3, 1, NULL, N'NGOẠI NGỮ', NULL, 10, N'10% trong 30%', NULL, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (4, 1, NULL, N'Nghe', NULL, 40, N'40% trong 10%', 3, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (5, 1, NULL, N'Nói', NULL, 40, N'40% trong 10%', 3, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (7, 1, NULL, N'Viết', NULL, 20, N'20% trong 10%', 3, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (8, 2, NULL, N'Kỹ năng thao tác chuyên môn (cứng)', NULL, 50, N'50% trong 30%', NULL, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (9, 2, NULL, N'Phẫu thuật chửa ngoài tử cung vỡ', NULL, 6, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (10, 2, NULL, N'Phẫu thuật chửa ngoài tử cung vỡ có choáng', NULL, 6, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (11, 2, NULL, N'Đỡ đẻ ngược', NULL, 6, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (12, 2, NULL, N'Đỡ đẻ sinh đôi', NULL, 6, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (14, 2, NULL, N'Đỡ đẻ chỉ huy', NULL, 6, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (15, 2, NULL, N'Đỡ đẻ thường ngôi chỏm', NULL, 6, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (16, 2, NULL, N'Phẫu thuật lấy thai lần đầu', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (17, 2, NULL, N'Mổ lấy thai lần hai hay lần thứ ba có dính', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (18, 2, NULL, N'Phẫu thuật chửa ngoài tử cung lấy máu tụ thành nang', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (19, 2, NULL, N'Forceps', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (20, 2, NULL, N'Giác hút', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (21, 2, NULL, N'Nạo sót thai, nạo sót rau sau sẩy, sau để', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (22, 2, NULL, N'Chọc hút dịch do máu tụ sau mổ', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (23, 2, NULL, N'Bóc nhau nhân tạo', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (24, 2, NULL, N'Nghiệm pháp lọt ngôi chỏm', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (25, 2, NULL, N'Hồi sức sơ sinh ngạt', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (26, 2, NULL, N'Bóp bóng Ambu, thổi ngạt sơ sinh', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (27, 2, NULL, N'Nghiệm pháp bong rau, đỡ rau, kiểm tra bánh rau', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (28, 2, NULL, N'Kiểm soát tử cung', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (29, 2, NULL, N'Sử dụng thành thạo một số thiết bị y tế trong cấp cứu tại phòng sanh, phòng mổ và các khoa phòng liên quan', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (30, 2, NULL, N'Sử dụng thành thạo một số thiết bị y tế trong chẩn đoán và điều trị', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (31, 2, NULL, N'Cấp cứu tim phổi cơ bản và nâng cao', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (32, 2, NULL, N'Kỹ năng xửa lý tình huống y khoa (mềm)', NULL, 50, NULL, NULL, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (33, 2, NULL, N'Giải thích khéo léo và có hiệu quả với người bệnh và gia đình người bệnh về tình trạng bệnh và hướng điều trị của bệnh nhân', NULL, 20, NULL, 32, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (34, 2, NULL, N'Giao tiếp hòa nhã, thân thiện với đồng nghiệp, bệnh nhân và gia đình bệnh nhân', NULL, 40, NULL, 32, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (35, 2, NULL, N'Phối hợp công việc tốt với đồng nghiệp và sẵn lòng hỗ trợ đồng nghiệp khi cần thiết', NULL, 40, NULL, 32, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (36, 3, NULL, N'Tận tụy với người bệnh: Khám bệnh kỹ lưỡng, tư vấn chu đáo và giải thích cặn kẽ', NULL, 20, NULL, NULL, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (37, 3, NULL, N'Tôn trọng, cảm thông, chia sẻ và hết lòng với người bệnh và gia đình bệnh nhân', NULL, 10, NULL, NULL, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (39, 3, NULL, N'Tôn trọng và chân thành hợp tác với đồng nghiệp', NULL, 10, NULL, NULL, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (40, 3, NULL, N'Tôn trọng nội qui và qui chế Doanh nghiệp về giờ giấc trực giác, bàn giao ca trực, các qui định của khoa Sản, phòng sanh, phòng mổ,…', NULL, 20, NULL, NULL, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (41, 3, NULL, N'Tôn trọng nội qui chống nhiễm khuẩn bệnh viện', NULL, 10, NULL, NULL, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (42, 3, NULL, N'Tôn trọng nội qui đồng phục, trang phục công tác trong bệnh viện', NULL, 10, NULL, NULL, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (43, 3, NULL, N'Trung thực, khách quan, có tinh thần và ý thức học tập phát triển nghề nghiệp', NULL, 20, NULL, NULL, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (44, 4, NULL, N'Số lượng BN than phiền / sai sót chuyên môn', NULL, 100, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[TieuChi] OFF
SET IDENTITY_INSERT [dbo].[TieuChiTheoBieuMau] ON 

INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (1, 1, 1, 50, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (2, 1, 2, 20, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (3, 1, 3, 10, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (4, 1, 4, 40, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (5, 1, 5, 40, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (6, 1, 7, 20, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (7, 1, 8, 50, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (8, 1, 9, 6, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (9, 1, 10, 6, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (10, 1, 11, 6, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (11, 1, 12, 6, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (12, 1, 14, 6, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (13, 1, 15, 6, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (14, 1, 16, 4, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (15, 1, 17, 4, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (16, 1, 18, 4, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (17, 1, 19, 4, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (18, 1, 20, 4, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (19, 1, 21, 4, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (20, 1, 22, 4, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (21, 1, 23, 4, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (22, 1, 24, 4, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (23, 1, 25, 4, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (24, 1, 26, 4, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (25, 1, 27, 4, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (26, 1, 28, 4, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (27, 1, 29, 4, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (28, 1, 30, 4, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (29, 1, 31, 4, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (30, 1, 32, 50, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (31, 1, 33, 20, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (32, 1, 34, 40, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (33, 1, 35, 40, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (34, 1, 36, 20, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (35, 1, 37, 10, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (36, 1, 39, 10, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (37, 1, 40, 20, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (38, 1, 41, 10, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (39, 1, 42, 10, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (40, 1, 43, 20, 1)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (41, 1, 44, 100, 1)
SET IDENTITY_INSERT [dbo].[TieuChiTheoBieuMau] OFF
SET IDENTITY_INSERT [dbo].[VaiTro] ON 

INSERT [dbo].[VaiTro] ([MaVT], [TenVT], [TenVTEN], [MoTa], [MaDV]) VALUES (1, N'Quản trị ILEN', N'Super admin', N'Quản trị cao nhất', NULL)
INSERT [dbo].[VaiTro] ([MaVT], [TenVT], [TenVTEN], [MoTa], [MaDV]) VALUES (2, N'Quản trị', N'Admin     ', N'Quản trị', NULL)
INSERT [dbo].[VaiTro] ([MaVT], [TenVT], [TenVTEN], [MoTa], [MaDV]) VALUES (3, N'Quản lý', N'Supvisor', N'Quản lý', NULL)
INSERT [dbo].[VaiTro] ([MaVT], [TenVT], [TenVTEN], [MoTa], [MaDV]) VALUES (4, N'Nhân viên', N'Employee', N'Nhân viên', NULL)
SET IDENTITY_INSERT [dbo].[VaiTro] OFF
SET IDENTITY_INSERT [dbo].[ViTriCongViec] ON 

INSERT [dbo].[ViTriCongViec] ([MaVTCV], [MaBP], [TenVTCV], [TenVTCVEN], [TrangThai], [MoTa], [MoTaEN]) VALUES (1, 1, N'Bac si nhi khoa', N'bac si nhi khoa', 1, N'asdf', N'asdf')
INSERT [dbo].[ViTriCongViec] ([MaVTCV], [MaBP], [TenVTCV], [TenVTCVEN], [TrangThai], [MoTa], [MoTaEN]) VALUES (2, 10, N'Hanh chinh', N'hanh chinh EN', 1, NULL, NULL)
INSERT [dbo].[ViTriCongViec] ([MaVTCV], [MaBP], [TenVTCV], [TenVTCVEN], [TrangThai], [MoTa], [MoTaEN]) VALUES (3, 4, N'Khong lam gi', N'khong lam gi', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ViTriCongViec] OFF
ALTER TABLE [dbo].[AdminDV] ADD  CONSTRAINT [DF_AdminDV_TrangThai]  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[BieuMauDanhGia] ADD  CONSTRAINT [DF_BieuMauDanhGia_Chon]  DEFAULT ((1)) FOR [Chon]
GO
ALTER TABLE [dbo].[BoPhan] ADD  CONSTRAINT [DF_BoPhan_TrangThai]  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[CapDoTheoTieuChi] ADD  CONSTRAINT [DF_DiemTheoTieuChi_Chon]  DEFAULT ((1)) FOR [Chon]
GO
ALTER TABLE [dbo].[CapDoTieuChi] ADD  CONSTRAINT [DF_CapDoTieuChi_Chon]  DEFAULT ((1)) FOR [Chon]
GO
ALTER TABLE [dbo].[ChiTietDanhGia] ADD  CONSTRAINT [DF_ChiTietDanhGia_TongDiem]  DEFAULT ((0)) FOR [TongDiem]
GO
ALTER TABLE [dbo].[ChuKyDanhGia] ADD  CONSTRAINT [DF_ChuKyDanhGia_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[DonVi] ADD  CONSTRAINT [DF_DonVi_TongSoTK]  DEFAULT ((0)) FOR [TongSoTK]
GO
ALTER TABLE [dbo].[KetQuaDanhGia] ADD  CONSTRAINT [DF_KetQuaDanhGia_CoHieuLuc]  DEFAULT ((1)) FOR [CoHieuLuc]
GO
ALTER TABLE [dbo].[KetQuaDanhGia] ADD  CONSTRAINT [DF_KetQuaDanhGia_HienThi]  DEFAULT ((1)) FOR [HienThi]
GO
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [DF_NhanVien_TrangThai]  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[NhomTieuChi] ADD  CONSTRAINT [DF_NhomTieuChi_TrongSo]  DEFAULT ((0)) FOR [TrongSo]
GO
ALTER TABLE [dbo].[NhomTieuChi] ADD  CONSTRAINT [DF_NhomTieuChi_Chon]  DEFAULT ((1)) FOR [Chon]
GO
ALTER TABLE [dbo].[TieuChi] ADD  CONSTRAINT [DF_TieuChi_Chon]  DEFAULT ((1)) FOR [Chon]
GO
ALTER TABLE [dbo].[TieuChiTheoBieuMau] ADD  CONSTRAINT [DF_TieuChiTheoBieuMau_Chon]  DEFAULT ((1)) FOR [Chon]
GO
ALTER TABLE [dbo].[ViTriCongViec] ADD  CONSTRAINT [DF_ViTriCongViec_TrangThai]  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[AdminDV]  WITH CHECK ADD  CONSTRAINT [FK_AdminDV_Donvi] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DonVi] ([MaDV])
GO
ALTER TABLE [dbo].[AdminDV] CHECK CONSTRAINT [FK_AdminDV_Donvi]
GO
ALTER TABLE [dbo].[AdminDV]  WITH CHECK ADD  CONSTRAINT [FK_AdminDV_ViTriCongViec] FOREIGN KEY([MaVTCV])
REFERENCES [dbo].[ViTriCongViec] ([MaVTCV])
GO
ALTER TABLE [dbo].[AdminDV] CHECK CONSTRAINT [FK_AdminDV_ViTriCongViec]
GO
ALTER TABLE [dbo].[BieuMauDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_BieuMauDanhGia_ChuKyDanhGia] FOREIGN KEY([MaCK])
REFERENCES [dbo].[ChuKyDanhGia] ([MaCK])
GO
ALTER TABLE [dbo].[BieuMauDanhGia] CHECK CONSTRAINT [FK_BieuMauDanhGia_ChuKyDanhGia]
GO
ALTER TABLE [dbo].[BieuMauDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_BieuMauDanhGia_Donvi] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DonVi] ([MaDV])
GO
ALTER TABLE [dbo].[BieuMauDanhGia] CHECK CONSTRAINT [FK_BieuMauDanhGia_Donvi]
GO
ALTER TABLE [dbo].[BieuMauDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_BieuMauDanhGia_ViTriCongViec] FOREIGN KEY([MaVTCV])
REFERENCES [dbo].[ViTriCongViec] ([MaVTCV])
GO
ALTER TABLE [dbo].[BieuMauDanhGia] CHECK CONSTRAINT [FK_BieuMauDanhGia_ViTriCongViec]
GO
ALTER TABLE [dbo].[BoPhan]  WITH CHECK ADD  CONSTRAINT [FK_BoPhan_Donvi] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DonVi] ([MaDV])
GO
ALTER TABLE [dbo].[BoPhan] CHECK CONSTRAINT [FK_BoPhan_Donvi]
GO
ALTER TABLE [dbo].[CapDoTheoTieuChi]  WITH CHECK ADD  CONSTRAINT [FK_CapDoTheoTieuChi_CapDoTieuChi] FOREIGN KEY([MaCD])
REFERENCES [dbo].[CapDoTieuChi] ([MaCD])
GO
ALTER TABLE [dbo].[CapDoTheoTieuChi] CHECK CONSTRAINT [FK_CapDoTheoTieuChi_CapDoTieuChi]
GO
ALTER TABLE [dbo].[CapDoTheoTieuChi]  WITH CHECK ADD  CONSTRAINT [FK_DiemTheoTieuChi_TieuChi] FOREIGN KEY([MaTC])
REFERENCES [dbo].[TieuChi] ([MaTC])
GO
ALTER TABLE [dbo].[CapDoTheoTieuChi] CHECK CONSTRAINT [FK_DiemTheoTieuChi_TieuChi]
GO
ALTER TABLE [dbo].[CapDoTieuChi]  WITH CHECK ADD  CONSTRAINT [FK_CapDoTieuChi_DonVi] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DonVi] ([MaDV])
GO
ALTER TABLE [dbo].[CapDoTieuChi] CHECK CONSTRAINT [FK_CapDoTieuChi_DonVi]
GO
ALTER TABLE [dbo].[ChiTietDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDanhGia_KetQuaDanhGia] FOREIGN KEY([MaKQDG])
REFERENCES [dbo].[KetQuaDanhGia] ([MaKQDG])
GO
ALTER TABLE [dbo].[ChiTietDanhGia] CHECK CONSTRAINT [FK_ChiTietDanhGia_KetQuaDanhGia]
GO
ALTER TABLE [dbo].[ChiTietDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDanhGia_TieuChi] FOREIGN KEY([MaTCTheoBM])
REFERENCES [dbo].[TieuChi] ([MaTC])
GO
ALTER TABLE [dbo].[ChiTietDanhGia] CHECK CONSTRAINT [FK_ChiTietDanhGia_TieuChi]
GO
ALTER TABLE [dbo].[ChuKyDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_ChuKyDanhGia_Donvi] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DonVi] ([MaDV])
GO
ALTER TABLE [dbo].[ChuKyDanhGia] CHECK CONSTRAINT [FK_ChuKyDanhGia_Donvi]
GO
ALTER TABLE [dbo].[ChuyenMon]  WITH CHECK ADD  CONSTRAINT [FK_ChuyenMon_Donvi] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DonVi] ([MaDV])
GO
ALTER TABLE [dbo].[ChuyenMon] CHECK CONSTRAINT [FK_ChuyenMon_Donvi]
GO
ALTER TABLE [dbo].[KetQuaDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_KetQuaDanhGia_BieuMauDanhGia] FOREIGN KEY([MaBM])
REFERENCES [dbo].[BieuMauDanhGia] ([MaBM])
GO
ALTER TABLE [dbo].[KetQuaDanhGia] CHECK CONSTRAINT [FK_KetQuaDanhGia_BieuMauDanhGia]
GO
ALTER TABLE [dbo].[KetQuaDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_KetQuaDanhGia_NhanVien] FOREIGN KEY([NguoiDuocDG])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[KetQuaDanhGia] CHECK CONSTRAINT [FK_KetQuaDanhGia_NhanVien]
GO
ALTER TABLE [dbo].[KetQuaDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_KetQuaDanhGia_NhanVien1] FOREIGN KEY([NguoiDG])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[KetQuaDanhGia] CHECK CONSTRAINT [FK_KetQuaDanhGia_NhanVien1]
GO
ALTER TABLE [dbo].[NgoaiNguCuaNhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NgoaiNguCuaNhanVien_NgoaiNgu] FOREIGN KEY([MaNN])
REFERENCES [dbo].[NgoaiNgu] ([MaNN])
GO
ALTER TABLE [dbo].[NgoaiNguCuaNhanVien] CHECK CONSTRAINT [FK_NgoaiNguCuaNhanVien_NgoaiNgu]
GO
ALTER TABLE [dbo].[NgoaiNguCuaNhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NgoaiNguCuaNhanVien_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[NgoaiNguCuaNhanVien] CHECK CONSTRAINT [FK_NgoaiNguCuaNhanVien_NhanVien]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ChuyenMon] FOREIGN KEY([MaCM])
REFERENCES [dbo].[ChuyenMon] ([MaCM])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_ChuyenMon]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_VaiTro] FOREIGN KEY([MaVT])
REFERENCES [dbo].[VaiTro] ([MaVT])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_VaiTro]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ViTriCongViec] FOREIGN KEY([MaVTCV])
REFERENCES [dbo].[ViTriCongViec] ([MaVTCV])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_ViTriCongViec]
GO
ALTER TABLE [dbo].[NhomTieuChi]  WITH CHECK ADD  CONSTRAINT [FK_NhomTieuChi_Donvi] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DonVi] ([MaDV])
GO
ALTER TABLE [dbo].[NhomTieuChi] CHECK CONSTRAINT [FK_NhomTieuChi_Donvi]
GO
ALTER TABLE [dbo].[Quyen]  WITH CHECK ADD  CONSTRAINT [FK_Quyen_DanhMucQuanTri] FOREIGN KEY([MaDM])
REFERENCES [dbo].[DanhMucQuanTri] ([MaDM])
GO
ALTER TABLE [dbo].[Quyen] CHECK CONSTRAINT [FK_Quyen_DanhMucQuanTri]
GO
ALTER TABLE [dbo].[Quyen]  WITH CHECK ADD  CONSTRAINT [FK_Quyen_VaiTro] FOREIGN KEY([MaVT])
REFERENCES [dbo].[VaiTro] ([MaVT])
GO
ALTER TABLE [dbo].[Quyen] CHECK CONSTRAINT [FK_Quyen_VaiTro]
GO
ALTER TABLE [dbo].[ThangDo]  WITH CHECK ADD  CONSTRAINT [FK_ThangDo_BieuMauDanhGia] FOREIGN KEY([MaBM])
REFERENCES [dbo].[BieuMauDanhGia] ([MaBM])
GO
ALTER TABLE [dbo].[ThangDo] CHECK CONSTRAINT [FK_ThangDo_BieuMauDanhGia]
GO
ALTER TABLE [dbo].[TieuChi]  WITH CHECK ADD  CONSTRAINT [FK_TieuChi_NhomTieuChi] FOREIGN KEY([MaNTC])
REFERENCES [dbo].[NhomTieuChi] ([MaNTC])
GO
ALTER TABLE [dbo].[TieuChi] CHECK CONSTRAINT [FK_TieuChi_NhomTieuChi]
GO
ALTER TABLE [dbo].[TieuChi]  WITH CHECK ADD  CONSTRAINT [FK_TieuChi_TieuChi] FOREIGN KEY([MaTCCha])
REFERENCES [dbo].[TieuChi] ([MaTC])
GO
ALTER TABLE [dbo].[TieuChi] CHECK CONSTRAINT [FK_TieuChi_TieuChi]
GO
ALTER TABLE [dbo].[TieuChiTheoBieuMau]  WITH CHECK ADD  CONSTRAINT [FK_TieuChiTheoBieuMau_BieuMauDanhGia] FOREIGN KEY([MaBM])
REFERENCES [dbo].[BieuMauDanhGia] ([MaBM])
GO
ALTER TABLE [dbo].[TieuChiTheoBieuMau] CHECK CONSTRAINT [FK_TieuChiTheoBieuMau_BieuMauDanhGia]
GO
ALTER TABLE [dbo].[TieuChiTheoBieuMau]  WITH CHECK ADD  CONSTRAINT [FK_TieuChiTheoBieuMau_TieuChi] FOREIGN KEY([MaTC])
REFERENCES [dbo].[TieuChi] ([MaTC])
GO
ALTER TABLE [dbo].[TieuChiTheoBieuMau] CHECK CONSTRAINT [FK_TieuChiTheoBieuMau_TieuChi]
GO
ALTER TABLE [dbo].[VaiTro]  WITH CHECK ADD  CONSTRAINT [FK_VaiTro_Donvi] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DonVi] ([MaDV])
GO
ALTER TABLE [dbo].[VaiTro] CHECK CONSTRAINT [FK_VaiTro_Donvi]
GO
ALTER TABLE [dbo].[ViTriCongViec]  WITH CHECK ADD  CONSTRAINT [FK_ViTriCongViec_BoPhan] FOREIGN KEY([MaBP])
REFERENCES [dbo].[BoPhan] ([MaBP])
GO
ALTER TABLE [dbo].[ViTriCongViec] CHECK CONSTRAINT [FK_ViTriCongViec_BoPhan]
GO
