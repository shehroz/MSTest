USE [master]
GO
/****** Object:  Database [MasafiDB2]    Script Date: 01/11/2020 5:12:16 AM ******/
CREATE DATABASE [MasafiDB2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MasafiDB2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\MasafiDB2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MasafiDB2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\MasafiDB2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MasafiDB2] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MasafiDB2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MasafiDB2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MasafiDB2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MasafiDB2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MasafiDB2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MasafiDB2] SET ARITHABORT OFF 
GO
ALTER DATABASE [MasafiDB2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MasafiDB2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MasafiDB2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MasafiDB2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MasafiDB2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MasafiDB2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MasafiDB2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MasafiDB2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MasafiDB2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MasafiDB2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MasafiDB2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MasafiDB2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MasafiDB2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MasafiDB2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MasafiDB2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MasafiDB2] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [MasafiDB2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MasafiDB2] SET RECOVERY FULL 
GO
ALTER DATABASE [MasafiDB2] SET  MULTI_USER 
GO
ALTER DATABASE [MasafiDB2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MasafiDB2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MasafiDB2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MasafiDB2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MasafiDB2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MasafiDB2] SET QUERY_STORE = OFF
GO
USE [MasafiDB2]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [MasafiDB2]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 01/11/2020 5:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 01/11/2020 5:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 01/11/2020 5:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 01/11/2020 5:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 01/11/2020 5:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 01/11/2020 5:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[UserType] [varchar](20) NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 01/11/2020 5:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[City]    Script Date: 01/11/2020 5:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Location]    Script Date: 01/11/2020 5:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) NULL,
	[Latitude] [nvarchar](max) NULL,
	[Longitude] [nvarchar](max) NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_GoogleMap] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NumberSequence]    Script Date: 01/11/2020 5:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumberSequence](
	[NumberSequenceId] [int] IDENTITY(1,1) NOT NULL,
	[LastNumber] [int] NOT NULL,
	[Module] [nvarchar](max) NOT NULL,
	[NumberSequenceName] [nvarchar](max) NOT NULL,
	[Prefix] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_NumberSequence] PRIMARY KEY CLUSTERED 
(
	[NumberSequenceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Salesman]    Script Date: 01/11/2020 5:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salesman](
	[SalesmanId] [int] IDENTITY(1,1) NOT NULL,
	[SalesmanName] [nvarchar](max) NOT NULL,
	[SupervisorId] [int] NULL,
	[CityId] [int] NULL,
	[LocationId] [int] NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_Salesman] PRIMARY KEY CLUSTERED 
