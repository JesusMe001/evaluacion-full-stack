USE [bd_evaluacion]
GO
ALTER TABLE [dbo].[Transactions] DROP CONSTRAINT [CK__Transacti__Trans__3B75D760]
GO
ALTER TABLE [dbo].[Transactions] DROP CONSTRAINT [FK_Transactions_Products]
GO
ALTER TABLE [dbo].[Transactions] DROP CONSTRAINT [DF__Transactio__Date__3A81B327]
GO
ALTER TABLE [dbo].[Products] DROP CONSTRAINT [DF__Products__Create__37A5467C]
GO
/****** Object:  Index [IX_Transactions_ProductId]    Script Date: 20/05/2025 23:02:40 ******/
DROP INDEX [IX_Transactions_ProductId] ON [dbo].[Transactions]
GO
/****** Object:  Index [IX_Transactions_Date]    Script Date: 20/05/2025 23:02:40 ******/
DROP INDEX [IX_Transactions_Date] ON [dbo].[Transactions]
GO
/****** Object:  Index [IX_Products_Name]    Script Date: 20/05/2025 23:02:40 ******/
DROP INDEX [IX_Products_Name] ON [dbo].[Products]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 20/05/2025 23:02:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Transactions]') AND type in (N'U'))
DROP TABLE [dbo].[Transactions]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 20/05/2025 23:02:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
DROP TABLE [dbo].[Products]
GO
USE [master]
GO
/****** Object:  Database [bd_evaluacion]    Script Date: 20/05/2025 23:02:40 ******/
DROP DATABASE [bd_evaluacion]
GO
/****** Object:  Database [bd_evaluacion]    Script Date: 20/05/2025 23:02:40 ******/
CREATE DATABASE [bd_evaluacion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bd_evaluacion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\bd_evaluacion.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bd_evaluacion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\bd_evaluacion_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [bd_evaluacion] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bd_evaluacion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bd_evaluacion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bd_evaluacion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bd_evaluacion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bd_evaluacion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bd_evaluacion] SET ARITHABORT OFF 
GO
ALTER DATABASE [bd_evaluacion] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [bd_evaluacion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bd_evaluacion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bd_evaluacion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bd_evaluacion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bd_evaluacion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bd_evaluacion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bd_evaluacion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bd_evaluacion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bd_evaluacion] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bd_evaluacion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bd_evaluacion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bd_evaluacion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bd_evaluacion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bd_evaluacion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bd_evaluacion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bd_evaluacion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bd_evaluacion] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bd_evaluacion] SET  MULTI_USER 
GO
ALTER DATABASE [bd_evaluacion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bd_evaluacion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bd_evaluacion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bd_evaluacion] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bd_evaluacion] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bd_evaluacion] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [bd_evaluacion] SET QUERY_STORE = ON
GO
ALTER DATABASE [bd_evaluacion] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [bd_evaluacion]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 20/05/2025 23:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[Category] [nvarchar](100) NOT NULL,
	[ImageUrl] [nvarchar](255) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Stock] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 20/05/2025 23:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[TransactionType] [nvarchar](10) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[TotalPrice]  AS ([Quantity]*[UnitPrice]) PERSISTED,
	[Detail] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [Category], [ImageUrl], [Price], [Stock], [CreatedAt]) VALUES (1, N'Laptop Lenovo', N'Laptop con procesador Intel i5', N'Tecnología', N'https://example.com/laptop.jpg', CAST(750.00 AS Decimal(18, 2)), 10, CAST(N'2025-05-20T22:44:46.557' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Category], [ImageUrl], [Price], [Stock], [CreatedAt]) VALUES (2, N'Mouse Logitech', N'Mouse inalámbrico', N'Accesorios', N'https://example.com/mouse.jpg', CAST(25.00 AS Decimal(18, 2)), 50, CAST(N'2025-05-20T22:44:46.557' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Category], [ImageUrl], [Price], [Stock], [CreatedAt]) VALUES (3, N'Teclado Gamer', N'Teclado retroiluminado RGB', N'Accesorios', N'https://example.com/teclado.jpg', CAST(55.00 AS Decimal(18, 2)), 30, CAST(N'2025-05-20T22:44:46.557' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Category], [ImageUrl], [Price], [Stock], [CreatedAt]) VALUES (4, N'Monitor Samsung', N'Monitor LED de 24 pulgadas', N'Tecnología', N'https://example.com/monitor.jpg', CAST(150.00 AS Decimal(18, 2)), 20, CAST(N'2025-05-20T22:44:46.557' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Category], [ImageUrl], [Price], [Stock], [CreatedAt]) VALUES (5, N'Silla Ergonómica', N'Silla para oficina ergonómica', N'Muebles', N'https://example.com/silla.jpg', CAST(120.00 AS Decimal(18, 2)), 15, CAST(N'2025-05-20T22:44:46.557' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Category], [ImageUrl], [Price], [Stock], [CreatedAt]) VALUES (6, N'Disco Duro SSD', N'Disco duro SSD 500GB', N'Almacenamiento', N'https://example.com/ssd.jpg', CAST(85.00 AS Decimal(18, 2)), 25, CAST(N'2025-05-20T22:44:46.557' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Category], [ImageUrl], [Price], [Stock], [CreatedAt]) VALUES (7, N'Memoria RAM 8GB', N'Memoria DDR4 8GB', N'Componentes', N'https://example.com/ram.jpg', CAST(40.00 AS Decimal(18, 2)), 40, CAST(N'2025-05-20T22:44:46.557' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Category], [ImageUrl], [Price], [Stock], [CreatedAt]) VALUES (8, N'Smartphone Xiaomi', N'Smartphone con 128GB de almacenamiento', N'Tecnología', N'https://example.com/phone.jpg', CAST(250.00 AS Decimal(18, 2)), 18, CAST(N'2025-05-20T22:44:46.557' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Category], [ImageUrl], [Price], [Stock], [CreatedAt]) VALUES (9, N'Webcam HD', N'Cámara web HD 1080p', N'Accesorios', N'https://example.com/webcam.jpg', CAST(30.00 AS Decimal(18, 2)), 35, CAST(N'2025-05-20T22:44:46.557' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Category], [ImageUrl], [Price], [Stock], [CreatedAt]) VALUES (10, N'Router TP-Link', N'Router Wi-Fi de alta velocidad', N'Redes', N'https://example.com/router.jpg', CAST(60.00 AS Decimal(18, 2)), 22, CAST(N'2025-05-20T22:44:46.557' AS DateTime))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([Id], [Date], [TransactionType], [ProductId], [Quantity], [UnitPrice], [Detail]) VALUES (1, CAST(N'2025-05-20T22:44:46.560' AS DateTime), N'Venta', 1, 2, CAST(750.00 AS Decimal(18, 2)), N'Venta de laptops Lenovo')
