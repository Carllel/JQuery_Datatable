USE [master]
GO
/****** Object:  Database [FSDC]    Script Date: 7/19/2018 12:47:30 PM ******/
CREATE DATABASE [FSDC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FSDC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\FSDC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FSDC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\FSDC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FSDC] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FSDC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FSDC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FSDC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FSDC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FSDC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FSDC] SET ARITHABORT OFF 
GO
ALTER DATABASE [FSDC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FSDC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FSDC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FSDC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FSDC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FSDC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FSDC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FSDC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FSDC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FSDC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FSDC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FSDC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FSDC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FSDC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FSDC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FSDC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FSDC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FSDC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FSDC] SET  MULTI_USER 
GO
ALTER DATABASE [FSDC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FSDC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FSDC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FSDC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FSDC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FSDC] SET QUERY_STORE = OFF
GO
USE [FSDC]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [FSDC]
GO
/****** Object:  Table [dbo].[position]    Script Date: 7/19/2018 12:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[position](
	[position_id] [int] NOT NULL,
	[prosition_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_position] PRIMARY KEY CLUSTERED 
(
	[position_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[project]    Script Date: 7/19/2018 12:47:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project](
	[project_id] [int] IDENTITY(1000,1) NOT NULL,
	[project_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_project] PRIMARY KEY CLUSTERED 
(
	[project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staff]    Script Date: 7/19/2018 12:47:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff](
	[staff_id] [int] IDENTITY(101000,1) NOT NULL,
	[fname] [nvarchar](250) NULL,
	[lname] [nvarchar](250) NULL,
	[position_id] [int] NOT NULL,
	[project_id] [int] NULL,
 CONSTRAINT [PK_staff] PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staff_projects]    Script Date: 7/19/2018 12:47:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff_projects](
	[Id] [int] IDENTITY(60000,1) NOT NULL,
	[staff_id] [int] NULL,
	[project_id] [int] NULL,
 CONSTRAINT [PK_staff_projects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[position] ([position_id], [prosition_name]) VALUES (10, N'Programmer')
INSERT [dbo].[position] ([position_id], [prosition_name]) VALUES (11, N'Software Analyst')
INSERT [dbo].[position] ([position_id], [prosition_name]) VALUES (20, N'Developer')
INSERT [dbo].[position] ([position_id], [prosition_name]) VALUES (21, N'Quality Assurance Tester')
INSERT [dbo].[position] ([position_id], [prosition_name]) VALUES (40, N'Analyst')
SET IDENTITY_INSERT [dbo].[project] ON 

INSERT [dbo].[project] ([project_id], [project_name]) VALUES (1000, N'Mobile App')
INSERT [dbo].[project] ([project_id], [project_name]) VALUES (1001, N'Ecommerce Portal')
INSERT [dbo].[project] ([project_id], [project_name]) VALUES (1002, N'Business Website')
INSERT [dbo].[project] ([project_id], [project_name]) VALUES (1003, N'BI Dashboard')
SET IDENTITY_INSERT [dbo].[project] OFF
SET IDENTITY_INSERT [dbo].[staff] ON 

INSERT [dbo].[staff] ([staff_id], [fname], [lname], [position_id], [project_id]) VALUES (101002, N'Sunil', N'Rapghan', 11, 1001)
INSERT [dbo].[staff] ([staff_id], [fname], [lname], [position_id], [project_id]) VALUES (101003, N'Jane', N'Doe', 20, 1001)
INSERT [dbo].[staff] ([staff_id], [fname], [lname], [position_id], [project_id]) VALUES (101007, N'Philip', N'Gordon', 11, NULL)
INSERT [dbo].[staff] ([staff_id], [fname], [lname], [position_id], [project_id]) VALUES (101009, N'Raghu', N'Akana', 20, NULL)
INSERT [dbo].[staff] ([staff_id], [fname], [lname], [position_id], [project_id]) VALUES (101010, N'Samuel', N'Edwards', 10, 1001)
INSERT [dbo].[staff] ([staff_id], [fname], [lname], [position_id], [project_id]) VALUES (101011, N'carllel', N'colquhoun', 20, 1003)
SET IDENTITY_INSERT [dbo].[staff] OFF
SET IDENTITY_INSERT [dbo].[staff_projects] ON 

INSERT [dbo].[staff_projects] ([Id], [staff_id], [project_id]) VALUES (60006, 101003, 1002)
INSERT [dbo].[staff_projects] ([Id], [staff_id], [project_id]) VALUES (60007, 101003, 1003)
INSERT [dbo].[staff_projects] ([Id], [staff_id], [project_id]) VALUES (60010, 101003, 1000)
INSERT [dbo].[staff_projects] ([Id], [staff_id], [project_id]) VALUES (60026, 101011, 1001)
SET IDENTITY_INSERT [dbo].[staff_projects] OFF
ALTER TABLE [dbo].[staff]  WITH CHECK ADD  CONSTRAINT [FK_staff_position] FOREIGN KEY([position_id])
REFERENCES [dbo].[position] ([position_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[staff] CHECK CONSTRAINT [FK_staff_position]
GO
ALTER TABLE [dbo].[staff]  WITH CHECK ADD  CONSTRAINT [FK_staff_project] FOREIGN KEY([project_id])
REFERENCES [dbo].[project] ([project_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[staff] CHECK CONSTRAINT [FK_staff_project]
GO
ALTER TABLE [dbo].[staff_projects]  WITH CHECK ADD  CONSTRAINT [FK_staff_projects_project] FOREIGN KEY([project_id])
REFERENCES [dbo].[project] ([project_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[staff_projects] CHECK CONSTRAINT [FK_staff_projects_project]
GO
ALTER TABLE [dbo].[staff_projects]  WITH CHECK ADD  CONSTRAINT [FK_staff_projects_staff] FOREIGN KEY([staff_id])
REFERENCES [dbo].[staff] ([staff_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[staff_projects] CHECK CONSTRAINT [FK_staff_projects_staff]
GO
USE [master]
GO
ALTER DATABASE [FSDC] SET  READ_WRITE 
GO
