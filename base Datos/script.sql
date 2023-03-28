USE [master]
GO
/****** Object:  Database [IABD]    Script Date: 28/03/2023 20:47:53 ******/
CREATE DATABASE [IABD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IABD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.IABDSQLSERVER\MSSQL\DATA\IABD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IABD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.IABDSQLSERVER\MSSQL\DATA\IABD_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [IABD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IABD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IABD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IABD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IABD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IABD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IABD] SET ARITHABORT OFF 
GO
ALTER DATABASE [IABD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IABD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IABD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IABD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IABD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IABD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IABD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IABD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IABD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IABD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [IABD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IABD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IABD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IABD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IABD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IABD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IABD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IABD] SET RECOVERY FULL 
GO
ALTER DATABASE [IABD] SET  MULTI_USER 
GO
ALTER DATABASE [IABD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IABD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IABD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IABD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IABD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IABD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'IABD', N'ON'
GO
ALTER DATABASE [IABD] SET QUERY_STORE = OFF
GO
USE [IABD]
GO
/****** Object:  Table [dbo].[DWH_STORE]    Script Date: 28/03/2023 20:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DWH_STORE](
	[ID_store] [int] NULL,
	[name_store] [varchar](50) NULL,
	[city_store] [varchar](30) NULL,
	[ISO_country] [varchar](3) NULL,
	[country_store] [varchar](15) NULL,
	[sq_feet_store] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STA_all_sales]    Script Date: 28/03/2023 20:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STA_all_sales](
	[Sales_Date] [date] NULL,
	[Customer_number] [int] NULL,
	[Order_number] [int] IDENTITY(1,1) NOT NULL,
	[Sales_Rep_ID] [int] NULL,
	[Product_Id] [int] NULL,
	[Quantity] [int] NULL,
	[Discount] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STA_COUNTRIES]    Script Date: 28/03/2023 20:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STA_COUNTRIES](
	[ID_Countrie] [int] NOT NULL,
	[name_Countrie] [varchar](50) NULL,
	[TwoCODE_Countrie] [varchar](2) NULL,
	[ThreeCODE_Countrie] [varchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Countrie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STA_customers]    Script Date: 28/03/2023 20:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STA_customers](
	[Customer_Number] [int] IDENTITY(1,200) NOT NULL,
	[Assigned_Sales_Rep_ID] [int] NULL,
	[Customer_Type] [varchar](50) NULL,
	[Company_Name] [varchar](50) NULL,
	[Customer_Country] [varchar](30) NULL,
	[Customer_City] [varchar](50) NULL,
	[Customer_Estimated_Revenue_USD] [decimal](15, 2) NULL,
	[Customer_Estimated_Employees] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Customer_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STA_PRODUCT_FAMILY]    Script Date: 28/03/2023 20:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STA_PRODUCT_FAMILY](
	[Product_Family_Id] [int] NOT NULL,
	[Product_Family] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_Family_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STA_product_line]    Script Date: 28/03/2023 20:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STA_product_line](
	[Product_Line_Id] [int] NOT NULL,
	[Product_Line] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_Line_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STA_PRODUCTS_CLASS]    Script Date: 28/03/2023 20:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STA_PRODUCTS_CLASS](
	[Product_Class_Identifier] [varchar](3) NOT NULL,
	[Product_Class] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_Class_Identifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STA_products_full]    Script Date: 28/03/2023 20:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STA_products_full](
	[Product_ID] [int] IDENTITY(1,200000) NOT NULL,
	[Product_Family] [int] NULL,
	[Product_Class] [varchar](3) NULL,
	[Product_Line] [int] NULL,
	[Product_Item] [varchar](50) NULL,
	[Retail_price_ES] [decimal](10, 2) NULL,
	[Retail_Price_ITA] [decimal](10, 2) NULL,
	[Sales_Price] [decimal](10, 2) NULL,
	[porc_of_COGS] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STA_SALES_REP]    Script Date: 28/03/2023 20:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STA_SALES_REP](
	[ID_sales_rep] [int] NOT NULL,
	[name_sales_rep] [varchar](50) NULL,
	[birthday_sales_rep] [date] NULL,
	[salary] [int] NULL,
	[ID_team_manager] [int] NULL,
	[ID_store] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_sales_rep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STA_STORES]    Script Date: 28/03/2023 20:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STA_STORES](
	[Store_ID] [int] NOT NULL,
	[Store_Name] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Country_ISO] [varchar](3) NULL,
	[Country] [varchar](15) NULL,
	[sq_feet] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Store_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STA_team_manager]    Script Date: 28/03/2023 20:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STA_team_manager](
	[Team_Manager_ID] [int] NOT NULL,
	[Team_Manager] [varchar](50) NULL,
	[Birthday] [date] NULL,
	[Salary] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Team_Manager_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_ALL_SALES]    Script Date: 28/03/2023 20:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_ALL_SALES](
	[Date_sales] [date] NULL,
	[ID_customer] [int] NULL,
	[Order_number] [int] NULL,
	[ID_sales_rep] [int] NULL,
	[ID_product] [int] NULL,
	[Quantity] [int] NULL,
	[Discount] [varchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_CUSTOMER_TYPE]    Script Date: 28/03/2023 20:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_CUSTOMER_TYPE](
	[ID_Customer_Type] [int] IDENTITY(1,1) NOT NULL,
	[Name_Customer_Type] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Customer_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_CUSTOMERS]    Script Date: 28/03/2023 20:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_CUSTOMERS](
	[ID_customer] [int] NOT NULL,
	[ID_sales_rep] [int] NULL,
	[Name_company] [varchar](255) NULL,
	[City_customer] [varchar](50) NULL,
	[Estimated_revenue_customer] [decimal](15, 2) NULL,
	[Estimated_num_employees_customer] [int] NULL,
	[Currency] [varchar](50) NULL,
	[Country_ISO] [varchar](3) NULL,
	[ID_type_customer] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_PRODUCT_CLASS]    Script Date: 28/03/2023 20:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_PRODUCT_CLASS](
	[ID_product_class] [varchar](3) NOT NULL,
	[Name_product_class] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_product_class] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_PRODUCT_FAMILY]    Script Date: 28/03/2023 20:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_PRODUCT_FAMILY](
	[ID_product_family] [int] NOT NULL,
	[Name_product_family] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_product_family] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_PRODUCT_LINE]    Script Date: 28/03/2023 20:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_PRODUCT_LINE](
	[ID_product_line] [int] NOT NULL,
	[Name_product_line] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_product_line] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_PRODUCTS_FULL]    Script Date: 28/03/2023 20:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_PRODUCTS_FULL](
	[ID_product] [int] NOT NULL,
	[ID_product_family] [int] NULL,
	[ID_product_class] [varchar](3) NULL,
	[Product_line] [int] NULL,
	[Name_product_item] [varchar](255) NULL,
	[Retail_price_ES] [decimal](10, 2) NULL,
	[Retail_price_ITA] [decimal](10, 2) NULL,
	[Sales_price] [decimal](10, 2) NULL,
	[COGS_percentage] [decimal](5, 4) NULL,
	[Currency_ES] [varchar](50) NULL,
	[Currency_ITA] [varchar](50) NULL,
	[Tax_ES] [decimal](5, 4) NULL,
	[Tax_ITA] [decimal](5, 4) NULL,
	[Price_with_tax_ES] [decimal](10, 2) NULL,
	[Price_with_tax_ITA] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_SALES_REP]    Script Date: 28/03/2023 20:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_SALES_REP](
	[ID_sales_rep] [int] NOT NULL,
	[name_sales_rep] [varchar](50) NULL,
	[birthday_sales_rep] [date] NULL,
	[salary] [int] NULL,
	[ID_team_manager] [int] NULL,
	[ID_store] [int] NULL,
	[currency] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_sales_rep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_STORE]    Script Date: 28/03/2023 20:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_STORE](
	[ID_store] [int] NOT NULL,
	[name_store] [varchar](50) NULL,
	[city_store] [varchar](30) NULL,
	[ISO_country] [varchar](3) NULL,
	[country_store] [varchar](15) NULL,
	[sq_feet_store] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_store] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_TEAM_MANAGER]    Script Date: 28/03/2023 20:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_TEAM_MANAGER](
	[ID_team_manager] [int] NOT NULL,
	[Name_team_manager] [varchar](255) NULL,
	[Birthday_team_manager] [date] NULL,
	[Salary_team_manager] [decimal](15, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_team_manager] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [IABD] SET  READ_WRITE 
GO