INSERT [dbo].[Transactions] ([Id], [Date], [TransactionType], [ProductId], [Quantity], [UnitPrice], [Detail]) VALUES (2, CAST(N'2025-05-20T22:44:46.560' AS DateTime), N'Venta', 2, 5, CAST(25.00 AS Decimal(18, 2)), N'Venta de mouse Logitech')
INSERT [dbo].[Transactions] ([Id], [Date], [TransactionType], [ProductId], [Quantity], [UnitPrice], [Detail]) VALUES (3, CAST(N'2025-05-20T22:44:46.560' AS DateTime), N'Compra', 3, 10, CAST(50.00 AS Decimal(18, 2)), N'Compra de teclados')
INSERT [dbo].[Transactions] ([Id], [Date], [TransactionType], [ProductId], [Quantity], [UnitPrice], [Detail]) VALUES (4, CAST(N'2025-05-20T22:44:46.560' AS DateTime), N'Venta', 4, 3, CAST(150.00 AS Decimal(18, 2)), N'Venta de monitores Samsung')
INSERT [dbo].[Transactions] ([Id], [Date], [TransactionType], [ProductId], [Quantity], [UnitPrice], [Detail]) VALUES (5, CAST(N'2025-05-20T22:44:46.560' AS DateTime), N'Compra', 5, 6, CAST(120.00 AS Decimal(18, 2)), N'Compra de sillas ergonómicas')
INSERT [dbo].[Transactions] ([Id], [Date], [TransactionType], [ProductId], [Quantity], [UnitPrice], [Detail]) VALUES (6, CAST(N'2025-05-20T22:44:46.560' AS DateTime), N'Venta', 6, 4, CAST(85.00 AS Decimal(18, 2)), N'Venta de discos SSD')
INSERT [dbo].[Transactions] ([Id], [Date], [TransactionType], [ProductId], [Quantity], [UnitPrice], [Detail]) VALUES (7, CAST(N'2025-05-20T22:44:46.560' AS DateTime), N'Venta', 7, 8, CAST(40.00 AS Decimal(18, 2)), N'Venta de memorias RAM')
INSERT [dbo].[Transactions] ([Id], [Date], [TransactionType], [ProductId], [Quantity], [UnitPrice], [Detail]) VALUES (8, CAST(N'2025-05-20T22:44:46.560' AS DateTime), N'Compra', 8, 7, CAST(250.00 AS Decimal(18, 2)), N'Compra de smartphones Xiaomi')
INSERT [dbo].[Transactions] ([Id], [Date], [TransactionType], [ProductId], [Quantity], [UnitPrice], [Detail]) VALUES (9, CAST(N'2025-05-20T22:44:46.560' AS DateTime), N'Venta', 9, 10, CAST(30.00 AS Decimal(18, 2)), N'Venta de webcams HD')
INSERT [dbo].[Transactions] ([Id], [Date], [TransactionType], [ProductId], [Quantity], [UnitPrice], [Detail]) VALUES (10, CAST(N'2025-05-20T22:44:46.560' AS DateTime), N'Compra', 10, 5, CAST(60.00 AS Decimal(18, 2)), N'Compra de routers TP-Link')
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Products_Name]    Script Date: 20/05/2025 23:02:41 ******/
CREATE NONCLUSTERED INDEX [IX_Products_Name] ON [dbo].[Products]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Transactions_Date]    Script Date: 20/05/2025 23:02:41 ******/
CREATE NONCLUSTERED INDEX [IX_Transactions_Date] ON [dbo].[Transactions]
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Transactions_ProductId]    Script Date: 20/05/2025 23:02:41 ******/
CREATE NONCLUSTERED INDEX [IX_Transactions_ProductId] ON [dbo].[Transactions]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Transactions] ADD  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Products]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD CHECK  (([TransactionType]='venta' OR [TransactionType]='compra'))
GO
USE [master]
GO
ALTER DATABASE [bd_evaluacion] SET  READ_WRITE 
GO
