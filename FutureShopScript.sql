USE [master]
GO
/****** Object:  Database [FutureShop]    Script Date: 05/29/2014 16:31:05 ******/
CREATE DATABASE [FutureShop] ON  PRIMARY 
( NAME = N'FutureShop', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MITESH\MSSQL\DATA\FutureShop.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FutureShop_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MITESH\MSSQL\DATA\FutureShop_1.LDF' , SIZE = 504KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FutureShop] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FutureShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FutureShop] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [FutureShop] SET ANSI_NULLS OFF
GO
ALTER DATABASE [FutureShop] SET ANSI_PADDING OFF
GO
ALTER DATABASE [FutureShop] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [FutureShop] SET ARITHABORT OFF
GO
ALTER DATABASE [FutureShop] SET AUTO_CLOSE ON
GO
ALTER DATABASE [FutureShop] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [FutureShop] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [FutureShop] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [FutureShop] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [FutureShop] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [FutureShop] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [FutureShop] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [FutureShop] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [FutureShop] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [FutureShop] SET  DISABLE_BROKER
GO
ALTER DATABASE [FutureShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [FutureShop] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [FutureShop] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [FutureShop] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [FutureShop] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [FutureShop] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [FutureShop] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [FutureShop] SET  READ_WRITE
GO
ALTER DATABASE [FutureShop] SET RECOVERY SIMPLE
GO
ALTER DATABASE [FutureShop] SET  MULTI_USER
GO
ALTER DATABASE [FutureShop] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [FutureShop] SET DB_CHAINING OFF
GO
USE [FutureShop]
GO
/****** Object:  Table [dbo].[Schemes]    Script Date: 05/29/2014 16:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Schemes](
	[PlanID] [int] IDENTITY(1,1) NOT NULL,
	[PlanName] [varchar](200) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[DiscountInPercentage] [int] NOT NULL,
	[PlanDuration] [int] NOT NULL,
	[PlanImage] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[PlanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Schemes] ON
INSERT [dbo].[Schemes] ([PlanID], [PlanName], [Price], [DiscountInPercentage], [PlanDuration], [PlanImage]) VALUES (1, N'Silver', CAST(500 AS Decimal(18, 0)), 5, 6, N'pix/silvermembership.jpg')
INSERT [dbo].[Schemes] ([PlanID], [PlanName], [Price], [DiscountInPercentage], [PlanDuration], [PlanImage]) VALUES (2, N'Gold', CAST(1000 AS Decimal(18, 0)), 10, 6, N'pix/goldmembership.jpg')
INSERT [dbo].[Schemes] ([PlanID], [PlanName], [Price], [DiscountInPercentage], [PlanDuration], [PlanImage]) VALUES (3, N'Platinum', CAST(1500 AS Decimal(18, 0)), 15, 6, N'pix/platinummembership.jpg')
SET IDENTITY_INSERT [dbo].[Schemes] OFF
/****** Object:  Table [dbo].[RegionMapping]    Script Date: 05/29/2014 16:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RegionMapping](
	[RID] [int] IDENTITY(1,1) NOT NULL,
	[RegionName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[RegionMapping] ON
INSERT [dbo].[RegionMapping] ([RID], [RegionName]) VALUES (1, N'Vidharbha')
INSERT [dbo].[RegionMapping] ([RID], [RegionName]) VALUES (2, N'Marathwada')
INSERT [dbo].[RegionMapping] ([RID], [RegionName]) VALUES (3, N'Konkan')
INSERT [dbo].[RegionMapping] ([RID], [RegionName]) VALUES (4, N'Vidarbh')
INSERT [dbo].[RegionMapping] ([RID], [RegionName]) VALUES (5, N'Khandesh')
INSERT [dbo].[RegionMapping] ([RID], [RegionName]) VALUES (6, N'Desh')
SET IDENTITY_INSERT [dbo].[RegionMapping] OFF
/****** Object:  Table [dbo].[Category]    Script Date: 05/29/2014 16:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](200) NOT NULL,
	[PicPath] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([CID], [CategoryName], [PicPath]) VALUES (1, N'Furniture', N'pix/Furniture.jpg')
INSERT [dbo].[Category] ([CID], [CategoryName], [PicPath]) VALUES (2, N'Mens Ware', N'pix/MensWare.jpg')
INSERT [dbo].[Category] ([CID], [CategoryName], [PicPath]) VALUES (3, N'Electronics', N'pix/Electronicspage.jpg')
INSERT [dbo].[Category] ([CID], [CategoryName], [PicPath]) VALUES (4, N'Sports', N'pix/sports.jpg')
INSERT [dbo].[Category] ([CID], [CategoryName], [PicPath]) VALUES (5, N'Books', N'pix/Books.jpg')
INSERT [dbo].[Category] ([CID], [CategoryName], [PicPath]) VALUES (6, N'Movies', N'pix/movies.jpg')
INSERT [dbo].[Category] ([CID], [CategoryName], [PicPath]) VALUES (8, N'Music', N'pix/music.jpeg')
INSERT [dbo].[Category] ([CID], [CategoryName], [PicPath]) VALUES (9, N'Womens Ware', N'pix/Womens-Formal-Wear.jpg')
INSERT [dbo].[Category] ([CID], [CategoryName], [PicPath]) VALUES (10, N'Kids Wear', N'pix/kids-wear.jpg')
INSERT [dbo].[Category] ([CID], [CategoryName], [PicPath]) VALUES (12, N'Bags', N'pix/bags.jpeg')
INSERT [dbo].[Category] ([CID], [CategoryName], [PicPath]) VALUES (42, N'fedg', N'pix/Deal.jpeg')
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  Table [dbo].[UserRegister]    Script Date: 05/29/2014 16:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserRegister](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[Email] [varchar](500) NOT NULL,
	[Password] [varchar](500) NOT NULL,
	[SQuestion] [varchar](200) NOT NULL,
	[SAnswer] [varchar](200) NOT NULL,
	[NewsLetter] [int] NOT NULL,
	[InsertionDate] [date] NOT NULL,
	[ModificationDate] [date] NULL,
	[PlanSelected] [varchar](500) NULL,
	[PlanDuration] [int] NULL,
	[UserName] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[UserRegister] ON
INSERT [dbo].[UserRegister] ([UserID], [FirstName], [LastName], [Email], [Password], [SQuestion], [SAnswer], [NewsLetter], [InsertionDate], [ModificationDate], [PlanSelected], [PlanDuration], [UserName]) VALUES (1, N'swati', N'patra', N'swatiswapna.patra@webaccess.co.in', N'498b5924adc469aa7b660f457e0fc7e5', N'Favourite Color', N'Black', 0, CAST(0xAF370B00 AS Date), CAST(0xDD370B00 AS Date), N'Gold', 6, N'swati')
INSERT [dbo].[UserRegister] ([UserID], [FirstName], [LastName], [Email], [Password], [SQuestion], [SAnswer], [NewsLetter], [InsertionDate], [ModificationDate], [PlanSelected], [PlanDuration], [UserName]) VALUES (2, N'mufaddal', N'nullwala', N'mufaddal.nullwala@webaccess.co.in', N'0051d2fb57868d006dbd369240ffb48d', N'Favourite Food item', N'chicken', 0, CAST(0xAF370B00 AS Date), CAST(0xBD370B00 AS Date), N'Platinum', 6, N'mufaddal')
INSERT [dbo].[UserRegister] ([UserID], [FirstName], [LastName], [Email], [Password], [SQuestion], [SAnswer], [NewsLetter], [InsertionDate], [ModificationDate], [PlanSelected], [PlanDuration], [UserName]) VALUES (3, N'nilesh', N'kathoke', N'nilesh.kathoke@webaccess.co.in', N'0d7d1f5e65151da021c99a1fd84107cd', N'Favourite Food item', N'chicken', 0, CAST(0xB6370B00 AS Date), NULL, NULL, NULL, N'nilesh')
INSERT [dbo].[UserRegister] ([UserID], [FirstName], [LastName], [Email], [Password], [SQuestion], [SAnswer], [NewsLetter], [InsertionDate], [ModificationDate], [PlanSelected], [PlanDuration], [UserName]) VALUES (4, N'kamlesh', N'charde', N'kamlesh.charde@webaccess.co.in', N'9c3e7dd856c5ad176ee9929e0034153e', N'Best Friend', N'Nilesh', 0, CAST(0xBD370B00 AS Date), CAST(0xE0370B00 AS Date), N'Gold', 6, N'kamlesh')
INSERT [dbo].[UserRegister] ([UserID], [FirstName], [LastName], [Email], [Password], [SQuestion], [SAnswer], [NewsLetter], [InsertionDate], [ModificationDate], [PlanSelected], [PlanDuration], [UserName]) VALUES (8, N'Vyvyan', N'Patra', N'vyvyan@outlook.com', N'db40368bb987d8a861f2eb1f96015a0a', N'Favourite Food item', N'egg', 0, CAST(0xDD370B00 AS Date), CAST(0xDE370B00 AS Date), N'Silver', 6, N'vyvyan')
INSERT [dbo].[UserRegister] ([UserID], [FirstName], [LastName], [Email], [Password], [SQuestion], [SAnswer], [NewsLetter], [InsertionDate], [ModificationDate], [PlanSelected], [PlanDuration], [UserName]) VALUES (9, N'Surekha', N'Jadhav', N'surekha.jadhav@webaccess.co.in', N'a8a4794922ace2873601088ac49dce47', N'Favourite Food item', N'chinese', 0, CAST(0xDD370B00 AS Date), NULL, NULL, NULL, N'surekha')
INSERT [dbo].[UserRegister] ([UserID], [FirstName], [LastName], [Email], [Password], [SQuestion], [SAnswer], [NewsLetter], [InsertionDate], [ModificationDate], [PlanSelected], [PlanDuration], [UserName]) VALUES (10, N'Amol', N'Chavan', N'amol.chavan@webaccess.co.in', N'ad18402c560a3f54d0c1785881f1d2a7', N'Favourite Food item', N'chinese', 0, CAST(0xDF370B00 AS Date), NULL, NULL, NULL, N'amol')
SET IDENTITY_INSERT [dbo].[UserRegister] OFF
/****** Object:  Table [dbo].[DisrictMapping]    Script Date: 05/29/2014 16:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DisrictMapping](
	[DID] [int] IDENTITY(1,1) NOT NULL,
	[RID] [int] NOT NULL,
	[District] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[DisrictMapping] ON
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (1, 1, N'Akola')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (2, 1, N'Amravati')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (3, 1, N'Buldhana')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (4, 1, N'Yavatmal')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (5, 1, N'Washim')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (6, 2, N'Aurangabad')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (7, 2, N'Beed')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (8, 2, N'Jalna')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (9, 2, N'Latur')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (10, 2, N'Nanded')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (11, 2, N'Parbhani')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (12, 3, N'Mumbai')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (13, 3, N'Thane')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (14, 3, N'Ratnagiri')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (15, 3, N'Raigad')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (16, 3, N'Sindhudurg')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (17, 4, N'Bhandara')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (18, 4, N'Chandrapur')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (19, 4, N'Gadhchiroli')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (20, 4, N'Gondia')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (21, 4, N'Nagpur')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (22, 4, N'Wardha')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (23, 5, N'Ahmednagar')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (24, 5, N'Dhule')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (25, 5, N'Jalgaon')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (26, 5, N'Nandurbar')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (27, 5, N'Nashik')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (28, 6, N'Kolhapur')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (29, 6, N'Pune')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (30, 6, N'Sangli')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (31, 6, N'Satara')
INSERT [dbo].[DisrictMapping] ([DID], [RID], [District]) VALUES (32, 6, N'Solapur')
SET IDENTITY_INSERT [dbo].[DisrictMapping] OFF
/****** Object:  Table [dbo].[SubCategory]    Script Date: 05/29/2014 16:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SCID] [int] IDENTITY(1,1) NOT NULL,
	[CID] [int] NOT NULL,
	[SCategoryName] [varchar](200) NOT NULL,
	[PicPath] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SCID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SubCategory] ON
INSERT [dbo].[SubCategory] ([SCID], [CID], [SCategoryName], [PicPath]) VALUES (1, 1, N'BedRoom', N'pix/Bedroom-Furniture.jpg')
INSERT [dbo].[SubCategory] ([SCID], [CID], [SCategoryName], [PicPath]) VALUES (2, 1, N'Kitchen', N'pix/kitchen_cabinet.jpg')
INSERT [dbo].[SubCategory] ([SCID], [CID], [SCategoryName], [PicPath]) VALUES (3, 3, N'Mobile', N'pix/mobile.jpg')
INSERT [dbo].[SubCategory] ([SCID], [CID], [SCategoryName], [PicPath]) VALUES (4, 3, N'Computer', N'pix/Computer.jpeg')
INSERT [dbo].[SubCategory] ([SCID], [CID], [SCategoryName], [PicPath]) VALUES (5, 1, N'LivingRoom', N'pix/living-room-.jpg')
INSERT [dbo].[SubCategory] ([SCID], [CID], [SCategoryName], [PicPath]) VALUES (6, 1, N'Office', N'pix/office furniture.jpg')
INSERT [dbo].[SubCategory] ([SCID], [CID], [SCategoryName], [PicPath]) VALUES (7, 1, N'Kids', N'pix/KidsFurniture.jpg')
INSERT [dbo].[SubCategory] ([SCID], [CID], [SCategoryName], [PicPath]) VALUES (8, 2, N'Shirts', N'pix/shirts.jpeg')
INSERT [dbo].[SubCategory] ([SCID], [CID], [SCategoryName], [PicPath]) VALUES (9, 2, N'Jeans', N'pix/jeans.jpeg')
INSERT [dbo].[SubCategory] ([SCID], [CID], [SCategoryName], [PicPath]) VALUES (12, 6, N'Bollywood', N'pix/bolly wood.jpg')
INSERT [dbo].[SubCategory] ([SCID], [CID], [SCategoryName], [PicPath]) VALUES (37, 42, N'fvdgdf', N'pix/SAle.jpg')
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
/****** Object:  Table [dbo].[ShippingCharges]    Script Date: 05/29/2014 16:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingCharges](
	[RID] [int] NOT NULL,
	[Charges] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[ShippingCharges] ([RID], [Charges]) VALUES (1, 200)
INSERT [dbo].[ShippingCharges] ([RID], [Charges]) VALUES (2, 400)
INSERT [dbo].[ShippingCharges] ([RID], [Charges]) VALUES (3, 100)
INSERT [dbo].[ShippingCharges] ([RID], [Charges]) VALUES (4, 500)
INSERT [dbo].[ShippingCharges] ([RID], [Charges]) VALUES (5, 200)
INSERT [dbo].[ShippingCharges] ([RID], [Charges]) VALUES (6, 300)
/****** Object:  Table [dbo].[Billingdetails]    Script Date: 05/29/2014 16:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Billingdetails](
	[BillingId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[FullName] [varchar](200) NOT NULL,
	[ShippingAdd] [varchar](500) NOT NULL,
	[Region] [varchar](200) NOT NULL,
	[District] [varchar](200) NOT NULL,
	[Total] [int] NOT NULL,
	[ShippingCharges] [int] NOT NULL,
	[GTotal] [int] NOT NULL,
	[TransactionId] [numeric](18, 0) NOT NULL,
	[InsertionDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BillingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Billingdetails] ON
INSERT [dbo].[Billingdetails] ([BillingId], [UserId], [FullName], [ShippingAdd], [Region], [District], [Total], [ShippingCharges], [GTotal], [TransactionId], [InsertionDate]) VALUES (1, 1, N'Swati', N'Sitaramsmriti Apt 2/204Diva(E)', N'Konkan', N'Thane', 10700, 100, 9720, CAST(2202578427 AS Numeric(18, 0)), CAST(0xE3370B00 AS Date))
INSERT [dbo].[Billingdetails] ([BillingId], [UserId], [FullName], [ShippingAdd], [Region], [District], [Total], [ShippingCharges], [GTotal], [TransactionId], [InsertionDate]) VALUES (2, 1, N'Swati', N'adadadasdas', N'Konkan', N'Thane', 600, 100, 630, CAST(2202580196 AS Numeric(18, 0)), CAST(0xE3370B00 AS Date))
INSERT [dbo].[Billingdetails] ([BillingId], [UserId], [FullName], [ShippingAdd], [Region], [District], [Total], [ShippingCharges], [GTotal], [TransactionId], [InsertionDate]) VALUES (3, 1, N'Swati', N'sdsdsddasdasd', N'Konkan', N'Thane', 600, 100, 630, CAST(2202581411 AS Numeric(18, 0)), CAST(0xE3370B00 AS Date))
SET IDENTITY_INSERT [dbo].[Billingdetails] OFF
/****** Object:  Table [dbo].[Products]    Script Date: 05/29/2014 16:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[CID] [int] NOT NULL,
	[SCID] [int] NOT NULL,
	[ProductName] [varchar](300) NOT NULL,
	[Price] [int] NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[BrandName] [varchar](200) NOT NULL,
	[PicPath] [varchar](500) NOT NULL,
	[TotalQuantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (1, 1, 1, N'Bed', 600, N'A Large double Bed.Made of Mahogany wood.with 2 pillows 1 mattress and 1 bed spread.', N'Mattress Makers', N'pix/bed4.jpeg', 36)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (2, 1, 1, N'Pulling Bed', 980, N'A large bed. with a extension which can be pulled out and the bed can be turned into a double bed', N'Mattress Makers', N'pix/bed2.jpg', 45)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (3, 1, 1, N'Dressing Table', 2000, N'A wodden dressing table made of pure saag wood. with a large mirror and 4 drawers.', N'Zuari Furniture', N'pix/dressing_table-004.jpg', 0)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (4, 3, 3, N'Samsung Galaxy S4', 16000, N'Galaxy S4 looks splendid in white.not too big, fits in your pocket..', N'Samsung', N'pix/Samsung-Galaxy-S4-.jpeg', 49)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (5, 3, 3, N'Samsung Galaxy Grand', 20000, N'12.7cm Large Screen. GALAXY Grand is outfitted with a deluxe large display to meet your needs. Everything from larger font size to immersive viewing', N'Samsung', N'pix/Samsung_Galaxy_GrandDuos.jpg', 20)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (11, 6, 12, N'Krrish3', 400, N'Starring Hrithik Roshan,Priyanka Chopra and Vivek Oberoi', N'FilmKraft Productions ', N'pix/Krrish3_Poster-2_clean.jpg', 23)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (12, 1, 1, N'RedSingleBed', 1200, N'A single bed Red in colour.Comfortable.Suits your pocket', N'Damro Furniture', N'pix/RedSingleBed.jpg', 55)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (23, 1, 2, N'Electrolux Fridge', 18000, N'Impress guests with this free-standing US style fridge freezer from Electrolux complete with in-door water and ice dispenser for a truly authentic feel!', N'Electrolux', N'pix/Refrigerator.jpeg', 80)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (24, 1, 2, N'Kelvinator Fridge', 20000, N'This refrigerator includes stainless steel door refrigerators and upright freezers, high performance chest freezers, and glass top ice cream display freezers. ', N'Kelvinator', N'pix/Kelvinator 1.jpg', 88)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (25, 1, 2, N'Whirlpool Fridge', 45000, N' lets you plug in a bunch of different gadgets into the big gadget that holds your food. Among the things that you can dock are the Brandmotion iPod Speaker system, which withstands "the frequent opening and closing of the freezer door" without dropping your iPod onto the ground.', N'Whirlpool', N'pix/whirlpool-fridge.jpg', 83)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (26, 1, 2, N'Apex Gas Stove', 6000, N'fitted with four high quality burners that are neatly spaced on the cook top.Tough SS body  High flame burners Easy to clean Safe operation.', N'Apex Technology', N'pix/4-burner-gas-stove-.jpg', 100)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (27, 1, 2, N'SU Gas Stove', 5500, N'Oval shape SS extra wide centre step body Jumbo burner User friendly 35 degree position of knobs.Aluminum mixing tube and gas assembly.Brass burner tops    ', N'Sumit Udyog', N'pix/Sugasstove.jpg', 68)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (28, 1, 2, N'White DIsh Set', 1600, N'Cuttlery Set 86 Pieces', N'Laopala', N'pix/HypercityCrocs.jpg', 69)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (29, 1, 5, N'Martina Sofa', 10000, N'Finish:Tan Material : Microfiber
Unique Features: Accent welting adds a stylish element of visual interest. Casual knife-edge back pillows keep the look inviting and comfortable.', N'Rendez', N'pix/martina_sofa.jpg', 68)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (30, 1, 1, N'DS Sofa Set', 6000, N'Colour Green.Small takes less place.comfortable stylish and Cost effective', N'DS Doors', N'pix/sofa-set-011.jpg', 58)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (31, 1, 5, N'EofChair', 1500, N'Red in colour.COmfortable', N'EofDreams', N'pix/EOFChair.jpeg', 63)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (32, 1, 5, N'Acc Chair', 8000, N'Red...Soft cushions...comfortable', N'HomeDesign', N'pix/acchair.jpg', 39)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (33, 1, 5, N'Dining table', 15000, N'Woodden Dining table. Made of pure teak wood', N'OSOM', N'pix/DiningTable.jpeg', 59)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (34, 1, 5, N'Glass Table', 15000, N'Stylish Glass top....6 chairs...unbreakable glass', N'Mosaikos', N'pix/GlassDiningTable.jpg', 60)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (35, 1, 5, N'Computer Table', 7000, N'Wooden computer table made of mahogany wood', N'WoodPecker', N'pix/computer-table-l6.jpg', 60)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (36, 1, 5, N'Computer table2', 8500, N'Dark Brown...made of teak wood', N'WoodPecker', N'pix/computer-table-l8.jpg', 50)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (37, 1, 6, N'LG Desktop', 6000, N'Excellent Desktop PC (Urgent Sell) Dual core 3.6Ghz, 4GB DDR3 RAM, 500 GB Hard disk 2GB Graphicd memory, 21 inch LED LG Monitor (With TV Tuner card) ', N'LG', N'pix/LGDesktop.jpg', 57)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (38, 1, 6, N'Samsung Desktop', 6900, N'LG E1942C-BN Monitor CD(Owner''s Manual)/Card D-SUB Cable AC-DC Adapter Stand Body Stand Base .', N'Samsung', N'pix/lrgscale8801031034291.jpg', 67)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (39, 1, 6, N'Chair', 680, N'Black with great coshions', N'AryanInteriors', N'pix/office-chairs-696.jpg', 60)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (40, 1, 6, N'Chair996', 1500, N'adjustable office chairs, computer chairs and office task chairs, which are designed using high quality material.', N'AryanInteriors', N'pix/Office_Chair_939.JPG', 56)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (41, 1, 7, N'KidsBed25', 28000, N'Pine wood double bed for kids', N'Kraft', N'pix/KidsBed.jpeg', 50)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (42, 1, 7, N'KidsBed2', 6900, N'Pine wood Pink bed', N'Kraft', N'pix/kids bed1.jpg', 50)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (43, 1, 7, N'KidsBed4', 8600, N'Small pink bed made of mahogany wood', N'Zuari Furnitures', N'pix/kids bed4.jpg', 123)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (44, 1, 7, N'StudyTable1', 800, N'Small study table for your small kids of 2-3 yrs old red and blue in colour', N'Pepperfry', N'pix/Studytable.jpeg', 59)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (45, 1, 7, N'Ao Study table', 1900, N'Blue in colour sterdy...', N'Thai Furnitures', N'pix/a02-study-table.jpg', 50)
INSERT [dbo].[Products] ([PID], [CID], [SCID], [ProductName], [Price], [Description], [BrandName], [PicPath], [TotalQuantity]) VALUES (49, 42, 37, N'dgdgh', 256, N'gfgh', N'hgjgh', N'pix/SAle.jpg', 125)
SET IDENTITY_INSERT [dbo].[Products] OFF
/****** Object:  Table [dbo].[OrderProductDetails]    Script Date: 05/29/2014 16:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProductDetails](
	[OPID] [int] IDENTITY(1,1) NOT NULL,
	[BillingID] [int] NOT NULL,
	[PID] [int] NOT NULL,
	[Qty] [int] NOT NULL,
	[SubTotal] [int] NOT NULL,
	[InsertionDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[OrderProductDetails] ON
INSERT [dbo].[OrderProductDetails] ([OPID], [BillingID], [PID], [Qty], [SubTotal], [InsertionDate]) VALUES (1, 1, 1, 1, 600, CAST(0xE3370B00 AS Date))
INSERT [dbo].[OrderProductDetails] ([OPID], [BillingID], [PID], [Qty], [SubTotal], [InsertionDate]) VALUES (2, 1, 40, 1, 1500, CAST(0xE3370B00 AS Date))
INSERT [dbo].[OrderProductDetails] ([OPID], [BillingID], [PID], [Qty], [SubTotal], [InsertionDate]) VALUES (3, 1, 43, 1, 8600, CAST(0xE3370B00 AS Date))
INSERT [dbo].[OrderProductDetails] ([OPID], [BillingID], [PID], [Qty], [SubTotal], [InsertionDate]) VALUES (4, 2, 1, 1, 600, CAST(0xE3370B00 AS Date))
INSERT [dbo].[OrderProductDetails] ([OPID], [BillingID], [PID], [Qty], [SubTotal], [InsertionDate]) VALUES (5, 3, 1, 1, 600, CAST(0xE3370B00 AS Date))
SET IDENTITY_INSERT [dbo].[OrderProductDetails] OFF
/****** Object:  Table [dbo].[DealOfDay]    Script Date: 05/29/2014 16:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DealOfDay](
	[DID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NOT NULL,
	[ListPrice] [int] NOT NULL,
	[TodaysDiscount_InPercent] [int] NOT NULL,
	[DiscountedPrice] [int] NOT NULL,
	[TodaysDeal] [int] NOT NULL,
	[InsertionDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DealOfDay] ON
INSERT [dbo].[DealOfDay] ([DID], [PID], [ListPrice], [TodaysDiscount_InPercent], [DiscountedPrice], [TodaysDeal], [InsertionDate]) VALUES (1, 1, 600, 80, 480, 120, CAST(0xE0370B00 AS Date))
INSERT [dbo].[DealOfDay] ([DID], [PID], [ListPrice], [TodaysDiscount_InPercent], [DiscountedPrice], [TodaysDeal], [InsertionDate]) VALUES (2, 1, 600, 85, 510, 90, CAST(0xE0370B00 AS Date))
SET IDENTITY_INSERT [dbo].[DealOfDay] OFF
/****** Object:  Table [dbo].[ProductOffers]    Script Date: 05/29/2014 16:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductOffers](
	[OfferID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](100) NOT NULL,
	[PID] [int] NOT NULL,
	[Offer] [int] NOT NULL,
	[Plans] [varchar](100) NULL,
	[InsertionDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OfferID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ProductOffers] ON
INSERT [dbo].[ProductOffers] ([OfferID], [Type], [PID], [Offer], [Plans], [InsertionDate]) VALUES (1, N'User', 1, 15, NULL, CAST(0xE0370B00 AS Date))
INSERT [dbo].[ProductOffers] ([OfferID], [Type], [PID], [Offer], [Plans], [InsertionDate]) VALUES (2, N'Member', 1, 20, N'Gold', CAST(0xE0370B00 AS Date))
SET IDENTITY_INSERT [dbo].[ProductOffers] OFF
/****** Object:  ForeignKey [fk_Map]    Script Date: 05/29/2014 16:31:05 ******/
ALTER TABLE [dbo].[DisrictMapping]  WITH CHECK ADD  CONSTRAINT [fk_Map] FOREIGN KEY([RID])
REFERENCES [dbo].[RegionMapping] ([RID])
GO
ALTER TABLE [dbo].[DisrictMapping] CHECK CONSTRAINT [fk_Map]
GO
/****** Object:  ForeignKey [fk_cat]    Script Date: 05/29/2014 16:31:05 ******/
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [fk_cat] FOREIGN KEY([CID])
REFERENCES [dbo].[Category] ([CID])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [fk_cat]
GO
/****** Object:  ForeignKey [fk_Ship]    Script Date: 05/29/2014 16:31:05 ******/
ALTER TABLE [dbo].[ShippingCharges]  WITH CHECK ADD  CONSTRAINT [fk_Ship] FOREIGN KEY([RID])
REFERENCES [dbo].[RegionMapping] ([RID])
GO
ALTER TABLE [dbo].[ShippingCharges] CHECK CONSTRAINT [fk_Ship]
GO
/****** Object:  ForeignKey [fk_Order1]    Script Date: 05/29/2014 16:31:05 ******/
ALTER TABLE [dbo].[Billingdetails]  WITH CHECK ADD  CONSTRAINT [fk_Order1] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserRegister] ([UserID])
GO
ALTER TABLE [dbo].[Billingdetails] CHECK CONSTRAINT [fk_Order1]
GO
/****** Object:  ForeignKey [fk_products]    Script Date: 05/29/2014 16:31:05 ******/
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [fk_products] FOREIGN KEY([CID])
REFERENCES [dbo].[Category] ([CID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [fk_products]
GO
/****** Object:  ForeignKey [fk_products2]    Script Date: 05/29/2014 16:31:05 ******/
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [fk_products2] FOREIGN KEY([SCID])
REFERENCES [dbo].[SubCategory] ([SCID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [fk_products2]
GO
/****** Object:  ForeignKey [fk_Order]    Script Date: 05/29/2014 16:31:05 ******/
ALTER TABLE [dbo].[OrderProductDetails]  WITH CHECK ADD  CONSTRAINT [fk_Order] FOREIGN KEY([BillingID])
REFERENCES [dbo].[Billingdetails] ([BillingId])
GO
ALTER TABLE [dbo].[OrderProductDetails] CHECK CONSTRAINT [fk_Order]
GO
/****** Object:  ForeignKey [fk_Deal]    Script Date: 05/29/2014 16:31:05 ******/
ALTER TABLE [dbo].[DealOfDay]  WITH CHECK ADD  CONSTRAINT [fk_Deal] FOREIGN KEY([PID])
REFERENCES [dbo].[Products] ([PID])
GO
ALTER TABLE [dbo].[DealOfDay] CHECK CONSTRAINT [fk_Deal]
GO
/****** Object:  ForeignKey [fk_OfferP]    Script Date: 05/29/2014 16:31:05 ******/
ALTER TABLE [dbo].[ProductOffers]  WITH CHECK ADD  CONSTRAINT [fk_OfferP] FOREIGN KEY([PID])
REFERENCES [dbo].[Products] ([PID])
GO
ALTER TABLE [dbo].[ProductOffers] CHECK CONSTRAINT [fk_OfferP]
GO