(
	[SalesmanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesTarget]    Script Date: 01/11/2020 5:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesTarget](
	[SalestargetId] [int] IDENTITY(1,1) NOT NULL,
	[WaterValue1] [float] NOT NULL,
	[WaterValue2] [float] NOT NULL,
	[WaterValue3] [float] NOT NULL,
	[JuiceValue1] [float] NOT NULL,
	[JuiceValue2] [float] NOT NULL,
	[JuiceValue3] [float] NOT NULL,
	[TotalValue1] [float] NOT NULL,
	[TotalValue2] [float] NOT NULL,
	[TotalValue3] [float] NOT NULL,
	[SalesmanId] [int] NULL,
	[Status] [char](10) NULL,
 CONSTRAINT [PK_SalesTarget] PRIMARY KEY CLUSTERED 
(
	[SalestargetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesTargetLocation]    Script Date: 01/11/2020 5:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesTargetLocation](
	[SalesTargetLocationId] [int] IDENTITY(1,1) NOT NULL,
	[LocationPin] [nvarchar](max) NOT NULL,
	[SalesmanId] [int] NULL,
	[SalestargetId] [int] NOT NULL,
 CONSTRAINT [PK_SalesTargetLocation] PRIMARY KEY CLUSTERED 
(
	[SalestargetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supervisor]    Script Date: 01/11/2020 5:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supervisor](
	[SupervisorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CityId] [int] NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_Supervisor] PRIMARY KEY CLUSTERED 
(
	[SupervisorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 01/11/2020 5:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserProfileId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationUserId] [nvarchar](max) NULL,
	[ConfirmPassword] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[OldPassword] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[ProfilePicture] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED 
(
	[UserProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'00b03335-bc29-4762-ac5e-3be07fc8f548', N'72eb610e-2f6a-4043-904d-a8be21412e73', N'Salesman View', N'SALESMAN VIEW')
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'0ab18bf5-43a9-4fca-84a8-2e2978671a71', N'd9d122e0-a293-4a38-b55c-7e3052e7649d', N'Salesman Location', N'SALESMAN LOCATION')
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'226daf0b-6139-445c-8e95-abdfd083aeff', N'5d6eebe1-3acd-46eb-9522-3d1e5c762945', N'Role', N'ROLE')
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'310b4637-119a-486a-8133-98f8c245df23', N'b13ec91e-1775-4c5e-90a4-9bca72d6b3b2', N'Sales Target View', N'SALES TARGET VIEW')
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'3482d5a4-8b39-444c-91ea-0f568c872b97', N'21fd8818-3faf-457b-9368-79ed0c2af795', N'Change Password', N'CHANGE PASSWORD')
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'47febe06-99ba-4185-93b0-6d96bdf79e4b', N'8ac6bb28-317e-41fe-9e0a-a612806e7a09', N'User', N'USER')
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'6cfd25ad-7f6b-4650-9c38-b4e012f4e57a', N'224cc93f-7cab-47e8-b042-9b2b321c7f60', N'Dashboard Main', N'DASHBOARD MAIN')
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'8ca11469-8423-4e71-b7ab-f354920ada77', N'ae198aeb-3b31-4b8f-841b-f2d1da9aa9f1', N'Change Role', N'CHANGE ROLE')
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'953a32f2-060e-474e-b50f-8afc363ab55e', N'29dfe676-3012-47d0-9e1d-f1141825daa3', N'Sales Target', N'SALES TARGET')
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'd5012a17-ce96-416c-9d60-00a9c7aae0a8', N'790e81e5-1385-4504-86c7-7ed43c6d201a', N'Salesman Supervisor', N'SALESMAN SUPERVISOR')
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'fdb85fbf-7351-473d-8dba-34010f88396f', N'95417e91-708c-47ac-8b92-fea6ea3bc04c', N'Salesman', N'SALESMAN')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0af620a9-4b83-4c17-8a7b-dc54871c0655', N'00b03335-bc29-4762-ac5e-3be07fc8f548')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5eb63b2f-0d3c-40a7-8cea-d224b312178d', N'00b03335-bc29-4762-ac5e-3be07fc8f548')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5eb63b2f-0d3c-40a7-8cea-d224b312178d', N'0ab18bf5-43a9-4fca-84a8-2e2978671a71')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0af620a9-4b83-4c17-8a7b-dc54871c0655', N'226daf0b-6139-445c-8e95-abdfd083aeff')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0af620a9-4b83-4c17-8a7b-dc54871c0655', N'310b4637-119a-486a-8133-98f8c245df23')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5e8afd79-cbcc-40ea-bd5b-f4faea27d388', N'310b4637-119a-486a-8133-98f8c245df23')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0af620a9-4b83-4c17-8a7b-dc54871c0655', N'47febe06-99ba-4185-93b0-6d96bdf79e4b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'05c200e7-fb66-4522-a626-b7b6b5bd1f2d', N'6cfd25ad-7f6b-4650-9c38-b4e012f4e57a')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0af620a9-4b83-4c17-8a7b-dc54871c0655', N'6cfd25ad-7f6b-4650-9c38-b4e012f4e57a')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5e8afd79-cbcc-40ea-bd5b-f4faea27d388', N'6cfd25ad-7f6b-4650-9c38-b4e012f4e57a')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5eb63b2f-0d3c-40a7-8cea-d224b312178d', N'6cfd25ad-7f6b-4650-9c38-b4e012f4e57a')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0af620a9-4b83-4c17-8a7b-dc54871c0655', N'8ca11469-8423-4e71-b7ab-f354920ada77')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0af620a9-4b83-4c17-8a7b-dc54871c0655', N'953a32f2-060e-474e-b50f-8afc363ab55e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5eb63b2f-0d3c-40a7-8cea-d224b312178d', N'953a32f2-060e-474e-b50f-8afc363ab55e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'05c200e7-fb66-4522-a626-b7b6b5bd1f2d', N'd5012a17-ce96-416c-9d60-00a9c7aae0a8')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0af620a9-4b83-4c17-8a7b-dc54871c0655', N'd5012a17-ce96-416c-9d60-00a9c7aae0a8')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0af620a9-4b83-4c17-8a7b-dc54871c0655', N'fdb85fbf-7351-473d-8dba-34010f88396f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5e8afd79-cbcc-40ea-bd5b-f4faea27d388', N'fdb85fbf-7351-473d-8dba-34010f88396f')
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [UserType], [UserId]) VALUES (N'05c200e7-fb66-4522-a626-b7b6b5bd1f2d', 0, N'ce9d9755-400d-49dd-971a-efbcf3168a98', N'super1@admin.com', 1, 0, NULL, N'SUPER1@ADMIN.COM', N'SUPER1@ADMIN.COM', N'AQAAAAEAACcQAAAAEDK4hkAcse9kcdmFIk9jAu+hNT7liZeI+LBq1pXAp7bCTaa9ERbOWUHBNdm9qtnkbg==', NULL, 0, N'd79cdb67-87f4-4a14-ab2d-148bd929d880', 0, N'super1@admin.com', N'SUPERVISOR', 1)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [UserType], [UserId]) VALUES (N'0af620a9-4b83-4c17-8a7b-dc54871c0655', 0, N'd2d26c99-5d93-42e7-b931-5163b96c411b', N'super@admin.com', 1, 0, NULL, N'SUPER@ADMIN.COM', N'SUPER@ADMIN.COM', N'AQAAAAEAACcQAAAAEDK4hkAcse9kcdmFIk9jAu+hNT7liZeI+LBq1pXAp7bCTaa9ERbOWUHBNdm9qtnkbg==', NULL, 0, N'74c6d119-7146-42b3-ae34-ffcd655a6476', 0, N'super@admin.com', N'ADMIN', 100)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [UserType], [UserId]) VALUES (N'5e8afd79-cbcc-40ea-bd5b-f4faea27d388', 0, N'150e6808-2f82-42a1-ad7b-3e3a2db088ae', N'userA@admin.com', 1, 0, NULL, N'USERA@ADMIN.COM', N'USERA@ADMIN.COM', N'AQAAAAEAACcQAAAAEDK4hkAcse9kcdmFIk9jAu+hNT7liZeI+LBq1pXAp7bCTaa9ERbOWUHBNdm9qtnkbg==', NULL, 0, N'e0f23c11-b19b-42a2-bf80-0e3a4485e64f', 0, N'userA@admin.com', N'USERA', 0)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [UserType], [UserId]) VALUES (N'5eb63b2f-0d3c-40a7-8cea-d224b312178d', 0, N'd64bb3d5-ed47-4b72-bf44-2bc58168646f', N'userb@admin.com', 1, 0, NULL, N'USERB@ADMIN.COM', N'USERB@ADMIN.COM', N'AQAAAAEAACcQAAAAEHkuL8L8FhLJUJZdptrGU63anxxfkGc3NadjiqtJ+hYuFzm6uNw9Gx73ZX1pdTKzcg==', NULL, 0, N'683f8a02-3fed-4201-926a-39d52bb00596', 0, N'userb@admin.com', N'USERB', 0)
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityId], [CityName]) VALUES (1, N'Dubai')
INSERT [dbo].[City] ([CityId], [CityName]) VALUES (2, N'Abu Dhabi')
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([LocationId], [CityName], [Latitude], [Longitude], [Description]) VALUES (1, N'Dubai', N'25.3058229', N'55.3447672', N'Al Mamzar')
INSERT [dbo].[Location] ([LocationId], [CityName], [Latitude], [Longitude], [Description]) VALUES (2, N'Abu Dhabi', N'25.0778053', N'55.1260686', N'Jumeirah Beach Residence')
SET IDENTITY_INSERT [dbo].[Location] OFF
SET IDENTITY_INSERT [dbo].[NumberSequence] ON 

