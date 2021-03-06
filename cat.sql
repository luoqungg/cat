USE [master]
GO
/****** Object:  Database [Catpuzi]    Script Date: 2019/11/3 14:59:26 ******/
CREATE DATABASE [Catpuzi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Catpuzi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Catpuzi.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Catpuzi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Catpuzi_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Catpuzi] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Catpuzi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Catpuzi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Catpuzi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Catpuzi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Catpuzi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Catpuzi] SET ARITHABORT OFF 
GO
ALTER DATABASE [Catpuzi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Catpuzi] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Catpuzi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Catpuzi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Catpuzi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Catpuzi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Catpuzi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Catpuzi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Catpuzi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Catpuzi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Catpuzi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Catpuzi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Catpuzi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Catpuzi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Catpuzi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Catpuzi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Catpuzi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Catpuzi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Catpuzi] SET RECOVERY FULL 
GO
ALTER DATABASE [Catpuzi] SET  MULTI_USER 
GO
ALTER DATABASE [Catpuzi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Catpuzi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Catpuzi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Catpuzi] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Catpuzi', N'ON'
GO
USE [Catpuzi]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2019/11/3 14:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[admin_name] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cart]    Script Date: 2019/11/3 14:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[good_id] [int] NULL,
	[num] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cat]    Script Date: 2019/11/3 14:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat](
	[cat_id] [int] IDENTITY(1,1) NOT NULL,
	[catClass_id] [int] NULL,
	[shop_id] [int] NULL,
	[cat_sex] [tinyint] NULL,
	[cat_price] [int] NULL,
	[isAntiepidemic] [tinyint] NULL,
	[isInsect] [tinyint] NULL,
	[cat_num] [int] NULL,
	[isFullBlood] [tinyint] NULL,
	[cat_img] [nvarchar](max) NULL,
	[isRecommend] [tinyint] NULL,
 CONSTRAINT [PK_Cat] PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[catClass]    Script Date: 2019/11/3 14:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[catClass](
	[catClass_id] [int] IDENTITY(1,1) NOT NULL,
	[catClass_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_catClass] PRIMARY KEY CLUSTERED 
(
	[catClass_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[goodClass]    Script Date: 2019/11/3 14:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[goodClass](
	[goodClass_id] [int] IDENTITY(1,1) NOT NULL,
	[goodClass_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_goodClass] PRIMARY KEY CLUSTERED 
(
	[goodClass_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[goodComment]    Script Date: 2019/11/3 14:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[goodComment](
	[goodComment_id] [int] IDENTITY(1,1) NOT NULL,
	[good_id] [int] NULL,
	[user_id] [int] NULL,
	[comment] [nvarchar](max) NULL,
	[addtime] [datetime] NULL,
 CONSTRAINT [PK_goodComment] PRIMARY KEY CLUSTERED 
(
	[goodComment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[goodReply]    Script Date: 2019/11/3 14:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[goodReply](
	[goodReply_id] [int] IDENTITY(1,1) NOT NULL,
	[goodComment_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[reply] [nvarchar](max) NULL,
	[addtime] [datetime] NULL,
 CONSTRAINT [PK_goodReply] PRIMARY KEY CLUSTERED 
(
	[goodReply_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Goods]    Script Date: 2019/11/3 14:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods](
	[good_id] [int] IDENTITY(1,1) NOT NULL,
	[goodClass_id] [int] NOT NULL,
	[good_introduce] [nvarchar](max) NULL,
	[good_price] [int] NULL,
	[good_img] [nvarchar](max) NULL,
	[good_addtime] [datetime] NULL,
	[orderDetails_id] [int] NULL,
	[shop_id] [int] NULL,
 CONSTRAINT [PK_Goods] PRIMARY KEY CLUSTERED 
(
	[good_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[info]    Script Date: 2019/11/3 14:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[info](
	[info_id] [int] IDENTITY(1,1) NOT NULL,
	[infoClass_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[info_img] [nvarchar](max) NULL,
	[info_title] [nvarchar](50) NULL,
	[info_content] [nvarchar](max) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[info_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[infoClass]    Script Date: 2019/11/3 14:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[infoClass](
	[infoClass_id] [int] IDENTITY(1,1) NOT NULL,
	[infoClass_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_infoClass] PRIMARY KEY CLUSTERED 
(
	[infoClass_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[infoComment]    Script Date: 2019/11/3 14:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[infoComment](
	[infoComment_id] [int] IDENTITY(1,1) NOT NULL,
	[info_id] [int] NULL,
	[user_id] [int] NULL,
	[comment] [nvarchar](max) NULL,
	[addtime] [datetime] NULL,
 CONSTRAINT [PK_infoComment] PRIMARY KEY CLUSTERED 
(
	[infoComment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[infoReply]    Script Date: 2019/11/3 14:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[infoReply](
	[infoReply_id] [int] NOT NULL,
	[infoComment_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[reply] [nvarchar](max) NULL,
	[addtime] [datetime] NULL,
 CONSTRAINT [PK_infoReply] PRIMARY KEY CLUSTERED 
(
	[infoReply_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MakePrivate]    Script Date: 2019/11/3 14:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MakePrivate](
	[myprivate_id] [int] IDENTITY(1,1) NOT NULL,
	[Users_id] [int] NOT NULL,
	[destination] [nvarchar](50) NULL,
	[customname] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[expenses] [decimal](18, 0) NULL,
	[dates] [datetime] NULL,
	[tools] [nvarchar](50) NULL,
	[notes] [nchar](10) NULL,
 CONSTRAINT [PK_MakePrivate] PRIMARY KEY CLUSTERED 
(
	[myprivate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 2019/11/3 14:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[order_time] [datetime] NULL,
	[address] [nvarchar](max) NULL,
	[phone] [nvarchar](20) NULL,
	[zipcode] [nvarchar](10) NULL,
	[total_price] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orderDetails]    Script Date: 2019/11/3 14:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderDetails](
	[orderDetails_id] [int] IDENTITY(1,1) NOT NULL,
	[num] [int] NULL,
	[order_id] [int] NULL,
 CONSTRAINT [PK_orderDetails] PRIMARY KEY CLUSTERED 
(
	[orderDetails_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shop]    Script Date: 2019/11/3 14:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[shop_id] [int] IDENTITY(1,1) NOT NULL,
	[shop_name] [nvarchar](50) NULL,
	[user_id] [int] NULL,
	[shop_introduce] [nvarchar](max) NULL,
	[shop_addtime] [datetime] NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[shop_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2019/11/3 14:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfo](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](60) NULL,
	[phone] [varchar](20) NULL,
	[address] [nvarchar](50) NULL,
	[user_head] [nvarchar](50) NULL,
	[age] [int] NULL,
	[birth] [date] NULL,
	[sex] [tinyint] NULL,
	[password] [varchar](32) NULL,
	[user_introduce] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([admin_id], [admin_name], [password]) VALUES (1, N'ailocy', N'123456')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([cart_id], [user_id], [good_id], [num]) VALUES (2, 2, 4, 5)
INSERT [dbo].[Cart] ([cart_id], [user_id], [good_id], [num]) VALUES (3, 1, 2, 1)
INSERT [dbo].[Cart] ([cart_id], [user_id], [good_id], [num]) VALUES (4, 1, 1, 1)
INSERT [dbo].[Cart] ([cart_id], [user_id], [good_id], [num]) VALUES (5, 1, 5, 1)
INSERT [dbo].[Cart] ([cart_id], [user_id], [good_id], [num]) VALUES (6, 1, 3, 7)
SET IDENTITY_INSERT [dbo].[Cart] OFF
SET IDENTITY_INSERT [dbo].[Cat] ON 

INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (1, 1, 1, 1, 1200, 1, 1, 5, 1, N'../images/buou/1.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (2, 1, 2, 0, 1500, 1, 1, 6, 1, N'../images/buou/2.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (3, 1, 2, 1, 1200, 1, 1, 1, 1, N'../images/buou/3.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (4, 1, 2, 1, 1000, 1, 1, 5, 1, N'../images/buou/4.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (5, 1, 1, 0, 1200, 1, 1, 5, 1, N'../images/buou/5.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (6, 1, 1, 0, 1200, 1, 1, 5, 1, N'../images/buou/6.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (7, 1, 1, 1, 1233, 1, 1, 1, 1, N'../images/buou/7.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (8, 1, 1, 1, 1111, 1, 1, 4, 1, N'../images/buou/8.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (9, 1, 2, 0, 1000, 1, 1, 8, 1, N'../images/buou/9.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (10, 1, 2, 1, 1888, 1, 1, 6, 1, N'../images/buou/10.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (11, 2, 1, 1, 1888, 1, 1, 4, 1, N'../images/diluo/1.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (12, 2, 1, 0, 1777, 1, 1, 6, 1, N'../images/diluo/2.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (13, 2, 2, 1, 1555, 1, 1, 8, 1, N'../images/diluo/3.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (14, 2, 2, 1, 1555, 1, 1, 6, 1, N'../images/diluo/4.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (15, 2, 1, 1, 1444, 1, 1, 1, 1, N'../images/diluo/5.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (16, 2, 1, 1, 1333, 1, 1, 5, 1, N'../images/diluo/6.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (17, 2, 2, 0, 1999, 1, 1, 1, 1, N'../images/diluo/7.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (18, 2, 1, 1, 1888, 1, 1, 1, 6, N'../images/diluo/8.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (19, 2, 2, 1, 1777, 1, 1, 1, 7, N'../images/diluo/9.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (20, 2, 1, 1, 1666, 1, 1, 1, 6, N'../images/diluo/10.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (21, 3, 2, 1, 1555, 1, 1, 1, 1, N'../images/szheer/1.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (22, 3, 1, 1, 2888, 1, 1, 5, 1, N'../images/szheer/2.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (23, 3, 1, 0, 2000, 1, 1, 6, 1, N'../images/szheer/3.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (24, 3, 1, 0, 2000, 1, 1, 5, 1, N'../images/szheer/4.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (25, 3, 2, 1, 2000, 1, 1, 6, 1, N'../images/szheer/5.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (26, 3, 2, 1, 2000, 1, 1, 7, 1, N'../images/szheer/6.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (27, 3, 2, 1, 2999, 1, 1, 1, 1, N'../images/szheer/7.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (28, 3, 1, 1, 2000, 1, 1, 4, 1, N'../images/szheer/8.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (29, 3, 1, 1, 1000, 1, 1, 3, 1, N'../images/szheer/9.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (30, 3, 2, 1, 2000, 1, 1, 4, 1, N'../images/szheer/10.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (31, 4, 1, 1, 3000, 1, 1, 1, 1, N'../images/yduan/1.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (32, 4, 1, 1, 2000, 1, 1, 6, 1, N'../images/yduan/2.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (33, 4, 1, 1, 2000, 1, 1, 27, 1, N'../images/yduan/3.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (34, 4, 2, 0, 2000, 1, 1, 13, 1, N'../images/yduan/4.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (35, 4, 1, 1, 1999, 1, 1, 12, 1, N'../images/yduan/5.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (36, 4, 2, 0, 1000, 1, 1, 12, 1, N'../images/yduan/6.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (37, 4, 1, 0, 1000, 1, 1, 10, 1, N'../images/yduan/7.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (38, 4, 1, 0, 2000, 1, 1, 1, 1, N'../images/yduan/8.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (39, 4, 2, 1, 1888, 1, 1, 17, 1, N'../images/yduan/9.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (40, 4, 1, 1, 1888, 1, 1, 11, 1, N'../images/yduan/10.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (41, 5, 1, 1, 2000, 1, 1, 10, 1, N'../images/bosi/1.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (42, 5, 1, 1, 2000, 1, 1, 10, 1, N'../images/bosi/2.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (43, 5, 2, 1, 2999, 1, 1, 1, 1, N'../images/bosi/3.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (44, 5, 2, 0, 2000, 1, 1, 8, 1, N'../images/bosi/4.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (45, 5, 1, 0, 2999, 1, 1, 9, 1, N'../images/bosi/5.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (46, 5, 1, 1, 2999, 1, 1, 7, 1, N'../images/bosi/6.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (47, 5, 2, 1, 2000, 1, 1, 11, 1, N'../images/bosi/7.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (48, 5, 1, 0, 1999, 1, 1, 8, 1, N'../images/bosi/8.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (49, 5, 1, 0, 1666, 1, 1, 9, 1, N'../images/bosi/9.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (50, 5, 1, 1, 1999, 1, 1, 3, 1, N'../images/bosi/10.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (51, 6, 1, 1, 1888, 1, 1, 6, 1, N'../images/elan/1.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (52, 6, 1, 0, 1888, 1, 1, 7, 1, N'../images/elan/2.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (53, 6, 1, 1, 1888, 1, 1, 6, 1, N'../images/elan/3.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (54, 6, 2, 1, 1000, 1, 1, 7, 1, N'../images/elan/4.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (55, 6, 1, 1, 2000, 1, 1, 1, 1, N'../images/elan/5.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (56, 6, 1, 0, 2000, 1, 1, 11, 1, N'../images/elan/6.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (57, 6, 2, 1, 999, 1, 1, 17, 1, N'../images/elan/7.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (58, 6, 1, 0, 2000, 1, 1, 1, 1, N'../images/elan/8.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (59, 6, 2, 1, 2666, 1, 1, 7, 1, N'../images/elan/9.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (60, 6, 1, 0, 2222, 1, 1, 18, 1, N'../images/elan/10.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (61, 7, 1, 1, 2000, 1, 1, 8, 1, N'../images/mduan/1.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (62, 7, 1, 1, 2000, 1, 1, 6, 1, N'../images/mduan/2.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (63, 7, 1, 0, 2000, 1, 1, 7, 1, N'../images/mduan/3.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (64, 7, 1, 1, 2000, 1, 1, 8, 1, N'../images/mduan/4.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (65, 7, 1, 0, 2000, 1, 1, 8, 1, N'../images/mduan/5.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (66, 7, 2, 1, 2000, 1, 1, 8, 1, N'../images/mduan/6.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (67, 7, 2, 1, 2000, 1, 1, 8, 1, N'../images/mduan/7.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (68, 7, 2, 0, 1000, 1, 1, 8, 1, N'../images/mduan/8.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (69, 7, 2, 1, 2999, 1, 1, 9, 1, N'../images/mduan/9.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (70, 7, 2, 0, 2888, 1, 1, 1, 1, N'../images/mduan/10.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (71, 8, 1, 1, 2000, 1, 1, 18, 1, N'../images/nwsl/1.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (72, 8, 1, 1, 2000, 1, 1, 8, 1, N'../images/nwsl/2.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (73, 8, 1, 1, 2000, 1, 1, 8, 1, N'../images/nwsl/3.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (74, 8, 1, 0, 2000, 1, 1, 8, 1, N'../images/nwsl/4.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (75, 8, 1, 0, 2000, 1, 1, 9, 1, N'../images/nwsl/5.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (76, 8, 2, 1, 2000, 1, 1, 8, 1, N'../images/nwsl/6.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (77, 8, 2, 0, 1999, 1, 1, 8, 1, N'../images/nwsl/7.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (78, 8, 2, 1, 1000, 1, 1, 8, 1, N'../images/nwsl/8.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (79, 8, 2, 0, 2999, 1, 1, 9, 1, N'../images/nwsl/9.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (80, 8, 2, 1, 2000, 1, 1, 1, 1, N'../images/nwsl/10.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (81, 9, 1, 1, 2000, 1, 1, 8, 1, N'../images/ygduan/1.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (82, 9, 1, 0, 2000, 1, 1, 8, 1, N'../images/ygduan/2.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (83, 9, 1, 0, 2000, 1, 1, 9, 1, N'../images/ygduan/3.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (84, 9, 1, 1, 1000, 1, 1, 8, 1, N'../images/ygduan/4.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (85, 9, 1, 1, 2000, 1, 1, 3, 1, N'../images/ygduan/5.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (86, 9, 2, 1, 2000, 1, 1, 19, 1, N'../images/ygduan/6.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (87, 9, 2, 1, 2999, 1, 1, 12, 1, N'../images/ygduan/7.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (88, 9, 2, 1, 2999, 1, 1, 9, 1, N'../images/ygduan/8.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (89, 9, 2, 0, 2000, 1, 1, 18, 1, N'../images/ygduan/9.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (90, 9, 2, 0, 2000, 1, 1, 8, 1, N'../images/ygduan/10.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (91, 10, 1, 1, 2000, 1, 1, 8, 1, N'../images/rbduan/1.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (92, 10, 1, 0, 2000, 1, 1, 8, 1, N'../images/rbduan/2.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (93, 10, 1, 0, 2000, 1, 1, 2, 1, N'../images/rbduan/3.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (94, 10, 1, 1, 2000, 1, 1, 2, 1, N'../images/rbduan/4.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (95, 10, 1, 1, 2000, 1, 1, 9, 1, N'../images/rbduan/5.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (96, 10, 2, 1, 2000, 1, 1, 8, 1, N'../images/rbduan/6.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (97, 10, 2, 0, 2000, 1, 1, 8, 1, N'../images/rbduan/7.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (98, 10, 2, 0, 2000, 1, 1, 8, 1, N'../images/rbduan/8.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (99, 10, 2, 0, 2000, 1, 1, 7, 1, N'../images/rbduan/9.jpg', 1)
GO
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (100, 10, 2, 1, 2000, 1, 1, 10, 1, N'../images/rbduan/10.jpg', 1)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (109, 1, 1, 0, 12345, NULL, NULL, NULL, NULL, N'/images/info/2.jpg', NULL)
INSERT [dbo].[Cat] ([cat_id], [catClass_id], [shop_id], [cat_sex], [cat_price], [isAntiepidemic], [isInsect], [cat_num], [isFullBlood], [cat_img], [isRecommend]) VALUES (110, 2, 1, 1, 12345, NULL, NULL, NULL, NULL, N'/images/info/3.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Cat] OFF
SET IDENTITY_INSERT [dbo].[catClass] ON 

INSERT [dbo].[catClass] ([catClass_id], [catClass_name]) VALUES (1, N'布偶猫')
INSERT [dbo].[catClass] ([catClass_id], [catClass_name]) VALUES (2, N'暹罗猫')
INSERT [dbo].[catClass] ([catClass_id], [catClass_name]) VALUES (3, N'苏格兰折耳猫')
INSERT [dbo].[catClass] ([catClass_id], [catClass_name]) VALUES (4, N'英国短毛猫')
INSERT [dbo].[catClass] ([catClass_id], [catClass_name]) VALUES (5, N'波斯猫')
INSERT [dbo].[catClass] ([catClass_id], [catClass_name]) VALUES (6, N'俄罗斯蓝猫')
INSERT [dbo].[catClass] ([catClass_id], [catClass_name]) VALUES (7, N'美国短毛猫')
INSERT [dbo].[catClass] ([catClass_id], [catClass_name]) VALUES (8, N'挪威森林猫')
INSERT [dbo].[catClass] ([catClass_id], [catClass_name]) VALUES (9, N'异国短毛猫')
INSERT [dbo].[catClass] ([catClass_id], [catClass_name]) VALUES (10, N'日本短尾猫')
SET IDENTITY_INSERT [dbo].[catClass] OFF
SET IDENTITY_INSERT [dbo].[goodClass] ON 

INSERT [dbo].[goodClass] ([goodClass_id], [goodClass_name]) VALUES (1, N'玩具')
INSERT [dbo].[goodClass] ([goodClass_id], [goodClass_name]) VALUES (2, N'服装')
INSERT [dbo].[goodClass] ([goodClass_id], [goodClass_name]) VALUES (3, N'猫粮')
INSERT [dbo].[goodClass] ([goodClass_id], [goodClass_name]) VALUES (4, N'猫砂')
INSERT [dbo].[goodClass] ([goodClass_id], [goodClass_name]) VALUES (5, N'猫窝')
SET IDENTITY_INSERT [dbo].[goodClass] OFF
SET IDENTITY_INSERT [dbo].[goodComment] ON 

INSERT [dbo].[goodComment] ([goodComment_id], [good_id], [user_id], [comment], [addtime]) VALUES (1, 3, 1, N'555', CAST(0x0000AA76011F8121 AS DateTime))
SET IDENTITY_INSERT [dbo].[goodComment] OFF
SET IDENTITY_INSERT [dbo].[goodReply] ON 

INSERT [dbo].[goodReply] ([goodReply_id], [goodComment_id], [user_id], [reply], [addtime]) VALUES (1, 1, 1, N'222', CAST(0x0000AA76011F9735 AS DateTime))
SET IDENTITY_INSERT [dbo].[goodReply] OFF
SET IDENTITY_INSERT [dbo].[Goods] ON 

INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (1, 1, N'猫用品猫玩具猫咪兔毛球老鼠型逗猫棒逗猫杆火鸡毛猫薄荷逗猫羽毛', 200, N'../images/wanju/1.jpg', CAST(0x0000AA3F00000000 AS DateTime), NULL, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (2, 1, N'猫玩具球逗猫球猫咪自嗨用品剑麻毛线球猫线团耐咬羽毛老鼠逗猫棒', 10, N'../images/wanju/2.jpg', CAST(0x0000A9E900000000 AS DateTime), NULL, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (3, 1, N'喵仙儿打地鼠猫玩具益智猫玩具逗猫玩具猫捉老鼠宠物玩具包邮', 20, N'../images/wanju/3.jpg', CAST(0x0000A9E900000000 AS DateTime), NULL, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (4, 1, N'猫咪用品四季猫爬架猫窝猫树实木一体小型猫架抓柱板带窝跳台猫屋', 310, N'../images/wanju/4.jpg', CAST(0x0000A89700000000 AS DateTime), NULL, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (5, 1, N'猫墙角蹭痒器抓痒按摩梳子蹭毛器猫咪挠痒痒玩具蹭痒器按摩刷', 200, N'../images/wanju/5.jpg', CAST(0x0000A89B00000000 AS DateTime), NULL, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (6, 1, N'猫抓板磨爪器猫爪板瓦楞纸猫抓垫猫咪玩具磨抓板猫窝玩具猫咪用品', 200, N'../images/wanju/6.jpg', CAST(0x0000A76B00000000 AS DateTime), NULL, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (7, 1, N'公猫性发泄玩具猫咪发情伴侣宠物玩具性发泄用品宠物抱枕发情期用', 200, N'../images/wanju/7.jpg', CAST(0x0000A5C100000000 AS DateTime), NULL, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (8, 1, N'猫墙角蹭毛器猫咪挠痒痒玩具蹭痒器按摩刷宠物用品猫用蹭脸猫抓板', 200, N'../images/wanju/8.jpg', CAST(0x0000A2C900000000 AS DateTime), NULL, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (9, 1, N'猫抓板磨爪器猫爪板瓦楞纸猫抓垫猫咪玩具磨抓板猫窝玩具猫咪用品', 500, N'../images/wanju/9.jpg', CAST(0x0000A5FA00000000 AS DateTime), NULL, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (10, 1, N'猫抓板磨爪器猫爪板瓦楞纸猫抓垫猫咪玩具磨抓板猫窝玩具猫咪用品', 100, N'../images/wanju/10.jpg', CAST(0x0000A4AC00000000 AS DateTime), NULL, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (11, 2, N'洗猫袋猫咪洗澡神器洗澡袋宠物剪指甲防抓固定猫包袋猫清洁用品', 200, N'../images/cloth/1.jpg', CAST(0x0000A44F00000000 AS DateTime), NULL, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (16, 2, N'宠物猫咪小狗狗衣服春夏季装夏天薄款透气背心泰迪比熊博美吉娃娃 ', 200, N'../images/cloth/3.jpg', CAST(0x0000A5BD00000000 AS DateTime), NULL, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (18, 2, N'宠物猫狗衣服薄款夏季小奶狗英短猫泰迪法斗牛中小型犬汉服防掉毛 ', 200, N'../images/cloth/4.jpg', CAST(0x0000A5BD00000000 AS DateTime), NULL, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (19, 2, N'猫咪牵引绳防挣脱专用溜猫绳遛猫绳背心式背带项圈栓小猫绳子猫链', 200, N'../images/cloth/5.jpg', CAST(0x0000A5BD00000000 AS DateTime), NULL, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (20, 2, N'狗狗猫咪衣服T恤薄款幼犬小型犬宠物柯基泰迪比熊博美法斗春夏装', 200, N'../images/cloth/6.jpg', CAST(0x0000A5BD00000000 AS DateTime), NULL, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (21, 2, NULL, 200, N'../images/cloth/7.jpg', CAST(0x0000A5BD00000000 AS DateTime), NULL, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (22, 2, NULL, 200, N'../images/cloth/8.jpg', CAST(0x0000A5A000000000 AS DateTime), NULL, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (23, 2, NULL, 200, N'../images/cloth/9.jpg', CAST(0x0000A5BE00000000 AS DateTime), NULL, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (24, 2, NULL, 200, N'../images/cloth/10.jpg', CAST(0x0000A17600000000 AS DateTime), NULL, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (25, 2, NULL, 200, N'../images/cloth/11.jpg', CAST(0x00009FEB00000000 AS DateTime), NULL, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (26, 2, NULL, 200, N'../images/cloth/12.jpg', CAST(0x0000A15900000000 AS DateTime), NULL, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (27, 2, NULL, 200, N'../images/cloth/13.jpg', CAST(0x000150D500000000 AS DateTime), NULL, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (28, 2, NULL, 200, N'../images/cloth/14.jpg', CAST(0x0000A5BE00000000 AS DateTime), NULL, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (29, 2, NULL, 200, N'../images/cloth/15.jpg', CAST(0x0000A5BE00000000 AS DateTime), NULL, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (30, 2, NULL, 200, N'../images/cloth/16.jpg', CAST(0x0000A5BE00000000 AS DateTime), NULL, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (31, 2, NULL, 200, N'../images/cloth/17.jpg', CAST(0x0000A5BE00000000 AS DateTime), NULL, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (32, 2, NULL, 200, N'../images/cloth/18.jpg', CAST(0x0000A5BE00000000 AS DateTime), NULL, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (33, 2, NULL, 200, N'../images/cloth/19.jpg', CAST(0x0000A5BD00000000 AS DateTime), NULL, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (34, 2, NULL, 200, N'../images/cloth/20.jpg', CAST(0x0000A5FB00000000 AS DateTime), NULL, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (35, 3, NULL, 200, N'../images/food/1.jpg', CAST(0x0000A5BE00000000 AS DateTime), NULL, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (36, 3, NULL, 200, N'../images/food/1.jpg', CAST(0x0000A5BE00000000 AS DateTime), NULL, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (37, 3, NULL, 200, N'../images/food/1.jpg', CAST(0x0000A5BE00000000 AS DateTime), NULL, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (38, 3, NULL, 200, N'../images/food/2.jpg', CAST(0x0000A5C000000000 AS DateTime), NULL, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (39, 3, NULL, 200, N'../images/food/3.jpg', CAST(0x0000A45300000000 AS DateTime), NULL, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (40, 3, NULL, 200, N'../images/food/4.jpg', CAST(0x0000A5BE00000000 AS DateTime), NULL, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (41, 3, NULL, 200, N'../images/food/5.jpg', CAST(0x0000A5BE00000000 AS DateTime), NULL, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (42, 3, NULL, 200, N'../images/food/6.jpg', CAST(0x0000A5BE00000000 AS DateTime), NULL, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (43, 3, NULL, 200, N'../images/food/7.jpg', CAST(0x0000A5FA00000000 AS DateTime), NULL, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (44, 3, NULL, 200, N'../images/food/8.jpg', CAST(0x0000A5A000000000 AS DateTime), NULL, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (45, 4, NULL, 200, N'../images/maosha/1.jpg', CAST(0x0000A5BE00000000 AS DateTime), NULL, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (46, 4, NULL, 200, N'../images/maosha/2.jpg', CAST(0x0000A5FA00000000 AS DateTime), 1, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (47, 4, NULL, 200, N'../images/maosha/3.jpg', CAST(0x0000A5FA00000000 AS DateTime), 1, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (48, 4, NULL, 200, N'../images/maosha/4.jpg', CAST(0x0000A5A100000000 AS DateTime), 1, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (49, 4, NULL, 200, N'../images/maosha/5.jpg', CAST(0x0000A5A300000000 AS DateTime), 1, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (50, 4, NULL, 200, N'../images/maosha/6.jpg', CAST(0x0000A5BE00000000 AS DateTime), 1, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (51, 4, NULL, 200, N'../images/maosha/7.jpg', CAST(0x0000A5FA00000000 AS DateTime), 2, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (52, 4, NULL, 200, N'../images/maosha/8.jpg', CAST(0x0000A2C700000000 AS DateTime), 2, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (53, 4, NULL, 200, N'../images/maosha/9.jpg', CAST(0x0000A43400000000 AS DateTime), 3, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (54, 4, NULL, 200, N'../images/maosha/10.jpg', CAST(0x0000A45300000000 AS DateTime), 2, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (55, 5, NULL, 400, N'../images/maowo/2.jpg', CAST(0x0000A5BE00000000 AS DateTime), NULL, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (56, 5, NULL, 400, N'../images/maowo/3.jpg', CAST(0x0000A5BD00000000 AS DateTime), NULL, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (57, 5, NULL, 400, N'../images/maowo/1.jpg', CAST(0x0000A5BC00000000 AS DateTime), NULL, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (58, 5, NULL, 400, N'../images/maowo/4.jpg', CAST(0x0000A5C000000000 AS DateTime), NULL, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (59, 5, NULL, 400, N'../images/maowo/5.jpg', CAST(0x0000A5C100000000 AS DateTime), NULL, 1)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (60, 5, NULL, 400, N'../images/maowo/6.jpg', CAST(0x0000A5C100000000 AS DateTime), NULL, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (61, 5, NULL, 400, N'../images/maowo/7.jpg', CAST(0x0000A5C200000000 AS DateTime), NULL, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (62, 5, NULL, 400, N'../images/maowo/8.jpg', CAST(0x0000A5C300000000 AS DateTime), NULL, 2)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (65, 5, NULL, 400, N'../images/maowo/9.jpg', NULL, NULL, NULL)
INSERT [dbo].[Goods] ([good_id], [goodClass_id], [good_introduce], [good_price], [good_img], [good_addtime], [orderDetails_id], [shop_id]) VALUES (66, 5, NULL, 400, N'../images/maowo/10.jpg', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Goods] OFF
SET IDENTITY_INSERT [dbo].[info] ON 

INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (1, 1, 1, N'/images/Info/1.jpg
', N'猫咪生病怎么预防？英国短毛猫呕吐怎么办？', N'
宠物猫生病是很常见的，最为常见的病症就是呕吐英国短毛猫呕吐怎么办？这是很多卖猫商家比较关注的问题之一，猫咪呕吐的症状也是有很多种作为主人一定要能准确地的判断英国短毛猫呕吐是由什么引起的，接下来我们拭目以待吧！首先任何病症的出现都会有其原因英国短毛猫呕吐分为以下几种情况，判断近期吃的食物性质猫咪和人的消化系统是一样的也会出现食物中毒或者是食物相克而发生病变，英国短毛猫经常会吃一些主人随手丢给它的一些零时，而且这些零时和主食可能搭配到一起就会出现猫咪拉肚子或者是呕吐的症状！

  英国短毛猫一旦出现呕吐的症状就要及时带它去看宠物医院做检查听诊有助于肥厚型心肌病的诊断，X线的检查，严重的患猫X线征包括明显的左心房和左心室增大，很多患猫表现心电图异常，部分患猫表现房颤或前束支阻滞的心电图征象，常规检查可以断定猫咪出现呕吐现象的根源。  会发现猫咪一旦出现呕吐的症状热情也会走低，当你回到家时，发现自己的爱猫并没有兴高采烈的来欢迎你，而是自己独自躲在窝里;当你拿出它最爱的玩具时，它并没有激动的扑上来;当你来到它身边轻轻的呼唤它时，它却不做任何反应……猫咪精神不振就是在告诉你，它病了，这个时候你要注意猫咪的病症。 
CatPuZi表示呕吐是宠物猫经常会出现的病症，一旦发现猫咪生病了就要及时引起注意，反应迟钝的时候一定要注意观察它的其他反应，以判断病情，作为一个养猫新手来说要求经常观察猫咪的精神状态。')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (2, 1, 1, N'/images/Info/2.jpg
', N'猫咪市场行情：虎斑猫一只多少钱？', N'宠物猫的品种可以说有上百种但被人们所熟知的只有近十几种而已，今天要说的这只虎斑猫相信很多宠主都不了解，说到虎斑猫的价格更是有点摸不着头脑，作为养猫新手来说虎斑猫的认识不够，那么到底虎斑猫多少钱？我们看看小编怎么说：首先虎斑猫虎整体感觉强健、平衡感极佳，斑纹美丽，酷似野生狸的斑纹，额头有M 状斑纹，看起来很像一个豹子，眼角有连贯的延伸线，颈部、四肢及尾部有环状斑纹，身体为连接完整的鱼骨刺斑纹或豹点斑纹，但在国内是不可多见的品种猫之一。

虎斑猫市场价也有很多不可控的因素，比如因为地区的消费不同价格也会有所不同，一般在3000-8000元之间，一般品貌不错的虎斑猫幼崽的价格在3500元左右，更好点的在5500元左右。当然，二三线城市2500左右就可以买到一只幼崽了，因为每个城市的消费不一样。虎斑猫大多数都是在一线城市比较多，二三线很难买到虎斑猫品种猫，但是也可以选择网购很多消费者觉得通过网上购买活体在运输上会受损失，因此也不建议网友通过网络进行猫咪交易找同城饲主购买繁殖的小猫，这样在价格上可能会有优惠！')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (3, 1, 1, N'/images/Info/3.jpg
', N'为什么这么多人喜欢金渐层？', N'
金渐层猫咪越来越受到人们的喜爱不是它的性格或者是它容易饲养的原因，而是金渐层猫咪是这么多品种猫种中距离财富最近，与金钱沾边的猫咪谁不想让自己的钱越来越多呢？哈哈金渐层就可以做到，我们一起看看小编怎么说：

为什么这么多人喜欢金渐层？

  或许在某个时候你可能看到超市或者商场看到一个玩具猫跟你招手或者还会发出好听的音乐，是的，没错儿，它就是传说中的招财猫也是现实中的金渐层，这么一说就知道为什么金渐层能够为人们带来好运了吧？


  其次金渐层品种猫的价格也相对其他品种猫来说要亲民很多，据了解到的金渐层猫价格，一般来说至少要在3000元以上，品相好的七八千的也有，但普通的品种猫咪也会在至少5000元好吧，金渐层可是被称为“土豪金”猫咪，当然这个价格可能也会因为地区不同价格也不相同，总是入手金渐层超值！

为什么这么多人喜欢金渐层？


  最后说说金渐层性格，它的性格可以说活像个大家闺秀，宅在家里不出门脾气也是特别的好，看这像绿宝石一样的眼睛，真的太吸引人了，品相也符合人们对美的价值观，优雅华丽的外表，冥冥之中透漏着贵族气质，简直太可爱了，金渐层猫咪饲养跟他猫咪喂养方式也是一样的！ 
')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (4, 1, 1, N'/images/Info/5.jpg
', N'夏天到啦！猫咪如何正确护理？', N'
   夏天来了，为了不让猫咪出现健康问题，很多养猫宠主就要考虑到猫咪饲养的夏天常识，其实猫咪护理要比狗狗容易多了，狗狗的毛质不仅长而且浓密尤其是在夏天天气热，容易出汗，如果不能及时给猫咪护理，有可能就会中暑或者感冒，接下来我们看看小编怎么说：

夏天到啦！猫咪如何正确护理？

  如果家里养了猫咪特别是在夏天，建议给猫咪理理毛发，天气热的原因加上猫咪自身的皮毛浓密会很容易出现不健康症状，建议宠主每隔两周时间要去宠物医院修理一次，最重要的是在夏天要防止猫咪皮肤病及猫癣，这是宠主不如忽视的！


  护理猫咪正确的方法首先要不间断的去给猫咪涂抹一些防止发臭抗菌的药物，在猫咪身上涂抹药物的过程中不要让猫咪用舌头去添自己的身体，也就是说涂抹完成之后用辅助工具套在猫咪脖子上，防止猫咪用舌头添药物，半个小时之后就去洗掉擦拭干净就可以了！

夏天到啦！猫咪如何正确护理？

  最后要说的是家里常备相关消炎抗菌的药物，特别是在夏天用的比较多，猫咪耳朵部位夏天护理很重要，耳朵里面的脏污要去找专业的护理老师傅进行处理，以免对猫咪耳膜造成伤害，耳朵部位不管是猫咪还是狗狗都比较难护理，这个需要所有的宠主了解！
')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (7, 1, 1, N'/images/Info/6.jpg
', N'养猫宠主须知：猫咪喜欢潮湿的生长环境吗？', N'对于一个养猫新手来说需要考虑的第一个问题就是猫咪生长适合在什么情况下，饲养猫咪第一要务就是要选择好合适的环境，经常处于潮湿环境下的猫咪会有什么健康状况呢？我们跟随小编一起看看吧！

养猫宠主须知：猫咪喜欢潮湿的生长环境吗？

  猫咪的品种不同生活习性也会不同，并不是所有的猫咪的都喜欢潮湿的生活环境，潮湿的生活环境对饲养猫咪带来很多的阻碍，比如潮湿的环境会容易滋生一些虫子这些虫子会让猫咪生病，另外如果潮湿的环境会很容易让猫咪患皮肤病，这是不容忽视的！


  建议选择猫咪喂养的时候要选择一些通风的环境，这样才是饲养猫咪的根本，首先要知道猫咪长的好不好，环境决定了一切，所以潮湿环境不利于猫咪的生长，这与喂什么食物没关系，把选择一个养猫的风水宝地放到第一位是重中之重！

养猫宠主须知：猫咪喜欢潮湿的生长环境吗？

  环境选择不对猫咪就会患猫癣，慢性皮肤病对于猫咪来说就是一种折磨，可以说是久治不愈的疾病，为了避免猫咪患上皮肤病住宅一定要选择一些通风干净的地方才是最重要的，猫咪不生病一身轻啊！ ')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (8, 1, 1, N'/images/Info/7.jpg
', N'宠物猫去宠物医院治疗绝对安全吗？', N'  现实生活中一旦猫咪生病了，作为宠主就忙的不得了比较宠物猫少则几千元，高则上万元人民币要是猫咪那么不舒服就得及时得到治疗，就往宠物医院盲目的送，那么对于生病的猫咪来说去宠物医院治疗绝对的安全吗？

宠物猫去宠物医院治疗绝对安全吗？

  其实话又说会拉作为养猫新手来说猫咪一旦生病之后送往宠物医院好像是最有效最简洁的解决方案了，安全性高，但是这里建议宠主们不要盲目的把猫咪送往宠物医院，宠物医院当然是治疗猫咪病症的地方，不去宠物医院去哪儿呢？这里需要纠正一下，不是什么病症都往宠物医院送，而是要根据情况判断猫咪的症状需不需要去医院才是重要的，换句话说就是我们要学会发现问题的能力。


  养猫的过程中难免会出现一些小病小灾的很正常，但是宠物医院并不是一个好地方，宠物医院的不仅仅只有猫咪还有狗狗或者其他种类的宠物聚集繁多的地方，也就意味着这里的细菌和病毒也是最多的地方，本来猫咪的病症无伤大雅结果一进宠物猫医院就感染上瘟疫，这种情况也是比比皆是。

宠物猫去宠物医院治疗绝对安全吗？

  去医院进行猫咪疾病的治疗是合理的，但是在没有确定猫咪病症的前提下不要贸然去往宠物医院，这也是作为一个在宠物医院工作5年时间所总结的经验，很多宠主带着患病的宠物进行治疗的时候基本都是猫咪的正常的症状，无须担心，其实猫咪成年猫咪都是不轻易生病的！


')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (9, 1, 1, N'/images/Info/8.jpg
', N'揭秘买猫防骗术：买宠物猫被骗怎么办？', N'   买宠物猫被骗怎么办？这是很多宠主在现实生活中遇到的问题，其实买猫过程当中有很多不为人知的骗局，也是很多宠主容易中招的几种情况，接下来我们一起看看消费者在购买买猫的时候会遇到那些骗局呢？通过我们受骗之后的解决方案是什么？


揭秘买猫防骗术：买宠物猫被骗怎么办？


  不管从网上还是从实体店购买猫咪都不能排除被骗的可能性，为了让消费者能够不在上当受骗接下来为你揭秘几个防骗的技巧，希望能够给更多的消费者带来帮助！


  首先说说通过网上买猫咪的一些骗子的计量请记住;首先不要通过商家提供的图片选择猫咪的品种或者自己喜欢的类型，因为这样你根本不知道到底收到的猫咪是不是自己当初通过图片或者视频精挑细选的那一只，建议通过视频直播的方式去挑选，这样会直观的看到自己挑选的猫咪。


  其次就是你会发现通过物流的运输的猫咪到家的时候发现猫咪生病了，或者存在健康的问题，对于消费者来说肯能是商家邮寄的就是有病的猫咪，对于商家来说这个问题是运输的责任或者是消费者的问题，两家都有苦楚倒也是说不清了，最好的解决方案就是让消费者受到猫咪之后录制开箱视频要确定通过开箱之后的猫咪没有什么健康或者其他的问题。


揭秘买猫防骗术：买宠物猫被骗怎么办？


  最后要说说实地店的宠物猫了，在价格上贼高贼高的这些都是一些不知道猫咪市场的消费者就会很容易被骗，猫咪的品相或者猫咪品种血统都会被受到欺骗，建议消费者在购买猫咪之前一定要对猫咪的价格以及相关的信息要掌握了解')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (10, 1, 1, N'/images/Info/8.jpg
', N'谁教你这么喂养猫咪的？宠物猫家族拒绝这种饲养方式在！', N'现在很多饲养猫咪的新手在饲养方式和方法上都有很多的误区，如果不能很好的避开这些误区将会是给猫咪的身体带来很大的伤害，那么究竟如何能够正确的方式饲养宠物猫呢？我们跟随小编一起看看吧！

谁教你这么喂养猫咪的？宠物猫家族拒绝这种饲养方式在！

  如果是幼苗猫咪初期饲养的时候在选择营养的食物很重要，很多时候我们对猫咪的好不是真正的好，包括在饲养食物上更是选择要有原则，很多时候猫咪进食的时候作为宠主要能够认识到营养的重要性。


  猫咪的食物也不要多种多样，这样对猫咪的消化系统也是不好的，建议在更换猫咪食物的时间至少需要半年时间，每天的食物都必须要定量定点的进行，不要无休止的进行喂养，这是不对的，正确合理的喂猫才是最重要的！

谁教你这么喂养猫咪的？宠物猫家族拒绝这种饲养方式在！

  宠物猫喂养其实最重要的是了解猫咪的相关特性和生活习性，因为猫咪的品种不一样饲养的方式方法也会不一样，而且养猫咪的温度也不要过于低，猫咪长期处于低温度很容易患上肠炎，这是很多宠主很容易忽视的问题。 ')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (11, 1, 1, N'/images/Info/10.jpg
', N'宠物猫摇尾巴有什么意义？说出来连卖猫人都不信！', N' 宠物猫摇尾巴看似很平常，但是很多人都不知道其实猫咪摇尾巴里面的学问可大着呢,猫咪摇尾巴也是除了声音以外的表达方式，如果作为猫咪主人不懂这里面的秘密那你就太low了，好了，接下来就跟小编一起看看吧！


宠物猫摇尾巴有什么意义？说出来连卖猫人都不信！


  宠物猫摇尾巴的姿势看着是不是很妖娆，扭动着小屁股，当主人情绪不好的时候她就蹭过来，用小尾巴安抚一下，如果是你会不会感觉到很舒服呢？顿时也不再生气啦！


  猫咪摇尾巴的各种姿势到底表达什么意义呢？


  尾巴略为提起，柔软弯曲：说明猫咪对正在看到的实物特别有好感。


  尾巴竖起并且震动：如果你轻轻抚摸猫咪，你会发现猫咪的尾巴就会竖起来，是一种个人识别的含义，但是陌生人就没有这样的待遇啦！

宠物猫摇尾巴有什么意义？说出来连卖猫人都不信！


  尾巴完全垂下，并夹于后腿之间：这是猫咪收到惊慌的举动，也是表示在群体中的地位低微的意思

。

  尾巴微弯向下，尾尖微弯向上：这个旨意表示猫咪此时此刻的心情很放松，享受着这个环境所带来的美好。


  尾巴竖起笔直，而且毛也竖直：这说明猫咪受到不可预知的惊愕，自身受到害怕恐惧。


  尾巴竖起，尾尖弯曲：这说明猫咪对你有很浓厚的兴趣，想进一步的靠近，向你示意。


  尾巴竖起，尾尖竖直：非常愿意亲近，而且并无保留。暗示是请猫妈妈替它检查臀部。


  尾巴向下，毛竖起：这表示它感到非常恐惧，受到害怕。


  尾巴维持不动，但是尾尖突然震动：说明猫咪特别的烦躁，这个时候你要是靠近她，准会被小爪子抓伤。


  尾巴放在一边：当雌猫准备跟雄猫交配时，其尾巴会移开一边。当雄猫见到它的这个姿势，便知道可以亲近它而不被袭击。 ')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (12, 1, 1, N'/images/Info/11.jpg
', N'想买波斯猫？牢记这三点买猫很便宜，养猫人都知道！', N'宠物猫走进我们的生活成为生活的一部分，波斯猫属于贵族猫咪的长毛猫的代表，她的体型中等，被称为“猫中之王”在很多主人心里都会占据比较高的地位，对于主人来说如何选择自己的喜欢的波斯猫呢？下面我们就来看看吧！


想买波斯猫？牢记这三点买猫很便宜，养猫人都知道！

  波斯猫颜值


  说到波斯猫的品相，可谓是颜值担当了，要不怎么会有猫中之王的美誉呢，这种颜值是我们波斯猫本来的品种所具备的优势，从五官上可以看得出眼睛，鼻子，耳朵都特别的别致，那么主人在选择的时候无可挑剔，这是无可厚非的。


  波斯猫颜色


  说到波斯猫颜色的问题可想而知猫咪的雪白无瑕的颜色深受主人们的喜爱了，尤其是很多90后的小姐姐们都喜欢，波斯猫品种的猫咪白颜色占大部分，这也符合了很多猫咪主人对猫咪颜色的选择需求，同时迎合了市场发展的需求。


  波斯猫饲养方式


  虽然说到波斯猫被誉为猫中之王，但是在很多猫咪主人看来，波斯猫跟其他种族的猫咪饲养的方式方法都一样的，千万不要在猫咪饲养方式上增加额外的服务，这样的服务也是猫咪是不需要的，因此在饲养方面不必产生太多的顾虑。


想买波斯猫？牢记这三点买猫很便宜，养猫人都知道！


  宠物猫交易网提醒：波斯猫的性格很温顺，平时看起来有点高冷，但别误会波斯猫一点也不娇气，而且呆萌呆萌的这也是更多主人的选择之一，不论从猫咪的颜色还是猫咪的颜值都可以说是完美一绝的，说到这里你是否会动心呢？希望以上的内容能够给你带来很大的帮助！ ')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (13, 1, 1, N'/images/Info/12.jpg
', N'揭秘：宠物猫家族猫中王子排名老四的波斯猫！', N' 波斯猫的有着很久的上百年的文化，如果是一个资深养猫人士，对于波斯猫肯定不会陌生，能够在这么多猫品种中排行老四，也是当之无愧的，小编了解波斯猫也是通过小时候的一首歌，当然波斯猫一直处于风口浪尖，位高权重市场的关注度高，就让小编说说这个波斯猫吧！

揭秘：宠物猫家族猫中王子排名老四的波斯猫！

  波斯猫被称为猫中之王，其特征耳朵微微躲在浓密的毛发之后，浑圆而细小，间距较宽，在头上偏低的位置，明亮的双眼多为琥珀色或蓝色有着饱满浑圆的下巴，波斯猫的头又圆又大，头盖骨甚为宽阔，脸相对其他猫种更扁、更圆，俗称为“京巴脸”在品相上的优势赢得消费者的喜爱！


  波斯猫不仅是脾气好，它就像一个女汉子一样特别够忍耐，不会因为生气就会情绪化，或者到处搞破坏，波斯猫很乖的，主要为单色系、金吉拉色系、虎斑色、烟色系、混合色系，其中金吉拉色系平时看起来比较高冷，一副爱答不理的样子。

揭秘：宠物猫家族猫中王子排名老四的波斯猫！

  波斯猫不像其他猫咪那么的娇气，即使你不小心伤害到它了，他也不会因为此事记恨于你，甚至加菲猫很会察言观色，如果你自己不快乐，或者情绪不好波斯猫就不会靠近你，因为你正好在气头上心里正烦着呢，当你情绪好的时候他就会慢慢的靠近你，喜欢你无休止的抚摸和拥抱。 ')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (14, 1, 1, N'/images/Info/13.jpg
', N'猫中王子图片初次见？没见过波斯猫让你一饱眼福！', N' 很早以前就因为一首波斯猫的歌曲知道了波斯猫的品种，也就是因为这首红遍大江南北的歌曲更多的人对波斯猫有了认知，与此同时我们也会在宠物店或者猫舍看到过波斯猫的踪迹，今天小编想带着你认识一下波斯猫的，让你一饱眼福？


  波斯猫是最出名的品种猫了毛色大致分五大色系，其中单色系有白色、黑色、蓝色、红色、奶油色等毛色不同相对猫咪的价格也是不同的！')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (15, 1, 1, N'/images/Info/14.jpg
', N'就是她？当之无愧的泰国猫-暹罗猫', N' 说起“泰国猫”你就不熟悉了吧？但要是说暹罗猫你就知道，其实大家熟悉的暹罗猫就是泰国猫，暹罗猫是泰国宠物猫品种中具有代表性的猫种，在国内不是红极一时的网红猫，而是有着近百年的历史存在，根深蒂固，一直受到市场关注，暹罗猫的热度只增不减，我们一起看看小编怎么说？


就是她？当之无愧的泰国猫-暹罗猫


  泰国猫最早在泰国皇室和佛教寺院中被饲养，也叫暹罗猫，迄今已有200多年的历史，1871年驻曼谷的英国人欧文，将泰国国王送给他的礼物两只泰国猫带回了英国，随之，泰国猫就出现在伦敦郊外的水晶宫猫展中，引起观者的兴趣并从而闻名于世。


  时至今日暹罗猫一直被养猫人时刻注意着，在美国饲养的泰国猫体格健壮、头部稍圆，尚不具备现代泰国猫的优美体型，1890年，泰国国王又将数只泰国猫送给美国友人，从此泰国猫流入美国，为了改善泰国猫的体质和体型，饲养育种者做了大量的品种选育工作，造就了泰国猫令人惊叹的优美体型，成为短毛家族中的贵族精品。


就是她？当之无愧的泰国猫-暹罗猫


  泰国猫更是多愁伤感脾气时好时坏，情绪波动比较大，尤其是在发情期的暹罗猫主人们可要注意了，不要没事儿就去招惹她，很严重，小心抓破你的手，泰国猫的叫声非常独特，似乎像在不停地说话或像婴儿啼哭，嫉妒心和攻击性较强，这些成为该猫性情的基本特征。泰国猫仍然受到饲养者的喜爱，动作敏捷，好奇心强，感情丰富；泰国猫还具有精力充沛，热情大方，气质高雅，等特点。 ')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (16, 2, 1, N'/images/Info/15.jpg
', N'2019年宠物猫的行情：加菲猫多少钱？', N' 2019年宠物猫的行情怎么样？这是很多爱猫人士比较关注的问题之一，宠物猫成为生活中的主流，在过去饲养猫咪宠物较少，时至今日越来越多的家庭都会饲养一只猫咪，那么宠物猫的品种繁多，而加菲猫的热度上升不断，究竟买一只加菲猫多少钱？我们看看小编怎么说:

2019年宠物猫的行情：加菲猫多少钱？


  加菲猫早在1986年的时候承认了加菲猫品种，一经问世便获得了猫协会的认可。在美国及欧洲很流行，加菲猫具有波斯猫文静，属于短毛猫，亲切温顺的性格活泼，品相像似于波斯猫，比起波斯猫加菲猫更有亲和力很亲民，纯正加菲猫的价格不菲：


  幼年加菲猫：


  幼年加菲猫一般指不超过100天的生长期，这个时期的加菲猫正处于成长期，重要的是猫咪营养配置一定要齐全，一旦猫咪出现营养匮乏，或者缺少微量元素就会导致猫咪品相上的不标准，因此这个时间段也是非常重要时期，至于幼年加菲猫的价格在2000元左右，如果猫咪有相关血统证件价格会在2000元以上。


  成年加菲猫：


  成年加菲猫的性格都很成熟，而且生长时期的成年加菲猫更注重在猫咪性格上的培养，而成年加菲猫的年龄在两年以上，加菲猫的寿命在13年到15年的样子也是猫咪家族中生命较长的猫种之一，成年加菲猫的价格一般在5000到5500元左右，当然如果血统纯正那么会比较高一下。


  纯种加菲猫：


  加菲猫价格主要取决于地区因素，血统以及品相各个因素所导致的而纯正血统的加菲猫需要CFA血统证书的加菲猫，从国外带回来的，价格至少8000元以上甚至上万元的不等，从颜色上判断纯白色的加菲猫价格不会太高，建议饲养加菲猫爱好者去猫舍进行交易，也有保障。 ')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (17, 2, 1, N'/images/Info/16.jpg
', N'宠物猫店跟猫舍有什么区别？', N' 宠物猫店跟猫舍到底有什么不同？这是很多饲养宠物猫人士的疑问，很多人最容易混淆的就是猫舍和宠物店的概念，那么到底他们有着怎么样的区别呢？跟随小编一起看看吧？


宠物猫店跟猫舍有什么区别？

  猫舍从字面意思理解就是猫咪生存栖息之地，专门用来养猫的地方，而宠物猫店就是专门针对各种品类的猫进行销售，所以有很多猫舍都是主人在家里养猫后在卖猫，也有一些比较专业的猫舍会有自己的店面，猫舍的环境对于喵咪生长也是很重要的，可以说从猫咪生下来到出售这个时间段都是在猫舍里度过。



  当然猫舍空气清新的，舒适干净，利于猫咪生长的，也不会精神萎靡，病歪歪的现象，甚至有些很好的猫舍其宠物猫都会带有血统证书，从某种意义上讲，猫舍会比宠物店更专业，如果挑选猫也可以到猫舍进行选择，这样更是有保障，猫舍专门为猫打造而设计的成长环境，没有其他的宠物圈养。


宠物猫店跟猫舍有什么区别？


宠物猫店最重要的目的是卖猫，当然宠物店的环境不利于猫咪的生长，不是猫咪的栖息之地，因为宠物店出来有猫咪还有其他的宠物种类放到同一种空间销售，比如：狗狗，爬虫等等。为了让这些消费者有更多的选择，也很容易出现不同种类的宠物互相会传播疾病。



猫舍和宠物店各有各的好处，去猫舍买猫会比较专业，因为猫舍只培育猫咪，还能了解小猫父母的状况。一般在宠物店买猫可以让老板出示猫咪打过疫苗的说明和宠物猫不是病猫或星期猫的保证，出了问题可以得到及时解决。 ')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (18, 2, 1, N'/images/Info/17.jpg
', N'布偶猫护理的方法有哪些？', N' 宠物猫是生活中的甜甜乐，也是爱猫人士喜欢的猫咪种类之一，宠物猫在饲养上也是需要费心，不仅在食物上选择和进食规律，而且最大的问题就是护理，猫咪的护理不容忽视，一旦护理不当就会生病，那么究竟如何正确护理宠物猫呢？


布偶猫狐狸的方法有哪些？


  说到猫咪护理，我们会想到宠物医院，是的，宠物医院是宠物护理的场所之一，但是由于生活或者工作的琐碎，不可能每次都带着宠物猫去宠物医院进行护理，而且在经济上也不划算，如果我们自己懂一些护理方式这些问题会不会得到解决了呢？



  猫咪的日常护理也是很重要的，主要就是理理猫，洗洗澡，洗澡前应准备好洗澡的用具，如洗澡盆、浴巾、洗涤剂、梳子(最好一头疏、一头密)、刷子等，在洗澡的过程中要用温水进行冲洗，水的温度保持在40度左右就即可，不要水温过高也不要太低，负责就会烫伤猫咪或者是猫咪生病。



  其次就是猫咪的耳朵的部位也是要清洗，主要是清除耳垢，用75%的酒精棉球消毒外耳道，再用棉棒蘸取橄榄油或食用菜油，浸润干燥的耳垢，待其软化后，用镊子将耳垢小心地取出，不要将耳道的粘膜碰破，防止感染化脓。一旦猫的外耳道感染化脓，可用棉棒蘸双氧水轻轻地擦洗，反复擦洗至抽出棉棒上不沾有脓迹，再用脱脂棉将耳道内的双氧水吸干。



  因为是耳朵的部位，猫咪很敏感在处理的过程中难免会出现身体抖动，这个也是要特别的小心谨慎，擦洗数次，感染即可痊愈。如果猫的耳垢太多，猫摇头搔耳，应及时请兽医诊治，一旦出现不得当就要去宠物医院进行治疗和不要拖延时间。 ')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (19, 2, 1, N'/images/Info/11.jpg
', N'宠物猫怎么样？如何选择布偶猫？', N' 宠物猫已经成为我们生活中的一部分，为我们的生活增添了乐趣，当然宠物猫的品种繁多，不同品种的猫咪生活环境和特性也是有所不同的，今天小编要说的就是布偶猫，布偶猫属于贵族血统猫咪，被称为“猫中女神”为什么有这样的美誉之称呢？


宠物猫怎么样？如何选择布偶猫？


  布偶猫也叫做“布拉多尔猫”此猫咪深受爱猫人士的喜爱，虽然它的原产地是美国，但在美国境外，如加拿大、英国等欧洲地区、中国、日本、...分布居多。据说布偶猫也有一个故事是这样的，原本布偶猫只是只野生猫，经常在安贝可家附近跑来跑去。有一次它被车子撞了，刚巧被安贝可的邻居见到，就好心地救它回家，接着就是喜爱细心照顾，与之后来就跟主人的关系非常密切，从野心很重的猫咪一下子变的乖巧很多。



  后来主人乔到户外抓回了二只以前和不同公猫生下的小猫。而安贝可找来的种公叫做Warbucks，它有个白鼻，尾端也是白的。安贝可让它和其它母猫交配，结果生下的小猫，有像暹逻的重点花色。后来安帮他们注册为Ragdoll（中文名：布偶猫），并在媒体上宣扬放送，才开始引起猫界人士的注意。这位安贝可女士在1997年过世，她在猫界历史上，就留下这支布偶猫血系，渐渐流传开来。



  整个故事可以说是触目惊心，就是有了这么样的流传，布偶猫一直是宠物猫中最受欢迎的猫咪之一，这也是很多人选择猫咪的本质，而性格也是特别的温顺，平时看起来有些呆萌呆萌的，眼睛大而圆，被毛丰厚，身体柔软，四肢粗大，尾巴也是很长，多为重点色、手套色或双色猫。 ')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (20, 2, 1, N'/images/Info/12.jpg
', N'你们家的猫咪摇尾巴吗？终于明白宠物猫摇尾巴的含义了', N' 不难发现我们家养的宠物猫咪是不是的摇尾巴，可能你会说猫咪摇摇尾巴是很正常的啊，其实猫咪摇尾巴里面的学问可大着呢,如果作为猫咪主人不懂这里面的秘密那你就太low了，好了，接下来就跟小编一起看看吧！


你们家的猫咪摇尾巴吗？终于明白宠物猫摇尾巴的含义了



  宠物猫摇尾巴的姿势看着是不是很妖娆，扭动着小屁股，当主人情绪不好的时候她就蹭过来，用小尾巴安抚一下，如果是你会不会感觉到很舒服呢？顿时也不再生气啦！



  猫咪摇尾巴的各种姿势到底表达什么意义呢？


  尾巴略为提起，柔软弯曲：说明猫咪对正在看到的实物特别有好感。


  尾巴竖起并且震动：如果你轻轻抚摸猫咪，你会发现猫咪的尾巴就会竖起来，是一种个人识别的含义，但是陌生人就没有这样的待遇啦！


  尾巴完全垂下，并夹于后腿之间：这是猫咪收到惊慌的举动，也是表示在群体中的地位低微的意思。


  尾巴微弯向下，尾尖微弯向上：这个旨意表示猫咪此时此刻的心情很放松，享受着这个环境所带来的美好。


  尾巴竖起笔直，而且毛也竖直：这说明猫咪受到不可预知的惊愕，自身受到害怕恐惧。


  尾巴竖起，尾尖弯曲：这说明猫咪对你有很浓厚的兴趣，想进一步的靠近，向你示意。


  尾巴竖起，尾尖竖直：非常愿意亲近，而且并无保留。暗示是请猫妈妈替它检查臀部。


  尾巴向下，毛竖起：这表示它感到非常恐惧，宠物猫受到害怕。


  尾巴维持不动，但是尾尖突然震动：说明猫咪特别的烦躁，这个时候你要是靠近她，准会被小爪子抓伤。


  尾巴放在一边：当雌猫准备跟雄猫交配时，其尾巴会移开一边。当雄猫见到它的这个姿势，便知道可以亲近它而不被袭击 。')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (21, 2, 1, N'/images/Info/18.jpg
', N'选猫小技巧', N'第一、选择一个健康的猫咪，首先我们在购买的时候观察一下小猫咪是不是很活波，如果小猫的动作敏捷，而且十分的活波的话，那么说明这只小猫应该比较健康，性格也比较可爱。
选择小猫的一些技巧？

第二、我们选择小猫咪的时候，我观察一下商家养猫的环境，如果小猫在一个比较好的环境里面喂养的话，那么这样的小猫健康基本没有太大的问题，如果环境很差，那么就要注意一下了。
选择小猫的一些技巧？

第三、健康的小猫咪爪子很关键，我们在购买小猫的时候，先观察的就是小猫的爪子，如果小猫的爪子形状自然，而且形态完整的话，那么说明小猫很健康，身体条件很不错。
选择小猫的一些技巧？

第四、购买小猫的时候要观察小猫的眼睛，一般来说健康的小猫的眼睛会十分的 明亮，而且小猫的眼睛不流泪，眼睛周围也没有分泌物，这样说明小猫身体比较健康，没有什么疾病。
选择小猫的一些技巧？

第五、我们选择小猫的时候，还有观察小猫的皮毛，一般来说小猫的毛看上去十分的光滑，而且色泽亮丽，同时小猫的皮肤柔软，用手摸的时候没有秃斑、肿块，那么这只小猫很健康。
选择小猫的一些技巧？

第六、我们选择小猫的时候也需要看小猫的嘴巴，一般健康的小猫咪的嘴巴周围应该是十分的清洁干燥，而且嘴巴周围不会附有唾液和食物，另外小猫的牙陨坚固，呈粉红色形态自然。
选择小猫的一些技巧？
7

第七、最后我们还要观察小猫的肛门和外生殖器的情况，这也是关键的一个部分，健康的小猫肛门和生殖器比较清洁，而且周围没有任何的分泌物，附近的皮毛上没有任何的粪便污物，这也的小猫才健康。')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (22, 2, 1, N'/images/Info/19.jpg
', N'选猫秘籍', N'1、买猫的时候不要买太小的刚出生的猫，起码得是两个月以上的，因为猫太小的话很难养得活。

2、买猫的时候就要挑那些比较活泼好动的，因为这样证明它是身体健康的，它才会那么活泼，如果那些看起来不活跃，病怏怏的无精打采的样子的，这种猫很可能不健康。

3、仔细观察猫咪身上每一处部位，看看有什么异常，如果身上有什么粘液的话是不好的，如果看起来干爽的话就通常来讲都是健康的。

4、要询问猫咪之前有没有打过疫苗，如果猫咪还小没打过疫苗的话，要注意买回家后在一两周内带去打疫苗。')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (23, 2, 1, N'/images/Info/12.jpg
', N'短尾猫选择', N'1一定要询问的几个问题：

小猫咪的出生日期（连出生日期都说不清，太不靠谱了吧）

猫爸猫妈的照片（可以看出品种和预测小猫咪未来的颜值）

小猫咪的无滤镜无美颜视频（美颜的照片有多骗人呢，猫咪泪痕都看不清）

小猫咪的性格（文静或者活泼，看是否是自己喜欢的猫）

小猫咪是否打了疫苗，能否提供疫苗本（这个有些猫贩子真的搞笑，两个多月说疫苗都打完了，真是鬼扯，要么说打了一针没得疫苗本，要么是可以给你办个疫苗本，我还是建议接回来重新打，去正规宠物医院打！不要去宠物店打啊）

小猫咪的饮食情况（猫粮牌子、猫奶粉牌子、冻干牌子等，一些听都没听过的猫粮牌子还是算了吧）还有是否断奶等

是否有过猫癣、家里还有没有其他猫或狗')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (24, 2, 1, N'/images/Info/20.jpg
', N'宠物猫检查', N'虽然我们天天提倡领养代替购买，但是真正这样去做的人还是一小部分。因为很多人想要养一只品种猫，而可以领养的猫却大部分都是田园猫，这自然不能满足他们的需求，于是他们就会去宠物店或者别的地方去购买猫咪。

大部分人买猫都是希望花少量的钱买最漂亮的品种猫，那么我们如何保证自己买到的猫不是病猫呢？买猫如何防止被骗呢？如果你不知道的话，那就跟着我的脚步一起往下看吧。

买猫如何防止被骗？

我们买猫的途径大致分为三种，第一种是去宠物店购买，第二种是个人猫咪繁育的猫，第三种是网上购买。在以上的三种途径当中，最容易受骗的途径便是网上购猫。

网上买猫的时候，卖家会提供很多猫咪视频或者猫咪照片让你挑选，等你挑选好喜欢的猫以后，你就需要付款（这一环节就有可能被骗，付了款就被拉黑），付款后卖家就会将猫给你运过来，但是你接到猫后，你就发现，它跟你看的照片一点都不像。')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (25, 2, 1, N'/images/Info/11.jpg
', N'网上买猫要当心，谨防诈骗', N'猫的颜值以个人喜欢为主，健康方面就需要很多繁琐的步骤来一一查看。

猫癣：买猫最怕的就是猫癣，因为这种病并不是什么大病，但是治疗的周期却是相当的漫长，而且还会传染给人。挑选的猫的时候可以准备一个伍德氏灯的手电筒，在猫的皮肤上照射，如果出现绿色，即为猫癣。

耳螨：健康的猫耳朵是干净无异味的， 如果你去买猫发现猫的耳朵很脏，八成就是耳螨了，耳螨通常会伴随着猫癣。如果稍微脏那么一点点，那么有可能会是耳屎，当然，不会很多。

猫的眼睛应该是干净清澈的，眼角没有过于明显的泪痕，猫的嘴巴不会流口水。

卖猫的地方一般都会有逗猫棒，可以拿来试探猫咪。健康的猫反应速度和精神状态都应该是极好的，如果对于逗猫棒没有反应或是反应迟缓目光呆滞，则极有可能不健康。

肛门干净，肚子不鼓涨。')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (26, 2, 1, N'/images/Info/1.jpg
', N'挑选猫咪技巧', N'首先选猫都是通过视频的方式进行的或者有条件可以直播选猫的整个过程，不要通过几张图片就能够下决定是一件很鲁莽的事情，而且在整个过程中你也无法监控是否收到的猫咪是你挑选的猫咪，因此还是推荐视频直播的方式进行和猫咪互动，看看猫咪的状态来判断猫咪的健康程度。

  为了保证自己挑选猫咪和邮寄到的猫咪是同一只猫咪，建议宠主和商家一定要保障在猫咪挑选的整个过程中用视频的方式从猫咪的挑选到猫咪打包的的视频，整个过程都应该很直观的展现给客户，这样对商家也是有多大的保障，商家要要求宠主收到猫咪之后开箱之前要录制相应的视频确定猫咪在整个运输的过程中的状况是否良好！


饲养猫咪选择很重要,如何通过网上选择健康的宠物猫！


  不管选择那家猫舍或者网站只要通过网络进行交易一定要选择最根本的选猫方式，因为你自己都不在现场也是保证双方的权益很有必须备注双方的交易视频，毕竟对于消费者来说花费几千上万买只宠物猫都不希望途中有什么的事情发生吧，对于商家来说宠物猫属于活体动物，在整个运输的过程中都不希望有什么闪失。 ')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (27, 2, 1, N'/images/Info/13.jpg
', N'饲养猫咪选择很重要,如何通过网上选择健康的宠物猫！', N'很多爱猫人士会经常在百度上搜索宠物猫怎么卖的关键词，就是想知道宠物猫的市场行情到底好不好，当然这个搜索结果也只是一个具有参考价值的数字并不是市场上所给出的价格，因此对于宠物猫怎么卖的相关问题小编想说几句：

猫咪都挺好：宠物猫怎么卖?

  宠物猫的行情价格根据当地的消费情况而定的，比如一线城市或者二线城市相对于三四线城市来说价格比较低一些，另外的原因就是倒猫贩子为了抢占市场，恶意扰乱猫咪市场，使消费者在选择买猫的时候陷入纠结中，一般作为消费者来说拥有一只健康纯真的猫咪比什么都好！


  在同一类别的猫咪在不同城市的价格也会不一样的，其次及时同类猫咪的品相也是不一样的，长得好看的猫咪必然在价格上也是如此，不同类目的猫咪在猫咪的每个阶段价钱也是不一样的，比如猫咪的幼年期，猫咪的成年期以及猫咪的老年期都是不一样的，至于价格到底是多少取决于当地的消费所决定。

猫咪都挺好：宠物猫怎么卖?

  另外网上的猫咪价格跟实体店的猫咪价格也是不一样的，实体店的价格对于网上的猫咪价格高一些，毕竟人家实体店需要门面和水电费的支撑，如果选择在网上挑选猫咪那么在价格上也是很少的一部分，并不会低很多，尤其是品种猫价格都会在5000起步。 ')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (28, 2, 1, N'/images/Info/14.jpg
', N'猫咪知识大盘点：家猫和野猫有什么区别？', N'或许你在大街小巷会偶然看到有猫咪来回的窜，恩，这可能就是野猫，就像没人家的孩子，被称为野孩子一样，当然也可以说是流浪猫，家养的那种猫咪是宠物猫，至于家养猫和宠物猫有什么区别，接下来看看小编怎么说：

猫咪知识大盘点：家猫和野猫有什么区别？

  其实家养的猫咪说白了就是有人带有主人照顾的猫咪简单的来说吧而野猫就是没有人看管也没有地方落脚，没有家的猫咪经常会看到这些没有家的猫宝宝受到人们的欺负和打骂，当然这样的野猫也是很多的，经常会偷吃人家的东西被人家打的事情也是常有发生。


  野猫的性子是很不友善，因为它长期处于一种非常危险的禁地，为了食物经常受到挨打的事情也是常有的，但是野猫的生命力比较顽强，不容易生病，就算是刮风下雨或者说下大雪也不怕感冒发烧咳嗽发高烧，皮皮实实的就像一个孩子，家猫的饲养方式对猫咪本身的免疫防御不太好，猫咪也很容易生病。


猫咪知识大盘点：家猫和野猫有什么区别？

  野猫能够成为野猫也很不容易的，而且生命力比较顽强，从来不会饿着肚子，捕食能力比较强还能逮着老鼠呢，家猫就不行了，家猫不吃老鼠每天会呆在屋子里吃喝拉撒，可以说很悠哉，家猫的品种也是很多的不同的品种都会有不同的选择！ ')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (29, 2, 1, N'/images/Info/5.jpg
', N'网上买猫很便宜？还是当下猫咪安全吧！', N'很多宠物猫宠主大多猫咪都是从网上进行购买，随着科技不断的发展网络上买商品已经不是新鲜事，对于这种活体的猫咪不建议通过网上进行购买，因为通过网上购买猫咪最重要的是在运输安全措施无可控，很容易造成猫咪身体上的伤害！

网上买猫很便宜？还是当下猫咪安全吧！

  如过通过网上来购买宠物猫最主要的是很多宠物店的老板并没有养过宠物只顾赚钱，甚至对宠物品种、身体状况、饮食及常识一无所知，这也是网不提倡大家去网上买猫咪，即使再便宜也不要去买的原因！


  如果是养猫新手建议可以领养一只比较好，有经济条件的情况下去一些比较正规比较出名的猫舍预定排队购买，你可以了解到猫咪各方面情况，正规猫舍那里，基本上猫舍会给出一份新手指南很让人放心，在售后也是让人有保障！


  如果是通过微商购买基本都是猫贩子来饲养的其实他就是想发发朋友圈自己都没有养过猫么，一些不知真相的朋友很容易受到伤害，或者被骗，互联网上有很多像这样的无良商家，一定要小心通过淘宝其实是最有保障的！ ')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (30, 2, 1, N'/images/Info/1.jpg
', N'为什么加菲猫爱挑食到底是谁的错？', N'    现实生活中加菲猫的宠主则表示在以往的养猫旅程中发现加菲猫是最容易挑食的一种品种猫，从基因上看加菲猫挑食是习惯性的不是品种问题，那么到底是什么原因让加菲猫养成了挑食的坏习惯呢？我们看看医生怎么说：

为什么加菲猫爱挑食到底是谁的错？

  波斯猫还是别的宠物猫，别以为挂上宠物两个字就觉得宠的不得了，坏毛病都是惯得，主要的原因还是出现在主人的饲养方式上，这就是猫咪的公主病，饿几天看看会不会挑食，这些都是主人在日常的饲养过程当中养成的，是病就得治！


  波斯猫平时在喂养的过程当中很容易出现厌食的情况，一旦出现厌食的情况有两种可能要么就会猫咪还不想吃喂食的频率太高了，第二种原因是猫咪可能就是有意厌食，如果这个时候因为厌食主人换了猫粮或者其他的食物来获得猫咪进食，那么就成功的养成了猫咪挑食的坏习惯。

为什么加菲猫爱挑食到底是谁的错？

  很多猫咪主人天天闲着没事看就喂猫，既然是宠物就得宠着这不什么都喂，每天会换个好几样食物进行喂养，看这猫咪吃着不同的食物沾沾自喜的很开心，时间长了就会养成了这个坏习惯，如果宠主有更多的时间那倒也不觉得是件坏事对不对？ ')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (37, 1, 1, N'/images/info/6.jpg', N'超级喜欢猫咪怎么办？', N'我无语了')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (38, 1, 11, N'/images/info/2.jpg', N'wew', N'ewewqewq')
INSERT [dbo].[info] ([info_id], [infoClass_id], [user_id], [info_img], [info_title], [info_content]) VALUES (39, 1, 1, N'/images/info/5.jpg', N'wew', N'qwew')
SET IDENTITY_INSERT [dbo].[info] OFF
SET IDENTITY_INSERT [dbo].[infoClass] ON 

INSERT [dbo].[infoClass] ([infoClass_id], [infoClass_name]) VALUES (1, N'资讯')
INSERT [dbo].[infoClass] ([infoClass_id], [infoClass_name]) VALUES (2, N'选猫技巧')
SET IDENTITY_INSERT [dbo].[infoClass] OFF
SET IDENTITY_INSERT [dbo].[infoComment] ON 

INSERT [dbo].[infoComment] ([infoComment_id], [info_id], [user_id], [comment], [addtime]) VALUES (1, 1, 1, N'很不错！有帮助！', CAST(0x0000AA6200B12857 AS DateTime))
INSERT [dbo].[infoComment] ([infoComment_id], [info_id], [user_id], [comment], [addtime]) VALUES (2, 2, 1, N'很不错！有帮助！', CAST(0x0000AA6200B13F33 AS DateTime))
INSERT [dbo].[infoComment] ([infoComment_id], [info_id], [user_id], [comment], [addtime]) VALUES (3, 2, 1, N'很不错！有帮助！', CAST(0x0000AA6200B14285 AS DateTime))
INSERT [dbo].[infoComment] ([infoComment_id], [info_id], [user_id], [comment], [addtime]) VALUES (4, 3, 1, N'很不错', CAST(0x0000AA6200B14F61 AS DateTime))
INSERT [dbo].[infoComment] ([infoComment_id], [info_id], [user_id], [comment], [addtime]) VALUES (5, 1, 1, N'很棒', CAST(0x0000AA6200B1599E AS DateTime))
INSERT [dbo].[infoComment] ([infoComment_id], [info_id], [user_id], [comment], [addtime]) VALUES (6, 7, 1, N'打算', CAST(0x0000AA6200B1B3F5 AS DateTime))
INSERT [dbo].[infoComment] ([infoComment_id], [info_id], [user_id], [comment], [addtime]) VALUES (7, 3, 1, N'nice', CAST(0x0000AA6200B27462 AS DateTime))
INSERT [dbo].[infoComment] ([infoComment_id], [info_id], [user_id], [comment], [addtime]) VALUES (8, 11, 1, N'uj', CAST(0x0000AA76011EE908 AS DateTime))
INSERT [dbo].[infoComment] ([infoComment_id], [info_id], [user_id], [comment], [addtime]) VALUES (9, 9, 11, N'dsd', CAST(0x0000AAF70166D410 AS DateTime))
INSERT [dbo].[infoComment] ([infoComment_id], [info_id], [user_id], [comment], [addtime]) VALUES (10, 1, 1, N'aa', CAST(0x0000AAF7016A70BF AS DateTime))
INSERT [dbo].[infoComment] ([infoComment_id], [info_id], [user_id], [comment], [addtime]) VALUES (11, 1, 1, N'dsadsa', CAST(0x0000AAF7016C2988 AS DateTime))
SET IDENTITY_INSERT [dbo].[infoComment] OFF
SET IDENTITY_INSERT [dbo].[MakePrivate] ON 

INSERT [dbo].[MakePrivate] ([myprivate_id], [Users_id], [destination], [customname], [phone], [expenses], [dates], [tools], [notes]) VALUES (1, 5, NULL, N'', N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[MakePrivate] ([myprivate_id], [Users_id], [destination], [customname], [phone], [expenses], [dates], [tools], [notes]) VALUES (2, 5, N'', N'', N'', CAST(2000 AS Decimal(18, 0)), CAST(0x0000AA5F00000000 AS DateTime), N'', N'          ')
INSERT [dbo].[MakePrivate] ([myprivate_id], [Users_id], [destination], [customname], [phone], [expenses], [dates], [tools], [notes]) VALUES (3, 5, N'江西师范大学', N'小白', N'11111111111', CAST(2000 AS Decimal(18, 0)), CAST(0x0000AA5F00000000 AS DateTime), N'快递', N'111       ')
INSERT [dbo].[MakePrivate] ([myprivate_id], [Users_id], [destination], [customname], [phone], [expenses], [dates], [tools], [notes]) VALUES (4, 5, N'江西师范大学', N'肖嘉炜', N'15270651751', CAST(6666 AS Decimal(18, 0)), CAST(0x0000AA8200000000 AS DateTime), N'顺丰', N'1         ')
INSERT [dbo].[MakePrivate] ([myprivate_id], [Users_id], [destination], [customname], [phone], [expenses], [dates], [tools], [notes]) VALUES (5, 5, N'55', N'肖嘉炜', N'15270651751', CAST(6666 AS Decimal(18, 0)), CAST(0x0000AA8200000000 AS DateTime), N'顺丰', N'1         ')
INSERT [dbo].[MakePrivate] ([myprivate_id], [Users_id], [destination], [customname], [phone], [expenses], [dates], [tools], [notes]) VALUES (6, 5, N'5566', N'肖嘉炜', N'15270651751', CAST(9995 AS Decimal(18, 0)), CAST(0x0000AA5F00000000 AS DateTime), N'顺丰', N'1         ')
INSERT [dbo].[MakePrivate] ([myprivate_id], [Users_id], [destination], [customname], [phone], [expenses], [dates], [tools], [notes]) VALUES (7, 5, N'66', N'肖嘉炜', N'15270651751', CAST(9996 AS Decimal(18, 0)), CAST(0x0000AA5F00000000 AS DateTime), N'顺丰', N'22        ')
SET IDENTITY_INSERT [dbo].[MakePrivate] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([order_id], [user_id], [order_time], [address], [phone], [zipcode], [total_price]) VALUES (1, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([order_id], [user_id], [order_time], [address], [phone], [zipcode], [total_price]) VALUES (2, 1, CAST(0x0000AA76011FB46E AS DateTime), N'江西师范大学', N'15711111111', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[orderDetails] ON 

INSERT [dbo].[orderDetails] ([orderDetails_id], [num], [order_id]) VALUES (1, 4, 1)
INSERT [dbo].[orderDetails] ([orderDetails_id], [num], [order_id]) VALUES (2, 5, 1)
INSERT [dbo].[orderDetails] ([orderDetails_id], [num], [order_id]) VALUES (3, 3, 1)
SET IDENTITY_INSERT [dbo].[orderDetails] OFF
SET IDENTITY_INSERT [dbo].[Shop] ON 

INSERT [dbo].[Shop] ([shop_id], [shop_name], [user_id], [shop_introduce], [shop_addtime]) VALUES (1, N'爱宠大机密', 1, NULL, CAST(0x0000A8D600000000 AS DateTime))
INSERT [dbo].[Shop] ([shop_id], [shop_name], [user_id], [shop_introduce], [shop_addtime]) VALUES (2, N'带走我', 2, N'嘻嘻', CAST(0x0000AA8200000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Shop] OFF
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([user_id], [user_name], [phone], [address], [user_head], [age], [birth], [sex], [password], [user_introduce]) VALUES (1, N'ailocy', N'13697058140', N'江西', N'../images/login-1.jpg', NULL, NULL, NULL, N'123456', NULL)
INSERT [dbo].[UserInfo] ([user_id], [user_name], [phone], [address], [user_head], [age], [birth], [sex], [password], [user_introduce]) VALUES (2, N'lwx', N'13697058141', N'江西', NULL, 18, CAST(0x75250B00 AS Date), 1, N'123456', N'你们好')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [phone], [address], [user_head], [age], [birth], [sex], [password], [user_introduce]) VALUES (3, N'clearlove', N'13697058142', N'武汉', NULL, 25, CAST(0xF31B0B00 AS Date), 1, N'123456', N'加油')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [phone], [address], [user_head], [age], [birth], [sex], [password], [user_introduce]) VALUES (4, N'crisp', N'13697058143', N'上海', NULL, 20, CAST(0x35230B00 AS Date), 0, N'123456', N'对A要不起')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [phone], [address], [user_head], [age], [birth], [sex], [password], [user_introduce]) VALUES (5, N'xjw', N'15207651751', N'江西省', NULL, NULL, NULL, NULL, N'970225', NULL)
INSERT [dbo].[UserInfo] ([user_id], [user_name], [phone], [address], [user_head], [age], [birth], [sex], [password], [user_introduce]) VALUES (7, N'nodeadd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserInfo] ([user_id], [user_name], [phone], [address], [user_head], [age], [birth], [sex], [password], [user_introduce]) VALUES (11, N'lq', N'15997058140', N'江西', NULL, NULL, NULL, NULL, N'123456', NULL)
INSERT [dbo].[UserInfo] ([user_id], [user_name], [phone], [address], [user_head], [age], [birth], [sex], [password], [user_introduce]) VALUES (12, N'lqq', N'15997058140', NULL, NULL, NULL, NULL, NULL, N'123456', NULL)
INSERT [dbo].[UserInfo] ([user_id], [user_name], [phone], [address], [user_head], [age], [birth], [sex], [password], [user_introduce]) VALUES (13, N'scout', N'13697058140', NULL, NULL, NULL, NULL, NULL, N'123456', NULL)
INSERT [dbo].[UserInfo] ([user_id], [user_name], [phone], [address], [user_head], [age], [birth], [sex], [password], [user_introduce]) VALUES (14, N'mekio', N'15997058140', NULL, NULL, NULL, NULL, NULL, N'123456', NULL)
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Goods] FOREIGN KEY([good_id])
REFERENCES [dbo].[Goods] ([good_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Goods]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_UserInfo] FOREIGN KEY([user_id])
REFERENCES [dbo].[UserInfo] ([user_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_UserInfo]
GO
ALTER TABLE [dbo].[Cat]  WITH CHECK ADD  CONSTRAINT [FK_Cat_catClass] FOREIGN KEY([catClass_id])
REFERENCES [dbo].[catClass] ([catClass_id])
GO
ALTER TABLE [dbo].[Cat] CHECK CONSTRAINT [FK_Cat_catClass]
GO
ALTER TABLE [dbo].[Cat]  WITH CHECK ADD  CONSTRAINT [FK_Cat_Shop] FOREIGN KEY([shop_id])
REFERENCES [dbo].[Shop] ([shop_id])
GO
ALTER TABLE [dbo].[Cat] CHECK CONSTRAINT [FK_Cat_Shop]
GO
ALTER TABLE [dbo].[goodComment]  WITH CHECK ADD  CONSTRAINT [FK_goodComment_Goods] FOREIGN KEY([good_id])
REFERENCES [dbo].[Goods] ([good_id])
GO
ALTER TABLE [dbo].[goodComment] CHECK CONSTRAINT [FK_goodComment_Goods]
GO
ALTER TABLE [dbo].[goodComment]  WITH CHECK ADD  CONSTRAINT [FK_goodComment_UserInfo] FOREIGN KEY([user_id])
REFERENCES [dbo].[UserInfo] ([user_id])
GO
ALTER TABLE [dbo].[goodComment] CHECK CONSTRAINT [FK_goodComment_UserInfo]
GO
ALTER TABLE [dbo].[goodReply]  WITH CHECK ADD  CONSTRAINT [FK_goodReply_goodComment] FOREIGN KEY([goodComment_id])
REFERENCES [dbo].[goodComment] ([goodComment_id])
GO
ALTER TABLE [dbo].[goodReply] CHECK CONSTRAINT [FK_goodReply_goodComment]
GO
ALTER TABLE [dbo].[goodReply]  WITH CHECK ADD  CONSTRAINT [FK_goodReply_UserInfo] FOREIGN KEY([user_id])
REFERENCES [dbo].[UserInfo] ([user_id])
GO
ALTER TABLE [dbo].[goodReply] CHECK CONSTRAINT [FK_goodReply_UserInfo]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_goodClass] FOREIGN KEY([goodClass_id])
REFERENCES [dbo].[goodClass] ([goodClass_id])
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_goodClass]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_orderDetails] FOREIGN KEY([orderDetails_id])
REFERENCES [dbo].[orderDetails] ([orderDetails_id])
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_orderDetails]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_Shop] FOREIGN KEY([shop_id])
REFERENCES [dbo].[Shop] ([shop_id])
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_Shop]
GO
ALTER TABLE [dbo].[info]  WITH CHECK ADD  CONSTRAINT [FK_info_infoClass] FOREIGN KEY([infoClass_id])
REFERENCES [dbo].[infoClass] ([infoClass_id])
GO
ALTER TABLE [dbo].[info] CHECK CONSTRAINT [FK_info_infoClass]
GO
ALTER TABLE [dbo].[info]  WITH CHECK ADD  CONSTRAINT [FK_info_UserInfo] FOREIGN KEY([user_id])
REFERENCES [dbo].[UserInfo] ([user_id])
GO
ALTER TABLE [dbo].[info] CHECK CONSTRAINT [FK_info_UserInfo]
GO
ALTER TABLE [dbo].[infoComment]  WITH CHECK ADD  CONSTRAINT [FK_infoComment_info] FOREIGN KEY([info_id])
REFERENCES [dbo].[info] ([info_id])
GO
ALTER TABLE [dbo].[infoComment] CHECK CONSTRAINT [FK_infoComment_info]
GO
ALTER TABLE [dbo].[infoComment]  WITH CHECK ADD  CONSTRAINT [FK_infoComment_UserInfo] FOREIGN KEY([user_id])
REFERENCES [dbo].[UserInfo] ([user_id])
GO
ALTER TABLE [dbo].[infoComment] CHECK CONSTRAINT [FK_infoComment_UserInfo]
GO
ALTER TABLE [dbo].[infoReply]  WITH CHECK ADD  CONSTRAINT [FK_infoReply_infoComment] FOREIGN KEY([infoComment_id])
REFERENCES [dbo].[infoComment] ([infoComment_id])
GO
ALTER TABLE [dbo].[infoReply] CHECK CONSTRAINT [FK_infoReply_infoComment]
GO
ALTER TABLE [dbo].[infoReply]  WITH CHECK ADD  CONSTRAINT [FK_infoReply_UserInfo] FOREIGN KEY([user_id])
REFERENCES [dbo].[UserInfo] ([user_id])
GO
ALTER TABLE [dbo].[infoReply] CHECK CONSTRAINT [FK_infoReply_UserInfo]
GO
ALTER TABLE [dbo].[MakePrivate]  WITH CHECK ADD  CONSTRAINT [FK_MakePrivate_UserInfo] FOREIGN KEY([Users_id])
REFERENCES [dbo].[UserInfo] ([user_id])
GO
ALTER TABLE [dbo].[MakePrivate] CHECK CONSTRAINT [FK_MakePrivate_UserInfo]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_UserInfo] FOREIGN KEY([user_id])
REFERENCES [dbo].[UserInfo] ([user_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_UserInfo]
GO
ALTER TABLE [dbo].[orderDetails]  WITH CHECK ADD  CONSTRAINT [FK_orderDetails_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[orderDetails] CHECK CONSTRAINT [FK_orderDetails_Order]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_UserInfo] FOREIGN KEY([user_id])
REFERENCES [dbo].[UserInfo] ([user_id])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_UserInfo]
GO
USE [master]
GO
ALTER DATABASE [Catpuzi] SET  READ_WRITE 
GO
