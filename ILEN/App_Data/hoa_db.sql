create database [HoaDB]
GO
USE [HoaDB]
GO
/****** Object:  Table [dbo].[DanhMucHienThi]    Script Date: 06/17/2015 10:48:51 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
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
/****** Object:  Table [dbo].[DanhMucQuanTri]    Script Date: 06/17/2015 10:48:51 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[DanhMucQuanTri] ([MaDM], [TenDM], [TenDMEN], [MoTa]) VALUES (N'QLBoPhan.aspx', N'Quản lý bộ phận', N'Department managerment', NULL)
INSERT [dbo].[DanhMucQuanTri] ([MaDM], [TenDM], [TenDMEN], [MoTa]) VALUES (N'QLChuyenMon.aspx', N'Quản lý chuyên môn', N'Degree management', NULL)
INSERT [dbo].[DanhMucQuanTri] ([MaDM], [TenDM], [TenDMEN], [MoTa]) VALUES (N'QLDanhMucQuanTri.aspx', N'Quản lý danh mục quản trị', N'Admin categories', NULL)
INSERT [dbo].[DanhMucQuanTri] ([MaDM], [TenDM], [TenDMEN], [MoTa]) VALUES (N'QLDiem.aspx', N'Quản lý thang điểm', N'Score management', NULL)
INSERT [dbo].[DanhMucQuanTri] ([MaDM], [TenDM], [TenDMEN], [MoTa]) VALUES (N'QLDonVi.aspx', N'Quản lý đơn vị', N'Company management', NULL)
INSERT [dbo].[DanhMucQuanTri] ([MaDM], [TenDM], [TenDMEN], [MoTa]) VALUES (N'QLNgoaiNgu.aspx', N'Quản lý ngoại ngữ', N'Languages management', NULL)
INSERT [dbo].[DanhMucQuanTri] ([MaDM], [TenDM], [TenDMEN], [MoTa]) VALUES (N'QLNhanVien.aspx', N'Quản lý nhân viên', N'Employee management', NULL)
INSERT [dbo].[DanhMucQuanTri] ([MaDM], [TenDM], [TenDMEN], [MoTa]) VALUES (N'QLNhomTieuChi.aspx', N'Quản lý nhóm tiêu chí', N'Criteria management', NULL)
INSERT [dbo].[DanhMucQuanTri] ([MaDM], [TenDM], [TenDMEN], [MoTa]) VALUES (N'QLVaiTro.aspx', N'Quản lý vai trò', N'Role management', NULL)
/****** Object:  Table [dbo].[DonVi]    Script Date: 06/17/2015 10:48:51 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
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
/****** Object:  Table [dbo].[NgoaiNgu]    Script Date: 06/17/2015 10:48:51 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[NgoaiNgu] ON
INSERT [dbo].[NgoaiNgu] ([MaNN], [TenNN], [TenNNEN], [MoTa]) VALUES (1, N'Tiếng Anh', N'English', N'nothing')
INSERT [dbo].[NgoaiNgu] ([MaNN], [TenNN], [TenNNEN], [MoTa]) VALUES (2, N'Tiếng Nga', N'Russia', NULL)
INSERT [dbo].[NgoaiNgu] ([MaNN], [TenNN], [TenNNEN], [MoTa]) VALUES (3, N'Tiếng Pháp', N'French', NULL)
INSERT [dbo].[NgoaiNgu] ([MaNN], [TenNN], [TenNNEN], [MoTa]) VALUES (4, N'Tiếng Đức', N'Germany', N'')
SET IDENTITY_INSERT [dbo].[NgoaiNgu] OFF
/****** Object:  Table [dbo].[ChuKyDanhGia]    Script Date: 06/17/2015 10:48:51 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChuyenMon]    Script Date: 06/17/2015 10:48:51 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ChuyenMon] ON
INSERT [dbo].[ChuyenMon] ([MaCM], [TenCM], [TenCMEN], [MoTa], [MaDV]) VALUES (1, N'Đại học', N'University', N'Đại học', 1)
INSERT [dbo].[ChuyenMon] ([MaCM], [TenCM], [TenCMEN], [MoTa], [MaDV]) VALUES (2, N'Thạc sỹ', N'Master    ', N'Thạc sỹ', 1)
INSERT [dbo].[ChuyenMon] ([MaCM], [TenCM], [TenCMEN], [MoTa], [MaDV]) VALUES (3, N'Tiến sỹ', N'PhD       ', N'Tiến sỹ', 1)
INSERT [dbo].[ChuyenMon] ([MaCM], [TenCM], [TenCMEN], [MoTa], [MaDV]) VALUES (4, N'Giáo sư', N'Prof      ', N'Giáo sư', 1)
SET IDENTITY_INSERT [dbo].[ChuyenMon] OFF
/****** Object:  Table [dbo].[VaiTro]    Script Date: 06/17/2015 10:48:51 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[VaiTro] ON
INSERT [dbo].[VaiTro] ([MaVT], [TenVT], [TenVTEN], [MoTa], [MaDV]) VALUES (1, N'Quản trị ILEN', N'Super admin', N'Quản trị cao nhất', NULL)
INSERT [dbo].[VaiTro] ([MaVT], [TenVT], [TenVTEN], [MoTa], [MaDV]) VALUES (2, N'Quản trị', N'Admin     ', N'Quản trị', NULL)
INSERT [dbo].[VaiTro] ([MaVT], [TenVT], [TenVTEN], [MoTa], [MaDV]) VALUES (3, N'Quản lý', N'Supvisor', N'Quản lý', NULL)
INSERT [dbo].[VaiTro] ([MaVT], [TenVT], [TenVTEN], [MoTa], [MaDV]) VALUES (4, N'Nhân viên', N'Employee', N'Nhân viên', NULL)
SET IDENTITY_INSERT [dbo].[VaiTro] OFF
/****** Object:  Table [dbo].[BoPhan]    Script Date: 06/17/2015 10:48:51 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BoPhan] ON
INSERT [dbo].[BoPhan] ([MaBP], [TenBP], [MaDV], [TenBPEN], [MoTa], [TrangThai]) VALUES (1, N'Sản', 1, N'Khoa san', N'khong mo ta gi', 1)
INSERT [dbo].[BoPhan] ([MaBP], [TenBP], [MaDV], [TenBPEN], [MoTa], [TrangThai]) VALUES (4, N'test', 1, N'abc', N'test', 1)
INSERT [dbo].[BoPhan] ([MaBP], [TenBP], [MaDV], [TenBPEN], [MoTa], [TrangThai]) VALUES (8, N'khoa san', 3, N'khoa san', N'khoa san', 1)
INSERT [dbo].[BoPhan] ([MaBP], [TenBP], [MaDV], [TenBPEN], [MoTa], [TrangThai]) VALUES (9, N'asdfasdf', 6, N'asdfasf', N'asdfasdf', 1)
INSERT [dbo].[BoPhan] ([MaBP], [TenBP], [MaDV], [TenBPEN], [MoTa], [TrangThai]) VALUES (10, N'Cap cuu', 2, N'Emmergency', N'', 1)
INSERT [dbo].[BoPhan] ([MaBP], [TenBP], [MaDV], [TenBPEN], [MoTa], [TrangThai]) VALUES (1010, N'Ban giám đóc', 7, N'Ban giam doc', N'', 1)
INSERT [dbo].[BoPhan] ([MaBP], [TenBP], [MaDV], [TenBPEN], [MoTa], [TrangThai]) VALUES (1011, N'bo phan ngoi choi xoi nuoc', 7, N'bo phan ngoi choi xoi nuoc', N'', 1)
SET IDENTITY_INSERT [dbo].[BoPhan] OFF
/****** Object:  Table [dbo].[ViTriCongViec]    Script Date: 06/17/2015 10:48:51 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ViTriCongViec] ON
INSERT [dbo].[ViTriCongViec] ([MaVTCV], [MaBP], [TenVTCV], [TenVTCVEN], [TrangThai], [MoTa], [MoTaEN]) VALUES (1, 1, N'Bac si nhi khoa', N'bac si nhi khoa', 1, N'asdf', N'asdf')
INSERT [dbo].[ViTriCongViec] ([MaVTCV], [MaBP], [TenVTCV], [TenVTCVEN], [TrangThai], [MoTa], [MoTaEN]) VALUES (2, 10, N'Hanh chinh', N'hanh chinh EN', 1, NULL, NULL)
INSERT [dbo].[ViTriCongViec] ([MaVTCV], [MaBP], [TenVTCV], [TenVTCVEN], [TrangThai], [MoTa], [MoTaEN]) VALUES (3, 4, N'Khong lam gi', N'khong lam gi', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ViTriCongViec] OFF
/****** Object:  Table [dbo].[NhanVien]    Script Date: 06/17/2015 10:48:51 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
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
/****** Object:  Table [dbo].[BieuMauDanhGia]    Script Date: 06/17/2015 10:48:51 ******/
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
 CONSTRAINT [PK_BieuMauDanhGia] PRIMARY KEY CLUSTERED 