INSERT [dbo].[NumberSequence] ([NumberSequenceId], [LastNumber], [Module], [NumberSequenceName], [Prefix]) VALUES (1, 1, N'PO', N'PO', N'PO')
INSERT [dbo].[NumberSequence] ([NumberSequenceId], [LastNumber], [Module], [NumberSequenceName], [Prefix]) VALUES (2, 1, N'SO', N'SO', N'SO')
SET IDENTITY_INSERT [dbo].[NumberSequence] OFF
SET IDENTITY_INSERT [dbo].[Salesman] ON 

INSERT [dbo].[Salesman] ([SalesmanId], [SalesmanName], [SupervisorId], [CityId], [LocationId], [Email]) VALUES (3, N'Ali Akbar', 1, 1, 1, N'salesman3@gmail.com')
INSERT [dbo].[Salesman] ([SalesmanId], [SalesmanName], [SupervisorId], [CityId], [LocationId], [Email]) VALUES (7, N'Amjad', 1, 2, 2, N'salesman7@gmail.com')
SET IDENTITY_INSERT [dbo].[Salesman] OFF
SET IDENTITY_INSERT [dbo].[SalesTarget] ON 

INSERT [dbo].[SalesTarget] ([SalestargetId], [WaterValue1], [WaterValue2], [WaterValue3], [JuiceValue1], [JuiceValue2], [JuiceValue3], [TotalValue1], [TotalValue2], [TotalValue3], [SalesmanId], [Status]) VALUES (1, 4, 4, 8, 5, 5, 10, 9, 9, 18, 3, N'APPROVED  ')
INSERT [dbo].[SalesTarget] ([SalestargetId], [WaterValue1], [WaterValue2], [WaterValue3], [JuiceValue1], [JuiceValue2], [JuiceValue3], [TotalValue1], [TotalValue2], [TotalValue3], [SalesmanId], [Status]) VALUES (2, 2, 3, 5, 5, 4, 9, 7, 7, 14, 7, N'APPROVED  ')
SET IDENTITY_INSERT [dbo].[SalesTarget] OFF
SET IDENTITY_INSERT [dbo].[Supervisor] ON 

