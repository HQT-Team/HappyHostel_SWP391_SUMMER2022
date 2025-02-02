USE [master]
GO
/****** Object:  Database [HostelManagement]    Script Date: 8/8/2022 5:54:29 PM ******/
CREATE DATABASE [HostelManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HostelManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.KHOAHD7621\MSSQL\DATA\HostelManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HostelManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.KHOAHD7621\MSSQL\DATA\HostelManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HostelManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HostelManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HostelManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HostelManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HostelManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HostelManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HostelManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [HostelManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HostelManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HostelManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HostelManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HostelManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HostelManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HostelManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HostelManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HostelManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HostelManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HostelManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HostelManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HostelManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HostelManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HostelManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HostelManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HostelManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HostelManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HostelManagement] SET  MULTI_USER 
GO
ALTER DATABASE [HostelManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HostelManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HostelManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HostelManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HostelManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HostelManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HostelManagement] SET QUERY_STORE = OFF
GO
USE [HostelManagement]
GO
/****** Object:  Table [dbo].[AccountInformations]    Script Date: 8/8/2022 5:54:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountInformations](
	[account_info_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NOT NULL,
	[fullname] [nvarchar](255) NULL,
	[email] [varchar](255) NULL,
	[birthday] [date] NULL,
	[sex] [bit] NULL,
	[phone] [varchar](11) NULL,
	[address] [nvarchar](255) NULL,
	[identity_card_number] [varchar](12) NULL,
 CONSTRAINT [PK__AccountI__2725CC88D4A18ED9] PRIMARY KEY CLUSTERED 
(
	[account_info_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 8/8/2022 5:54:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](60) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[token] [varchar](255) NULL,
	[create_date] [date] NOT NULL,
	[expired_date] [date] NULL,
	[status] [int] NOT NULL,
	[role] [int] NOT NULL,
	[room_id] [int] NULL,
	[otp] [varchar](5) NULL,
	[expired_time_otp] [datetime] NULL,
	[request_recover_password_code] [nvarchar](255) NULL,
	[expired_time_recover_password] [datetime] NULL,
 CONSTRAINT [PK__Accounts__46A222CDE6C70A81] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 8/8/2022 5:54:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[bill_id] [int] IDENTITY(1,1) NOT NULL,
	[total_money] [decimal](18, 0) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[bill_title] [varchar](50) NULL,
	[expired_payment_date] [datetime] NOT NULL,
	[payment_date] [datetime] NULL,
	[status] [bit] NOT NULL,
	[payment_id] [int] NULL,
	[room_id] [int] NOT NULL,
 CONSTRAINT [PK__Bill__D706DDB37247E613] PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 8/8/2022 5:54:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[bill_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[consumeIDStart] [int] NOT NULL,
	[consumeIDEnd] [int] NOT NULL,
	[accountHostelOwnerID] [int] NOT NULL,
	[accountRenterID] [int] NULL,
	[bill_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[bill_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillService]    Script Date: 8/8/2022 5:54:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillService](
	[bill_detail_id] [int] NOT NULL,
	[hostel_service_id] [int] NOT NULL,
 CONSTRAINT [PK_BillService] PRIMARY KEY CLUSTERED 
(
	[hostel_service_id] ASC,
	[bill_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consumes]    Script Date: 8/8/2022 5:54:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consumes](
	[consume_id] [int] IDENTITY(1,1) NOT NULL,
	[number_electric] [int] NOT NULL,
	[number_water] [int] NOT NULL,
	[update_date] [datetime] NOT NULL,
	[status] [int] NOT NULL,
	[room_id] [int] NOT NULL,
 CONSTRAINT [PK__Consumes__B28BF50FF767A7C4] PRIMARY KEY CLUSTERED 
(
	[consume_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 8/8/2022 5:54:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contracts](
	[contract_id] [int] IDENTITY(1,1) NOT NULL,
	[room_id] [int] NOT NULL,
	[price] [decimal](18, 0) NOT NULL,
	[start_date] [datetime] NOT NULL,
	[expiration] [datetime] NOT NULL,
	[deposit] [decimal](18, 0) NOT NULL,
	[hostel_owner_id] [int] NOT NULL,
	[renter_id] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[cancelDate] [datetime] NULL,
 CONSTRAINT [PK__Contract__F8D66423CFA9A95D] PRIMARY KEY CLUSTERED 
(
	[contract_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hostels]    Script Date: 8/8/2022 5:54:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hostels](
	[hostel_id] [int] IDENTITY(1,1) NOT NULL,
	[owner_account_id] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[ward] [nvarchar](255) NOT NULL,
	[district] [nvarchar](255) NOT NULL,
	[city] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[hostel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HostelService]    Script Date: 8/8/2022 5:54:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HostelService](
	[hostel_service_id] [int] IDENTITY(1,1) NOT NULL,
	[hostel_id] [int] NOT NULL,
	[service_id] [int] NOT NULL,
	[service_price] [decimal](18, 0) NOT NULL,
	[valid_date] [datetime] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_HostelService_1] PRIMARY KEY CLUSTERED 
(
	[hostel_service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InfrastructureItem]    Script Date: 8/8/2022 5:54:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InfrastructureItem](
	[id_infrastructure_item] [int] IDENTITY(1,1) NOT NULL,
	[infrastructure_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Infrastr__55E3CA2DA4D7171B] PRIMARY KEY CLUSTERED 
(
	[id_infrastructure_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InfrastructuresRoom]    Script Date: 8/8/2022 5:54:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InfrastructuresRoom](
	[id_infrastructure] [int] IDENTITY(1,1) NOT NULL,
	[room_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[status] [int] NOT NULL,
	[id_infrastructure_item] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_infrastructure] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 8/8/2022 5:54:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[notification_id] [int] IDENTITY(1,1) NOT NULL,
	[hostel_owner_account_id] [int] NOT NULL,
	[hostel_id] [int] NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[create_date] [datetime] NOT NULL,
 CONSTRAINT [PK__Notifica__E059842F98ABF20D] PRIMARY KEY CLUSTERED 
(
	[notification_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 8/8/2022 5:54:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[payment_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Payment__ED1FC9EACDC126B0] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propose]    Script Date: 8/8/2022 5:54:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Propose](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[send_date] [datetime] NOT NULL,
	[reply] [nvarchar](max) NULL,
	[reply_date] [datetime] NULL,
	[status] [int] NOT NULL,
	[send_account_id] [int] NOT NULL,
	[reply_account_id] [int] NULL,
 CONSTRAINT [PK_Propose] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportCategory]    Script Date: 8/8/2022 5:54:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportCategory](
	[cate_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 8/8/2022 5:54:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reports](
	[id_report] [int] IDENTITY(1,1) NOT NULL,
	[send_date] [datetime] NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[status] [int] NOT NULL,
	[reply] [nvarchar](max) NULL,
	[reply_date] [datetime] NULL,
	[complete_date] [datetime] NULL,
	[reply_account_id] [int] NOT NULL,
	[send_account_id] [int] NOT NULL,
	[cate_id] [int] NOT NULL,
 CONSTRAINT [PK__Reports__D8639F5265CDEDC5] PRIMARY KEY CLUSTERED 
(
	[id_report] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomateInformations]    Script Date: 8/8/2022 5:54:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomateInformations](
	[roomate_info_id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[birthday] [date] NOT NULL,
	[sex] [bit] NOT NULL,
	[phone] [varchar](11) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[identity_card_number] [varchar](12) NOT NULL,
	[parent_name] [nvarchar](255) NULL,
	[parent_phone] [varchar](11) NULL,
	[account_renter_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roomate_info_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 8/8/2022 5:54:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[room_id] [int] IDENTITY(1,1) NOT NULL,
	[hostel_id] [int] NOT NULL,
	[room_number] [int] NOT NULL,
	[capacity] [int] NOT NULL,
	[room_area] [decimal](18, 3) NOT NULL,
	[has_attic] [int] NOT NULL,
	[room_status] [int] NOT NULL,
	[invite_code] [varchar](50) NULL,
	[QRcode] [varchar](max) NULL,
	[expiredTimeCode] [datetime] NULL,
 CONSTRAINT [PK__Rooms__19675A8A6BDF94F6] PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 8/8/2022 5:54:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[service_id] [int] IDENTITY(1,1) NOT NULL,
	[service_name] [nvarchar](255) NOT NULL,
	[unit] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Services__3E0DB8AFD45255D2] PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AccountInformations] ON 

INSERT [dbo].[AccountInformations] ([account_info_id], [account_id], [fullname], [email], [birthday], [sex], [phone], [address], [identity_card_number]) VALUES (2, 2, N'Ngô Phi Thường', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AccountInformations] ([account_info_id], [account_id], [fullname], [email], [birthday], [sex], [phone], [address], [identity_card_number]) VALUES (3, 3, N'Nguyễn Tuấn Đạt Test', N'testmail7621@gmail.com', CAST(N'1995-01-05' AS Date), 1, N'0922532627', N'Lê Văn Việt, thành phố Thủ Đức, thành phố Hồ Chí Minh', N'123456789')
INSERT [dbo].[AccountInformations] ([account_info_id], [account_id], [fullname], [email], [birthday], [sex], [phone], [address], [identity_card_number]) VALUES (4, 4, N'Trần Huyền Trang Test', N'tranghuyen2357@gmail.com', CAST(N'1975-01-01' AS Date), 0, N'0792444333', N'Lê Văn Việt, thành phố Thủ Đức, thành phố Hồ Chí Minh', N'123456789')
INSERT [dbo].[AccountInformations] ([account_info_id], [account_id], [fullname], [email], [birthday], [sex], [phone], [address], [identity_card_number]) VALUES (13, 8, NULL, N'testmail9999@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AccountInformations] ([account_info_id], [account_id], [fullname], [email], [birthday], [sex], [phone], [address], [identity_card_number]) VALUES (14, 9, NULL, N'testmail9998@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AccountInformations] ([account_info_id], [account_id], [fullname], [email], [birthday], [sex], [phone], [address], [identity_card_number]) VALUES (15, 10, N'Lưu Đăng Tám', N'testmail9997@gmail.com', NULL, NULL, NULL, NULL, N'123456789')
INSERT [dbo].[AccountInformations] ([account_info_id], [account_id], [fullname], [email], [birthday], [sex], [phone], [address], [identity_card_number]) VALUES (16, 11, NULL, N'testmail9996@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AccountInformations] ([account_info_id], [account_id], [fullname], [email], [birthday], [sex], [phone], [address], [identity_card_number]) VALUES (17, 12, N'Thái Văn Nam', N'honam9999@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AccountInformations] ([account_info_id], [account_id], [fullname], [email], [birthday], [sex], [phone], [address], [identity_card_number]) VALUES (18, 13, N'Đào Viết Hà', N'khoahd9999@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AccountInformations] ([account_info_id], [account_id], [fullname], [email], [birthday], [sex], [phone], [address], [identity_card_number]) VALUES (19, 14, NULL, N'khoahd9998@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AccountInformations] ([account_info_id], [account_id], [fullname], [email], [birthday], [sex], [phone], [address], [identity_card_number]) VALUES (20, 15, N'Nguyễn Văn B', N'khoahd9997@gmail.com', NULL, NULL, NULL, NULL, N'123456789')
INSERT [dbo].[AccountInformations] ([account_info_id], [account_id], [fullname], [email], [birthday], [sex], [phone], [address], [identity_card_number]) VALUES (21, 16, N'Nguyễn Văn C', N'khoahd9996@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AccountInformations] ([account_info_id], [account_id], [fullname], [email], [birthday], [sex], [phone], [address], [identity_card_number]) VALUES (22, 17, N'Nguyễn Văn D', N'testmail9995@gmail.com', NULL, NULL, NULL, NULL, N'123456789')
INSERT [dbo].[AccountInformations] ([account_info_id], [account_id], [fullname], [email], [birthday], [sex], [phone], [address], [identity_card_number]) VALUES (23, 18, N'Nguyễn Văn E', N'testmail9994@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AccountInformations] ([account_info_id], [account_id], [fullname], [email], [birthday], [sex], [phone], [address], [identity_card_number]) VALUES (24, 19, N'Nguyễn Văn F', N'testmail9993@gmail.com', NULL, NULL, NULL, NULL, N'123456789')
INSERT [dbo].[AccountInformations] ([account_info_id], [account_id], [fullname], [email], [birthday], [sex], [phone], [address], [identity_card_number]) VALUES (25, 20, N'Nguyễn Văn G', N'testmail9992@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AccountInformations] ([account_info_id], [account_id], [fullname], [email], [birthday], [sex], [phone], [address], [identity_card_number]) VALUES (26, 21, N'Nguyễn Văn H', N'testmail9991@gmail.com', NULL, NULL, NULL, NULL, N'123456789')
INSERT [dbo].[AccountInformations] ([account_info_id], [account_id], [fullname], [email], [birthday], [sex], [phone], [address], [identity_card_number]) VALUES (27, 22, N'Nguyễn Văn I', N'testmail9990@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AccountInformations] ([account_info_id], [account_id], [fullname], [email], [birthday], [sex], [phone], [address], [identity_card_number]) VALUES (28, 23, N'Nguyễn Văn J', N'testmail9989@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AccountInformations] ([account_info_id], [account_id], [fullname], [email], [birthday], [sex], [phone], [address], [identity_card_number]) VALUES (29, 24, N'Hoàng Đăng Khoa', N'dangkhoa7621@gmail.com', NULL, NULL, NULL, NULL, N'123456789')
INSERT [dbo].[AccountInformations] ([account_info_id], [account_id], [fullname], [email], [birthday], [sex], [phone], [address], [identity_card_number]) VALUES (30, 25, N'Hồ Hải Nam', N'khoahd7621@gmail.com', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[AccountInformations] OFF
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([account_id], [username], [password], [token], [create_date], [expired_date], [status], [role], [room_id], [otp], [expired_time_otp], [request_recover_password_code], [expired_time_recover_password]) VALUES (2, N'admin', N'e10adc3949ba59abbe56e057f20f883e', NULL, CAST(N'2001-01-01' AS Date), NULL, 1, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [token], [create_date], [expired_date], [status], [role], [room_id], [otp], [expired_time_otp], [request_recover_password_code], [expired_time_recover_password]) VALUES (3, N'owner', N'fcea920f7412b5da7be0cf42b8c93759', NULL, CAST(N'2001-01-01' AS Date), NULL, 1, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [token], [create_date], [expired_date], [status], [role], [room_id], [otp], [expired_time_otp], [request_recover_password_code], [expired_time_recover_password]) VALUES (4, N'renter', N'e10adc3949ba59abbe56e057f20f883e', N'renterjysbOP2N2WRhqJf2HJQOBwBEm', CAST(N'2022-05-01' AS Date), CAST(N'2023-05-01' AS Date), 1, 2, 1, NULL, NULL, N'70102', CAST(N'2022-08-05T13:47:43.000' AS DateTime))
INSERT [dbo].[Accounts] ([account_id], [username], [password], [token], [create_date], [expired_date], [status], [role], [room_id], [otp], [expired_time_otp], [request_recover_password_code], [expired_time_recover_password]) VALUES (8, N'renter9999', N'e10adc3949ba59abbe56e057f20f883e', NULL, CAST(N'2022-07-15' AS Date), NULL, 2, 2, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [token], [create_date], [expired_date], [status], [role], [room_id], [otp], [expired_time_otp], [request_recover_password_code], [expired_time_recover_password]) VALUES (9, N'renter9998', N'e10adc3949ba59abbe56e057f20f883e', NULL, CAST(N'2022-07-15' AS Date), NULL, 2, 2, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [token], [create_date], [expired_date], [status], [role], [room_id], [otp], [expired_time_otp], [request_recover_password_code], [expired_time_recover_password]) VALUES (10, N'owner9999', N'e10adc3949ba59abbe56e057f20f883e', NULL, CAST(N'2022-07-19' AS Date), NULL, 1, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [token], [create_date], [expired_date], [status], [role], [room_id], [otp], [expired_time_otp], [request_recover_password_code], [expired_time_recover_password]) VALUES (11, N'renter9997', N'e10adc3949ba59abbe56e057f20f883e', NULL, CAST(N'2022-07-22' AS Date), NULL, 2, 2, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [token], [create_date], [expired_date], [status], [role], [room_id], [otp], [expired_time_otp], [request_recover_password_code], [expired_time_recover_password]) VALUES (12, N'renter1', N'e10adc3949ba59abbe56e057f20f883e', NULL, CAST(N'2022-07-29' AS Date), CAST(N'2022-07-29' AS Date), 1, 2, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [token], [create_date], [expired_date], [status], [role], [room_id], [otp], [expired_time_otp], [request_recover_password_code], [expired_time_recover_password]) VALUES (13, N'renter2', N'e10adc3949ba59abbe56e057f20f883e', NULL, CAST(N'2022-08-03' AS Date), NULL, 2, 2, 18, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [token], [create_date], [expired_date], [status], [role], [room_id], [otp], [expired_time_otp], [request_recover_password_code], [expired_time_recover_password]) VALUES (14, N'renter3', N'87b1c878584bf4dce4379c6c33bd30dd', NULL, CAST(N'2022-08-03' AS Date), NULL, 0, 2, 14, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [token], [create_date], [expired_date], [status], [role], [room_id], [otp], [expired_time_otp], [request_recover_password_code], [expired_time_recover_password]) VALUES (15, N'owner9998', N'e10adc3949ba59abbe56e057f20f883e', NULL, CAST(N'2022-08-05' AS Date), NULL, 1, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [token], [create_date], [expired_date], [status], [role], [room_id], [otp], [expired_time_otp], [request_recover_password_code], [expired_time_recover_password]) VALUES (16, N'renter9996', N'e10adc3949ba59abbe56e057f20f883e', NULL, CAST(N'2022-08-05' AS Date), NULL, 1, 2, 34, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [token], [create_date], [expired_date], [status], [role], [room_id], [otp], [expired_time_otp], [request_recover_password_code], [expired_time_recover_password]) VALUES (17, N'owner9997', N'e10adc3949ba59abbe56e057f20f883e', NULL, CAST(N'2022-08-05' AS Date), NULL, 1, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [token], [create_date], [expired_date], [status], [role], [room_id], [otp], [expired_time_otp], [request_recover_password_code], [expired_time_recover_password]) VALUES (18, N'renter9995', N'e10adc3949ba59abbe56e057f20f883e', NULL, CAST(N'2022-08-05' AS Date), NULL, 1, 2, 50, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [token], [create_date], [expired_date], [status], [role], [room_id], [otp], [expired_time_otp], [request_recover_password_code], [expired_time_recover_password]) VALUES (19, N'owner9996', N'e10adc3949ba59abbe56e057f20f883e', NULL, CAST(N'2022-08-05' AS Date), NULL, 1, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [token], [create_date], [expired_date], [status], [role], [room_id], [otp], [expired_time_otp], [request_recover_password_code], [expired_time_recover_password]) VALUES (20, N'renter9994', N'e10adc3949ba59abbe56e057f20f883e', NULL, CAST(N'2022-08-05' AS Date), NULL, 1, 2, 66, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [token], [create_date], [expired_date], [status], [role], [room_id], [otp], [expired_time_otp], [request_recover_password_code], [expired_time_recover_password]) VALUES (21, N'owner9995', N'e10adc3949ba59abbe56e057f20f883e', NULL, CAST(N'2022-08-06' AS Date), NULL, 1, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [token], [create_date], [expired_date], [status], [role], [room_id], [otp], [expired_time_otp], [request_recover_password_code], [expired_time_recover_password]) VALUES (22, N'renter9993', N'e10adc3949ba59abbe56e057f20f883e', NULL, CAST(N'2022-08-06' AS Date), NULL, 1, 2, 82, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [token], [create_date], [expired_date], [status], [role], [room_id], [otp], [expired_time_otp], [request_recover_password_code], [expired_time_recover_password]) VALUES (23, N'renter9992', N'e10adc3949ba59abbe56e057f20f883e', NULL, CAST(N'2022-08-06' AS Date), NULL, 1, 2, 83, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [token], [create_date], [expired_date], [status], [role], [room_id], [otp], [expired_time_otp], [request_recover_password_code], [expired_time_recover_password]) VALUES (24, N'dangkhoa7621', N'e10adc3949ba59abbe56e057f20f883e', NULL, CAST(N'2022-08-08' AS Date), NULL, 1, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [token], [create_date], [expired_date], [status], [role], [room_id], [otp], [expired_time_otp], [request_recover_password_code], [expired_time_recover_password]) VALUES (25, N'namhh7621', N'e10adc3949ba59abbe56e057f20f883e', NULL, CAST(N'2022-08-08' AS Date), NULL, 1, 2, 103, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (25, CAST(3955000 AS Decimal(18, 0)), CAST(N'2022-01-29T20:09:13.737' AS DateTime), N'1/2022', CAST(N'2022-02-05T00:00:00.000' AS DateTime), CAST(N'2022-01-31T23:05:52.003' AS DateTime), 1, 1, 1)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (26, CAST(4225000 AS Decimal(18, 0)), CAST(N'2022-02-28T20:16:02.760' AS DateTime), N'2/2022', CAST(N'2022-03-02T00:00:00.000' AS DateTime), CAST(N'2022-03-01T20:31:55.330' AS DateTime), 1, 1, 1)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (27, CAST(3800000 AS Decimal(18, 0)), CAST(N'2022-03-27T20:38:44.827' AS DateTime), N'3/2022', CAST(N'2022-04-01T00:00:00.000' AS DateTime), CAST(N'2022-04-01T15:07:26.513' AS DateTime), 1, 1, 1)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (28, CAST(3800000 AS Decimal(18, 0)), CAST(N'2022-04-29T07:44:16.527' AS DateTime), N'4/2022', CAST(N'2022-05-02T00:00:00.000' AS DateTime), CAST(N'2022-05-01T21:23:18.010' AS DateTime), 1, 1, 1)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (29, CAST(4925000 AS Decimal(18, 0)), CAST(N'2022-05-28T21:26:56.917' AS DateTime), N'5/2022', CAST(N'2022-06-02T00:00:00.000' AS DateTime), CAST(N'2022-06-01T21:27:29.390' AS DateTime), 1, 1, 1)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (30, CAST(3800000 AS Decimal(18, 0)), CAST(N'2022-06-28T16:21:58.963' AS DateTime), N'6/2022', CAST(N'2022-07-01T00:00:00.000' AS DateTime), CAST(N'2022-07-01T22:36:46.123' AS DateTime), 1, 1, 1)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (31, CAST(3357000 AS Decimal(18, 0)), CAST(N'2022-02-28T22:23:47.300' AS DateTime), N'2/2022', CAST(N'2022-03-03T00:00:00.000' AS DateTime), CAST(N'2022-03-01T22:36:55.330' AS DateTime), 1, 1, 2)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (32, CAST(3046000 AS Decimal(18, 0)), CAST(N'2022-03-30T22:25:39.547' AS DateTime), N'3/2022', CAST(N'2022-04-02T00:00:00.000' AS DateTime), CAST(N'2022-04-01T22:37:13.653' AS DateTime), 1, 1, 2)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (33, CAST(3060000 AS Decimal(18, 0)), CAST(N'2022-04-29T22:26:54.827' AS DateTime), N'4/2022', CAST(N'2022-05-03T00:00:00.000' AS DateTime), CAST(N'2022-05-01T22:43:06.130' AS DateTime), 1, 1, 2)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (34, CAST(3150000 AS Decimal(18, 0)), CAST(N'2022-05-28T22:27:33.943' AS DateTime), N'5/2022', CAST(N'2022-06-02T00:00:00.000' AS DateTime), CAST(N'2022-06-01T22:43:15.170' AS DateTime), 1, 1, 2)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (35, CAST(3162000 AS Decimal(18, 0)), CAST(N'2022-06-29T22:28:57.917' AS DateTime), N'6/2022', CAST(N'2022-07-03T00:00:00.000' AS DateTime), CAST(N'2022-07-01T22:43:19.447' AS DateTime), 1, 1, 2)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (36, CAST(3105500 AS Decimal(18, 0)), CAST(N'2022-07-30T22:30:34.090' AS DateTime), N'7/2022', CAST(N'2022-08-04T00:00:00.000' AS DateTime), CAST(N'2022-08-01T22:43:27.990' AS DateTime), 1, 1, 2)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (37, CAST(3730500 AS Decimal(18, 0)), CAST(N'2022-06-28T22:33:22.400' AS DateTime), N'6/2022', CAST(N'2022-07-04T00:00:00.000' AS DateTime), CAST(N'2022-07-01T22:43:23.727' AS DateTime), 1, 1, 18)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (38, CAST(3151500 AS Decimal(18, 0)), CAST(N'2022-07-29T22:34:21.607' AS DateTime), N'7/2022', CAST(N'2022-08-03T00:00:00.000' AS DateTime), CAST(N'2022-08-01T22:43:59.000' AS DateTime), 1, 1, 18)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (39, CAST(4200000 AS Decimal(18, 0)), CAST(N'2022-07-28T23:11:04.677' AS DateTime), N'7/2022', CAST(N'2022-08-04T00:00:00.000' AS DateTime), CAST(N'2022-08-03T23:12:04.820' AS DateTime), 1, 1, 1)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (40, CAST(4075000 AS Decimal(18, 0)), CAST(N'2022-08-05T16:53:05.127' AS DateTime), N'8/2022', CAST(N'2022-08-05T00:00:00.000' AS DateTime), CAST(N'2022-08-05T16:54:20.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (41, CAST(4075000 AS Decimal(18, 0)), CAST(N'2022-08-05T21:52:23.030' AS DateTime), N'9/2022', CAST(N'2022-08-05T00:00:00.000' AS DateTime), CAST(N'2022-08-05T21:54:56.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (42, CAST(4075000 AS Decimal(18, 0)), CAST(N'2022-08-05T23:04:22.283' AS DateTime), N'10/2022', CAST(N'2022-08-05T00:00:00.000' AS DateTime), CAST(N'2022-08-05T23:06:49.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (43, CAST(4060000 AS Decimal(18, 0)), CAST(N'2022-08-05T23:32:50.940' AS DateTime), N'11/2022', CAST(N'2022-08-05T00:00:00.000' AS DateTime), CAST(N'2022-08-05T23:34:22.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (44, CAST(4070000 AS Decimal(18, 0)), CAST(N'2022-08-05T23:44:10.627' AS DateTime), N'12/2022', CAST(N'2022-08-05T00:00:00.000' AS DateTime), CAST(N'2022-08-05T23:44:58.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (45, CAST(3997000 AS Decimal(18, 0)), CAST(N'2022-08-05T23:55:25.333' AS DateTime), N'1/2023', CAST(N'2022-08-05T00:00:00.000' AS DateTime), CAST(N'2022-08-05T23:56:20.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (46, CAST(3973000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:47:08.403' AS DateTime), N'2/2023', CAST(N'2022-08-06T00:00:00.000' AS DateTime), CAST(N'2022-08-06T08:48:50.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (47, CAST(2820000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:35:05.337' AS DateTime), N'08/2022', CAST(N'2022-08-08T00:00:00.000' AS DateTime), CAST(N'2022-08-08T15:36:42.000' AS DateTime), 1, 1, 103)
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
SET IDENTITY_INSERT [dbo].[BillDetail] ON 

INSERT [dbo].[BillDetail] ([bill_detail_id], [consumeIDStart], [consumeIDEnd], [accountHostelOwnerID], [accountRenterID], [bill_id]) VALUES (16, 17, 43, 3, 4, 25)
INSERT [dbo].[BillDetail] ([bill_detail_id], [consumeIDStart], [consumeIDEnd], [accountHostelOwnerID], [accountRenterID], [bill_id]) VALUES (17, 48, 49, 3, 4, 26)
INSERT [dbo].[BillDetail] ([bill_detail_id], [consumeIDStart], [consumeIDEnd], [accountHostelOwnerID], [accountRenterID], [bill_id]) VALUES (18, 50, 50, 3, 4, 27)
INSERT [dbo].[BillDetail] ([bill_detail_id], [consumeIDStart], [consumeIDEnd], [accountHostelOwnerID], [accountRenterID], [bill_id]) VALUES (19, 51, 51, 3, 4, 28)
INSERT [dbo].[BillDetail] ([bill_detail_id], [consumeIDStart], [consumeIDEnd], [accountHostelOwnerID], [accountRenterID], [bill_id]) VALUES (20, 52, 54, 3, 4, 29)
INSERT [dbo].[BillDetail] ([bill_detail_id], [consumeIDStart], [consumeIDEnd], [accountHostelOwnerID], [accountRenterID], [bill_id]) VALUES (21, 55, 55, 3, 4, 30)
INSERT [dbo].[BillDetail] ([bill_detail_id], [consumeIDStart], [consumeIDEnd], [accountHostelOwnerID], [accountRenterID], [bill_id]) VALUES (22, 67, 71, 3, 12, 31)
INSERT [dbo].[BillDetail] ([bill_detail_id], [consumeIDStart], [consumeIDEnd], [accountHostelOwnerID], [accountRenterID], [bill_id]) VALUES (23, 75, 76, 3, 12, 32)
INSERT [dbo].[BillDetail] ([bill_detail_id], [consumeIDStart], [consumeIDEnd], [accountHostelOwnerID], [accountRenterID], [bill_id]) VALUES (24, 77, 78, 3, 12, 33)
INSERT [dbo].[BillDetail] ([bill_detail_id], [consumeIDStart], [consumeIDEnd], [accountHostelOwnerID], [accountRenterID], [bill_id]) VALUES (25, 79, 80, 3, 12, 34)
INSERT [dbo].[BillDetail] ([bill_detail_id], [consumeIDStart], [consumeIDEnd], [accountHostelOwnerID], [accountRenterID], [bill_id]) VALUES (26, 81, 82, 3, 12, 35)
INSERT [dbo].[BillDetail] ([bill_detail_id], [consumeIDStart], [consumeIDEnd], [accountHostelOwnerID], [accountRenterID], [bill_id]) VALUES (27, 83, 84, 3, 12, 36)
INSERT [dbo].[BillDetail] ([bill_detail_id], [consumeIDStart], [consumeIDEnd], [accountHostelOwnerID], [accountRenterID], [bill_id]) VALUES (28, 68, 72, 3, 13, 37)
INSERT [dbo].[BillDetail] ([bill_detail_id], [consumeIDStart], [consumeIDEnd], [accountHostelOwnerID], [accountRenterID], [bill_id]) VALUES (29, 86, 87, 3, 13, 38)
INSERT [dbo].[BillDetail] ([bill_detail_id], [consumeIDStart], [consumeIDEnd], [accountHostelOwnerID], [accountRenterID], [bill_id]) VALUES (30, 70, 74, 3, 4, 39)
INSERT [dbo].[BillDetail] ([bill_detail_id], [consumeIDStart], [consumeIDEnd], [accountHostelOwnerID], [accountRenterID], [bill_id]) VALUES (31, 89, 122, 3, 4, 40)
INSERT [dbo].[BillDetail] ([bill_detail_id], [consumeIDStart], [consumeIDEnd], [accountHostelOwnerID], [accountRenterID], [bill_id]) VALUES (32, 123, 142, 3, 4, 41)
INSERT [dbo].[BillDetail] ([bill_detail_id], [consumeIDStart], [consumeIDEnd], [accountHostelOwnerID], [accountRenterID], [bill_id]) VALUES (33, 143, 161, 3, 4, 42)
INSERT [dbo].[BillDetail] ([bill_detail_id], [consumeIDStart], [consumeIDEnd], [accountHostelOwnerID], [accountRenterID], [bill_id]) VALUES (34, 162, 163, 3, 4, 43)
INSERT [dbo].[BillDetail] ([bill_detail_id], [consumeIDStart], [consumeIDEnd], [accountHostelOwnerID], [accountRenterID], [bill_id]) VALUES (35, 164, 165, 3, 4, 44)
INSERT [dbo].[BillDetail] ([bill_detail_id], [consumeIDStart], [consumeIDEnd], [accountHostelOwnerID], [accountRenterID], [bill_id]) VALUES (36, 166, 167, 3, 4, 45)
INSERT [dbo].[BillDetail] ([bill_detail_id], [consumeIDStart], [consumeIDEnd], [accountHostelOwnerID], [accountRenterID], [bill_id]) VALUES (37, 168, 192, 3, 4, 46)
INSERT [dbo].[BillDetail] ([bill_detail_id], [consumeIDStart], [consumeIDEnd], [accountHostelOwnerID], [accountRenterID], [bill_id]) VALUES (38, 195, 216, 24, 25, 47)
SET IDENTITY_INSERT [dbo].[BillDetail] OFF
GO
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (16, 6)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (17, 6)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (18, 6)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (19, 6)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (20, 6)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (21, 6)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (22, 6)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (23, 6)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (24, 6)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (25, 6)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (26, 6)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (27, 6)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (28, 6)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (29, 6)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (30, 6)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (31, 6)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (32, 6)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (33, 6)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (34, 6)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (35, 6)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (36, 6)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (37, 6)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (16, 7)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (17, 7)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (18, 7)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (19, 7)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (20, 7)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (21, 7)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (22, 7)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (23, 7)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (24, 7)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (25, 7)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (26, 7)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (27, 7)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (28, 7)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (29, 7)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (30, 7)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (31, 7)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (32, 7)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (33, 7)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (34, 7)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (35, 7)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (36, 7)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (37, 7)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (16, 8)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (17, 8)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (18, 8)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (19, 8)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (20, 8)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (21, 8)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (22, 8)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (23, 8)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (24, 8)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (25, 8)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (26, 8)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (27, 8)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (28, 8)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (29, 8)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (30, 8)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (31, 8)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (32, 8)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (33, 8)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (34, 8)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (35, 8)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (36, 8)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (37, 8)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (16, 9)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (17, 9)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (18, 9)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (19, 9)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (20, 9)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (21, 9)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (22, 9)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (23, 9)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (24, 9)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (25, 9)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (26, 9)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (27, 9)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (28, 9)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (29, 9)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (30, 9)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (31, 9)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (32, 9)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (33, 9)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (34, 9)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (35, 9)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (36, 9)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (37, 9)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (16, 10)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (17, 10)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (18, 10)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (19, 10)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (20, 10)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (21, 10)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (22, 10)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (23, 10)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (24, 10)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (25, 10)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (26, 10)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (27, 10)
GO
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (28, 10)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (29, 10)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (30, 10)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (31, 10)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (32, 10)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (33, 10)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (34, 10)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (35, 10)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (36, 10)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (37, 10)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (38, 162)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (38, 163)
INSERT [dbo].[BillService] ([bill_detail_id], [hostel_service_id]) VALUES (38, 164)
GO
SET IDENTITY_INSERT [dbo].[Consumes] ON 

INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (14, 0, 0, CAST(N'2022-06-14T00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (17, 20, 20, CAST(N'2022-06-17T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (43, 50, 25, CAST(N'2022-06-20T14:13:53.857' AS DateTime), 1, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (48, 50, 25, CAST(N'2022-06-20T20:09:13.750' AS DateTime), 1, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (49, 100, 50, CAST(N'2022-06-20T20:10:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (50, 100, 50, CAST(N'2022-06-20T20:16:02.763' AS DateTime), 1, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (51, 100, 50, CAST(N'2022-06-20T20:38:44.847' AS DateTime), 1, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (52, 100, 50, CAST(N'2022-06-21T07:44:16.550' AS DateTime), 1, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (53, 300, 70, CAST(N'2022-06-22T21:25:38.257' AS DateTime), 1, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (54, 350, 75, CAST(N'2022-06-22T21:25:44.867' AS DateTime), 1, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (55, 350, 75, CAST(N'2022-06-22T21:26:56.950' AS DateTime), 1, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (62, 0, 0, CAST(N'2022-07-15T10:35:47.043' AS DateTime), 0, 14)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (63, 0, 0, CAST(N'2022-07-15T10:35:47.047' AS DateTime), 0, 15)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (64, 0, 0, CAST(N'2022-07-15T10:35:47.077' AS DateTime), 0, 16)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (65, 0, 0, CAST(N'2022-07-15T10:35:47.080' AS DateTime), 0, 17)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (66, 2, 1, CAST(N'2022-07-15T10:37:54.730' AS DateTime), 1, 2)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (67, 2, 2, CAST(N'2022-07-15T10:44:56.947' AS DateTime), 1, 2)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (68, 0, 0, CAST(N'2022-07-15T16:35:28.900' AS DateTime), 1, 18)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (69, 123, 12, CAST(N'2022-07-22T16:02:57.493' AS DateTime), 1, 2)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (70, 350, 75, CAST(N'2022-07-24T16:21:58.993' AS DateTime), 1, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (71, 124, 15, CAST(N'2022-07-29T16:48:22.153' AS DateTime), 1, 2)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (72, 123, 50, CAST(N'2022-08-03T09:08:49.793' AS DateTime), 1, 18)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (73, 10, 5, CAST(N'2022-08-03T10:06:54.707' AS DateTime), 0, 14)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (74, 450, 80, CAST(N'2022-08-04T21:54:59.820' AS DateTime), 1, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (75, 124, 15, CAST(N'2022-08-04T22:23:47.337' AS DateTime), 1, 2)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (76, 180, 20, CAST(N'2022-08-04T22:25:20.373' AS DateTime), 1, 2)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (77, 180, 20, CAST(N'2022-08-04T22:25:39.553' AS DateTime), 1, 2)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (78, 240, 25, CAST(N'2022-08-04T22:25:58.370' AS DateTime), 1, 2)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (79, 240, 25, CAST(N'2022-08-04T22:26:54.837' AS DateTime), 1, 2)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (80, 320, 32, CAST(N'2022-08-04T22:27:23.653' AS DateTime), 1, 2)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (81, 320, 32, CAST(N'2022-08-04T22:27:33.950' AS DateTime), 1, 2)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (82, 412, 36, CAST(N'2022-08-04T22:28:04.920' AS DateTime), 1, 2)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (83, 412, 36, CAST(N'2022-08-04T22:28:57.923' AS DateTime), 1, 2)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (84, 485, 41, CAST(N'2022-08-04T22:30:12.310' AS DateTime), 1, 2)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (85, 485, 41, CAST(N'2022-08-04T22:30:34.100' AS DateTime), 0, 2)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (86, 123, 50, CAST(N'2022-08-04T22:33:22.410' AS DateTime), 1, 18)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (87, 192, 61, CAST(N'2022-08-04T22:34:17.717' AS DateTime), 1, 18)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (88, 192, 61, CAST(N'2022-08-04T22:34:21.613' AS DateTime), 0, 18)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (89, 450, 80, CAST(N'2022-08-04T23:11:04.713' AS DateTime), 1, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (90, 0, 0, CAST(N'2022-08-05T16:26:51.040' AS DateTime), 0, 19)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (91, 0, 0, CAST(N'2022-08-05T16:26:51.070' AS DateTime), 0, 20)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (92, 0, 0, CAST(N'2022-08-05T16:26:51.093' AS DateTime), 0, 21)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (93, 0, 0, CAST(N'2022-08-05T16:26:51.120' AS DateTime), 0, 22)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (94, 0, 0, CAST(N'2022-08-05T16:26:51.143' AS DateTime), 0, 23)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (95, 0, 0, CAST(N'2022-08-05T16:26:51.220' AS DateTime), 0, 24)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (96, 0, 0, CAST(N'2022-08-05T16:26:51.300' AS DateTime), 0, 25)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (97, 0, 0, CAST(N'2022-08-05T16:26:51.380' AS DateTime), 0, 26)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (98, 0, 0, CAST(N'2022-08-05T16:26:51.407' AS DateTime), 0, 27)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (99, 0, 0, CAST(N'2022-08-05T16:26:51.487' AS DateTime), 0, 28)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (100, 0, 0, CAST(N'2022-08-05T16:27:12.443' AS DateTime), 0, 29)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (101, 0, 0, CAST(N'2022-08-05T16:32:34.863' AS DateTime), 0, 30)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (102, 0, 0, CAST(N'2022-08-05T16:32:34.880' AS DateTime), 0, 31)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (103, 0, 0, CAST(N'2022-08-05T16:32:34.890' AS DateTime), 0, 32)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (104, 0, 0, CAST(N'2022-08-05T16:32:34.907' AS DateTime), 0, 33)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (105, 0, 0, CAST(N'2022-08-05T16:48:15.083' AS DateTime), 0, 34)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (106, 0, 0, CAST(N'2022-08-05T16:48:49.020' AS DateTime), 0, 35)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (107, 0, 0, CAST(N'2022-08-05T16:48:49.033' AS DateTime), 0, 36)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (108, 0, 0, CAST(N'2022-08-05T16:48:49.047' AS DateTime), 0, 37)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (109, 0, 0, CAST(N'2022-08-05T16:48:49.060' AS DateTime), 0, 38)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (110, 0, 0, CAST(N'2022-08-05T16:48:49.070' AS DateTime), 0, 39)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (111, 0, 0, CAST(N'2022-08-05T16:49:01.997' AS DateTime), 0, 40)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (112, 0, 0, CAST(N'2022-08-05T16:49:02.020' AS DateTime), 0, 41)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (113, 0, 0, CAST(N'2022-08-05T16:49:02.047' AS DateTime), 0, 42)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (114, 0, 0, CAST(N'2022-08-05T16:49:02.070' AS DateTime), 0, 43)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (115, 0, 0, CAST(N'2022-08-05T16:49:02.090' AS DateTime), 0, 44)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (116, 0, 0, CAST(N'2022-08-05T16:49:02.167' AS DateTime), 0, 45)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (117, 0, 0, CAST(N'2022-08-05T16:49:02.243' AS DateTime), 0, 46)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (118, 0, 0, CAST(N'2022-08-05T16:49:02.267' AS DateTime), 0, 47)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (119, 0, 0, CAST(N'2022-08-05T16:49:02.340' AS DateTime), 0, 48)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (120, 0, 0, CAST(N'2022-08-05T16:49:02.417' AS DateTime), 0, 49)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (121, 20, 10, CAST(N'2022-08-05T16:50:09.090' AS DateTime), 0, 34)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (122, 500, 90, CAST(N'2022-08-05T16:52:57.860' AS DateTime), 1, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (123, 500, 90, CAST(N'2022-08-05T16:53:05.147' AS DateTime), 1, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (124, 535, 44, CAST(N'2022-08-05T17:03:08.383' AS DateTime), 0, 2)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (125, 0, 0, CAST(N'2022-08-05T21:43:30.140' AS DateTime), 0, 50)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (126, 0, 0, CAST(N'2022-08-05T21:43:47.370' AS DateTime), 0, 51)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (127, 0, 0, CAST(N'2022-08-05T21:43:47.383' AS DateTime), 0, 52)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (128, 0, 0, CAST(N'2022-08-05T21:43:47.400' AS DateTime), 0, 53)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (129, 0, 0, CAST(N'2022-08-05T21:43:47.413' AS DateTime), 0, 54)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (130, 0, 0, CAST(N'2022-08-05T21:43:47.423' AS DateTime), 0, 55)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (131, 0, 0, CAST(N'2022-08-05T21:44:10.980' AS DateTime), 0, 56)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (132, 0, 0, CAST(N'2022-08-05T21:44:11.007' AS DateTime), 0, 57)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (133, 0, 0, CAST(N'2022-08-05T21:44:11.030' AS DateTime), 0, 58)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (134, 0, 0, CAST(N'2022-08-05T21:44:11.057' AS DateTime), 0, 59)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (135, 0, 0, CAST(N'2022-08-05T21:44:11.080' AS DateTime), 0, 60)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (136, 0, 0, CAST(N'2022-08-05T21:44:11.167' AS DateTime), 0, 61)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (137, 0, 0, CAST(N'2022-08-05T21:44:11.243' AS DateTime), 0, 62)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (138, 0, 0, CAST(N'2022-08-05T21:44:11.270' AS DateTime), 0, 63)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (139, 0, 0, CAST(N'2022-08-05T21:44:11.357' AS DateTime), 0, 64)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (140, 0, 0, CAST(N'2022-08-05T21:44:11.433' AS DateTime), 0, 65)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (141, 20, 10, CAST(N'2022-08-05T21:45:31.847' AS DateTime), 0, 50)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (142, 550, 100, CAST(N'2022-08-05T21:51:52.990' AS DateTime), 1, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (143, 550, 100, CAST(N'2022-08-05T21:52:23.040' AS DateTime), 1, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (144, 0, 0, CAST(N'2022-08-05T22:57:22.470' AS DateTime), 0, 66)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (145, 0, 0, CAST(N'2022-08-05T22:57:41.233' AS DateTime), 0, 67)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (146, 0, 0, CAST(N'2022-08-05T22:57:41.247' AS DateTime), 0, 68)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (147, 0, 0, CAST(N'2022-08-05T22:57:41.260' AS DateTime), 0, 69)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (148, 0, 0, CAST(N'2022-08-05T22:57:41.277' AS DateTime), 0, 70)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (149, 0, 0, CAST(N'2022-08-05T22:57:41.290' AS DateTime), 0, 71)
GO
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (150, 0, 0, CAST(N'2022-08-05T22:58:06.460' AS DateTime), 0, 72)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (151, 0, 0, CAST(N'2022-08-05T22:58:06.487' AS DateTime), 0, 73)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (152, 0, 0, CAST(N'2022-08-05T22:58:06.513' AS DateTime), 0, 74)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (153, 0, 0, CAST(N'2022-08-05T22:58:06.540' AS DateTime), 0, 75)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (154, 0, 0, CAST(N'2022-08-05T22:58:06.563' AS DateTime), 0, 76)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (155, 0, 0, CAST(N'2022-08-05T22:58:06.640' AS DateTime), 0, 77)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (156, 0, 0, CAST(N'2022-08-05T22:58:06.720' AS DateTime), 0, 78)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (157, 0, 0, CAST(N'2022-08-05T22:58:06.750' AS DateTime), 0, 79)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (158, 0, 0, CAST(N'2022-08-05T22:58:06.827' AS DateTime), 0, 80)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (159, 0, 0, CAST(N'2022-08-05T22:58:06.907' AS DateTime), 0, 81)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (160, 10, 20, CAST(N'2022-08-05T22:59:44.727' AS DateTime), 0, 66)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (161, 600, 110, CAST(N'2022-08-05T23:04:12.637' AS DateTime), 1, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (162, 600, 110, CAST(N'2022-08-05T23:04:22.293' AS DateTime), 1, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (163, 660, 115, CAST(N'2022-08-05T23:32:46.470' AS DateTime), 1, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (164, 660, 115, CAST(N'2022-08-05T23:32:50.953' AS DateTime), 1, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (165, 720, 121, CAST(N'2022-08-05T23:43:31.383' AS DateTime), 1, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (166, 720, 121, CAST(N'2022-08-05T23:44:10.640' AS DateTime), 1, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (167, 762, 126, CAST(N'2022-08-05T23:55:15.787' AS DateTime), 1, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (168, 762, 126, CAST(N'2022-08-05T23:55:25.360' AS DateTime), 1, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (169, 0, 0, CAST(N'2022-08-06T08:35:04.543' AS DateTime), 0, 82)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (170, 0, 0, CAST(N'2022-08-06T08:35:18.910' AS DateTime), 0, 83)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (171, 0, 0, CAST(N'2022-08-06T08:35:18.923' AS DateTime), 0, 84)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (172, 0, 0, CAST(N'2022-08-06T08:35:18.940' AS DateTime), 0, 85)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (173, 0, 0, CAST(N'2022-08-06T08:35:18.953' AS DateTime), 0, 86)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (174, 0, 0, CAST(N'2022-08-06T08:35:18.967' AS DateTime), 0, 87)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (175, 0, 0, CAST(N'2022-08-06T08:35:18.980' AS DateTime), 0, 88)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (176, 0, 0, CAST(N'2022-08-06T08:35:18.993' AS DateTime), 0, 89)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (177, 0, 0, CAST(N'2022-08-06T08:35:19.010' AS DateTime), 0, 90)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (178, 0, 0, CAST(N'2022-08-06T08:35:19.023' AS DateTime), 0, 91)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (179, 0, 0, CAST(N'2022-08-06T08:35:19.040' AS DateTime), 0, 92)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (180, 0, 0, CAST(N'2022-08-06T08:35:35.963' AS DateTime), 0, 93)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (181, 0, 0, CAST(N'2022-08-06T08:35:35.990' AS DateTime), 0, 94)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (182, 0, 0, CAST(N'2022-08-06T08:35:36.017' AS DateTime), 0, 95)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (183, 0, 0, CAST(N'2022-08-06T08:35:36.047' AS DateTime), 0, 96)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (184, 0, 0, CAST(N'2022-08-06T08:35:36.070' AS DateTime), 0, 97)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (185, 0, 0, CAST(N'2022-08-06T08:35:36.097' AS DateTime), 0, 98)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (186, 0, 0, CAST(N'2022-08-06T08:35:36.120' AS DateTime), 0, 99)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (187, 0, 0, CAST(N'2022-08-06T08:35:36.147' AS DateTime), 0, 100)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (188, 0, 0, CAST(N'2022-08-06T08:35:36.173' AS DateTime), 0, 101)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (189, 0, 0, CAST(N'2022-08-06T08:35:36.200' AS DateTime), 0, 102)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (190, 20, 10, CAST(N'2022-08-06T08:37:06.010' AS DateTime), 0, 82)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (191, 10, 20, CAST(N'2022-08-06T08:41:59.773' AS DateTime), 0, 83)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (192, 800, 130, CAST(N'2022-08-06T08:47:00.397' AS DateTime), 1, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (193, 800, 130, CAST(N'2022-08-06T08:47:08.427' AS DateTime), 0, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (194, 850, 140, CAST(N'2022-08-06T08:50:12.447' AS DateTime), 0, 1)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (195, 0, 0, CAST(N'2022-08-08T15:30:08.270' AS DateTime), 1, 103)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (196, 0, 0, CAST(N'2022-08-08T15:30:28.197' AS DateTime), 0, 104)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (197, 0, 0, CAST(N'2022-08-08T15:30:28.210' AS DateTime), 0, 105)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (198, 0, 0, CAST(N'2022-08-08T15:30:28.223' AS DateTime), 0, 106)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (199, 0, 0, CAST(N'2022-08-08T15:30:28.237' AS DateTime), 0, 107)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (200, 0, 0, CAST(N'2022-08-08T15:30:28.250' AS DateTime), 0, 108)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (201, 0, 0, CAST(N'2022-08-08T15:30:28.263' AS DateTime), 0, 109)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (202, 0, 0, CAST(N'2022-08-08T15:30:28.273' AS DateTime), 0, 110)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (203, 0, 0, CAST(N'2022-08-08T15:30:28.340' AS DateTime), 0, 111)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (204, 0, 0, CAST(N'2022-08-08T15:30:28.353' AS DateTime), 0, 112)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (205, 0, 0, CAST(N'2022-08-08T15:30:28.367' AS DateTime), 0, 113)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (206, 0, 0, CAST(N'2022-08-08T15:30:52.710' AS DateTime), 0, 114)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (207, 0, 0, CAST(N'2022-08-08T15:30:52.737' AS DateTime), 0, 115)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (208, 0, 0, CAST(N'2022-08-08T15:30:52.760' AS DateTime), 0, 116)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (209, 0, 0, CAST(N'2022-08-08T15:30:52.790' AS DateTime), 0, 117)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (210, 0, 0, CAST(N'2022-08-08T15:30:52.817' AS DateTime), 0, 118)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (211, 0, 0, CAST(N'2022-08-08T15:30:52.893' AS DateTime), 0, 119)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (212, 0, 0, CAST(N'2022-08-08T15:30:52.973' AS DateTime), 0, 120)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (213, 0, 0, CAST(N'2022-08-08T15:30:53.000' AS DateTime), 0, 121)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (214, 0, 0, CAST(N'2022-08-08T15:30:53.080' AS DateTime), 0, 122)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (215, 0, 0, CAST(N'2022-08-08T15:30:53.160' AS DateTime), 0, 123)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (216, 20, 10, CAST(N'2022-08-08T15:32:25.310' AS DateTime), 1, 103)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (217, 20, 10, CAST(N'2022-08-08T15:35:05.357' AS DateTime), 0, 103)
INSERT [dbo].[Consumes] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (218, 900, 145, CAST(N'2022-08-08T15:46:48.180' AS DateTime), 0, 1)
SET IDENTITY_INSERT [dbo].[Consumes] OFF
GO
SET IDENTITY_INSERT [dbo].[Contracts] ON 

INSERT [dbo].[Contracts] ([contract_id], [room_id], [price], [start_date], [expiration], [deposit], [hostel_owner_id], [renter_id], [status], [cancelDate]) VALUES (1, 1, CAST(3500000 AS Decimal(18, 0)), CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2022-12-31T00:00:00.000' AS DateTime), CAST(3500000 AS Decimal(18, 0)), 3, 4, 1, NULL)
INSERT [dbo].[Contracts] ([contract_id], [room_id], [price], [start_date], [expiration], [deposit], [hostel_owner_id], [renter_id], [status], [cancelDate]) VALUES (2, 2, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 3, 8, 0, CAST(N'2022-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Contracts] ([contract_id], [room_id], [price], [start_date], [expiration], [deposit], [hostel_owner_id], [renter_id], [status], [cancelDate]) VALUES (3, 2, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 3, 9, 0, CAST(N'2022-01-10T16:03:26.640' AS DateTime))
INSERT [dbo].[Contracts] ([contract_id], [room_id], [price], [start_date], [expiration], [deposit], [hostel_owner_id], [renter_id], [status], [cancelDate]) VALUES (4, 2, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 3, 11, 0, CAST(N'2022-01-15T16:45:57.050' AS DateTime))
INSERT [dbo].[Contracts] ([contract_id], [room_id], [price], [start_date], [expiration], [deposit], [hostel_owner_id], [renter_id], [status], [cancelDate]) VALUES (5, 2, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-02-01T00:00:00.000' AS DateTime), CAST(N'2023-02-21T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 3, 12, 1, NULL)
INSERT [dbo].[Contracts] ([contract_id], [room_id], [price], [start_date], [expiration], [deposit], [hostel_owner_id], [renter_id], [status], [cancelDate]) VALUES (6, 18, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 3, 13, 0, CAST(N'2022-08-08T15:49:05.150' AS DateTime))
INSERT [dbo].[Contracts] ([contract_id], [room_id], [price], [start_date], [expiration], [deposit], [hostel_owner_id], [renter_id], [status], [cancelDate]) VALUES (7, 14, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-01-08T00:00:00.000' AS DateTime), CAST(N'2023-02-08T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 3, 14, 1, NULL)
INSERT [dbo].[Contracts] ([contract_id], [room_id], [price], [start_date], [expiration], [deposit], [hostel_owner_id], [renter_id], [status], [cancelDate]) VALUES (8, 34, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-08-05T00:00:00.000' AS DateTime), CAST(N'2023-08-05T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 15, 16, 1, NULL)
INSERT [dbo].[Contracts] ([contract_id], [room_id], [price], [start_date], [expiration], [deposit], [hostel_owner_id], [renter_id], [status], [cancelDate]) VALUES (9, 50, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-08-05T00:00:00.000' AS DateTime), CAST(N'2023-08-05T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 17, 18, 1, NULL)
INSERT [dbo].[Contracts] ([contract_id], [room_id], [price], [start_date], [expiration], [deposit], [hostel_owner_id], [renter_id], [status], [cancelDate]) VALUES (10, 66, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-08-05T00:00:00.000' AS DateTime), CAST(N'2023-08-05T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 19, 20, 1, NULL)
INSERT [dbo].[Contracts] ([contract_id], [room_id], [price], [start_date], [expiration], [deposit], [hostel_owner_id], [renter_id], [status], [cancelDate]) VALUES (11, 82, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-08-05T00:00:00.000' AS DateTime), CAST(N'2023-08-05T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 21, 22, 1, NULL)
INSERT [dbo].[Contracts] ([contract_id], [room_id], [price], [start_date], [expiration], [deposit], [hostel_owner_id], [renter_id], [status], [cancelDate]) VALUES (12, 83, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-08-06T00:00:00.000' AS DateTime), CAST(N'2023-08-07T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 21, 23, 1, NULL)
INSERT [dbo].[Contracts] ([contract_id], [room_id], [price], [start_date], [expiration], [deposit], [hostel_owner_id], [renter_id], [status], [cancelDate]) VALUES (13, 103, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-08-05T00:00:00.000' AS DateTime), CAST(N'2023-08-05T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 24, 25, 1, NULL)
SET IDENTITY_INSERT [dbo].[Contracts] OFF
GO
SET IDENTITY_INSERT [dbo].[Hostels] ON 

INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (1, 3, N'Nova Land', N'123 Lê Văn Việt', N'26833-Phường Long Thạnh Mỹ', N'769-Thành phố Thủ Đức', N'79-Thành phố Hồ Chí Minh')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (3, 3, N'Aqua Finix', N'191 Nguyễn Xiển', N'26833-Phường Long Thạnh Mỹ', N'769-Thành phố Thủ Đức', N'79-Thành phố Hồ Chí Minh')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (4, 3, N'Dream City', N'199A/211 đường Nguyễn Tri Phương', N'622-Phường Xuân Phương', N'19-Quận Nam Từ Liêm', N'1-Thành phố Hà Nội')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (5, 10, N'Karaoke Home', N'111 Ngô Viết Tuân', N'26668-Xã Tam Phước', N'752-Huyện Long Điền', N'77-Tỉnh Bà Rịa - Vũng Tàu')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (6, 10, N'Foxenix Home', N'999 Lý Thái Tổ', N'23482-Xã Đắk Kôi', N'614-Huyện Kon Rẫy', N'62-Tỉnh Kon Tum')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (7, 10, N'Gukong Home', N'999 Lương Định Của', N'5101-Xã Thu Phong', N'154-Huyện Cao Phong', N'17-Tỉnh Hoà Bình')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (8, 15, N'Meta Verse XXX', N'Đường 30/4, khu phố 2, phường Mỹ Phước', N'3508-Xã Ma Quai', N'108-Huyện Sìn Hồ', N'12-Tỉnh Lai Châu')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (9, 15, N'Royal Home', N'126 Nguyễn Xiển', N'26833-Phường Long Thạnh Mỹ', N'769-Thành phố Thủ Đức', N'79-Thành phố Hồ Chí Minh')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (10, 15, N'Arrakis DOM', N'124 Lê Văn Việt', N'26470-Xã Phước Thiền', N'742-Huyện Nhơn Trạch', N'75-Tỉnh Đồng Nai')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (11, 15, N'Final Fantasy', N'98 Hoàng Hữu Nam', N'4138-Xã Cò Nòi', N'125-Huyện Mai Sơn', N'14-Tỉnh Sơn La')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (12, 17, N'Meta Verse', N'Đường 30/4, khu phố 2, phường Mỹ Phước', N'1894-Xã Phúc Lộc', N'61-Huyện Ba Bể', N'6-Tỉnh Bắc Kạn')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (13, 17, N'Royal Home', N'126 Nguyễn Xiển', N'26833-Phường Long Thạnh Mỹ', N'769-Thành phố Thủ Đức', N'79-Thành phố Hồ Chí Minh')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (14, 17, N'Arrakis DOM', N'124 Lê Văn Việt', N'26470-Xã Phước Thiền', N'742-Huyện Nhơn Trạch', N'75-Tỉnh Đồng Nai')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (15, 17, N'Final Fantasy', N'98 Hoàng Hữu Nam', N'4138-Xã Cò Nòi', N'125-Huyện Mai Sơn', N'14-Tỉnh Sơn La')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (16, 19, N'Meta Verse', N'Đường 30/4, khu phố 2, phường Mỹ Phước', N'1462-Xã Xuân Nội', N'47-Huyện Trùng Khánh', N'4-Tỉnh Cao Bằng')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (17, 19, N'Royal Home', N'126 Nguyễn Xiển', N'26833-Phường Long Thạnh Mỹ', N'769-Thành phố Thủ Đức', N'79-Thành phố Hồ Chí Minh')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (18, 19, N'Arrakis DOM', N'124 Lê Văn Việt', N'26470-Xã Phước Thiền', N'742-Huyện Nhơn Trạch', N'75-Tỉnh Đồng Nai')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (19, 19, N'Final Fantasy', N'98 Hoàng Hữu Nam', N'4138-Xã Cò Nòi', N'125-Huyện Mai Sơn', N'14-Tỉnh Sơn La')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (20, 21, N'Meta Verse', N'Đường 30/4, khu phố 2, phường Mỹ Phước', N'8914-Xã Đạo Trù', N'248-Huyện Tam Đảo', N'26-Tỉnh Vĩnh Phúc')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (21, 21, N'Royal Home', N'126 Nguyễn Xiển', N'26833-Phường Long Thạnh Mỹ', N'769-Thành phố Thủ Đức', N'79-Thành phố Hồ Chí Minh')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (22, 21, N'Royal Home', N'126 Nguyễn Xiển', N'26833-Phường Long Thạnh Mỹ', N'769-Thành phố Thủ Đức', N'79-Thành phố Hồ Chí Minh')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (23, 21, N'Arrakis DOM', N'124 Lê Văn Việt', N'26470-Xã Phước Thiền', N'742-Huyện Nhơn Trạch', N'75-Tỉnh Đồng Nai')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (24, 21, N'Arrakis DOM', N'124 Lê Văn Việt', N'26470-Xã Phước Thiền', N'742-Huyện Nhơn Trạch', N'75-Tỉnh Đồng Nai')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (25, 21, N'Final Fantasy', N'98 Hoàng Hữu Nam', N'4138-Xã Cò Nòi', N'125-Huyện Mai Sơn', N'14-Tỉnh Sơn La')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (26, 21, N'Final Fantasy', N'98 Hoàng Hữu Nam', N'4138-Xã Cò Nòi', N'125-Huyện Mai Sơn', N'14-Tỉnh Sơn La')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (27, 24, N'Meta Verse', N'Đường 30/4, khu phố 2, phường Mỹ Phước', N'190-Phường Ô Chợ Dừa', N'6-Quận Đống Đa', N'1-Thành phố Hà Nội')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (28, 24, N'Royal Home', N'126 Nguyễn Xiển', N'26833-Phường Long Thạnh Mỹ', N'769-Thành phố Thủ Đức', N'79-Thành phố Hồ Chí Minh')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (29, 24, N'Arrakis DOM', N'124 Lê Văn Việt', N'26470-Xã Phước Thiền', N'742-Huyện Nhơn Trạch', N'75-Tỉnh Đồng Nai')
INSERT [dbo].[Hostels] ([hostel_id], [owner_account_id], [name], [address], [ward], [district], [city]) VALUES (30, 24, N'Final Fantasy', N'98 Hoàng Hữu Nam', N'4138-Xã Cò Nòi', N'125-Huyện Mai Sơn', N'14-Tỉnh Sơn La')
SET IDENTITY_INSERT [dbo].[Hostels] OFF
GO
SET IDENTITY_INSERT [dbo].[HostelService] ON 

INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (6, 1, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-05-05T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (7, 1, 2, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-05-05T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (8, 1, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-05-05T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (9, 1, 4, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-05-05T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (10, 1, 6, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-05-05T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (17, 3, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-07-15T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (18, 3, 2, CAST(15000 AS Decimal(18, 0)), CAST(N'2022-07-15T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (19, 3, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-07-15T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (20, 3, 4, CAST(30000 AS Decimal(18, 0)), CAST(N'2022-07-15T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (21, 3, 7, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-07-15T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (22, 3, 6, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-07-15T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (23, 4, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-05-15T14:58:36.367' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (24, 4, 2, CAST(15000 AS Decimal(18, 0)), CAST(N'2022-05-15T14:58:36.367' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (25, 3, 1, CAST(3000 AS Decimal(18, 0)), CAST(N'2022-07-15T15:50:29.090' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (26, 3, 2, CAST(12000 AS Decimal(18, 0)), CAST(N'2022-07-15T15:50:29.090' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (27, 3, 3, CAST(90000 AS Decimal(18, 0)), CAST(N'2022-07-15T15:50:29.090' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (28, 3, 4, CAST(40000 AS Decimal(18, 0)), CAST(N'2022-07-15T15:50:29.090' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (29, 3, 7, CAST(5000 AS Decimal(18, 0)), CAST(N'2022-07-15T15:50:29.090' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (30, 3, 6, CAST(15000 AS Decimal(18, 0)), CAST(N'2022-07-15T15:50:29.090' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (31, 4, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-07-15T15:56:51.977' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (32, 4, 2, CAST(15000 AS Decimal(18, 0)), CAST(N'2022-07-15T15:56:51.980' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (33, 4, 3, CAST(90000 AS Decimal(18, 0)), CAST(N'2022-07-15T15:56:51.980' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (34, 5, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-02T22:54:54.350' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (35, 5, 2, CAST(15000 AS Decimal(18, 0)), CAST(N'2022-08-02T22:54:54.353' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (36, 6, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-05T16:25:58.150' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (37, 6, 2, CAST(15000 AS Decimal(18, 0)), CAST(N'2022-08-05T16:25:58.150' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (38, 6, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-05T16:25:58.150' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (39, 6, 4, CAST(20000 AS Decimal(18, 0)), CAST(N'2022-08-05T16:25:58.150' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (40, 6, 7, CAST(30000 AS Decimal(18, 0)), CAST(N'2022-08-05T16:25:58.150' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (41, 6, 6, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-08-05T16:25:58.153' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (42, 7, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-05T16:28:13.437' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (43, 7, 2, CAST(15000 AS Decimal(18, 0)), CAST(N'2022-08-05T16:28:13.437' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (44, 8, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-05T16:47:39.093' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (45, 8, 2, CAST(15000 AS Decimal(18, 0)), CAST(N'2022-08-05T16:47:39.093' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (46, 8, 3, CAST(12000 AS Decimal(18, 0)), CAST(N'2022-08-05T16:47:39.093' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (47, 9, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-05T16:48:36.193' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (48, 9, 2, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-08-05T16:48:36.193' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (49, 9, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-05T16:48:36.193' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (50, 9, 4, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-08-05T16:48:36.193' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (51, 9, 7, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-05T16:48:36.193' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (52, 9, 6, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-08-05T16:48:36.193' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (53, 10, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-05T16:48:36.207' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (54, 10, 2, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-08-05T16:48:36.207' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (55, 10, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-05T16:48:36.207' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (56, 10, 4, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-08-05T16:48:36.207' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (57, 10, 7, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-05T16:48:36.207' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (58, 10, 6, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-08-05T16:48:36.210' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (59, 11, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-05T16:48:36.220' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (60, 11, 2, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-08-05T16:48:36.220' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (61, 11, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-05T16:48:36.220' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (62, 11, 4, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-08-05T16:48:36.220' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (63, 11, 7, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-05T16:48:36.220' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (64, 11, 6, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-08-05T16:48:36.223' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (65, 3, 1, CAST(3000 AS Decimal(18, 0)), CAST(N'2022-08-05T17:01:05.163' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (66, 3, 2, CAST(12000 AS Decimal(18, 0)), CAST(N'2022-08-05T17:01:05.163' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (67, 3, 3, CAST(90000 AS Decimal(18, 0)), CAST(N'2022-08-05T17:01:05.163' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (68, 3, 4, CAST(40000 AS Decimal(18, 0)), CAST(N'2022-08-05T17:01:05.163' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (69, 3, 7, CAST(5000 AS Decimal(18, 0)), CAST(N'2022-08-05T17:01:05.163' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (70, 3, 6, CAST(15000 AS Decimal(18, 0)), CAST(N'2022-08-05T17:01:05.163' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (71, 3, 8, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-08-05T17:01:05.163' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (72, 3, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-05T17:01:16.980' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (73, 3, 2, CAST(12000 AS Decimal(18, 0)), CAST(N'2022-08-05T17:01:16.980' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (74, 3, 3, CAST(90000 AS Decimal(18, 0)), CAST(N'2022-08-05T17:01:16.980' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (75, 3, 4, CAST(40000 AS Decimal(18, 0)), CAST(N'2022-08-05T17:01:16.980' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (76, 3, 7, CAST(5000 AS Decimal(18, 0)), CAST(N'2022-08-05T17:01:16.983' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (77, 3, 6, CAST(15000 AS Decimal(18, 0)), CAST(N'2022-08-05T17:01:16.983' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (78, 3, 8, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-08-05T17:01:16.983' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (79, 12, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-05T21:41:28.753' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (80, 12, 2, CAST(15000 AS Decimal(18, 0)), CAST(N'2022-08-05T21:41:28.753' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (81, 12, 3, CAST(5000 AS Decimal(18, 0)), CAST(N'2022-08-05T21:41:28.753' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (82, 13, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-05T21:42:26.333' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (83, 13, 2, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-08-05T21:42:26.333' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (84, 13, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-05T21:42:26.333' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (85, 13, 4, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-08-05T21:42:26.333' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (86, 13, 7, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-05T21:42:26.333' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (87, 13, 6, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-08-05T21:42:26.337' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (88, 14, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-05T21:42:26.350' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (89, 14, 2, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-08-05T21:42:26.350' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (90, 14, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-05T21:42:26.350' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (91, 14, 4, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-08-05T21:42:26.350' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (92, 14, 7, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-05T21:42:26.353' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (93, 14, 6, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-08-05T21:42:26.353' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (94, 15, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-05T21:42:26.370' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (95, 15, 2, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-08-05T21:42:26.370' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (96, 15, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-05T21:42:26.370' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (97, 15, 4, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-08-05T21:42:26.370' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (98, 15, 7, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-05T21:42:26.370' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (99, 15, 6, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-08-05T21:42:26.370' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (100, 16, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-05T22:55:52.720' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (101, 16, 2, CAST(15000 AS Decimal(18, 0)), CAST(N'2022-08-05T22:55:52.720' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (102, 16, 3, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-08-05T22:55:52.720' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (103, 17, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-05T22:56:21.673' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (104, 17, 2, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-08-05T22:56:21.677' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (105, 17, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-05T22:56:21.677' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (106, 17, 4, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-08-05T22:56:21.677' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (107, 17, 7, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-05T22:56:21.677' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (108, 17, 6, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-08-05T22:56:21.677' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (109, 18, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-05T22:56:21.693' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (110, 18, 2, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-08-05T22:56:21.693' AS DateTime), 1)
GO
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (111, 18, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-05T22:56:21.693' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (112, 18, 4, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-08-05T22:56:21.693' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (113, 18, 7, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-05T22:56:21.693' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (114, 18, 6, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-08-05T22:56:21.693' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (115, 19, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-05T22:56:21.710' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (116, 19, 2, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-08-05T22:56:21.710' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (117, 19, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-05T22:56:21.710' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (118, 19, 4, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-08-05T22:56:21.710' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (119, 19, 7, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-05T22:56:21.710' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (120, 19, 6, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-08-05T22:56:21.710' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (121, 20, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-06T08:27:51.153' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (122, 20, 2, CAST(15000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:27:51.153' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (123, 20, 4, CAST(5000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:27:51.153' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (124, 20, 7, CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-06T08:27:51.153' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (125, 20, 6, CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-06T08:27:51.153' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (126, 22, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.563' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (127, 21, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.563' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (128, 22, 2, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.563' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (129, 21, 2, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.563' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (130, 22, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.563' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (131, 22, 4, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.563' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (132, 21, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.563' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (133, 22, 7, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.563' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (134, 22, 6, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.563' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (135, 21, 4, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.563' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (136, 21, 7, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.563' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (137, 21, 6, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.563' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (138, 23, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.580' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (139, 24, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.580' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (140, 23, 2, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.580' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (141, 24, 2, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.580' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (142, 23, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.580' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (143, 24, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.580' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (144, 23, 4, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.580' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (145, 24, 4, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.580' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (146, 23, 7, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.580' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (147, 24, 7, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.583' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (148, 23, 6, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.583' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (149, 24, 6, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.583' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (150, 25, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.603' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (151, 25, 2, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.603' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (152, 26, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.603' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (153, 25, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.603' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (154, 26, 2, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.607' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (155, 25, 4, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.607' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (156, 26, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.607' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (157, 25, 7, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.607' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (158, 26, 4, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.607' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (159, 25, 6, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.607' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (160, 26, 7, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.607' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (161, 26, 6, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-08-06T08:28:55.607' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (162, 27, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-08T15:29:09.913' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (163, 27, 2, CAST(15000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:29:09.913' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (164, 27, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:29:09.913' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (165, 28, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-08T15:29:36.813' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (166, 28, 2, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:29:36.813' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (167, 28, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:29:36.817' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (168, 28, 4, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:29:36.817' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (169, 28, 7, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:29:36.817' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (170, 28, 6, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:29:36.817' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (171, 29, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-08T15:29:36.830' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (172, 29, 2, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:29:36.830' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (173, 29, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:29:36.830' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (174, 29, 4, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:29:36.830' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (175, 29, 7, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:29:36.830' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (176, 29, 6, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:29:36.833' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (177, 30, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-08T15:29:36.847' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (178, 30, 2, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:29:36.847' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (179, 30, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:29:36.847' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (180, 30, 4, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:29:36.847' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (181, 30, 7, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:29:36.847' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (182, 30, 6, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:29:36.847' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (183, 1, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-08-08T15:45:39.990' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (184, 1, 2, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:45:39.990' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (185, 1, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:45:39.990' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (186, 1, 4, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:45:39.990' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (187, 1, 6, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:45:39.990' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (188, 1, 7, CAST(20000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:45:39.990' AS DateTime), 0)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (189, 1, 1, CAST(4000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:45:58.097' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (190, 1, 2, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:45:58.097' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (191, 1, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:45:58.097' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (192, 1, 4, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:45:58.097' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (193, 1, 6, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:45:58.097' AS DateTime), 1)
INSERT [dbo].[HostelService] ([hostel_service_id], [hostel_id], [service_id], [service_price], [valid_date], [status]) VALUES (194, 1, 7, CAST(20000 AS Decimal(18, 0)), CAST(N'2022-08-08T15:45:58.097' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[HostelService] OFF
GO
SET IDENTITY_INSERT [dbo].[InfrastructureItem] ON 

INSERT [dbo].[InfrastructureItem] ([id_infrastructure_item], [infrastructure_name]) VALUES (1, N'Máy lạnh')
INSERT [dbo].[InfrastructureItem] ([id_infrastructure_item], [infrastructure_name]) VALUES (2, N'Cửa sổ')
INSERT [dbo].[InfrastructureItem] ([id_infrastructure_item], [infrastructure_name]) VALUES (3, N'Cửa ra vào')
INSERT [dbo].[InfrastructureItem] ([id_infrastructure_item], [infrastructure_name]) VALUES (4, N'Nhà vệ sinh')
INSERT [dbo].[InfrastructureItem] ([id_infrastructure_item], [infrastructure_name]) VALUES (5, N'Gối ôm test')
INSERT [dbo].[InfrastructureItem] ([id_infrastructure_item], [infrastructure_name]) VALUES (6, N'Gối nằm')
INSERT [dbo].[InfrastructureItem] ([id_infrastructure_item], [infrastructure_name]) VALUES (7, N'Nệm')
INSERT [dbo].[InfrastructureItem] ([id_infrastructure_item], [infrastructure_name]) VALUES (8, N'Máy tính')
INSERT [dbo].[InfrastructureItem] ([id_infrastructure_item], [infrastructure_name]) VALUES (9, N'Tủ lạnh')
INSERT [dbo].[InfrastructureItem] ([id_infrastructure_item], [infrastructure_name]) VALUES (10, N'Tivi')
INSERT [dbo].[InfrastructureItem] ([id_infrastructure_item], [infrastructure_name]) VALUES (11, N'Lò vi sóng')
INSERT [dbo].[InfrastructureItem] ([id_infrastructure_item], [infrastructure_name]) VALUES (12, N'Máy giặt')
INSERT [dbo].[InfrastructureItem] ([id_infrastructure_item], [infrastructure_name]) VALUES (13, N'Test cơ sở hạ tầng')
INSERT [dbo].[InfrastructureItem] ([id_infrastructure_item], [infrastructure_name]) VALUES (14, N'Ly nước')
SET IDENTITY_INSERT [dbo].[InfrastructureItem] OFF
GO
SET IDENTITY_INSERT [dbo].[InfrastructuresRoom] ON 

INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (1, 1, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (2, 1, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (3, 1, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (4, 1, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (5, 1, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (6, 2, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (7, 2, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (8, 2, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (9, 2, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (10, 2, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (11, 2, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (12, 2, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (13, 2, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (58, 14, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (59, 14, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (60, 14, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (61, 14, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (62, 15, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (63, 15, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (64, 15, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (65, 15, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (66, 16, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (67, 16, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (68, 16, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (69, 16, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (70, 17, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (71, 17, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (72, 17, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (73, 17, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (74, 18, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (75, 18, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (76, 18, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (77, 18, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (78, 19, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (79, 19, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (80, 19, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (81, 19, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (82, 20, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (83, 20, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (84, 20, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (85, 20, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (86, 21, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (87, 21, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (88, 21, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (89, 21, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (90, 22, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (91, 22, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (92, 22, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (93, 22, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (94, 23, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (95, 23, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (96, 23, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (97, 23, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (98, 24, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (99, 24, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (100, 24, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (101, 24, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (102, 25, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (103, 25, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (104, 25, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (105, 25, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (106, 26, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (107, 26, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (108, 26, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (109, 26, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (110, 27, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (111, 27, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (112, 27, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (113, 27, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (114, 28, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (115, 28, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (116, 28, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (117, 28, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (118, 29, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (119, 29, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (120, 29, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (121, 29, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (122, 30, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (123, 30, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (124, 30, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (125, 30, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (126, 31, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (127, 31, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (128, 31, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (129, 31, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (130, 32, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (131, 32, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (132, 32, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (133, 32, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (134, 33, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (135, 33, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (136, 33, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (137, 33, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (138, 34, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (139, 34, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (140, 34, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (141, 34, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (142, 34, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (143, 35, 1, 1, 4)
GO
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (144, 35, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (145, 35, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (146, 35, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (147, 36, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (148, 36, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (149, 36, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (150, 36, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (151, 37, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (152, 37, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (153, 37, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (154, 37, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (155, 38, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (156, 38, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (157, 38, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (158, 38, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (159, 39, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (160, 39, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (161, 39, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (162, 39, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (163, 40, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (164, 40, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (165, 40, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (166, 40, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (167, 41, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (168, 41, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (169, 41, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (170, 41, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (171, 42, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (172, 42, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (173, 42, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (174, 42, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (175, 43, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (176, 43, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (177, 43, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (178, 43, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (179, 44, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (180, 44, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (181, 44, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (182, 44, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (183, 45, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (184, 45, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (185, 45, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (186, 45, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (187, 46, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (188, 46, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (189, 46, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (190, 46, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (191, 47, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (192, 47, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (193, 47, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (194, 47, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (195, 48, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (196, 48, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (197, 48, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (198, 48, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (199, 49, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (200, 49, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (201, 49, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (202, 49, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (203, 50, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (204, 50, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (205, 50, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (206, 50, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (207, 50, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (208, 51, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (209, 51, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (210, 51, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (211, 51, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (212, 51, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (213, 51, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (214, 52, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (215, 52, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (216, 52, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (217, 52, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (218, 52, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (219, 52, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (220, 53, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (221, 53, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (222, 53, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (223, 53, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (224, 53, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (225, 53, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (226, 54, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (227, 54, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (228, 54, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (229, 54, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (230, 54, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (231, 54, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (232, 55, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (233, 55, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (234, 55, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (235, 55, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (236, 55, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (237, 55, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (238, 56, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (239, 56, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (240, 56, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (241, 56, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (242, 57, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (243, 57, 1, 1, 2)
GO
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (244, 57, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (245, 57, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (246, 58, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (247, 58, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (248, 58, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (249, 58, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (250, 59, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (251, 59, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (252, 59, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (253, 59, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (254, 60, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (255, 60, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (256, 60, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (257, 60, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (258, 61, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (259, 61, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (260, 61, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (261, 61, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (262, 62, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (263, 62, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (264, 62, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (265, 62, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (266, 63, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (267, 63, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (268, 63, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (269, 63, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (270, 64, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (271, 64, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (272, 64, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (273, 64, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (274, 65, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (275, 65, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (276, 65, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (277, 65, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (278, 66, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (279, 66, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (280, 66, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (281, 66, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (282, 66, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (283, 67, 1, 0, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (284, 67, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (285, 67, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (286, 67, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (287, 67, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (288, 68, 1, 0, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (289, 68, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (290, 68, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (291, 68, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (292, 68, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (293, 69, 1, 0, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (294, 69, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (295, 69, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (296, 69, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (297, 69, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (298, 70, 1, 0, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (299, 70, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (300, 70, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (301, 70, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (302, 70, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (303, 71, 1, 0, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (304, 71, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (305, 71, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (306, 71, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (307, 71, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (308, 72, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (309, 72, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (310, 72, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (311, 72, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (312, 73, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (313, 73, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (314, 73, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (315, 73, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (316, 74, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (317, 74, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (318, 74, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (319, 74, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (320, 75, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (321, 75, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (322, 75, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (323, 75, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (324, 76, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (325, 76, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (326, 76, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (327, 76, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (328, 77, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (329, 77, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (330, 77, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (331, 77, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (332, 78, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (333, 78, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (334, 78, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (335, 78, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (336, 79, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (337, 79, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (338, 79, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (339, 79, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (340, 80, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (341, 80, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (342, 80, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (343, 80, 1, 1, 1)
GO
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (344, 81, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (345, 81, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (346, 81, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (347, 81, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (348, 82, 1, 0, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (349, 82, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (350, 82, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (351, 82, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (352, 82, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (353, 83, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (354, 83, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (355, 83, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (356, 83, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (357, 84, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (358, 84, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (359, 84, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (360, 84, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (361, 85, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (362, 85, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (363, 85, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (364, 85, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (365, 86, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (366, 86, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (367, 86, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (368, 86, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (369, 87, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (370, 87, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (371, 87, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (372, 87, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (373, 88, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (374, 88, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (375, 88, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (376, 88, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (377, 89, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (378, 89, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (379, 89, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (380, 89, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (381, 90, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (382, 90, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (383, 90, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (384, 90, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (385, 91, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (386, 91, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (387, 91, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (388, 91, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (389, 92, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (390, 92, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (391, 92, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (392, 92, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (393, 93, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (394, 93, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (395, 93, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (396, 93, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (397, 94, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (398, 94, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (399, 94, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (400, 94, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (401, 95, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (402, 95, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (403, 95, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (404, 95, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (405, 96, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (406, 96, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (407, 96, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (408, 96, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (409, 97, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (410, 97, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (411, 97, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (412, 97, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (413, 98, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (414, 98, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (415, 98, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (416, 98, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (417, 99, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (418, 99, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (419, 99, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (420, 99, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (421, 100, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (422, 100, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (423, 100, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (424, 100, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (425, 101, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (426, 101, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (427, 101, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (428, 101, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (429, 102, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (430, 102, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (431, 102, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (432, 102, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (433, 103, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (434, 103, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (435, 103, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (436, 103, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (437, 104, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (438, 104, 1, 0, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (439, 104, 1, 0, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (440, 104, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (441, 104, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (442, 105, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (443, 105, 1, 0, 2)
GO
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (444, 105, 1, 0, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (445, 105, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (446, 105, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (447, 106, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (448, 106, 1, 0, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (449, 106, 1, 0, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (450, 106, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (451, 106, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (452, 107, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (453, 107, 1, 0, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (454, 107, 1, 0, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (455, 107, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (456, 107, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (457, 108, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (458, 108, 1, 0, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (459, 108, 1, 0, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (460, 108, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (461, 108, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (462, 109, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (463, 109, 1, 0, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (464, 109, 1, 0, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (465, 109, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (466, 109, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (467, 110, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (468, 110, 1, 0, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (469, 110, 1, 0, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (470, 110, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (471, 110, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (472, 111, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (473, 111, 1, 0, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (474, 111, 1, 0, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (475, 111, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (476, 111, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (477, 112, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (478, 112, 1, 0, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (479, 112, 1, 0, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (480, 112, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (481, 112, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (482, 113, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (483, 113, 1, 0, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (484, 113, 1, 0, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (485, 113, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (486, 113, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (487, 114, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (488, 114, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (489, 114, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (490, 114, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (491, 115, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (492, 115, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (493, 115, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (494, 115, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (495, 116, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (496, 116, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (497, 116, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (498, 116, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (499, 117, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (500, 117, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (501, 117, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (502, 117, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (503, 118, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (504, 118, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (505, 118, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (506, 118, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (507, 119, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (508, 119, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (509, 119, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (510, 119, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (511, 120, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (512, 120, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (513, 120, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (514, 120, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (515, 121, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (516, 121, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (517, 121, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (518, 121, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (519, 122, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (520, 122, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (521, 122, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (522, 122, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (523, 123, 1, 1, 4)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (524, 123, 1, 1, 2)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (525, 123, 1, 1, 3)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (526, 123, 1, 1, 1)
INSERT [dbo].[InfrastructuresRoom] ([id_infrastructure], [room_id], [quantity], [status], [id_infrastructure_item]) VALUES (527, 1, 1, 1, 10)
SET IDENTITY_INSERT [dbo].[InfrastructuresRoom] OFF
GO
SET IDENTITY_INSERT [dbo].[Notifications] ON 

INSERT [dbo].[Notifications] ([notification_id], [hostel_owner_account_id], [hostel_id], [title], [content], [create_date]) VALUES (1, 3, 1, N'Thông báo cúp điện', N'Theo thông tin từ công ty điện lực thì cuối tuần này vào thứ 7 sẽ cúp điện từ 7h sáng đến 17h chiều! Mọi người trong khu trọ chú ý để tránh ảnh hưởng đến sinh hoạt cũng như công việc.', CAST(N'2022-01-05T09:04:16.390' AS DateTime))
INSERT [dbo].[Notifications] ([notification_id], [hostel_owner_account_id], [hostel_id], [title], [content], [create_date]) VALUES (2, 3, 1, N'Tăng giá điện', N'Kể từ tháng sau, tức là tháng 3/2022 sẽ tăng giá điện của toàn bộ khu trọ từ 3000 vnd/kwh lên 3500kwh theo thông báo của công ty điện lực! Anh chị em sống trong khu trọ lưu ý nhé!', CAST(N'2022-02-12T17:29:58.363' AS DateTime))
INSERT [dbo].[Notifications] ([notification_id], [hostel_owner_account_id], [hostel_id], [title], [content], [create_date]) VALUES (3, 3, 1, N'Tăng giá nước ', N'Kể từ tháng sau, tức là tháng 5/2022 tăng giá nước từ 14000 vnd/m3 lên 16000 vnd/m3 theo giá mới của công ty nước! Mọi người trong khu trọ lưu ý để nắm bắt thông tin.', CAST(N'2022-04-12T17:31:58.550' AS DateTime))
INSERT [dbo].[Notifications] ([notification_id], [hostel_owner_account_id], [hostel_id], [title], [content], [create_date]) VALUES (4, 3, 1, N'Thông báo cúp điện ', N'Theo thông tin từ công ty điện lực thì cuối tuần này vào thứ 7 sẽ cúp điện từ 7h sáng đến 17h chiều! Mọi người trong khu trọ chú ý để tránh ảnh hưởng đến sinh hoạt cũng như công việc.', CAST(N'2022-04-22T17:33:28.717' AS DateTime))
INSERT [dbo].[Notifications] ([notification_id], [hostel_owner_account_id], [hostel_id], [title], [content], [create_date]) VALUES (6, 3, 1, N'Thông báo cúp nước/nước yếu', N'Theo thông tin nhận được thì công ty nước cần nâng cấp và bảo trì đường ống dẫn nước để bảo đảm lưu lượng cũng như nguồn nước đến người dân nên sẽ cúp nước vào các khung giờ từ 8h đến 11h và từ 13h đến 17h, từ 23h đêm đến 5h sáng các ngày từ ngày 14/06/2022 đến 18/06/2022. Mọi người chú ý có giải pháp dự trữ nước để tránh ảnh hưởng đến vệ sinh, sinh hoạt.', CAST(N'2022-05-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Notifications] ([notification_id], [hostel_owner_account_id], [hostel_id], [title], [content], [create_date]) VALUES (7, 3, 1, N'Thông báo tu sửa phòng', N'Hiện tại tôi nhận được báo cáo có hiện tượng dột từ một số phòng nên sáng thứ 5 tuần này sẽ có đội ngũ thợ đến kiểm tra và khắc phục sự cố. Mọi người chú ý.', CAST(N'2022-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Notifications] ([notification_id], [hostel_owner_account_id], [hostel_id], [title], [content], [create_date]) VALUES (9, 3, 1, N'Thông báo an ninh', N'Gần đây có một vài anh chị trong khu trọ sau khi lấy xe từ nhà xe quên khóa cửa, điều này cực kì nguy hiểm đến an ninh và tổn hại đến tài sản của những người khác. Ra quy định nếu ai sau khi lấy xe không đóng của nhà xe, sẽ check cam, ghi nhận và bị phạt từ 500k đến 1tr đồng. Nếu để xảy ra mất xe thì phải chịu trách nhiệm bồi thường toàn bộ xe bị mất. Anh chị em chú ý để đảm bảo giữ gìn tài sản của mình cũng như của anh chị khác sống trong khu trọ.', CAST(N'2022-06-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Notifications] ([notification_id], [hostel_owner_account_id], [hostel_id], [title], [content], [create_date]) VALUES (10, 3, 1, N'Thông báo an ninh/trật tự', N'Đề nghị anh chị không nhậu nhẹt, chè chén, ca hát sau 11h đêm ở khu trọ. Nếu ai vi phạm các phòng khác cứ việc báo cáo để tôi có hình thức xử lý!', CAST(N'2022-06-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Notifications] ([notification_id], [hostel_owner_account_id], [hostel_id], [title], [content], [create_date]) VALUES (14, 3, 1, N'Thông báo điều chỉnh phụ phí vệ sinh', N'Do gần đây dịch căng thẳng, nên chị phụ trách dọn vệ sinh khu trọ đã về quê. Hiện tại tôi sẽ điều chỉnh phí vệ sinh về 0 vnd/phòng. Tạm thời mọi người sống trong khu cố gắng giữ gìn vệ sinh chung, bảo vệ cảnh quan khu trọ.', CAST(N'2022-07-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Notifications] ([notification_id], [hostel_owner_account_id], [hostel_id], [title], [content], [create_date]) VALUES (16, 3, 1, N'Lịch cúp điện', N'<h3><strong>Cúp điện toàn bộ khu trọ</strong></h3><p>&nbsp;</p><p>Ngày 08/08/2022, theo thông tin nhận được từ công ty điện lực thì họ sẽ tiến hành sửa chữa đường dây để nâng cấp, nên sẽ cúp điện từ 6h sáng đến 17h chiều. Mọi người trong khu trọ lưu ý để đảm bảo sinh hoạt cũng như công việc hằng ngày!</p><p><strong>Lưu ý:</strong></p><ul><li>Nhà xe đã có sẵn bộ lưu điện nên không lo không lấy được xe</li><li>Nước được cung cấp trực tiếp từ đường ống nhà máy nước nên sẽ không lo bị gián đoạn nước</li></ul>', CAST(N'2022-08-01T20:20:29.217' AS DateTime))
INSERT [dbo].[Notifications] ([notification_id], [hostel_owner_account_id], [hostel_id], [title], [content], [create_date]) VALUES (17, 3, 1, N'Thông báo lịch cúp điện', N'<p>Theo như thông tin nhận được từ công ty điện lực thì cuối tuần này - ngày 06/08/2022 sẽ cúp điện toàn bộ phường để tiến hành sửa chữa và nâng cấp đường dây nhằm đảm bảo điện được lưu thông và cung cấp đầy đủ đến người dùng.<br>Vì thế sẽ cúp điện bắt đầu từ 7 giờ sáng đến 17 giờ chiều!<br>Mọi người trong chu trọ nhớ chú ý chuẩn bị để sinh hoạt không bị gián đoạn trong ngày hôm đó!<br>Ký tên: Chủ trọ</p>', CAST(N'2022-08-05T16:55:28.280' AS DateTime))
INSERT [dbo].[Notifications] ([notification_id], [hostel_owner_account_id], [hostel_id], [title], [content], [create_date]) VALUES (18, 3, 3, N'Thông báo cập nhật dịch vụ', N'Cập nhật dịch vụ: 
Điện: 3500 || Nước: 12000 || Wifi: 90000 || Phí quản lý: 40000 || Phí giữ xe: 5000 || Phí vệ sinh: 15000 || Phí bảo trì: 50000 || ', CAST(N'2022-08-05T17:01:17.023' AS DateTime))
INSERT [dbo].[Notifications] ([notification_id], [hostel_owner_account_id], [hostel_id], [title], [content], [create_date]) VALUES (19, 3, 1, N'Thông báo lịch cúp điện', N'<ul><li>Theo như thông tin nhận được từ công ty điện lực thì cuối tuần này - ngày 06/08/2022 sẽ cúp điện toàn bộ phường để tiến hành sửa chữa và nâng cấp đường dây nhằm đảm bảo điện được lưu thông và cung cấp đầy đủ đến người dùng.</li><li>Vì thế sẽ cúp điện bắt đầu từ 7 giờ sáng đến 17 giờ chiều!<br>Mọi người trong chu trọ nhớ chú ý chuẩn bị để sinh hoạt không bị gián đoạn trong ngày hôm đó!<br><strong>Ký tên:</strong> Chủ trọ</li></ul>', CAST(N'2022-08-08T15:39:39.320' AS DateTime))
INSERT [dbo].[Notifications] ([notification_id], [hostel_owner_account_id], [hostel_id], [title], [content], [create_date]) VALUES (20, 3, 1, N'Thông báo cập nhật dịch vụ', N'Cập nhật dịch vụ: 
Điện: 4000 || Nước: 10000 || Wifi: 100000 || Phí quản lý: 150000 || Phí vệ sinh: 50000 || Phí giữ xe: 20000 || ', CAST(N'2022-08-08T15:45:58.140' AS DateTime))
SET IDENTITY_INSERT [dbo].[Notifications] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([payment_id], [payment_name]) VALUES (1, N'Tiền mặt')
INSERT [dbo].[Payment] ([payment_id], [payment_name]) VALUES (2, N'VNPay')
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Propose] ON 

INSERT [dbo].[Propose] ([id], [content], [send_date], [reply], [reply_date], [status], [send_account_id], [reply_account_id]) VALUES (1, N'<h3>Gửi quản trị viên:</h3><ul><li>Tôi thấy ứng dụng hơi lag, chậm, chưa được hoàn thiện, mong quản trị viên bảo team dev tối ưu lại hệ thống để tôi có những trải nghiệm tốt nhất!</li></ul><p>Cảm ơn!!</p>', CAST(N'2022-08-02T16:15:07.503' AS DateTime), N'<h3>Gửi người dùng</h3><ul><li>Chúng tôi sau khi kiểm tra nhận thấy ứng dụng hoàn toàn không lỗi gì cả! Không biết anh chị đã dùng công cụ gì để kiểm tra hiệu năng chạy của app vậy nhỉ?</li><li>Nếu anh chị tự tin về trình độ IT của mình quá thì giúp chúng tôi xây dụng luôn ứng dụng này đi? Việc gì phải đi phá app của chúng tôi như vậy? Chúng tôi không thích đâu nhá!</li></ul><h2>Sợ quá phải ban nó thôi!!!!</h2>', CAST(N'2022-08-02T18:21:13.050' AS DateTime), -1, 3, 2)
INSERT [dbo].[Propose] ([id], [content], [send_date], [reply], [reply_date], [status], [send_account_id], [reply_account_id]) VALUES (2, N'<p>Kính gửi quản trị viên hệ thống,</p><p>Tôi là người dùng ứng dụng đã lâu thế mà quản trị viên không giảm giá sử dụng ứng dụng cho tôi được xíu nào sao?</p><p>Mong quản trị viên đọc được phản hồi này, chấp thuận cho tôi được sử dụng free sản phẩm!&nbsp;</p><p>Cảm ơn!</p>', CAST(N'2022-08-02T16:21:36.343' AS DateTime), N'<p>Ok em</p>', CAST(N'2022-08-02T18:18:48.577' AS DateTime), 1, 3, 2)
INSERT [dbo].[Propose] ([id], [content], [send_date], [reply], [reply_date], [status], [send_account_id], [reply_account_id]) VALUES (12, N'<p>Kính gửi quản trị viên hệ thống,</p><p>Tôi là người dùng ứng dụng đã lâu thế mà quản trị viên không giảm giá sử dụng ứng dụng cho tôi được xíu nào sao?</p><p>Mong quản trị viên đọc được phản hồi này, chấp thuận cho tôi được sử dụng free sản phẩm!&nbsp;</p><p>Cảm ơn!</p>', CAST(N'2022-08-02T18:23:06.853' AS DateTime), NULL, NULL, 0, 3, NULL)
INSERT [dbo].[Propose] ([id], [content], [send_date], [reply], [reply_date], [status], [send_account_id], [reply_account_id]) VALUES (14, N'<p>Gửi quản trị viên:</p><p><br>Hiện tại trong danh sách cơ sở vật chát của phòng chưa có loại mà tôi cần!<br>Nên tôi đề nghị thêm cho tôi loại cơ sở vật chất là "Lò vi sóng" để tôi có thể dễ dàng quản lí!<br>&nbsp;</p><p>Cảm ơn và quản trị viên phản hồi sớm giùm tôi với!</p>', CAST(N'2022-08-08T15:42:45.840' AS DateTime), N'<p>Ok tôi sẽ thêm vào hệ thống! Cảm ơn bạn đã phản hồi!</p>', CAST(N'2022-08-08T15:43:44.020' AS DateTime), 1, 3, 2)
SET IDENTITY_INSERT [dbo].[Propose] OFF
GO
SET IDENTITY_INSERT [dbo].[ReportCategory] ON 

INSERT [dbo].[ReportCategory] ([cate_id], [title]) VALUES (1, N'Báo hư hỏng')
INSERT [dbo].[ReportCategory] ([cate_id], [title]) VALUES (2, N'Báo trả phòng')
INSERT [dbo].[ReportCategory] ([cate_id], [title]) VALUES (3, N'Báo hóa đơn')
INSERT [dbo].[ReportCategory] ([cate_id], [title]) VALUES (4, N'Báo an ninh/trật tự')
SET IDENTITY_INSERT [dbo].[ReportCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Reports] ON 

INSERT [dbo].[Reports] ([id_report], [send_date], [content], [status], [reply], [reply_date], [complete_date], [reply_account_id], [send_account_id], [cate_id]) VALUES (1, CAST(N'2022-01-20T00:00:00.000' AS DateTime), N'Anh ơi phòng bên cạnh 11h đêm rồi vẫn nhậu! Mai tụi em còn phải đi làm nữa! Anh giải quyết giúp tụi em với chứ việc này xảy ra khá thường xuyên ấy! Không phải lần đầu đâu ạ!', 2, N'<p>Ok em!</p><p>Để mai anh qua nói chuyện với họ! Em thông cảm giùm anh một bữa đêm nay nhé!</p>', CAST(N'2022-01-21T06:07:08.730' AS DateTime), CAST(N'2022-01-21T13:22:05.883' AS DateTime), 3, 4, 4)
INSERT [dbo].[Reports] ([id_report], [send_date], [content], [status], [reply], [reply_date], [complete_date], [reply_account_id], [send_account_id], [cate_id]) VALUES (2, CAST(N'2022-02-10T00:00:00.000' AS DateTime), N'Anh ơi máy lạnh của phòng em nó bị gì ấy ạ! Em thử bật xuống nhiệt độ thấp nhất và chế độ quạt mạnh nhất rồi mà phòng vẫn không lạnh thêm xíu nào cả! Anh kiểm tra lại giúp em với!', 2, N'<p>Ok em!</p><p>Ngày mai anh nói thợ tới sửa cho mình ngay! Em ráng hôm nay chịu nóng một hôm nha!</p>', CAST(N'2022-02-10T13:47:13.210' AS DateTime), CAST(N'2022-02-12T14:49:29.210' AS DateTime), 3, 4, 1)
INSERT [dbo].[Reports] ([id_report], [send_date], [content], [status], [reply], [reply_date], [complete_date], [reply_account_id], [send_account_id], [cate_id]) VALUES (3, CAST(N'2022-03-23T00:00:00.000' AS DateTime), N'Kì này dịch căng quá phải cách ly ở nhà và không được đi làm nên thu nhập của tụi em gặp khó khăn! Anh có thể giảm tiền phòng giúp tụi em được với không ạ? Nếu không chắc tụi em đành phải trốn bỏ phòng về quê đây ạ!', 2, N'<p><strong>Cảnh báo!</strong></p><ul><li>Đừng em người bình thường ai lại làm thế!&nbsp;</li><li>Em hãy giữ vững tư thế và chuẩn bị đợt giảm giá phòng sắp tới từ anh đi!</li></ul><p>Kí tên: <strong>Anh chủ trọ thân thiện</strong></p>', CAST(N'2022-03-24T13:51:07.127' AS DateTime), CAST(N'2022-03-25T13:51:37.620' AS DateTime), 3, 4, 2)
INSERT [dbo].[Reports] ([id_report], [send_date], [content], [status], [reply], [reply_date], [complete_date], [reply_account_id], [send_account_id], [cate_id]) VALUES (4, CAST(N'2022-04-28T00:00:00.000' AS DateTime), N'Anh ơi cống thoát nước ở khu trọ của mình có vấn đề hay sao đấy ạ! Nước thoát ra khá là lâu, em có thử dùng que chọt xuống lỗ cống nhưng vẫn không có tác dụng! Anh kiểm tra lại giúp em với ạ! Nó ảnh hưởng đến sinh hoạt của tụi em khá nhiều ạ!', 2, N'<p>Cảm ơn em đã gửi báo cáo!</p><p>Anh sẽ gọi người tới xử lý cho mình ngay!</p><p>Em vui lòng chờ nhé! &lt;3</p>', CAST(N'2022-04-28T13:52:57.563' AS DateTime), CAST(N'2022-05-01T13:53:12.863' AS DateTime), 3, 4, 4)
INSERT [dbo].[Reports] ([id_report], [send_date], [content], [status], [reply], [reply_date], [complete_date], [reply_account_id], [send_account_id], [cate_id]) VALUES (5, CAST(N'2022-05-20T00:00:00.000' AS DateTime), N'Hello Anh trai, kì này nhà em vỡ nợ, không còn tiền để cống nạp cho anh nữa! Em phải trả phòng sớm, thật ra em cũng không nỡ đi đâu, nhưng vì hết tiền,..', 0, NULL, NULL, NULL, 3, 4, 2)
INSERT [dbo].[Reports] ([id_report], [send_date], [content], [status], [reply], [reply_date], [complete_date], [reply_account_id], [send_account_id], [cate_id]) VALUES (6, CAST(N'2022-06-02T00:00:00.000' AS DateTime), N'Anh ơi hôm qua mưa to quá, em quên gài cửa nên gió thổi đập vỡ kính cửa sổ phòng em rồi ạ! Anh gọi thợ qua thay giúp em với ạ! Em cảm ơn ạ!', 0, NULL, NULL, NULL, 3, 4, 1)
INSERT [dbo].[Reports] ([id_report], [send_date], [content], [status], [reply], [reply_date], [complete_date], [reply_account_id], [send_account_id], [cate_id]) VALUES (7, CAST(N'2022-07-22T00:00:00.000' AS DateTime), N'Anh ơi dưới nhà xe có xảy ra đánh nhau! Em thấy tình hình khá căng thẳng! Anh qua xử lý giúp với ạ!', 0, NULL, NULL, NULL, 3, 4, 4)
INSERT [dbo].[Reports] ([id_report], [send_date], [content], [status], [reply], [reply_date], [complete_date], [reply_account_id], [send_account_id], [cate_id]) VALUES (8, CAST(N'2022-08-05T00:00:00.000' AS DateTime), N'<p>Anh ơi máy lạnh của phòng em nó bị gì ấy ạ! Em thử bật xuống nhiệt độ thấp nhất và chế độ quạt mạnh nhất rồi mà phòng vẫn không lạnh thêm xíu nào cả! Anh kiểm tra lại giúp em với!!&nbsp;<br>Anh qua kiểm tra giúp em với ạ!</p>', 2, N'<p>Ok em ơi! Anh nhận được thông tin rồi nha!<br>Ngày mai anh nói thợ tới sửa sớm cho mình ngay!&nbsp;<br>Ký tên: Chủ trọ</p>', CAST(N'2022-08-05T16:57:23.710' AS DateTime), CAST(N'2022-08-05T16:57:48.807' AS DateTime), 3, 4, 1)
INSERT [dbo].[Reports] ([id_report], [send_date], [content], [status], [reply], [reply_date], [complete_date], [reply_account_id], [send_account_id], [cate_id]) VALUES (9, CAST(N'2022-08-05T00:00:00.000' AS DateTime), N'<p>Anh ơi máy lạnh của phòng em nó bị gì ấy ạ! Em thử bật xuống nhiệt độ thấp nhất và chế độ quạt mạnh nhất rồi mà phòng vẫn không lạnh thêm xíu nào cả! Anh kiểm tra lại giúp em với!!&nbsp;<br>Anh qua kiểm tra giúp em với ạ!</p>', 0, NULL, NULL, NULL, 3, 4, 1)
INSERT [dbo].[Reports] ([id_report], [send_date], [content], [status], [reply], [reply_date], [complete_date], [reply_account_id], [send_account_id], [cate_id]) VALUES (10, CAST(N'2022-08-08T00:00:00.000' AS DateTime), N'<p>Anh ơi, điện ở phòng em nó cứ kiểu chập chờn, cứ khoảng 1 tiếng là nó sẽ cúp 1 tiếng rồi bình thường trở lại. Điều này khá là ảnh hưởng tới các thiết bị điện trong phòng của em!&nbsp;<br>Anh qua kiểm tra giúp em với ạ!</p>', 2, N'<p>Ok em ơi! Anh nhận được thông tin rồi nha!<br>Ngày mai anh nói thợ tới sửa sớm cho mình ngay!&nbsp;<br>Ký tên: Chủ trọ</p>', CAST(N'2022-08-08T15:41:13.037' AS DateTime), CAST(N'2022-08-08T15:41:46.350' AS DateTime), 3, 4, 1)
SET IDENTITY_INSERT [dbo].[Reports] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomateInformations] ON 

INSERT [dbo].[RoomateInformations] ([roomate_info_id], [fullname], [email], [birthday], [sex], [phone], [address], [identity_card_number], [parent_name], [parent_phone], [account_renter_id]) VALUES (5, N'Thái Thành Phát', N'phat@gmail.com', CAST(N'2001-01-01' AS Date), 1, N'0792111222', N'Thành phố Dĩ An, tỉnh Bình Dương', N'123456789', N'Cha Me', N'123456789', 4)
INSERT [dbo].[RoomateInformations] ([roomate_info_id], [fullname], [email], [birthday], [sex], [phone], [address], [identity_card_number], [parent_name], [parent_phone], [account_renter_id]) VALUES (7, N'Hồ Hải Nam', N'test@gmail.com', CAST(N'2022-08-06' AS Date), 1, N'0792444555', N'Đồng Nai', N'123456789', N'HHN', N'0792111222', 4)
INSERT [dbo].[RoomateInformations] ([roomate_info_id], [fullname], [email], [birthday], [sex], [phone], [address], [identity_card_number], [parent_name], [parent_phone], [account_renter_id]) VALUES (8, N'Trần Hoài Nam', N'namth@gmail.com', CAST(N'2022-08-08' AS Date), 1, N'0367123123', N'Bình Phước', N'123456789', N'Trần Quốc Bảo', N'0367123456', 4)
SET IDENTITY_INSERT [dbo].[RoomateInformations] OFF
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (1, 1, 1, 4, CAST(22.000 AS Decimal(18, 3)), 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (2, 1, 2, 4, CAST(20.000 AS Decimal(18, 3)), 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (14, 3, 1, 1, CAST(20.000 AS Decimal(18, 3)), 1, -1, N'biqql14', N'iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAQAAAACFI5MzAAABbElEQVR4Xu2WwWrEMAxEBf4tg35doN8SuDNKKNm0PdVzs9hdcN7BkTQara2/wt4PvuOQQxiH/IOE2VgZnjHug4YkPpmrfIX3QUViNMTtntdBRmKEzemdrpIgTV5eUkI4Rw0WlgcRoSj4rOOHdvYRRpkjz3llKSJh3bYBwWdN9E9EFo5MtabZHKsemW4lwQSTyUL0fueqIM5fSHC1JC+kIXlPVt46FJFCt8rBUFHIREQoc8xVuwRnzFWEtTSHMgCTM6whq9+gpQ45wpVEBLe3F8Ek5qvWe0kPFhVfAwV9VHQzwZXVtaTirV9AQbgmuJR6XXxUdC9pdWR3DXb0qvVGktQIDJZmzgFzGelEF33cu74iwusn7AJf7r8UkaaY3uint5cLCJc4pIG1Tit/OtJews6hYfOGJiO8FzPM6WK2HSKSLCMUn9S+kAR3BuU+qEYRIeRYoYXOMRaR/gdZrXiW9cORdpJf45BDGIfsJl/3Ea3ab6fQ4AAAAABJRU5ErkJggg==', CAST(N'2022-08-03T10:36:54.000' AS DateTime))
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (15, 3, 2, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (16, 3, 3, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (17, 3, 4, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (18, 1, 4, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (19, 6, 15, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (20, 6, 16, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (21, 6, 17, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (22, 6, 18, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (23, 6, 19, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (24, 6, 20, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (25, 6, 21, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (26, 6, 22, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (27, 6, 23, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (28, 6, 24, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (29, 6, 1, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (30, 5, 1, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (31, 5, 2, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (32, 5, 3, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (33, 5, 4, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (34, 8, 1, 1, CAST(20.000 AS Decimal(18, 3)), 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (35, 8, 2, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (36, 8, 3, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (37, 8, 4, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (38, 8, 5, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (39, 8, 6, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (40, 8, 15, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (41, 8, 16, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (42, 8, 17, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (43, 8, 18, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (44, 8, 19, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (45, 8, 20, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (46, 8, 21, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (47, 8, 22, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (48, 8, 23, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (49, 8, 24, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (50, 12, 1, 1, CAST(20.000 AS Decimal(18, 3)), 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (51, 12, 2, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (52, 12, 3, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (53, 12, 4, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (54, 12, 5, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (55, 12, 6, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (56, 12, 15, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (57, 12, 16, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (58, 12, 17, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (59, 12, 18, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (60, 12, 19, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (61, 12, 20, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (62, 12, 21, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (63, 12, 22, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (64, 12, 23, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (65, 12, 24, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (66, 16, 1, 1, CAST(20.000 AS Decimal(18, 3)), 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (67, 16, 2, 1, CAST(22.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (68, 16, 3, 1, CAST(22.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (69, 16, 4, 1, CAST(22.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (70, 16, 5, 1, CAST(22.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (71, 16, 6, 1, CAST(22.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (72, 16, 15, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (73, 16, 16, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (74, 16, 17, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (75, 16, 18, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (76, 16, 19, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (77, 16, 20, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (78, 16, 21, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (79, 16, 22, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (80, 16, 23, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (81, 16, 24, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (82, 20, 1, 1, CAST(20.000 AS Decimal(18, 3)), 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (83, 20, 2, 1, CAST(22.000 AS Decimal(18, 3)), 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (84, 20, 3, 1, CAST(22.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (85, 20, 4, 1, CAST(22.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (86, 20, 5, 1, CAST(22.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (87, 20, 6, 1, CAST(22.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (88, 20, 7, 1, CAST(22.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (89, 20, 8, 1, CAST(22.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (90, 20, 9, 1, CAST(22.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (91, 20, 10, 1, CAST(22.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (92, 20, 11, 1, CAST(22.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (93, 20, 15, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (94, 20, 16, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (95, 20, 17, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (96, 20, 18, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (97, 20, 19, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (98, 20, 20, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (99, 20, 21, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (100, 20, 22, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (101, 20, 23, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (102, 20, 24, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (103, 27, 1, 1, CAST(22.000 AS Decimal(18, 3)), 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (104, 27, 2, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (105, 27, 3, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (106, 27, 4, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (107, 27, 5, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (108, 27, 6, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (109, 27, 7, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (110, 27, 8, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (111, 27, 9, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (112, 27, 10, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (113, 27, 11, 1, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (114, 27, 15, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (115, 27, 16, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (116, 27, 17, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (117, 27, 18, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (118, 27, 19, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (119, 27, 20, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (120, 27, 21, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (121, 27, 22, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (122, 27, 23, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Rooms] ([room_id], [hostel_id], [room_number], [capacity], [room_area], [has_attic], [room_status], [invite_code], [QRcode], [expiredTimeCode]) VALUES (123, 27, 24, 4, CAST(20.000 AS Decimal(18, 3)), 1, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([service_id], [service_name], [unit]) VALUES (1, N'Điện', N'Kwh')
INSERT [dbo].[Services] ([service_id], [service_name], [unit]) VALUES (2, N'Nước', N'm3')
INSERT [dbo].[Services] ([service_id], [service_name], [unit]) VALUES (3, N'Wifi', N'phòng')
INSERT [dbo].[Services] ([service_id], [service_name], [unit]) VALUES (4, N'Phí quản lý', N'phòng')
INSERT [dbo].[Services] ([service_id], [service_name], [unit]) VALUES (6, N'Phí vệ sinh', N'phòng')
INSERT [dbo].[Services] ([service_id], [service_name], [unit]) VALUES (7, N'Phí giữ xe', N'phòng')
INSERT [dbo].[Services] ([service_id], [service_name], [unit]) VALUES (8, N'Phí bảo trì test', N'phòng')
INSERT [dbo].[Services] ([service_id], [service_name], [unit]) VALUES (9, N'Phí test', N'Kwh')
INSERT [dbo].[Services] ([service_id], [service_name], [unit]) VALUES (10, N'Thuế nhà nước', N'phòng')
INSERT [dbo].[Services] ([service_id], [service_name], [unit]) VALUES (11, N'Phí thêm mới', N'phòng')
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Accounts__F3DBC572529EBE2C]    Script Date: 8/8/2022 5:54:30 PM ******/
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [UQ__Accounts__F3DBC572529EBE2C] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_IRoom]    Script Date: 8/8/2022 5:54:30 PM ******/
ALTER TABLE [dbo].[Rooms] ADD  CONSTRAINT [UQ_IRoom] UNIQUE NONCLUSTERED 
(
	[hostel_id] ASC,
	[room_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountInformations]  WITH CHECK ADD  CONSTRAINT [FK__AccountIn__accou__48CFD27E] FOREIGN KEY([account_id])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[AccountInformations] CHECK CONSTRAINT [FK__AccountIn__accou__48CFD27E]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Rooms1] FOREIGN KEY([room_id])
