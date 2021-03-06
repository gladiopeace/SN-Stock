USE [LongSurveyDB]
GO
/****** Object:  UserDefinedFunction [dbo].[fnTinhTongDiemTheoMaKQDG]    Script Date: 6/17/2015 10:14:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fnTinhTongDiemTheoMaKQDG]
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
/****** Object:  Table [dbo].[AdminDV]    Script Date: 6/17/2015 10:14:46 AM ******/
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
	[TrangThai] [bit] NOT NULL,
	[MaVTCV] [int] NULL,
 CONSTRAINT [PK_AdminDV_1] PRIMARY KEY CLUSTERED 
(
	[MaDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BieuMauDanhGia]    Script Date: 6/17/2015 10:14:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BieuMauDanhGia](
	[MaBM] [int] IDENTITY(1,1) NOT NULL,
	[MaVTCV] [int] NOT NULL,
	[MaCK] [int] NOT NULL,
	[TenBM] [nvarchar](1000) NOT NULL,
	[TenBMEN] [varchar](1000) NULL,
	[Chon] [bit] NOT NULL,
	[NgayTao] [datetime] NULL,
	[MoTa] [nvarchar](max) NULL,
	[MoTaEN] [varchar](max) NULL,
	[MaDV] [int] NULL,
 CONSTRAINT [PK_BieuMauDanhGia] PRIMARY KEY CLUSTERED 
(
	[MaBM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BoPhan]    Script Date: 6/17/2015 10:14:46 AM ******/
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
/****** Object:  Table [dbo].[CapDoTieuChi]    Script Date: 6/17/2015 10:14:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CapDoTieuChi](
	[MaCD] [int] IDENTITY(1,1) NOT NULL,
	[GiaTri] [int] NOT NULL,
	[MoTa] [nvarchar](500) NULL,
 CONSTRAINT [PK_CapDoTieuChi] PRIMARY KEY CLUSTERED 
(
	[MaCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietDanhGia]    Script Date: 6/17/2015 10:14:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDanhGia](
	[MaCTDG] [int] IDENTITY(1,1) NOT NULL,
	[MaTCTheoBM] [int] NOT NULL,
	[MaMucTC] [int] NULL,
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
/****** Object:  Table [dbo].[ChuKyDanhGia]    Script Date: 6/17/2015 10:14:46 AM ******/
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
/****** Object:  Table [dbo].[ChuyenMon]    Script Date: 6/17/2015 10:14:46 AM ******/
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
/****** Object:  Table [dbo].[DanhMucHienThi]    Script Date: 6/17/2015 10:14:46 AM ******/
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
/****** Object:  Table [dbo].[DanhMucQuanTri]    Script Date: 6/17/2015 10:14:46 AM ******/
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
/****** Object:  Table [dbo].[DonVi]    Script Date: 6/17/2015 10:14:46 AM ******/
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
	[TrangThai] [bit] NOT NULL,
	[TongSoTK] [int] NOT NULL,
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
/****** Object:  Table [dbo].[KetQuaDanhGia]    Script Date: 6/17/2015 10:14:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KetQuaDanhGia](
	[MaKQDG] [int] IDENTITY(1,1) NOT NULL,
	[NgayDG] [datetime] NOT NULL,
	[NguoiDG] [varchar](50) NOT NULL,
	[NguoiDuocDG] [varchar](50) NOT NULL,
	[CoHieuLuc] [bit] NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
	[HienThi] [bit] NOT NULL,
	[MaBM] [int] NOT NULL,
	[KetLuan] [nvarchar](1000) NULL,
	[KetLuanEN] [varchar](1000) NULL,
 CONSTRAINT [PK_KetQuaDanhGia] PRIMARY KEY CLUSTERED 
(
	[MaKQDG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MucTrongTieuChi]    Script Date: 6/17/2015 10:14:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MucTrongTieuChi](
	[MaMuc] [int] IDENTITY(1,1) NOT NULL,
	[GiaTri] [float] NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[MoTaEN] [varchar](max) NULL,
	[TrangThai] [bit] NOT NULL,
	[MaTC] [int] NULL,
 CONSTRAINT [PK_Diem] PRIMARY KEY CLUSTERED 
(
	[MaMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NgoaiNgu]    Script Date: 6/17/2015 10:14:46 AM ******/
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
/****** Object:  Table [dbo].[NgoaiNguCuaNhanVien]    Script Date: 6/17/2015 10:14:46 AM ******/
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
/****** Object:  Table [dbo].[NhanVien]    Script Date: 6/17/2015 10:14:46 AM ******/
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
/****** Object:  Table [dbo].[NhomTieuChi]    Script Date: 6/17/2015 10:14:46 AM ******/
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
/****** Object:  Table [dbo].[Quyen]    Script Date: 6/17/2015 10:14:46 AM ******/
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
	[Xem] [bit] NOT NULL,
	[Them] [bit] NOT NULL,
	[Xoa] [bit] NOT NULL,
	[Sua] [bit] NOT NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SuperAdmin]    Script Date: 6/17/2015 10:14:46 AM ******/
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
/****** Object:  Table [dbo].[ThangDo]    Script Date: 6/17/2015 10:14:46 AM ******/
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
/****** Object:  Table [dbo].[TieuChi]    Script Date: 6/17/2015 10:14:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TieuChi](
	[MaTC] [int] IDENTITY(1,1) NOT NULL,
	[MaNTC] [int] NOT NULL,
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
/****** Object:  Table [dbo].[TieuChiTheoBieuMau]    Script Date: 6/17/2015 10:14:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TieuChiTheoBieuMau](
	[Ma] [int] IDENTITY(1,1) NOT NULL,
	[MaBM] [int] NOT NULL,
	[MaTC] [int] NOT NULL,
	[TrangThai] [bit] NOT NULL,
	[TrongSo] [float] NOT NULL,
 CONSTRAINT [PK_TieuChiTheoBieuMau] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VaiTro]    Script Date: 6/17/2015 10:14:46 AM ******/
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
/****** Object:  Table [dbo].[ViTriCongViec]    Script Date: 6/17/2015 10:14:46 AM ******/
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
	[TrangThai] [bit] NOT NULL,
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

INSERT [dbo].[BieuMauDanhGia] ([MaBM], [MaVTCV], [MaCK], [TenBM], [TenBMEN], [Chon], [NgayTao], [MoTa], [MoTaEN], [MaDV]) VALUES (1, 1, 1, N'bieu mau danh gia 1', N'bieu mau danh gia 1 english', 1, CAST(0x0000A11C00000000 AS DateTime), N'abc', N'def', 1)
INSERT [dbo].[BieuMauDanhGia] ([MaBM], [MaVTCV], [MaCK], [TenBM], [TenBMEN], [Chon], [NgayTao], [MoTa], [MoTaEN], [MaDV]) VALUES (2, 2, 1, N'bieu mau danh gia 2', N'bieu mau danh gia 2 english', 1, CAST(0x0000A2E400000000 AS DateTime), N'abc', N'def', 1)
SET IDENTITY_INSERT [dbo].[BieuMauDanhGia] OFF
SET IDENTITY_INSERT [dbo].[BoPhan] ON 

INSERT [dbo].[BoPhan] ([MaBP], [TenBP], [MaDV], [TenBPEN], [MoTa], [TrangThai]) VALUES (1, N'Khoa Sản', 1, N'Khoa san', N'khong mo ta gi', 1)
INSERT [dbo].[BoPhan] ([MaBP], [TenBP], [MaDV], [TenBPEN], [MoTa], [TrangThai]) VALUES (4, N'Bộ phận test', 1, N'Test Department', N'test', 1)
INSERT [dbo].[BoPhan] ([MaBP], [TenBP], [MaDV], [TenBPEN], [MoTa], [TrangThai]) VALUES (10, N'Cấp cứu', 1, N'Emmergency', N'', 1)
INSERT [dbo].[BoPhan] ([MaBP], [TenBP], [MaDV], [TenBPEN], [MoTa], [TrangThai]) VALUES (1010, N'Ban giám đóc', 7, N'Ban giam doc', N'', 1)
INSERT [dbo].[BoPhan] ([MaBP], [TenBP], [MaDV], [TenBPEN], [MoTa], [TrangThai]) VALUES (1011, N'Ngồi chơi xơi nước', 1, N'bo phan ngoi choi xoi nuoc', N'', 1)
SET IDENTITY_INSERT [dbo].[BoPhan] OFF
SET IDENTITY_INSERT [dbo].[ChiTietDanhGia] ON 

INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (1, 1, 384, 1, 50, 1, NULL, 1)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (2, 2, 388, 1, 40, 2, NULL, 1)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (3, 4, 392, 1, 40, 4, 3, 1)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (4, 5, 396, 1, 40, 5, 3, 1)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (5, 6, 400, 1, 20, 7, 3, 1)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (6, 8, 404, 1, 6, 9, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (7, 9, 408, 1, 6, 10, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (8, 10, 412, 1, 6, 11, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (9, 11, 416, 1, 6, 12, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (10, 12, 420, 1, 6, 14, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (11, 13, 424, 1, 6, 15, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (12, 14, 428, 1, 4, 16, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (13, 15, 432, 1, 4, 17, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (14, 16, 436, 1, 4, 18, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (15, 17, 440, 1, 4, 19, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (16, 18, 444, 1, 4, 20, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (17, 19, 448, 1, 4, 21, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (18, 20, 452, 1, 4, 22, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (19, 21, 456, 1, 4, 23, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (20, 22, 460, 1, 4, 24, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (21, 23, 464, 1, 4, 25, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (22, 24, 468, 1, 4, 26, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (23, 25, 472, 1, 4, 27, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (24, 26, 476, 1, 4, 28, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (25, 27, 480, 1, 4, 29, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (26, 28, 484, 1, 4, 30, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (27, 29, 488, 1, 4, 31, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (28, 31, 492, 1, 20, 33, 32, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (29, 32, 496, 1, 40, 34, 32, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (30, 33, 500, 1, 40, 35, 32, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (31, 34, 504, 1, 20, 36, NULL, 3)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (32, 35, 508, 1, 10, 37, NULL, 3)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (33, 36, 512, 1, 10, 39, NULL, 3)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (34, 37, 516, 1, 20, 40, NULL, 3)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (35, 38, 520, 1, 10, 41, NULL, 3)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (36, 39, 524, 1, 10, 42, NULL, 3)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (37, 40, 528, 1, 20, 43, NULL, 3)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (38, 41, 532, 1, 100, 44, NULL, 4)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (39, 3, NULL, 1, 10, 3, NULL, 1)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (40, 7, NULL, 1, 50, 8, NULL, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (41, 30, NULL, 1, 50, 32, NULL, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (42, 1, 381, 2, 12.5, 1, NULL, 1)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (43, 2, 385, 2, 10, 2, NULL, 1)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (44, 4, 389, 2, 10, 4, 3, 1)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (45, 5, 393, 2, 10, 5, 3, 1)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (46, 6, 397, 2, 5, 7, 3, 1)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (47, 8, 401, 2, 1.5, 9, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (48, 9, 405, 2, 1.5, 10, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (49, 10, 409, 2, 1.5, 11, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (50, 11, 413, 2, 1.5, 12, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (51, 12, 417, 2, 1.5, 14, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (52, 13, 421, 2, 1.5, 15, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (53, 14, 425, 2, 1, 16, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (54, 15, 429, 2, 1, 17, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (55, 16, 433, 2, 1, 18, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (56, 17, 437, 2, 1, 19, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (57, 18, 441, 2, 1, 20, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (58, 19, 445, 2, 1, 21, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (59, 20, 449, 2, 1, 22, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (60, 21, 453, 2, 1, 23, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (61, 22, 457, 2, 1, 24, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (62, 23, 461, 2, 1, 25, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (63, 24, 465, 2, 1, 26, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (64, 25, 469, 2, 1, 27, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (65, 26, 473, 2, 1, 28, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (66, 27, 477, 2, 1, 29, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (67, 28, 481, 2, 1, 30, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (68, 29, 485, 2, 1, 31, 8, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (69, 31, 489, 2, 5, 33, 32, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (70, 32, 493, 2, 10, 34, 32, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (71, 33, 497, 2, 10, 35, 32, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (72, 34, 501, 2, 5, 36, NULL, 3)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (73, 35, 505, 2, 2.5, 37, NULL, 3)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (74, 36, 509, 2, 2.5, 39, NULL, 3)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (75, 37, 513, 2, 5, 40, NULL, 3)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (76, 38, 517, 2, 2.5, 41, NULL, 3)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (77, 39, 521, 2, 2.5, 42, NULL, 3)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (78, 40, 525, 2, 5, 43, NULL, 3)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (79, 41, 529, 2, 25, 44, NULL, 4)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (80, 3, NULL, 2, 2.5, 3, NULL, 1)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (81, 7, NULL, 2, 12.5, 8, NULL, 2)
INSERT [dbo].[ChiTietDanhGia] ([MaCTDG], [MaTCTheoBM], [MaMucTC], [MaKQDG], [TongDiem], [MaTC], [MaTCCha], [MaNhomTC]) VALUES (82, 30, NULL, 2, 12.5, 32, NULL, 2)
SET IDENTITY_INSERT [dbo].[ChiTietDanhGia] OFF
SET IDENTITY_INSERT [dbo].[ChuKyDanhGia] ON 

INSERT [dbo].[ChuKyDanhGia] ([MaCK], [TenCK], [TenCKEN], [BatDau], [KetThuc], [TrangThai], [MoTa], [MoTaEN], [MaDV]) VALUES (1, N'Chu Kỳ Mùa Xuân', N'chu ky mua xuan', CAST(0x00009D6E00000000 AS DateTime), CAST(0x0000A08800000000 AS DateTime), 0, NULL, NULL, 1)
INSERT [dbo].[ChuKyDanhGia] ([MaCK], [TenCK], [TenCKEN], [BatDau], [KetThuc], [TrangThai], [MoTa], [MoTaEN], [MaDV]) VALUES (3, N'Test xong', N'Test xong', CAST(0x0000A2EC00000000 AS DateTime), CAST(0x0000A45900000000 AS DateTime), 2, NULL, NULL, 1)
INSERT [dbo].[ChuKyDanhGia] ([MaCK], [TenCK], [TenCKEN], [BatDau], [KetThuc], [TrangThai], [MoTa], [MoTaEN], [MaDV]) VALUES (4, N'bieu mau danh gia 1 - Bác sĩ nhi khoa', N'bieu mau danh gia 1 english - bac si nhi khoa', CAST(0x0000A4B400000000 AS DateTime), CAST(0x0000A4D200000000 AS DateTime), 0, NULL, NULL, 1)
INSERT [dbo].[ChuKyDanhGia] ([MaCK], [TenCK], [TenCKEN], [BatDau], [KetThuc], [TrangThai], [MoTa], [MoTaEN], [MaDV]) VALUES (5, N'bieu mau danh gia 2 - Hành chính', N'bieu mau danh gia 2 english - hanh chinh EN', CAST(0x0000A4B400000000 AS DateTime), CAST(0x0000A4F100000000 AS DateTime), 0, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[ChuKyDanhGia] OFF
SET IDENTITY_INSERT [dbo].[ChuyenMon] ON 

INSERT [dbo].[ChuyenMon] ([MaCM], [TenCM], [TenCMEN], [MoTa], [MaDV]) VALUES (1, N'Đại học', N'University', N'Đại học', 1)
INSERT [dbo].[ChuyenMon] ([MaCM], [TenCM], [TenCMEN], [MoTa], [MaDV]) VALUES (2, N'Thạc sỹ', N'Master    ', N'Thạc sỹ', 1)
INSERT [dbo].[ChuyenMon] ([MaCM], [TenCM], [TenCMEN], [MoTa], [MaDV]) VALUES (3, N'Tiến sỹ', N'PhD       ', N'Tiến sỹ', 1)
INSERT [dbo].[ChuyenMon] ([MaCM], [TenCM], [TenCMEN], [MoTa], [MaDV]) VALUES (4, N'Giáo sư', N'Prof      ', N'Giáo sư', 2)
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

INSERT [dbo].[DonVi] ([MaDV], [TenDV], [TenDVEN], [DiaChi], [DienThoai], [Fax], [Email], [Logo], [TrangThai], [TongSoTK], [Website], [MaNVAdmin]) VALUES (1, N'Bệnh viện Gia Định', N'', N'benh vien gia dinh tp hcm', N'123456789', N'123456789', N'abc@gmail.com', N'1.jpg', 1, 20, N'giadinh.com.vn', NULL)
INSERT [dbo].[DonVi] ([MaDV], [TenDV], [TenDVEN], [DiaChi], [DienThoai], [Fax], [Email], [Logo], [TrangThai], [TongSoTK], [Website], [MaNVAdmin]) VALUES (2, N'Bệnh viện 105', N'', N'Tan Chanh Hiep', N'123456789', N'234567', N'abc@gmail.com', N'2.jpg', 1, 6, N'giomoico.com', NULL)
INSERT [dbo].[DonVi] ([MaDV], [TenDV], [TenDVEN], [DiaChi], [DienThoai], [Fax], [Email], [Logo], [TrangThai], [TongSoTK], [Website], [MaNVAdmin]) VALUES (3, N'Bệnh viện Từ Dũ', NULL, N'Q.6', N'123456789', N'1234567', N'abc@gmail.com', NULL, 1, 12, NULL, NULL)
INSERT [dbo].[DonVi] ([MaDV], [TenDV], [TenDVEN], [DiaChi], [DienThoai], [Fax], [Email], [Logo], [TrangThai], [TongSoTK], [Website], [MaNVAdmin]) VALUES (4, N'Benh vien quan doi 108', N'', N'So 3, D2, Van Thanh Bac, Binh Thanh', N'2345', N'123456789', N'abc@gmail.com', N'', 1, 34, N'', NULL)
INSERT [dbo].[DonVi] ([MaDV], [TenDV], [TenDVEN], [DiaChi], [DienThoai], [Fax], [Email], [Logo], [TrangThai], [TongSoTK], [Website], [MaNVAdmin]) VALUES (6, N'a', N'a', N'a', N'a', N'a', N'a', NULL, 1, 20, NULL, NULL)
INSERT [dbo].[DonVi] ([MaDV], [TenDV], [TenDVEN], [DiaChi], [DienThoai], [Fax], [Email], [Logo], [TrangThai], [TongSoTK], [Website], [MaNVAdmin]) VALUES (7, N'ilen', N'ilen', N'khong biet', N'1234', N'1234', N'ilen@gmail.com', NULL, 1, 15, NULL, NULL)
INSERT [dbo].[DonVi] ([MaDV], [TenDV], [TenDVEN], [DiaChi], [DienThoai], [Fax], [Email], [Logo], [TrangThai], [TongSoTK], [Website], [MaNVAdmin]) VALUES (8, N'test', N'', N'test', N'test', N'test', N'test', N'', 1, 5, N'test', NULL)
INSERT [dbo].[DonVi] ([MaDV], [TenDV], [TenDVEN], [DiaChi], [DienThoai], [Fax], [Email], [Logo], [TrangThai], [TongSoTK], [Website], [MaNVAdmin]) VALUES (9, N'co hinh', N'', N'co hinh', N'co hinh', N'co hinh', N'co hinh', N'', 1, 6, N'co hinh', NULL)
INSERT [dbo].[DonVi] ([MaDV], [TenDV], [TenDVEN], [DiaChi], [DienThoai], [Fax], [Email], [Logo], [TrangThai], [TongSoTK], [Website], [MaNVAdmin]) VALUES (10, N'Benh vien abc', N'', N'ha noi', N'12345', N'12323454', N'abc@gmail.com', N'', 1, 78, N'abc.com.vn', NULL)
INSERT [dbo].[DonVi] ([MaDV], [TenDV], [TenDVEN], [DiaChi], [DienThoai], [Fax], [Email], [Logo], [TrangThai], [TongSoTK], [Website], [MaNVAdmin]) VALUES (11, N'asdf', N'', N'asdf', N'a', N'asdf', N'asdf', N'11.png', 1, 5, N'asdf', NULL)
INSERT [dbo].[DonVi] ([MaDV], [TenDV], [TenDVEN], [DiaChi], [DienThoai], [Fax], [Email], [Logo], [TrangThai], [TongSoTK], [Website], [MaNVAdmin]) VALUES (12, N'hoa', N'', N'q.12', N'23454356456', N'355462412345', N'hoa@gmail.com', N'12.jpg', 1, 7, N'hoa.com.vn', NULL)
SET IDENTITY_INSERT [dbo].[DonVi] OFF
SET IDENTITY_INSERT [dbo].[KetQuaDanhGia] ON 

INSERT [dbo].[KetQuaDanhGia] ([MaKQDG], [NgayDG], [NguoiDG], [NguoiDuocDG], [CoHieuLuc], [GhiChu], [HienThi], [MaBM], [KetLuan], [KetLuanEN]) VALUES (1, CAST(0x0000A4B900000000 AS DateTime), N'NV01006', N'NV00008', 1, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[KetQuaDanhGia] ([MaKQDG], [NgayDG], [NguoiDG], [NguoiDuocDG], [CoHieuLuc], [GhiChu], [HienThi], [MaBM], [KetLuan], [KetLuanEN]) VALUES (2, CAST(0x0000A4B900000000 AS DateTime), N'NV01006', N'NV01009', 1, NULL, 1, 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[KetQuaDanhGia] OFF
SET IDENTITY_INSERT [dbo].[MucTrongTieuChi] ON 

INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (381, 0.25, N'muc 0', N'level 0', 1, 1)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (382, 0.5, N'muc 1', N'level 1', 1, 1)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (383, 0.75, N'muc 2', N'level 2', 1, 1)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (384, 1, N'muc 3', N'level 3', 1, 1)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (385, 0.25, N'muc 0', N'level 0', 1, 2)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (386, 0.5, N'muc 1', N'level 1', 1, 2)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (387, 0.75, N'muc 2', N'level 2', 1, 2)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (388, 1, N'muc 3', N'level 3', 1, 2)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (389, 0.25, N'muc 0', N'level 0', 1, 4)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (390, 0.5, N'muc 1', N'level 1', 1, 4)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (391, 0.75, N'muc 2', N'level 2', 1, 4)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (392, 1, N'muc 3', N'level 3', 1, 4)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (393, 0.25, N'muc 0', N'level 0', 1, 5)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (394, 0.5, N'muc 1', N'level 1', 1, 5)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (395, 0.75, N'muc 2', N'level 2', 1, 5)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (396, 1, N'muc 3', N'level 3', 1, 5)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (397, 0.25, N'muc 0', N'level 0', 1, 7)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (398, 0.5, N'muc 1', N'level 1', 1, 7)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (399, 0.75, N'muc 2', N'level 2', 1, 7)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (400, 1, N'muc 3', N'level 3', 1, 7)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (401, 0.25, N'muc 0', N'level 0', 1, 9)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (402, 0.5, N'muc 1', N'level 1', 1, 9)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (403, 0.75, N'muc 2', N'level 2', 1, 9)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (404, 1, N'muc 3', N'level 3', 1, 9)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (405, 0.25, N'muc 0', N'level 0', 1, 10)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (406, 0.5, N'muc 1', N'level 1', 1, 10)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (407, 0.75, N'muc 2', N'level 2', 1, 10)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (408, 1, N'muc 3', N'level 3', 1, 10)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (409, 0.25, N'muc 0', N'level 0', 1, 11)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (410, 0.5, N'muc 1', N'level 1', 1, 11)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (411, 0.75, N'muc 2', N'level 2', 1, 11)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (412, 1, N'muc 3', N'level 3', 1, 11)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (413, 0.25, N'muc 0', N'level 0', 1, 12)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (414, 0.5, N'muc 1', N'level 1', 1, 12)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (415, 0.75, N'muc 2', N'level 2', 1, 12)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (416, 1, N'muc 3', N'level 3', 1, 12)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (417, 0.25, N'muc 0', N'level 0', 1, 14)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (418, 0.5, N'muc 1', N'level 1', 1, 14)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (419, 0.75, N'muc 2', N'level 2', 1, 14)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (420, 1, N'muc 3', N'level 3', 1, 14)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (421, 0.25, N'muc 0', N'level 0', 1, 15)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (422, 0.5, N'muc 1', N'level 1', 1, 15)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (423, 0.75, N'muc 2', N'level 2', 1, 15)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (424, 1, N'muc 3', N'level 3', 1, 15)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (425, 0.25, N'muc 0', N'level 0', 1, 16)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (426, 0.5, N'muc 1', N'level 1', 1, 16)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (427, 0.75, N'muc 2', N'level 2', 1, 16)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (428, 1, N'muc 3', N'level 3', 1, 16)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (429, 0.25, N'muc 0', N'level 0', 1, 17)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (430, 0.5, N'muc 1', N'level 1', 1, 17)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (431, 0.75, N'muc 2', N'level 2', 1, 17)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (432, 1, N'muc 3', N'level 3', 1, 17)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (433, 0.25, N'muc 0', N'level 0', 1, 18)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (434, 0.5, N'muc 1', N'level 1', 1, 18)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (435, 0.75, N'muc 2', N'level 2', 1, 18)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (436, 1, N'muc 3', N'level 3', 1, 18)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (437, 0.25, N'muc 0', N'level 0', 1, 19)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (438, 0.5, N'muc 1', N'level 1', 1, 19)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (439, 0.75, N'muc 2', N'level 2', 1, 19)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (440, 1, N'muc 3', N'level 3', 1, 19)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (441, 0.25, N'muc 0', N'level 0', 1, 20)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (442, 0.5, N'muc 1', N'level 1', 1, 20)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (443, 0.75, N'muc 2', N'level 2', 1, 20)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (444, 1, N'muc 3', N'level 3', 1, 20)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (445, 0.25, N'muc 0', N'level 0', 1, 21)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (446, 0.5, N'muc 1', N'level 1', 1, 21)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (447, 0.75, N'muc 2', N'level 2', 1, 21)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (448, 1, N'muc 3', N'level 3', 1, 21)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (449, 0.25, N'muc 0', N'level 0', 1, 22)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (450, 0.5, N'muc 1', N'level 1', 1, 22)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (451, 0.75, N'muc 2', N'level 2', 1, 22)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (452, 1, N'muc 3', N'level 3', 1, 22)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (453, 0.25, N'muc 0', N'level 0', 1, 23)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (454, 0.5, N'muc 1', N'level 1', 1, 23)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (455, 0.75, N'muc 2', N'level 2', 1, 23)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (456, 1, N'muc 3', N'level 3', 1, 23)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (457, 0.25, N'muc 0', N'level 0', 1, 24)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (458, 0.5, N'muc 1', N'level 1', 1, 24)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (459, 0.75, N'muc 2', N'level 2', 1, 24)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (460, 1, N'muc 3', N'level 3', 1, 24)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (461, 0.25, N'muc 0', N'level 0', 1, 25)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (462, 0.5, N'muc 1', N'level 1', 1, 25)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (463, 0.75, N'muc 2', N'level 2', 1, 25)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (464, 1, N'muc 3', N'level 3', 1, 25)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (465, 0.25, N'muc 0', N'level 0', 1, 26)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (466, 0.5, N'muc 1', N'level 1', 1, 26)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (467, 0.75, N'muc 2', N'level 2', 1, 26)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (468, 1, N'muc 3', N'level 3', 1, 26)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (469, 0.25, N'muc 0', N'level 0', 1, 27)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (470, 0.5, N'muc 1', N'level 1', 1, 27)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (471, 0.75, N'muc 2', N'level 2', 1, 27)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (472, 1, N'muc 3', N'level 3', 1, 27)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (473, 0.25, N'muc 0', N'level 0', 1, 28)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (474, 0.5, N'muc 1', N'level 1', 1, 28)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (475, 0.75, N'muc 2', N'level 2', 1, 28)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (476, 1, N'muc 3', N'level 3', 1, 28)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (477, 0.25, N'muc 0', N'level 0', 1, 29)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (478, 0.5, N'muc 1', N'level 1', 1, 29)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (479, 0.75, N'muc 2', N'level 2', 1, 29)
GO
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (480, 1, N'muc 3', N'level 3', 1, 29)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (481, 0.25, N'muc 0', N'level 0', 1, 30)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (482, 0.5, N'muc 1', N'level 1', 1, 30)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (483, 0.75, N'muc 2', N'level 2', 1, 30)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (484, 1, N'muc 3', N'level 3', 1, 30)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (485, 0.25, N'muc 0', N'level 0', 1, 31)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (486, 0.5, N'muc 1', N'level 1', 1, 31)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (487, 0.75, N'muc 2', N'level 2', 1, 31)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (488, 1, N'muc 3', N'level 3', 1, 31)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (489, 0.25, N'muc 0', N'level 0', 1, 33)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (490, 0.5, N'muc 1', N'level 1', 1, 33)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (491, 0.75, N'muc 2', N'level 2', 1, 33)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (492, 1, N'muc 3', N'level 3', 1, 33)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (493, 0.25, N'muc 0', N'level 0', 1, 34)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (494, 0.5, N'muc 1', N'level 1', 1, 34)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (495, 0.75, N'muc 2', N'level 2', 1, 34)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (496, 1, N'muc 3', N'level 3', 1, 34)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (497, 0.25, N'muc 0', N'level 0', 1, 35)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (498, 0.5, N'muc 1', N'level 1', 1, 35)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (499, 0.75, N'muc 2', N'level 2', 1, 35)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (500, 1, N'muc 3', N'level 3', 1, 35)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (501, 0.25, N'muc 0', N'level 0', 1, 36)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (502, 0.5, N'muc 1', N'level 1', 1, 36)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (503, 0.75, N'muc 2', N'level 2', 1, 36)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (504, 1, N'muc 3', N'level 3', 1, 36)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (505, 0.25, N'muc 0', N'level 0', 1, 37)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (506, 0.5, N'muc 1', N'level 1', 1, 37)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (507, 0.75, N'muc 2', N'level 2', 1, 37)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (508, 1, N'muc 3', N'level 3', 1, 37)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (509, 0.25, N'muc 0', N'level 0', 1, 39)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (510, 0.5, N'muc 1', N'level 1', 1, 39)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (511, 0.75, N'muc 2', N'level 2', 1, 39)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (512, 1, N'muc 3', N'level 3', 1, 39)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (513, 0.25, N'muc 0', N'level 0', 1, 40)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (514, 0.5, N'muc 1', N'level 1', 1, 40)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (515, 0.75, N'muc 2', N'level 2', 1, 40)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (516, 1, N'muc 3', N'level 3', 1, 40)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (517, 0.25, N'muc 0', N'level 0', 1, 41)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (518, 0.5, N'muc 1', N'level 1', 1, 41)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (519, 0.75, N'muc 2', N'level 2', 1, 41)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (520, 1, N'muc 3', N'level 3', 1, 41)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (521, 0.25, N'muc 0', N'level 0', 1, 42)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (522, 0.5, N'muc 1', N'level 1', 1, 42)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (523, 0.75, N'muc 2', N'level 2', 1, 42)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (524, 1, N'muc 3', N'level 3', 1, 42)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (525, 0.25, N'muc 0', N'level 0', 1, 43)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (526, 0.5, N'muc 1', N'level 1', 1, 43)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (527, 0.75, N'muc 2', N'level 2', 1, 43)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (528, 1, N'muc 3', N'level 3', 1, 43)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (529, 0.25, N'muc 0', N'level 0', 1, 44)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (530, 0.5, N'muc 1', N'level 1', 1, 44)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (531, 0.75, N'muc 2', N'level 2', 1, 44)
INSERT [dbo].[MucTrongTieuChi] ([MaMuc], [GiaTri], [MoTa], [MoTaEN], [TrangThai], [MaTC]) VALUES (532, 1, N'muc 3', N'level 3', 1, 44)
SET IDENTITY_INSERT [dbo].[MucTrongTieuChi] OFF
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
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [NgaySinh], [DienThoai], [Email], [Diachi], [NgayHD], [MaCM], [MaVTCV], [MatKhau], [MaVT], [Hinh], [STT], [TrangThai]) VALUES (N'NV01009', N'Nguyen Thai Son', 1, CAST(0x000081C000000000 AS DateTime), NULL, N'son@hcmutrans.edu.vn', NULL, NULL, 1, 1, N'', 1, N'NV01009.jpg', 1013, 1)
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [NgaySinh], [DienThoai], [Email], [Diachi], [NgayHD], [MaCM], [MaVTCV], [MatKhau], [MaVT], [Hinh], [STT], [TrangThai]) VALUES (N'NV01014', N'Nguyen Thai Son', 1, CAST(0x0000793100000000 AS DateTime), NULL, N'son@hcmutrans.edu.vn', NULL, NULL, 1, 3, N'123', 1, N'NV01014.jpg', 1014, 1)
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [NgaySinh], [DienThoai], [Email], [Diachi], [NgayHD], [MaCM], [MaVTCV], [MatKhau], [MaVT], [Hinh], [STT], [TrangThai]) VALUES (N'nv1', N'Nguyễn Văn A', 1, CAST(0x000081D500000000 AS DateTime), N'0909090909', N'a@gmail.com', N'tp hcm', CAST(0x00008F2A00000000 AS DateTime), 1, 1, N'123', 1, N'nv1.png', 1, 1)
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
SET IDENTITY_INSERT [dbo].[NhomTieuChi] ON 

INSERT [dbo].[NhomTieuChi] ([MaNTC], [MaDV], [TenNTC], [TenNTCEN], [TrongSo], [MoTa], [Chon]) VALUES (1, 1, N'KIẾN THỨC', N'khong biet', 30, N'30%', 1)
INSERT [dbo].[NhomTieuChi] ([MaNTC], [MaDV], [TenNTC], [TenNTCEN], [TrongSo], [MoTa], [Chon]) VALUES (2, 1, N'KỸ NĂNG VÀ KINH NGHIỆM CHUYÊN MÔN TRỰC - CẤP CỨU', N'khong biet', 30, N'30%', 1)
INSERT [dbo].[NhomTieuChi] ([MaNTC], [MaDV], [TenNTC], [TenNTCEN], [TrongSo], [MoTa], [Chon]) VALUES (3, 1, N'THÁI ĐỘ THỰC HIỆN CÔNG VIỆC', N'khong biet', 20, N'20%', 1)
INSERT [dbo].[NhomTieuChi] ([MaNTC], [MaDV], [TenNTC], [TenNTCEN], [TrongSo], [MoTa], [Chon]) VALUES (4, 1, N'KẾT QUẢ HOẠT ĐỘNG CHUYÊN MÔN', N'khong biet', 20, N'20%', 1)
SET IDENTITY_INSERT [dbo].[NhomTieuChi] OFF
INSERT [dbo].[SuperAdmin] ([TenDN], [MatKhau], [Hinh], [Email], [DienThoai], [HoTen]) VALUES (N'sa', N'202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, N'tran van ilen')
SET IDENTITY_INSERT [dbo].[TieuChi] ON 

INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (1, 1, N'TRÌNH ĐỘ CHUYÊN MÔN', NULL, 50, N'50% trong 30%', NULL, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (2, 1, N'THÂM NIÊN CÔNG TÁC', NULL, 40, N'40% trong 30%', NULL, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (3, 1, N'NGOẠI NGỮ', NULL, 10, N'10% trong 30%', NULL, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (4, 1, N'Nghe', NULL, 40, N'40% trong 10%', 3, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (5, 1, N'Nói', NULL, 40, N'40% trong 10%', 3, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (7, 1, N'Viết', NULL, 20, N'20% trong 10%', 3, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (8, 2, N'Kỹ năng thao tác chuyên môn (cứng)', NULL, 50, N'50% trong 30%', NULL, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (9, 2, N'Phẫu thuật chửa ngoài tử cung vỡ', NULL, 6, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (10, 2, N'Phẫu thuật chửa ngoài tử cung vỡ có choáng', NULL, 6, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (11, 2, N'Đỡ đẻ ngược', NULL, 6, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (12, 2, N'Đỡ đẻ sinh đôi', NULL, 6, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (14, 2, N'Đỡ đẻ chỉ huy', NULL, 6, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (15, 2, N'Đỡ đẻ thường ngôi chỏm', NULL, 6, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (16, 2, N'Phẫu thuật lấy thai lần đầu', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (17, 2, N'Mổ lấy thai lần hai hay lần thứ ba có dính', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (18, 2, N'Phẫu thuật chửa ngoài tử cung lấy máu tụ thành nang', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (19, 2, N'Forceps', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (20, 2, N'Giác hút', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (21, 2, N'Nạo sót thai, nạo sót rau sau sẩy, sau để', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (22, 2, N'Chọc hút dịch do máu tụ sau mổ', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (23, 2, N'Bóc nhau nhân tạo', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (24, 2, N'Nghiệm pháp lọt ngôi chỏm', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (25, 2, N'Hồi sức sơ sinh ngạt', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (26, 2, N'Bóp bóng Ambu, thổi ngạt sơ sinh', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (27, 2, N'Nghiệm pháp bong rau, đỡ rau, kiểm tra bánh rau', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (28, 2, N'Kiểm soát tử cung', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (29, 2, N'Sử dụng thành thạo một số thiết bị y tế trong cấp cứu tại phòng sanh, phòng mổ và các khoa phòng liên quan', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (30, 2, N'Sử dụng thành thạo một số thiết bị y tế trong chẩn đoán và điều trị', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (31, 2, N'Cấp cứu tim phổi cơ bản và nâng cao', NULL, 4, NULL, 8, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (32, 2, N'Kỹ năng xửa lý tình huống y khoa (mềm)', NULL, 50, NULL, NULL, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (33, 2, N'Giải thích khéo léo và có hiệu quả với người bệnh và gia đình người bệnh về tình trạng bệnh và hướng điều trị của bệnh nhân', NULL, 20, NULL, 32, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (34, 2, N'Giao tiếp hòa nhã, thân thiện với đồng nghiệp, bệnh nhân và gia đình bệnh nhân', NULL, 40, NULL, 32, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (35, 2, N'Phối hợp công việc tốt với đồng nghiệp và sẵn lòng hỗ trợ đồng nghiệp khi cần thiết', NULL, 40, NULL, 32, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (36, 3, N'Tận tụy với người bệnh: Khám bệnh kỹ lưỡng, tư vấn chu đáo và giải thích cặn kẽ', NULL, 20, NULL, NULL, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (37, 3, N'Tôn trọng, cảm thông, chia sẻ và hết lòng với người bệnh và gia đình bệnh nhân', NULL, 10, NULL, NULL, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (39, 3, N'Tôn trọng và chân thành hợp tác với đồng nghiệp', NULL, 10, NULL, NULL, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (40, 3, N'Tôn trọng nội qui và qui chế Doanh nghiệp về giờ giấc trực giác, bàn giao ca trực, các qui định của khoa Sản, phòng sanh, phòng mổ,…', NULL, 20, NULL, NULL, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (41, 3, N'Tôn trọng nội qui chống nhiễm khuẩn bệnh viện', NULL, 10, NULL, NULL, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (42, 3, N'Tôn trọng nội qui đồng phục, trang phục công tác trong bệnh viện', NULL, 10, NULL, NULL, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (43, 3, N'Trung thực, khách quan, có tinh thần và ý thức học tập phát triển nghề nghiệp', NULL, 20, NULL, NULL, 1)
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (44, 4, N'Số lượng BN than phiền / sai sót chuyên môn', NULL, 100, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[TieuChi] OFF
SET IDENTITY_INSERT [dbo].[TieuChiTheoBieuMau] ON 

INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (1, 2, 1, 1, 50)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (2, 2, 2, 1, 40)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (3, 2, 3, 1, 10)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (4, 2, 4, 1, 40)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (5, 2, 5, 1, 40)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (6, 2, 7, 1, 20)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (7, 2, 8, 1, 50)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (8, 2, 9, 1, 6)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (9, 2, 10, 1, 6)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (10, 2, 11, 1, 6)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (11, 2, 12, 1, 6)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (12, 2, 14, 1, 6)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (13, 2, 15, 1, 6)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (14, 2, 16, 1, 4)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (15, 2, 17, 1, 4)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (16, 2, 18, 1, 4)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (17, 2, 19, 1, 4)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (18, 2, 20, 1, 4)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (19, 2, 21, 1, 4)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (20, 2, 22, 1, 4)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (21, 2, 23, 1, 4)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (22, 2, 24, 1, 4)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (23, 2, 25, 1, 4)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (24, 2, 26, 1, 4)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (25, 2, 27, 1, 4)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (26, 2, 28, 1, 4)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (27, 2, 29, 1, 4)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (28, 2, 30, 1, 4)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (29, 2, 31, 1, 4)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (30, 2, 32, 1, 50)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (31, 2, 33, 1, 20)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (32, 2, 34, 1, 40)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (33, 2, 35, 1, 40)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (34, 2, 36, 1, 20)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (35, 2, 37, 1, 10)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (36, 2, 39, 1, 10)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (37, 2, 40, 1, 20)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (38, 2, 41, 1, 10)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (39, 2, 42, 1, 10)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (40, 2, 43, 1, 20)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrangThai], [TrongSo]) VALUES (41, 2, 44, 1, 100)
SET IDENTITY_INSERT [dbo].[TieuChiTheoBieuMau] OFF
SET IDENTITY_INSERT [dbo].[VaiTro] ON 

INSERT [dbo].[VaiTro] ([MaVT], [TenVT], [TenVTEN], [MoTa], [MaDV]) VALUES (1, N'Quản trị ILEN', N'Super admin', N'Quản trị cao nhất', 1)
INSERT [dbo].[VaiTro] ([MaVT], [TenVT], [TenVTEN], [MoTa], [MaDV]) VALUES (2, N'Quản trị', N'Admin     ', N'Quản trị', 1)
INSERT [dbo].[VaiTro] ([MaVT], [TenVT], [TenVTEN], [MoTa], [MaDV]) VALUES (3, N'Quản lý', N'Supvisor', N'Quản lý', 2)
INSERT [dbo].[VaiTro] ([MaVT], [TenVT], [TenVTEN], [MoTa], [MaDV]) VALUES (4, N'Nhân viên', N'Employee', N'Nhân viên', 1)
SET IDENTITY_INSERT [dbo].[VaiTro] OFF
SET IDENTITY_INSERT [dbo].[ViTriCongViec] ON 

INSERT [dbo].[ViTriCongViec] ([MaVTCV], [MaBP], [TenVTCV], [TenVTCVEN], [TrangThai], [MoTa], [MoTaEN]) VALUES (1, 1, N'Bác sĩ nhi khoa', N'bac si nhi khoa', 1, N'asdf', N'asdf')
INSERT [dbo].[ViTriCongViec] ([MaVTCV], [MaBP], [TenVTCV], [TenVTCVEN], [TrangThai], [MoTa], [MoTaEN]) VALUES (2, 10, N'Hành chính', N'hanh chinh EN', 0, NULL, NULL)
INSERT [dbo].[ViTriCongViec] ([MaVTCV], [MaBP], [TenVTCV], [TenVTCVEN], [TrangThai], [MoTa], [MoTaEN]) VALUES (3, 4, N'Không làm gì', N'khong lam gi', 1, NULL, NULL)
INSERT [dbo].[ViTriCongViec] ([MaVTCV], [MaBP], [TenVTCV], [TenVTCVEN], [TrangThai], [MoTa], [MoTaEN]) VALUES (5, 1, N'Test xong', N'test', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ViTriCongViec] OFF
ALTER TABLE [dbo].[AdminDV] ADD  CONSTRAINT [DF_AdminDV_TrangThai]  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[BieuMauDanhGia] ADD  CONSTRAINT [DF_BieuMauDanhGia_Chon]  DEFAULT ((1)) FOR [Chon]
GO
ALTER TABLE [dbo].[BoPhan] ADD  CONSTRAINT [DF_BoPhan_TrangThai]  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[ChiTietDanhGia] ADD  CONSTRAINT [DF_ChiTietDanhGia_TongDiem]  DEFAULT ((0)) FOR [TongDiem]
GO
ALTER TABLE [dbo].[ChuKyDanhGia] ADD  CONSTRAINT [DF_ChuKyDanhGia_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[DonVi] ADD  CONSTRAINT [DF_DonVi_TrangThai]  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[DonVi] ADD  CONSTRAINT [DF_DonVi_TongSoTK]  DEFAULT ((0)) FOR [TongSoTK]
GO
ALTER TABLE [dbo].[KetQuaDanhGia] ADD  CONSTRAINT [DF_KetQuaDanhGia_CoHieuLuc]  DEFAULT ((1)) FOR [CoHieuLuc]
GO
ALTER TABLE [dbo].[KetQuaDanhGia] ADD  CONSTRAINT [DF_KetQuaDanhGia_HienThi]  DEFAULT ((1)) FOR [HienThi]
GO
ALTER TABLE [dbo].[MucTrongTieuChi] ADD  CONSTRAINT [DF_Diem_TrangThai]  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [DF_NhanVien_TrangThai]  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[NhomTieuChi] ADD  CONSTRAINT [DF_NhomTieuChi_TrongSo]  DEFAULT ((0)) FOR [TrongSo]
GO
ALTER TABLE [dbo].[NhomTieuChi] ADD  CONSTRAINT [DF_NhomTieuChi_Chon]  DEFAULT ((1)) FOR [Chon]
GO
ALTER TABLE [dbo].[Quyen] ADD  CONSTRAINT [DF_Quyen_Xem]  DEFAULT ((1)) FOR [Xem]
GO
ALTER TABLE [dbo].[Quyen] ADD  CONSTRAINT [DF_Quyen_Them]  DEFAULT ((0)) FOR [Them]
GO
ALTER TABLE [dbo].[Quyen] ADD  CONSTRAINT [DF_Quyen_Xoa]  DEFAULT ((0)) FOR [Xoa]
GO
ALTER TABLE [dbo].[Quyen] ADD  CONSTRAINT [DF_Quyen_Sua]  DEFAULT ((0)) FOR [Sua]
GO
ALTER TABLE [dbo].[ThangDo] ADD  CONSTRAINT [DF_ThangDo_CoHieuLuc]  DEFAULT ((1)) FOR [CoHieuLuc]
GO
ALTER TABLE [dbo].[TieuChi] ADD  CONSTRAINT [DF_TieuChi_Chon]  DEFAULT ((1)) FOR [Chon]
GO
ALTER TABLE [dbo].[TieuChiTheoBieuMau] ADD  CONSTRAINT [DF_TieuChiTheoBieuMau_TrangThai]  DEFAULT ((1)) FOR [TrangThai]
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
ALTER TABLE [dbo].[ChiTietDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDanhGia_KetQuaDanhGia] FOREIGN KEY([MaKQDG])
REFERENCES [dbo].[KetQuaDanhGia] ([MaKQDG])
GO
ALTER TABLE [dbo].[ChiTietDanhGia] CHECK CONSTRAINT [FK_ChiTietDanhGia_KetQuaDanhGia]
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
ALTER TABLE [dbo].[MucTrongTieuChi]  WITH CHECK ADD  CONSTRAINT [FK_MucTrongTieuChi_TieuChi] FOREIGN KEY([MaTC])
REFERENCES [dbo].[TieuChi] ([MaTC])
GO
ALTER TABLE [dbo].[MucTrongTieuChi] CHECK CONSTRAINT [FK_MucTrongTieuChi_TieuChi]
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cột này cho biết record này là chi tiết đánh giá cho tiêu chí nào trong biểu mẫu đã chọn.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChiTietDanhGia', @level2type=N'COLUMN',@level2name=N'MaTCTheoBM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: chưa bắt đầu.
1: đang thực hiện
2: đã kết thúc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChuKyDanhGia', @level2type=N'COLUMN',@level2name=N'TrangThai'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã đơn vị' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChuKyDanhGia', @level2type=N'COLUMN',@level2name=N'MaDV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cột này lấy giá trị từ cột KetQua trong table ThangDo, khi biểu mẫu được áp 1 thang đo xác định.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KetQuaDanhGia', @level2type=N'COLUMN',@level2name=N'KetLuan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'mã mức trong tiêu chí' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MucTrongTieuChi', @level2type=N'COLUMN',@level2name=N'MaMuc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Với mỗi Biểu mẫu chỉ có không quá 1 thang đo được áp cho biểu mẫu đó. Khi đó CoHieuLuc được set = true.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ThangDo', @level2type=N'COLUMN',@level2name=N'CoHieuLuc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mỗi biểu mẫu (sau khi được tất cả nhân viên thực hiện đánh giá) sẽ được áp 1 thang đo để cho biết kết luận trên Kết quả đánh giá.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ThangDo'
GO
