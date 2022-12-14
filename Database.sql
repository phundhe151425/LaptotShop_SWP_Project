USE [PROJECT_SWP391_SUMMER2022]
GO
/****** Object:  FullTextCatalog [Fulltext_Account]    Script Date: 7/20/2022 10:19:12 PM ******/
CREATE FULLTEXT CATALOG [Fulltext_Account] WITH ACCENT_SENSITIVITY = OFF
GO
/****** Object:  FullTextCatalog [Fulltext_Blog]    Script Date: 7/20/2022 10:19:12 PM ******/
CREATE FULLTEXT CATALOG [Fulltext_Blog] WITH ACCENT_SENSITIVITY = OFF
GO
/****** Object:  FullTextCatalog [Fulltext_Feedback]    Script Date: 7/20/2022 10:19:13 PM ******/
CREATE FULLTEXT CATALOG [Fulltext_Feedback] WITH ACCENT_SENSITIVITY = ON
GO
/****** Object:  FullTextCatalog [Fulltext_Order]    Script Date: 7/20/2022 10:19:13 PM ******/
CREATE FULLTEXT CATALOG [Fulltext_Order] WITH ACCENT_SENSITIVITY = OFF
GO
/****** Object:  FullTextCatalog [Fulltext_Product]    Script Date: 7/20/2022 10:19:13 PM ******/
CREATE FULLTEXT CATALOG [Fulltext_Product] WITH ACCENT_SENSITIVITY = OFF
AS DEFAULT
GO
/****** Object:  FullTextCatalog [Fulltext_Setting]    Script Date: 7/20/2022 10:19:13 PM ******/
CREATE FULLTEXT CATALOG [Fulltext_Setting] WITH ACCENT_SENSITIVITY = ON
GO
/****** Object:  FullTextCatalog [Fulltext_Slider]    Script Date: 7/20/2022 10:19:13 PM ******/
CREATE FULLTEXT CATALOG [Fulltext_Slider] WITH ACCENT_SENSITIVITY = OFF
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/20/2022 10:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Account_ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](30) NOT NULL,
	[Password] [varchar](30) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Gender] [bit] NULL,
	[Email] [varchar](255) NULL,
	[Phone] [varchar](30) NULL,
	[Address] [nvarchar](max) NULL,
	[Role_ID] [int] NULL,
	[Account_Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Account_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 7/20/2022 10:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[Blog_ID] [int] IDENTITY(1,1) NOT NULL,
	[ImgURL] [varchar](255) NULL,
	[AuthorName] [nvarchar](50) NULL,
	[Title] [nvarchar](255) NULL,
	[Content] [nvarchar](max) NULL,
	[CreateDate] [date] NULL,
	[ModifiedDate] [date] NULL,
	[Blog_Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Blog_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 7/20/2022 10:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Brand_ID] [int] IDENTITY(1,1) NOT NULL,
	[Brand_Name] [varchar](50) NULL,
	[Brand_Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Brand_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Capacity]    Script Date: 7/20/2022 10:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Capacity](
	[Capacity_ID] [int] IDENTITY(1,1) NOT NULL,
	[Capacity_Name] [nvarchar](50) NULL,
	[Capacity_Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Capacity_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Card]    Script Date: 7/20/2022 10:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[Card_ID] [int] IDENTITY(1,1) NOT NULL,
	[Card_Name] [nvarchar](50) NULL,
	[Card_Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Card_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/20/2022 10:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Category_ID] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [nvarchar](50) NULL,
	[Category_Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CPU]    Script Date: 7/20/2022 10:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CPU](
	[CPU_ID] [int] IDENTITY(1,1) NOT NULL,
	[CPU_Name] [nvarchar](50) NULL,
	[CPU_Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CPU_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Display]    Script Date: 7/20/2022 10:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Display](
	[Display_ID] [int] IDENTITY(1,1) NOT NULL,
	[Display_Name] [nvarchar](50) NULL,
	[Disolay_Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Display_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 7/20/2022 10:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Feedback_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_ID] [int] NULL,
	[Account_ID] [int] NULL,
	[Content] [varchar](max) NULL,
	[RateStar] [tinyint] NULL,
	[CreateDate] [date] NULL,
	[Feedback_Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Feedback_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageBlog]    Script Date: 7/20/2022 10:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageBlog](
	[Image_ID] [int] IDENTITY(1,1) NOT NULL,
	[Blog_ID] [int] NULL,
	[ImgURL] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Image_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageProduct]    Script Date: 7/20/2022 10:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageProduct](
	[Image_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_ID] [int] NULL,
	[ImgURL] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Image_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperatingSystem]    Script Date: 7/20/2022 10:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperatingSystem](
	[OS_ID] [int] IDENTITY(1,1) NOT NULL,
	[OS_Name] [nvarchar](50) NULL,
	[OS_Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[OS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/20/2022 10:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[Account_ID] [int] NULL,
	[Order_Date] [date] NULL,
	[CustomerName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [varchar](11) NULL,
	[Email] [varchar](max) NULL,
	[TotalMoney] [money] NULL,
	[Order_Note] [varchar](max) NULL,
	[Order_Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/20/2022 10:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Order_ID] [int] NULL,
	[Product_ID] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/20/2022 10:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Name] [nvarchar](50) NULL,
	[Product_Price] [money] NULL,
	[Discount] [float] NULL,
	[Product_SalePrice] [money] NULL,
	[Product_Quantity] [int] NULL,
	[Product_ImgURL] [varchar](255) NULL,
	[Product_Description] [nvarchar](max) NULL,
	[Brand_ID] [int] NULL,
	[Category_ID] [int] NULL,
	[OS_ID] [int] NULL,
	[RAM_ID] [int] NULL,
	[CPU_ID] [int] NULL,
	[Display_ID] [int] NULL,
	[Capacity_ID] [int] NULL,
	[Card_ID] [int] NULL,
	[Product_CreateDate] [date] NULL,
	[Product_Status] [bit] NULL,
	[Product_ModifyDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RAM]    Script Date: 7/20/2022 10:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RAM](
	[RAM_ID] [int] IDENTITY(1,1) NOT NULL,
	[RAM_Name] [nvarchar](50) NULL,
	[RAM_Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[RAM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Account]    Script Date: 7/20/2022 10:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Account](
	[Role_ID] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Setting]    Script Date: 7/20/2022 10:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Setting](
	[Setting_ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](max) NULL,
	[Value] [nvarchar](max) NULL,
	[Order] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Setting_Status] [bit] NULL,
 CONSTRAINT [PK_Setting] PRIMARY KEY CLUSTERED 
(
	[Setting_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 7/20/2022 10:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[Slide_ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Content] [nvarchar](max) NULL,
	[ImgURL] [varchar](255) NULL,
	[Slide_Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Slide_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Account_ID], [Username], [Password], [Name], [Gender], [Email], [Phone], [Address], [Role_ID], [Account_Status]) VALUES (1, N'giang31', N'giang31', N'Phạm Minh Giang', 0, N'gianggg@gmail.com', N'0988888888', N'Hung Yen', 2, 0)
INSERT [dbo].[Account] ([Account_ID], [Username], [Password], [Name], [Gender], [Email], [Phone], [Address], [Role_ID], [Account_Status]) VALUES (2, N'hanh44', N'hanh44', N'Võ Thị Hồng Hạnh', 0, N'hanh@gmail.com', N'000000000', N'Nghe An', 2, 0)
INSERT [dbo].[Account] ([Account_ID], [Username], [Password], [Name], [Gender], [Email], [Phone], [Address], [Role_ID], [Account_Status]) VALUES (3, N'son19', N'son19', N'Do Dinh Son', 1, N'son@gmail.com', N'0191919191', N'Hai Phong', 4, 1)
INSERT [dbo].[Account] ([Account_ID], [Username], [Password], [Name], [Gender], [Email], [Phone], [Address], [Role_ID], [Account_Status]) VALUES (4, N'thinh97', N'thinh97', N'Nguyen Duc Thinh', 1, N'ndt97hy@gmail.com', N'0979797979', N'Hung Yen', 2, 1)
INSERT [dbo].[Account] ([Account_ID], [Username], [Password], [Name], [Gender], [Email], [Phone], [Address], [Role_ID], [Account_Status]) VALUES (5, N'admin', N'admin', N'Admin', 1, N'admin@gmail.com', N'0121212121', N'Ha Noi', 1, 0)
INSERT [dbo].[Account] ([Account_ID], [Username], [Password], [Name], [Gender], [Email], [Phone], [Address], [Role_ID], [Account_Status]) VALUES (6, N'phu', N'jHB9jt', N'Nguyen Dinh Phu', 1, N'phundhe151425@fpt.edu.vn', N'0000000000', N'Ha Noi', 2, 0)
INSERT [dbo].[Account] ([Account_ID], [Username], [Password], [Name], [Gender], [Email], [Phone], [Address], [Role_ID], [Account_Status]) VALUES (7, N'thanh', N'thanh', N'Lê Trung Thành', 1, N'thanh@gmail.com', N'1111111111', N'Hung Yen', 4, 1)
INSERT [dbo].[Account] ([Account_ID], [Username], [Password], [Name], [Gender], [Email], [Phone], [Address], [Role_ID], [Account_Status]) VALUES (8, N'phat68', N'123', N'Phạm minh giang', 1, N'giangphampro312001@gmail.com', N'0964156428', N'KTX ĐH FPT Hòa Lạc', 2, 1)
INSERT [dbo].[Account] ([Account_ID], [Username], [Password], [Name], [Gender], [Email], [Phone], [Address], [Role_ID], [Account_Status]) VALUES (9, N'customer', N'customer', N'Customer', 1, N'customer@gmail.com', N'0976755323', N'Hưng Yên', 2, 1)
INSERT [dbo].[Account] ([Account_ID], [Username], [Password], [Name], [Gender], [Email], [Phone], [Address], [Role_ID], [Account_Status]) VALUES (10, N'sale', N'sale', N'Sale', 1, N'sale@gmail.com', N'0986648041', N'Hà Nội', 3, 1)
INSERT [dbo].[Account] ([Account_ID], [Username], [Password], [Name], [Gender], [Email], [Phone], [Address], [Role_ID], [Account_Status]) VALUES (11, N'marketing', N'marketing', N'Marketing', 1, N'marketing@gmail.com', N'0904647054', N'Nghệ An', 4, 1)
INSERT [dbo].[Account] ([Account_ID], [Username], [Password], [Name], [Gender], [Email], [Phone], [Address], [Role_ID], [Account_Status]) VALUES (13, N'customer2', N'customer2', N'Phạm minh giang', 0, N'giangpro312001@gmail.com', N'0964156428', N'KTX ĐH FPT Hòa Lạc', 2, 1)
INSERT [dbo].[Account] ([Account_ID], [Username], [Password], [Name], [Gender], [Email], [Phone], [Address], [Role_ID], [Account_Status]) VALUES (20, N'hanh4454', N'hanh4454', N'Vo Hong Hanh', 1, N'vthhanh44@gmail.com', N'0337199682', N'Nghe An', 2, 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([Blog_ID], [ImgURL], [AuthorName], [Title], [Content], [CreateDate], [ModifiedDate], [Blog_Status]) VALUES (1, N'bestlaptop_800x450.jpg', N'HaoComputer', N'Các dòng laptop tốt nhất 2022 test inter 3', N'Hiện tại, những mẫu laptop 2022 đã có mặt trên thị trường. Nhưng thực ra nó ra mắt từ những năm 2021 và đây có lẽ chính xác hơn những mẫu laptop tốt nhất trong năm 2021 và xu hướng này sẽ không có nhiều thay đổi nếu bạn chọn mua laptop vào năm 2022. Bởi phải đến cuối năm vào mùa giáng sinh năm 2022 thì các nhà sản xuất mới bắt đầu cho ra mắt những thiết bị mới nhất của mình. Và hơn hết thì đây là danh sách những laptop tốt nhất, đáng mua nhất cho năm 2022, vì thế lựa chọn những mẫu tốt nhất, đã được người dùng trải nghiệm và có những đánh giá chi tiết sau khi sử dụng sẽ là những tín nhiệm cao hơn rất nhiều so với những gì nhà bán hàng cung cấp bởi đường dài mới biết ngựa hay, phải sử dụng, trải nghiệm thật kỹ rồi mới biết sản phẩm nào thực sự tốt hay chỉ là những thông số và lời quảng cáo. Một xu hướng quan trọng khác nữa đó chính là hệ điều hành macOS đã được nhiều người quan tâm, sử dụng và nó đáp ứng tốt thậm chí là vượt trội hơn hẳn những gì khách hàng mong đợi. Ngoại trừ những bạn mua máy tính để chơi game, thì còn lại lựa chọn macOS là một lựa chọn tuyệt vời vào thời điểm này. Ví dụ Macbook Air 2020 sử dụng CHIP M1 hiện vẫn là đầu bảng về sự lựa chọn, nhiều người còn đánh giá đây là món hời trong thời kỳ quá độ của Apple từ sử dụng những chip từ hãng khác như Intell sang chip tự sản xuất. Một chiếc máy có thể nói là hoàn hảo dành cho người dùng phổ thông, đồ họa nhẹ nhàng Hoặc một trường hợp khác là Acer Swift 3 là laptop giá rẻ có chất lượng tốt nhất, bỏ qua được những định kiến máy Acer có chất lượng gia công tệ, và laptop Acer giá rẻ là những chiếc máy tệ thì Acer Swift 3  lại là laptop được đánh giá có chất lượng gia công cực kỳ ổn, và giá thì không có đối thủ ở thời điểm hiện tại Những đánh giá và review dưới đây của tiemgo.vn là những đánh giá khách quan nhất, được lựa chọn kỹ lưỡng bởi những chuyên gia đầu ngành trong lĩnh vực máy tính và có thời gian trải nghiệm đủ lâu để đưa ra được ưu điểm và khuyết điểm sản phẩm.', CAST(N'2020-01-01' AS Date), CAST(N'2020-10-11' AS Date), 1)
INSERT [dbo].[Blog] ([Blog_ID], [ImgURL], [AuthorName], [Title], [Content], [CreateDate], [ModifiedDate], [Blog_Status]) VALUES (2, N'8-thuong-hieu-laptop-tot-nhat-dang-so-huu-trong-na-15.jpg', N'tao', N'TOP 10 Laptop Cho Sinh Viên Thiết Kế Đồ Hoạ Tốt Nhất Năm', N'Lựa chọn laptop thiết kế đồ hoạ là 1 điều khó khăn đối với sinh viên. Nên nếu bạn là sinh viên thiết kế đồ hoạ và đang cần kiếm 1 chiếc laptop phù hợp 
với thiết kế đồ hoạ thì đây chính xác là bài viết dành cho bạn. Trong bài viết này bạn sẽ biết được nhu cầu sử dụng laptop của sinh viên thiết kế đồ hoạ, 
làm sao để chọn được 1 chiếc laptop thiết kế đồ hoạ phù hợp với bản thân và TOP 10 laptop cho sinh viên thiết đồ hoạ tốt nhất trong năm 2022. Không dài dòng 
nữa, bắt đầu nào!!!', CAST(N'2021-02-02' AS Date), CAST(N'2021-02-03' AS Date), 1)
INSERT [dbo].[Blog] ([Blog_ID], [ImgURL], [AuthorName], [Title], [Content], [CreateDate], [ModifiedDate], [Blog_Status]) VALUES (3, N'Laptop-MSI-Bravo-15-4.jpg', N'LapTopThings', N'TOP 12 Laptop Cho Sinh 
Viên Sư Phạm Tốt Nhất Năm 2022', N'Nếu bạn đang học khối ngành sư phạm hoặc có thể sắp trở thành giáo viên, giảng viên trong tương lai và đang 
có nhu cầu mua laptop để giảng dạy, chuẩn bị bài vở thì đây chính là bài viết dành cho bạn. Trong bài viết này bạn sẽ biết được nhu cầu sử dụng 
laptop của sinh viên sư phạm, cách chọn laptop cho sinh viên sư phạm trong năm 2022. Và cuối cùng là 12 mẫu laptop tốt nhất dành cho sinh viên sư 
phạm bạn không nên bỏ qua. Tiếp tục đọc nào !!!', CAST(N'2021-03-04' AS Date), CAST(N'2021-05-04' AS Date), 1)
INSERT [dbo].[Blog] ([Blog_ID], [ImgURL], [AuthorName], [Title], [Content], [CreateDate], [ModifiedDate], [Blog_Status]) VALUES (4, N'laptopdellalienwarem15r6p109f001bbl8.jpg', N'tao', N'Các hãng laptop tốt nhất, nổi tiếng nhất 2022', N'Ngày nay có rất nhiều 
hãng laptop bạn có thể lựa chọn, nhưng nếu bạn đang phân vân chưa biết nên chọn thương hiệu laptop nào thì đây chính xác là bài viết dành cho bạn. Trong
bài viết này bạn sẽ biết được các hãng laptop tốt nhất, nổi tiếng nhất hiện nay, sau đó là bảng xếp hạng các thương hiệu laptop. Ngoài ra, bạn còn biết 
được các dòng laptop phổ biến hiện nay, làm sau để chọn được một hãng laptop phù hợp với nhu cầu của bản thân. Cũng như sẽ được giải đáp một số thắc mắc 
khi lựa chọn laptop. Bắt đầu nào!!!', CAST(N'2021-01-01' AS Date), CAST(N'2021-02-01' AS Date), 1)
INSERT [dbo].[Blog] ([Blog_ID], [ImgURL], [AuthorName], [Title], [Content], [CreateDate], [ModifiedDate], [Blog_Status]) VALUES (5, N'4770785_Cover_laptop.jpg', N'JAYSON DANG', N'Top 18 Laptop Cho 
Sinh Viên Ngoại Ngữ Tốt Nhất Năm 2022', N'Bạn đang là sinh viên chuyên ngành ngoại ngữ và đang tìm kiếm laptop dành cho sinh viên ngoại 
ngữ thì đây chính xác là bài viết dành cho bạn. Khi đọc bài viết này, bạn sẽ biết được nhu cầu sử dụng laptop của sinh viên ngoại ngữ, 
cách lựa chọn laptop cho sinh viên ngoại ngữ tốt nhất, đáng mua nhất. Bạn sẽ nắm được Top 12 laptop tốt nhất dành cho sinh viên ngoại ngữ 
trong năm 2022 và được giải đáp một số thắc mắc trước khi chọn mua. Không dài dòng nữa, bắt đầu nào !!!', CAST(N'2022-02-02' AS Date), CAST(N'2022-04-05' AS Date), 0)
INSERT [dbo].[Blog] ([Blog_ID], [ImgURL], [AuthorName], [Title], [Content], [CreateDate], [ModifiedDate], [Blog_Status]) VALUES (6, N'maxresdefault.jpg', N'JAYSON DANG', N'Top 12 Laptop Cho Sinh Viên Y 
Khoa Tốt Nhất năm 2022', N'Nếu bạn đang tìm kiếm laptop dành cho sinh viên y dược thì bài viết này bạn không nên bỏ qua. Trong bài viết này bạn 
sẽ biết được những nhu cầu sử dụng laptop đối với sinh viên y khoa, cách để chọn được laptop phù hợp với sinh viên y khoa với giá tốt nhất, chất
lượng nhất và bài viết cũng sẽ đề xuất [Top 12] laptop cho sinh viên y khoa tốt nhất ở năm 2022, bạn cũng sẽ được giải đáp một số thắc mắc khi 
chọn mua laptop. Bắt đầu xem bài viết nào !!!', CAST(N'2022-04-05' AS Date), CAST(N'2022-05-05' AS Date), 0)
INSERT [dbo].[Blog] ([Blog_ID], [ImgURL], [AuthorName], [Title], [Content], [CreateDate], [ModifiedDate], [Blog_Status]) VALUES (7, N'img6226-1-16386675552821992851335.jpg', N'JAYSON DANG', N'Top 15 Laptop cho 
sinh viên kinh tế tốt nhất năm 2022', N'Nếu bạn đang là sinh viên năm nhất của khối ngành kinh tế thì bài viết này chính xác là dành 
cho bạn. Qua bài viết này bạn sẽ biết được tại sao laptop lại cần thiết đối với sinh viên kinh tế, làm cách nào để chọn được một chiếc 
laptop phù hợp với ngành kinh tế mà tiết kiệm chi phí nhất, bài viết cũng cung cấp [Top 15] laptop cho sinh viên kinh tế tốt nhất trong năm 
2022, cũng như một số câu hỏi thường gặp trong khi lựa chọn laptop. Bắt đầu nào !!!', CAST(N'2022-04-03' AS Date), CAST(N'2022-05-03' AS Date), 1)
INSERT [dbo].[Blog] ([Blog_ID], [ImgURL], [AuthorName], [Title], [Content], [CreateDate], [ModifiedDate], [Blog_Status]) VALUES (8, N'msi-bravo-15-hanoicomputer.jpg', N'JAYSON DANG', N'Top 10 
laptop cho sinh viên CNTT tốt nhất 2022', N'Nếu bạn đang là sinh viên hoặc sắp trở thành sinh viên của ngành công nghệ thông tin thì đây 
đích thực là bài viết dành cho bạn. Qua bài viết này bạn sẽ biết được tại sao laptop lại thứ không thể thiếu đối với sinh viên công nghệ 
thông tin, cấu hình chi tiết, cách chọn laptop cho sinh viên công nghệ thông tin giúp tiết kiệm chi phí nhất và [Top 10] laptop cho sinh viên CNTT
tốt nhất trong năm 2022 cũng như một số câu hỏi bạn có thể thắc mắc. Được rồi, bắt đầu nào !!!', CAST(N'2022-02-02' AS Date), CAST(N'2022-03-02' AS Date), 1)
INSERT [dbo].[Blog] ([Blog_ID], [ImgURL], [AuthorName], [Title], [Content], [CreateDate], [ModifiedDate], [Blog_Status]) VALUES (9, N'laptop-cho-sinh-vien-tot-nhat-theo-tung-nganh.jpg', N'JAYSON DANG', N'Laptop cho sinh viên theo từng ngành và cách chọn chuẩn trong năm 2022', N'Với nhiều sinh viên đặc biệt sinh viên công nghệ thông tin, laptop 
là một phần không thể thiếu trong quá trình học tập và làm việc. Với nhiều bạn, đầu tư một laptop thì ít nhất cũng phải 4 năm, nên cần 
phải lựa chọn đầu tư kỹ lưỡng. Qua bài viết này, các bạn sẽ biết được cách để chọn được một laptop phù hợp với nhu cầu bản thân, một 
chiếc laptop cho sinh viên ngon-bổ-rẻ.', CAST(N'2022-03-03' AS Date), CAST(N'2022-07-19' AS Date), 1)
INSERT [dbo].[Blog] ([Blog_ID], [ImgURL], [AuthorName], [Title], [Content], [CreateDate], [ModifiedDate], [Blog_Status]) VALUES (1028, N'2_1280x720-800-resize.jpg', N'Pham Minh Giang', N'Pham Minh GiangPham Minh Giang', N'Pham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh GiangPham Minh Giang', CAST(N'2022-07-20' AS Date), CAST(N'2022-07-20' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Brand_ID], [Brand_Name], [Brand_Status]) VALUES (1, N'Dell', 1)
INSERT [dbo].[Brand] ([Brand_ID], [Brand_Name], [Brand_Status]) VALUES (2, N'Asus', 1)
INSERT [dbo].[Brand] ([Brand_ID], [Brand_Name], [Brand_Status]) VALUES (3, N'Lenovo', 1)
INSERT [dbo].[Brand] ([Brand_ID], [Brand_Name], [Brand_Status]) VALUES (4, N'MSI', 1)
INSERT [dbo].[Brand] ([Brand_ID], [Brand_Name], [Brand_Status]) VALUES (5, N'Acer', 1)
INSERT [dbo].[Brand] ([Brand_ID], [Brand_Name], [Brand_Status]) VALUES (6, N'HP', 1)
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Capacity] ON 

INSERT [dbo].[Capacity] ([Capacity_ID], [Capacity_Name], [Capacity_Status]) VALUES (1, N'SSD 120GB', 1)
INSERT [dbo].[Capacity] ([Capacity_ID], [Capacity_Name], [Capacity_Status]) VALUES (2, N'SSD 128GB', 1)
INSERT [dbo].[Capacity] ([Capacity_ID], [Capacity_Name], [Capacity_Status]) VALUES (3, N'SSD 240GB', 1)
INSERT [dbo].[Capacity] ([Capacity_ID], [Capacity_Name], [Capacity_Status]) VALUES (4, N'SSD 256GB', 1)
INSERT [dbo].[Capacity] ([Capacity_ID], [Capacity_Name], [Capacity_Status]) VALUES (5, N'SSD 512GB', 1)
INSERT [dbo].[Capacity] ([Capacity_ID], [Capacity_Name], [Capacity_Status]) VALUES (6, N'HDD 500GB', 1)
INSERT [dbo].[Capacity] ([Capacity_ID], [Capacity_Name], [Capacity_Status]) VALUES (7, N'HDD 1TB', 1)
SET IDENTITY_INSERT [dbo].[Capacity] OFF
GO
SET IDENTITY_INSERT [dbo].[Card] ON 

INSERT [dbo].[Card] ([Card_ID], [Card_Name], [Card_Status]) VALUES (1, N'Default', 1)
INSERT [dbo].[Card] ([Card_ID], [Card_Name], [Card_Status]) VALUES (2, N'GeForce GT 730 2GB', 1)
INSERT [dbo].[Card] ([Card_ID], [Card_Name], [Card_Status]) VALUES (3, N'GeForce GT 1030 2GB', 1)
INSERT [dbo].[Card] ([Card_ID], [Card_Name], [Card_Status]) VALUES (4, N'GeForce GTX 1050Ti 4GB', 1)
INSERT [dbo].[Card] ([Card_ID], [Card_Name], [Card_Status]) VALUES (5, N'GeForce GTX 1650 4GB', 1)
INSERT [dbo].[Card] ([Card_ID], [Card_Name], [Card_Status]) VALUES (6, N'GeForce GTX 1660 6GB', 1)
INSERT [dbo].[Card] ([Card_ID], [Card_Name], [Card_Status]) VALUES (7, N'GeForce RTX 3050 8GB', 1)
INSERT [dbo].[Card] ([Card_ID], [Card_Name], [Card_Status]) VALUES (8, N'GeForce RTX 2060 6GB', 1)
INSERT [dbo].[Card] ([Card_ID], [Card_Name], [Card_Status]) VALUES (9, N'Radeon RX 6600 8G', 1)
SET IDENTITY_INSERT [dbo].[Card] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Status]) VALUES (1, N'Gaming', 1)
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Status]) VALUES (2, N'Design', 1)
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Status]) VALUES (3, N'Office', 1)
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Status]) VALUES (4, N'Luxury', 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[CPU] ON 

INSERT [dbo].[CPU] ([CPU_ID], [CPU_Name], [CPU_Status]) VALUES (1, N'Intel Core i3', 1)
INSERT [dbo].[CPU] ([CPU_ID], [CPU_Name], [CPU_Status]) VALUES (2, N'Intel Core i5', 1)
INSERT [dbo].[CPU] ([CPU_ID], [CPU_Name], [CPU_Status]) VALUES (3, N'Intel Core i7', 1)
INSERT [dbo].[CPU] ([CPU_ID], [CPU_Name], [CPU_Status]) VALUES (4, N'Intel Core i9', 1)
INSERT [dbo].[CPU] ([CPU_ID], [CPU_Name], [CPU_Status]) VALUES (5, N'Ryzen 3', 1)
INSERT [dbo].[CPU] ([CPU_ID], [CPU_Name], [CPU_Status]) VALUES (6, N'Ryzen 5', 1)
INSERT [dbo].[CPU] ([CPU_ID], [CPU_Name], [CPU_Status]) VALUES (7, N'Ryzen 7', 1)
SET IDENTITY_INSERT [dbo].[CPU] OFF
GO
SET IDENTITY_INSERT [dbo].[Display] ON 

INSERT [dbo].[Display] ([Display_ID], [Display_Name], [Disolay_Status]) VALUES (1, N'Normal', 1)
INSERT [dbo].[Display] ([Display_ID], [Display_Name], [Disolay_Status]) VALUES (2, N'HD', 1)
INSERT [dbo].[Display] ([Display_ID], [Display_Name], [Disolay_Status]) VALUES (3, N'Full HD', 1)
INSERT [dbo].[Display] ([Display_ID], [Display_Name], [Disolay_Status]) VALUES (4, N'2K', 1)
INSERT [dbo].[Display] ([Display_ID], [Display_Name], [Disolay_Status]) VALUES (5, N'4K', 1)
SET IDENTITY_INSERT [dbo].[Display] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([Feedback_ID], [Product_ID], [Account_ID], [Content], [RateStar], [CreateDate], [Feedback_Status]) VALUES (1, 1, 1, N'very good product', NULL, CAST(N'2022-07-11' AS Date), 0)
INSERT [dbo].[Feedback] ([Feedback_ID], [Product_ID], [Account_ID], [Content], [RateStar], [CreateDate], [Feedback_Status]) VALUES (5, 6, 4, N'good', NULL, CAST(N'2022-07-11' AS Date), 1)
INSERT [dbo].[Feedback] ([Feedback_ID], [Product_ID], [Account_ID], [Content], [RateStar], [CreateDate], [Feedback_Status]) VALUES (6, 6, 4, N'product is very good', NULL, CAST(N'2022-07-11' AS Date), 1)
INSERT [dbo].[Feedback] ([Feedback_ID], [Product_ID], [Account_ID], [Content], [RateStar], [CreateDate], [Feedback_Status]) VALUES (7, 7, 13, N'very good', NULL, CAST(N'2022-07-11' AS Date), 1)
INSERT [dbo].[Feedback] ([Feedback_ID], [Product_ID], [Account_ID], [Content], [RateStar], [CreateDate], [Feedback_Status]) VALUES (8, 9, 13, N'very fast and beautiful', NULL, CAST(N'2022-07-11' AS Date), 1)
INSERT [dbo].[Feedback] ([Feedback_ID], [Product_ID], [Account_ID], [Content], [RateStar], [CreateDate], [Feedback_Status]) VALUES (9, 2, 13, N'good', NULL, CAST(N'2022-07-11' AS Date), 1)
INSERT [dbo].[Feedback] ([Feedback_ID], [Product_ID], [Account_ID], [Content], [RateStar], [CreateDate], [Feedback_Status]) VALUES (10, 2, 13, N'good', NULL, CAST(N'2022-07-11' AS Date), 1)
INSERT [dbo].[Feedback] ([Feedback_ID], [Product_ID], [Account_ID], [Content], [RateStar], [CreateDate], [Feedback_Status]) VALUES (11, 9, 13, N'ship very fast', NULL, CAST(N'2022-07-11' AS Date), 1)
INSERT [dbo].[Feedback] ([Feedback_ID], [Product_ID], [Account_ID], [Content], [RateStar], [CreateDate], [Feedback_Status]) VALUES (12, 3, 1, N'test comment', NULL, CAST(N'2022-07-17' AS Date), 1)
INSERT [dbo].[Feedback] ([Feedback_ID], [Product_ID], [Account_ID], [Content], [RateStar], [CreateDate], [Feedback_Status]) VALUES (1012, 8, 1, N'good product', NULL, CAST(N'2022-07-19' AS Date), 1)
INSERT [dbo].[Feedback] ([Feedback_ID], [Product_ID], [Account_ID], [Content], [RateStar], [CreateDate], [Feedback_Status]) VALUES (1013, 8, 1, N'good product', NULL, CAST(N'2022-07-19' AS Date), 1)
INSERT [dbo].[Feedback] ([Feedback_ID], [Product_ID], [Account_ID], [Content], [RateStar], [CreateDate], [Feedback_Status]) VALUES (1014, 8, 1, N'hay', NULL, CAST(N'2022-07-19' AS Date), 1)
INSERT [dbo].[Feedback] ([Feedback_ID], [Product_ID], [Account_ID], [Content], [RateStar], [CreateDate], [Feedback_Status]) VALUES (1015, 3, 1, N'this is comment', NULL, CAST(N'2022-07-19' AS Date), 1)
INSERT [dbo].[Feedback] ([Feedback_ID], [Product_ID], [Account_ID], [Content], [RateStar], [CreateDate], [Feedback_Status]) VALUES (1016, 1, 1, N'Ä?áº¹p quÃ¡', NULL, CAST(N'2022-07-20' AS Date), 1)
INSERT [dbo].[Feedback] ([Feedback_ID], [Product_ID], [Account_ID], [Content], [RateStar], [CreateDate], [Feedback_Status]) VALUES (1017, 1, 1, N'd?p quá', NULL, CAST(N'2022-07-20' AS Date), 0)
INSERT [dbo].[Feedback] ([Feedback_ID], [Product_ID], [Account_ID], [Content], [RateStar], [CreateDate], [Feedback_Status]) VALUES (1018, 1, 1, N'd?p quá', NULL, CAST(N'2022-07-20' AS Date), 1)
INSERT [dbo].[Feedback] ([Feedback_ID], [Product_ID], [Account_ID], [Content], [RateStar], [CreateDate], [Feedback_Status]) VALUES (1019, 3, 1, N'dep qua', NULL, CAST(N'2022-07-20' AS Date), 1)
INSERT [dbo].[Feedback] ([Feedback_ID], [Product_ID], [Account_ID], [Content], [RateStar], [CreateDate], [Feedback_Status]) VALUES (1020, 3, 1, N'hay qua', NULL, CAST(N'2022-07-20' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[OperatingSystem] ON 

INSERT [dbo].[OperatingSystem] ([OS_ID], [OS_Name], [OS_Status]) VALUES (1, N'Windows', 1)
INSERT [dbo].[OperatingSystem] ([OS_ID], [OS_Name], [OS_Status]) VALUES (2, N'MacOS', 1)
INSERT [dbo].[OperatingSystem] ([OS_ID], [OS_Name], [OS_Status]) VALUES (3, N'Linux', 1)
SET IDENTITY_INSERT [dbo].[OperatingSystem] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Order_ID], [Account_ID], [Order_Date], [CustomerName], [Address], [Phone], [Email], [TotalMoney], [Order_Note], [Order_Status]) VALUES (1, 1, CAST(N'2019-01-06' AS Date), N'Phạm Minh Giang', N'Hưng Yên', N'0964156248', N'giangphampro312001@gmail.com', 31450000.0000, N'shoping test', 1)
INSERT [dbo].[Order] ([Order_ID], [Account_ID], [Order_Date], [CustomerName], [Address], [Phone], [Email], [TotalMoney], [Order_Note], [Order_Status]) VALUES (2, 2, CAST(N'2019-03-08' AS Date), N'Võ Thị Hồng Hạnh', N'Nghệ An', N'0337123456', N'hanh@gmail.com', 42050000.0000, N'test', 1)
INSERT [dbo].[Order] ([Order_ID], [Account_ID], [Order_Date], [CustomerName], [Address], [Phone], [Email], [TotalMoney], [Order_Note], [Order_Status]) VALUES (3, 4, CAST(N'2020-07-09' AS Date), N'Nguyễn Đức Thịnh', N'Kim Động', N'0976755323', N'thinh@gmail.com', 21000000.0000, N'test', 1)
INSERT [dbo].[Order] ([Order_ID], [Account_ID], [Order_Date], [CustomerName], [Address], [Phone], [Email], [TotalMoney], [Order_Note], [Order_Status]) VALUES (4, 8, CAST(N'2021-12-03' AS Date), N'Nguyễn Đình Phát', N'Bắc Ninh', N'0976789345', N'phat@gmail.com', 18000000.0000, N'test', 1)
INSERT [dbo].[Order] ([Order_ID], [Account_ID], [Order_Date], [CustomerName], [Address], [Phone], [Email], [TotalMoney], [Order_Note], [Order_Status]) VALUES (13, 1, CAST(N'2022-07-11' AS Date), N'Pháº¡m Minh Giang', N'Hung Yen', N'0988888888', N'giang@gmail.com', 4382000.0000, N'', 1)
INSERT [dbo].[Order] ([Order_ID], [Account_ID], [Order_Date], [CustomerName], [Address], [Phone], [Email], [TotalMoney], [Order_Note], [Order_Status]) VALUES (14, 4, CAST(N'2022-07-11' AS Date), N'Nguyen Duc Thinh', N'Hung Yen', N'0979797979', N'ndt97hy@gmail.com', 20241000.0000, N'', 1)
INSERT [dbo].[Order] ([Order_ID], [Account_ID], [Order_Date], [CustomerName], [Address], [Phone], [Email], [TotalMoney], [Order_Note], [Order_Status]) VALUES (15, 13, CAST(N'2022-07-11' AS Date), N'Pháº¡m minh giang', N'KTX ÄH FPT HÃ²a Láº¡c', N'0964156428', N'giangphampro312001@gmail.com', 8022000.0000, N'', 1)
INSERT [dbo].[Order] ([Order_ID], [Account_ID], [Order_Date], [CustomerName], [Address], [Phone], [Email], [TotalMoney], [Order_Note], [Order_Status]) VALUES (16, 1, CAST(N'2022-07-17' AS Date), N'Pháº¡m Minh Giang', N'Hung Yen', N'0988888888', N'giang@gmail.com', 14391000.0000, N'mua hang', 1)
INSERT [dbo].[Order] ([Order_ID], [Account_ID], [Order_Date], [CustomerName], [Address], [Phone], [Email], [TotalMoney], [Order_Note], [Order_Status]) VALUES (1016, 1, CAST(N'2022-07-15' AS Date), N'Phạm Minh Giang', N'Hung Yen', N'0964156248', N'giangphampro312001', 2450000.0000, N'not', 1)
INSERT [dbo].[Order] ([Order_ID], [Account_ID], [Order_Date], [CustomerName], [Address], [Phone], [Email], [TotalMoney], [Order_Note], [Order_Status]) VALUES (1017, 2, CAST(N'2022-07-08' AS Date), N'Phạm Minh Giang', N'Hung Yen', N'0964156248', N'giangphampro312001', 4987123.0000, N'note', 1)
INSERT [dbo].[Order] ([Order_ID], [Account_ID], [Order_Date], [CustomerName], [Address], [Phone], [Email], [TotalMoney], [Order_Note], [Order_Status]) VALUES (1018, 4, CAST(N'2022-07-06' AS Date), N'Nguyễn Đứa Thịnh', N'Ha Tinh', N'0976755323', N'giangphampro312001', 2794356.0000, N'note', 1)
INSERT [dbo].[Order] ([Order_ID], [Account_ID], [Order_Date], [CustomerName], [Address], [Phone], [Email], [TotalMoney], [Order_Note], [Order_Status]) VALUES (1019, 8, CAST(N'2022-07-03' AS Date), N'Lê Trung Thành', N'Pho Noi', N'0984648021', N'thanh@gmail.com', 2957325.0000, N'note', 1)
INSERT [dbo].[Order] ([Order_ID], [Account_ID], [Order_Date], [CustomerName], [Address], [Phone], [Email], [TotalMoney], [Order_Note], [Order_Status]) VALUES (1020, 13, CAST(N'2022-07-15' AS Date), N'Trần Hiệp Quóc', N'Nam DInh', N'0337199682', N'quoc@gmail.com', 3318567.0000, N'note', 1)
INSERT [dbo].[Order] ([Order_ID], [Account_ID], [Order_Date], [CustomerName], [Address], [Phone], [Email], [TotalMoney], [Order_Note], [Order_Status]) VALUES (1021, 1, CAST(N'2022-07-20' AS Date), N'Pháº¡m Minh Giang', N'Hung Yen', N'0988888888', N'gianggg@gmail.com', 14391000.0000, N'', 1)
INSERT [dbo].[Order] ([Order_ID], [Account_ID], [Order_Date], [CustomerName], [Address], [Phone], [Email], [TotalMoney], [Order_Note], [Order_Status]) VALUES (1022, 1, CAST(N'2022-07-20' AS Date), N'Pháº¡m Minh Giang', N'Hung Yen', N'0988888888', N'gianggg@gmail.com', 273429000.0000, N'', 1)
INSERT [dbo].[Order] ([Order_ID], [Account_ID], [Order_Date], [CustomerName], [Address], [Phone], [Email], [TotalMoney], [Order_Note], [Order_Status]) VALUES (1023, 1, CAST(N'2022-07-20' AS Date), N'PhÃÂÃÂ¡ÃÂÃÂºÃÂÃÂ¡m minh giang', N'KTX ÃÂÃÂÃÂÃÂH FPT HÃÂÃÂÃÂÃÂ²a LÃÂÃÂ¡ÃÂÃÂºÃÂÃÂ¡c', N'0976755323', N'gianggg@gmail.com', 9520000.0000, N'', 1)
INSERT [dbo].[Order] ([Order_ID], [Account_ID], [Order_Date], [CustomerName], [Address], [Phone], [Email], [TotalMoney], [Order_Note], [Order_Status]) VALUES (1024, 8, CAST(N'2022-07-20' AS Date), N'Pháº¡m minh giang', N'KTX ÄH FPT HÃ²a Láº¡c', N'0964156428', N'giangphampro312001@gmail.com', 37239999.9940, N'', 1)
INSERT [dbo].[Order] ([Order_ID], [Account_ID], [Order_Date], [CustomerName], [Address], [Phone], [Email], [TotalMoney], [Order_Note], [Order_Status]) VALUES (1025, 8, CAST(N'2022-07-20' AS Date), N'Pháº¡m minh giang', N'KTX ÄH FPT HÃ²a Láº¡c', N'0964156428', N'giangphampro312001@gmail.com', 56673000.0000, N'', 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([Order_ID], [Product_ID], [Quantity], [Price]) VALUES (1, 1, 2, 12000000.0000)
INSERT [dbo].[OrderDetail] ([Order_ID], [Product_ID], [Quantity], [Price]) VALUES (1, 5, 1, 15000000.0000)
INSERT [dbo].[OrderDetail] ([Order_ID], [Product_ID], [Quantity], [Price]) VALUES (1, 8, 3, 17000000.0000)
INSERT [dbo].[OrderDetail] ([Order_ID], [Product_ID], [Quantity], [Price]) VALUES (2, 3, 1, 21000000.0000)
INSERT [dbo].[OrderDetail] ([Order_ID], [Product_ID], [Quantity], [Price]) VALUES (2, 12, 2, 31000000.0000)
INSERT [dbo].[OrderDetail] ([Order_ID], [Product_ID], [Quantity], [Price]) VALUES (3, 19, 2, 24000000.0000)
INSERT [dbo].[OrderDetail] ([Order_ID], [Product_ID], [Quantity], [Price]) VALUES (3, 13, 2, 30000000.0000)
INSERT [dbo].[OrderDetail] ([Order_ID], [Product_ID], [Quantity], [Price]) VALUES (4, 7, 3, 62000000.0000)
INSERT [dbo].[OrderDetail] ([Order_ID], [Product_ID], [Quantity], [Price]) VALUES (13, 1, 2, 21591000.0000)
INSERT [dbo].[OrderDetail] ([Order_ID], [Product_ID], [Quantity], [Price]) VALUES (14, 6, 1, 20241000.0000)
INSERT [dbo].[OrderDetail] ([Order_ID], [Product_ID], [Quantity], [Price]) VALUES (15, 2, 1, 18891000.0000)
INSERT [dbo].[OrderDetail] ([Order_ID], [Product_ID], [Quantity], [Price]) VALUES (15, 7, 1, 35640000.0000)
INSERT [dbo].[OrderDetail] ([Order_ID], [Product_ID], [Quantity], [Price]) VALUES (16, 3, 1, 14391000.0000)
INSERT [dbo].[OrderDetail] ([Order_ID], [Product_ID], [Quantity], [Price]) VALUES (1021, 3, 1, 14391000.0000)
INSERT [dbo].[OrderDetail] ([Order_ID], [Product_ID], [Quantity], [Price]) VALUES (1022, 3, 19, 14391000.0000)
INSERT [dbo].[OrderDetail] ([Order_ID], [Product_ID], [Quantity], [Price]) VALUES (1023, 13, 1, 9520000.0000)
INSERT [dbo].[OrderDetail] ([Order_ID], [Product_ID], [Quantity], [Price]) VALUES (1025, 2, 3, 18891000.0000)
INSERT [dbo].[OrderDetail] ([Order_ID], [Product_ID], [Quantity], [Price]) VALUES (15, 9, 1, 31491000.0000)
INSERT [dbo].[OrderDetail] ([Order_ID], [Product_ID], [Quantity], [Price]) VALUES (1024, 7, 1, 35640000.0000)
INSERT [dbo].[OrderDetail] ([Order_ID], [Product_ID], [Quantity], [Price]) VALUES (1024, 1, 1, 1599999.9940)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Price], [Discount], [Product_SalePrice], [Product_Quantity], [Product_ImgURL], [Product_Description], [Brand_ID], [Category_ID], [OS_ID], [RAM_ID], [CPU_ID], [Display_ID], [Capacity_ID], [Card_ID], [Product_CreateDate], [Product_Status], [Product_ModifyDate]) VALUES (1, N'Asus Gaming Rog Strix G15 G513IH HN015W', 2000000.0000, 0.20000000298023224, 1599999.9940, 0, N'1610162795521.jpg', N'Asus ROG Strix G15 G513IH-HN015TW có ngoại hình vô cùng mạnh mẽ với màu sắc trang nhã. Khung máy có kích thước nhỏ hơn đến 7% so với thế hệ trước giúp bạn có thể chơi bất cứ tựa game nào mà bạn muốn.', 2, 1, 1, 2, 7, 3, 5, 5, CAST(N'2021-12-04' AS Date), 1, CAST(N'2022-07-20' AS Date))
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Price], [Discount], [Product_SalePrice], [Product_Quantity], [Product_ImgURL], [Product_Description], [Brand_ID], [Category_ID], [OS_ID], [RAM_ID], [CPU_ID], [Display_ID], [Capacity_ID], [Card_ID], [Product_CreateDate], [Product_Status], [Product_ModifyDate]) VALUES (2, N'Asus TUF Gaming FA506IHR HN019W', 20990000.0000, 0.1, 18891000.0000, 8, N'FA506IHR-1_compressed-600x600.jpg', N'Khung máy nhỏ gọn, tuy nhiên không hề làm giảm kích thước của khung hình, thiết kế với màn hình Full HD chân thực rõ nét. Màu chủ đạo là màu đen, phù hợp cho mọi lứa tuổi mọi không gian phòng. Logo TUF đem đến phong cách chất ngầu, bụi bặm và hầm hố, tạo ấn tượng mạnh mẽ với giới game thủ.', 2, 1, 1, 2, 6, 3, 5, 5, CAST(N'2021-12-12' AS Date), 1, NULL)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Price], [Discount], [Product_SalePrice], [Product_Quantity], [Product_ImgURL], [Product_Description], [Brand_ID], [Category_ID], [OS_ID], [RAM_ID], [CPU_ID], [Display_ID], [Capacity_ID], [Card_ID], [Product_CreateDate], [Product_Status], [Product_ModifyDate]) VALUES (3, N'Dell Insprion 14 5406-3661SLV', 15990000.0000, 0.1, 14391000.0000, 5, N'10370_dell_inspiron_14_5406_2_in_1_silver_5.jpg', N'Laptop Dell insprion 14 5406-3661SLV sở hữu một thiết kế vô cùng nhỏ gọn. Laptop với màn hình 14 inch, độ phân giải cao mang lại khả nang hiển thị rõ nét. Màn hình trên mẫu laptop chất lượng này còn hỗ trợ cảm ứng nhờ đó người dùng có thể điều khiển một cách tiện lợi.

', 1, 4, 3, 1, 1, 1, 1, 6, CAST(N'2021-03-06' AS Date), 1, NULL)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Price], [Discount], [Product_SalePrice], [Product_Quantity], [Product_ImgURL], [Product_Description], [Brand_ID], [Category_ID], [OS_ID], [RAM_ID], [CPU_ID], [Display_ID], [Capacity_ID], [Card_ID], [Product_CreateDate], [Product_Status], [Product_ModifyDate]) VALUES (4, N'MSI Modern 14 B11MOU 1030VN', 14880000.0000, 0.1, 13392000.0000, 17, N'laptop-msi-modern-14-b11mou-1030vn-xam_754813fc.jpg', N'Laptop MSI Modern 14 B11MOU 1030VN được trang bị một thiết kế sang trọng và trẻ trung. Nắp lưng với logo MSI nổi bật, khung viền được hoàn thiệt tỉ mỉ với các đường cắt kim cương tính tế. Laptop khá nhẹ và mỏng nhờ đó có thể dễ dàng di chuyển một cách dễ dàng.', 4, 2, 1, 3, 5, 2, 2, 3, CAST(N'2020-04-05' AS Date), 1, NULL)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Price], [Discount], [Product_SalePrice], [Product_Quantity], [Product_ImgURL], [Product_Description], [Brand_ID], [Category_ID], [OS_ID], [RAM_ID], [CPU_ID], [Display_ID], [Capacity_ID], [Card_ID], [Product_CreateDate], [Product_Status], [Product_ModifyDate]) VALUES (5, N'Lenovo Ideapad 3 15ALC6', 19900000.0000, 0.1, 17910000.0000, 8, N'40964_laptop_lenovo_ideapad_3_15alc6_82ku00tcvn__1_.jpg', N'Laptop Lenovo Ideapad 3 15ALC6 82KU00A9US sở hữu thiết kế tinh tế với các họa tiết phay xước. Logo nằm bên góc phải gói gọn trong hình chữ nhật nhỏ, gọn ghẽ và nổi bật.

Với trọng lượng chỉ 1.65kg và kích thước nhỏ gọn, Lenovo Ideapad 3 15ALC6 rất thích hợp để di chuyển cùng bạn bất cứ đâu. Cấu tạo từ các chất liệu siêu bền, cao cấp đáp ứng khả năng bảo vệ các linh kiện bên trong khỏi va đập.', 3, 3, 1, 1, 4, 4, 3, 9, CAST(N'2021-10-10' AS Date), 1, NULL)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Price], [Discount], [Product_SalePrice], [Product_Quantity], [Product_ImgURL], [Product_Description], [Brand_ID], [Category_ID], [OS_ID], [RAM_ID], [CPU_ID], [Display_ID], [Capacity_ID], [Card_ID], [Product_CreateDate], [Product_Status], [Product_ModifyDate]) VALUES (6, N'Lenovo Ideapad Gaming 3 15ACH6', 22490000.0000, 0.10000000149011612, 20240999.9665, 13, N'41hre3ql7sw4w.jpg', N'Laptop Lenovo Ideapad gaming 3 15ACH6 với bàn phím kích thước full size, khu phím số riêng cùng khoảng cách giữa các phím hợp lý mang lại cho người dùng trải nghiệm đánh máy vô cùng thoải mái. Đặc biệt, Lenovo Ideapad gaming 3 15ACH6 còn được trang bị đèn LED với đèn nền bốn khu vực giúp người dùng sử dụng dễ dàng kể cả trong điều kiện thiếu sáng.', 3, 4, 3, 4, 2, 2, 4, 7, CAST(N'2020-11-02' AS Date), 1, NULL)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Price], [Discount], [Product_SalePrice], [Product_Quantity], [Product_ImgURL], [Product_Description], [Brand_ID], [Category_ID], [OS_ID], [RAM_ID], [CPU_ID], [Display_ID], [Capacity_ID], [Card_ID], [Product_CreateDate], [Product_Status], [Product_ModifyDate]) VALUES (7, N'Lenovo Thinkbook 16P G2 ACH 20YM003JVN', 39600000.0000, 0.1, 35640000.0000, 1, N'15_3_40.jpg', N'cfg hjcgh', 3, 2, 3, 3, 3, 5, 7, 4, CAST(N'2020-09-11' AS Date), 1, NULL)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Price], [Discount], [Product_SalePrice], [Product_Quantity], [Product_ImgURL], [Product_Description], [Brand_ID], [Category_ID], [OS_ID], [RAM_ID], [CPU_ID], [Display_ID], [Capacity_ID], [Card_ID], [Product_CreateDate], [Product_Status], [Product_ModifyDate]) VALUES (8, N'Lenovo Ideapad 5 PRO 14ACN6 82L700M9VN', 21990000.0000, 0.1, 19791000.0000, 25, N'41151_laptop_lenovo_ideapad_5_pro_14acn6_82l700m9vn_1__2_.jpg', N'Lenovo IdeaPad 5 Pro 14ACN6 R5-5600U sở hữu lối thiết kế cắt góc cực kỳ tinh tế, nên mang vẻ sang trọng nhưng không kém phần gai góc. Nhờ vào độ mỏng được tối ưu đi kèm trọng lượng chỉ gói gọn trong 1.38kg giúp cho người sử dụng dễ dàng cầm để mang theo chỉ vỏn vẹn bằng một tay.', 3, 3, 1, 4, 1, 1, 6, 1, CAST(N'2021-10-20' AS Date), 1, NULL)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Price], [Discount], [Product_SalePrice], [Product_Quantity], [Product_ImgURL], [Product_Description], [Brand_ID], [Category_ID], [OS_ID], [RAM_ID], [CPU_ID], [Display_ID], [Capacity_ID], [Card_ID], [Product_CreateDate], [Product_Status], [Product_ModifyDate]) VALUES (9, N'Lenovo Legion 5 15ACH6H 82JU00YWVN', 34990000.0000, 0.1, 31491000.0000, 18, N'41072_laptop_lenovo_legion_5_15ach6h_82ju00ywvn__8_.jpg', N'Laptop Lenovo Legion 5 15ACH6H 82JU00YWVN chỉ nặng 2.4kg và có kích thước nhỏ gọn.. Vỏ làm từ chất liệu cao cấp nên sự bền bỉ và vững chắc trong cấu tạo.

Laptop Lenovo Legion 5 15ACH6H 82JU00YWVN được trang bị màn hình có độ phân giải 1920x1080 pixels, kích thước đạt 15.6 inch Full HD. Tần số quét 165Hz cao ngất ngưởng cộng với dải màu 100% sRGB giúp bạn thưởng thức những khung hình chân thực sắc nét.', 3, 2, 1, 2, 2, 2, 7, 2, CAST(N'2021-02-17' AS Date), 1, NULL)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Price], [Discount], [Product_SalePrice], [Product_Quantity], [Product_ImgURL], [Product_Description], [Brand_ID], [Category_ID], [OS_ID], [RAM_ID], [CPU_ID], [Display_ID], [Capacity_ID], [Card_ID], [Product_CreateDate], [Product_Status], [Product_ModifyDate]) VALUES (10, N'HP Pavilion 15-EG0505TU 46M02PA', 18990000.0000, 0.15, 16141500.0000, 11, N'hp-pavilion-15-eg0505tu-i5-46m02pa-15-600x600.jpg', N'Chiếc laptop HP Pavilion 15-EG0505TU 46M02PA này sở hữu thiết kế khá sang trọng và tinh tế cùng với tông màu vàng thời thượng.Máy có trọng lượng 1.677 kg và độ dày 17.9 mm cùng với nắp lưng và chiếu nghỉ tay được làm từ kim loại chắc chắn.', 6, 3, 3, 3, 3, 3, 1, 3, CAST(N'2021-05-05' AS Date), 1, NULL)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Price], [Discount], [Product_SalePrice], [Product_Quantity], [Product_ImgURL], [Product_Description], [Brand_ID], [Category_ID], [OS_ID], [RAM_ID], [CPU_ID], [Display_ID], [Capacity_ID], [Card_ID], [Product_CreateDate], [Product_Status], [Product_ModifyDate]) VALUES (11, N'HP 15-EF2126WM 4J771UA', 17990000.0000, 0.15000000596046448, 15291499.8928, 4, N'hp-15-ef2126wm-1.jpg', N'HP 15-EF2126WM 4J771UA được trang bị bàn phím với kích thước full size cùng hành trình phím sâu mang lại trải nghiệm gõ thoải mái. Bên cạnh đó, laptop còn được trang bị một hệ thống cống kết nối đa dạng giúp thuận tiện trong sử dụng của người dùng.

Laptop HP 15-EF2126WM 4J771UA sở hữu màn hình kích thước lớn mang lại không gian hiển thị lớn. Bên cạnh đó là tấm nền chất lượng với độ phân giải cao mang lại trải nghiệm hình ảnh rõ nét.', 6, 4, 1, 4, 4, 4, 2, 4, CAST(N'2021-07-22' AS Date), 1, NULL)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Price], [Discount], [Product_SalePrice], [Product_Quantity], [Product_ImgURL], [Product_Description], [Brand_ID], [Category_ID], [OS_ID], [RAM_ID], [CPU_ID], [Display_ID], [Capacity_ID], [Card_ID], [Product_CreateDate], [Product_Status], [Product_ModifyDate]) VALUES (12, N'HP Envy 13-BA1537TU 4U6P0PA', 23990000.0000, 0.2, 19192000.0000, 16, N'39167_20619_laptop_hp_envy_13_ba1537tu_4u6p0pa_2.jpg', N'Laptop HP Envy 13-BA1537TU 4U6P0PA đáp ứng nhu cầu làm việc linh hoạt của bạn ở bất cứ nơi đâu. Điểm ưu của sản phẩm là thiết kế mỏng gọn cùng trọng lượng nhẹ, thích hợp cho nhu cầu vận chuyển đến nơi làm việc mà không gây cồng kềnh. Phong cách tối giản sang trọng với lớp vỏ nguyên khối cùng màu sắc sang trọng giúp tăng thêm nét tinh tế cho bề ngoài laptop HP Envy 13-BA1537TU 4U6P0PA.', 6, 1, 1, 1, 5, 5, 3, 5, CAST(N'2020-01-25' AS Date), 1, NULL)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Price], [Discount], [Product_SalePrice], [Product_Quantity], [Product_ImgURL], [Product_Description], [Brand_ID], [Category_ID], [OS_ID], [RAM_ID], [CPU_ID], [Display_ID], [Capacity_ID], [Card_ID], [Product_CreateDate], [Product_Status], [Product_ModifyDate]) VALUES (13, N'HP 14-CF2033WM 3V7G4UA', 11900000.0000, 0.2, 9520000.0000, 26, N'61sznaimjzs._ac_sx569_.jpg', N'Laptop HP 14-cf2033wm 3V7G4UA đáp ứng nhu cầu làm việc từ xa của nhiều người dùng hiện nay. Chiếc máy có thiết kế bề ngoài sang trọng, với sắc màu Bạc làm nên nét tinh tế cho tổng thể laptop. Nhờ trọng lượng nhẹ và kiểu dáng gọn gàng, laptop HP 14-cf2033wm 3V7G4UA thích hợp cho nhu cầu xử lý công việc tiện lợi ở bất kỳ nơi đâu.', 6, 2, 3, 2, 6, 1, 4, 6, CAST(N'2020-09-13' AS Date), 1, NULL)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Price], [Discount], [Product_SalePrice], [Product_Quantity], [Product_ImgURL], [Product_Description], [Brand_ID], [Category_ID], [OS_ID], [RAM_ID], [CPU_ID], [Display_ID], [Capacity_ID], [Card_ID], [Product_CreateDate], [Product_Status], [Product_ModifyDate]) VALUES (14, N'HP Zbook Firefly 14 G8 1A2F1AV', 34490000.0000, 0.1, 31041000.0000, 15, N'60708_laptop_hp_zbook_firefly_14_g8_1a2f1av_bac_6.jpg', N'Laptop HP Zbook Firefly 14 G8 1A2F1AV sở hữu một tổng thể thiết kế khá nhỏ gọn. Cụ thể, laptop với trọng lượng chưa đến 1.5kg mang lại tính di động cao, người dùng có thể dễ dàng bỏ vào túi xách, balo và mang theo bên mình. Laptop sở hữu thiết kế khá vuông vức cùng màu sắc trang nhã sang trọng.', 6, 3, 1, 3, 7, 2, 5, 7, CAST(N'2021-02-22' AS Date), 1, NULL)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Price], [Discount], [Product_SalePrice], [Product_Quantity], [Product_ImgURL], [Product_Description], [Brand_ID], [Category_ID], [OS_ID], [RAM_ID], [CPU_ID], [Display_ID], [Capacity_ID], [Card_ID], [Product_CreateDate], [Product_Status], [Product_ModifyDate]) VALUES (15, N'Acer Travelmate TMB311-31-P49D N20H1_NX.VNFSV.005', 11490000.0000, 0, 11490000.0000, 21, N'39671_8.jpg', N'cghcgh', 5, 4, 1, 4, 1, 3, 6, 8, CAST(N'2021-11-11' AS Date), 1, NULL)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Price], [Discount], [Product_SalePrice], [Product_Quantity], [Product_ImgURL], [Product_Description], [Brand_ID], [Category_ID], [OS_ID], [RAM_ID], [CPU_ID], [Display_ID], [Capacity_ID], [Card_ID], [Product_CreateDate], [Product_Status], [Product_ModifyDate]) VALUES (16, N'Gaming Acer Nitro 5 Eagle AN515-57-54MV NHQENSV003', 26490000.0000, 0, 26490000.0000, 13, N'5d72307cf718b8db54bdf4369ad41f26-5d785633-dbcf-433c-bca8-c5f874bf59b2.jpg', N'Laptop Acer Nitro 5 Eagle AN515-57-54MV về vẻ ngoài khá tương tự với các phiên bản Nitro 5 khác. Tổng thể máy được hoàn thiện từ nhựa nhám với nắp capo được hoàn thiện cách điệu với các đường gạch chéo giúp tổng thể máy cuốn hút hơn, mạnh mẽ hơn.

Đồng thời logo trên nắp lưng thay vì màu đỏ truyền thống, Acer Nitro 5 Eagle AN515-57-54MV cũng được chuyển sang màu đen tạo cảm giác đẳng cấp. Về bản lề, laptop được gia công vô cùng chắc chắn cùng đế dày.', 5, 1, 3, 1, 2, 4, 7, 9, CAST(N'2020-06-06' AS Date), 1, NULL)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Price], [Discount], [Product_SalePrice], [Product_Quantity], [Product_ImgURL], [Product_Description], [Brand_ID], [Category_ID], [OS_ID], [RAM_ID], [CPU_ID], [Display_ID], [Capacity_ID], [Card_ID], [Product_CreateDate], [Product_Status], [Product_ModifyDate]) VALUES (17, N'Acer Gaming Predator Helios 300 H315-53-70U6', 43550000.0000, 0.1, 39195000.0000, 2, N'_0002_18596-laptop-gaming-acer-predator-helios-300-ph315-53-70u6-nh-q7ysv-002-4.jpg', N'Gaming Predator Helios 300 H315-53-70U6 NH.Q7YSV.002 là một trong những dòng laptop được thiết kế ấn tượng, đã được tối ưu hóa trọng lượng. Cùng với cấu hình, hiệu năng ổn định, chiếc laptop luôn mang đến những hiệu năng hoạt động mạnh mẽ, giúp cho máy có khả năng hoạt động siêu nhanh.', 5, 1, 1, 2, 3, 5, 1, 2, CAST(N'2020-08-28' AS Date), 1, NULL)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Price], [Discount], [Product_SalePrice], [Product_Quantity], [Product_ImgURL], [Product_Description], [Brand_ID], [Category_ID], [OS_ID], [RAM_ID], [CPU_ID], [Display_ID], [Capacity_ID], [Card_ID], [Product_CreateDate], [Product_Status], [Product_ModifyDate]) VALUES (18, N'Acer Aspire 5 A515-55-35SE', 14440000.0000, 0, 14440000.0000, 30, N'6793_719hccghghl__ac_sx569_.jpg', N'Laptop Acer Aspire 5 với thiết kế nhôm và hoàn thiện tỉ mỉ các chi tiết tạo nên vẻ ngoài hoàn hảo. Nắp nhôm bạc sáng bóng sang trọng nhưng khi cầm nắm tạo cảm giác cực kỳ chắc tay. Với thiết kế mỏng nhẹ, trọng lượng chỉ 1,8kg dễ dàng di chuyển, đồng hành với bạn mọi lúc mọi nơi', 5, 2, 1, 3, 4, 1, 2, 3, CAST(N'2022-02-12' AS Date), 1, NULL)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Price], [Discount], [Product_SalePrice], [Product_Quantity], [Product_ImgURL], [Product_Description], [Brand_ID], [Category_ID], [OS_ID], [RAM_ID], [CPU_ID], [Display_ID], [Capacity_ID], [Card_ID], [Product_CreateDate], [Product_Status], [Product_ModifyDate]) VALUES (19, N'MSI Gaming GF63 10SC 804VN', 20550000.0000, 0, 20550000.0000, 11, N'637639340541330187_msi-gaming-gf63-den-1.jpg', N'Laptop MSI Gaming GF63 10SC-804VN được thiết kế bên ngoài máy là nắp lưng chất liệu nhôm phay xước, đem đến cảm giác chắc chắn và bền bỉ cho người sử dụng.', 4, 1, 3, 4, 5, 2, 3, 4, CAST(N'2021-11-12' AS Date), 1, NULL)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Price], [Discount], [Product_SalePrice], [Product_Quantity], [Product_ImgURL], [Product_Description], [Brand_ID], [Category_ID], [OS_ID], [RAM_ID], [CPU_ID], [Display_ID], [Capacity_ID], [Card_ID], [Product_CreateDate], [Product_Status], [Product_ModifyDate]) VALUES (20, N'MSI GP66 Leopard 11UE-643VN', 44400000.0000, 0.15, 37740000.0000, 4, N'msi-bravo-15-hanoicomputer.jpg', N'Laptop gaming MSI GP66 Leopard 11UE-643VN là mẫu laptop được thiết kế dành cho những game thủ cần phát huy hiệu năng phần cứng tối đa. Đảm nhận tối đa các tác vụ đồ họa phức tạp, mô phỏng chuyển động hay thiết kế kiến trúc với độ chi tiết cao, laptop MSI gaming GP66 Leopard 11UE-643VN đều dễ dàng đáp ứng khả năng hoạt động tốt.', 4, 3, 1, 1, 6, 3, 4, 5, CAST(N'2020-03-04' AS Date), 1, NULL)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Price], [Discount], [Product_SalePrice], [Product_Quantity], [Product_ImgURL], [Product_Description], [Brand_ID], [Category_ID], [OS_ID], [RAM_ID], [CPU_ID], [Display_ID], [Capacity_ID], [Card_ID], [Product_CreateDate], [Product_Status], [Product_ModifyDate]) VALUES (21, N'HP ENVY x360 13-bd0063dx ', 22980000.0000, 0.10000000149011612, 20681999.9658, 10, N'9359_hp_envy_x360_convert_13_bd0063dx_3.jpg', N'HP Envy 13 lÃ  má»t trong nhá»¯ng laptop ÄÆ°á»£c ÄÃ¡nh giÃ¡ cao trÃªn thá» trÆ°á»ng, sá» há»¯u tÃ­nh nÄng tuyá»t vá»i vÃ  giÃ¡ cáº£ pháº£i chÄng. Envy 13 vá»i thiáº¿t káº¿ cá»±c gá»n nháº¹ lÃ  sá»± lá»±a chá»n tá»t cho sinh viÃªn vÃ  ngÆ°á»i dÃ¹ng phá» thÃ´ng.

HP Envy 13 lÃ  máº«u ultrabook ráº¥t Äáº¹p, tuy khÃ´ng Äá»t phÃ¡ vÃ  ná»nh máº¯t nhÆ° XPS 13 9300, hay nhiá»u mÃ u sáº¯c nhÆ° Surface Laptop 3. Vá»i mÃ n hÃ¬nh 13 inch viá»n má»ng cÃ³ há» trá»£ cáº£m á»©ng siÃªu mÆ°á»£t vÃ  CPU tháº¿ há» 11 má»i nháº¥t, cháº¯c cháº¯n Envy 13 mang láº¡i há»©ng thÃº cho báº¡n.', 6, 2, 1, 2, 2, 3, 2, 6, CAST(N'2022-06-23' AS Date), 1, NULL)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Price], [Discount], [Product_SalePrice], [Product_Quantity], [Product_ImgURL], [Product_Description], [Brand_ID], [Category_ID], [OS_ID], [RAM_ID], [CPU_ID], [Display_ID], [Capacity_ID], [Card_ID], [Product_CreateDate], [Product_Status], [Product_ModifyDate]) VALUES (22, N'Laptop Lenovo Ideapad 1 11IGL05 81VT006FVN', 6000000.0000, 0, 6000000.0000, 10, N'45146_45146_lenovo_ideapad_1_grey_ha4.jpg', N'Laptop Lenovo Ideapad 1 là một sản phẩm giá rẻ dưới 10 triệu đồng, là một laptop mỏng nhẹ được thiết kế để phục vụ cho nhu cầu xử lý các công việc học tập - văn phòng trực tuyến một cách linh hoạt, tiện dụng.', 3, 3, 1, 1, 2, 2, 3, 1, CAST(N'2022-07-11' AS Date), 0, NULL)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Price], [Discount], [Product_SalePrice], [Product_Quantity], [Product_ImgURL], [Product_Description], [Brand_ID], [Category_ID], [OS_ID], [RAM_ID], [CPU_ID], [Display_ID], [Capacity_ID], [Card_ID], [Product_CreateDate], [Product_Status], [Product_ModifyDate]) VALUES (23, N'Asus Rog Flow', 45000000.0000, 0.20000000298023224, 35999999.8659, 5, N'_0001_64501_laptop_asus_gaming_zephyru_1_.jpg', N'Laptop Asus Rog Strix GZ301ZC-LD110W có trọng lượng cực nhẹ chỉ 1.18kg, thiết kế hiện đại với hiệu năng mạnh mẽ. Với chiếc laptop Asus Gaming này bạn có thể dùng để phục vụ cho công việc, học tập hay cày game nghe nhạc đều ổn. Xem đoạn mô tả chi tiết dưới đây để hiểu rõ hơn về Asus Rog Strix GZ301ZC.', 2, 1, 1, 3, 3, 3, 5, 7, CAST(N'2022-07-13' AS Date), 1, NULL)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Price], [Discount], [Product_SalePrice], [Product_Quantity], [Product_ImgURL], [Product_Description], [Brand_ID], [Category_ID], [OS_ID], [RAM_ID], [CPU_ID], [Display_ID], [Capacity_ID], [Card_ID], [Product_CreateDate], [Product_Status], [Product_ModifyDate]) VALUES (1024, N'Laptop dell', 1000000.0000, 0.20000000298023224, 799999.9970, 20, N'Best-Gaming-Laptop-1-920x613.jpg', N'dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd', 1, 1, 1, 1, 1, 1, 1, 1, CAST(N'2022-07-20' AS Date), 1, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[RAM] ON 

INSERT [dbo].[RAM] ([RAM_ID], [RAM_Name], [RAM_Status]) VALUES (1, N'4GB', 1)
INSERT [dbo].[RAM] ([RAM_ID], [RAM_Name], [RAM_Status]) VALUES (2, N'8GB', 1)
INSERT [dbo].[RAM] ([RAM_ID], [RAM_Name], [RAM_Status]) VALUES (3, N'16GB', 1)
INSERT [dbo].[RAM] ([RAM_ID], [RAM_Name], [RAM_Status]) VALUES (4, N'32GB', 1)
INSERT [dbo].[RAM] ([RAM_ID], [RAM_Name], [RAM_Status]) VALUES (5, N'', NULL)
SET IDENTITY_INSERT [dbo].[RAM] OFF
GO
SET IDENTITY_INSERT [dbo].[Role_Account] ON 

INSERT [dbo].[Role_Account] ([Role_ID], [Role_Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role_Account] ([Role_ID], [Role_Name]) VALUES (2, N'Customer')
INSERT [dbo].[Role_Account] ([Role_ID], [Role_Name]) VALUES (3, N'Saler')
INSERT [dbo].[Role_Account] ([Role_ID], [Role_Name]) VALUES (4, N'Marketer')
SET IDENTITY_INSERT [dbo].[Role_Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Setting] ON 

INSERT [dbo].[Setting] ([Setting_ID], [Type], [Value], [Order], [Description], [Setting_Status]) VALUES (1, N'Setting1', N'Setting1', N'Setting1', N'Setting1', 1)
INSERT [dbo].[Setting] ([Setting_ID], [Type], [Value], [Order], [Description], [Setting_Status]) VALUES (2, N'Setting2', N'Setting2', N'Setting2', N'Setting2', 1)
INSERT [dbo].[Setting] ([Setting_ID], [Type], [Value], [Order], [Description], [Setting_Status]) VALUES (3, N'xcvb', N'xcvb', N'xcvb', N'xcvb', 1)
INSERT [dbo].[Setting] ([Setting_ID], [Type], [Value], [Order], [Description], [Setting_Status]) VALUES (4, N'son', N'son', N'son', N'test setting', 1)
SET IDENTITY_INSERT [dbo].[Setting] OFF
GO
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([Slide_ID], [Title], [Content], [ImgURL], [Slide_Status]) VALUES (1, N'Đại tiệc Laptop Gaming', N'Nếu bạn là game thủ thì không thể bỏ qua các dòng laptop gaming. Laptop gaming (laptop chuyên game) là loại máy tính xách tay được thiết kế nâng cấp chuyên biệt phục vụ cho việc chơi game nặng, các trò chơi điện tử trên máy tính cần có xử lý mạnh về đồ họa.', N'Best-2-in-1-Laptop-for-2022.jpg', 0)
INSERT [dbo].[Slider] ([Slide_ID], [Title], [Content], [ImgURL], [Slide_Status]) VALUES (2, N'Party công nghệ', N'Để mang đến muôn vàn sản phẩm máy tính, công nghệ thông tin ấn tương phù hợp với nhu cầu người dùng giới trẻ hiện nay kèm theo nhiều phần quà tặng hấp dẫn, độc đáo, An Phát Computer xin gửi đến chương trình ưu đãi hấp dẫn có một không hai – một bữa tiệc mua sắm chào hè cực kỳ ấn tượng và linh đình trong thời gian từ 18/05/2022 đến 13/06/2022 với nội dung như sau:

Khi mua các sản phẩm máy tính PCAP (PC An Phát) Cao Cấp có mức giá từ 22 triệu đồng trở lên, người dùng sẽ được tặng ngay phần quà trị giá lên đến 5 triệu. Nổi bật nhất trong số những chiếc PCAP Cao Cấp đó, chính là PCAP MONA LISA S với mức giá chiết khấu chỉ còn 73.499.000 VNĐ kèm theo voucher giảm giá 300.000 VNĐ khi mua cùng Màn Hình Dell. Bên cạnh toàn bộ những Deal PCAP hoành tráng này, An Phát Computer cũng mang đến cho người dùng các mức khuyến mãi khác khi BUILD PC theo hình thức CUSTOM (tự chọn linh kiện lắp ráp) từ cấu hình 5 triệu cho đến 100 triệu.', N'photo-1-1653035865256503262648-1653039950084-16530399504671413924173.jpg', 1)
INSERT [dbo].[Slider] ([Slide_ID], [Title], [Content], [ImgURL], [Slide_Status]) VALUES (3, N'Hot Laptop Asus', N'Ultrawide có thể coi là một trong những bước phát triển lớn của màn hình máy tính. Bằng cách thay đổi tỷ lệ truyền thống 16:9 thành 21:9, màn hình Ultrawide đem lại không gian làm việc rộng rãi, trải nghiệm game cũng sống động hơn vì đưa hình ảnh bao phủ hết tầm nhìn của người dùng. Chưa dừng lại ở đó, 21:9 chính là tỷ lệ của những bộ phim bom tấn, từ đó loại bỏ hoàn toàn những khoảng đen trên và dưới khi xem trên màn hình 16:9. Lựa chọn kinh tế nhất là chiếc LG 29WP500-B, với mức giá chỉ khoảng 6.4 triệu. Màn hình có những thế mạnh là sử dụng tấm nền IPS không bị đổi màu khi nhìn từ góc nghiêng, khả năng hiển thị 99% dải màu sRGB, tần số làm tươi 75Hz, có chuẩn HDR10 và công nghệ chống xé hình AMD FreeSync. Nhưng nằm ở tầm giá rẻ, LG 29WP500-B cũng có một vài yếu điểm như độ phân giải chỉ 2560 x 1080 (FullHD dạng Ultrawide), kích thước nhỏ chỉ 29 inch.', N'laptopsmoon-blogroll-1558134085315_160w.jpg', 1)
INSERT [dbo].[Slider] ([Slide_ID], [Title], [Content], [ImgURL], [Slide_Status]) VALUES (4, N'HP 205 Pro G8 AiO', N'Thiết kế nhỏ gọn, hiện đại

Đặc điểm nổi bật nhất của HP 205 Pro G8 là sự gọn nhẹ nhờ tích hợp đầy đủ các chức năng của một PC thông thường mà không cần kết nối phức tạp. HP đã đưa ra giải pháp tối ưu hóa không gian bàn làm việc cũng như tăng tính cơ động của sản phẩm với trọng lượng chỉ vỏn vẹn 5.37 kg và chỉ sử dụng một dây cấp nguồn. Mang thiết kế chân đế mới và tối giản hơn so với các thế hệ AiO trước, HP 205 G8 nổi bật nhờ sự thanh lịch và gọn nhẹ nhưng vẫn vô cùng bền bỉ và chắc chắn.

Trải nghiệm hình ảnh sắc nét

Với viền màn hình 3 cạnh siêu mỏng, HP 205 Pro G8 sở hữu màn hình 23.8 inch với chất lượng hình ảnh đạt chuẩn Full HD (1920 x 1080) và tấm nền IPS cho góc nhìn rộng, độ sáng 250 nits. Công nghệ chống nhìn trộm Anti Glare giúp người dùng hoàn toàn thoải mái về độ bảo mật thông tin trong khi sử dụng. Hiệu năng mạnh mẽ thoả mãn mọi nhu cầu học tập và làm việc


HP đem tới 3 tùy chọn cấu hình cho người dùng với mức giá vô cùng hơp lý. Dù lựa chọn cấu hình nào, chiếc máy tính AiO của bạn cũng sẽ đem lại hiệu năng mạnh mẽ với chip AMD thế hệ mới và RAM từ 4GB, SSD từ 256GB đảm bảo mọi tác vụ mượt mà. Card đồ họa tích hợp AMD Radeon Graphics đem lại tốc độ và khả năng xử lý hình ảnh tốt, không chỉ đáp ứng hoàn hảo các nhu cầu hình ảnh trong làm việc và học tập mà còn đem lại trải nghiệm tốt trong những giờ phút giải trí.

Nắm bắt nhu cầu làm việc và học tập trực tuyến hiện nay, HP mang đến trải nghiệm hội họp chất lượng cao với hệ thống microphone tích hợp và webcam 5MP cùng độ phân giải có thể lên tới 2592 x 1944.', N'65d0d901c19d92bded2e1a0defa3b95e_original.jpg', 0)
INSERT [dbo].[Slider] ([Slide_ID], [Title], [Content], [ImgURL], [Slide_Status]) VALUES (5, N'Sắm laptop mới ', N'MateBook 14 là laptop hướng tới doanh nhân, mặc dù có giá bán không quá cao nhưng cũng đã có chất lượng hoàn thiện tốt bằng kim loại, cấu hình đủ dùng nhờ Intel Core i5-1135G7 và bộ nhớ 8/512GB.

Bên cạnh đó máy còn có những điểm đặc biệt: Màn hình 14 inch 2K với tỷ lệ 3:2 để cho cảm giác sử dụng rộng rãi, kèm theo đó là webcam được đặt ẩn dưới bàn phím để tiết kiệm diện tích, cũng như tăng tính bảo mật vì khi không dùng bạn có thể vô hiệu hóa nó đi. Muốn có sự gọn nhẹ, tiện dụng nhưng không phải bỏ ra quá nhiều tiền thì Surface Go 2 là lựa chọn dành cho bạn. Máy trang bị màn hình cảm ứng 10.5 inch tỷ lệ 3:2, vi xử lý Intel Pentium 4425Y, bộ nhớ 8/128GB kèm khả năng tháo bàn phím để dùng như một chiếc máy tính bảng. Nói đến "laptop văn phòng" mà không nói tới dòng Dell XPS thì quả là một "tội ác". Dell XPS 13 (9300) sở hữu độ hoàn thiện cao bằng kim loại và sợi carbon, thiết kế sang trọng, vi xử lý i5-1035G1, màn hình 13.4 inch FullHD+, bộ nhớ 8/256GB và tính di động nhờ cân nặng chỉ 1.2kg.', N'laptopsmoon-blogroll-1558134085315_160w.jpg', 0)
INSERT [dbo].[Slider] ([Slide_ID], [Title], [Content], [ImgURL], [Slide_Status]) VALUES (6, N'Không cần mua thêm máy tính bảng', N'Những dòng máy tính bảng cao cấp hiện nay đều có tính năng hoạt động với bút, Apple thì có Apple Pencil, dòng Galaxy Tab từ Samsung hoạt động với bút S Pen của hãng. Những chiếc bút này giúp người dùng viết lại những ý tưởng trong ngày, ký họa các bức tranh đẹp mắt hoặc đơn giản nhất là thao tác trên giao diện với độ chính xác cao hơn so với ngón tay. Nhưng nếu bạn chỉ muốn mua một chiếc laptop với hệ điều hành Windows, và không muốn mua thêm một thiết bị khác thì sao? Hãy cùng Webuy "đi chợ" những dòng máy tính dạng 2-trong-1, vừa là laptop vừa có thể biến thành máy tính bảng, đặc biệt là phải sử dụng được với những chiếc bút. ', N'galaxy-tab-s8-ultra-minh-duc-13-16461250172561410835397.jpg', 0)
INSERT [dbo].[Slider] ([Slide_ID], [Title], [Content], [ImgURL], [Slide_Status]) VALUES (7, N'Huawei đã làm gì', N'Chiến lược PC của Huawei tạo tiếng vang mạnh mẽ

Không quan trọng bạn mua PC của mình từ thương hiệu nào, có một điều mà chúng ta đều đồng ý là: Kể từ khi Huawei gia nhập ngành công nghiệp PC vào năm 2016, đã có rất nhiều thay đổi, đồng thời gây ảnh hưởng mạnh mẽ đến hoạt động kinh doanh PC của Huawei và tương lai của toàn ngành.

Hiện tại, Huawei là thương hiệu máy tính xách tay phổ biến nhất và là thương hiệu lớn thứ hai về thị phần ở Trung Quốc, đứng đầu về chỉ số hài lòng NPS trong số tất cả các thương hiệu máy tính xách tay tại thị trường nội địa.

Tạo ra PC với cùng tư duy đã làm với điện thoại thông minh

Nhiều năm trước, giống như máy tính để bàn thu hút nhiều người theo dõi DIY, máy tính xách tay cũng di chuyển theo cùng một quỹ đạo. Để đáp ứng nhu cầu thị trường, các nhà sản xuất đã tạo ra những chiếc máy tính xách tay lớn hơn, dày hơn và nặng hơn.

Khi đó tại MWC 2016, Huawei đã giới thiệu chiếc máy tính xáy tay HUAWEI MateBook đầu tiên, siêu mỏng, mang đến hiệu suất tuyệt vời và trải nghiệm mượt mà. Giới công nghệ đã đặt câu hỏi liệu Huawei đang sản xuất một chiếc máy tính xách tay nhẹ hay một chiếc máy tính xách tay hiệu năng. Đáp lại, Huawei khẳng định họ có thể tạo ra chiếc máy tính xách tay đảm bảo cả hai yếu tố này.', N'65d0d901c19d92bded2e1a0defa3b95e_original.jpg', 1)
SET IDENTITY_INSERT [dbo].[Slider] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([Role_ID])
REFERENCES [dbo].[Role_Account] ([Role_ID])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([Account_ID])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[ImageBlog]  WITH CHECK ADD FOREIGN KEY([Blog_ID])
REFERENCES [dbo].[Blog] ([Blog_ID])
GO
ALTER TABLE [dbo].[ImageProduct]  WITH CHECK ADD FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([Account_ID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Order] ([Order_ID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([Brand_ID])
REFERENCES [dbo].[Brand] ([Brand_ID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([Capacity_ID])
REFERENCES [dbo].[Capacity] ([Capacity_ID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([Card_ID])
REFERENCES [dbo].[Card] ([Card_ID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Category] ([Category_ID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CPU_ID])
REFERENCES [dbo].[CPU] ([CPU_ID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([Display_ID])
REFERENCES [dbo].[Display] ([Display_ID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([OS_ID])
REFERENCES [dbo].[OperatingSystem] ([OS_ID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([RAM_ID])
REFERENCES [dbo].[RAM] ([RAM_ID])
GO