REFERENCES [dbo].[Rooms] ([room_id])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Rooms1]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK__Bill__payment_id__47DBAE45] FOREIGN KEY([payment_id])
REFERENCES [dbo].[Payment] ([payment_id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK__Bill__payment_id__47DBAE45]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK__Bill__room_id__48CFD27E] FOREIGN KEY([room_id])
REFERENCES [dbo].[Rooms] ([room_id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK__Bill__room_id__48CFD27E]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK__BillDetai__bill___40058253] FOREIGN KEY([bill_id])
REFERENCES [dbo].[Bill] ([bill_id])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK__BillDetai__bill___40058253]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillDetail_Accounts] FOREIGN KEY([accountHostelOwnerID])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_BillDetail_Accounts]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillDetail_Accounts1] FOREIGN KEY([accountRenterID])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_BillDetail_Accounts1]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillDetail_Consumes] FOREIGN KEY([consumeIDStart])
REFERENCES [dbo].[Consumes] ([consume_id])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_BillDetail_Consumes]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillDetail_Consumes1] FOREIGN KEY([consumeIDEnd])
REFERENCES [dbo].[Consumes] ([consume_id])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_BillDetail_Consumes1]
GO
ALTER TABLE [dbo].[BillService]  WITH CHECK ADD  CONSTRAINT [FK__BillServi__hoste__3D2915A8] FOREIGN KEY([hostel_service_id])
REFERENCES [dbo].[HostelService] ([hostel_service_id])
GO
ALTER TABLE [dbo].[BillService] CHECK CONSTRAINT [FK__BillServi__hoste__3D2915A8]
GO
ALTER TABLE [dbo].[BillService]  WITH CHECK ADD  CONSTRAINT [FK_BillService_BillDetail] FOREIGN KEY([bill_detail_id])
REFERENCES [dbo].[BillDetail] ([bill_detail_id])
GO
ALTER TABLE [dbo].[BillService] CHECK CONSTRAINT [FK_BillService_BillDetail]
GO
ALTER TABLE [dbo].[Consumes]  WITH CHECK ADD  CONSTRAINT [FK__Consumes__room_i__4BAC3F29] FOREIGN KEY([room_id])
REFERENCES [dbo].[Rooms] ([room_id])
GO
ALTER TABLE [dbo].[Consumes] CHECK CONSTRAINT [FK__Consumes__room_i__4BAC3F29]
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK__Contracts__hoste__59063A47] FOREIGN KEY([hostel_owner_id])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK__Contracts__hoste__59063A47]
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK__Contracts__rente__59FA5E80] FOREIGN KEY([renter_id])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK__Contracts__rente__59FA5E80]
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK__Contracts__room___5441852A] FOREIGN KEY([room_id])
REFERENCES [dbo].[Rooms] ([room_id])
GO
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK__Contracts__room___5441852A]
GO
ALTER TABLE [dbo].[Hostels]  WITH CHECK ADD  CONSTRAINT [FK__Hostels__owner_a__534D60F1] FOREIGN KEY([owner_account_id])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Hostels] CHECK CONSTRAINT [FK__Hostels__owner_a__534D60F1]
GO
ALTER TABLE [dbo].[HostelService]  WITH CHECK ADD  CONSTRAINT [FK__HostelSer__hoste__5CD6CB2B] FOREIGN KEY([hostel_id])
REFERENCES [dbo].[Hostels] ([hostel_id])
GO
ALTER TABLE [dbo].[HostelService] CHECK CONSTRAINT [FK__HostelSer__hoste__5CD6CB2B]
GO
ALTER TABLE [dbo].[HostelService]  WITH CHECK ADD  CONSTRAINT [FK__HostelSer__servi__5DCAEF64] FOREIGN KEY([service_id])
REFERENCES [dbo].[Services] ([service_id])
GO
ALTER TABLE [dbo].[HostelService] CHECK CONSTRAINT [FK__HostelSer__servi__5DCAEF64]
GO
ALTER TABLE [dbo].[InfrastructuresRoom]  WITH CHECK ADD  CONSTRAINT [FK__Infrastru__id_in__5165187F] FOREIGN KEY([id_infrastructure_item])
REFERENCES [dbo].[InfrastructureItem] ([id_infrastructure_item])
GO
ALTER TABLE [dbo].[InfrastructuresRoom] CHECK CONSTRAINT [FK__Infrastru__id_in__5165187F]
GO
ALTER TABLE [dbo].[InfrastructuresRoom]  WITH CHECK ADD  CONSTRAINT [FK__Infrastru__room___5070F446] FOREIGN KEY([room_id])
REFERENCES [dbo].[Rooms] ([room_id])
GO
ALTER TABLE [dbo].[InfrastructuresRoom] CHECK CONSTRAINT [FK__Infrastru__room___5070F446]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK__Notificat__hoste__5812160E] FOREIGN KEY([hostel_owner_account_id])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK__Notificat__hoste__5812160E]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK__Notificat__hoste__59063A47] FOREIGN KEY([hostel_id])
REFERENCES [dbo].[Hostels] ([hostel_id])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK__Notificat__hoste__59063A47]
GO
ALTER TABLE [dbo].[Propose]  WITH CHECK ADD  CONSTRAINT [FK_Propose_Accounts] FOREIGN KEY([send_account_id])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Propose] CHECK CONSTRAINT [FK_Propose_Accounts]
GO
ALTER TABLE [dbo].[Propose]  WITH CHECK ADD  CONSTRAINT [FK_Propose_Accounts1] FOREIGN KEY([reply_account_id])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Propose] CHECK CONSTRAINT [FK_Propose_Accounts1]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK__Reports__cate_id__59FA5E80] FOREIGN KEY([cate_id])
REFERENCES [dbo].[ReportCategory] ([cate_id])
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK__Reports__cate_id__59FA5E80]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK__Reports__reply_a__5AEE82B9] FOREIGN KEY([reply_account_id])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK__Reports__reply_a__5AEE82B9]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK__Reports__send_ac__5BE2A6F2] FOREIGN KEY([send_account_id])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK__Reports__send_ac__5BE2A6F2]
GO
ALTER TABLE [dbo].[RoomateInformations]  WITH CHECK ADD  CONSTRAINT [FK__RoomateIn__accou__5CD6CB2B] FOREIGN KEY([account_renter_id])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[RoomateInformations] CHECK CONSTRAINT [FK__RoomateIn__accou__5CD6CB2B]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK__Rooms__hostel_id__44FF419A] FOREIGN KEY([hostel_id])
REFERENCES [dbo].[Hostels] ([hostel_id])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK__Rooms__hostel_id__44FF419A]
GO
USE [master]
GO
ALTER DATABASE [HostelManagement] SET  READ_WRITE 
GO
