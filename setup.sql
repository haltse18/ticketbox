USE [master]
GO
/****** Object:  Database [DB_TicketBox]    Script Date: 14-Oct-21 5:33:16 PM ******/
CREATE DATABASE [DB_TicketBox]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FIEP', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FIEP.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FIEP_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FIEP_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_TicketBox] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_TicketBox].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_TicketBox] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_TicketBox] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_TicketBox] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_TicketBox] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_TicketBox] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_TicketBox] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DB_TicketBox] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_TicketBox] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_TicketBox] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_TicketBox] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_TicketBox] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_TicketBox] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_TicketBox] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_TicketBox] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_TicketBox] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_TicketBox] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_TicketBox] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_TicketBox] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_TicketBox] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_TicketBox] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_TicketBox] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_TicketBox] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_TicketBox] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_TicketBox] SET  MULTI_USER 
GO
ALTER DATABASE [DB_TicketBox] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_TicketBox] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_TicketBox] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_TicketBox] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DB_TicketBox] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DB_TicketBox]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 14-Oct-21 5:33:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Total] [float] NOT NULL,
	[IsSuccess] [bit] NOT NULL,
	[CreateDate] [datetime] NULL,
	[PaymentMethodId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Event]    Script Date: 14-Oct-21 5:33:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Event](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[EventName] [varchar](128) NULL,
	[GroupID] [int] NOT NULL,
	[Location] [varchar](128) NULL,
	[ApprovalState] [int] NULL DEFAULT ((0)),
	[ImageUrl] [varchar](256) NULL,
	[IsDeleted] [bit] NOT NULL DEFAULT ((0)),
	[TimeOccur] [datetime] NULL,
	[IsExpired] [bit] NOT NULL DEFAULT ((0)),
	[CreateDate] [datetime] NULL DEFAULT (getdate()),
	[ModifyDate] [datetime] NULL DEFAULT (getdate()),
	[Price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GroupInformation]    Script Date: 14-Oct-21 5:33:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GroupInformation](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupImageUrl] [varchar](256) NULL,
	[IsDeleted] [bit] NOT NULL DEFAULT ((0)),
	[GroupName] [varchar](128) NOT NULL,
	[CreateDate] [datetime] NULL DEFAULT (getdate()),
	[ModifyDate] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 14-Oct-21 5:33:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationID] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](256) NULL,
	[Body] [nvarchar](256) NULL,
	[ImageUrl] [nvarchar](256) NULL,
	[UserFCMTokens] [varchar](max) NULL,
	[EventID] [int] NULL,
	[GroupID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[ModifyDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 14-Oct-21 5:33:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaymentMethod](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 14-Oct-21 5:33:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Rolename] [varchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 14-Oct-21 5:33:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[TicketID] [nchar](10) NOT NULL,
	[EventID] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ModifyDate] [datetime] NULL,
	[IsExpired] [bit] NOT NULL,
	[BookingID] [int] NOT NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserFCMToken]    Script Date: 14-Oct-21 5:33:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserFCMToken](
	[UserFCMId] [int] IDENTITY(1,1) NOT NULL,
	[FCMToken] [varchar](256) NULL,
	[UserID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserFCMId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserInformation]    Script Date: 14-Oct-21 5:33:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInformation](
	[UserID] [uniqueidentifier] NOT NULL,
	[RoleID] [int] NOT NULL,
	[Email] [varchar](128) NOT NULL,
	[Fullname] [varchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL DEFAULT ((0)),
	[AvatarUrl] [varchar](256) NULL,
	[CreateDate] [datetime] NULL DEFAULT (getdate()),
	[ModifyDate] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Event] ON 

INSERT [dbo].[Event] ([EventID], [EventName], [GroupID], [Location], [ApprovalState], [ImageUrl], [IsDeleted], [TimeOccur], [IsExpired], [CreateDate], [ModifyDate], [Price]) VALUES (1, N'ACM Contest', 1, N'Hall Of FPT University', 1, N'https://firebasestorage.googleapis.com/v0/b/fiep-e6602.appspot.com/o/event-acm-fcode.png?alt=media&token=adfcf71c-10c8-48fa-a49a-f75b38572aab', 0, CAST(N'2020-06-06 00:00:00.000' AS DateTime), 0, CAST(N'2021-10-07 00:34:54.110' AS DateTime), CAST(N'2021-10-07 00:34:54.110' AS DateTime), 50)
INSERT [dbo].[Event] ([EventID], [EventName], [GroupID], [Location], [ApprovalState], [ImageUrl], [IsDeleted], [TimeOccur], [IsExpired], [CreateDate], [ModifyDate], [Price]) VALUES (2, N'Tiktok conpetition', 3, N'F-Tech Tower', 1, N'https://firebasestorage.googleapis.com/v0/b/fiep-e6602.appspot.com/o/event-tiktok-intrument.jpg?alt=media&token=3eec5742-57c7-429b-9832-4c1574d25969', 0, CAST(N'2020-06-06 00:00:00.000' AS DateTime), 0, CAST(N'2021-10-07 00:34:54.113' AS DateTime), CAST(N'2021-10-07 00:34:54.113' AS DateTime), NULL)
INSERT [dbo].[Event] ([EventID], [EventName], [GroupID], [Location], [ApprovalState], [ImageUrl], [IsDeleted], [TimeOccur], [IsExpired], [CreateDate], [ModifyDate], [Price]) VALUES (3, N'Club celebration', 2, N'FSOFT-Town-1', 1, N'https://firebasestorage.googleapis.com/v0/b/fiep-e6602.appspot.com/o/event-daitho-fev.jpg?alt=media&token=336524d9-cd9d-4200-80ca-df75fabb32d2', 0, CAST(N'2020-06-06 00:00:00.000' AS DateTime), 0, CAST(N'2021-10-07 00:34:54.113' AS DateTime), CAST(N'2021-10-07 00:34:54.113' AS DateTime), NULL)
INSERT [dbo].[Event] ([EventID], [EventName], [GroupID], [Location], [ApprovalState], [ImageUrl], [IsDeleted], [TimeOccur], [IsExpired], [CreateDate], [ModifyDate], [Price]) VALUES (4, N'Guitar free style', 5, N'FSOFT-Town-2', 1, N'https://firebasestorage.googleapis.com/v0/b/fiep-e6602.appspot.com/o/event-yongguitar-guitar.jpg?alt=media&token=726b0bee-b68a-463f-9a87-51bc6a6bdcfd', 0, CAST(N'2020-06-06 00:00:00.000' AS DateTime), 0, CAST(N'2021-10-07 00:34:54.113' AS DateTime), CAST(N'2021-10-07 00:34:54.113' AS DateTime), NULL)
INSERT [dbo].[Event] ([EventID], [EventName], [GroupID], [Location], [ApprovalState], [ImageUrl], [IsDeleted], [TimeOccur], [IsExpired], [CreateDate], [ModifyDate], [Price]) VALUES (5, N'Reduce plastic together', 2, N'FSOFT-Town-3', 1, N'https://firebasestorage.googleapis.com/v0/b/fiep-e6602.appspot.com/o/event-plastic-fev.png?alt=media&token=0f72964b-c031-485b-a98d-ac01e31c3724', 0, CAST(N'2020-06-06 00:00:00.000' AS DateTime), 0, CAST(N'2021-10-07 00:34:54.113' AS DateTime), CAST(N'2021-10-07 00:34:54.113' AS DateTime), NULL)
INSERT [dbo].[Event] ([EventID], [EventName], [GroupID], [Location], [ApprovalState], [ImageUrl], [IsDeleted], [TimeOccur], [IsExpired], [CreateDate], [ModifyDate], [Price]) VALUES (6, N'Martial art for women day', 6, N'FPT Greenwich', 1, N'https://firebasestorage.googleapis.com/v0/b/fiep-e6602.appspot.com/o/event-womanday-vovinam.jpg?alt=media&token=e47a61a1-9c26-467a-9e78-eaeb0ff6378b', 0, CAST(N'2020-06-06 00:00:00.000' AS DateTime), 0, CAST(N'2021-10-07 00:34:54.143' AS DateTime), CAST(N'2021-10-07 00:34:54.143' AS DateTime), NULL)
INSERT [dbo].[Event] ([EventID], [EventName], [GroupID], [Location], [ApprovalState], [ImageUrl], [IsDeleted], [TimeOccur], [IsExpired], [CreateDate], [ModifyDate], [Price]) VALUES (7, N'copy of Tiktok conpetition', 3, N'F-Tech Tower', 1, N'https://firebasestorage.googleapis.com/v0/b/fiep-e6602.appspot.com/o/event-tiktok-intrument.jpg?alt=media&token=3eec5742-57c7-429b-9832-4c1574d25969', 0, CAST(N'2020-06-06 00:00:00.000' AS DateTime), 0, CAST(N'2021-10-07 00:34:54.113' AS DateTime), CAST(N'2021-10-07 00:34:54.113' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Event] OFF
SET IDENTITY_INSERT [dbo].[GroupInformation] ON 

INSERT [dbo].[GroupInformation] ([GroupID], [GroupImageUrl], [IsDeleted], [GroupName], [CreateDate], [ModifyDate]) VALUES (1, N'https://firebasestorage.googleapis.com/v0/b/fiep-e6602.appspot.com/o/f-code.jpg?alt=media&token=b09869eb-02aa-472a-bbb5-c46d7da0a833', 0, N'F-Code', CAST(N'2021-10-07 00:34:54.090' AS DateTime), CAST(N'2021-10-07 00:34:54.090' AS DateTime))
INSERT [dbo].[GroupInformation] ([GroupID], [GroupImageUrl], [IsDeleted], [GroupName], [CreateDate], [ModifyDate]) VALUES (2, N'https://firebasestorage.googleapis.com/v0/b/fiep-e6602.appspot.com/o/fev.jpg?alt=media&token=83d059b9-e682-476e-874f-c807b92f13c2', 0, N'FPT Event Club', CAST(N'2021-10-07 00:34:54.107' AS DateTime), CAST(N'2021-10-07 00:34:54.107' AS DateTime))
INSERT [dbo].[GroupInformation] ([GroupID], [GroupImageUrl], [IsDeleted], [GroupName], [CreateDate], [ModifyDate]) VALUES (3, N'https://firebasestorage.googleapis.com/v0/b/fiep-e6602.appspot.com/o/fpt-Intrument.jpg?alt=media&token=8cda66dd-d818-442f-a614-c9efe71f0ca8', 0, N'FPT Instrument Club', CAST(N'2021-10-07 00:34:54.107' AS DateTime), CAST(N'2021-10-07 00:34:54.107' AS DateTime))
INSERT [dbo].[GroupInformation] ([GroupID], [GroupImageUrl], [IsDeleted], [GroupName], [CreateDate], [ModifyDate]) VALUES (4, N'https://firebasestorage.googleapis.com/v0/b/fiep-e6602.appspot.com/o/F-chess.png?alt=media&token=e2f88c71-98f7-41ca-a780-1e2c5508d057', 0, N'FPT Chess Club', CAST(N'2021-10-07 00:34:54.107' AS DateTime), CAST(N'2021-10-07 00:34:54.107' AS DateTime))
INSERT [dbo].[GroupInformation] ([GroupID], [GroupImageUrl], [IsDeleted], [GroupName], [CreateDate], [ModifyDate]) VALUES (5, N'https://firebasestorage.googleapis.com/v0/b/fiep-e6602.appspot.com/o/fpt-guitar.jpg?alt=media&token=a40bc833-687e-4356-8f4d-0ba57add92f4', 0, N'FPT Guitar Club', CAST(N'2021-10-07 00:34:54.107' AS DateTime), CAST(N'2021-10-07 00:34:54.107' AS DateTime))
INSERT [dbo].[GroupInformation] ([GroupID], [GroupImageUrl], [IsDeleted], [GroupName], [CreateDate], [ModifyDate]) VALUES (6, N'https://firebasestorage.googleapis.com/v0/b/fiep-e6602.appspot.com/o/fpt-vovinam.jpg?alt=media&token=d46aa6b8-fab9-40bb-b753-9e82013b1801', 0, N'Fpt Vovinam Club', CAST(N'2021-10-07 00:34:54.107' AS DateTime), CAST(N'2021-10-07 00:34:54.107' AS DateTime))
SET IDENTITY_INSERT [dbo].[GroupInformation] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [Rolename]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([RoleID], [Rolename]) VALUES (2, N'user')
INSERT [dbo].[Role] ([RoleID], [Rolename]) VALUES (3, N'groupmanager')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[UserFCMToken] ON 

INSERT [dbo].[UserFCMToken] ([UserFCMId], [FCMToken], [UserID]) VALUES (1, N'dK1pPIODQdC5w6Ww7d2uQi:APA91bGkkfiB8LUhPJFo7wybBUx6RFNdh3RcEgcjpCeVrxPUxGxKqribb8N6lQqYuMSMxmsobsxMTvci4aFeScm8D6mPEY9Yta1F7ppQ6cSziJCedHjDGwY9_z8g9IQxzatCbArBM1Ol', N'1d8c8527-e1f4-4a77-85ee-68c15f927817')
SET IDENTITY_INSERT [dbo].[UserFCMToken] OFF
INSERT [dbo].[UserInformation] ([UserID], [RoleID], [Email], [Fullname], [IsDeleted], [AvatarUrl], [CreateDate], [ModifyDate]) VALUES (N'd6076f10-bed3-4d76-9745-120a3794e8f7', 3, N'thanhncse130743@fpt.edu.vn', N'Nguyen Chanh Thanh', 0, N'https://firebasestorage.googleapis.com/v0/b/fiep-e6602.appspot.com/o/usericon.png?alt=media&token=4526116b-dc87-4d06-ae47-1d4fb730474c', CAST(N'2021-10-07 00:34:54.090' AS DateTime), CAST(N'2021-10-07 00:34:54.090' AS DateTime))
INSERT [dbo].[UserInformation] ([UserID], [RoleID], [Email], [Fullname], [IsDeleted], [AvatarUrl], [CreateDate], [ModifyDate]) VALUES (N'dc70a164-619f-4502-887e-2a04465f288f', 2, N'tuannase130462@fpt.edu.vn', N'Nguyen Anh Tuan', 0, N'https://firebasestorage.googleapis.com/v0/b/fiep-e6602.appspot.com/o/usericon.png?alt=media&token=4526116b-dc87-4d06-ae47-1d4fb730474c', CAST(N'2021-10-07 00:34:54.090' AS DateTime), CAST(N'2021-10-07 00:34:54.090' AS DateTime))
INSERT [dbo].[UserInformation] ([UserID], [RoleID], [Email], [Fullname], [IsDeleted], [AvatarUrl], [CreateDate], [ModifyDate]) VALUES (N'1d8c8527-e1f4-4a77-85ee-68c15f927817', 1, N'nhanvtse130478@fpt.edu.vn', N'Vo Thanh Nhan', 0, N'https://firebasestorage.googleapis.com/v0/b/fiep-e6602.appspot.com/o/usericon.png?alt=media&token=4526116b-dc87-4d06-ae47-1d4fb730474c', CAST(N'2021-10-07 00:34:54.090' AS DateTime), CAST(N'2021-10-07 00:34:54.090' AS DateTime))
INSERT [dbo].[UserInformation] ([UserID], [RoleID], [Email], [Fullname], [IsDeleted], [AvatarUrl], [CreateDate], [ModifyDate]) VALUES (N'f90e94fa-6b29-4a5a-993c-94b153ef81b2', 1, N'nguyenhoanghuy@fpt.edu.vn', N'Nguyen Hoang Huy', 0, N'https://firebasestorage.googleapis.com/v0/b/fiep-e6602.appspot.com/o/usericon.png?alt=media&token=4526116b-dc87-4d06-ae47-1d4fb730474c', CAST(N'2021-10-07 00:34:54.090' AS DateTime), CAST(N'2021-10-07 00:34:54.090' AS DateTime))
INSERT [dbo].[UserInformation] ([UserID], [RoleID], [Email], [Fullname], [IsDeleted], [AvatarUrl], [CreateDate], [ModifyDate]) VALUES (N'daf78774-feb8-46ab-b8ab-de1439559ed8', 3, N'thanquocbinh@fpt.edu.vn', N'Thanh Quoc Binh', 0, N'https://firebasestorage.googleapis.com/v0/b/fiep-e6602.appspot.com/o/usericon.png?alt=media&token=4526116b-dc87-4d06-ae47-1d4fb730474c', CAST(N'2021-10-07 00:34:54.090' AS DateTime), CAST(N'2021-10-07 00:34:54.090' AS DateTime))
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__UserFCMT__BBACE64EEF9DBE74]    Script Date: 14-Oct-21 5:33:17 PM ******/
ALTER TABLE [dbo].[UserFCMToken] ADD UNIQUE NONCLUSTERED 
(
	[FCMToken] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__UserInfo__A9D10534799824D9]    Script Date: 14-Oct-21 5:33:17 PM ******/
ALTER TABLE [dbo].[UserInformation] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Booking] ADD  DEFAULT ((1)) FOR [IsSuccess]
GO
ALTER TABLE [dbo].[Booking] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Notification] ADD  DEFAULT (NULL) FOR [UserFCMTokens]
GO
ALTER TABLE [dbo].[Notification] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Notification] ADD  DEFAULT (getdate()) FOR [ModifyDate]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([PaymentMethodId])
REFERENCES [dbo].[PaymentMethod] ([PaymentID])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInformation] ([UserID])
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD FOREIGN KEY([GroupID])
REFERENCES [dbo].[GroupInformation] ([GroupID])
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD FOREIGN KEY([GroupID])
REFERENCES [dbo].[GroupInformation] ([GroupID])
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Booking]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Event] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Event]
GO
ALTER TABLE [dbo].[UserFCMToken]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInformation] ([UserID])
GO
ALTER TABLE [dbo].[UserInformation]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [DB_TicketBox] SET  READ_WRITE 
GO
