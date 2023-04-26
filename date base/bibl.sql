USE [master]
GO
/****** Object:  Database [Bibliteka]    Script Date: 26.04.2023 12:27:30 ******/
CREATE DATABASE [Bibliteka]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bibliteka', FILENAME = N'C:\SQL2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\Bibliteka.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bibliteka_log', FILENAME = N'C:\SQL2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\Bibliteka_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Bibliteka] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bibliteka].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bibliteka] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bibliteka] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bibliteka] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bibliteka] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bibliteka] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bibliteka] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bibliteka] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bibliteka] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bibliteka] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bibliteka] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bibliteka] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bibliteka] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bibliteka] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bibliteka] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bibliteka] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bibliteka] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bibliteka] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bibliteka] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bibliteka] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bibliteka] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bibliteka] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bibliteka] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bibliteka] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bibliteka] SET  MULTI_USER 
GO
ALTER DATABASE [Bibliteka] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bibliteka] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bibliteka] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bibliteka] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bibliteka] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bibliteka] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Bibliteka] SET QUERY_STORE = OFF
GO
USE [Bibliteka]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 26.04.2023 12:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[author] [nvarchar](50) NULL,
	[genre] [nvarchar](50) NULL,
	[year] [int] NULL,
	[Quantity] [int] NULL,
	[Availability] [bit] NULL,
	[Cost] [int] NULL,
	[Pages] [int] NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Peoples]    Script Date: 26.04.2023 12:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Peoples](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[book_name] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[surname] [nvarchar](50) NULL,
	[patronymic] [nvarchar](50) NULL,
	[genre] [nvarchar](50) NULL,
	[Pages] [int] NULL,
	[Cost] [int] NULL,
	[date_issue] [date] NULL,
	[date_admission] [date] NULL,
	[book_availability] [bit] NULL,
 CONSTRAINT [PK_Applications] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 26.04.2023 12:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[surname] [nvarchar](50) NULL,
	[patronymic] [nvarchar](50) NULL,
	[login] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[Role] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([id], [name], [author], [genre], [year], [Quantity], [Availability], [Cost], [Pages]) VALUES (1, N'Атака титанов', N'Хадзимэ Исаяма', N'боевик', 2013, 16, 1, 452, 776)
INSERT [dbo].[Book] ([id], [name], [author], [genre], [year], [Quantity], [Availability], [Cost], [Pages]) VALUES (2, N'Токийский гуль', N'Суи Исида', N'грусть', 2014, 1, 0, 0, 456)
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[Peoples] ON 

INSERT [dbo].[Peoples] ([id], [book_name], [name], [surname], [patronymic], [genre], [Pages], [Cost], [date_issue], [date_admission], [book_availability]) VALUES (1, N'атака титанов', N'Иван', N'Иванов', N'Витальевич', N'боевик', 776, 450, CAST(N'2022-10-12' AS Date), CAST(N'2022-10-13' AS Date), 1)
INSERT [dbo].[Peoples] ([id], [book_name], [name], [surname], [patronymic], [genre], [Pages], [Cost], [date_issue], [date_admission], [book_availability]) VALUES (2, N'токийский гуль', N'Максим', N'Владыкин', N'Алексеевич', N'грусть', 666, 0, CAST(N'2022-10-12' AS Date), CAST(N'2022-10-13' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Peoples] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [name], [surname], [patronymic], [login], [password], [Role]) VALUES (1, N'Яна', N'Александрова', N'Львовна', N'555', N'666', 0)
INSERT [dbo].[User] ([id], [name], [surname], [patronymic], [login], [password], [Role]) VALUES (2, N'Ольга', N'Козлова', N'Николаевна', N'королева', N'мира', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
USE [master]
GO
ALTER DATABASE [Bibliteka] SET  READ_WRITE 
GO