INSERT [dbo].[Supervisor] ([SupervisorId], [Name], [CityId], [Email]) VALUES (1, N'Supervisor1', 1, N'super1@admin.com')
INSERT [dbo].[Supervisor] ([SupervisorId], [Name], [CityId], [Email]) VALUES (2, N'Supervisor2', 1, N'super2@admin.com')
INSERT [dbo].[Supervisor] ([SupervisorId], [Name], [CityId], [Email]) VALUES (3, N'Supervisor3', 2, N'super3@admin.com')
INSERT [dbo].[Supervisor] ([SupervisorId], [Name], [CityId], [Email]) VALUES (4, N'Supervisor4', 2, N'super@admin.com')
SET IDENTITY_INSERT [dbo].[Supervisor] OFF
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([UserProfileId], [ApplicationUserId], [ConfirmPassword], [Email], [FirstName], [LastName], [OldPassword], [Password], [ProfilePicture]) VALUES (1, N'0af620a9-4b83-4c17-8a7b-dc54871c0655', NULL, N'super@admin.com', N'Super', N'Admin', NULL, NULL, N'/upload/blank-person.png')
INSERT [dbo].[UserProfile] ([UserProfileId], [ApplicationUserId], [ConfirmPassword], [Email], [FirstName], [LastName], [OldPassword], [Password], [ProfilePicture]) VALUES (2, N'05c200e7-fb66-4522-a626-b7b6b5bd1f2d', N'AQAAAAEAACcQAAAAELsRGkYAYksOYZPk/+3+y7vpBh2YsCMBVwnuCYIhQfPlXHdhywk9zCE0E/WwACEDWw==', N'super1@admin.com', N'Shehroz', N'Khan', NULL, N'AQAAAAEAACcQAAAAELsRGkYAYksOYZPk/+3+y7vpBh2YsCMBVwnuCYIhQfPlXHdhywk9zCE0E/WwACEDWw==', N'/upload/blank-person.png')
INSERT [dbo].[UserProfile] ([UserProfileId], [ApplicationUserId], [ConfirmPassword], [Email], [FirstName], [LastName], [OldPassword], [Password], [ProfilePicture]) VALUES (3, N'5e8afd79-cbcc-40ea-bd5b-f4faea27d388', N'AQAAAAEAACcQAAAAEAUls+A8fPedKURH6ZZAfekrk/ozhAVPBARfgnKkLDK03dOlT9qjWRl2hVrMqKkYsw==', N'userA@admin.com', N'UserA', N'UserA', NULL, N'AQAAAAEAACcQAAAAEAUls+A8fPedKURH6ZZAfekrk/ozhAVPBARfgnKkLDK03dOlT9qjWRl2hVrMqKkYsw==', N'/upload/blank-person.png')
INSERT [dbo].[UserProfile] ([UserProfileId], [ApplicationUserId], [ConfirmPassword], [Email], [FirstName], [LastName], [OldPassword], [Password], [ProfilePicture]) VALUES (5, N'5eb63b2f-0d3c-40a7-8cea-d224b312178d', N'AQAAAAEAACcQAAAAEHkuL8L8FhLJUJZdptrGU63anxxfkGc3NadjiqtJ+hYuFzm6uNw9Gx73ZX1pdTKzcg==', N'userb@admin.com', N'userb', N'userb', NULL, N'AQAAAAEAACcQAAAAEHkuL8L8FhLJUJZdptrGU63anxxfkGc3NadjiqtJ+hYuFzm6uNw9Gx73ZX1pdTKzcg==', N'/upload/blank-person.png')
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 01/11/2020 5:12:16 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 01/11/2020 5:12:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 01/11/2020 5:12:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [EmailIndex]    Script Date: 01/11/2020 5:12:16 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 01/11/2020 5:12:16 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT ((0)) FOR [UserId]
GO
ALTER TABLE [dbo].[SalesTarget] ADD  DEFAULT ('PENDING') FOR [Status]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Salesman]  WITH CHECK ADD FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([LocationId])
GO
ALTER TABLE [dbo].[Supervisor]  WITH CHECK ADD FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([CityId])
GO
USE [master]
GO
ALTER DATABASE [MasafiDB2] SET  READ_WRITE 
GO