(
	[MaBM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BieuMauDanhGia] ON
INSERT [dbo].[BieuMauDanhGia] ([MaBM], [MaVTCV], [TenBM], [TenBMEN], [Chon], [NgayTao], [MoTa], [MoTaEN], [MaDV]) VALUES (1, 1, N'biểu mẫu mới', N'', 1, NULL, NULL, NULL, 1)
INSERT [dbo].[BieuMauDanhGia] ([MaBM], [MaVTCV], [TenBM], [TenBMEN], [Chon], [NgayTao], [MoTa], [MoTaEN], [MaDV]) VALUES (2, 1, N'sssss', N'', 0, NULL, NULL, NULL, 1)
INSERT [dbo].[BieuMauDanhGia] ([MaBM], [MaVTCV], [TenBM], [TenBMEN], [Chon], [NgayTao], [MoTa], [MoTaEN], [MaDV]) VALUES (3, 1, N'dfsaf', N'', 0, NULL, NULL, NULL, 1)
INSERT [dbo].[BieuMauDanhGia] ([MaBM], [MaVTCV], [TenBM], [TenBMEN], [Chon], [NgayTao], [MoTa], [MoTaEN], [MaDV]) VALUES (4, 3, N'dfsafddd', N'', 0, NULL, NULL, NULL, 1)
INSERT [dbo].[BieuMauDanhGia] ([MaBM], [MaVTCV], [TenBM], [TenBMEN], [Chon], [NgayTao], [MoTa], [MoTaEN], [MaDV]) VALUES (5, 3, N'dfsafddd dsf', N'', 0, NULL, NULL, NULL, 1)
INSERT [dbo].[BieuMauDanhGia] ([MaBM], [MaVTCV], [TenBM], [TenBMEN], [Chon], [NgayTao], [MoTa], [MoTaEN], [MaDV]) VALUES (6, 3, N'ds safsfas asf', N'', 0, NULL, NULL, NULL, 1)
INSERT [dbo].[BieuMauDanhGia] ([MaBM], [MaVTCV], [TenBM], [TenBMEN], [Chon], [NgayTao], [MoTa], [MoTaEN], [MaDV]) VALUES (7, 1, N'biểu mẫu mới lu o day ah?', N'', 0, NULL, NULL, NULL, 1)
INSERT [dbo].[BieuMauDanhGia] ([MaBM], [MaVTCV], [TenBM], [TenBMEN], [Chon], [NgayTao], [MoTa], [MoTaEN], [MaDV]) VALUES (8, 1, N'biểu mẫu mới', N'', 0, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[BieuMauDanhGia] OFF
/****** Object:  Table [dbo].[KetQuaDanhGia]    Script Date: 06/17/2015 10:48:51 ******/
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
	[MaCK] [int] NULL,
	[MaBM] [int] NULL,
 CONSTRAINT [PK_KetQuaDanhGia] PRIMARY KEY CLUSTERED 
(
	[MaKQDG] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 06/17/2015 10:48:51 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CapDoTieuChi]    Script Date: 06/17/2015 10:48:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CapDoTieuChi](
	[MaCD] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](max) NULL,
	[TenEN] [nvarchar](max) NULL,
	[GiaTri] [int] NOT NULL,
	[DonViTinh] [nchar](10) NULL,
	[MoTa] [nvarchar](max) NULL,
	[MaDV] [int] NOT NULL,
	[Chon] [bit] NOT NULL,
 CONSTRAINT [PK_Diem] PRIMARY KEY CLUSTERED 
(
	[MaCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CapDoTieuChi] ON
INSERT [dbo].[CapDoTieuChi] ([MaCD], [Ten], [TenEN], [GiaTri], [DonViTinh], [MoTa], [MaDV], [Chon]) VALUES (1, N'University', N'University', 0, NULL, N'Rất yếu', 1, 1)
INSERT [dbo].[CapDoTieuChi] ([MaCD], [Ten], [TenEN], [GiaTri], [DonViTinh], [MoTa], [MaDV], [Chon]) VALUES (2, N'Master', N'Master', 1, NULL, N'Yếu', 1, 1)
INSERT [dbo].[CapDoTieuChi] ([MaCD], [Ten], [TenEN], [GiaTri], [DonViTinh], [MoTa], [MaDV], [Chon]) VALUES (3, N'PhD', N'PhD', 2, NULL, N'Trung bình', 1, 1)
INSERT [dbo].[CapDoTieuChi] ([MaCD], [Ten], [TenEN], [GiaTri], [DonViTinh], [MoTa], [MaDV], [Chon]) VALUES (4, N'Prof', N'Prof', 3, NULL, N'Tốt', 1, 1)
INSERT [dbo].[CapDoTieuChi] ([MaCD], [Ten], [TenEN], [GiaTri], [DonViTinh], [MoTa], [MaDV], [Chon]) VALUES (5, N'< 5 years', N'< 5 years ', 0, NULL, N'Không đạt yêu cầu', 1, 1)
INSERT [dbo].[CapDoTieuChi] ([MaCD], [Ten], [TenEN], [GiaTri], [DonViTinh], [MoTa], [MaDV], [Chon]) VALUES (7, N'5-9 years', N'5-9 years', 1, NULL, N'Đạt yêu cầu', 1, 1)
INSERT [dbo].[CapDoTieuChi] ([MaCD], [Ten], [TenEN], [GiaTri], [DonViTinh], [MoTa], [MaDV], [Chon]) VALUES (9, N'>= 10 years', N'>= 10 years', 2, NULL, N'Trên Mức Yêu Cầu', 1, 1)
INSERT [dbo].[CapDoTieuChi] ([MaCD], [Ten], [TenEN], [GiaTri], [DonViTinh], [MoTa], [MaDV], [Chon]) VALUES (11, N'Không đạt yêu cầu', N'không đạt yêu cầu', 50, N'%         ', NULL, 1, 1)
INSERT [dbo].[CapDoTieuChi] ([MaCD], [Ten], [TenEN], [GiaTri], [DonViTinh], [MoTa], [MaDV], [Chon]) VALUES (12, N'Đạt yêu cầu', N'Đạt yêu cầu', 75, N'%         ', NULL, 1, 1)
INSERT [dbo].[CapDoTieuChi] ([MaCD], [Ten], [TenEN], [GiaTri], [DonViTinh], [MoTa], [MaDV], [Chon]) VALUES (14, N'Trên yêu cầu', NULL, 100, N'%         ', NULL, 1, 1)
INSERT [dbo].[CapDoTieuChi] ([MaCD], [Ten], [TenEN], [GiaTri], [DonViTinh], [MoTa], [MaDV], [Chon]) VALUES (16, N'test', NULL, 3, N'%         ', N'test test', 1, 0)
INSERT [dbo].[CapDoTieuChi] ([MaCD], [Ten], [TenEN], [GiaTri], [DonViTinh], [MoTa], [MaDV], [Chon]) VALUES (17, N'testing 1', NULL, 5, N'%         ', N'testing 111', 1, 0)
INSERT [dbo].[CapDoTieuChi] ([MaCD], [Ten], [TenEN], [GiaTri], [DonViTinh], [MoTa], [MaDV], [Chon]) VALUES (18, N'abc ddd', NULL, 9, N'%         ', N'', 1, 0)
SET IDENTITY_INSERT [dbo].[CapDoTieuChi] OFF
/****** Object:  Table [dbo].[NhomTieuChi]    Script Date: 06/17/2015 10:48:51 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[NhomTieuChi] ON
INSERT [dbo].[NhomTieuChi] ([MaNTC], [MaDV], [TenNTC], [TenNTCEN], [TrongSo], [MoTa], [Chon]) VALUES (1, 1, N'KIẾN THỨC', N'khong biet', 30, N'30%', 1)
INSERT [dbo].[NhomTieuChi] ([MaNTC], [MaDV], [TenNTC], [TenNTCEN], [TrongSo], [MoTa], [Chon]) VALUES (2, 1, N'KỸ NĂNG VÀ KINH NGHIỆM CHUYÊN MÔN TRỰC - CẤP CỨU', N'khong biet', 30, N'30%', 1)
INSERT [dbo].[NhomTieuChi] ([MaNTC], [MaDV], [TenNTC], [TenNTCEN], [TrongSo], [MoTa], [Chon]) VALUES (3, 1, N'THÁI ĐỘ THỰC HIỆN CÔNG VIỆC', N'khong biet', 20, N'20%', 1)
INSERT [dbo].[NhomTieuChi] ([MaNTC], [MaDV], [TenNTC], [TenNTCEN], [TrongSo], [MoTa], [Chon]) VALUES (4, 1, N'KẾT QUẢ HOẠT ĐỘNG CHUYÊN MÔN', N'khong biet', 20, N'20%', 1)
INSERT [dbo].[NhomTieuChi] ([MaNTC], [MaDV], [TenNTC], [TenNTCEN], [TrongSo], [MoTa], [Chon]) VALUES (5, 1, N'test nhom tieu cho', NULL, 20, N'teste', 1)
SET IDENTITY_INSERT [dbo].[NhomTieuChi] OFF
/****** Object:  Table [dbo].[AdminDV]    Script Date: 06/17/2015 10:48:51 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AdminDV] ([MaDV], [TenDN], [HoTen], [GioiTinh], [NgaySinh], [MatKhauMD], [Hinh], [Email], [DienThoai], [TrangThai], [MaVTCV]) VALUES (1, N'GiaDinh', N'Admin Gia Dinh', 1, NULL, N'', NULL, N'admingd@gmail.com', N'23345', 1, NULL)
/****** Object:  Table [dbo].[TieuChi]    Script Date: 06/17/2015 10:48:51 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TieuChi] ON
INSERT [dbo].[TieuChi] ([MaTC], [MaNTC], [MaDTTC], [TenTC], [TenTCEN], [TrongSo], [MoTa], [MaTCCha], [Chon]) VALUES (1, 1, NULL, N'TRÌNH ĐỘ CHUYÊN MÔN', NULL, 50, N'50% trong 30%', NULL, 0)
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
/****** Object:  Table [dbo].[ChiTietDanhGia]    Script Date: 06/17/2015 10:48:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDanhGia](
	[MaCTDG] [int] IDENTITY(1,1) NOT NULL,
	[MaTCDV] [int] NOT NULL,
	[MaCD] [int] NOT NULL,
	[MaKQDG] [int] NOT NULL,
 CONSTRAINT [PK_ChiTietDanhGia] PRIMARY KEY CLUSTERED 
(
	[MaCTDG] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NgoaiNguCuaNhanVien]    Script Date: 06/17/2015 10:48:51 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TieuChiTheoBieuMau]    Script Date: 06/17/2015 10:48:51 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TieuChiTheoBieuMau] ON
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (1, 7, 2, 23, 0)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (2, 7, 1, 30, 0)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (3, 7, 9, 6, 0)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (4, 7, 20, 4, 0)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (5, 7, 35, 40, 0)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (6, 7, 34, 40, 0)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (7, 7, 5, 40, 0)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (8, 1, 2, 40, 0)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (9, 1, 3, 10, 0)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (10, 1, 39, 10, 0)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (11, 2, 39, 10, 0)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (12, 3, 41, 10, 0)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (13, 6, 40, 20, 0)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (22, 1, 43, 20, 0)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (23, 3, 1, 50, 0)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (24, 3, 2, 40, 0)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (25, 3, 3, 10, 0)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (26, 3, 4, 40, 0)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (27, 7, 36, 30, 0)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (28, 7, 37, 20, 0)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (29, 7, 39, 10, 0)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (30, 7, 40, 20, 0)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (31, 7, 3, 10, 0)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (32, 7, 4, 40, 0)
INSERT [dbo].[TieuChiTheoBieuMau] ([Ma], [MaBM], [MaTC], [TrongSo], [Chon]) VALUES (33, 7, 7, 20, 0)
SET IDENTITY_INSERT [dbo].[TieuChiTheoBieuMau] OFF
/****** Object:  Table [dbo].[CapDoTheoTieuChi]    Script Date: 06/17/2015 10:48:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CapDoTheoTieuChi](
	[Ma] [int] IDENTITY(1,1) NOT NULL,
	[MaCD] [int] NOT NULL,
	[MaTC] [int] NOT NULL,
	[GiaTri] [int] NOT NULL,
	[Chon] [bit] NOT NULL,
 CONSTRAINT [PK_DiemTheoTieuChi] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CapDoTheoTieuChi] ON
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (1, 1, 1, 30, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (2, 2, 1, 5, 0)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (3, 3, 1, 3, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (4, 4, 1, 4, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (5, 1, 2, 1, 1)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (9, 5, 1, 0, 0)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (10, 7, 1, 1, 0)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (11, 9, 1, 2, 0)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (12, 16, 1, 9, 0)
INSERT [dbo].[CapDoTheoTieuChi] ([Ma], [MaCD], [MaTC], [GiaTri], [Chon]) VALUES (13, 17, 1, 9, 0)
SET IDENTITY_INSERT [dbo].[CapDoTheoTieuChi] OFF
/****** Object:  Default [DF_DonVi_TongSoTK]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[DonVi] ADD  CONSTRAINT [DF_DonVi_TongSoTK]  DEFAULT ((0)) FOR [TongSoTK]
GO
/****** Object:  Default [DF_ChuKyDanhGia_TrangThai]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[ChuKyDanhGia] ADD  CONSTRAINT [DF_ChuKyDanhGia_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
GO
/****** Object:  Default [DF_BoPhan_TrangThai]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[BoPhan] ADD  CONSTRAINT [DF_BoPhan_TrangThai]  DEFAULT ((1)) FOR [TrangThai]
GO
/****** Object:  Default [DF_ViTriCongViec_TrangThai]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[ViTriCongViec] ADD  CONSTRAINT [DF_ViTriCongViec_TrangThai]  DEFAULT ((1)) FOR [TrangThai]
GO
/****** Object:  Default [DF_NhanVien_TrangThai]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [DF_NhanVien_TrangThai]  DEFAULT ((1)) FOR [TrangThai]
GO
/****** Object:  Default [DF_BieuMauDanhGia_Chon]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[BieuMauDanhGia] ADD  CONSTRAINT [DF_BieuMauDanhGia_Chon]  DEFAULT ((1)) FOR [Chon]
GO
/****** Object:  Default [DF_KetQuaDanhGia_CoHieuLuc]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[KetQuaDanhGia] ADD  CONSTRAINT [DF_KetQuaDanhGia_CoHieuLuc]  DEFAULT ((1)) FOR [CoHieuLuc]
GO
/****** Object:  Default [DF_KetQuaDanhGia_HienThi]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[KetQuaDanhGia] ADD  CONSTRAINT [DF_KetQuaDanhGia_HienThi]  DEFAULT ((1)) FOR [HienThi]
GO
/****** Object:  Default [DF_CapDoTieuChi_Chon]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[CapDoTieuChi] ADD  CONSTRAINT [DF_CapDoTieuChi_Chon]  DEFAULT ((1)) FOR [Chon]
GO
/****** Object:  Default [DF_NhomTieuChi_TrongSo]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[NhomTieuChi] ADD  CONSTRAINT [DF_NhomTieuChi_TrongSo]  DEFAULT ((0)) FOR [TrongSo]
GO
/****** Object:  Default [DF_NhomTieuChi_Chon]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[NhomTieuChi] ADD  CONSTRAINT [DF_NhomTieuChi_Chon]  DEFAULT ((1)) FOR [Chon]
GO
/****** Object:  Default [DF_AdminDV_TrangThai]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[AdminDV] ADD  CONSTRAINT [DF_AdminDV_TrangThai]  DEFAULT ((1)) FOR [TrangThai]
GO
/****** Object:  Default [DF_TieuChi_Chon]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[TieuChi] ADD  CONSTRAINT [DF_TieuChi_Chon]  DEFAULT ((1)) FOR [Chon]
GO
/****** Object:  Default [DF_TieuChiTheoBieuMau_Chon]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[TieuChiTheoBieuMau] ADD  CONSTRAINT [DF_TieuChiTheoBieuMau_Chon]  DEFAULT ((1)) FOR [Chon]
GO
/****** Object:  Default [DF_DiemTheoTieuChi_Chon]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[CapDoTheoTieuChi] ADD  CONSTRAINT [DF_DiemTheoTieuChi_Chon]  DEFAULT ((1)) FOR [Chon]
GO
/****** Object:  ForeignKey [FK_ChuKyDanhGia_Donvi]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[ChuKyDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_ChuKyDanhGia_Donvi] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DonVi] ([MaDV])
GO
ALTER TABLE [dbo].[ChuKyDanhGia] CHECK CONSTRAINT [FK_ChuKyDanhGia_Donvi]
GO
/****** Object:  ForeignKey [FK_ChuyenMon_Donvi]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[ChuyenMon]  WITH CHECK ADD  CONSTRAINT [FK_ChuyenMon_Donvi] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DonVi] ([MaDV])
GO
ALTER TABLE [dbo].[ChuyenMon] CHECK CONSTRAINT [FK_ChuyenMon_Donvi]
GO
/****** Object:  ForeignKey [FK_VaiTro_Donvi]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[VaiTro]  WITH CHECK ADD  CONSTRAINT [FK_VaiTro_Donvi] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DonVi] ([MaDV])
GO
ALTER TABLE [dbo].[VaiTro] CHECK CONSTRAINT [FK_VaiTro_Donvi]
GO
/****** Object:  ForeignKey [FK_BoPhan_Donvi]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[BoPhan]  WITH CHECK ADD  CONSTRAINT [FK_BoPhan_Donvi] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DonVi] ([MaDV])
GO
ALTER TABLE [dbo].[BoPhan] CHECK CONSTRAINT [FK_BoPhan_Donvi]
GO
/****** Object:  ForeignKey [FK_ViTriCongViec_BoPhan]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[ViTriCongViec]  WITH CHECK ADD  CONSTRAINT [FK_ViTriCongViec_BoPhan] FOREIGN KEY([MaBP])
REFERENCES [dbo].[BoPhan] ([MaBP])
GO
ALTER TABLE [dbo].[ViTriCongViec] CHECK CONSTRAINT [FK_ViTriCongViec_BoPhan]
GO
/****** Object:  ForeignKey [FK_NhanVien_ChuyenMon]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ChuyenMon] FOREIGN KEY([MaCM])
REFERENCES [dbo].[ChuyenMon] ([MaCM])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_ChuyenMon]
GO
/****** Object:  ForeignKey [FK_NhanVien_VaiTro]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_VaiTro] FOREIGN KEY([MaVT])
REFERENCES [dbo].[VaiTro] ([MaVT])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_VaiTro]
GO
/****** Object:  ForeignKey [FK_NhanVien_ViTriCongViec]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ViTriCongViec] FOREIGN KEY([MaVTCV])
REFERENCES [dbo].[ViTriCongViec] ([MaVTCV])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_ViTriCongViec]
GO
/****** Object:  ForeignKey [FK_BieuMauDanhGia_Donvi]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[BieuMauDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_BieuMauDanhGia_Donvi] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DonVi] ([MaDV])
GO
ALTER TABLE [dbo].[BieuMauDanhGia] CHECK CONSTRAINT [FK_BieuMauDanhGia_Donvi]
GO
/****** Object:  ForeignKey [FK_BieuMauDanhGia_ViTriCongViec]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[BieuMauDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_BieuMauDanhGia_ViTriCongViec] FOREIGN KEY([MaVTCV])
REFERENCES [dbo].[ViTriCongViec] ([MaVTCV])
GO
ALTER TABLE [dbo].[BieuMauDanhGia] CHECK CONSTRAINT [FK_BieuMauDanhGia_ViTriCongViec]
GO
/****** Object:  ForeignKey [FK_KetQuaDanhGia_BieuMauDanhGia]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[KetQuaDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_KetQuaDanhGia_BieuMauDanhGia] FOREIGN KEY([MaBM])
REFERENCES [dbo].[BieuMauDanhGia] ([MaBM])
GO
ALTER TABLE [dbo].[KetQuaDanhGia] CHECK CONSTRAINT [FK_KetQuaDanhGia_BieuMauDanhGia]
GO
/****** Object:  ForeignKey [FK_KetQuaDanhGia_ChuKyDanhGia]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[KetQuaDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_KetQuaDanhGia_ChuKyDanhGia] FOREIGN KEY([MaCK])
REFERENCES [dbo].[ChuKyDanhGia] ([MaCK])
GO
ALTER TABLE [dbo].[KetQuaDanhGia] CHECK CONSTRAINT [FK_KetQuaDanhGia_ChuKyDanhGia]
GO
/****** Object:  ForeignKey [FK_KetQuaDanhGia_NhanVien]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[KetQuaDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_KetQuaDanhGia_NhanVien] FOREIGN KEY([NguoiDuocDG])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[KetQuaDanhGia] CHECK CONSTRAINT [FK_KetQuaDanhGia_NhanVien]
GO
/****** Object:  ForeignKey [FK_KetQuaDanhGia_NhanVien1]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[KetQuaDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_KetQuaDanhGia_NhanVien1] FOREIGN KEY([NguoiDG])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[KetQuaDanhGia] CHECK CONSTRAINT [FK_KetQuaDanhGia_NhanVien1]
GO
/****** Object:  ForeignKey [FK_Quyen_DanhMucQuanTri]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[Quyen]  WITH CHECK ADD  CONSTRAINT [FK_Quyen_DanhMucQuanTri] FOREIGN KEY([MaDM])
REFERENCES [dbo].[DanhMucQuanTri] ([MaDM])
GO
ALTER TABLE [dbo].[Quyen] CHECK CONSTRAINT [FK_Quyen_DanhMucQuanTri]
GO
/****** Object:  ForeignKey [FK_Quyen_VaiTro]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[Quyen]  WITH CHECK ADD  CONSTRAINT [FK_Quyen_VaiTro] FOREIGN KEY([MaVT])
REFERENCES [dbo].[VaiTro] ([MaVT])
GO
ALTER TABLE [dbo].[Quyen] CHECK CONSTRAINT [FK_Quyen_VaiTro]
GO
/****** Object:  ForeignKey [FK_CapDoTieuChi_DonVi]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[CapDoTieuChi]  WITH CHECK ADD  CONSTRAINT [FK_CapDoTieuChi_DonVi] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DonVi] ([MaDV])
GO
ALTER TABLE [dbo].[CapDoTieuChi] CHECK CONSTRAINT [FK_CapDoTieuChi_DonVi]
GO
/****** Object:  ForeignKey [FK_NhomTieuChi_Donvi]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[NhomTieuChi]  WITH CHECK ADD  CONSTRAINT [FK_NhomTieuChi_Donvi] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DonVi] ([MaDV])
GO
ALTER TABLE [dbo].[NhomTieuChi] CHECK CONSTRAINT [FK_NhomTieuChi_Donvi]
GO
/****** Object:  ForeignKey [FK_AdminDV_Donvi]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[AdminDV]  WITH CHECK ADD  CONSTRAINT [FK_AdminDV_Donvi] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DonVi] ([MaDV])
GO
ALTER TABLE [dbo].[AdminDV] CHECK CONSTRAINT [FK_AdminDV_Donvi]
GO
/****** Object:  ForeignKey [FK_AdminDV_ViTriCongViec]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[AdminDV]  WITH CHECK ADD  CONSTRAINT [FK_AdminDV_ViTriCongViec] FOREIGN KEY([MaVTCV])
REFERENCES [dbo].[ViTriCongViec] ([MaVTCV])
GO
ALTER TABLE [dbo].[AdminDV] CHECK CONSTRAINT [FK_AdminDV_ViTriCongViec]
GO
/****** Object:  ForeignKey [FK_TieuChi_NhomTieuChi]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[TieuChi]  WITH CHECK ADD  CONSTRAINT [FK_TieuChi_NhomTieuChi] FOREIGN KEY([MaNTC])
REFERENCES [dbo].[NhomTieuChi] ([MaNTC])
GO
ALTER TABLE [dbo].[TieuChi] CHECK CONSTRAINT [FK_TieuChi_NhomTieuChi]
GO
/****** Object:  ForeignKey [FK_TieuChi_TieuChi]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[TieuChi]  WITH CHECK ADD  CONSTRAINT [FK_TieuChi_TieuChi] FOREIGN KEY([MaTCCha])
REFERENCES [dbo].[TieuChi] ([MaTC])
GO
ALTER TABLE [dbo].[TieuChi] CHECK CONSTRAINT [FK_TieuChi_TieuChi]
GO
/****** Object:  ForeignKey [FK_ChiTietDanhGia_KetQuaDanhGia]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[ChiTietDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDanhGia_KetQuaDanhGia] FOREIGN KEY([MaKQDG])
REFERENCES [dbo].[KetQuaDanhGia] ([MaKQDG])
GO
ALTER TABLE [dbo].[ChiTietDanhGia] CHECK CONSTRAINT [FK_ChiTietDanhGia_KetQuaDanhGia]
GO
/****** Object:  ForeignKey [FK_ChiTietDanhGia_TieuChi]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[ChiTietDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDanhGia_TieuChi] FOREIGN KEY([MaTCDV])
REFERENCES [dbo].[TieuChi] ([MaTC])
GO
ALTER TABLE [dbo].[ChiTietDanhGia] CHECK CONSTRAINT [FK_ChiTietDanhGia_TieuChi]
GO
/****** Object:  ForeignKey [FK_NgoaiNguCuaNhanVien_NgoaiNgu]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[NgoaiNguCuaNhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NgoaiNguCuaNhanVien_NgoaiNgu] FOREIGN KEY([MaNN])
REFERENCES [dbo].[NgoaiNgu] ([MaNN])
GO
ALTER TABLE [dbo].[NgoaiNguCuaNhanVien] CHECK CONSTRAINT [FK_NgoaiNguCuaNhanVien_NgoaiNgu]
GO
/****** Object:  ForeignKey [FK_NgoaiNguCuaNhanVien_NhanVien]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[NgoaiNguCuaNhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NgoaiNguCuaNhanVien_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[NgoaiNguCuaNhanVien] CHECK CONSTRAINT [FK_NgoaiNguCuaNhanVien_NhanVien]
GO
/****** Object:  ForeignKey [FK_TieuChiTheoBieuMau_BieuMauDanhGia]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[TieuChiTheoBieuMau]  WITH CHECK ADD  CONSTRAINT [FK_TieuChiTheoBieuMau_BieuMauDanhGia] FOREIGN KEY([MaBM])
REFERENCES [dbo].[BieuMauDanhGia] ([MaBM])
GO
ALTER TABLE [dbo].[TieuChiTheoBieuMau] CHECK CONSTRAINT [FK_TieuChiTheoBieuMau_BieuMauDanhGia]
GO
/****** Object:  ForeignKey [FK_TieuChiTheoBieuMau_TieuChi]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[TieuChiTheoBieuMau]  WITH CHECK ADD  CONSTRAINT [FK_TieuChiTheoBieuMau_TieuChi] FOREIGN KEY([MaTC])
REFERENCES [dbo].[TieuChi] ([MaTC])
GO
ALTER TABLE [dbo].[TieuChiTheoBieuMau] CHECK CONSTRAINT [FK_TieuChiTheoBieuMau_TieuChi]
GO
/****** Object:  ForeignKey [FK_DiemTheoTieuChi_Diem1]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[CapDoTheoTieuChi]  WITH CHECK ADD  CONSTRAINT [FK_DiemTheoTieuChi_Diem1] FOREIGN KEY([MaCD])
REFERENCES [dbo].[CapDoTieuChi] ([MaCD])
GO
ALTER TABLE [dbo].[CapDoTheoTieuChi] CHECK CONSTRAINT [FK_DiemTheoTieuChi_Diem1]
GO
/****** Object:  ForeignKey [FK_DiemTheoTieuChi_TieuChi]    Script Date: 06/17/2015 10:48:51 ******/
ALTER TABLE [dbo].[CapDoTheoTieuChi]  WITH CHECK ADD  CONSTRAINT [FK_DiemTheoTieuChi_TieuChi] FOREIGN KEY([MaTC])
REFERENCES [dbo].[TieuChi] ([MaTC])
GO
ALTER TABLE [dbo].[CapDoTheoTieuChi] CHECK CONSTRAINT [FK_DiemTheoTieuChi_TieuChi]
GO
