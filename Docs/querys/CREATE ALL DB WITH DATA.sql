/****** Object:  Database [GesCit]    Script Date: 21/03/2023 12:56:41 a. m. ******/
CREATE DATABASE [GesCit]
GO
ALTER DATABASE [GesCit] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GesCit].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GesCit] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GesCit] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GesCit] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GesCit] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GesCit] SET ARITHABORT OFF 
GO
ALTER DATABASE [GesCit] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GesCit] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GesCit] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GesCit] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GesCit] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GesCit] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GesCit] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GesCit] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GesCit] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GesCit] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GesCit] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GesCit] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GesCit] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GesCit] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GesCit] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GesCit] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GesCit] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GesCit] SET RECOVERY FULL 
GO
ALTER DATABASE [GesCit] SET  MULTI_USER 
GO
ALTER DATABASE [GesCit] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GesCit] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GesCit] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GesCit] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GesCit] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GesCit] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GesCit] SET QUERY_STORE = OFF
GO
USE [GesCit]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[AccountNum] [nvarchar](50) NOT NULL,
	[Rfc] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK__Client__B9572BDA423C1E00] PRIMARY KEY CLUSTERED 
(
	[AccountNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dates]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountNum] [int] NULL,
	[UserId] [int] NULL,
	[ScheduleTimeId] [int] NULL,
	[OperationId] [int] NULL,
	[TransportLineId] [int] NULL,
	[TransportId] [int] NULL,
	[TransportPlate1] [nvarchar](50) NULL,
	[TransportPlate2] [nvarchar](50) NULL,
	[TransportPlate3] [nvarchar](50) NULL,
	[DriverId] [int] NULL,
	[ProductId] [int] NULL,
	[Volume] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentFiles]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentFiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TemporalDocumentId] [int] NULL,
	[ModuleId] [int] NULL,
	[UserId] [int] NULL,
	[DocumentId] [int] NULL,
	[FieldName] [varchar](255) NULL,
	[OriginalName] [varchar](255) NULL,
	[Mimetype] [varchar](255) NULL,
	[FileData] [varbinary](max) NULL,
	[Size] [int] NULL,
	[CreateDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[DocumentTypeId] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentType]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drivers]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drivers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Accountnum] [varchar](255) NOT NULL,
	[FirstName] [varchar](255) NOT NULL,
	[LastName] [varchar](255) NOT NULL,
	[SecondLastName] [varchar](255) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[Birthdate] [date] NULL,
	[StatusId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModuleCategories]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [varchar](max) NULL,
	[Name] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[StatusId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modules]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [varchar](max) NULL,
	[ModuleCategoriesId] [int] NULL,
	[Name] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[StatusId] [int] NULL,
	[Icon] [varchar](20) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operation]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PasswordRestTokens]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PasswordRestTokens](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[userName] [varchar](max) NULL,
	[Email] [varchar](max) NULL,
	[Token] [varchar](255) NULL,
	[Expired] [bit] NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [varchar](max) NULL,
	[Name] [varchar](max) NULL,
	[Unit] [varchar](max) NULL,
	[SecondaryUnit] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [varchar](max) NULL,
	[Name] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[StatusId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolesPermissions]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesPermissions](
	[RolId] [int] NULL,
	[ModuleId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [varchar](max) NULL,
	[Name] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TemporalDocuments]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TemporalDocuments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentFileId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransportLines]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransportLines](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountNum] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[LineTypeId] [int] NULL,
	[StatusId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransportLineType]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransportLineType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transports]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transports](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountNum] [varchar](50) NULL,
	[TransportTypeId] [int] NULL,
	[TransportPlate1] [varchar](10) NULL,
	[TransportPlate2] [varchar](10) NULL,
	[TransportPlate3] [varchar](10) NULL,
	[Capacity] [int] NULL,
	[StatusId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransportSchedule]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransportSchedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleTimeId] [time](7) NULL,
	[OperationId] [nvarchar](50) NULL,
	[TransportLineId] [int] NULL,
	[TransportId] [int] NULL,
	[TransportPlate1] [nvarchar](50) NULL,
	[TransportPlate2] [nvarchar](50) NULL,
	[TransportPlate3] [nvarchar](50) NULL,
	[DriverId] [int] NULL,
	[ProductId] [int] NULL,
	[Volume] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransportType]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransportType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountNum] [nvarchar](50) NULL,
	[name] [varchar](50) NULL,
	[mail] [varchar](50) NULL,
	[userName] [varchar](50) NULL,
	[userTypeId] [int] NULL,
	[password] [varchar](50) NULL,
	[PrivacyNotice] [int] NULL,
	[RolId] [int] NULL,
	[LastPassword] [varchar](max) NULL,
	[PrivacyNoticeDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00001', N'BME960110PM8', N'BULKMATIC DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00002', N'ISF740717ELA', N'INGENIO SAN FRANCISCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00004', N'E&F940429UU7', N'ED & F MAN DE COMERCIO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00005', N'ASM9210016R9', N'AGRISTAR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00006', N'G&A990810Q31', N'GRAINS & ANCIILLARY')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00007', N'AST840426RQ9', N'ASTECA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00008', N'GAL930104D23', N'GRANERO EL ALHUATE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00009', N'PSA960907139', N'PRODUCTORES DE SALAMANCA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00010', N'ADM990407J22', N'AGRICULTURA 2000 SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00011', N'ANX880713LA2', N'AVIGRAN DEL NOROESTE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00012', N'DIC860428M2A', N'DICONSA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00013', N'ACO000530R42', N'AGRICULTURA CONFIABLE SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00014', N'LIC950821M84', N'LICONSA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00015', N'FHE870311UX5', N'FABRICA DE HARINAS ELIZONDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00016', N'BGA831024IY2', N'BODEGA DE GRANOS EL ALAZAN Y EL ROCIO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00017', N'BAL961213533', N'BODEGAS ALFER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00018', N'AAR3211258S7', N'ASOCIACION DE AGRICULTORES DEL RIO ELOTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00019', N'ARC990528LI0', N'AARC DEL RIO CULIACAN AC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00020', N'AOC820120SQ2', N'ARROCERA DE OCCIDENTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00021', N'AMR040802NW7', N'ALFREDO MONDACA ROBLES USPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00022', N'SCM070717MP0', N'SABIC COMMERCIAL MATERIALS MEXICO  S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00023', N'AVA930112UV8', N'ALMACENES VACA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00024', N'AME951228UD3', N'ALMACENADORA MERCADER SA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00025', N'AUY000525FU4', N'AGROPRODUCTORES UNIDOS DE YURIRIA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00026', N'BGB941019E33', N'BASTION DEL GRANERO DEL BAJIO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00027', N'ACP841031V96', N'SOCIEDAD COOPERATIVA AGROPRECUARIA DE CONSUMO DE POLICULTORES DE HUANIMARO  GTO  SCL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00028', N'AGU7309296UA', N'AGROPLAN DE GUASAVE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00029', N'AVS960712AKA', N'AGRICOLA DE LOS VALLES SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00030', N'GAL880926TF5', N'MOLINOS BUNGE DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00031', N'SER940831NM6', N'SERVICARGO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00032', N'UGR611023BH7', N'UNION GANADERA REGIONAL DE GUANAJUATO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00033', N'UEP760903CA7', N'UNION DE EJIDOS DE PRODUCCION AGROPECUARIA DE LA EX-LAGUNA DE MAGDALENA GENERAL LAZARO CARDENAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00034', N'MIN931015ES9', N'MINSA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00035', N'FME971022Q44', N'FERROCARRIL MEXICANO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00036', N'GSI961111385', N'GRANOS DE SINALOA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00037', N'DGM9711138R7', N'GAVILON DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00038', N'GGA971022LK7', N'GRUPO GAFSA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00039', N'ATI030211SP3', N'ALTERNATIVAS TECNICAS PARA LA INDUSTRIA SC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00040', N'AME600620960', N'ALMIDONES MEXICANOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00041', N'GCA991013333', N'GRANEROS CAMACHO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00042', N'PAE921125K86', N'PRODUCTORES AGRÍCOLAS DE ELOTA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00043', N'AAR550205AC4', N'ASOCIACION DE AGRICULTORES DEL RIO MOCORITO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00044', N'GAG0402189U9', N'GRUPO ACOPIADORES DE GUASAVE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00045', N'GPO970114F95', N'GRANOS EL PORVENIR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00046', N'AXT940727FP8', N'AXTEL SAB  DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00048', N'ESM900803NP2', N'EMPAK-SPIROTALLIC MEXICANA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00049', N'CEG040120RE1', N'CARNES EG SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00050', N'CEX871103SD1', N'CITRICOS EX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00051', N'BAR011108CC6', N'BARCEL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00052', N'CPI0703062JA', N'COMERCIAL LA PILARICA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00053', N'XEXX010101000', N'TALLERES FABIO MURGA SA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00054', N'CGP011003IK6', N'PALMICULTORES DE SAN MARCOS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00055', N'FCO0201258G4', N'FIDEICOMISO COMERCIALIZADOR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00056', N'TSA961024TKA', N'TRANSPORTES SAUCEDO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00057', N'AMR7309242N2', N'AOC MEXICANA DE RESINAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00058', N'CCO9909304G3', N'COMERCIALIZADORA COPAMEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00059', N'KNM950822BC3', N'KATOEN NATIE MEXICANA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00060', N'CGD9704123N6', N'COMERCIALIZADORA DE GRANOS DIVERSOS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00061', N'TSS000724HT5', N'THALES SECURITY SOLUTION & SERVICES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00062', N'GCO0203252X6', N'GA COMMERC SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00063', N'MBM010125SE9', N'MBM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00064', N'CGR04102646A', N'COMERCIALIZADORA GRAFECA SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00065', N'CSM960830B16', N'CRUCERO DE SANTA MARÍA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00066', N'BAC800208B25', N'BACHOCO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00067', N'ICA980327BYA', N'INTEGRADORA COMERCIAL AGROPECUARIA DEL NORTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00068', N'GNI000330FM4', N'GRANOS NACIONALES INTERNACIONALES DE SINALOA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00069', N'SAK030210J49', N'SAKXIM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00070', N'SIC0101106G5', N'SERVICIOS INTEGRALES DE COMERCIALIZACIÓN JISALY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00071', N'UEF831020PB5', N'UNION DE EJIDOS FRONTERIZOS DE PRODUCCION AGROPECUARIA DE INDUSTRIALIZACION DE R.I.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00072', N'GRI030430AV2', N'GRANOS EL RINCON SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00073', N'CAM0109122N7', N'SOCIEDAD COOPERATIVA DE CONSUMO AGRICOLA DEL MODULO VALLE SC DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00074', N'AUP020304G92', N'ASOCIACION DE USUARIOS DE POZOS DE RIEGO DEL NORESTE DEL ESTADO DE ZACATECAS S DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00075', N'SMO9603151K4', N'SOTO MORA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00076', N'EMA020724Q69', N'EQUIPAMIENTO Y MAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00077', N'IND960930PN6', N'INDELPA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00078', N'NBA990514B73', N'NUTRIMENTOS BALANCEADOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00079', N'PCO030110PN8', N'PRODUCTOS LA COLINA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00080', N'ARS0405192K5', N'A.A. DEL RIO SINALOA PONIENTE A.C.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00081', N'MMO9803263X7', N'MULTIGRANOS MOCHIS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00082', N'CVH9411111R1', N'COMERCIALIZADORA VALLE HERMOSO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00083', N'UHP900402Q29', N'URREA HERRAMIENTAS PROFESIONALES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00084', N'YAB021209I24', N'YORBA ALIMENTOS BALANCEADOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00085', N'ACS930510MK7', N'ASESORIA Y COMERCIALIZACION DE SEMILLA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00086', N'UGR610105E88', N'UNION GANADERA REGIONAL DE PORCICULTORES DE GUANAJUATO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00087', N'MDI991005QV4', N'MATC DIGITAL S  DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00088', N'DIG030409R54', N'DIGRAVA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00089', N'CPI950901F3A', N'INGREDION MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00090', N'MGN0403083B1', N'MERCO GRAIN NORESTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00091', N'TLP990510GW5', N'TRIPLAY Y LAMINADOS PEGA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00092', N'CIC970922LKA', N'CONSORCIO INTERAMERICANO DE COMUNICACION SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00093', N'PCI001116R1A', N'PRODUCTORA COMERCIALIZADORA INDUSTRIAL DE PRODUCTOS AGRICOLAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00094', N'SAC851205DL7', N'SERVICIOS AGROPECUARIOS DE LA COSTA  SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00095', N'CDR941027UX8', N'COMERCIALIZADORA PARA EL DESARROLLO RURAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00096', N'AAL010319M61', N'AGROINSUMOS ALAZAN SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00097', N'CTU830715D15', N'CHOCOLATES TURIN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00098', N'GSF851211CA4', N'GRANEROS SEMILLAS Y FORRAJES DE MATAMOROS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00099', N'OQL040804DE1', N'OPERADORA Q-LOGISTICS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00100', N'CMA9905218Q1', N'CORPORACION MAXIMA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00101', N'RMM801014EN7', N'REPRESENTACIONES MEXICANAS DE MAQUINARIA Y EQUIPO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00102', N'HES970131EI6', N'HARINERA LA ESPIGA SA DE CV')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00103', N'IME800409MBA', N'INDUSTRIA METALICA DEL ENVASE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00104', N'ACO8703236G0', N'CIA. ARROCERA COVADONGA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00105', N'MBU970630SL3', N'MOLINOS BUNGE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00106', N'HSI8405186M2', N'HARINERA DE SILAO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00107', N'CPE041018GW2', N'CORPORATIVO PEGUSA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00108', N'FCN020226AG8', N'FRIJOLES Y CEREALES DEL NORTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00109', N'GCE970116GE6', N'GRANEROS CEDILLO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00110', N'IFN050308AW9', N'INTEGRADORA DE FRIJOLEROS DEL NORTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00111', N'AME830224BI2', N'AARHUSKARLSHAMN MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00112', N'ABR780811PCA', N'ARTE EN BRONCE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00113', N'ACO031031PQ1', N'AGROPECUARIA Y COMERCIALIZADORA LOS OTATES SPR DE RLSTRIAL DE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00114', N'IME791218C97', N'INDUSTRIAS MELDER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00115', N'CPP9004072F2', N'CAJEME PRODUCTOS PECUARIOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00116', N'ZME051111R94', N'ZARVERT MERCADEO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00117', N'AUBJ661224SH8', N'JORGE ARTURO AGUERREBERE BELTRAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00118', N'SAUM380522A21', N'MIGUEL ANGEL SAMPERIO URQUIJO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00119', N'GFM040816NG8', N'GRANOS Y FORRAJES MEDINA SA DE  CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00120', N'ISA980624IS6', N'ISAOSA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00121', N'JME0501218C0', N'JASON DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00122', N'ILE820715CG7', N'INDUSTRIAS LUZ ETERNA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00123', N'CON050211NN3', N'CONAGRI SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00124', N'MOS030811V76', N'MOSSMEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00125', N'UAAJ67010343A', N'JESUS ALBERTO UGALDE ARRIETA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00126', N'PVI0106224E3', N'PUNTO Y VINO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00127', N'CIN000414QF1', N'CELUPAL INTERNACIONAL S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00128', N'GAM920225VC3', N'GRUPO AMISU SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00129', N'PCS030317LQ1', N'PRODUCTORES COMERCIALIZADORES  Y SERVICIOS  AGROINDUSTRIALES  SPR DE  RL DE  CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00130', N'PAC0106115H8', N'PRODUCTOS AGROPECUARIOS EL CHARRO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00131', N'EIM95080293A', N'EXPEDITORS INTERNATIONAL DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00132', N'MVI600615MG6', N'MERCANTIL DE VIVERES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00133', N'CMA011023JP9', N'COMERCIALIZADORA LAS MARGARITAS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00134', N'CGR030904NZ4', N'CEDILLO GRAIN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00135', N'ECM010314644', N'EUPEN CABLE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00136', N'MME941130K54', N'MAKITA MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00137', N'API051117EE9', N'AGROPECUARIA PIEDADENSE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00139', N'REX960819QFA', N'REXCEL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00140', N'GSO060908L88', N'GRUPO SONISTAR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00141', N'IEV030422ST2', N'IMPORTADORA Y EXPORTADORA VINOS EXCLUSIVOS DE GALICIA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00142', N'LIM031209B29', N'LOGISTICA INTERNACIONAL DE MERCANCIAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00143', N'ECA0411266L3', N'ENLACES AL CAMPO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00144', N'CCM010706TL5', N'CORNELL CORPORATION MÉXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00145', N'CADH751209UU0', N'HECTOR ALONSO CAMPOS DIAZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00146', N'APP980302FZ6', N'AGRO PROVEEDORA DEL PACIFICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00147', N'IFG0110237U2', N'INTERMODA FASHION GROUP SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00148', N'CCU870622986', N'CASA CUERVO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00149', N'DCA821123I77', N'DINA CAMIONES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00150', N'HPT0701172N1', N'HITACHI POWER TOOLS DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00151', N'IEA930803GD9', N'IMPORTACIONES Y EXPORTACIONES AGROPECUARIAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00152', N'CCC970109I44', N'CEREALES COMERCIALES DE LA COSTA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00153', N'INA860506ET5', N'IDESA NACIONAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00154', N'TEN010712JY4', N'TENMODA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00155', N'CIN011003TQ8', N'CONVERSE INTERNACIONAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00156', N'AME970728293', N'AMPORTS DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00157', N'CDE971219DS8', N'CONVERTO DEXEL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00158', N'QAL930420ER2', N'QUIMICA Y ALIMENTACION SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00159', N'AQU061016L32', N'AGROINSUMOS QUIRARTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00160', N'MPE940422NP5', N'MCCORMICK PESA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00161', N'FME910527M77', N'FONTERRA MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00162', N'SSA940713HA5', N'LA SOLEDAD DE SANTA APOLONIA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00163', N'ACG061017H61', N'ALMACENADORA Y COMERCIALIZADORA DE GRANOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00164', N'AFI030703MN8', N'ALCOAS FABRICACION INDUSTRIAL Y MANTENIMIENTO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00165', N'PGL050307FR9', N'PRODUCTORES LA GLORIA SPR DE RS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00166', N'ANS960419LQ8', N'AGRICULTORES DEL NORESTE SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00167', N'GRA991105DL5', N'GRASEM SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00168', N'LECJ690708E31', N'JESUS ANTONIO LEDEZMA CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00169', N'PPR031118AU4', N'PEQUEÑOS PROPIETARIOS DE RIO BRAVO SPR DE RS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00170', N'BTE010730HA2', N'BUEN TEMPORAL SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00171', N'SAE030617SV8', N'SERVICIO DE ADMINISTRACIÓN Y ENAJENACIÓN DE BIENES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00172', N'SAT970701NN3', N'SERVICIO DE ADMINISTRACIÓN TRIBUTARIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00173', N'PMM020417QD6', N'PROGRAMA DE MEJORAMIENTO DE LOS MEDIOS DE INFORMAT Y DE CONTR DE LS AUTOR ADUANE 80170')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00174', N'RIN861107A72', N'REPROCESADORA INDUSTRIAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00175', N'SMX060104QY7', N'6M SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00176', N'QUGE7111074F6', N'EDNA CRISTINA QUIÑONEZ GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00178', N'TER011031248', N'TERGRAN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00179', N'AVI9803196C7', N'AVIPIGMENTOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00180', N'CDE040528QG8', N'COMERCIALIZADORA DEZO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00181', N'OPA9611299B4', N'OPASA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00182', N'COR010110Q58', N'CORPORATICOM SA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00183', N'ECA970311J25', N'ENLACES Y COMUNICACIONES AVANZADAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00184', N'XAXX010101000', N'MONSANTO*PESCADOS INDKEUSTRIALIZADOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00185', N'JSS060504M15', N'JDR SISTEMAS Y SERVICIOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00186', N'GSY041001RK9', N'GRANOS Y SEMILLAS YECORA S DE PR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00187', N'ATM0011016T8', N'ALTA TECNOLOGIA EN MOCHILAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00188', N'PIA0006121T7', N'PORCICULTURA INTEGRAL AZ SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00191', N'MMS9303229L9', N'MARIANO MATAMOROS DE SAN ANTONIO S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00192', N'NDE850304711', N'tra')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00193', N'OMO9903156Y5', N'OPERADORA DE MOLINOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00194', N'PHP040903GD7', N'PRODUCTORES DE LA HERRADURA DE PENJAMO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00195', N'POC990510T91', N'PROMOCIONALES DE OCCIDENTE SA.DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00196', N'SFR961218RH7', N'o*')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00197', N'UAP970314DN1', N'UNIDOS EN ALIANZA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00198', N'PYS831230B16', N'PRODUCTORA YOREME S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00199', N'PPA9010247V8', N'PRODUCTORA PECUARIA ALPERA SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00201', N'FMM9803095R4', N'FLEXTRONICS MANUFACTURING MEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00202', N'CPA060911UI3', N'CARDINAL PAINTS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00233', N'OERM6804208K6', N'JOSE MANUEL ORNELAS RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00246', N'', N'GOBIERNO FEDERAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00247', N'', N'INTEG COMER AGROP DEL NTE SACV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00248', N'', N'.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00249', N'', N'INTERCOMPAÑIAS SERAMER')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00250', N'', N'NETEO INTERCOMPAÑIAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00251', N'SIA980112P73', N'SERVICIOS INTEGRALES DE ALMACENAMIENTO Y COMERCIALIZACION DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00252', N'GUN900522IF6', N'GRUPO UNITOP SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00253', N'FME960322GL0', N'FEIYUE DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00254', N'FIJ030829SU4', N'FIDEICOMISO INGENIO JOSE MARIA MORELOS 80342')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00255', N'GGD040318QM8', N'GRAPHOPAK GDG SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00256', N'XEXX010101000', N'GP CELLULOSE INTERNATIONAL MARKETING SRL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00257', N'PME070116DB4', N'PASION MEXICANA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00258', N'SIC001123KL3', N'SOLUCIONES INTERMODALES DE CARGA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00259', N'XEXX010101000', N'SUNNY USA INC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00260', N'FIS030829Q56', N'FIDEICOMISO INGENIO SAN CRISTOBAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00261', N'UEP861205KR9', N'UNION DE EJIDOS DE PRODUCCION INDUSTRIALIZACION Y COMERCIALIZACION AGROPECUARIA DE R.I 16 DE ABRIL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00262', N'CBO850814EK6', N'CENTRAL DE BOLSAS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00263', N'REI860217837', N'REIMART SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00264', N'CIL950710R37', N'COMERCIO INFORMATICA Y LOGISTICA INTERNACIONAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00265', N'GCM000803CZ6', N'G4 DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00266', N'UST0710066R6', N'UDAIPUR STEEL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00267', N'PTR840903MN9', N'PRODUCTORA DE TRIPLAY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00268', N'AFA9409296Q4', N'ALMACENES Y FRIGORIFICOS  AMERIBEN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00269', N'CVM060308LM6', N'CVMAPCO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00270', N'STM060224MM9', N'SENSATA TECHNOLOGIES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00271', N'DPA650809254', N'DURAPLAY DE PARRAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00272', N'MIJ900724P63', N'MADERAS INDUSTRIALIZADAS DE JALISCO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00273', N'CTR0501281A7', N'CATINO TRADERS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00274', N'LME041208UQ8', N'LINWORKS DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00275', N'ISH970618QT3', N'INTERCOMERCIO SHM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00276', N'CUA010315V75', N'COMERCIALIZADORA UNIVERSAL DE AUTOPARTES  SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00277', N'INN050516D10', N'INNOVAMAQ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00278', N'DRA0706069D7', N'DISTRIBUIDORA RAFUZAG SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00279', N'ALE971219NX9', N'ALESSO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00280', N'TYL070928IF0', N'TRIPLAY Y LAMINADOS GUADALAJARA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00281', N'CTA070820K54', N'COOPER TIRE & RUBBER COMPANY DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00282', N'LLI070919RA9', N'LIN LI SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00283', N'IMA071002BM1', N'IMPORTADORA MAZAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00284', N'HMS970730JT1', N'HOME MEDICAL SERVICE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00285', N'LPA961016SF7', N'LYON PAPIER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00286', N'MRP0711068HA', N'MANUFACTURAS RING BING PLUS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00287', N'MIM7207049C1', N'MATERIALES INDUSTRIALES DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00288', N'SME930225FP8', N'SYNNEX DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00289', N'IEM0408312J7', N'IMPORTADORA EMPORIO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00290', N'PIA881020QN4', N'PROMOTORA INDUSTRIAL AZUCARERA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00291', N'YIT040311U86', N'YARTO INTERNATIONAL TRADING COMPANY LP')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00293', N'IME9707304F5', N'INFOSONICS DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00294', N'PCS050504KV5', N'PRODUCTORES Y COMERCIALIZADORES SINALOENSES SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00295', N'AJA931019PV5', N'ALMACENADORA JALISCIENSE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00296', N'IPA071113SF7', N'INTEGRADORA DE PRODUCTORES AGROPECUARIOS DE ZACATECAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00297', N'FGM9711037C1', N'FERTI-GREEN DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00298', N'CADH751209UU0', N'CLIENTE CON ERROR DUPLICADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00299', N'IJU010913RC5', N'IMPORTADORA JUMBO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00300', N'TAI020315HD9', N'TAITEK SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00301', N'GFO0712033F7', N'GLOBAL FOREST SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00302', N'AIE050902HH7', N'ADN IMPORT AND EXPORT CORPORATION SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00303', N'PMA940802F12', N'PRODUCTOS MARCOPOLO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00304', N'MMU020815BC9', N'MERCANTIL MURCIA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00305', N'CAAB5804259J2', N'BEATRIZ CABADA ARMIENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00306', N'EST7411075F3', N'ESPECIFICOS STENDHAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00307', N'FAL931112BBA', N'FORESTAL ALFA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00308', N'ESI800411SR1', N'ENVASES DE SINALOA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00309', N'ALI960227A43', N'ALINSUMOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00310', N'AFE970702EI6', N'AGROPRODUCTOS FERTIJOAQUIN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00311', N'GGU971124V85', N'GRANEROS DE GUANAJUATO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00312', N'IRL031111KBA', N'INTEGRADORA DEL RIO LERMA S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00313', N'FNO850107387', N'WN EL NOGAL SC DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00314', N'ASJ0205194S9', N'AGROQUIMICA SAN JOSE SC DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00315', N'AGS0110153S3', N'AGRICOLA GANADERA LOS SAUCES SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00316', N'CGS980428AJ5', N'COMERCIALIZADORA DE GRANOS Y SEMILLAS LA BARCA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00317', N'STR981021LTA', N'SAINZ 3 SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00318', N'ACO000530R42', N'CLIENTE CON ERROR DUPLICADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00319', N'CRB940311NR1', N'COMISIONES Y REPRESENTACIONES DE BRISEÑAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00320', N'RCP020411BC5', N'RAMOS COMERCIALIZADORA PRODUCTORA Y SERVICIOS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00321', N'CUR8012235W1', N'CURPIEL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00322', N'MMI9702252F4', N'MADERAS LA MISION SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00323', N'JJG980116BQ8', N'JOSE DE JESUS GONZALEZ PEREZ SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00324', N'ZEI970715IW9', N'ZEICHEN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00325', N'IMP910702HY4', N'IMPORTEC SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00326', N'GIV9402181AA', N'GRUPO INDUSTRIAL VELASCO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00327', N'HPA860929SW8', N'HARINERA EL PARAISO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00328', N'CHO9808119Y6', N'CONCEPTOS PARA EL HOGAR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00329', N'EAG930301A45', N'ECOLOGIA AGRICOLA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00330', N'FTP030829BC4', N'FIDEICOMISO INGENIO EL POTRERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00331', N'AMI9707184Z8', N'AMIDA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00332', N'MED980615KDA', N'MODAS EDNA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00333', N'IDM000306QH4', N'IMPER 2000 SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00334', N'OME010830K20', N'OTTEX MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00335', N'ERO850401251', N'EXCLUSIVAS ROSITA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00336', N'CDM980603D10', N'COMERCIALIZADORA Y MERCADOTECNIA DEPORTIVA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00337', N'GCO940930NC1', N'GRUPO COTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00338', N'SSA010619297', N'SAM SAM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00339', N'UIE030115EBA', N'UNICORNIO IMPORT EXPORT SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00340', N'GAS020423TX5', N'GRUPO ALIMENTAE DEL SURESTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00341', N'SAZE550326AMA', N'MARIA ELEONORA SANDOVAL ZARATE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00342', N'CON940425T93', N'CONCAMPO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00343', N'BME9410137F5', N'BERING DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00344', N'DPA900806NGA', N'DISTRIBUIDORA PAPELERA AZTECA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00345', N'FIA030829HY1', N'FIDEICOMISO INGENIO ATENCINGO 80326')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00346', N'FIE0308299J6', N'FIDEICOMISO INGENIO EMILIANO ZAPATA 80330')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00347', N'FIM0308299X6', N'FIDEICOMISO INGENIO EL MODELO 80328')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00348', N'GGD040318QM8', N'CORRECCION DE CLIENTE DUPLICADO NO USAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00349', N'PEP951218U40', N'PROMOTORA Y EXPORTADORA DE PRODUCTOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00350', N'GUN991115KNA', N'JOVA GRANEROS SA DE CV')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00351', N'CDI9508106U8', N'CENTRO DE DISTRIBUCION INTERNACIONAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00352', N'IGM070726155', N'INTEGRADORA GRANOS DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00353', N'GCM920629960', N'GRUPO CONVERSE DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00355', N'ARA9812169P6', N'ARANAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00356', N'MED030114I50', N'MONTENEGRO EDITORES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00357', N'EGL0710111CA', N'ESTACION DE GRANOS LUCERO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00358', N'UNP9607057B6', N'UNPEG S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00359', N'XAXX010101000', N'CLIENTE OCASIONAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00360', N'SIM0001241P4', N'SI MON INTERNACIONAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00361', N'FDI9005153G5', N'FABIO DIFUSION SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00362', N'TAU580513DC5', N'TRANSPORTADORA AUTOMOTRIZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00363', N'PAU841126K65', N'LA PROVEEDORA COMPAÑIA DE AUTOMOVILES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00364', N'AIL0006231G9', N'ALMACENAJE INTEGRAL Y LOGISTICA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00365', N'CMI9410201E2', N'CARGO MASTERS INTERNACIONAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00366', N'CME8909276S1', N'CARGILL DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00367', N'IPB7405157E6', N'INGENIO PRESIDENTE BENITO JUAREZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00368', N'IJM8502211B9', N'INGENIO JOSE MARIA MARTINEZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00369', N'FIC0803298S2', N'FIDEICOMISO INGENIO CENTRAL PROGRESO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00370', N'FIS030829F16', N'INGENIO SAN GABRIEL VER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00371', N'FIN030829RS3', N'INGENIO LA MARGARITA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00372', N'AVS8906308K5', N'ALIMENTOS Y VIVERES SAN RAFAEL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00373', N'CBZ930226CK9', N'CALKINS BURKE AND ZANNIE DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00374', N'SIO0512151Z5', N'SIOGRAN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00375', N'APM840622GFA', N'AGRICULTORES PROGRESISTAS DE MATAMOROS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00376', N'GAN050816J44', N'GRANOS ANGOSTURA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00377', N'CGS9910049K8', N'COMERCIALIZADORA DE GRANOS SELECCIONADOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00379', N'GRA020919KL4', N'EL GRAN-NITO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00380', N'NAL8406249D2', N'COMPAÑIA NACIONAL ALMACENADORA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00381', N'SIA980112P73', N'SERVICIOS INTEGRALES DE ALMACENAMIENTO Y COMERCIALIZACION DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00382', N'ARA0009017H0', N'ARAUCOMEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00383', N'XEXX010101000', N'MALLORY ALEXANDER INTERNATIONAL LOGISTICS LLC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00384', N'TIM060110IB3', N'TODO PARA IMPRESIONES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00385', N'SHN571001I66', N'SHETINNO HNOS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00386', N'INT010329PS5', N'INTERSELECT SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00387', N'SCP900125TT8', N'SMURFIT CARTON Y PAPEL DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00388', N'NME030204PA9', N'NYK DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00389', N'XEXX010101000', N'KAWASAKI KISEN KAISHA LTD')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00390', N'ASA070423PY6', N'ALMACENES Y SERVICIOS AMERIBEN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00391', N'CAVL6311215V1', N'LUIS ALBERTO CAMPOS VAZQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00392', N'KCU0306104YA', N'KAIN CHUANG SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00393', N'XEXX010101000', N'UNION PACIFIC DISTRIBUTION SERVICES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00394', N'HIM030618T67', N'HIGIENE INFANTIL DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00395', N'LAC971029QQA', N'LACTOFORMULAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00396', N'MPM921009KA3', N'MACCORD PAYEN DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00397', N'', N'GRANOS Y SERVICIOS CORTAZAR SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00398', N'SMM990318AM0', N'SUMINISTROS DE MAIZ DEL MAYAB SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00399', N'FDS920320E55', N'FORRAJES EL DOLLAR S DE RL MI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00400', N'TRI020427B19', N'TRISORMA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00401', N'CCO910527223', N'COMERCIALIZADORA COLUMBIA SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00402', N'HPI880624SW5', N'HARINERA LOS PIRINEOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00403', N'SAB730510K44', N'SABRITAS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00404', N'AME9904233AA', N'ADM MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00405', N'AIG000207584', N'AGRO INDUSTRIAS GTO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00406', N'IACC720319GT6', N'CRISTO IBARRA CAMPOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00408', N'', N'BANCO SANTANDER SA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00409', N'UAA6911122G1', N'UNION DE ASOCIACIONES AVICOLAS DEL ESTADO DE SONORA AC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00411', N'IAS-051004-SV9', N'INTEGRADORA AGROPECUARIA SINALOENSE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00413', N'MAJ951202SX5', N'MERCADERES DE LOS ALTOS DE JALISCO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00414', N'CPM910617EG1', N'LOUIS DREYFUS COMPANY MEXICO S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00415', N'', N'DINA CARTERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00416', N'', N'MONTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00417', N'', N'CARTERA MINSA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00418', N'', N'(NO USAR)')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00419', N'', N'sacis')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00420', N'', N'CARTERA UNION GANADERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00421', N'', N'INTERESES CARTERA FINANCIAMIENTOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00422', N'', N'INTERESES CARTERA DINA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00423', N'', N'INTERESES CARTERA UNION GANADERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00424', N'PVD011012K44', N'PRODUCTORES DEL V-2 DEL VALLE DE ANGOSTURA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00426', N'MHS840626BI9', N'MOLINO HARINERO SAN BLAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00429', N'XEXX010101000', N'CHS INC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00430', N'ABP930920F46', N'ADM BIO PRODUCTOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00431', N'UERD800421KB9', N'DIANA ODALYS URETA RAMOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00432', N'AVI0012076Y8', N'AVICAMPO SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00435', N'VARG441023SL2', N'GUMARO VALDEZ RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00437', N'XEXX010101000', N'CSC SUGAR LLC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00438', N'ITA850221EP5', N'INGENIO TALA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00440', N'HMI950125KG8', N'HSBC MEXICO SA INSTITUCION DE BANCA MULTIPLE GRUPO FINANCIERO HSBC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00441', N'ICA041231DB7', N'INTEGRADORA CAADES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00442', N'IPA071124PQA', N'INTEGRADORA DE PROCESOS AGRICOLAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00444', N'GOGM630307RBA', N'JOSE MARTIN GONZALEZ GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00445', N'FLA551214BC5', N'FLAGA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00446', N'RCO690103FE3', N'RANCHO COVADONGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00448', N'GA020812DS5', N'COMPAÑIA GANADERA GARIBAY DE AMECA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00449', N'AGI9805078U8', N'AGRICOLA LOS GIRASOLES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00450', N'XEXX010101000', N'SOCIÉTÉ GÉNÉRALE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00451', N'CPS060718DY4', N'COMERCIALIZADORA DE PRODUCTOS Y SERVICIOS DEL CAMPO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00452', N'HMA990603KI7', N'HARI MASA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00453', N'PCO960330VAA', N'PRIMOS AND COUSINS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00454', N'NFF9703207M7', N'NACIONAL FINANCIERA FID PICAL PANTACO 1114-5')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00456', N'FGV070511HW6', N'FERTILIZANTES Y GRANOS DE VICAM SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00457', N'GEG971010539', N'GANADERIA EDUARDO GARIBAY SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00459', N'AAN7903236J5', N'ASOCIACION DE AVICULTORES DE NAVOJOA AC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00462', N'MME960821JHA', N'MOLINERA DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00463', N'LOCX6109279V8', N'OSCAR LOZANO CHAVEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00465', N'PAT741111UD2', N'PRODUCTORES AGROPECUARIOS TEPEXPAN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00466', N'TMS010508RX0', N'TOYOTA MOTOR SALES DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00467', N'HER8301121X4', N'HERDEZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00468', N'FCA900330EC5', N'FORRAJES LOS CHAPETEADOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00469', N'GFS051122BT6', N'GRANOS Y FORRAJES SAN JULIAN SPR DE RL')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00470', N'SDA051010BGA', N'LA 62 DE ANAHUAC SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00471', N'FBA850914SA1', N'FORRAJES EL BARRIO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00473', N'CTU041123IU4', N'CONFECCIONES TURKIMEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00474', N'ALE85091323A', N'AGROPECUARIA EL LECHON SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00475', N'ICP970709DG0', N'INTERCAMBIO COMERCIAL DE PRODUCTOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00477', N'MMO820212US6', N'((NO USAR)) MUNSA MOLINOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00478', N'BNC8507311M4', N'BANCO NACIONAL DE COMERCIO EXTERIOR SNC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00480', N'FPU0304157Q3', N'FORRAJES DEL PUERTO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00481', N'ICR030214LJ9', N'INTEGRADORA COMERCIAL DE LOS RIOS CULIACAN Y SAN LORENZO SA DE CV E.I')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00482', N'UGR850717BW0', N'UNION GANADERA REGIONAL DE PORCICULTORES DE SONORA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00483', N'CGS061211D39', N'COMERCIALIZADORA DE GRANOS SECOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00484', N'GEM040504UF6', N'GRANOS Y FORRAJES MARFIL  SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00485', N'MTM901210D10', N'MALTA TEXO DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00486', N'PIA0409109E6', N'PELUCHES E INNOVACIONES ANGEL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00487', N'ATP0306176W7', N'AGROPECUARIA 3 POTRILLOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00488', N'GAR030429LCA', N'GARBULES SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00489', N'BBA940707IE1', N'BANCO DEL BAJIO SA INSTITUCION DE BANCA MULTIPLE.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00490', N'DAS070928LP5', N'DISTRIBUIDORA DE AZUCAR SEMILLAS Y ABARROTES DAVEL Y CRISTOPHER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00491', N'RCI040526QW3', N'ROYAL CONSUMER INFORMATION PRODUCTS DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00492', N'QUCE560804G77', N'JOSE EDGAR QUINTERO CAMARGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00498', N'SPB030826U14', N'SUMINISTROS EN PRODUCTOS BASICOS DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00499', N'OEPF610727AI7', N'FRANCISCO JAVIER ORTEGA PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00502', N'NCO8507182KA', N'NUPLEN COMERCIALIZADORA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00503', N'GIS970110LE8', N'GANADERIA INTEGRAL SK SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00504', N'CGP011003IK6', N'PATRON NO USAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00507', N'AGL920228642', N'ASOCIACION GANADERA LOCAL DE PORCICULTORES DE LOS MOCHIS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00508', N'XEXX010101000', N'CLIPPER WONSILD TANKERS DA-DESK')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00509', N'APL6711264K3', N'ASOCIACION DE PORCICULTORES LOCAL DE CULIACAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00510', N'IMP901207PL5', N'INDUSTRIAS DEL MAIZ PUEBLA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00511', N'UCC951209R85', N'UNION DE COOPERATIVAS DE CONSUMO ALTEÑAS SC DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00512', N'EPP0403157Z1', N'EXPORTADORA Y PRODUCTORA DEL PACIFICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00514', N'LORP5010039D7', N'PATRICIO ENRIQUE DE JESUS LOZANO RUIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00515', N'HBE810706M32', N'HARINERA  BELEÑO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00516', N'POC780204G22', N'PROVINDUSTRIAS DE OCCIDENTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00517', N'FER020323QD7', N'LOS FERTRES AGROINDUSTRIA SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00518', N'NSS9707148C3', N'NUEVA SANTANDER S DE PR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00519', N'AEOR370929KH3', N'RAFAEL ABREGO OSORNIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00520', N'IAD961209EQ4', N'IMAGENES Y ALMACENAMIENTO DIGITAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00521', N'UTE950114FT8', N'LA UNION TEPATITLAN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00523', N'', N'PROMOTORA DE AZUCAR Y DERIVADOS S.A DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00524', N'PEB060113IV8', N'PRODUCTORES Y ENGORDADORES DE BOVINOS DEL CENTRO DE VERACRUZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00525', N'', N'CARTERA AGROINSUMOS QUIRARTE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00526', N'', N'FIDEICOMEISO ADMON. 854-2007')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00527', N'', N'DED SIACOMEX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00528', N'GSJ930406KB2', N'GRANEROS SAN JUAN SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00529', N'GRU991206157', N'GANADERA RUBIOS SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00530', N'SHN571001I66', N'SCHETTINO HNOS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00531', N'SHI010827QTA', N'SEMILLAS HIDALGO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00532', N'IME000329D9A', N'INGENICO MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00533', N'YOHA7305254Z3', N'YOO HAK YEUL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00538', N'BAG000613859', N'BALDERRAMA AGRICOLA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00539', N'FAP960722NB9', N'FIERRO Y ASOCIADOS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00540', N'OUPJ-790328-LS7', N'JORGE OSUNA PAEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00541', N'CAMA200101BIO', N'ANTONIO CASTRO MILLAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00542', N'AAN010411PS4', N'AGRICOLA ANAKAREN SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00543', N'UIEA7503274Z6', N'ALMA NIDIA URIAS ESCALANTE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00544', N'COCM710714EG7', N'MARIO ADRIAN COLUNGA CALDERON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00545', N'OUPL760908341', N'LIBERATO OSUNA PAEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00546', N'PRO940708HUA', N'SOCIEDAD DE PRODUCCION RURAL OSUNA HERMANOS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00547', N'', N'AGRICOLA LEALVA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00548', N'VACR441024A69', N'RAFAEL ERNESTO VALENZUELA CARLON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00549', N'GGU020726RT2', N'GRUPO GUDMAN SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00550', N'MOAJ700621IK7', N'JORGE MORALES ALVAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00551', N'CAGR5901183R0', N'RAFAEL CASTRO GODOY')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00552', N'ACO030305M43', N'AGRICOLA COCORAQUI SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00554', N'APA050409UVA', N'AGRICOLA PAULINA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00555', N'VAG031022691', N'VALPEZ AGRICULTORES SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00557', N'MER960302PD3', N'MERCANTA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00558', N'TLM050922MA5', N'TRESMONTES LUCCHETTI MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00559', N'CRM050629QY4', N'A C Y R MAYOREO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00560', N'CAAS570102H3A', N'SALVADOR CASTELLANOS ACEVES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00561', N'ABS980803NU5', N'.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00562', N'AMO050924CD1', N'AGRICOLA MONTGOMERY SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00563', N'SAR011015HS7', N'SARMON SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00564', N'COR920527M16', N'CORFUERTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00565', N'ABP930920F46', N'ADM BIO PRODUCTOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00567', N'', N'CARTERA CEREALEAS COMERCIALES DE LA COSTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00568', N'LULR570909766', N'LUGOS LABASTIDA RUBINIA SOFIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00569', N'ATU981015IH1', N'AGAVEROS Y TEQUILEROS UNIDOS DE LOS ALTOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00570', N'JNT020313KIA', N'JOAN NS TRADING SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00572', N'CTA071106464', N'CORPORATIVO TAE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00573', N'NAMS4602103M6', N'SALVADOR NAVARRO MARTIN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00574', N'SOCM611122892', N'MARCO ANTONIO SOTO CENTENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00575', N'BAOP390603', N'PRIMO BAENA ORTEGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00576', N'CSB021004P49', N'CORPORATIVO SMART BUSINESS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00577', N'CTE871203RL6', N'COPORACION TELCH SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00578', N'RIV840312LPA', N'RIVACOLOR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00579', N'ACV041007BG3', N'AGROPECUARIA Y COMERCIALIZADORA VALDEZ SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00580', N'CRE831230SJ3', N'COMERCIAL RECICLADORA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00581', N'OOTS640129SN2', N'SILVIA OROPEZA TORRES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00582', N'GAN051214465', N'GRANEROS ANDALUCIA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00583', N'G&A990816785', N'GRAINS & ANCILLARY CONSUMO HUMANO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00585', N'PAG950719TT2', N'PASA AGROINDUSTRIAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00586', N'UME651115N48', N'UNILEVER DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00588', N'ZME040929AV8', N'ZIGOR MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00589', N'PMP880421AI5', N'POLIMERO Y MATERIAS PRIMAS INTERNACIONALES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00592', N'MPG860912E34', N'MADERAS Y PUERTAS GAVILAN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00593', N'TLA060404Q52', N'TOON LAND SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00594', N'AGR940215K92', N'AGROACAPULCO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00595', N'AALJ730218JY1', N'JOSE ALVAREZ LEON')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00596', N'ADD970913JEA', N'AGRICOLA DON DELFINO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00597', N'ATH0211111J8', N'AGRICOLA THAILY SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00598', N'VACM3909263L7', N'MANUEL ALFONSO VALENZUELA CARLON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00599', N'AALA741216L64', N'ARTURO ALVAREZ LEON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00600', N'APS971009GL5', N'AGRICOLA PALMARITO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00601', N'PRR931224DC1', N'SOCIEDAD DE PRODUCCION RURAL DE RI SAN ELENO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00602', N'HAR811207KX1', N'HARINAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00603', N'AOMM-800926-462', N'MARIO ALBERTO ATONDO MURRIETA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00605', N'LCS960311FT3', N'LOMAS DEL COYOTE SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00606', N'COOP5509204Z8', N'PABLO CORONADO OSUNA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00607', N'CTE880324F86', N'LOS CUATRO TREBOLES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00609', N'XEXX010101000', N'INEOS ABS (USA) CORPORATION')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00610', N'XEXX010101000', N'CLIPPER TANKERS (USA) INC. DA-DESK')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00611', N'DIC880301AM1', N'DISTRIBUIDORA INTERNACIONAL CORNEJO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00612', N'IND030730E31', N'INDAGA SA DE C V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00613', N'ASI920928M64', N'ARGOS SERVICIOS INFORMATIVOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00614', N'UIM031113V5A', N'UNION DE INDUSTRIALES DE LA MASA Y LA TORTILLA DE MORELIA AC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00615', N'MPS981109AR5', N'METALES DE PRECISION Y SERVICIOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00617', N'GAC051220TG6', N'GRANELERA Y AGROPECUARIA CAMPECHANA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00619', N'OCE030305GM3', N'OPERADORA EN COMERCIO EXTERIOR Y COMUNICACIONES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00621', N'MACM460507ML4', N'MARGARITA MAGALLANES CASILLAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00622', N'BPS930914553', N'EL BARATILLO DE LOS PEREZ S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00623', N'CCA070202HL8', N'CHILES Y CONDIMENTOS AZTECA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00624', N'IVP870122BR1', N'INDUSTRIAS VINICOLAS PEDRO DOMECQ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00625', N'BBA940707IE1', N'BANCO DEL BAJIO SA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00626', N'TOFE620831D57', N'EPIFANIO TORRES FLORES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00627', N'KCO920403MI4', N'KASAVI COMERCIAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00630', N'IAC051031T73', N'INTEGRADORA AGROPECUARIA DEL CENTRO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00631', N'FTE961213I97', N'FORRAJES TESISTAN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00632', N'SES991115670', N'SESAJAL S.A DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00633', N'MSA901123FF9', N'MOLINO SAN ANTONIO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00634', N'AGR020826FN8', N'AGRODELTOR S DE PR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00635', N'GSF9804071E5', N'LA GLORIA DE SAN FELIPE SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00637', N'GTI031020SZ3', N'GANADERA LA TIZAPA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00638', N'BCA0303127J9', N'BALL-CASTRO AGRICULTORES SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00639', N'ASL071017GT8', N'ALMACENES SAN LAZARO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00640', N'GME970929NP1', N'GAVILON NO FACT.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00641', N'GAQ7606172A6', N'GANADEROS ASOCIADOS DE QUERETARO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00642', N'UAA080903UNA', N'UNIDAD COOPERATIVA AGRICOLA ALDAMA SC DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00644', N'UGR630816646', N'UNION GANADERA REGIONAL DE QUERETARO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00645', N'FAA0707051P1', N'FONDO DE ASEGURAMIENTO AGRICOLA VALLE SIERRA Y COSTA DE JALISCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00646', N'SAK0111191Z0', N'SERVICIOS AGRICOLAS KINO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00647', N'', N'UNION DE ENGORDADORES DE GANADO DEL ESTADO DE SONORA AC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00648', N'INP020306QV6', N'INPIASA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00649', N'CBA050824IF1', N'CAMPESINA DEL BAJIO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00650', N'TMO000310MP0', N'TRANSPORTES MARITIMOS DE OCCIDENTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00652', N'GCH050829RG7', N'GRANEROS CUATRO HERMANOS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00653', N'FDA0709248R8', N'"FIDEICOMISO DE ADMINISTRACION ""854/2007"""')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00654', N'UNI030325RT5', N'UNIAGRI S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00655', N'TME460628BF4', N'TUBELITE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00656', N'ZPG060420TL0', N'LA ZACATECANA EN PRODUCTOS GRANOS Y SEMILLAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00657', N'SCA990506J14', N'SEMILLAS CASILLAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00658', N'NAM060117JXA', N'EL NOGAL AHUALULCO DE MERCADO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00659', N'CSL051214NR5', N'CORRALES SAN LUIS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00660', N'PME050127HZ4', N'EL POTRILLO DEL MEZQUITAL S DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00661', N'RME981211S39', N'RISH MEXICANA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00662', N'PPN080903PI9', N'PRODUCTORES DEL PORVENIR DEL NORTE SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00663', N'PPS080910FA5', N'PRODUCTORES EL PORVENIR DE SAN LUIS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00665', N'XEXX010101000', N'HANJIN SHIPPING CO LTD/SEOUL HEAD OFFICE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00667', N'SPR040224351', N'SLACE PRICE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00668', N'WFR990326DK0', N'WATER FRACE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00669', N'PAS040928CX5', N'PRODUCTORES AGRICOLAS DE SANTIAGO MARAVATIO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00671', N'BBA940707IE1', N'BANCO DEL BAJIO SA INSTITUCION DE BANCA MULTIPLE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00675', N'AGL011218FH3', N'ASOCIACION GANADERA LOCAL ESPECIALIZADA EN PORCINOS DE PURUANDIRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00676', N'HIM890120VEA', N'HERBALIFE INTERNACIONAL DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00677', N'', N'PRODUCTORES Y COMERCIALIZADORES SINALOENSES SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00678', N'UPC9808314C0', N'UNION Y PROGRESO DEL CAMPO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00679', N'GUCC5501175D4', N'JOSE CRUZ GUIDO CRUZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00680', N'GPS040520HV5', N'GRUPO PROGRESO DE SAN MIGUEL DE LA PAZ SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00681', N'PRE0008161K3', N'PUENTE LA REYNA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00682', N'NPL020621KK0', N'NUTRI PLUS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00683', N'MEME551125QN9', N'ERASMO MEDINA MEDINA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00684', N'PMS060518SH1', N'PRODUCTORES DE MAIZ DE SOCONUSCO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00686', N'COM980115CP2', N'COMERSIN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00687', N'OETL601015U15', N'MARIA TERESA OLVERA LERDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00688', N'FNI0301173K4', N'FERTILIZANTES NITRO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00689', N'FGS060303EH6', N'FERTI-RIZO GRANOS Y SEMILLAS SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00692', N'MLE840322MY5', N'MAQUINARIA LIGERA EQUINTER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00693', N'IPI871022QHA', N'INDUSTRIAS PIAGUI SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00694', N'', N'CARTERA YORBA ALIMENTOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00695', N'', N'CARTERA ASOC USUAR POZO RIEGO NTE EDO ZAC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00696', N'RMA020614SJ7', N'RANCHOS EL MACHETE SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00697', N'VAM870320RI3', N'VINOS AMERICA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00698', N'MME960821JHA', N'MOLINERA DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00699', N'DOS080717UJ2', N'DOSEIA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00700', N'', N'*')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00701', N'GAG030225NP3', N'GRUPO AGROBAN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00702', N'CTI8806152U8', N'CANDILES TIFFANY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00703', N'GOTM790607R79', N'MANUEL JAVIER GOMEZ TREVIÑO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00704', N'KQI071019BJ2', N'KANG QING SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00708', N'IURM590331MR9', N'MENJAMIN EDBERTO INZUNZA ROCHA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00709', N'AIG060331NT4', N'AGRO INDUSTRIAS GUERRERO AZTECA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00710', N'TAB060125F17', N'TRANSPORTES ABR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00711', N'CORP681123HA6', N'PEDRO CORREA REVELLES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00715', N'POL9502155R0', N'POLYRESINAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00716', N'CAVJ650815293', N'JOEL CAMPOS VIDRIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00717', N'VCA011001MF9', N'LA VALERIO CAMACHO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00718', N'PMA871021410', N'PRODUCTOS MANUELJOSE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00719', N'IAG080610PI2', N'IMPULSORA AGRICOLA GAM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00720', N'PAM94062129A', N'PROVEEDORA DE ALIMENTOS MEXICO SA DE CV')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00721', N'GAGG711211AQ0', N'GABRIEL GARCIA GOMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00722', N'CVI050704MMA', N'CORRALES LA VILLITA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00724', N'YDE020508N35', N'YANMAR DESIGN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00725', N'BRJ9812265C5', N'BIENES RAICES JARDIN REAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00727', N'CAR070416JU0', N'CONSULTORES ARIAGUI SC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00728', N'CAL020913PP4', N'CALTEMEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00731', N'IAC060202LU2', N'IMPULSORA AGROPECUARIA CHAVINDA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00732', N'GAAD810818HI5', N'DULCE VANESSA GALLARDO ARAUJO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00733', N'SORS721221212', N'SAUL SOTO RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00734', N'AMA990102HL7', N'AGROPECUARIOS MARFIL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00735', N'FOLA660922176', N'ANTONIO FLORES LAUREANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00736', N'YGI031201MR4', N'YANG GUANG INTERNACIONAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00737', N'VCJ5002243F2', N'JORDI VILET COMPEAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00738', N'UGR6201105V5', N'UNION GANADERA REGIONAL DE PORCICULTORES DE MICHOACAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00739', N'IMA071220I50', N'IMPORTADORA MEXICANA DE ARTICULOS PARA REGALO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00740', N'XEXX010101000', N'WESTERN BULK CARRIERS (SEATTLE) INC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00742', N'TME080528SA8', N'TIZARO MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00743', N'SHG050204QX4', N'STAR HIUMMA GROUP SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00744', N'ISO0407153Y8', N'IMPORT SOLUTION SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00745', N'TCO0312123J5', N'TENDENCIAS Y CONCEPTOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00746', N'NGE040202210', N'NEUE GESELLSCHAFT SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00747', N'LON9901079Y7', N'LONGYING')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00748', N'FTE031210459', N'FORUSTECHNOLOGY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00749', N'CSS0402173P3', N'CARGO AND SPEED SERVICES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00750', N'AARL6105073M5', N'MARGARITA MARIA ALVARADO RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00751', N'APL940110D99', N'AMERICAN PRESIDENT LINES LTD')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00752', N'MEG061006NQ4', N'MAQUINAS Y ELEMENTOS ZUMEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00753', N'CFE080410S28', N'COMERCIALIZADORA FERRETI SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00754', N'CLI060718763', N'CTI LOGISTICA INTERNACIONAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00755', N'LZE6408242X4', N'ZERBONI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00756', N'GBG921201950', N'GRUPO B G & B SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00757', N'FME070925QG2', N'FTO MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00758', N'COP030402579', N'CONSTRUCTORA DE OBRA PUBLICA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00759', N'SME070207I11', N'STOCKSUR MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00760', N'ITR0807294I0', N'IMPERIAL TRADERS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00761', N'DFR900521S8A', N'DISTRIBUIDOR EL FROMAR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00764', N'PPQ860424M69', N'PP QUALITY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00765', N'HAN040701FX5', N'HANDELL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00766', N'MRO000505D3A', N'MEDI ROYAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00767', N'HEL890406QN7', N'HEISEI ELECTROMEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00768', N'MOLA870114LS6', N'ALAIN MORALES LIBREROS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00769', N'EUVA6010206V7', N'ALBERTO ESQUER VERDUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00770', N'ROBI580731SE4', N'IGNACIO ROMAN BENITEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00771', N'ABA961026EF3', N'AGROPECUARIA BAROBAMPO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00772', N'RARM460829RU6', N'MIGUEL RAZCON RAZCON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00773', N'AIMG600919IP5', N'GABINO ADRIANO MEZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00774', N'YEGA7203257GA', N'AIDE YEE GASTELUM')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00775', N'GFI061221Q75', N'GET FASHION IMPORTACIONES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00776', N'TBO070112PG0', N'TOUCH BOUTIQUE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00777', N'MAN9511281F4', N'MOLINOS ANAHUAC SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00778', N'ASE931116231', N'AXA SEGUROS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00779', N'PFC0401268W3', N'PRODUCTOS FINOS CHAROLES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00780', N'SME0009194H1', N'SIPC METROPOLITANA  SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00781', N'EPA8310317J5', N'EMPAQUES DE PAPEL AMERICA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00782', N'MRO0106186F9', N'MOTOROAD SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00784', N'ATE080419LB2', N'AGROPECUARIA EL TECOMATAL SPR DE RI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00785', N'SRO810925GZ1', N'SLIM ROYAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00786', N'SUP030725LB6', N'SUPERWIN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00787', N'RIM890406GJ5', N'RADIO DIAGNOSTICO POR IMAGEN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00788', N'CIN8310066Z6', N'CONVERTIDORA INDUSTRIAL SAB DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00789', N'WCG081114SU3', N'WOLKMEX CONSULTING GROUP SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00790', N'LRD070919QZA', N'L R D V SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00791', N'GRI011023BZ6', N'GRIMATEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00792', N'PGU071003MS7', N'PRODUCTOS GUSANITO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00793', N'LIBI8208151I0', N'BIN HONG LIAO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00794', N'IABE7711225Y8', N'ERICK ARTURO IBARRA BAÑOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00795', N'', N'MIRIAM MARGARITA JASSO RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00796', N'PBO060815L64', N'PLASTIC BOXES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00797', N'MOLA880713UQ6', N'AARON MORALES LIBREROS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00799', N'PRI460307AN9', N'PARTIDO REVOLUCIONARIO INSTITUCIONAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00800', N'LFI0604195N2', N'LOW FLOW IRRIGATION SC DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00801', N'NAV8610284F4', N'NAVIOMAR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00802', N'CAA000617TS4', N'COMERCIALIZADORA AGRICOLA AMUR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00803', N'QDL790104TX1', N'QUESERIA DOS LAGUNAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00804', N'BRC0812162T2', N'BIENES RAICES DE CIUDAD SAHAGUN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00805', N'', N'RAICES HIDALGUENSES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00806', N'', N'THIEN & HEYENGA GMBH')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00807', N'CAL031230UL6', N'CAMPI ALIMENTOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00808', N'OUGR5601313X5', N'RAQUEL OSUNA GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00809', N'IDD070314QA0', N'IMPORTACION Y DESARROLLO DE LA MODA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00810', N'BAFH721101U5', N'HUGO BATREZ FLORES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00811', N'OTL050328NN4', N'OL TONAL LEH SC DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00813', N'DMA8701156WA', N'DOS MATAS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00814', N'TEJ000414RT1', N'LAS TEJERIAS S.P.R. DE R.L.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00815', N'COP920428Q20', N'COPPEL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00816', N'CMA0712196U3', N'COMERCIALIZADORA MAGUEN S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00817', N'RTL990625JA8', N'LA REFORMA DE TLATILCO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00818', N'IMM050429BFA', N'ISUZU MOTORS DE MEXICO S DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00819', N'LME070111DE1', N'LEADMOREWIN MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00820', N'LPS080131PV0', N'LOGISTICA PROMOCIONAL SIGMA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00821', N'GRU0109252R7', N'GRUPAMA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00823', N'PAT090218M4A', N'PRODUCTORES AGRICOLAS TENAMAXTLI SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00825', N'TADE700826F39', N'ESTHER PAREDES DUARTE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00826', N'PAHF5208197K6', N'FIDENCIO PARTIDA HUERTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00827', N'JAGG780106PM8', N'GIOVANNI JAVIER JASSO GINORI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00828', N'COM0510208I6', N'COMPROAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00829', N'FCO040514M90', N'FUTURE CORPORATION SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00830', N'DME070920IN4', N'DISTRIBUIDORA MEXICANA DE ESTILOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00831', N'XEXX010101000', N'WESTERN BULK CARRIERS (SEATLE) INC. DA-DESK')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00832', N'HEPJ380812', N'JORGE MARIO HENRIQUEZ PEÑARIZPE')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00833', N'', N'AGROINSUMOS QUIRARTE SA DE CV S O F O M E N R')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00834', N'GAC090226P36', N'GOAXICAR AGRICULTURA Y CAMPO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00835', N'GPG090218CD7', N'GRUPO PRODUCTOR DE GRANOS BASICOS DEL GRAN VALLE DE AMECA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00836', N'ACS090226UK2', N'AGROPRODUCTORES  Y COMERCIALIZADORES EL SALITRE  DE MASCOTA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00837', N'MMM041206JDA', N'MAZDA MOTOR DE MEXICO DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00838', N'', N'MITSUI OSK LINES LTD')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00839', N'PAC010707GY2', N'PRODUCTORES AGROPECUARIOS EL CHIFLIDO  SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00840', N'EBE8203209W3', N'EXCLUSIVAS BENET SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00841', N'NIR9904129J6', N'NIRTEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00842', N'MME960821JHA', N'MOLINERA DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00843', N'MCE8506142G8', N'MOLINO CENTRAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00844', N'MGU840223U79', N'MOLINO GUADALAJARA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00848', N'PCA950322898', N'PRODUCTORES Y COMERCIALIZADORES AGROPECUARIOS RANCHO LAS MARAVILLAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00849', N'GIV970203LS1', N'GRUPO INDUSTRIAL VIDA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00850', N'GCA080424SH4', N'GRANERO EL CARRIZO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00851', N'JIVS570208J96', N'SALVADOR JIMENEZ VARGAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00852', N'UNI0309185YA', N'UNION NACIONAL DE INDUSTRIALES DE MOLINOS Y TORTILLERIAS CINTEOTL AC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00853', N'ISU030513UT1', N'INAGRO DEL SUR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00854', N'AGP9808197I9', N'AMERICAN GLASS PRODUCTS DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00856', N'SPR9103251C3', N'SUKARNE PRODUCCION SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00857', N'TSA981027R59', N'TRILLAS SAHAGUN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00858', N'KIN781004PQA', N'KOOR INTERCOMERCIAL SA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00859', N'PMO960711EJ6', N'PASTAS MOLISABA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00860', N'CCO080228SI6', N'COMERCIALIZADORA EL CORDOBES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00861', N'MAR940516K16', N'MEXICANA DE ARROZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00862', N'IMA870910CG4', N'INDUSTRIALIZADORA DE MANTECAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00863', N'LUX080208DQ2', N'LUXAMEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00865', N'VAOR560312SA9', N'JOSE RAFAEL VALLE OROPEZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00866', N'GFR090520CR9', N'GANCHOS FREILAJ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00867', N'ABS850918464', N'ALIMENTOS BALANCEADOS SALAMANCA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00868', N'MME960821JHA', N'MOLINERA DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00869', N'LPA090312SD7', N'LATINAMERICAN PANELS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00870', N'', N'CARTERA JISALY')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00871', N'GDJ061115539', N'GRANEROS DON JESUS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00872', N'YYI 070302 2G9', N'YI YUN INTERNACIONAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00874', N'GIV931231AN9', N'GANADERIA INTEGRAL VIZUR S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00875', N'SCO950731BE9', N'SOMA COMERCIALIZADORA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00876', N'BSP0408314I3', N'BS SPORT SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00877', N'SIN940103HG3', N'SCHENKER INTERNATIONAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00878', N'CDC940429P13', N'CDC SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00879', N'PDM061115JD6', N'PROMOTORA DE DESARROLLO MERCANTIL DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00880', N'PEI070829360', N'PEIFU SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00881', N'ASP990306574', N'AGRO SERVICIOS A PRODUCTORES DEL VALLE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00882', N'GES000425DV2', N'GRANEROS ESPINOZA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00883', N'AGZ050203LG2', N'ALGODONERA GZ S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00884', N'BCO021121QK7', N'MOLINERA LA ESPIGA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00886', N'AGI990630V83', N'AGIRUCHA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00887', N'AUS0004106Y4', N'UNIDOS DE STA APOLON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00888', N'PAC8802197A1', N'COOPERATIVA DE PRODUCCION AGRICOLA LOS CASTRELLON SCL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00889', N'HLA900718TBA', N'HECTOR LUNA Y ASOCIADOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00890', N'IEL010306EN0', N'IELESA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00891', N'GCM930713FK2', N'GRANJAS CARROLL DE MEXICO S.DE R.L. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00892', N'OXFR590416IY2', N'ROLANDO ORR FLORES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00894', N'DPC940701N56', N'DON PEPE COFFEE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00895', N'ROMC510122NH4', N'CECILIA RODRIGUEZ MORALES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00896', N'AUMJ6807101J4', N'JESUS DANIEL AGUILAR MENDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00897', N'MOSL591224QG7', N'LUCAS SAMUEL MONTES SALAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00898', N'AAT0706124G6', N'AGRICOLA Y ACUICOLA EL TREBOL SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00899', N'ZABB630919HE7', N'BERTHA LETICIA ZAVALA BUITIMEA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00900', N'EAVE620306TQ6', N'ENRIQUE ESCALANTE VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00901', N'EBH0609256K3', N'ENGORDA DE BECERROS HILUA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00902', N'SPR8503197I5', N'SOCIEDAD DE PRODUCCION RURAL LA INDIA DE SAN FERNANDO S DE PR DE RS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00903', N'IPS920622B22', N'INDUSTRIAS PECUARIAS SAN PEDRO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00904', N'GORG770101EI5', N'GONZALO GONZALEZ ROJAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00905', N'BLI040203098', N'BABY LIDER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00906', N'MERH6807172E7', N'HERCULANO HECTOR MEDINA ROSALES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00907', N'GUCA6712289F5', N'ARACELI GUTIERREZ CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00908', N'TFO040621233', N'TOTAL FORGING SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00909', N'TAE001025SW6', N'TECNOLOGIA APLICADA AL ESPARCIMIENTO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00910', N'LIV0307258F7', N'LIVYLU SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00912', N'ROR080815B84', N'REFLEJOS DE ORIENTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00914', N'ATS990716TA7', N'ASESORES Y TECNICOS SCHULZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00915', N'ACO080208S93', N'ANTARTICO COMERCIALIZADORA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00916', N'TIM080222G74', N'TIMELINE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00917', N'TAB030611UF1', N'TABACOLMEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00918', N'YUMJ570822NH0', N'JIANG YU MEI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00919', N'PSM940429BM5', N'PATRON SPIRITS MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00920', N'LAT080924G66', N'LATORIEN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00921', N'DFG970915LIA', N'DR FRANCISCO GALVAN MALO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00922', N'GLM930211R75', N'GRUPO LOZANO MIGOYA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00923', N'LIB060815U50', N'E  LIBROS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00924', N'DEE891205DV4', N'DESARROLLO DE ENGORDAS ESTABULADAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00925', N'CES960228K40', N'CORRALES DE ENGORDA SAN PEDRO S DE R.L. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00926', N'CSP840511GB2', N'LA CACHARAMBA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00927', N'GRA031015KC0', N'GRADESA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00928', N'CPO8411063D5', N'COMERCIALIZADORA PORTIMEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00929', N'NTE0505272CA', N'NUXIBA TECHNOLOGIES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00930', N'ARG060125BN0', N'AGRICOLA RGA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00931', N'PRR931224DC1', N'SAN ELENO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00932', N'APV960815PR8', N'AGRICOLA PALOS VERDES SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00933', N'SAAI600731HG3', N'IGNACIO SANCHEZ ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00934', N'SAGL551123QT0', N'LUCIANO SANCHEZ GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00935', N'ADL080624LZ6', N'AGRICOLA DIANA LAURA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00936', N'AOUP6508164L1', N'PEDRO ASTORGA ARAGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00937', N'ARA080303E77', N'AGRICOLA RAFRAL SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00938', N'OUPI7410172X3', N'IGNACIO OSUNA PAEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00939', N'ACR990405BGA', N'SOCIEDAD AGRICOLA CRUZ ROBLES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00940', N'RONJ580308P17', N'JUAN MANUEL ROMERO NIEBLAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00941', N'RORC680430IA8', N'CLAUDIO ROMAN RUIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00942', N'DDI050819LQ4', N'BANCO JP MORGAN SA INSTITUCION DE BANCA MULTIPLE GRUPO FINANCIERO JP MORGAN DIVISION FIDUCIARIA FID F/00230')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00943', N'FER050418R15', N'FEROCO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00944', N'PAS040903M58', N'PRODUCTORES AGROPECUARIOS DEL SUR DE SAN FERNANDO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00945', N'', N'CARTERA GRANEROS EL ALHUATE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00946', N'TSM020521TA1', N'TECNO SERVICIO MULTIMODAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00947', N'EAL971014MT5', N'EMPAQUES Y ACABADOS LITOGRAFICOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00948', N'', N'LORENZO AMADOR RUSSELL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00949', N'CQU000502RS7', N'CHAPA QUIROGA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00950', N'SIC080730CG6', N'SERVICIOS DE INTELIGENCIA COMERCIAL AGRICOLA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00951', N'GIM040906JU0', N'GANADERIA INTEGRAL MONARCA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00952', N'XEXX010101000', N'DAGE PRECISION INDUSTRIES  INC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00954', N'ATA090313SU0', N'AGRONEGOCIOS TASA S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00955', N'PJA870102N15', N'PLASTICOS JALOMA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00956', N'LJA870102KE4', N'LABORATORIOS JALOMA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00957', N'GVA060606MP2', N'GRUPO VARLOM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00958', N'ECH020406LL2', N'ENLACE COMERCIAL EL HORIZONTE S A DE C V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00959', N'MER950227TXA', N'MERCOVA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00960', N'GFS9708288S4', N'GRANOS Y FERTILIZANTES DEL SUR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00961', N'CMA090415JX8', N'CSB MAQUILAS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00962', N'BMA090415MJ8', N'BEST MAK S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00964', N'AUHM6204197Q3', N'MELESIO ANGULO HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00965', N'FERR670703NM4', N'ROSANA FELIX RUIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00966', N'AUHC681228NX8', N'CLAUDIA ANGULO HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00967', N'SZE020823UJ2', N'SHEN ZEN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00968', N'', N'PIONEER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00970', N'CCS930708SL9', N'C. CZARNIKOW SUGAR (MEXICO) SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00971', N'CCS0309255N5', N'COMERCIALIZADORA DE CEREALES Y SEMILLAS ARREOLA CASTELLANOS SC DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00972', N'ARH0504197X3', N'AGROPRODUCTOS ROLDAN HERMANOS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00973', N'XEXX010101000', N'DT INDUSTRIA E COMERCIO LTDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00974', N'PCG9204061W5', N'PRODUCTORA Y COMERCIALIZADORA DE GRANOS DEL VALLE DE ATEMAJAC SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00975', N'RSR9408016Q8', N'RANCHO SANTA RITA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00976', N'HEOE601228', N'EDUARDO HERNANDEZ ORDAZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00977', N'AME990329778', N'ALGODON MEXICANO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00978', N'ASC910416PK6', N'APOYOS Y SERVICIOS A LA COMERC. AGROPECUARIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00979', N'EZS961107QR8', N'ENGORDA ZAPOTILLO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00980', N'AAM640401QV4', N'ASOCIACION DE AVICULTORES DE LOS MOCHIS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00981', N'BGE080221LI4', N'BANCO GENERAL SA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00982', N'', N'CARTERA INTEGRADORA DE GRANOS DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00983', N'HCS020411TM8', N'HIGH CHEM SPECIALTIES MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00984', N'IMC970520JI2', N'IMCOSA S A DE C V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00985', N'GAP921230DM8', N'GANADERIA ADDTUL SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00986', N'IND090415JU0', N'INDOTEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00988', N'CRO080411P22', N'CROSSTEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00989', N'DME0205279YA', N'DISTOP DE MEXICO S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00990', N'GAN010518MS9', N'GRUPO DE AGRICULTORES DE NANACAMILPA ORGANIZADA SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00991', N'LAT000222EKA', N'LATINGRAPH SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00992', N'MBL0809097H2', N'MARINO Y BLANCO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00993', N'', N'CARTERA AGAVEROS Y TEQUILEROS UNIDOS DE LOS ALTOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00994', N'DCO090304TE0', N'DOMINO COMERCIO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00995', N'CFV0502243E7', N'CORPORATIVO FINANCIERO VIMIFOS SA DE CV SOFOM ENR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00996', N'DBE940905Q94', N'DENDRO BIOCIDAS Y ESPECIALIDADES QUIMICAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00997', N'SEC090724PJ5', N'SERVICIOS EDUCATIVOS Y CULTURALES VERSALLES SC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00998', N'FUN810929AR9', N'FUNCOSA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'00999', N'CTO8611154D7', N'CAFES TOMARI SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01000', N'BLA060208UX2', N'BLAMIVEEL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01001', N'CON081205NM7', N'CONASORGO SA DE CV SOFOM ENR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01003', N'ASP050119AS4', N'AGRICOLA SAN PATRICIO S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01004', N'RCO0808266R0', N'RANCHO EL COCHI DE ORO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01005', N'ADH941114PX3', N'AGROPECUARIA DOMINGUEZ HERMANOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01006', N'', N'BIBLOMODEL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01007', N'COG011017FR1', N'COGAFO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01008', N'', N'MANIOBRAS ESTRATEGICAS DEL PACIFICO SA DECV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01009', N'BGP870821R59', N'BUENAVENTURA GRUPO PECUARIO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01011', N'CDF090305D78', N'CORPORATIVO DE DULCES Y FRANQUICIAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01012', N'ALH021105KL2', N'AGROPRODUCTOS DEL LIBRAMIENTO DE HUEYOTLIPAN SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01013', N'MBE080519V14', N'MAQUILAS EL BEDAT S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01014', N'', N'MARUBA SCA EMPRESA DE NAVEGACION  MARITIMA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01015', N'AAA980109JK5', N'AGROSERVICIOS DE ATOTONILCO EL ALTO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01016', N'VMA831219B87', N'VIDRIOS MARTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01017', N'', N'CRIADERO Y ENGORDA SANTA ROSA S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01018', N'PAP081013CF3', N'PRODUCTORA AGROPECUARIA PAVI SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01019', N'ZMO0907228Q2', N'PRODUCTOS GOLFO DE CALIFORNIA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01020', N'ASP0908241X0', N'ASPETEL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01021', N'DME0205279YA', N'DESTOP DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01022', N'GLE0902071PA', N'GL EXPRESS DELIVERY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01023', N'PVT830418JR1', N'PREMEZCLAS Y VITAMINAS TEPA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01024', N'AGL700829KJI', N'ASOCIACION GANADERA LOCAL DE PORCICULTORES DE QUERETARO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01025', N'NFA900214FL9', N'NUEVA FASE AUTOMOTRIZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01026', N'ACN090624B54', N'AGROCOMERCIAL CAMPO NUEVO SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01027', N'MMS980115G57', N'MANUEL MURUA SOCIEDAD DE SOLIDARIDAD SOCIAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01028', N'ARE051130EY3', N'AGRICOLA REMQUR SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01029', N'ACC9502289V3', N'ALMACENADORA Y COMERCIALIZADORA COHUIRIMPO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01030', N'PAI970106HM8', N'PROCESADORA DE ALIMENTOS INTEGRALES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01031', N'AVI0901303B8', N'AGROCOMERCIAL VIZCAYA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01032', N'DCA061214FT5', N'DINA COMERCIALIZACION AUTOMOTRIZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01033', N'GRY9808065V1', N'GRYSAM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01034', N'CEG090909HU7', N'COMERCIALIZADORA EGC S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01035', N'GPT890807CJ9', N'GRUPO PESSAH TEXTIL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01036', N'ABS980327VC9', N'ALIMENTOS BALANCEADOS Y SERVICIOS INTEGRADOS 2070 SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01037', N'LASJ6412197U2', N'JORGE LARRACOECHEA SIUROB')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01038', N'PRR8806231W6', N'SOCIEDAD DE PRODUCCION RURAL DE RI GUICURIM')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01039', N'PTU030924T95', N'PORCICOLA LA TUNA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01040', N'FOGR610501U20', N'RODOLFO ENRIQUE FLORES GOMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01041', N'NUN090403LI5', N'NAMSI 001 SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01042', N'AUM980109Q78', N'AGROINDUSTRIAS UNIDAS DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01044', N'PYD020618GS4', N'PYDEME S DE RL DE C V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01045', N'TDJ980729ER2', N'TEQUILA DON JULIO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01046', N'CTR050128MW8', N'CATINO TRAFFIC SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01047', N'NAS890915618', N'NUTRICION Y ALIMENTOS DE SONORA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01048', N'FRI030228PX2', N'FRITIERRA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01049', N'GCO891206RV7', N'GRAMA COMERCIAL S.A. DE C.V.')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01050', N'TOM0907025B1', N'TOMOVALVIS SA DE C V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01051', N'EAB860224MH6', N'EMPACADORA ABETO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01052', N'IAF0808118Y5', N'IMPULSORA DE AGRICULTORES DE FRIJOL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01053', N'INA080818531', N'INTEGRADORA NACIONAL AGROINDUSTRIAL DE AGRICULTORES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01054', N'IAG080721M88', N'INTEGRADORA AGROINDUSTRIAL DE GRANOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01055', N'GAL900207HI9', N'GALDISA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01056', N'CAOJ800501B86', N'JUAN CARLOS CARLON OBESO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01057', N'DGO051216PG6', N'DISTRIBUIDORA GONZAVILA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01058', N'ECL040220DV7', N'ENLACE COMERCIAL Y LOGISTICO BARB`S SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01059', N'IJ&091020GI1', N'IDA J&G SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01060', N'IOL980901893', N'INDUSTRIALIZADORA OLEOFINOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01061', N'IOL940721IZ8', N'INDUSTRIAL DE OLEAGINOSAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01062', N'VME640813HF6', N'VOLKSWAGEN DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01063', N'ACA990109U44', N'AGROPECUARIA EL CARACOL SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01064', N'', N'CARTERA EL BARATILLO DE LOS PEREZ SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01066', N'', N'CARTERA MARIANO MATAMOROS DE SAN ANTONIO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01067', N'IGM050714526', N'IMPULSORA GANADERA DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01068', N'IGS0712014E5', N'IMPULSORA GANADERA DEL SUR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01069', N'CIC050729BH6', N'CONSORCIO INTERNACIONAL DE CARNES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01070', N'PPM9811262S7', N'PROMOCIONALES PACIFICO DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01071', N'GCO000912P20', N'GIFTS COLLECTION SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01072', N'GSU990521TI3', N'GRUPO SUPPLIER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01073', N'', N'SOLUCIONES ECOLOGICAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01074', N'RIO0505182E2', N'RIOMEGA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01075', N'MMO020404R92', N'MB MOTOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01076', N'EGQ0506152U1', N'ENGORDA DE GANADO EL QUERETANO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01077', N'GST0902094I3', N'GRUPO SOLUZIONI TOTALI DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01078', N'G&A0011173F0', N'GRAINS & ANCILLARY DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01079', N'MOPJ6201148G6', N'J. HILARIO CARLOS MONTES PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01080', N'GPP9009292J8', N'GRANJA PORCINA PARALELO 38 SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01081', N'LIWE680831C16', N'WENJUN LI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01082', N'CCI971201KP1', N'CONSTRUCTORA CIG SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01083', N'MARA8809211J8', N'AZUCENA GUADALUPE MALDONADO RUANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01084', N'BAPL470711HGRHNS08', N'LUIS BAHENA PINEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01085', N'HMS0701119P8', N'HINO MOTORS SALES MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01086', N'CCC0310319Z8', N'CR CARNES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01087', N'MAS970311L62', N'MD AGROPRODUCTORES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01088', N'PIS 830325NG3', N'PRODUCTOS INFANTILES SELECTOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01089', N'', N'BALTMORE MANAGEMENT LTD')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01090', N'MTR950313325', N'EL MORRO TRADE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01091', N'CVE031001DM8', N'EL CLUB DE VENTAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01092', N'MSE090625BG1', N'MAK SERVICIOS SA DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01093', N'ONE071127AN7', N'ONE-HUNDRED-YEARS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01094', N'PVV740917JW1', N'PRODUCTOS VERDE VALLE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01095', N'IPG041216E19', N'INFRAESTRUCTURA PORTUARIA DEL GOLFO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01096', N'TAG030319B48', N'TORRES AGRICOLA SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01097', N'IAO941104I27', N'ING ARRENDADORA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01098', N'LIN090324GZ0', N'LONGYING INTERNACIONAL  SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01099', N'CSP090917BH0', N'CZARNIKOW SERVICIOS PERSONALES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01100', N'IMC970520JI2', N'IMCOSA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01101', N'EOR0912145B0', N'.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01102', N'BIM080929667', N'BCC IMPORTACIONES S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01103', N'HACW8212213N0', N'WADED INER HALABE CAMPOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01104', N'XYZ0904307ZA', N'XIAO SA YI ZU  SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01105', N'UAN090617GZ9', N'UNION AGROPECUARIA NAGOR SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01106', N'COM9411297L9', N'COMERCIAL 2G SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01107', N'XEXX010101000', N'UNION PACIFIC RAILROAD')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01108', N'SCM980320I19', N'SIG COMBIBLOC MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01110', N'HEGH780425M24', N'HUGO MANUEL HERNANDEZ GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01111', N'PIN990928I64', N'PERFIL INTEGRAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01112', N'WME901128EX2', N'WESTWAY DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01113', N'FSD000523UR9', N'FIDEICOMISO PARA EL FINANCIAMIENTO DE LA MICRO Y PEQUEÑA EMPRESA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01114', N'QCS931209G49', N'QUALITAS COMPAÑIA DE SEGUROS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01116', N'ATR710803298', N'ARCELORMITTAL LAS TRUCHAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01117', N'', N'MARGARITA HERNANDEZ GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01118', N'ENA940701IC4', N'EURO NOVEDADES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01119', N'ZBM071127F45', N'ZENON BEAUTY MEXICO  SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01120', N'SDI970703ID7', N'SISTEMA PARA EL DESARROLLO INTEGRAL DE LA FAMILIA DEL DF')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01121', N'ADZ841009FY9', N'ALEACIONES DENTALES ZEYCO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01122', N'HMJ920106HA5', N'HARINERA DE MAIZ DE JALISCO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01123', N'CDM050503NN3', N'COBY  DIGITAL MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01124', N'MTR010629II5', N'MB TRIPLAY S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01125', N'SDT9105246L8', N'SISTEMAS DIGITALES EN TELEFONIA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01126', N'NME980506LPA', N'NESTLE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01127', N'VME980219DF4', N'VIMAR DE MEX S A DE C V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01128', N'STM000215AG9', N'SUCDEN TRADING MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01129', N'PTM100302UV5', N'PRIDE TEX MEXICO  S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01130', N'FSA1001212J2', N'FOOD SERVICE  & JOES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01131', N'CCA0912179A6', N'CORPORATIVO CALBI SA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01132', N'OIOD441224JA8', N'DANIEL ORTIZ OLAZABAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01133', N'IOC010723IG4', N'INDUSTRIAS OCAMPO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01134', N'', N'CARTERA A.S.T.E.C.A.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01135', N'UEP840913E28', N'UNION DE EJIDOS PARA LA PRODUCCION INDUSTRIALIZACION COMERCIALIZACION Y DE SERVICIOS DEL RAMO AGROPECUARIO DE RESPONSABILIDAD ILIMITADA DENOMINADA LIC. ADOLFO LOPEZ MATEOS DEL VALLE DEL CARRIZO AHOME SINALOA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01136', N'AGS020715T11', N'AGRICOLA GANADERA SAN RAFAEL SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01137', N'IMP0009216A4', N'IMPROBA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01138', N'API100222GS9', N'ABSORBENTES PIN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01139', N'TMA990412KAA', N'TAIWAN MAYORISTA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01140', N'CRE100118IN7', N'CREDITMI SA DE CV SOFOM ENR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01141', N'', N'COMERCIALIZADORA CAZADORA LUPITA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01142', N'IME061130MA2', N'INDUSTRIAS MEXSTARCH S.A.P.I.  DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01143', N'EHE040428MP7', N'ESPA HERMANOS AR DE IC DE RL.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01144', N'LSO090609V5A', N'LASSENCANYON SOUTH SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01146', N'MAI920508JA5', N'MAIZORO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01147', N'NHO020603JT0', N'NICE HOME S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01148', N'VCO000308JAI', N'VALI COMERCIAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01150', N'GCO700803V61', N'GRANEROS CONTINENTAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01151', N'HFU051212A38', N'HORNOS DE FUNDICION SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01152', N'CAV761223KU2', N'SOCIEDAD COOPERATIVA DE CONSUMO AGROPECUARIA VALLE HERMOSO SCL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01153', N'NUT0610246I7', N'NUTRI SOW SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01154', N'GHI030725148', N'GRAMOSA HIDALGO SA DE CV')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01155', N'GAG061024RYA', N'GRAMOSA AGROALIMENTOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01157', N'AAR4208089Q6', N'ASOCIACION DE AGRICULTORES DEL RIO SAN LORENZO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01158', N'GAGR6110015W8', N'ROGELIO GARCIA MORENO GARZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01159', N'', N'CARTERA GRAINS & ANCILLARY SERVICIOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01160', N'', N'CARTERA PROD. AGRICOLAS DE ELOTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01161', N'TAL940124CE5', N'TALICO S A DE C V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01163', N'VIM970403775', N'VIMIFOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01164', N'APL040507FP3', N'ALIMENTOS PLIEGO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01165', N'PAV820303P6A', N'PROVEMEX AVICOLA S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01166', N'FCA900330EC5', N'FORRAJES LOS CHAPETEADOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01167', N'HME010316AN1', N'HUITZITZILLI MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01168', N'IAR870521GA4', N'IMPULSORA ARRA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01169', N'MDM950704T33', N'MULTISERVICIOS 2001 SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01170', N'ASP010319HG1', N'ALIMENTOS Y SERVICIOS PECUARIOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01171', N'AAR420903TQ1', N'ASOCIACION DE AGRICULTORES DEL RIO SINALOA ZONA ORIENTE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01172', N'FER930325U60', N'FERTILIZA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01173', N'FSE0506088SA', N'FRIJOLES SELECCIONADOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01174', N'', N'CARTERA INDUSTRIA METALICA DEL ENVASES S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01175', N'', N'CARTERA ENVASES DE SINALOA S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01176', N'GAZ100122CY5', N'GRUPO AZUCARERO ZAFRA - SOL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01177', N'FPR9410054X5', N'FLEXO PRINT SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01178', N'XEXX010101000', N'POLYPLEX AMERICAS INC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01179', N'GIZ0706291DA', N'GRUPO INDUSTRIAL ZACATECANO DE FRESNILLO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01180', N'FAM881007NM1', N'FORRAJERA AMECA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01181', N'JUA040618EE6', N'JUADIMA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01182', N'WAYU640713458', N'YULONG WANG')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01183', N'AIN971215RD0', N'AGROVIZION INTEGRADORA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01184', N'SUP890207V49', N'SUPOLLO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01185', N'IAL070130JK8', N'INTEGRADORA ALEXASIN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01186', N'GCO0101177K3', N'GRANEROS LA CHONA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01187', N'EUP960920TK3', N'ENFERMERAS UNIDAS PLUS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01188', N'', N'ENFERMERAS UNIDAS PLUS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01189', N'UGR861124ET3', N'UNION GANADERA REGIONAL DE PORCICULTORES DEL ESTADO DE MEXICO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01190', N'DCA061214FT5', N'CARTERA DINA COMERCIALIZACION AUTOM.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01191', N'TOV080701MB5', N'TOVELINI SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01192', N'PFV010316RN0', N'PRODUCTORES DE FCO VILLA LAS HIGUERILLAS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01193', N'CGA061107AT9', N'CUENTA GANA SPR DE RS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01195', N'TQU9707144F4', N'CIA TEQUILERA LA QUEMADA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01196', N'VACI471216GV0', N'JOSE ISMAEL VALENZUELA CARLON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01197', N'APT080728BJ2', N'AGRICOLA PEREZ TEJADA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01198', N'ACB090921384', N'AGRICOLA CAMPO BRAVO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01199', N'LIAJ640306I59', N'JAIME LIRA ALVARADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01200', N'PRO080816IS2', N'PRODUCTORES ROMOAGRO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01201', N'AVP090929T69', N'AGRICOLA VERDUGO PADILLA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01202', N'CSF080114ITA', N'CARGILL SERVICIOS FINANCIEROS SA DE CV SOFOM ENR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01203', N'', N'CARTERA COMPAÑIA NACIONAL ALMACENADORA SA CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01204', N'FAAL531110UQ0', N'LEONE FABIO AQUINO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01205', N'', N'DED  GRANEROS CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01206', N'AAG940222947', N'AGRICOLA AGUILAR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01207', N'HQP0612147Q3', N'HOLDING QUALITY PLASTICS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01209', N'CGS950731DE2', N'CUEVAS G SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01210', N'XEXX010101000', N'PASTERNAK BAUM  &   CO   INC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01211', N'IME941122D2A', N'INAGRO DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01212', N'EDM0707257X3', N'EURO DIST DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01213', N'CVI061212A68', N'CONCEPTOS VINICOLA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01214', N'ATS950330CAA', N'AGROPECUARIA LA TEJA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01215', N'NUT9012208T3', N'NUTRECOM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01216', N'HTL060622GC9', N'SOCIEDAD HIDROPONIA DE TLAPANALA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01217', N'EPM040318J5A', N'EDELMANN PACKAGING MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01218', N'SIP0707177F5', N'SABIC INNOVATIVE PLASTICS MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01219', N'PCR051005CP4', N'LOS PRIMEROS DE COSTA RICA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01220', N'GPE100413NM3', N'GRUPO PESATEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01221', N'GPE070201EB8', N'GRUPO PORTILLO Y EQUIPAMIENTO PESADO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01222', N'GPK880629688', N'GRANJAS PADRE KINO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01223', N'GJU030425JQ5', N'GRUPO JUADI S A DE C V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01224', N'IAA0812151B9', N'INTEGRADORA AMOR A LA TIERRA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01225', N'PAI170407UJ0', N'PAN AMERICAN TRA INTERNACIONAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01226', N'XEXX010101000', N'LANSING TRADE GROUP')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01227', N'WOT060815KV8', N'WOTCO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01228', N'APM9804294N6', N'AGRIBRANDS PURINA MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01229', N'ATM9608219H5', N'ALPHA TEX DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01230', N'NSM100611C19', N'NATIONAL STARCH MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01231', N'GSA0802259C5', N'LOS GRANEROS DE SAN ANTONIO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01232', N'CBA0903145A9', N'CORRALES EL BAJO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01233', N'NAP940224HY9', N'NUTRIMENTOS AGROPECUARIOS PURINA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01234', N'FCA0801175D8', N'SOCIEDAD FINANCIERA CAMPESINA SA DE CV SOFOM ENR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01235', N'NRA970130180', N'NUTRIMENTOS RAMIREZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01236', N'NPA961223LA1', N'NUTRISISTEMAS PECUARIOS DE LOS ALTOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01237', N'MAI0902143W6', N'MEX AGRO INTERNACIONAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01238', N'EUVG600906FG1', N'GUADALUPE ELVIA ESQUIVEL VELAZQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01239', N'', N'CARTERA HOLDING QUALITY PLASTIC S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01240', N'OUS100628148', N'OUSEN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01241', N'IRE040218J20', N'INTEGRADORA REGIOENGORDAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01242', N'INE0808187L7', N'IMPORTADORA NEGAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01243', N'CTI030220JEA', N'CONGELADORA TITIN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01244', N'DCV900629DC5', N'DISPROMAT SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01245', N'PAU040920KX4', N'PRODUCTORES AGRICOLAS UNIDOS DEL BAJIO S.P.R. DE R.L.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01246', N'GAQ0004123V3', N'GRUPO AVICOLA QUIÑONES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01247', N'FME860109DR9', N'FORRAJES MENDEZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01248', N'AMU050730L90', N'AGRICOLA MURRIETA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01249', N'COMC631206FC4', N'CARMEN CONCEPCION COTA MURRIETA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01250', N'ROOE530110EI6', N'ELENA RODRIGUEZ ORDUÑO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01252', N'ROOR510115FG6', N'ROSA ESTHELA RODRIGUEZ ORDUÑO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01253', N'CORJ800701KXA', N'JUAN MIGUEL COTA RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01254', N'CORE780523HE4', N'MARIA ELENA COTA RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01255', N'CALH811025D62', N'HUGO CASTILLO LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01256', N'GGA831121JE9', N'GRUPO GAMESA S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01257', N'SCO090226NU3', N'SILVER CODE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01258', N'ARE780524GR6', N'ALFO RENT SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01259', N'ARI770307QS4', N'ASOCIACION RURAL DE INTERES COLECTIVO DE RI PRODUCTORES UNIDOS')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01260', N'CACC730712PP3', N'COSME CASTRO CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01261', N'COS0209134M9', N'AGRICOLA EL COSMITO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01262', N'AVB081007PJ9', N'AGRICOLA VALDEZ BOJORQUEZ SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01263', N'CAGM661007I65', N'MERCEDES CASTRO GODOY')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01264', N'CHS0411266Q1', N'COMERCIALIZADORA DE HIGIENE Y SALUD SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01265', N'SAP960423CX7', N'ALIANZA PARA LA PRODUCCION SOLES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01266', N'CIC071023FW5', N'CORPORATIVO INTERNACIONAL DE COMERCIO SHIJEHECA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01267', N'PAM040730HN0', N'PRODUCTORES AGRICOLAS DE MARAVATIO DEL ENCINAL SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01268', N'PAC8802199Z4', N'COOPERATIVA DE PRODUCCION AGROPECUARIA LOS CASTRELLON SCL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01269', N'NCO820820PQ2', N'NUTRIMENTOS CONCENTRA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01270', N'TEX970305HE6', N'TEXDEC SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01271', N'HON100430F98', N'HONGHU SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01272', N'CPR081014NZ6', N'CUATRO PROMOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01273', N'GOEA630704551', N'ARMANDO GONZALEZ ESCALONA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01274', N'TNR1004142G8', N'TRANSPORTES NIETO RUIZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01275', N'PMP030428M95', N'PISOS DE MADERA Y PERFILES INTERNACIONALES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01276', N'IBE960828FH9', N'IBEROTEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01277', N'LIWA670405Q79', N'WANHUI LIN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01278', N'JCM091006541', N'JWJ COMERCIAL MEXICO S A DE C V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01279', N'AAL971231LY3', N'ASOCIACION AGRICOLA LOCAL DE VALLE DE SANTIAGO GTO  SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01280', N'IAG580218MJ3', N'IMPULSORA AGRICOLA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01281', N'MDI030109G57', N'MAXIMA DIMENSION SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01283', N'YTR090701EY8', N'YAAX TRADING SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01284', N'LOM020426SK1', N'LEASING OPERATIONS DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01285', N'MEVD651029FP8', N'DIONISIO ROBERTO MEADE VELAZQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01286', N'JSY0909099W6', N'JASHIN SYSTEMS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01288', N'CIN0404289T5', N'CHILDREN INTERNATIONAL- JALISCO AC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01289', N'FDR6302015P9', N'FABRICA DE DULCES RAVI SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01290', N'LOR0704306V9', N'LORDSAN S A DE C V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01291', N'PAA020408AE0', N'PRODUCTOS AGRICOLAS AOASS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01292', N'DSO0901134I4', N'DECOMODE SOLUTIONS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01293', N'GASL680103KT9', N'LUIS ANTONIO GARCIA SERRATO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01294', N'XEXX010101000', N'BECKER INDUSTRIAL COATINGS INC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01295', N'AAD011101D32', N'AUDIO ACUSTICA DIAMANT S A DE C V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01296', N'PERH680626MJ0', N'HUMBERTO SAMUEL PERALTA RAMOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01297', N'CND050504DS8', N'COMERCIALIZADORA NDFS  SA DE  CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01298', N'NOT011226T29', N'NOTMUSA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01299', N'CST080909FF1', N'CORPORACION STARPRICE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01300', N'G&A010821GA2', N'GRAINS & ANCILLARY COFFEE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01301', N'AMA011210DY5', N'AGROPECUARIA MARROQUIN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01302', N'RTB031001383', N'RESINAS TB SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01303', N'CWI06122019A', N'LOS CABOS WINE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01304', N'HCP951018BU5', N'HACIENDA DEL CARMEN  SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01305', N'AGR0808252H4', N'AGROPAZAGE SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01306', N'DGL070619UH4', N'D-CO GLASS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01307', N'VUR881101UA8', N'VALVULAS URREA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01308', N'MAA850605MU3', N'MAQUINARIA AGRICOLA DE AUTLAN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01309', N'CAN010528T92', N'COMERCIALIZADORA AGRICOLA DE NAYARIT SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01310', N'IMT040331N25', N'IMTRAC SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01311', N'MAQ880708BM7', N'MAQUINARIA AGRICOLA DE QUERETARO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01312', N'TVA030319Q65', N'TRES VIEJOS DE LA ALIANZA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01313', N'ACO031110RIA', N'AGROINDUSTRIAS DE CORDOBA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01314', N'PAS981007NH9', N'PLASTICOS AUTOMOTRICES DE SAHAGUN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01315', N'AME961129S74', N'AKSYS DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01316', N'CVA050316215', N'COMERCIALIZADORA VALDIVIA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01317', N'APA1005216Z3', N'AGRUPACION DE PRODUCTORES AGRICOLAS SWIFT CURRENT S.P.R. DE R.L. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01318', N'MBA0802288V5', N'MULTIGRANOS DEL BAJIO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01319', N'NAO9710024KA', N'NUTRICION ANIMAL DE OCCIDENTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01320', N'GVI100803TW0', N'GRUPO VIREX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01321', N'AFR091107I91', N'AGRICOLA FRAFER SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01322', N'FEFJ801105940', N'JESUS ENRIQUE FERNANDEZ FERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01323', N'EPJ070206SD1', N'EXPORTADORA PORCINOS DE JALISCO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01324', N'SCA0205213V5', N'SAN CARLOS ASP SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01325', N'JIL971206141', N'JI LOPEZ SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01326', N'MTC9407078P9', N'MERINO TELIS CAFÉ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01327', N'LAM5511106C2', N'LAGUNA AGRICOLA MECANICA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01328', N'TAG7409183Q4', N'TRACTORES DE AGUASCALIENTES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01329', N'ZAVV5103137M6', N'VICTOR MANUEL ZARATE VELASCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01330', N'FER070322648', N'FERTINOVA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01331', N'GBV0307311T3', N'EL GRANERO DE BUENAVISTA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01332', N'AGR030219425', N'AGROFINANZAS SA DE CV SFOL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01333', N'REC910917S18', N'RECUBRE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01334', N'CLT050708TA6', N'CENTRO LOGISTICO DE TRANSPORTACION SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01335', N'GCH830421RZ0', N'GOMEZ CUETARA HNOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01336', N'INT0602158Q6', N'INTERBATH S A DE C V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01337', N'ASA050328MF5', N'ANALISIS Y SOLUCIONES AMBIENTALES S A DE C V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01338', N'GIC090604EF1', N'GRUPO INDUSTRIAL CANAMEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01339', N'GFB030911T40', N'GRANOS Y FERTILIZANTES BUENA VISTA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01340', N'IEZ0007119D5', N'INTEGRADORA EMILIANO ZAPATA DE PRODUCTORES AGRICOLAS DEL ESTADO DE DURANGO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01341', N'GPC940620K78', N'GRUPO PUERTA COLORADA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01342', N'THI080121AR8', N'LOS TRAMOJOS DE HIDALGO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01343', N'RNO080418T21', N'RINCONCITO NORTEÑO SPR DE RI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01344', N'OAS080402NX5', N'ORGANIZACION AGROPECUARIA SOMBRERETILLO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01346', N'MHU820315UT3', N'MAQUINARIA DEL HUMAYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01347', N'ACO100531C79', N'ARUM COMERCIAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01348', N'FRM050817MJ5', N'FERTIGRANOS REVOLUCION MEXICANA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01349', N'LAB070418MN8', N'LOGISTICA ABBA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01350', N'SRO0806207HA', N'SE RENTA O SE VENDE SC DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01351', N'ANA771130Q81', N'AGROSERVICIOS NACIONALES SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01352', N'SFM8602032D7', N'SAN FERNANDO MOLINO DE HARINAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01353', N'ACC090716BS2', N'BLACKHIVE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01354', N'CNS051219FQ8', N'CASA NOBLE SERVICIOS AGROPECUARIOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01355', N'AET680110C1A', N'AGRO EQUIPOS DE TEXCOCO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01356', N'CET891123D52', N'COMERCIALIZADORA Y ENVASADORA TYM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01357', N'', N'CARTERA PLASTICOS AUTOMOTRICES DE CD. SAHAGUN  SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01358', N'', N'CARTERA AKSYS DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01359', N'MLA910129F89', N'MADERAS LA LAGUNA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01360', N'AMG9802168S5', N'ABASTECEDORA METROPOLITANA DE GUADALAJARA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01361', N'G&A990816B76', N'GRAINS & ANCILLARY FORRAJES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01362', N'IHU970616BQ2', N'INTERAGRO DE LAS HUASTECAS SA DE CV')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01363', N'CIC970922LKA', N'CONSORCIO INTERAMERICANO DE COMUNICACION SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01364', N'', N'PANALYTICAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01365', N'RMR040521BE9', N'REOTIX MATERIALES REFRACTARIOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01366', N'CET0703075F6', N'CONGELADORA EL TREBOL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01367', N'PMP950301S62', N'POCHTECA MATERIAS PRIMAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01368', N'HDM801203IM5', N'HUNTER DOUGLAS DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01369', N'ITE0507252W2', N'INDUSTRIA DE TELECOMUNICACION ELECTRONICA BRASILEÑA DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01370', N'CAA9904128E1', N'COMERCIALIZADORA AGROINDUSTRIAL AOASS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01371', N'ROO0707255S8', N'REPRESENTACIONES OPTICAS DE OCCIDENTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01372', N'CCA011214CH4', N'CAMPESINOS DEL CAMPO SPR DE RI.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01373', N'FPR060911MA6', N'FINCA EL PROGRESO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01374', N'TTE1012106CA', N'TECTUM TECHNOLOGIES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01375', N'', N'**** LIBRE SE CANCELO POR DUPLICADO ******')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01376', N'MADV421001MZ5', N'VICTOR RAFAEL MARTINEZ DOSAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01377', N'AAD100316625', N'AGENCIA ADUANAL DUFRARRIS ASOCIADOS SC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01378', N'LCO1006295U4', N'LIME CODE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01379', N'IPA7912297I2', N'INDUSTRIALIZADORA DE PRODUCTOS AGRICOLAS DE LA CUENCA DEL PAPALOAPAN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01380', N'KWI051116HZ0', N'K.W.I. SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01381', N'BAT950731D69', N'BODEGAS Y AGROINDUSTRIALES DE TAPACHULA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01382', N'RCE090924HY2', N'RIBRY COLORES E INGREDIENTES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01383', N'GAO0802128U2', N'GRUPO AGROPECUARIO OPCHEN SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01384', N'MAP781116', N'MARIO ALBERTO MARQUEZ PALENCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01385', N'CEL071010N74', N'COMERCIO EXTERIOR LUMAHE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01386', N'RILC4503098A6', N'CELIA LUZ RIVERA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01387', N'MTE100903DA4', N'MARCAS Y TENDENCIAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01388', N'IPA791229712', N'INDUSTRIALIZADORA DE PRODUCTOS AGRICOLAS DE LA CUENCA DEL PAPALOAPAN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01389', N'MAGE550525HC7', N'HECTOR EDUARDO MAGALLON GRACIAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01390', N'QLO040225BL6', N'Q-LOGISTICS S.A DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01392', N'IUEL630409D40', N'LETIBEL INZUNZA ESCAMILLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01393', N'BIN960625F73', N'BIENES INDUSTRIALES DEL NORTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01394', N'AAC930914J25', N'AGROPECUARIA EL ACHOTAL SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01395', N'CSA100630AI7', N'CREACIONES SAYA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01396', N'', N'CARTERA SUPOLLO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01397', N'APU070515923', N'AGROPECUARIA EL PUEBLITO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01398', N'GCO700803V61', N'GRANEROS CONTINENTAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01400', N'CME720930GM9', N'CHRYSLER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01401', N'EIM95080293A', N'MOTOROLA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01402', N'MCA1006154H7', N'MONTICELLO CARPETS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01403', N'MGR970716SC9', N'MOLINO GRANDE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01404', N'IPA070920R78', N'INDUSTRIAL PECUARIA DE LOS ALTOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01405', N'BSM970519DU8', N'BANCO SANTANDER S.A.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01406', N'CME090609G94', N'CLAMPER DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01407', N'GMR0309108T2', N'GRUPO MEDIATICO REFORMA NORTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01408', N'GJA000725347', N'GRUPO JAVRO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01409', N'PEG850107AS1', N'PLANTAS ELECTRICAS GUADALAJARA  SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01410', N'COAS660621QE5', N'MARIA SOLEDAD CONTRERAS ALVAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01411', N'BSM970519DU8', N'BANCO SANTANDER (MEXICO) SA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01412', N'VAAJ740919MB8', N'JAVIER AMADO VALENZUELA AGUILAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01413', N'TCG0105072V7', N'TECHNOLOGY CONSERVATION GROUP MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01414', N'CTC100610FQ8', N'CIUSAG TRANSPORTES Y CALIDAD SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01415', N'CIV030505UZ4', N'COMERCIALIZADORA DE INDUSTRIAS VARIAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01416', N'CAP930525PW5', N'CAFECO AGROINDUSTRIAL DEL PACIFICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01417', N'DMS000928DF8', N'DISTRIBUIDOR DE MAQUINARIA DEL SUR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01418', N'CVA050316215', N'AGROTECNO EL NOVILLERO DE IXCUINTLA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01419', N'ANH070215LJ3', N'ALGODONERA NUEVA HOLANDA SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01420', N'TCA110203IC7', N'TOP CARRIERS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01421', N'ARV090911MG1', N'AGROGANADERA RV SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01422', N'SFE020627HE6', N'SEMILLAS FEHR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01423', N'AUV9408175J9', N'AGRICULTORES UNIDOS EL VALLE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01424', N'IPH0411188KA', N'INDUSTRIAL PESQUERA HERAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01425', N'KKA100302S97', N'"KEMI KALS", SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01426', N'PTM070221323', N'PASKAL TECHNOLOGIES MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01427', N'ACO0707256K8', N'ALIMENTOS COBAN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01428', N'TTT0701122S7', N'TWIN TOWERS TRADE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01429', N'API010508TU9', N'ARTICULOS Y PARTES INTERNACIONALES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01430', N'OME020930NZ8', N'OCCIDENTAL METALS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01431', N'GAVL440121FX9', N'LUIS ROBERTO GAXIOLA VALLE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01432', N'DIN960506RS7', N'DELMAN INTERNACIONAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01433', N'QEC031008541', N'QUALITY ELECTRONICS CORPORATION SA  DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01434', N'GUC991106D60', N'GANADEROS UNIDOS CEVALLOS S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01435', N'SME0608184Z2', N'SANIPAP DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01436', N'DIL970121733', N'DILAC SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01437', N'GSI090616SD8', N'GRUPO SINEKIS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01438', N'EML9011282F5', N'ED&F MAN LIQUID PRODUCTS MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01440', N'CTM081002U14', N'COMERCIALIZADORA TMLUC SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01441', N'XEXX010101000', N'OIL- DRI CORPORATION OF AMERICA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01442', N'ABF9507263T6', N'ALIMENTOS BALANCEADOS DE LA FRAYLESCA S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01443', N'ZOJI6205223Q4', N'JIANZHENG ZHONG')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01444', N'HMM081126N71', N'HOSANNA MAQUINADOS Y MULTISERVICIOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01445', N'APH090513FL2', N'AFCM PHARMA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01447', N'CPA970414K28', N'CONSORCIO PAPELERO ANDROMEDA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01448', N'YHD1008116T2', N'YI HONG DING SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01449', N'MIP040401991', N'MICHOACANA INDUSTRIAL PAPELERA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01450', N'CIN560220AM3', N'COPAMEX INDUSTRIAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01451', N'MMO820212US6', N'(NO USAR) MUNSA MOLINOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01452', N'AES011115RV4', N'AGROPECUARIA ESTHERCITA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01453', N'UME080716528', N'UPDS DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01454', N'SFA070831C36', N'SANTA FE DE ALDAMA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01455', N'EFR870619KD1', N'EMPACADORA EL FRESNO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01456', N'NTA931214IJ6', N'NUEVA TECNOLOGIA EN ALIMENTACION SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01457', N'WME090629SE1', N'WMSGAMING MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01458', N'NTM010110PC2', N'NORDIC TRAIN DE MEXICO SA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01459', N'ITO0907149IA', N'INNOVATION TOOLS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01460', N'GTR941221J34', N'GRUPO TRIMEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01461', N'GNM9712017P7', N'GAS NATURAL MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01463', N'MCM100920GA5', N'MULTIOPERACIONES COMERCIALES MT SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01464', N'PPR910701LEA', N'PILGRIMS PRIDE S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01465', N'FILG800812AV5', N'GERMAN FIGUEROA LEGAZPI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01466', N'ACA061016936', N'AGROINSUMOS CAMPOFINO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01467', N'DTO0503021CA', N'DISTRIBUIDORA TOYMARK SA DE CV')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01468', N'QUA0402022D1', N'QUALAMEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01470', N'GPS680713D5A', N'GRUPO PECUARIO SAN ANTONIO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01471', N'JMM100831DA3', N'JING MAO DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01472', N'CPB900226I91', N'COMERCIALIZADORA DE PRODUCTOS BASICOS DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01473', N'ANO091201AX1', N'ACOPIADORA DEL NORTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01474', N'MFR650327M88', N'MAQUINARIA FRONTERA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01475', N'GAMJ690103QR4', N'JOSE JENARO GARCIA MENDIOLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01476', N'TWT1001253W4', N'TERRA WEALTH TRADER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01477', N'MFN020430HF0', N'MAQUILAS FORRAJES Y NUTRIMENTOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01478', N'GMO100902DM1', N'GRUPO MIRASOL DE OCCIDENTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01479', N'MVM0401279V1', N'MEXICANA DE VIVERES MSV SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01480', N'ICI071122LC5', N'IMPORTADORA Y COMERCIALIZADORA IEM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01481', N'00301550174', N'P.E.L.  PINTOSSI EMILIO S.P.A')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01482', N'MAG941119DF3', N'MAGUS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01483', N'COS030113782', N'COSTITX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01485', N'CGS070129MS3', N'COMERCIALIZADORA DE GRANOS Y SEMILLAS MOSA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01486', N'GNR020503QE2', N'GRANEROS DEL NORTE RIO BRAVO SA DE CV SOFOM ENR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01487', N'ANA040414348', N'ARROCERA DE NAYARIT SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01488', N'MME000912Q44', N'MILLER DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01489', N'IAJ030703F29', N'INSUMOS AGRICOLAS JULIAN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01490', N'PUR890419ML7', N'PURP SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01491', N'ACA060808511', N'ABASTECEDORA DEL COMERCIO Y ABARROTES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01492', N'', N'DESERT GLORY INVERNADEROS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01493', N'XEXX010101000', N'FORMTEX PLASTIC CORPORATION')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01494', N'GIN0106212P4', N'TEMPLE INLAND SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01495', N'BLO910221663', N'BARRENO LOGISTICS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01496', N'AJS9706123Q4', N'AGROPECUARIA JS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01497', N'PEE061214D16', N'PERFILES DE EXCELENCIA EN LA INDUSTRIA AUTOMOTRIZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01498', N'GOJ9607224R2', N'GRANJAS OJAI SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01499', N'RME9712052T0', N'RISO DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01500', N'LPM940413578', N'LARSSON PAPER MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01501', N'YME831130IIA', N'YALE DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01502', N'NIN060209M65', N'NTS INTERNACIONAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01503', N'', N'CARTERA PERFILES DE EXCELENCIA EN LA INDUSTRIA AUTOMOTRIZ SA CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01504', N'GAMC820829S33', N'CECILIA SOLACE GRANVAL MARTÍNEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01505', N'MME081107RE9', N'MIDEA MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01506', N'AME09012066A', N'AJINOMOTO DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01507', N'CUP8611255E9', N'CHUPALETAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01508', N'XEXX010101000', N'FONTERRA LIMITED')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01509', N'ACM9904264B1', N'AVANCE COMERCIAL DE MEXICO  SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01510', N'ASF900227AW1', N'AGROQUIMICOS Y SEMILLAS LA FUERTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01511', N'ETH090519RG0', N'ETHEM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01512', N'SOT840627BA4', N'SOTEC SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01513', N'', N'GRUPO CORPORATIVO SERVACH SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01514', N'IIM990524NU8', N'IC INTRACOM MEXICO SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01515', N'SAB870619KZ0', N'SURTIDORA ABARROTERA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01516', N'TTM991206A19', N'THOMSON TELECOM')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01517', N'EUR9207306N8', N'EUROPAN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01518', N'SIN110718L38', N'SINOIMPORT SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01519', N'GAI021018N59', N'GRUPO AGRO INDUSTRIAL ARIAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01520', N'EGT030506N8A', N'EMPACADORA GANADERA DE TAMAULIPAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01521', N'CAS980330J48', N'CONTROLADORA DE AUTOTRANSPORTE Y SERVICIOS COMERCIALES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01522', N'ROTJ6308252W7', N'JESUS FRANCISCO RODRIGUEZ TIRADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01523', N'VECP850604LA9', N'PEDRO VEGA CAMARENA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01524', N'GAEJ820831AU5', N'JESUS ANTONIO GASTELUM ESPINOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01525', N'AFA020314356', N'AGROPECUARIA FAMOSGAR SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01526', N'AZA050721RS7', N'AGRICOLA ZAPOTILLO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01527', N'ETI0903058X3', N'EQUIPO DEL TIEMPO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01528', N'IGE030813AL3', N'INTEGRADORA DE GANADEROS DE ENGORDA DE LA LAGUNA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01529', N'SNC910408CB3', N'SOLUCIONES EN NUTRIENTES PARA EL CAMPO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01530', N'CTR080912GY1', N'CORTEZ TRANSFERT S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01531', N'SIDC7810312Y4', N'CESAR OCTAVIO SIERRA DIAZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01532', N'AIM001016BK5', N'AGROPECUARIA INDUSTRIAL DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01533', N'FPR071206CL4', N'FOR PROMOTIONAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01534', N'FTT9408239S3', N'FABRICA DE TEQUILA TLAQUEPAQUE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01535', N'ASC951228IM0', N'ALMACENADORA SUR SA DE CV ORGANIZACION AUXILIAR DEL CREDITO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01536', N'NIN051013LS5', N'NOPAL INDUSTRIALIZADO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01537', N'ABE920325366', N'ALIMENTOS BALANCEADOS ESPECIALIZADOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01538', N'REA071214RQ4', N'REIMER ENNS Y ASOCIADOS S DE PR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01539', N'AGA0805193V4', N'AGROPECUARIA LA GABY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01540', N'ARE080519HK1', N'AGROPECUARIA LAS RESES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01541', N'QFS970203EJ6', N'QUESOS FINOS SANTA CLARA DE NAMIQUIPA S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01542', N'CPI0705078Q4', N'COMERCIALIZADORA PIRE S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01543', N'DGI931220QA4', N'DESERT GLORY - NATURE SWEET INVERNADEROS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01544', N'DGO100830NP9', N'DISTRIBUIDORA GOSEN S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01545', N'JFE0809123CA', N'J CO FERTILIZER S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01546', N'YIN100629A53', N'YINHAN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01547', N'MIL9412088XA', N'MILTRON SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01548', N'CRM080904EG3', N'COMERCIALIZADORA REGAMI MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01549', N'SCM9311013S5', N'SCA CONSUMIDOR MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01550', N'ZUC100723VB8', N'ZUCARMEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01551', N'STI070206MF2', N'STILOTEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01552', N'APH080604586', N'ALFIL PHARMACEUTICALS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01553', N'AZO0908202K7', N'ACTIVA ZONE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01554', N'AZO0908202K7', N'ACTIVE ZONE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01555', N'GNS990119518', N'NATURGY SERVICIOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01556', N'DIN971119GG6', N'DISTRIBUCION INTERCERAMIC SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01557', N'RIM090929L63', N'RODPICHS IMPORT SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01558', N'AES840713827', N'AGROINDUSTRIAS ESBRA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01559', N'BGR110726349', N'LOGISTIK GRAIN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01560', N'PIK010111SH7', N'EL PIKACHO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01561', N'AAL721208GCA', N'ASOCIACION AGRICOLA LOCAL DE NOGALEROS DE JIMENEZ CHIHUAHUA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01562', N'DLI850606BA3', N'DISTRIBUIDORA LINOLEUMS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01563', N'EST850628K51', N'ELECTRONICA STEREN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01564', N'SIN9408027L7', N'SEGUROS INBURSA SA GRUPO FINANCIERO INBURSA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01565', N'MER071005992', N'MERCKER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01566', N'RCE100616RK0', N'RESTAURANTES CENTRALIZADOS SA DECV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01567', N'FUZ0706224NA', N'FUZAM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01568', N'BASM8007084YA', N'MARIANA YELI BAEZ SAUCEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01569', N'COMJ490608275', N'JUAN MIGUEL COTA MURRIETA')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01570', N'DOER741223B9A', N'ROSARIO DOMINGUEZ EGUINO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01571', N'RIS950819E13', N'RACHITO DE INZUNZA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01572', N'EPO1002196C9', N'ENVIOS PORTER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01573', N'', N'CARPICENTRO SA DE CV Y MADERAS FINAS PERRONI SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01574', N'PFM850814NA3', N'PACTIV FOODSERVICE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01575', N'NCO090915L6A', N'NOVAMEX COMERCIALIZADORA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01576', N'PRO0501179KA', N'PROAVIL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01577', N'COR0707153D7', N'CORTILAMIK SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01578', N'ITU781018RN1', N'INDUSTRIAS TUK  SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01579', N'BLI060809BI7', N'BORDER LESS INTERMODAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01580', N'LME071107HE7', N'LANSING DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01581', N'HTM9811045M6', N'HONDA TRADING DE MEXICO S.A DE C.V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01582', N'LUM020117FU7', N'LUMTEC S A DE C V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01583', N'LPI830527KJ2', N'LABORATORIOS PISA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01584', N'FAG1009093J1', N'LOS FERTRES AGROINDUSTRIA SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01585', N'VME990302RH7', N'VIRBAC MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01586', N'PAJ970424651', N'PRODUCTORA AGROPECUARIA LA JOYA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01587', N'GIN080310S95', N'GG INSUMOS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01588', N'SBA100506V87', N'SAKXIM DEL BAJIO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01589', N'RLI111103N62', N'LA REPUBLICA DE LOS LIBROS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01590', N'GTI031020SZ3', N'CARTERA GANADERA LA TIZAPASPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01591', N'MPG9410065K7', N'M.P.G. S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01592', N'AGL070629E77', N'ASOC. GAN. LOC. ESP. PARA EL FOM. Y LA EXPLOT. PEC. DE LAG. DE MOR.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01593', N'PAD080418BZ2', N'COOPERATIVA DE PRODUCTORES AJONJOLI DON JOSE SC DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01594', N'ACA061016936', N'CARTERA AGROINSUMOS CAMPOFINO SA DE CV SOFOM ENR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01595', N'GLO100629LV3', N'GLOBALPANELS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01596', N'TPE891205HD2', N'TRANSMISIONES DE POTENCIA EMERSON SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01597', N'ALB020129QX7', N'AGROPRODUCTORES DEL LERMA BAJIO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01598', N'RDS9104242U6', N'RANCHO EL 17 SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01599', N'DIEM560121Q98', N'MARTHA DIAZ ESCOBAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01600', N'IMA870910CG4', N'CARTERA INDUSTRIALIZADORA DE MANTECAS S.A DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01601', N'HME660303531', N'HELM DE MEXICO SA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01602', N'SCA000608JM2', N'SEMILLAS CASTEGO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01604', N'HESH660724FJ2', N'HECTOR ELIO HERRERA SANTANA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01605', N'', N'PROVISION CLIENTES EN EL MODULO DE CXC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01606', N'JUMA861013Q10', N'ALEJANDRA JANET JUAREZ MARTINEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01607', N'ME0070528815', N'NEOALIMENTOS SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01608', N'CME730129A79', N'COMERCIALIZADORA METROGAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01609', N'GFU110913RA2', N'GRANO FUTUROS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01610', N'PCS9003265F4', N'PRADERAS EL COLORADO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01611', N'ASGH961203LG8', N'AUTO SHAT SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01612', N'NME660328D37', N'NUTRIMENTOS MEXICANOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01613', N'OEQ100630A54', N'OUTLET DE EQUIPOS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01614', N'MAL7404234K7', N'MAQUINARIA ALFO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01615', N'ISN110414AH3', N'IMPORTADORA DE SOLUCIONES DEL NORTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01616', N'ERO070927130', N'EROAN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01617', N'SPA050506DEA', N'SERVIAGRO DEL PACIFICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01619', N'ESG810511HT6', N'ELECTRONICA STEREN DE GUADALAJARA SA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01620', N'GME1106106X0', N'GRUPO DM ESI SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01621', N'MTF060527TV1', N'MADERAS Y TRIPLAY EL FENIX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01622', N'TLO1108314G2', N'TMK LOGISTICS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01623', N'CMU060119UI7', N'CORPORATIVO MUFAR S DE R L DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01624', N'IEA930117T62', N'INSTITUTO DE EDUCACION DE AGUASCALIENTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01625', N'SCM010131E25', N'SEMILLAS Y CONCENTRADOS MENOPRO S DE RL DE MI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01627', N'SPE941215H43', N'STEREN PRODUCTO EMPACADO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01628', N'IAC980114L12', N'INTEGRADORA DE APOYOS AL COMERCIO EXTERIOR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01629', N'PFM950127VC0', N'PRODUCTOS FORESTALES LA MISION SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01630', N'ACA111201FQ7', N'ALIANZA COMERCIAL AZUCARERA SANTOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01631', N'DEM991001819', N'DEMP SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01632', N'GAAG6304117Y3', N'GABRIEL GARIBAY AVALOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01633', N'MOLE5102231Y5', N'JOSE EDUARDO MOSQUEDA LICEAGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01635', N'GUOO791111UP1', N'OSCAR RAFAEL GUEVARA OLAGUE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01636', N'EHO110722EK9', N'EMPACADORA EL HORIZONTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01637', N'CBO000622MP9', N'CONCENTRADOS BOVILAC SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01638', N'AAG101217EV7', N'ALGODONERA EL AGATE SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01639', N'PAM041109PW5', N'PRODUCTORES AGROPECUARIOS DEL MUNICIPIO DE JARAL DEL PROGRESO GUANAJUATO S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01640', N'CGO041122FQ8', N'COMERCIALIZADORA GOMA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01641', N'OEI050516JM5', N'ORGANIZACION EMOTION INTERNATIONAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01642', N'SAC971105PX0', N'SISTEMAS AVANZADOS EN COMPUTACION Y COMUNICACIONES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01643', N'JTM1111233L2', N'JWF TECHNOLOGIES DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01645', N'XEXX010101000', N'CORNING GILBERT INCORPORATED')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01646', N'PAD970125QA2', N'POLIMEROS ADHESIVOS Y DERIVADOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01647', N'RIV091029SN2', N'REPRESENTACIONES INTERNACIONALES VPG SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01648', N'LVM8910109VA', N'LABORATORIOS VIRBAC MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01649', N'IOC9902226F8', N'INTERACABADOS DE OCCIDENTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01650', N'ANA080404742', N'AVIPRESA NUTRICION ANIMAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01651', N'ACA9602145Z7', N'ANSA CERAMICA Y ACABADOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01652', N'AAD070727RN4', N'AGROPECUARIA ADOBE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01653', N'QUA080702896', N'QUALIPORK SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01654', N'CYU081119QWA', N'COMERCIALIZADORA YUUMCAAY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01655', N'AGL940122F16', N'AGRICOLA GANADERA LOS LUJAN SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01656', N'VAG1105301I7', N'VILLALEZA AGROPECUARIA S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01657', N'VOR110413NA6', N'EL VIOLIN DE ORO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01658', N'CBR100608GQ5', N'CONSULTORES DEL BRAVO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01659', N'VANG030371123', N'GLORIA VALDEZ NUÑEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01661', N'ICO880621MZ5', N'INDUSTRIAS COLUNGA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01663', N'OGL090727PT6', N'OPTIMA GLOBAL LOGISITICS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01664', N'GSO080721CD6', N'GRANJA SIERRA OBSCURA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01665', N'ARE100212NW3', N'AGROSILOS DE LA REGION SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01668', N'AGR980416C90', N'ARSA GRAIN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01669', N'MTL050714Q21', N'MEXPPAR TLANE S A DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01670', N'PRC090625SE0', N'PRISMA RURAL CONSULTORES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01671', N'PAP090714E29', N'PRODUCTORES AGRICOLAS Y PECUARIOS DEL CENTRO DE GUANAJUATO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01672', N'COBM621017MA8', N'MARGARITA COTA BALDERRAMA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01673', N'ADG071129659', N'AGROVAHT DIVISION GRANOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01674', N'ALA960210KE0', N'AGRICOLA EL LAUREL SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01675', N'SAG0012226V3', N'SAGOGA SOCIEDAD DE PRODUCCION RURAL DE RESPONSABILIDAD LIMITADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01676', N'CCA861206992', N'COOPERATIVA DE CONSUMO AGROPECUARIO LOMA DE SANTA CRUZ SCL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01677', N'ACN980211QC9', N'AGROPECUARIA LA CAPILLA DEL NORESTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01678', N'SEAR380807KU8', N'RAMON EVERARDO SERRANO ARCE')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01679', N'EAHJ551109RM7', N'JUAN ESTRADA HEREDIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01680', N'SABJ410608UK3', N'JESUS SALAS BERDEJA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01681', N'OOVJ730317DR8', N'JOSE OCHOA VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01682', N'AAOR400205RC9', N'JOSE RAFAEL AYALA OLAIS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01683', N'SOAM460912T57', N'JOSE MARIA SOTO APODACA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01684', N'PAPM490505BL2', N'MAGDALENO PACHECO PALAFOX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01685', N'PAPL590706562', N'LUCIO PACHECO PALAFOX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01686', N'PAPR800522417', N'RITA ISELA PACHECO PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01687', N'BAAW750516829', N'WBALDO BARRAZA AGUIAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01688', N'QUCO670714SN8', N'OSCAR MANUEL QUINTERO CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01689', N'RUPJ4009227H0', N'JESUS RUIZ PACHECO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01690', N'GRP070418F99', N'GRUPO RPP S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01691', N'PDC020603M88', N'PROFESSIONAL AND DIGITAL CENTER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01692', N'MEEB7702053R1', N'BENJAMIN MEDINA ESCALANTE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01693', N'GSM0203099V2', N'GRANOS SAN MIGUEL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01694', N'AASJ3907142J3', N'JESUS ALVARADO SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01695', N'CAP060707HX0', N'CENTRO DE ACOPIO PROAGRO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01696', N'BIM011108DJ5', N'BIMBO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01697', N'AGR1107258FA', N'AGRODECA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01698', N'MIM0506289E6', N'MEDICA IMEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01699', N'TDC090831175', N'LA TIERRA DE DON CHON SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01700', N'ROFO870914GB1', N'OMAR ROMERO FITZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01701', N'ACI01102AD75', N'AGRICULTORES DE LA CIENEGA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01702', N'CIB031126IT4', N'CONCEPTOS INTERNACIONALES DE BELLEZA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01703', N'SMP071024TLA', N'INSPECCIONES  SCHLUMBERGUER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01704', N'UPV080911HQ3', N'UNION DE PRODUCTORES DEL VALLE DE PUEBLOS UNIDOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01705', N'SCP8705154YA', N'SOCIEDAD COOPERATIVA DE PRODUCCION LA NORIA DE SAN FERNANDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01706', N'PAV920820IZ3', N'COOPERATIVA DE PRODUCCION AGROPECUARIA VALLE HERMOSO SCL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01707', N'ALS960518I11', N'AGROINDUSTRIAS EL LAUREL SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01708', N'PUA0410088B2', N'PRODUCTORES UNIDOS DE ANAHUAC SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01709', N'MALM620203RD6', N'MARIA MAGDALENA MACHADO LEAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01710', N'PAP930217DD8', N'COOPERATIVA DE PRODUCCION AGROPECUARIA EL PARAISO DE VALLE HERMOSO SCL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01711', N'ACP100610IC1', N'AUTOPARTES Y COMPONENTES DE LA PENINSULA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01712', N'MTC111213545', N'MERCANTIL TIERRA CALIENTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01713', N'AQU100803LP5', N'AGRICOLA QUEMAZONES SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01714', N'GUAR820825TS3', N'RAFAEL GUTIERREZ AYALA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01715', N'AOLH5404285H0', N'HERMELINDA ACOSTA LARA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01716', N'SIVR6505084V6', N'RICARDO SIBRIAN VEGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01717', N'', N'LETICIA AYALA GASTELUM')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01718', N'ICO690525UV8', N'INDUSTRIAS COREREPE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01719', N'IMC110727N22', N'LA INDUSTRIA DE MUEBLES CERAMICOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01720', N'GIN0711078Z4', N'GUSA INC SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01721', N'ASN9802176F9', N'ALMACENES Y SERVICIOS DEL NOROESTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01722', N'GDA0002259A7', N'GRUPO DAD SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01724', N'', N'CARTERA MARGARITA COTA BALDERRAMA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01725', N'SDG950314SL9', N'SAU DIVISION GRANOS SCL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01726', N'PGR960712UU7', N'PROMOTORA GANADERA DEL REAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01727', N'UNE860904V67', N'UNION NORTE DE ENGORDADORES DE GANADO AC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01729', N'HMS110412LP0', N'HARI MASA DEL SURESTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01730', N'PHS900710RDA', N'PRADERAS HUASTECAS S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01731', N'GAM950911BP4', N'GRUPO ACEITES DEL MAYO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01732', N'XEXX010101000', N'AMERICAN SUGAR REFINING INC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01733', N'PUV111208AA1', N'PRODUCTORES UNIDOS DEL VALLE DE TAMAULIPAS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01734', N'', N'FTD')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01735', N'AKA090420M82', N'AGROPECUARIA KAMANRY SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01736', N'SCC730830HS2', N'SOCIEDAD COOPERATIVA DE CONSUMO LIC. ALFREDO V. BONFIL DE LA PEQUEÑA PROPIEDAD DE SAN LUIS RIO COLORADO S.C.L.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01737', N'TES981112SS5', N'TORTILLAS ESPECIALES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01738', N'VRA841004JW6', N'VELOZ RAMOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01739', N'AMH111130HT8', N'ANTHONY')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01740', N'GME081107CYA', N'GANADERA MEXICALI SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01741', N'OUVD900127SD2', N'DANIEL ABRAHAM OSUNA VALVERDE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01743', N'CELE750308SK4', N'LERONG CHEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01744', N'RFG000327IU6', N'RICE AND FEED GRAIN DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01745', N'WIN070601UX0', N'WHIRLPOOL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01746', N'JFM000901BF6', N'JAMES FARRELL MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01747', N'KOQI6710237J8', N'QINGBIN KONG')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01748', N'LAN020729E29', N'LANRAM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01749', N'ASH0810027P1', N'ATM SHOES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01750', N'ATM040220H5A', N'ATMPACKS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01751', N'SRE060110Q96', N'SOLUCIONES EN RECUBRIMIENTOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01752', N'PAG990311KR5', N'PELSA AGROPECUARIA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01753', N'EAEG500903QN4', N'MARIA GUADALUPE ESTRADA ESPARZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01754', N'ENA1106247C7', N'ENLACES NACIONALES DE AGRONEGOCIOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01755', N'WAF070801FC6', N'WALL & FACADE TECHNOLOGIES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01756', N'CSC960417N87', N'CORRALES SANTA CECILIA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01757', N'BEL830720CU9', N'BELTICOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01758', N'GPS060627J53', N'GLOBAL PRODUCTS SUPPLY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01759', N'BFM910826TW6', N'BRIDGESTONE DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01760', N'SGL0708014N5', N'SEMILLAS Y GRANOS LA TRINITARIA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01761', N'PNO880928L8A', N'PAVOS DEL NOROESTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01762', N'CDO050810M27', N'LA CUENCA DEL DORADO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01763', N'BGM951208EX7', N'BOMBAS GOULDS DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01764', N'CLA120321Q14', N'COMERCIALIZADORA LACROIX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01765', N'IVV1006094V3', N'IN VINUM VERITAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01766', N'MSA120423GTA', N'M310 SOLUCIONES AMBIENTALES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01767', N'ALA0209277I3', N'AGRICOLA DEL LLANO SC DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01768', N'EVC081001K76', N'EX-HACIENDA VILLA CHAVINDA SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01769', N'ERA811106K76', N'ERASUN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01770', N'MMO820212US6', N'MUNSA MOLINOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01771', N'SAG1208013Z8', N'SUKARNE AGROINDUSTRIAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01772', N'MTJ701001MN1', N'MOLINO DE TRIGO DE JIQUILPAN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01773', N'HPA8703315YA', N'COMPAÑIA HARINERA DEL PARAYAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01774', N'MTS520412KT1', N'MOLINO DE TRIGO SAN RAFAEL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01775', N'HAT870112B44', N'HARINERA DE ATOTONILCO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01776', N'AIRJ571116NG1', N'JAIME ARRIAGA RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01777', N'TOAI630803C87', N'IRINEA TOPETES AVALOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01778', N'BEVI430426F65', N'ISABEL BELTRAN VEGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01779', N'PRO080816IS2', N'PRODUCTORES PROMOAGRO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01780', N'BEIM760210BV3', N'MARIO EDUARDO BELTRAN IRIBE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01781', N'GABA340212IH5', N'AURORA GASTELUM BELTRAN')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01782', N'ZABC700924G38', N'CESAR MANUEL ZAVALA BELTRAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01783', N'LAGG700704BR7', N'GERMAN LAZCANO GASTELUM')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01784', N'CHRA670117KPA', N'ARTURO CHAVEZ ROSALES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01785', N'BAR010919LQ9', N'EL BARRIALITO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01786', N'AUVE660101LX6', N'EUFRECINA ANGULO VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01787', N'AVA100105MJ7', N'AGRICOLA VACA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01788', N'DICC710503RJ8', N'CRUZ ANTONIO DIARTE CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01789', N'MOSE440808V76', N'EMILIA MORA SANDOVAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01790', N'DICR670312FJ2', N'ROLANDO DIARTE CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01791', N'DILI370611NGA', N'J ROLANDO DIARTE LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01792', N'VEMS640604P50', N'SANTOS ELVIRA VERDUGO MARTINEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01793', N'EAVE700916MKA', N'EDILBERTO ESTRADA VENCES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01794', N'MENF870630N22', N'FRANCISCO ALBERTO MENDOZA NORZAGARAY')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01795', N'SIPG770212RD5', N'GRISELDA SIQUEIROS PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01796', N'NOCI590429EF7', N'IRMA YADIRA NORZAGARAY CONTRERAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01797', N'MACV7104186Y0', N'JOSE VICTOR MACHADO CORONEL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01798', N'MACJ7601158S5', N'JUAN JOSE MACHADO CORONEL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01799', N'MACS780317Q37', N'SONNIA PATRICIA MACHADO CORONEL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01800', N'HEME611130JI3', N'ESTEBAN HERRERA MUÑIS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01801', N'COFG630324BF2', N'GABRIEL RAMON COTA FIERRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01802', N'AAN9808179W5', N'AGRICULTORES ASOCIADOS DEL NOROESTE SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01803', N'VAGA851206GVA', N'ARACELI VALDEZ GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01804', N'UIAF87120318A', N'FRANCISCO URIAS ALVAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01805', N'FESR710826RC9', N'JOSE RAMON FELIX SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01806', N'BOBC771019KH1', N'CAROLINA BOJORQUEZ BUENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01807', N'CACC920507AU6', N'COSME BERNARDO CASTRO CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01808', N'MOVV481122JM6', N'JOSE VICTORIANO MONTOYA VELIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01809', N'SORA581117FA4', N'ALFONSO SOTO RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01810', N'CJA830117BJ4', N'CHOCOLATERA DE JALISCO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01811', N'IGS0712014E5', N'IMPULSORA GANADERA DEL SUR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01812', N'PACB7303213B8', N'BENITO USBALDO PALAFOX CAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01813', N'MACE731012E33', N'JOSE EPIFANIO MACHADO CORONEL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01814', N'MACA680529R24', N'MARIA ALICIA MACHADO CORONEL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01815', N'BEAS740421A57', N'SOTERO ARMANDO BELTRAN ACOSTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01816', N'GAGR681012RM6', N'RODOLFO GALLARDO GASTELUM')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01817', N'GAGS7502191U8', N'SERGIO GUADALUPE GALLARDO GASTELUM')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01818', N'AURA580823124', N'ARACELI TRINIDAD ANGULO RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01819', N'AUBE640214IVI', N'ELEAZAR ANGULO BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01820', N'AUGM240911BNA', N'JOSE MARIA ANGULO GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01821', N'PDI100818Q58', N'PRODUCE 18 SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01822', N'GUSR690826NQ8', N'ROSA ANGELA GUTIERREZ SANTIESTEBAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01823', N'AOA030408UA8', N'AGRICOLA 8A SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01824', N'ACD081231RC5', N'AGRICOLA CAMPO DAVID SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01825', N'PECA320610M62', N'ANA MARIA PEREA CERVANTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01826', N'ACP030723SE3', N'AGRICOLA CUBIRI DE PORTELAS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01827', N'ADJ111024B22', N'AGRICOLA DON JUAN SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01828', N'AEAJ7205187Q6', N'JESUS BERNARDO ARMENTA ACOSTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01829', N'AVE030729P47', N'AGRICOLA VELMAR SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01831', N'DAFA450526SN9', N'ARNULFO DAGNINO FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01832', N'FAFC780902JV3', N'CESAR ARMANDO FRANCO FIGUEROA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01833', N'EILR4608299PO', N'RAMON ESPINOZA LEAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01834', N'VAZA780617TZA', N'ADRIANA VALDEZ ZAVALA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01835', N'HILJ5701281F5', N'JESUS HIGUERA LAURA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01837', N'AAR0906174F3', N'AGRICOLA ADOLFO RUIZ CORTINEZ No. 3 SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01838', N'BEMR380911585', N'RAUL BELTRAN MORENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01839', N'APS090223GB0', N'AGRICOLA PACHYS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01840', N'EARA371005PP7', N'ANGELITA ESTRADA RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01841', N'SOVA460211E78', N'ALFONSO SOLIS VILLEGAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01842', N'PEMA6510095U5', N'ARTURO PEÑA MIRANDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01843', N'AAVE4903205K2', N'EFRAIN AYALA VEA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01844', N'PAPC401223FR3', N'CAYETANO PACHECO PALAFOX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01845', N'CMA990318KM8', N'CORPORATIVO MAGUEY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01846', N'VALE781102DV8', N'ELSA MARIA VALENZUELA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01847', N'MOSF621211U24', N'FRANCISCO JAVIER MOLINA SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01848', N'GRO991222UU8', N'GRUPO ROMO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01849', N'FIGG450206AH1', N'GUADALUPE FIGUEROA GALLARDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01850', N'VAVH700107S44', N'HERMELINDA VALENZUELA VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01851', N'MACI6611288L5', N'IRMA MACHADO CORONEL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01853', N'MACL640905MD1', N'JOSE LUIS MACHADO CORONEL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01854', N'CALJ500916KUA', N'JUVENTINO CASTRO LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01855', N'GUAL75040679A', N'LETICIA GUTIERREZ AYALA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01856', N'MACA680529FT9', N'MARIA AIDA MACHADO CORONEL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01857', N'ZARM400206EU6', N'MARIO SALVADOR ZAZUETA RUIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01858', N'PAG991028KM6', N'PRODUCTORA AGRICOLA GUTIERREZ SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01859', N'VACR660127II4', N'RICARDO ALONSO VALENZUELA CARRASCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01860', N'MALV400514PM0', N'VICTOR MACHADO LEON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01861', N'XEXX010101000', N'MOJO SPIRITS HOLDINGS LLC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01862', N'AEMC3411109Q0', N'CELERINO ARCE MONTOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01863', N'MEBC640326BYA', N'CESAR ARIEL MENDOZA BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01864', N'HELE600401749', N'EFRAIN HERRERA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01865', N'PAPE641102C82', N'ELSA PATRICIA PALAFOX PAZOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01866', N'TORE4408082S3', N'EMMA TERESA TOVAR ROCILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01867', N'BOVE5702098W3', N'ENRIQUE BOJORQUEZ VELARDE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01868', N'LOEE740717KG4', N'ERBEY ALEJANDRO LOPEZ ESPINOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01869', N'AEGE620317QV0', N'EVERARDO ARMENTA GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01870', N'AEOF440330LI1', N'FRANCISCO ARMENTA OCHOA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01871', N'SOLF411004199', N'FRANCISCO SOTO LUNA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01872', N'LEAG681103MM4', N'GENADIS LEAL ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01873', N'LESH440414LI2', N'HUMBERTO LEAL SEPULVEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01874', N'PASH871214DF4', N'HUMBERTO PALAFOX SIERRA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01875', N'AOBI650726G59', N'ISMAEL ABOYTE BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01876', N'PAPJ820311BL9', N'JAVIER PACHECO PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01877', N'OGS090218V18', N'COMPAÑIA OPERADORA DE GRANOS Y SERVICIOS LOGISTICOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01878', N'PALA330828U6A', N'LAURO PADILLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01879', N'BAGL650211SW7', N'LAZARO BANDA GAXIOLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01880', N'BAGL920726DVA', N'LAZARO BANDA GURROLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01881', N'GAP110327GE7', N'GRUPO AGROEMPRESARIAL PROFINCO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01882', N'GARL450502QB4', N'LEONEL GAXIOLA RUIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01883', N'EAHC520709D3A', N'MARIA CARMEN ESTRADA HEREDIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01884', N'VEGC4109171P1', N'MA CARMEN VENCES GARCIA')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01885', N'SIRF620717EI2', N'MA FABIOLA SIERRA ROSAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01886', N'RUMH740725RV5', N'MANUEL ALBERTO RUIZ HEREDIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01887', N'RUPM5311157D1', N'MARTHA ELENA RUIZ PACHECO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01888', N'FOHM7709047Y6', N'MILTON RAMON FLORES HERRERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01889', N'LEAN6911306JA', N'NANCY LEAL ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01890', N'MEBO610702CD2', N'OLEGARIO MENDOZA BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01891', N'VIPO6808035A5', N'OLGA LYDIA VILLEGAS PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01892', N'AAGO741126SH7', N'ORFILDA ALVAREZ GALLARDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01893', N'PAGO660624KC1', N'OSCAR MANUEL PADILLA GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01894', N'BARO700223LU2', N'OSCAR SAMUEL BALDERRAMA REVUELTAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01895', N'PAPP740915QX4', N'PORFIRIO PALAFOX PAZOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01896', N'PAPR620325A80', N'RAMON HUMBERTO PALAFOX PAZOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01897', N'EAVR661002J62', N'ROGELIO ESTRADA VENCES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01898', N'LOMR390228DX9', N'ROMAN LOPEZ MANZO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01899', N'MEMR710809DX5', N'ROMAN MENA MEDINA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01900', N'AUPS4706216Y1', N'SALVADOR ANGUIANO PEÑA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01901', N'SAG111007JE7', N'SJL AGRICOLA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01902', N'MOMS750805IJ5', N'SONIA BEATRIZ MOLINA MOLINA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01903', N'PAPT680510738', N'TOMAS PALAFOX PAZOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01904', N'OULV6702081U7', N'VICTOR ROBERTO OSUNA LIZARRAGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01905', N'BAAW750516829', N'WBALDO BARRAZA AGUILAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01906', N'ACS0506084K5', N'ALMACENADORA Y COMERCIALIZADORA DEL SURESTE S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01907', N'DAA020218JY1', N'DSV AIR & SEA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01908', N'PMC9601107JA', N'PROVEEDORA MEXICANA DE CLIMAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01909', N'ROMI751129J71', N'MIAO RONG')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01910', N'ISA961205L14', N'INSUMOS Y SERVICIOS AGRICOLAS DE OCCIDENTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01911', N'HME1105121Y3', N'HISENSE DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01912', N'LPR980610R55', N'LAVIN PRODUCTORES SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01913', N'PQG791011EQA', N'PROVEEDOR QUIMICO DE GUADALAJARA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01914', N'INN060324DX7', N'INTERTRAFFIC INTERNATIONAL SC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01915', N'MCO830127BI6', N'MATERIALES COMSA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01916', N'MFI921113K41', N'MERCADER FINANCIAL SA SOFOM ER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01917', N'BTN010323ML2', N'B T DECORATIVE FABRICS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01918', N'AMI1202151T7', N'AMIGALAND SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01919', N'TWF120820JN0', N'TECHNOLOGIES WF SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01920', N'SFA801001TM9', N'NO SABE FALLAR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01921', N'TTC080305UZ4', N'TABLEROS Y TRIPLAY DEL CENTRO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01922', N'ABR120416KJA', N'AUTOPARTES BROKERS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01923', N'MRE0610095I7', N'MARCAS DE RENOMBRE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01924', N'GAOC5405205V5', N'NULL NULL NULL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01925', N'GAAM800707QQ0', N'MARCELA BERNADETT GASTELUMN AGUILAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01926', N'MRO0106186F9', N'MOTO ROAD SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01927', N'EMA950906L79', N'EMBOTELLADORA LAS MARGARITAS S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01928', N'MTE070531RP7', N'MEGA TEXTIL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01929', N'CLE980909AU8', N'COMALA LEATHER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01930', N'GTM070628CK8', N'GRUPO TOP-PRA DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01931', N'XEXX010101000', N'GOOGLE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01932', N'ARC840618JIA', N'ACABADOS Y RECUBRIMIENTOS DE COLIMA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01933', N'PPE9701253S4', N'PROVEEDORA LA PERLA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01934', N'MAN080710H90', N'MANISAMEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01935', N'ROOJ690918Q38', N'NULL NULL NULL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01936', N'GRO840707BM3', N'GRUPO ROBLEDO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01937', N'AIS071025UM1', N'ALEXAMEX INTERNATIONAL SOLUTIONS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01938', N'GPA970805LC2', N'GRANJA PAULINA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01939', N'CGA1012137T7', N'COMERCIALIZADORA DE GRANOS DE AMECA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01940', N'OST9505115I6', N'OFI STORE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01941', N'RIBJ570730724', N'JAIME ALFONSO RIVAS BARRAGAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01942', N'MGT120803D83', N'MATHEW GLOBAL TRADE CUSTOMS SERVICES SC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01943', N'GPS031229372', N'BIO PAPPEL SCRIBE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01944', N'EHM0409102X0', N'EX HACIENDA DEL MALUCO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01945', N'LEGA760305', N'ADALBERTO LEON GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01946', N'MASE760114AE6', N'EDUARDO MARTINEZ SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01947', N'SOL8309097K1', N'SOLQUIM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01948', N'OAS050406RT6', N'OPERADORA Y ADMINISTRADORA SW SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01949', N'ADN06031028A', N'ALMACENAJE Y DISTRIBUCION NORDIC SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01950', N'ADY060810C1A', N'AGRICOLA DYRENE SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01951', N'ACJ100630HK4', N'AGRICOLA 5 DE JUNIO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01952', N'ACC100628TV6', N'AGRICOLA CERRITOS DE CHIHUAHUA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01953', N'ACG110831I70', N'AGRICOLA CG SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01954', N'AUAA481004TV1', N'AGUSTIN AGUILAR AGUILAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01955', N'AHO040811I91', N'AGRICOLA HPS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01956', N'AVC090223L1A', N'AGRICOLA VEGA CANTU SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01957', N'PACA750326NI1', N'ALDO ALAIN PRANDINI CAMARENA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01958', N'SEMA660731SK0', N'ANA ADELINA SERRANO MORALES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01959', N'QUVA721216430', N'ANA CELIA QUINTERO VAZQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01960', N'LFC940208C77', N'LUZ Y FUERZA DEL CENTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01961', N'FOBA491030SD9', N'ANGEL FLORES BURBOA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01962', N'MUVA361231UM4', N'ANTOLIN MURILLO VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01963', N'MOEA430226G15', N'ANTONIA MORALES ESCALANTE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01965', N'MEAB460520LU1', N'BERNARDINO MELENDREZ APODACA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01966', N'AAOB491006880', N'BRUNA ALVAREZ OCHOA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01967', N'TARC630605BA8', N'CARMEN ALICIA TALAMANTE ROMERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01968', N'GUCC270927615', N'CIPRIANA GUTIERREZ CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01969', N'FOFE700318GJ8', N'EDNA ELIZABETH FLORES FRANCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01970', N'AOLE5207186A0', N'EDUARDO ACOSTA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01971', N'AAEE470808KQ6', N'EMILIO ALVAREZ ESPINOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01972', N'SARE3310069B2', N'EPIFANIO SALOMON RIVERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01973', N'AOVF410822EM5', N'FERNANDO ACOSTA VILLEGAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01974', N'CARF480205JB1', N'FILIBERTO CASTRO ROMERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01975', N'RUVF830915FL7', N'FLORENCIO RUIZ VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01976', N'AUVF4005026G5', N'FRANCISCO ACUÑA VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01977', N'LEAG4102032S4', N'GISELA LEY ALVAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01978', N'LAGG3603129R6', N'GREGORIO LLANES GALAVIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01979', N'SACG550322IJA', N'GUADALUPE SANCHEZ CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01980', N'FOFH730528RB5', N'HERNANDO FLORES FRANCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01981', N'VARJ7307131P8', N'JESUS ENRIQUE VALENZUELA RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01982', N'VAGJ540410438', N'JESUS MANUEL VALENZUELA GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01983', N'AEFJ670122GL3', N'JESUS MARIA ARREDONDO FELIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01984', N'SIFJ340227G65', N'JOAQUIN SIMENTAL FALCON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01985', N'COMJ5504269B9', N'JORGE LUIS COTA MURRIETA')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01986', N'GARJ580801FL4', N'JORGE LUIS GASTELUM RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01987', N'VEFJ540608KA2', N'JORGE LUIS VEGA FLORES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01988', N'', N'BLS DEVELOPMENT GROUPE INC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01989', N'FGU991028PW3', N'FORRAJES GUTIERREZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01990', N'LPL8603272D4', N'LACTOPRODUCTOS LA LOMA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01991', N'DDC110630BZ5', N'DESARROLLO DE CULTIVOS ESTRATEGICOS Y ALMACENAJE S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01992', N'ANU090303IK4', N'AGROINDUSTRIAS NUTRICIONALES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01993', N'PAN921013AK7', N'PROTEINA ANIMAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01994', N'GONA831211NO7', N'ANA ISABEL GOMEZ NAVARRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01995', N'DIM071108BJ5', N'DISTRIBUIDORA INTERCONTINENTAL MEXICANA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01996', N'COS621024897', N'COSBEL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01997', N'OIU111209755', N'OPERADOR INTERLOGISTICO UNIVERSUS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01998', N'GPA050511AM9', N'GRANOS EL PARAISO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'01999', N'GAH971114270', N'GRANOS Y AGROQUIMICOS HERNANDEZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02000', N'PFN9105238S8', N'PRODUCTORA DE FERTILIZANTES DEL NOROESTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02001', N'RURG560831F18', N'MARIA GUADALUPE RUANO RUANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02002', N'CARJ7904014C6', N'JUAN CARLOS CAMACHO RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02003', N'REMJ551007TV5', N'JULIA REYES MORGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02004', N'GEL080818MP5', N'LOS GELELOS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02005', N'SOOM340602GW8', N'MACEDONIO SOTO ORDUÑO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02007', N'GUMA690202BX8', N'MARIA ALTAGRACIA GUERRERO MARTINEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02008', N'VACA340328322', N'MARIA DEL CARMEN VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02009', N'TIVG571013E7A', N'MARIA GUADALUPE TINOCO VAZQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02010', N'BMI9312038R3', N'BANCA MIFEL SA INSTITUCION DE BANCA  MULTIPLE GRUPO FINANCIERO MIFEL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02011', N'LOAM700520NL5', N'MARIO CUAUHTEMOC LOPEZ APODACA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02012', N'CAVM901016SN2', N'MARTIN CASTRO VEGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02013', N'VAMM720226FM9', N'MARTIN VALENZUELA MUÑOZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02014', N'AEIP7308314H1', N'PATRICIA ARCE IBARRA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02015', N'PFA1005217S9', N'PC FARM S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02016', N'CAGR700729NN3', N'RAMON ALBERTO CASTRO GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02017', N'AACR3712035D8', N'RAMON AYALA COTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02018', N'MUSR720120MJ7', N'RENE ARTURO MUÑOZ SANTINI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02019', N'RUCR460809JR1', N'ROMAN RUIZ CARLON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02020', N'AAZR750310L66', N'ROSA MARIA ARAMBULO ZATARAIN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02021', N'JIGR321024V84', N'ROSARIO JIMENEZ GILL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02022', N'GAPS8809161T2', N'SERGIO GASTELUM PALOMARES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02023', N'TARS450918C76', N'SOFIA TALAMANTE ROMERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02024', N'TSP831226B71', N'TAMANDARO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02025', N'TMA081210NF5', N'TIKO MANGOS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02026', N'MELU690525T64', N'URBANO ISRAEL MENDOZA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02027', N'AUTV740729Q2A', N'VICTOR HUGO AGUILAR TINOCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02028', N'BAMV560812QK0', N'VIRGINIA IMELDA BLANCO MORENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02029', N'ZAP0609112AA', N'ZAPAGRO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02030', N'AAVZ450326DP7', N'ZENON ALVAREZ VALDES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02031', N'SCC790313KB9', N'SOCIEDAD COOPERATIVA DE CONSUMO DE AGRICULTORES RURAL DEL VALLE HERMOSO  SCL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02032', N'ALZ060126R43', N'AGROPRODUCTOS LOPEZ ZARAGOZA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02033', N'PLJ060830SPA', N'PABLO LUIS JUAN SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02034', N'AJO060817V37', N'AGROSERVICIO JOCONOXTLE SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02035', N'NUT8210073U3', N'NUTRICAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02036', N'DGT121212PG7', N'DON GOOD TEQUILA S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02037', N'PTR050630A56', N'PRODUCTORES DEL TRIMASO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02038', N'FRI0508039HA', N'FRIGARSA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02039', N'NUT920426MI6', N'NUTRIGAFER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02040', N'LUCD591028DH9', N'JOSE DOLORES LUEVANO CHAVEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02041', N'LIE110909D12', N'LAKSHMI IMPORTACIONES Y EXPORTACIONES S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02042', N'HME110531TJ4', N'HAWORTH MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02043', N'CCP110118SN0', N'COPRO CONTROL Y PROTECCION EN SEGURIDAD PRIVADA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02044', N'TPT041028J40', N'TEOCUITATLAN PRODUCE PARA TI CEREAL SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02045', N'AME011127HC5', N'ACTECK DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02046', N'GSC050923J53', N'GRANOS Y SEMILLA DE LA COSTA ALEGRE SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02047', N'TEL721214GK7', N'TELEVISA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02048', N'XEXX010101000', N'SPIRITS TRADING INTERNATIONAL SA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02049', N'DMT880527UX7', N'DERIVADOS DE MADERA Y TRIPLAY DE OCCIDENTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02050', N'AJA110526UY1', N'AGROENLACES DE JALISCO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02051', N'RME060831QJ8', N'ROQUETTE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02052', N'HCE1109069E4', N'HERU COMERCIAL E INDUSTRIAL DEL CENTRO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02053', N'ADD070727RN4', N'AGROPECUARIA ADOBE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02054', N'MLI1208014E3', N'MAQUINARIA LIGERA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02055', N'OLO081112CT4', N'ORBITZ LOGISTICS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02056', N'SFT100326599', N'STAR FISH TRADING SERVICE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02057', N'FHO100810H77', N'FORNITORI HOGAR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02058', N'BAOL8009091A2', N'LEOPOLDINE JAZCIEL BALTAZAR ORTIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02059', N'AAVM691101FU6', N'JOSE MANUEL ALVARADO VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02060', N'PPO000705CG4', N'LOS PEREZ DE POANAS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02061', N'OPC1101055X7', N'OPERADORA DE PRODUCTOS CARVI SA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02063', N'BM1061005NY5', N'BANCO MULTIVA SA INSTITUCION DE BANCA MULTIPLE GRUPO FINANCIERO MULTIVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02064', N'JMO821210U96', N'JALISCO MOTORS SA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02065', N'VAJA580110AW6', N'ANTONIO VALDIVIA JAUREGUI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02066', N'PRO000824GF4', N'PROVINPAPER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02067', N'GCS0601053Y6', N'GLOBAL COMFORT SYSTEMS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02068', N'WAP040623SH5', N'WELDING ALLOYS PANAMERICANA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02069', N'PAT051015F86', N'PRODUCCIONES AUDIOVISUALES THELIFT MX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02070', N'FEGR780319T56', N'RAFAEL FERNANDEZ GOMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02071', N'MUN120830926', N'MISS UNIQUE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02072', N'CIA0204137M0', N'COMERCIALIZADORA INTERNACIONAL ARIZONA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02073', N'NMA060508Q75', N'NUTRICION MARINA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02074', N'PPG0912038D5', N'PLANTA DE PROCESOS GM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02075', N'SIN9412025IA', N'SCOTIABANK INVERLAT SA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02076', N'HGU971115KR1', N'HARINERA GUADALUPE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02077', N'CSP930318TX7', N'CONTRATISTAS Y SERVICIOS PROFESIONALES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02078', N'MUGG8003211G0', N'MARIA GUADALUPE MUÑOZ GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02079', N'PPA881004TU6', N'PAVOS PARSON SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02080', N'BEPM7409239T3', N'MATIAS BEJARANO PIÑA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02081', N'AAM060809V23', N'AGROPECUARIA AMPARAN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02082', N'NUT810508V54', N'NUTRESA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02083', N'GAH971114270', N'GRANOS Y AGROQUIMICOS HERNANDEZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02084', N'DERF770306HJC', N'FERNANDO DELGADILLO RUANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02086', N'GEC981004RE5', N'GOBIERNO DEL ESTADO DE CHIHUAHUA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02087', N'PICR790813JB9', N'JOSE REYES PIMENTEL CARMONA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02088', N'BBR090908D26', N'BAUM BROTHERS SA DE CV')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02089', N'MIDD820413FW8', N'DANIEL MIRANDA DORANTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02090', N'DLA110309DN9', N'DESPEPITADORA EL LLANO SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02091', N'SEHJ7912223J3', N'JORGE ALBERTO SERRANO HUERTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02093', N'PKP111209S41', N'PRODUCTORA KARNICA PKS SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02094', N'SFM951124Q32', N'SENSIENT COLORS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02095', N'CLL1301316F5', N'CONCEPTION LED LAMPS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02096', N'FJA930705CS1', N'FRIGORIFICO DE JALISCO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02097', N'CEF951106HR5', N'COMITE ESTATAL PARA EL FOMENTO Y PROTECCION PECUARIA DE ZACATECAS SC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02098', N'RFO801023MJ4', N'REPRODUCCIONES  FOTOMECANICAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02099', N'PCS970306NP3', N'PROVEEDORA DE CLIMAS Y SERVICIOS SALDAÑA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02100', N'GRE8605215X7', N'GRUPO DE REFRIGERACION SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02101', N'DAN1209039B5', N'DACE APPLIANCES NORTH AMERICA SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02102', N'SARJ781023N44', N'JUAN PABLO SANCHEZ RUIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02103', N'MDI991214A74', N'MILENIO DIARIO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02104', N'APP891018BK0', N'AGENCIA PROMOTORA DE PUBLICACIONES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02105', N'PCO0710088X2', N'MC PORTA CONTAINER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02106', N'', N'CARTERA GANADERA MEXICALI SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02107', N'MTR0603101NA', N'MONTEVERDI TRADING SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02108', N'AXO920121R63', N'AGROINDUSTRIA XOMOR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02109', N'PANB671129Q90', N'BERTHA VELIA PALACIOS NODAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02110', N'MMO7611126H4', N'MOLINOS MOCHIS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02111', N'GAOI760913S12', N'IVAN ALEJANDRO GARCIA OCHOA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02112', N'', N'CARTERA TRANSPORTATION ADVANCE TECHNOLOGY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02113', N'TAT121109472', N'TRANSPORTATION ADVANCE TECHNOLOGY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02114', N'DNP010613GN4', N'DSM NUTRITIONAL PRODUCTS MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02115', N'PCI080611DG2', N'THE PAMPERED CHEF IMPORT S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02116', N'ANE020214AP8', N'ADTRAN NETWORKS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02117', N'XEXX010101000', N'DMC AMERICA INC.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02118', N'QUI7309077H1', N'QUIMPLEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02119', N'CMS950119DRA', N'CONTEC DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02120', N'YAW110203977', N'YAWILL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02121', N'FBF101202SP4', N'FACTORY BAGS FOR WOMEN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02122', N'IPO010718JM9', N'INDUSTRY POLYSTYRENE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02123', N'MME120322M19', N'MAGOGOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02124', N'CIG980520B41', N'CONSORCIO INMOBILIARIO GIG SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02125', N'XEXX010101000', N'CARAVELLE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02126', N'XAXX010101000', N'EMBAJADOR CARLOS GARCIA DE ALBA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02127', N'APE080708RJ0', N'ALGODONERA LA PERLA SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02128', N'GDI040927BH1', N'GIG DESARROLLOS INMOBILIARIOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02129', N'VACR640420R11', N'RAMON VALENZUELA CUADRAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02132', N'CGP011003IK6', N'GRANOS PATRON NO USAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02133', N'MART590519I41', N'MA TERESA MACIAS RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02134', N'MFA840312BD6', N'MOLINO LA FAMA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02135', N'GORH5903118Y8', N'MARIA HORTENSIA GONZALEZ RUIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02136', N'VACJ540507HP4', N'JUAN CARLOS VARELA CASTILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02137', N'MPU100531KW4', N'MEXICO DEVELOP INNOVATION SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02138', N'AIB0912152U7', N'AGROEXPORTADORA IBCA S.P.R. DE R.L. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02139', N'BEC021107290', N'BECLE SAB DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02140', N'CPM110719SG3', N'COMERCIALIZADORA PEPSICO MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02141', N'CAAA460809693', N'ALBERTO CASTILLEJA AGUIRRE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02142', N'DME000128FG0', N'DORMA MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02143', N'DIC0407284Q7', N'DESARROLLO DE INGENIERIA CIVIL Y TECNOLOGIA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02144', N'ASH041012QC7', N'AGROPRODUCTOS Y SERVICIOS HELU SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02145', N'CIC090902NI6', N'CORPORATIVO INAGRO COMERCIAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02146', N'DDE010329NM6', N'DULCES LAS DELICIAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02147', N'MFU831228P83', N'MOLINERA DEL FUERTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02148', N'NCO1001223N5', N'NICO COMMODITYES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02149', N'SIC9603227K2', N'SERVICIOS INTEGRALES DE COAHUILA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02150', N'ACP080715UK8', N'AMERICA Y CHINA PROMOCIONALES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02151', N'AGR101221QZ2', N'AGROPRODUCTORES EL GRECO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02152', N'OAN090923DY8', N'OPERADORA Y ADMINISTRADORA DE NEGOCIOS FOLG SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02153', N'ABO941116PB5', N'ALMACENADORA BANORTE SA DE CV ORGANIZACION AUXILIAR DEL CREDITO GRUPO FINANCIERO BANORTE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02154', N'PHI931220AN5', N'P H I MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02155', N'SOP0410217V5', N'SONOCO OPERADORA S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02156', N'CME090205NS5', N'CWL MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02157', N'', N'CARTERA  METALURGICA DEL PASAJE URBANO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02158', N'AGU900613KE0', N'ALGODONES GUTIERREZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02159', N'CEC0005068N0', N'CONSEJO ESTATAL DE CIENCIA Y TECNOLOGIA DE JALISCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02160', N'MAD841018U49', N'LA MADRILEÑA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02161', N'MEVJ810505TP8', N'JULIO CESAR MENDOZA VARGAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02162', N'IDA650622125', N'INDUSTRIAS DANPEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02164', N'PAL0701129S3', N'PALLIUM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02165', N'XAXX010101000', N'SIGMAPACK')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02166', N'AVH840127M13', N'AGROPECUARIA VALLE HERMOSO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02167', N'CME0708213G0', N'COMERCIALIZADORA MEGASEM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02168', N'FMA020325LX1', N'FRUTOS MARINOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02169', N'AURI6509147D4', N'IGNACIO AGUIRRE RIVAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02170', N'CAG960109583', N'CORDOBA AGROMAQUILAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02171', N'WTE0706221W9', N'WIN TECHNOLOGIES S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02172', N'PCE060214NX4', N'PRODUCTORES EL CEDRO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02173', N'PNU961217C19', N'PROVEEDORA DE NUTRIENTES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02174', N'GYK120221K65', N'GALERIA YK SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02175', N'QDM521124S17', N'QUEST DIAGNOSTICS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02176', N'AVA060313EI7', N'AGROINDUSTRIAL DEL VALLE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02177', N'AOCN721202F54', N'NEMESIO ARTOLA CARDENAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02178', N'AOCA781219EC9', N'ALEJANDRO ARTOLA CARDENAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02179', N'CAIR500416NX1', N'ROSA MARIA CARDENAS IZABAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02180', N'ADK100923JS0', N'AGRICOLA DKARELY SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02181', N'MDU861215QR8', N'MUEBLES DUREX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02182', N'RGE060617128', N'RAGO GRAIN ELEVATOR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02183', N'IAP031107UZ1', N'INTEGRADORA AGROCOMERCIAL DEL PACIFICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02184', N'XAXX010101000', N'GOODYEAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02185', N'OCO110315Q99', N'OTTOMOTORES COMERCIALIZADORA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02186', N'CIT000621B55', N'COOPERATIVAS INTEGRADAS DE TAMAULIPAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02187', N'REA860318BG9', N'REACO SA DE CV NO UTILIZAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02188', N'BHA130130798', N'BRUNI HOME APPLIANCES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02189', N'HIR820208UP1', N'HARINERA DE IRAPUATO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02190', N'SCS910327KB7', N'SILOS DEL CAMPO SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02191', N'IAL980624563', N'INSTITUCIONAL DE ALIMENTOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02192', N'IPM090115F88', N'INTRO PACIFICO DEL MAR SA DE CV')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02193', N'ERO070927130', N'CARTERA EROAN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02194', N'ACH990709V53', N'AGROPECUARIA CADENA HERMANOS SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02195', N'MOSG6501208Z5', N'GRISELDA MONTAÑO SOLORIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02196', N'SLI031030IW2', N'SOLUCIONES LOGISTICAS INTELIGENTES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02197', N'UME0508055B6', N'URVET MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02198', N'REG0603079R1', N'REGIOENGORDAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02199', N'CPO080211EWA', N'COMERCIALIZADORA PORT SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02200', N'JCJ0007268L4', N'JULIO CEPEDA JUGUETERIAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02201', N'ICO8902018SA', N'IMPORTACIONES EVEREST WINES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02202', N'QME1012066I5', N'QUIMIALMEL MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02203', N'EAS890420MN3', N'ECOLOGIA APLICADA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02204', N'MLO030721U68', N'MEXIWORLD AND  LOGISTICS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02205', N'IMT100831DBA', N'INTERNATIONAL METAL TECHNOLOGY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02206', N'ZAGR4602069Q9', N'ROBERTO ZAMBRANO GAYTAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02208', N'CMS101210KL6', N'COMERCIALIZADORA DE MAIZ SIERRA AZUL SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02209', N'CCD020617DD8', N'COBRE 110 SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02210', N'PCE120926V45', N'PROVEEDORA DE COMESTIBLES ESPAÑA S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02211', N'AULR720320T51', N'RICARDO AGUILAR LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02212', N'ANX060904679', N'AGROAVICOLA DEL NORTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02213', N'GCO030219FZ5', N'GEOMAR CONGELADORA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02214', N'ACI930601QY1', N'AVICOLA EL CICLON SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02215', N'CASN6301107M0', N'NORBERTO CHAVEZ SANDOVAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02216', N'MASL800706KW0', N'LISSIE IVETTE MARTINEZ SANTILLAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02217', N'DIMI480104HZ4', N'MIGUEL ANGEL DIAZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02218', N'DMT110610J8A', N'DILLI MEXICO TUS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02219', N'HTE850710MKA', N'HARINERA DE TEXCOCO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02220', N'PIC980701FC4', N'PICALSA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02221', N'LUBR690720MP0', N'ROSA AMELIA LUGO BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02222', N'CBI121203DF5', N'COSECHA BIENESTAR SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02223', N'SME120418427', N'STARTECH COM MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02224', N'ALS980805FA8', N'AGRICOLA LA LOMA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02225', N'ARM961024597', N'AGRICOLA ROMERO MENDIVIL SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02226', N'XAXX010101000', N'PROA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02227', N'PCU960209TA7', N'POSTA EL CUATRO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02228', N'ASI0907162B5', N'AGRICOLA SIJO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02229', N'ELT120504CK4', N'ENLACES LOGISTICOS TRANSNACIONALES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02230', N'GCA1105036LA', N'GREEN CARPET SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02231', N'AED000112FG9', N'AM EDITORES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02232', N'MOC921210EA8', N'MBS DE OCCIDENTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02233', N'HTO830620G40', N'COMPAÑIA HULERA TORNEL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02234', N'LSY920921RR9', N'LLANTI SYSTEMS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02235', N'TNA910502JI5', N'TRANSPORTES NARCEA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02236', N'AAS980605636', N'AGRICOLA ADAME SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02237', N'ABF0906103T2', N'AGRICOLA B.R. Y FAMILIA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02238', N'ADA100823FP3', N'AGRICOLA 18 DE ABRIL SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02239', N'AAR12050238A', N'AGRICOLA ARBEL SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02240', N'AAZ1105305M7', N'AGRICOLA AZAEL SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02241', N'ABA121018AV1', N'AGRICOLA BENITA ACOSTA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02242', N'ACD100913968', N'AGRICOLA CARRASCO DIEGUEZ SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02243', N'ACR110325UZ0', N'AGRICOLA CRISTIAN SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02244', N'APR0307309E6', N'AGRICOLA EL PROFE SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02245', N'AQU100503SM7', N'AGRICOLA QUETZZAL SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02246', N'AGA120818IM4', N'AGRICOLA GALVEZ SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02247', N'AGA1208182W8', N'AGRICOLA GARRAFON SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02248', N'AGU120528R40', N'AGRICOLA GUTVALAR SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02249', N'AHC110418LM7', N'AGRICOLA HCA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02250', N'SCC790313KB9', N'SOCIEDAD COOPERATIVA DE CONSUMO DE AGRICULTORES RURAL DEL VALLE HERMOSO SCL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02251', N'AEM120605663', N'AMERICAN EAGLE DE MEXICO IMPORTS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02252', N'NAH120326P23', N'NAHUA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02253', N'TBO100920E63', N'TOP BOOKS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02254', N'UDV0803031T1', N'URREA DANDO VIDA AL AGUA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02255', N'RCG090622539', N'RANCHO CALIFORNIA DE GUASAVE SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02256', N'ALO021221487', N'ALMADA LOPEZ SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02257', N'SOCD800830N87', N'DIANA KARELY SOTO CORRAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02258', N'IUPF6601207W7', N'FABIAN ALBERTO INZUNZA PEREA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02259', N'BAC120714RC6', N'BACHVAL SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02260', N'IOL940721IZ8', N'(CARTERA ) INDUSTRIAL DE OLEAGINOSAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02261', N'LILM630525ADA', N'MANUEL FELIPE LIMON LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02262', N'ALI9803229XA', N'AGROINDUSTRIAS LOS LIMONES SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02263', N'CEC1307295P2', N'COMITE ESTATAL EL CUAL CONFORMA EL SISTEMA DE PRODUCTO MAIZ DE GUANAJUATO AC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02264', N'PSC130726CY5', N'PRODUCTORES DE SORGO DEL COMITE ESTATAL DEL SISTEMA PRODUCTO SORGO DEL ESTADO DE GUANAJUATO AC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02265', N'ECH970615SJ2', N'EJIDOS COLIMA, HERMOSILLO, MEZQUITAL SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02266', N'PFR0008162D6', N'PRODUCTORES FRANCO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02267', N'FAFF771229F34', N'FRANCISCO FRANCO FIGUEROA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02268', N'FAFF771229F34', N'ROBERTO FRANCO RIVERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02269', N'CPF011126P56', N'CONSTRUCCIONES Y PERITAJES FERROVIARIOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02270', N'BDE8106261W7', N'BLACK & DECKER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02271', N'VPR0312113Q5', N'VANGUARD PRICE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02272', N'POL101012G33', N'POLIPROMOCIONAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02273', N'PUG090512PR8', N'PRODUCTORES UNIDOS DE GRANOS DE MORELOS SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02274', N'SRU041021DP4', N'SINERGIA RURAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02275', N'', N'L OREAL SLP SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02276', N'ACD850602LD3', N'ALIMENTOS CONCENTRADOS DE DELICIAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02277', N'LOGA690806KF7', N'ALEJANDRO LOKIER GORBACH')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02278', N'LMI0811119C5', N'PROMOTORA EMPRESARIAL DE OCCIDENTE SCM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02279', N'OURM780814D2A', N'MIRIAM MARISELA ORDUÑO RUIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02280', N'AIN100630D48', N'AGRICOLA LOS INCONFORMES SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02281', N'APR120124J9A', N'AGRICOLA PROHORT SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02282', N'PAL090617SK5', N'PRODUCTORA AGRICOLA LAYOVA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02283', N'LOBG420322GA2', N'GRACIELA LOYA BARRAZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02284', N'AOMC7311085H6', N'CARLOS ALFONSO ACOSTA MAGALLANES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02285', N'AAG080218J98', N'AGRICOLA ANGULO GASTELUM SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02286', N'AGO080515RSA', N'AGRICOLA EL GOYO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02287', N'ALA100818VB0', N'AGRICOLA LA LOMA DE ACATITA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02288', N'ALA0506091Y5', N'AGRICOLA LOS LALOS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02289', N'ARL111213D34', N'AGRICOLA ROCHA LIMON SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02290', N'ATA080202T21', N'AGRICOLA TAMARINDO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02291', N'MOBL630411RG0', N'JOSE LUIS MORENO BELTRAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02292', N'UIUM560705UF5', N'JOSE MIGUEL URIARTE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02293', N'POMR450107GN0', N'RAMIRO PONCE DE LEON MORALES')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02294', N'VND961106UQ1', N'VILLAMOROS NO. 2 SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02295', N'ASJ101005P32', N'AGRICOLA SAN JOSE DEL OLVIDO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02296', N'ROL070730L74', N'RANCHO OLGA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02297', N'SEAS720823774', N'SANTIAGO SERNA ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02298', N'MSU080206E88', N'MUNDO SUSTENTABLE S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02299', N'ANE951031KK2', N'ASOCIACION NACIONAL DE EMPRESAS COMERCIALIZADORAS  DE PRODUCTORES DEL CAMPO A.C.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02300', N'DYN160528NSA', N'DYNAKROM SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02301', N'GMA04091356A', N'GRUPO MARCON SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02302', N'PME090311J94', N'P&F MEXICANA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02303', N'XEXX010101000', N'INTL FCSTONE INC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02304', N'GCO080312VB8', N'2GZ CONSULTORES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02305', N'PST130805M72', N'PAANN 63 S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02306', N'ROMR640510CE4', N'RAFAEL ROJO MONTOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02307', N'ASE920408BN6', N'AVICOLA SEDANO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02308', N'AGR120824GM6', N'AGROINSUMOS GRAFECA SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02309', N'DITS771018TPA', N'SANDRA LUZ DIAZ TEJEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02310', N'PEOE920903HN7', N'EDUARDO PEÑA OCHOA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02311', N'BABE7207031RA', N'ERIKA BARRIOS BARRERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02312', N'OIG100330DPA', N'OCEANUS INTERNATIONAL GROUP MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02313', N'PMA060905RG2', N'PROVEEDORA DE MARCAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02314', N'ESZ860213AA2', N'EMPACADORA DE SEMILLAS ZARAGOZA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02315', N'SIL0610268I0', N'SERVICIOS DE INSPECCION Y LOGISTICA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02316', N'SME9609103A2', N'CAMSO DISTRIBUCION MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02317', N'FTR090213V9A', N'FUJIMURA TRADING SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02318', N'CDS010402H81', N'CORPORATIVO DESTILERIA SANTA LUCIA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02319', N'HNA130220TY1', N'HN NACIONALES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02320', N'CAE020322KDA', N'CENTRO AGROPECUARIO ETZATLAN SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02321', N'VVE100929H52', N'VETA VERDE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02322', N'CVA010212F6A', N'CONGELADORA VAZQUEZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02323', N'YPA821012797', N'YESO PINTURA Y ACABADOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02324', N'PGE101221KT5', N'PROYECTOS GENIUS S DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02325', N'TEX101014TS9', N'TEXCALPITZAHUAC S.P.R. DE R.L')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02326', N'PGY1002247H9', N'PRODUCE GRAIN DEL YAQUI SDE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02327', N'BIO020704EN9', N'BIOFILM SA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02328', N'MUJS5607256Z7', N'SANTIAGO ARTURO MUNTANE JUAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02329', N'CAC111004K37', N'CORPORACION ALIMENTARIA DEL CAMPO SPR DE  RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02330', N'CTL110613NA7', N'CARIBBEAN TRAFFIC AND LOGISTICS GTM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02331', N'SMA111202NQ4', N'SHEKHINA MANAGEMENT SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02332', N'GOJJ840410BH4', N'JOSAFAT URIEL GONZALEZ JIMENEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02333', N'GHA081105E60', N'GRANOS LA HACIENDA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02334', N'ZUDM7310149C6', N'MONICA ZUÑIGA DELGADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02335', N'ASS040209GR3', N'ALMACENES Y SERVICIOS SANTA ROSA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02336', N'ZABB7301034N8', N'BLANCA MARISELA ZAVALA BALDERRAMA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02337', N'AGR930810QR1', N'AGROZUCAR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02338', N'IIM060908H33', N'IMM INOX MARKET MESSICO S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02339', N'OUSA671201GF4', N'ANTONIO OSUNA SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02340', N'ICA101207FQ5', N'INTERCOMERCIAL CASRAM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02341', N'RIT131007F61', N'RITEGO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02342', N'FLM110413EGA', N'FMS LOGISTICS MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02343', N'KZU070515T6A', N'KIRLAND ZURICH SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02344', N'FMA0201311S6', N'FRIGORIFICOS MARION´S SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02345', N'ILC830716TX2', N'INGENIO LAZARO CARDENAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02346', N'CFI100222IS1', N'CAROLINA FOOD  INGREDIENTS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02347', N'GALR691011P83', N'RAQUEL GARCIA LUNA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02348', N'MTR081006MK6', N'MTI TRANSPORT SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02349', N'CAF120918N24', N'COMERCIALIZADORA ALMACENADORA Y FLETERA REGION EL LLANO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02350', N'ARS9911295R3', N'AGRICULTORES DEL RANCHO SAN ISIDRO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02352', N'JFM980721IG5', N'JAS FORWARDING DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02353', N'', N'FIDEICOMISO PARA EL DESARROLLO RURAL DEL ESTADO DE JALISCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02354', N'APG801227AL6', N'ALIMENTOS Y PRODUCTOS PARA GANADO LECHERO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02355', N'IRP670120QG3', N'INDUSTRIAS DE REFRIGERACION PLAFER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02356', N'UAS090302C42', N'UNION DE AGRICULTORES DE SAN CARLOS SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02357', N'AIH740213JA7', N'AGRICOLA INDUSTRIAL DE HUATABAMPO S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02358', N'STE1401293H6', N'STEELCOILS.COM  SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02359', N'IME1212139P2', N'IMALDI DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02360', N'CME0412063GA', N'4E DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02361', N'AMM130607421', N'AMM AGROCOMERCIAL S DE RL MI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02362', N'GST970206G13', N'GRUPO STONCOR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02363', N'PNS061024IS0', N'PRODUCTOS DEL NORTE LA SANTA CRUZ S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02364', N'COM1303118Y2', N'COMERCIAGRO SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02365', N'LCI1206292E2', N'LWGN COMERCIO INTERNACIONAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02366', N'SLP1106018PA', N'SOLUCIONES LUMINICAS PLUS SC DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02367', N'DES9701139G9', N'DESCLE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02368', N'QQU790720HR5', N'QUAD GRAPHICS QUERETARO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02369', N'AOVF6212212D0', N'FELIPE ARJONA VARGAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02370', N'TIA0802186F9', N'TECNOLOGIA INNOVADORA AGROINDUSTRIAL DE ZENTLA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02371', N'AMA120821ML6', N'ALAMBRE MAGNETO DE ALUMINIO S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02372', N'OMS080614E41', N'ORDOÑEZ MALDONADO Y SOCIOS SC DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02373', N'CGD0001108E7', N'COMERCIALIZADORA GRANOS DORADOS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02374', N'CUN990618JJ1', N'CARBAJALES UNIDOS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02375', N'CAC080425E75', N'CENTRO DE ACOPIO CERRO PRIETO SC DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02376', N'BNE8303291Y4', N'BODEGAS LA NEGRITA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02377', N'BME060629U14', N'BISAZZA MEXICO S. DE R.L. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02378', N'OEI050516JM5', N'CARTERA ORGANIZACION EMOTION INTERNATIONAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02379', N'DME0602243X6', N'DACHSER DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02381', N'AAN071003BL9', N'EL ARRAYANAL & CO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02382', N'FRA961126F59', N'FRABEL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02383', N'', N'CARTERA AGRICULTORES UNIDOS EL VALLE S.A. de C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02384', N'ACM100226GI8', N'AURA CANAL MODERNO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02385', N'CAG880122CJ4', N'COOPERATIVA DE CONSUMO AGROPECUARIO GOMEZ DE LA GARZA DE VALLE HERMOSO SCL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02386', N'UAR131109B14', N'UNION AGRICOLA REGIONAL DE SINALOA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02387', N'FSO110530AC7', N'FUNDADORES DEL 68 SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02388', N'GMO100909BG2', N'GRUPO MONTEQ DE OCCIDENTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02389', N'GRU9712028T1', N'GRUPO RUZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02390', N'PNM9806248Y6', N'PIRELLI NEUMATICOS DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02391', N'UTR111222G59', N'UNICATI TRADERS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02392', N'SOPE540314193', N'ENRIQUE SOSA PIÑEIRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02393', N'UFO051011SZ2', N'UNION FENOSA  OPERACION MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02394', N'BFO140212PB5', N'BLACK FORESTAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02395', N'AFE060126SW8', N'ALMACENADORA FEVASA SA DE CV')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02396', N'RBM001218EU2', N'EL REFUGIO BM SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02397', N'VFM990901TRA', N'VISTA FOWRARDING DE MEXICO SC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02398', N'CMO021030Q66', N'CORPORATIVO 1818 SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02399', N'OOOI8512029E2', N'JOSE ISRAEL OROZCO OROZCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02400', N'GAGA6709186U6', N'ANA LILIA GALINDO GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02401', N'FASL800924560', N'LUZ PATRICIA FAJARDO SOLIS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02402', N'SISR731128DK6', N'ROSALINA SILVA SALAZAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02403', N'AAPE7110132JA', N'EDUARDO ANDRADE PADILLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02404', N'PDE121031UW1', N'PREMITEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02405', N'GIC120202GL7', N'GRUPO DE INNOVACION COMERCIAL B&S SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02406', N'FME0001126QA', N'FLEXSOURCE DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02407', N'CPI950901F3A', N'INGREDION (NO USAR)')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02408', N'MBS1305243B0', N'MATHEW BRANDS SOLUTIONS S DE RV DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02409', N'SPR8912107G1', N'CANTU NOYOLA S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02410', N'IZE020515IQ7', N'INDUSTRIAL ZEUS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02411', N'', N'GRUPO RADEC SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02412', N'GCO071005242', N'GERDAU CORSA SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02413', N'NEK020517NG7', N'NEKUTLI SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02414', N'FAR820202K29', N'FARIEL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02415', N'CLA991021TP4', N'A C LA LAJA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02416', N'SIN9412025I4', N'SCOTIABANK INVERLAT SA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02417', N'BFM120202Q33', N'BENITO FURNITURE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02418', N'GOJO740919653', N'ORLANDO GONZALEZ JAIMES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02419', N'GSA121012GL5', N'GRANOS Y SEMILLAS ANGEL MIGUEL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02420', N'REA860318BG9', N'REACO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02422', N'ROB991028FB3', N'ROBAMA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02423', N'DVC910102VDA', N'DAIMLER VEHICULOS COMERCIALES MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02424', N'YHE020110JW8', N'YBJ HERRAJES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02425', N'CBO120606KX1', N'CHATEAU BOUTIQUE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02426', N'LIH080709HD0', N'LOGISTICA INTERNACIONAL DE LA HUASTECA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02427', N'GIA101207QG4', N'GRUPO INTERMEDIARIO ACERERO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02428', N'WGI110718C77', N'WINE GLOBAL IMP SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02429', N'SEI100503E92', N'SACOS Y EMPAQUES INTERNACIONALES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02430', N'', N'TALICO SA DE CV (CANCELADO) NO USAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02431', N'TAL940124CE5', N'TALICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02432', N'ATE150206SB0', N'ARTICULOS TEXTILES EQUIPO Y ACCESORIOS MV SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02433', N'CME991013DD5', N'COMERCIALIZADORA MEDEL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02434', N'GCA1306121I8', N'GRANERO EL CASTILLO SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02435', N'ZLO020530SV0', N'ZAT LOGISTICS  SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02436', N'MME060222ID2', N'MEDLINE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02437', N'DCG111006AEA', N'DURANGO´S COMERCIALIZADORA DE GRANOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02438', N'NCM1307119Q2', N'NU CORPORACION MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02439', N'SBL100211P91', N'SOUTHERN BORDER LOGISTICS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02440', N'FNE060504S83', N'FARMA NET SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02441', N'PRB030814TN1', N'PRODUCTORES DE RIO BRAVO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02442', N'CNC701230PD0', N'CONSEJO NACIONAL DE CIENCIA Y TECNOLOGIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02443', N'FGL101112ETA', N'FIRST LOGISTICS GROUP SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02444', N'TME091005DA4', N'TREDCO DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02445', N'DAA9005286EA', N'DESPACHOS ADUANALES ALCANTARA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02446', N'AGR121217TN6', N'AGROFORTALEZA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02447', N'PCO010222Q71', N'PRODUCTORES CONTRERAS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02448', N'AGS980318LD8', N'AGUSTIN GARCIA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02449', N'ASU070910J57', N'AGRICOLA EL SURCO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02450', N'MECC890408AC8', N'CARLOS ADRIAN MEDEROS CUEVAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02451', N'GAN980627K81', N'GRAMILPA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02452', N'PSF9406031K8', N'PRODUCTORES DE SAN FERNANDO S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02453', N'GBL0505114Q6', N'GRANEROS BAÑUELOS LUNA USPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02454', N'ARS010312V67', N'AGROFINANZAS RIO SINALOA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02455', N'AEE120210KU8', N'ABASTECEDORA DE EQUIPOS Y ELECTRONICOS GCS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02456', N'CVC9802281Z4', N'COMERCIAL LOS VOLCANES DE COLIMA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02457', N'ISA010831GB4', N'IMPULSORA DE SERVICIOS Y AZUCAR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02458', N'ASM020712PX7', N'AZUCARES SELECTOS DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02459', N'FST041027414', N'FERTILIZANTES Y SEMILLAS DE  LA TARAHUMARA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02460', N'RJA130529I25', N'RANCHO LOS JABINES S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02461', N'CSN120113IHA', N'COMERCIALIZADORA DE SEMILLAS DEL NOROESTE SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02462', N'CIN560220AM3', N'COPAMEX INDUSTRIAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02463', N'CANE550712BN3', N'EFRAIN CANTU NOYOLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02464', N'CACX491002GW5', N'ANTONIO ENRIQUE CANCINO CHAVEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02465', N'PGU080422TG0', N'PRODUCTORES LA GUACAMAYA SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02466', N'AFR010221P16', N'AGRICOLA FRAGA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02467', N'GAD120303CLA', N'GRANOS LA ADELITA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02468', N'GUQM541223LI6', N'MARIA GUZMAN QUEZADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02469', N'ALP020314GS7', N'AVANCES LUMINICOS PLUS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02470', N'LOQJ8505206W2', N'JUAN IGNACIO LOZANO QUIROZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02471', N'AUMC931213JW5', N'CESAR FRANCISCO ANGULO MORALES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02472', N'AAR130211CW8', N'AGRICOLA ARBELES SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02473', N'AIS091024FN2', N'AGRICOLA ISMAMAJO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02474', N'ATE080825QF7', N'AGRICOLA LOS TESOS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02475', N'GOIH800621II1', N'HERIBERTO GOMEZ INZUNZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02476', N'FEBM690527GG1', N'MARLEN FELIX BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02477', N'CME0507233A4', N'SOCIEDAD COOPERATIVA DE PRODUCCION Y SERVICIOS CABRA MEJORADA SC DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02478', N'TYS9905272G7', N'TIERRA YAQUI SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02479', N'SLA140219PC8', N'STARS LOGISTICA Y ALMACENAMIENTO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02480', N'FXM880830PH7', N'FX MORALES Y ASOCIADOS SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02481', N'HSO090708466', N'HK SOURCING SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02482', N'ANA9510267C4', N'AKZO NOBEL AUTOMOTIVE AND AEROSPACE COATINGS MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02483', N'AGR090811614', N'AGROSIEMBRA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02484', N'AEX051025JS0', N'ATLAS EXPEDITORS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02485', N'AVH970115NG5', N'LOS ALDAMA DE VALLE HERMOSO S.P.R. DE R.I.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02486', N'GCO080822L73', N'GONBAR CONSTRUCTORA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02487', N'TTS120327N22', N'TECNO TRACKING SYSTEM DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02488', N'CFM970129RG7', N'CEVA FREIGHT MANAGEMENT MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02489', N'PDC841108J2A', N'PROMOCION Y DISTRIBUCION CINCO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02490', N'GRU0412062DA', N'GRANEROS EL RUBI SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02491', N'ETL120702TR9', N'ENGORDA TECNIFICADA DE LA LAGUNA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02492', N'ICC000705L20', N'IMPULSORA COMERCIAL CAVI SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02493', N'CAVE820427R18', N'ENRIQUE ALBERTO CANCINO VIDAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02494', N'VGS1108222X8', N'VIVER GRANOS Y SEMILLAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02495', N'CTU060612GP1', N'COMERCIALIZADORA EL TURULO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02496', N'AGR030219425', N'BANKAOOL SA INSTITUCION DE BANCA MULTIPLE')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02497', N'VLM021018TX6', N'VINOS Y LICORES MUNDIALES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02498', N'CRZ080422 SD6', N'COMERCIAL ROSAS ZUÑIGA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02499', N'GBR930102L25', N'GRANEROS EL BRASIL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02500', N'CIA0204137M0', N'CARTERA COMERCIALIZADORA INTERNACIONAL ARIZONA SA DE CV. (CINTAR)')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02501', N'ACB1309132G5', N'AGRICOLA COMPA BOCHO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02502', N'AGU131011V35', N'AGRICOLA GUABA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02503', N'AUT120911J42', N'AGRICULTORES UNIDOS DE LAS TORTUGAS DEL REFUGIO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02504', N'CCA0907137E8', N'CULTIVOS Y COMERCIALIZACIONES AGRICOLAS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02505', N'CAAE801028IF6', N'EDUARDO CASTRO ALVAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02506', N'CACE50102575A', N'EDUARDO CASTRO CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02507', N'BAHG9312038I8', N'GERARDO EFRAIN BAJO HUICHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02508', N'OACI7511289G5', N'ILEN ORRANTA CANTU')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02509', N'AEMJ620603NB7', N'JESUS RAMON ARMENTA MEZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02510', N'TMO080626S59', N'LOS TRES MOREÑOS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02511', N'CALJ4602026UA', N'MARIA DE JESUS CANTU LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02512', N'SECM780120FK8', N'MARTHA DENICE SEPULVEDA CARDENAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02513', N'NIVM510526CM3', N'MINERVA NIEBLAS VERDUZCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02514', N'OOER630905FZ3', N'ROBERTO OROZCO ESPINOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02515', N'GARC690316782', N'CRISTINO GALVAN RUIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02516', N'GARL7408115V1', N'LUIS GALVAN RUIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02517', N'OEVA550807S73', N'MARIA DE LOS ANGELES ORTEGA VILLAGOMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02518', N'RURL3901174Y7', N'MARIA DEL ROSARIO RUIZ LEON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02519', N'AQU100503SM7', N'AGRICOLA EL QUETZZAL SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02520', N'ATJ1309264HA', N'AGRICOLA LOS 3 JORGES SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02521', N'AGO090209318', N'AGRICOLA Y GANADERA ORNELAS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02522', N'VEMF47021428A', N'FERMIN EUSEBIO VERDUGO MEZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02523', N'HGB0409223M5', N'HELEODORO GARCIA BUENO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02524', N'CADM730325J56', N'MARIANA CASTRO DIEGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02525', N'LUG080712MM0', N'SOCIEDAD LUGO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02526', N'IPH140130GE7', N'INTERNATIONAL PAPER MEXICO COMPANY S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02527', N'EEL111207AD0', N'ENGORDAS ESTABULADAS LA REFORMA SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02528', N'SFN050308RT5', N'SEA FOOD NAYAMEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02529', N'HME1205084I8', N'HIDROFERTIL DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02530', N'CSU130216UH8', N'CREO EN EL SUR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02531', N'CII1403263C4', N'CENTRO DE INNOVACIONES EN IMAGEN Y ESTILOS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02532', N'ADS100226AK7', N'AIR DEPOT DEL SURESTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02533', N'SPI880324T24', N'SERVICIOS PROFESIONALES DE IMPRESION SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02534', N'GEM031104FC8', N'GAMAC ELECTRONICS DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02535', N'OME1210152X4', N'OBALON MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02536', N'EBR130220189', N'EBRANDS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02537', N'RPY1209188IA', N'RIELES PROYECTO Y OBRA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02538', N'PME990927GR5', N'PRODUCTORES DE MENDEZ S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02539', N'DME080125E64', N'DUNE COMPANY MEXICALI S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02540', N'SAN110513AU6', N'SANYUMA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02541', N'HBA850723TH4', N'HARINERA BARQUIN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02542', N'TRA670207Q71', N'TRANE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02543', N'DASH780106UN4', N'HECTOR FLAVIO DAVALOS SALCEDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02544', N'CEC060710NX2', N'COMERCIALIZADORA EMPRESARIAL DE CUAUHTEMOC S. A DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02545', N'OIS121031MHA', N'OCEANUS INDUSTRIAL SERVICES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02546', N'GRU100521QA7', N'GRUPO RUBISA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02547', N'BST0607272N7', N'BLACK STORM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02548', N'DCO9305206Y2', N'DEAL COMMODITIES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02549', N'FRI0501067Q4', N'FRIZAJAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02550', N'EFJ911126FM3', N'FRIGORIFICO SANTANDER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02551', N'PDE100329B73', N'PISOS DE LUXE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02552', N'ANX040819PY0', N'AGROFINANCIERA DEL NOROESTE SA DE CV SOFOM ENR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02553', N'ACH130902E48', N'AGRICOLA 4 HIJOS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02554', N'ADC111128RT9', N'AGRICOLA DON CANDIDO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02555', N'GLG120924CX3', N'GRANOS Y LACTEOS DEL GATAL SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02556', N'HEEJ6109266XA', N'JOEL ALBERTO HERNANDEZ ESCARREGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02557', N'SLJ060922TG4', N'SERVICIOS LOGISTICOS JIMOX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02558', N'FAM120402B40', N'FLG AGRONEGOCIOS MEXICO SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02559', N'BNO100208D37', N'BOCELI DEL NORTE S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02560', N'OEVE6012112EA', N'ELIAS ORTEGA VILLAGOMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02561', N'VAMM850601K94', N'MARISOL VALDEZ MIRANDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02562', N'IFI120824DM8', N'IPC FINANCIERA SA DE CV SOFOM ENR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02563', N'IVL1309123PA', N'IMPORTACIONES VITIVINICOLAS DE LA FRONTERA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02564', N'NPS961002GW4', N'NAVARRO PRODUCTORES SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02565', N'FRE130404AW9', N'FRESHJAL S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02566', N'TBC140214K48', N'TUURI BACHIAM COMERCIALIZADORA DE GRANOS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02567', N'MME960821JHA', N'MOLINERA DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02568', N'WDM990126350', N'WALDOS DOLAR MART DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02569', N'PPA960517LZ1', N'PESCADERIA EL PACIFICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02570', N'DTM950801LA9', N'DALTILE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02571', N'BCU100118S3A', N'BT CUORIER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02572', N'MOOA660630EF2', N'ARTURO MOLINA ORTIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02573', N'SAL100305JH0', N'SERVICIOS DE APOYO LOGISTICO A PRODUCTOS DEL CAMPO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02574', N'NME100108ND6', N'NOREVO MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02575', N'ALB1003082ZA', N'ALBAGRO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02576', N'NAAC900809NT3', N'CAROLINA NAVARRO AGUIRRE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02577', N'CAJ001206620', N'CAJOMA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02578', N'JRM130108IN0', N'JOSEPH ROBERTS COMPANY DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02579', N'CNM070921QP4', N'CENTRAL NATIONAL DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02580', N'LDC030528BB8', N'LOGISTIC DYNAMICS CORPORATION SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02581', N'GPR060310M34', N'GM PRODUCTORES RURALES SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02582', N'DME890601C39', N'DRESSER DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02583', N'AAL060225E2A', N'AGROINSUMOS DE LOS ALTOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02584', N'GVO070911Q50', N'GRUPO VI OS COMERCIAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02585', N'GLA080901FE0', N'GRAIN LAND SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02586', N'FOAJ661227550', N'JUAN FLORES ALDANA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02587', N'AALS680217BH0', N'SERGIO ALBERTO AMADOR LOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02588', N'', N'CARTERA COMERCIALIZADORA DE PRODUCTOS Y SERVICIOS DEL CAMPO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02589', N'FRU021226V91', N'FINANCIERA NACIONAL DE DESARROLLO AGROPECUARIO RURAL FORESTAL Y PESQUERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02590', N'PAV0105295C7', N'PRODUCTOS AVIPECUARIOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02591', N'OELD810427L16', N'DAVID OLVERA LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02592', N'INT000315DY6', N'INTERDELI SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02593', N'CMI9402168Y3', N'COMERCIALIZADORA MILENIO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02594', N'CIR861029BX9', N'CENTRO INTEGRAL DE REHABILITACION INFANTIL AC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02595', N'IEB131108UNA', N'IMPORTACIONES Y EXPORTACIONES BOVARY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02596', N'QPA1311066H7', N'Q PAGOS SAPI DE CV')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02597', N'CAY120110ID9', N'LA CIENEGA DE AYOTLAN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02598', N'ALA120309NC7', N'ALAZAN DE LAGOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02600', N'TME901211883', N'TEKA MEXICANA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02601', N'SCM940225J71', N'ROCKTENN MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02603', N'BME031101LW1', N'BOHN DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02604', N'CEM140805P88', N'CHINT ENERGY MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02605', N'OAR101011VD2', N'OPERADORA AGRO REGIONAL DEL CENTRO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02606', N'APO971110610', N'GRAPHIC PACKAGING INTERNATIONAL OPERADORA DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02607', N'EEX020516KU2', N'ENERTEC EXPORTS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02608', N'MOT0603039H4', N'MOTOTRANSP SA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02609', N'PASL890822UW8', N'LUIS YOVANNI PLASCENCIA SANDOVAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02610', N'CCR8507162T1', N'CASA CRISTO REY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02611', N'BGD090807KS3', N'BODEGAS GRANELERAS DE CERRO BLANCO SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02612', N'FGO040406U80', N'FERTILIZANTES GOMEZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02613', N'CUCA891214K59', N'ARTURO CRUZ CORNELIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02614', N'DAB071114522', N'DISTRIBUIDORA AGRICOLA DEL BAJIO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02615', N'IPC1302134G1', N'IMPORTER OF PREMIUM CIGARETTES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02616', N'CFA1009024X4', N'CORPORATIVO PARA EL FOMENTO AGROINDUSTRIAL  SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02618', N'MNO131029GB4', N'MIRPAC NORTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02619', N'COP120119AP6', N'COPROIMPORTS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02620', N'SLI121017C60', N'SHARE LIFE S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02621', N'CVT1203271DA', N'COMERCIALIZADORA VAZQUEZ TRUJILLO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02623', N'', N'CARTERA CORPORATIVO PARA EL FOMENTO AGROINDUSTRIAL SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02624', N'GSL071110UQ7', N'GRANOS Y SEMILLAS LOPEZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02625', N'CCA140306GSA', N'CONSEJO COORDINADOR AGROALIMENTARIO S. DE P.R. DE R.L.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02627', N'GAGR470711989', N'RUBEN GARZA GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02628', N'DPR731106Q6A', N'DESARROLLO DE PRODUCTOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02629', N'CCA140306GSA', N'CONSEJO COORDINADOR AGROALIMENTARIO S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02630', N'GCO141015PA6', N'GPKNOW CONCEPT SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02631', N'TRA980630V26', N'TRANSBEAR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02632', N'AVI0612221C9', N'ALGODONERA LAS VIRGINIAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02633', N'TIL020508NA3', N'TCI INTERNACIONAL  LOGISTICS DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02634', N'ARA981112GB4', N'AGROINDUSTRIAS RAFER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02635', N'MCF120330BY0', N'MRP CKD FI S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02636', N'SBS900927MD2', N'SAN BERNARDINO S.P.R DE R.L.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02637', N'CPM981105QK0', N'COMERCIALIZADORA DE PRODUCTOS DEL MAR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02638', N'IMA081104MCA', N'IMPULSORA MERCANTIL AGROPECUARIA COLI SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02639', N'IGR0309256P0', N'ITALIAN GROUP SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02640', N'IGR0309256P0', N'ITALIAN GROUP SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02641', N'HCA000314IC0', N'HENKEL CAPITAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02642', N'CAU040227US9', N'CAMPOS AGRICOLAS UNIDOS POR LA COLONIA BUENA VISTA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02643', N'GSF110415444', N'GRUPO SAN FRANCISCO PRODESEM SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02644', N'AST110427RA5', N'ASOCIACION DE SORGUEROS TEHUACAN TIERRA DE DIOSES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02645', N'MEVE640816M96', N'ESTHER LETICIA MENDOZA VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02646', N'WPR030919ND4', N'WEBER STEPHEN PRODUCTS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02647', N'', N'JUAN MANUEL SANCHEZ MENDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02648', N'LGE000711V54', N'LARVAS GENESIS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02649', N'XEXX010101000', N'PHIHONG USA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02650', N'LUCD591028DH9', N'CARTERA JOSE DOLORES LUEVANO CHAVEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02651', N'VIC0704031E3', N'VICUGA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02652', N'PAS050624BQ4', N'PASSA ADMINISTRACION Y SERVICIOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02653', N'HMM120530FC1', N'HAMILTON METALS MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02654', N'XEXX010101000', N'GENERAL BEARING CORPORATION')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02655', N'GOG1406045X3', N'GRUPO OBREGON GARZA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02656', N'IAR131219P4A', N'INTEGRADORA ARCA SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02657', N'SNO990823NH3', N'STAR DEL NORTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02658', N'KADH850308S20', N'HEINRICH KAUENHOFEN DOERKSEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02659', N'IME0906162P2', N'INFOMMODITY DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02660', N'BNG910218DY3', N'BODEGAS LA NEGRITA DE GUADALAJARA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02661', N'CDI141029577', N'COMERCIALIZADORA Y DISTRIBUIDORA INTERMAX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02662', N'MACR881125527', N'RUTH FABIOLA MAGALLON CARDENAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02663', N'DAG140120GI8', N'DAGRANO AGROPECUARIA S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02664', N'ROMR590301DV2', N'RAUL ROJAS MACHORRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02665', N'KADA780930LGA', N'ABRAM KAUENHOFEN DOERKSEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02667', N'MAON760209AJ6', N'NORBERTO MARTINEZ OLOARTE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02668', N'GAGA840129DB4', N'ALEJANDRA GARCIA GUZMAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02669', N'MAOE780110PP0', N'ESPIRIDION MARTINEZ OLOARTE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02670', N'YCM041008NE9', N'YBARRA COMERCIAL DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02671', N'BNN011112JQ2', N'BODEGAS LA NEGRITA DEL NORTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02673', N'VAGH540911SF5', N'MARIA HERMELINDA VARGAS GOMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02674', N'CMA070207HY4', N'COMERCIALIZADORA MAPAMUNDI S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02675', N'AAV8705296P4', N'AGROPECUARIA EL AVION S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02676', N'PIL080909GK9', N'PILPOT SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02677', N'PAC040303UY6', N'PLESA ANAHUAC Y CIAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02678', N'SON940303PY3', N'SONHOFRUT SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02679', N'JINA720921L59', N'JOSE ARMANDO JIMENEZ NAVARRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02680', N'ORO040505KH3', N'OROFRUT SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02681', N'SMN991019N37', N'SIT MANUFACTURING NA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02682', N'BRM940216EQ6', N'BANCO REGIONAL DE MONTERREY SA INSTITUCION DE BANCA MULTIPLE  BANREGIO GRUPO FINANCIERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02683', N'FOUH740227233', N'HILDA VERONICA FLORES URISTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02684', N'GBA110627TM3', N'EL GRANERO DE BAJE DE AGUA SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02685', N'LAC040819TN1', N'LLAOS ACUACULTURA SA DE CV(NO USAR)')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02686', N'GUPA830719UZA', N'ARTURO GUILLEN PADILLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02687', N'CSZ0108079W4', N'CEREALES Y SEMILLAS ZEPEDA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02688', N'COCO820520AC3', N'OMAR ANTONIO CONTRERAS CHAGOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02689', N'DEL140117R95', N'MINSA COMERCIAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02690', N'LGE8610247A0', N'LAMPARAS GENERAL ELECTRIC S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02691', N'ROAG520327668', N'JOSE GUADALUPE ROMERO AYALA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02692', N'RABY8001037I9', N'YESSICA YUDITH RAMIREZ BUSTILLOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02693', N'SLE120514NG9', N'SOLUCIONES LOGISTICAS E&A S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02694', N'CAR990108CF4', N'COMERCIALIZADORA ARTHUR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02695', N'EDE0606094Z8', N'EVOLUCION Y DINAMICA EMPRESARIAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02696', N'DGR130913L21', N'EL DORADO GRAINS SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02697', N'SIE980316JJ9', N'LA SIERRITA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02698', N'HEPA8309246WA', N'ALEJANDRO HERNANDEZ PADILLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02699', N'BTS090213BU1', N'BUSINESS TRADING SERVICES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02700', N'BBA830831LJ2', N'BBVA MEXICO SA INSTITUCION DE BANCA MULTIPLE GRUPO FINANCIERO BBVA MEXICO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02701', N'ABM110517G32', N'ALGODONERA BAJA MEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02702', N'MCA011123RQ8', N'MOVING CARGO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02703', N'IGS100223JN0', N'INSUMOS GRANOS Y SERVICIOS MAVIPA SA DE CV')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02704', N'EEM121204RT5', N'ENELEX ENERGIA DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02705', N'RFO121204NJ9', N'R7 FORWARDING SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02706', N'MUL891229AB5', N'MULTICERAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02707', N'TPR061106F38', N'TOQUE A PROMOCION SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02708', N'ICK1102185E6', N'INTEGRADORA COMERCIAL KISHMAR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02709', N'AGR140115172', N'AGROAGIL SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02710', N'AEAM681104JB4', N'MONICA ARCELIA ARELLANO ANGUIANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02711', N'CGS110125AQ4', N'CORRALES GUERRERO SANTA ROSA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02712', N'DCM9003091F9', N'DISTRIBUIDORA COMERCIAL DEL MAYO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02713', N'CSA060825ID4', N'CINSA Y SANTA ANITA EN CASA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02714', N'COM070419D15', N'COMEFOR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02716', N'PSE0103146Q4', N'PRODUCTORES SANTA ELENA S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02717', N'MME980403TK3', N'MERC MEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02718', N'APS110526618', N'AGP PROMA STEAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02719', N'NIN110802PJ1', N'NOVASEM INNOVACIONES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02720', N'TAE081022JS3', N'TMI & EXPORT SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02721', N'ARM841226DD2', N'ARMASEL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02722', N'APE050803DL2', N'AGROEXPORTADORA PETATLAN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02723', N'MAL120305I57', N'MALOBA S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02724', N'GAS090625G73', N'GRUPO AGROPRODUCTOR SAN ISIDRO S')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02725', N'LAM951127KF6', N'LUBRICANTES DE AMERICA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02726', N'PIM901016747', N'POLLO INDUSTRIALIZADO DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02727', N'HAGJ800319JL9', N'JACOBO HARDER GIESBRECHT')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02728', N'SAN120925866', N'LA SIBERIA DE ANAHUAC SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02729', N'RGR130521NM0', N'RECIGREEN S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02730', N'VEVA6206064E4', N'ALBERTO VELAZQUEZ VEGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02731', N'NMG0911305C0', N'NH MERCADO GLOBAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02732', N'ALF130503UU9', N'ALFIVA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02733', N'GDE141020E51', N'GRANEROS DELTA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02734', N'VSF9905044KA', N'EL VALLE DE SAN FERNANDO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02735', N'SPR030604QMA', N'SAN PEDRO DE ROMA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02736', N'HBA850723TH4', N'MAXIMASA DEL CENTRO SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02737', N'CPA091019QS6', N'COMERCIALIZADORA Y PROCESADORA DE ALIMENTOS TECH SUGAR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02738', N'GIA1203311QA', N'GRANOS E INSUMOS AGRICOLAS SAN MARTIN SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02739', N'RSE010507418', N'RANCHO SANTA EMILIA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02740', N'CMD030417JA0', N'DE LOS CAMPOS MENONITAS DISTRIBUIDORA S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02741', N'RORS510322HN4', N'SALVADOR RODRIGUEZ RAMIEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02742', N'EGO910528HX9', N'EXPORTADORA DE GRANOS Y OLEAGINOSAS DEL SURESTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02743', N'IAA110504580', N'INTERSISTEMAS ADUANALES DE ALTAMIRA SC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02744', N'MORM810128656', N'MARIANELY MORALES REYES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02745', N'OUVD900127SD2', N'DANIEL ABRAHAM OSUNA VALVERDE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02746', N'IIN080731LL9', N'INTERMEDIARIA INTERMEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02747', N'RAMA640815UX9', N'ANGELICA MARIA RAMOS MENDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02748', N'TEM991022KY6', N'TECHNICOLOR EXPORT DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02749', N'OIMB6301079P5', N'BERNARDO ORIHUELA MARIN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02750', N'KMO1501087I7', N'KUMI MOTORS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02751', N'AFA130913L1A', N'AGRICOLA FAYSER SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02752', N'CATJ330225738', N'JOSEFINA CASTILLO TRUJILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02753', N'CACL5309203U3', N'LAURA CARMONA CASTILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02754', N'ASC0001211Z9', N'ACUICOLA SAN CARLOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02755', N'VEAV930803PR7', N'VALERIA ALEJANDRA VELAZQUEZ ALMERAZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02756', N'ADJ150406TG2', N'AGROALIMENTARIA 16 DE JULIO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02757', N'AIP110715E54', N'AECISA INNOVACION PROMOCIONAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02758', N'LEBM5812303Y8', N'MIGUEL ANGEL LEAL BERNAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02759', N'ARS1211122N7', N'SOCIEDAD AGRICOLA REGIONAL SIERRA DE AMULA SC DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02760', N'PTE030829JQ4', N'PROMOTORA Y TRANSFORMADORA DE ENERGIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02761', N'AUM021218QT0', N'AGRICULTORES UNIDOS DE MEXICALI SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02762', N'MFE3410277SA', N'MOLINOS DEL FENIX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02763', N'AIR130902MN1', N'AIRPAC SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02764', N'PETE810629A5A', N'ERICK ALEJANDRO PEREZ TENORIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02765', N'URM150421IR6', N'US RING MEXICANA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02766', N'GAPE851208S83', N'ERICK GARCIA PINEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02767', N'DPV070523PY8', N'DISTRIBUIDORA PRODUCTOS VAPER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02768', N'GSD150429G17', N'GDL SMART DEVELOPMENT SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02769', N'UCO130304RU4', N'UMAR COMERCIALIZADORA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02770', N'APC100416K63', N'AGRICOLA EL PURO CAMPO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02771', N'ATI140730GD4', N'AGRICOLA EL TINO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02772', N'AHD0908275N7', N'AGRICOLA HERMANOS DIAZ SIERRA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02773', N'DPM140219111', N'DIRECT PACK DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02774', N'LEB1406251TA', N'LOGISTICA EMPRESARIAL BOB SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02775', N'VPA0605307U3', N'VACA PANDA SC COOPERATIVA DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02776', N'GAAL780705QI3', N'LUIS JAVIER GAMA ALAPIZCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02777', N'GOCA740105TR5', N'ARMANDO GONZALEZ CONTRERAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02778', N'GUGR420117BD2', N'RAFAEL GUTIERREZ GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02779', N'TRA1502192Y3', N'TRADESAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02780', N'GAHE6503013R0', N'JOSE EZEQUIEL GARCIA HURTADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02781', N'CVI120525LP7', N'COMERCIALIZADORA VIVRI S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02783', N'OISC7611306N5', N'CARLOS AARON OLIVAS SALAZAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02784', N'GEG850101FQ2', N'GOBIERNO DEL ESTADO DE GUANAJUATO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02785', N'ARO070516IL5', N'AMERICAN ROLLER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02786', N'WNI050817RX1', N'WINCOR NIXDORF SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02787', N'GCS960325TG3', N'GANADERA CONTRERAS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02788', N'AAM961204CI1', N'ASSA ABLOY MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02789', N'DLM120302SF9', N'DISTRIBUIDORA LATINOAMERICANA DEL MAR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02790', N'HSA130531AL7', N'HF SARBANAND S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02791', N'AEI100503UI7', N'ALIMENTOS E INSUMOS MABER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02792', N'JSR980303GM9', N'LA JARITA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02793', N'SME9609103A2', N'CAMSO DISTRIBUCION MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02794', N'CAVI880602IG6', N'ISMAEL CARBAJAL VAZQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02795', N'ECU001206PV0', N'EASTMAN CHEMICAL URUAPAN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02796', N'FDF020508916', N'FARM DIRECT FOODS LATIN AMERICA S.A DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02797', N'BME8102246Y9', N'BRENNTAG MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02798', N'OL&031218NL9', N'BLU CARGO & LOGISTICS SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02799', N'MCE101125IC8', N'MJM COMERCIAL DE EMPAQUES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02800', N'GCO820106RI5', N'GRUPO COLLADO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02801', N'OIM7212211C4', N'OFFSET IMPRENTA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02802', N'CRI080508PM3', N'COMERCIALIZADORA RIAZUL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02803', N'MIX02121254A', N'MAICEROS DE IXTLAHUACAN SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02804', N'CCB1312058Q6', N'CERVECERIA CBADA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02805', N'RZA100512NI4', N'EL RETOÑO DE ZAPOTLANEJO S DE PR DE RL')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02806', N'PRI9701294W3', N'PRINCER S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02807', N'SALC760731NC9', N'CARLOS ALBERTO SANCHEZ LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02808', N'TSF141020FC4', N'TSF TECHNICAL SYSTEMS FOR FASTENERS S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02809', N'RPA9409274P2', N'RANCHO LAS PALMERAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02810', N'GSP120824MU6', N'GRANOS Y SEMILLAS PEÑA BLANCA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02811', N'CSE121219F58', N'CEMOC SERVICIOS ESPECIALIZADOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02812', N'GCO071023KF2', N'GRUPO CORIAT SC DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02813', N'', N'CARTERA ALINSUMOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02814', N'CCM091023191', N'COMERCIALIZADORA CORALES DEL MAR CARIBE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02815', N'GOQH720912BG2', N'HEIDY MARIA GONZALEZ QUIJANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02816', N'MPR1503276I4', N'MACMA PROMOCIONALES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02817', N'GLM0401284M5', N'GRUPO LOGISTICO MEXICANO DEL NORESTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02818', N'SEG900807CQ7', N'SUPER EXPRESS GONZALEZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02819', N'PMO011001455', N'PRODUCTORA MOR S DE RL MI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02820', N'FPS800522DA3', N'FABRICA DE PAPEL SAN FRANCISCO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02821', N'FERP780125J39', N'PABLO FELICIANO RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02822', N'CTM990607US8', N'APEX TOOL GROUP MANUFACTURING MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02823', N'SPC130227L99', N'SECRETARIA DE PLANEACION ADMINISTRACION Y FINANZAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02824', N'LOR830502NB5', N'LITOGRAFIA D ORTEGA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02825', N'ASO1207235P5', N'A&P SOLUTIONS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02826', N'ARG7908072W1', N'AGROPECUARIA RANCHO GRANDE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02827', N'AUP140310C4A', N'ALGODONERA UNION DEL PROGRESO SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02828', N'CQU870710BR0', N'CONSTRULITA LIGHTING INTERNATIONAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02829', N'RAM150619IC2', N'RD ABBOTT S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02830', N'SMG121101UL0', N'SUMINISTROS Y MECANICA GRAFICA S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02831', N'PCO920610CP7', N'SU POLLO COMERCIAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02832', N'FME140703HG0', N'FREECON MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02833', N'GCA1306121I8', N'CARTERA GRANERO EL CASTILLO SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02834', N'FER070322648', N'CARTERA FERTINOVA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02835', N'SCM090630MN3', N'SUPPLY CHAIN MANAGEMENT INDUSTRIAL S. DE R.L. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02836', N'PCP130429NU0', N'PRODUCTOS COMESTIBLES PROCESADOS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02837', N'XEXX010101000', N'NP YOUNG LLC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02838', N'ACO150127PM1', N'ARTKIDS COMERCIAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02839', N'UCM000504D91', N'UNIFORM COLOR DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02840', N'PNO0108017E3', N'PROCESADORA LA NOGALERA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02841', N'SOTA590731IL5', N'ALEJANDRO JESUS SORIANO TELLEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02842', N'OUFC770308CL3', N'CLAUDIO DAMIAN OLGUIN FLORES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02843', N'PMO870302MJ8', N'PRODUCTORA DE MONITOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02844', N'SSM9211259G6', N'SERVILAMINA SUMMIT MEXICANA S.A DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02845', N'CGM100309IL8', N'CROWN GAMING MEXICO S. A. DE C.V .')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02846', N'PAMO770727E59', N'OLIVER GERARDO PARRA MENDOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02847', N'FWH090619JP0', N'FORNERA WINEHOUSE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02848', N'MEI0209236G0', N'MANUFACTURA Y EQUIPAMIENTO INOXIDABLE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02849', N'SASD910301HN1', N'DENISSE SANCHEZ SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02850', N'', N'GRUPO MACSFALLITA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02851', N'PIQ880209H51', N'PROVEEDOR INTERNACIONAL DE QUIMICOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02852', N'DIS080201I65', N'DISURESA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02853', N'IBL151126B84', N'IMPORTACIONES BLN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02854', N'CJA150603KD5', N'COMERCIAL JARVET SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02855', N'CCA0805064F6', N'CERRO CHAPO SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02856', N'BEEB530411439', N'MARIA BEATRIZ EUGENIA BECERRA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02857', N'DIDF761004FU5', N'FRANCISCO DIEGO DAVALOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02858', N'RHI0812163M4', N'ALMER LOGISTIK SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02859', N'GAJ950118QX1', N'GRUPO AGROPECUARIO JF SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02860', N'CBC090520AW4', N'CONSUMIBLES DE BASICOS DE CORDOBA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02861', N'LOGO641207GJ3', N'OCTAVIO LOPEZ GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02862', N'GFI0306041K7', N'BANCO FINTERRA SOCIEDAD ANONIMA INSTITUCION DE BANCA MULTIPLE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02863', N'SEP091111SL8', N'SERVICIOS DE ENTREGA DE PAQUETERIA SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02864', N'ITM8012013N0', N'IMPULSORA DE TRANSPORTES MEXICANOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02865', N'XEXX010101000', N'GREAT LAKE FASTENERS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02866', N'DPM100121PTA', N'DISEÑO Y PUBLICACIONES MOON SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02867', N'KADJ890811NQ8', N'JOHAN KAUENHOFEN DOERKSEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02868', N'YEUE840310L47', N'EUGENIO MARTIN YEH UC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02869', N'MWC1409024WA', N'MAYAN WATER COMPLEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02870', N'', N'MOLECULAS FINAS DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02871', N'FPP1109232Z8', N'F&F PLASTIC PRODUCTS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02872', N'SUM890327137', N'SUMINISTRO PARA USO MEDICO Y HOSPITALARIO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02873', N'', N'CHUPA CHUPS INDUSTRIAL MEXICANA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02874', N'NAM150610MF3', N'NOBLE AGRI MEXICO S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02875', N'CIA931008QI4', N'COMERCIALIZADORA DE INSUMOS AGRICOLAS RIO BRAVO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02876', N'', N'MANUFACTURAS EN ACCIÓN SC DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02877', N'XEXX010101000', N'WEB PLASTICS COMPANY LLC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02878', N'IV&000707P47', N'INDUSTRIAL V&A SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02879', N'SEE131002EVA', N'SOLUCIONES ECOLOGICAS ELECTRONICAS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02880', N'EPB150420NL4', N'COMPAÑIA EXPORTADORA DE PRODUCTOS BOVINOS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02881', N'CGA010416PY1', N'COMERCIALIZADORA GARPE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02882', N'SOLR650925BN7', N'SOLORZANO LOPEZ RODOLFO MARTIN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02883', N'HCT160112IN5', N'HILO CAFE TEXTIL S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02884', N'NLO130322SG4', N'NG LOGISTICA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02885', N'BEC981128HG7', N'ED&FMAN LIQUID PRODUCTS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02886', N'NWB140708R87', N'NEXUS WORLD BUSINESS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02887', N'VEE110909EI9', N'VISION ECONOMICA Y EMPRESARIAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02888', N'UBR1603178C9', N'UNISON BRANDS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02889', N'BMA041230GF1', N'BQ MACHINING SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02890', N'SNA130409PQ1', N'SG NAYARITA SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02891', N'SCG060906K29', N'SEROLLASA COMERCIALIZADORA DE GRANOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02892', N'GAT800307BC7', N'GRUPO AGROINDUSTRIAL DE TAMAULIPAS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02893', N'MCO960703883', N'DE LA MORA COMUNICACIONES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02894', N'NLA031212L38', N'NAFAR LABORATORIOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02895', N'CGA0702273FA', N'COMERCIALIZADORA DE GRANOS LOS ARBOLITOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02896', N'LIT8310303I3', N'LITOPROCESS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02897', N'AGR080218N71', N'AGROROCA SC DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02898', N'IIA960717QR6', N'INDUSTRIALIZADORA INTEGRAL DEL AGAVE SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02899', N'ARA050622SA0', N'LAS ARACELIS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02900', N'PSM100507SZ4', N'PALMICULTORES DE SAN MARCOS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02901', N'CIRH760826MV4', N'HORACIO ENRIQUE CISNEROS RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02902', N'CIM160229D45', N'CAMPUS ITALIA DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02903', N'SSA0707041X8', N'SERVICIOS Y SUMINISTROS AGRICOLAS LA FAMA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02904', N'AAC150824K5A', N'AO ACACIA S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02905', N'ABR040707TI2', N'ALCE DEL BRAVO SPR DE RL')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02906', N'CRO151016229', N'COMERCIALIZADORA ROJO OSUNA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02907', N'PSU090714QNA', N'PRODUCTOS Y SUBPRODUCTOS  S DE RL  DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02908', N'VTS160204M62', N'VARSOVIA 36 TENANT S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02909', N'PCD130306V49', N'PROCESADORA DE CARNICOS DERIVADOS Y GRANOS DEL CENTRO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02910', N'DCO031014AZ4', N'DISTRIBUIDOR DE CEMENTO DEL OCCIDENTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02911', N'BGR151026RL2', N'BUFALO GRAIN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02912', N'GNP9211244P0', N'GRUPO NACIONAL PROVINCIAL S.A.B.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02913', N'CALJ831103Q38', N'JESUS ALBERTO CHAVEZ LIMAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02914', N'MSU850911A56', N'MOLINOS DEL SUDESTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02915', N'COC801230RY7', N'COMERCIALIZADORA DE OCCIDENTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02916', N'STR150817ED2', N'SELECT TRADE S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02917', N'HPM010504793', N'HIGH POWER DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02918', N'ACE110316GG6', N'AUSTRAL CENTAURI SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02919', N'SABJ720308GG6', N'JAIME FEDERICO SANCHEZ BAJO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02920', N'CALN530310A77', N'NATALIA CANTUA LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02921', N'OURA76031381A', N'AGUSTIN OSUNA RAMOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02922', N'ZARA670410RY9', N'ALMA GRACIELA ZAPIEN ROSAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02924', N'SOTR730424FF8', N'RODOLFO ALEJANDRO SOTO TORRONTEGUI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02925', N'SOTR7909189B0', N'ROSALINDA SOTO TORRONTEGUI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02926', N'TODT470930IB5', N'TERESA GUADALUPE TORRONTEGUI DEPRAECT')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02927', N'GUAB660301CK1', N'BRENDA NEREYDA GUTIERREZ ACOSTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02928', N'MEGY940815JP1', N'YAEL ERUVIEL MENDIVIL GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02929', N'SVA080930Q1A', N'SILOS VANCOUVER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02930', N'DIDP620209TR4', N'PERFECTO DIMAS DIMAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02931', N'IAG880715PV8', N'IMPORAGRI SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02932', N'EOP640608I13', N'HELLA AUTOMOTIVE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02934', N'HEDR820413LB8', N'JOSE REFUGIO HERNANDEZ DIAZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02935', N'GACA9009013Y3', N'ANA LORENA GARCIA CAMPUZANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02936', N'CMU981126TL6', N'CORPORACION MULTIMODAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02937', N'CSA1605114DA', N'CARRERA SALES & ACQUISITIONS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02938', N'XEXX010101000', N'STEVE MADDEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02939', N'NUT060322IW4', N'NUTRITEP SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02940', N'ARM130419781', N'AGROINSUMOS RIO MAYO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02941', N'AEBE690224HT2', N'MARIA EMILIANA AKE BURGOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02942', N'FAC031020DAA', N'FIDEICOMISO DE LA ALIANZA PARA EL CAMPO EN EL ESTADO DE JALISCO (FACEJ)')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02943', N'PPM9102221X2', N'PAT PRIMO MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02944', N'ZEEJ8503129J0', N'JAHZEEL ZEPEDA ECKHAUS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02945', N'CIRJ640928A82', N'JUAN JOSE CISNEROS RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02946', N'COLN7910134Q2', N'NOEL ADALBERTO CONTRERAS LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02947', N'EUAA330814JS2', N'MARIA AMPARO ESQUERRA ACOSTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02950', N'CAGR3402072MA', N'REGINALDO CASTRO GALAVIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02951', N'EARR930426AA8', N'ROGELIO ESTRADA ROSILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02953', N'ROES780206ML7', N'SILVIA GUADALUPE ROSAS ENCINAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02955', N'SAG150616C48', N'EL SOMBRERO AGRICOLA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02956', N'GARB681017NI3', N'BLANCA MARGARITA GASTELUM ROCHIN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02957', N'POAA850310L85', N'ANTONIO POOT AKE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02958', N'CUW0706263E4', N'CG UNIVERSAL WOOD SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02959', N'BSM970519DU8', N'BANCO SANTANDER (MEXICO) SA INSTITUCION DE BANCA MULTIPLE GRUPO FINANCIERO SANTANDER MEXICO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02960', N'PRO660901HM0', N'SUEZ WT&S MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02961', N'BMS840427R96', N'BOMBAS Y MAQUINARIA SUAREZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02962', N'GAAR8307081Z5', N'JOSE RAMON GARCIA AYALA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02963', N'FBA0710265FA', N'FORRAJES BAGO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02964', N'JACE380910RG8', N'MARIA ESTELA JARA CANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02965', N'PDB130402DN3', N'PESCADERIA DE LA BAHIA S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02966', N'ASA050328MF5', N'ANALISIS Y SOLUCIONES AMBIENTALES  S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02967', N'SIO130812KG0', N'SERVICIOS INTEGRALES OJO ZARCO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02968', N'BAT9905247B1', N'BATRA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02969', N'FANA840304JUA', N'ALFREDO FRANCO NAVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02970', N'CGT011109GL6', N'COMERCIALIZADORA DE GRANOS DE TEHUACAN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02971', N'PGA150328KF8', N'PRODUCTOS GARA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02972', N'ANX0509061EA', N'AGROPECUARIA LOS NOPALES SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02973', N'ILI081212PY7', N'ILIOSSON SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02974', N'MAOA861109171', N'AZAEL MARTINEZ ORTEGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02975', N'CECH821119SYA', N'HUMBERTO DAVID CERDA CARRILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02976', N'EUSR830123581', N'RIGOBERTO ESQUER SEPULVEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02977', N'ESO851126P67', N'EDITORA EL SOL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02978', N'EGR100408QV5', N'EUROPEA DE GRUAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02979', N'DJU890724BU0', N'DISTRIBUIDORA JUGUETRON SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02980', N'HAGJ771007L27', N'JOHAN HARDER GIESBRECHT')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02981', N'RAMV880214LH8', N'VICTOR MANUEL RAMIREZ MONTOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02982', N'IES090326U9A', N'INTEGRADORA EJIDAL DEL SUR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02983', N'HESG8202254L4', N'GABRIEL HERNANDEZ SOTELO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02984', N'VAVM8409218N3', N'MANUEL IGNACIO VALTIERRA VILLEGAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02985', N'CAB080121G7A', N'CENTRO ABARROTERO DEL BAJIO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02986', N'HDM160621DV7', N'HITI DIGITAL MEXICO S DE R L DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02987', N'GORA780112370', N'JOSE ALFREDO ROBLES GOPAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02988', N'HERL740709KE9', N'LEONARDO HERNANDEZ RUVALCABA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02989', N'RSA110119HSA', N'RL SEMILLAS Y AGRONEGOCIOS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02990', N'DBB83080166A', N'DISTRIBUIDORA DE BICICLETAS BENOTTO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02991', N'BEBC770524GF9', N'CECILIA GUADALUPE BELTRAN BELTRAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02992', N'AMU110913GD5', N'ADANAI MUEBLES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02993', N'QSI120427FX3', N'QG SERVICIOS INTEGRALES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02994', N'DGM151126H83', N'18 GRUPOIL MX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02995', N'DIA041110I65', N'DIAGRO PUGA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02996', N'FSA130228PGA', N'FINANCIERA SAKXIM SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02997', N'HGL980417J43', N'HENCO GLOBAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02998', N'HIM930928N45', N'HARADA INDUSTRIES MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'02999', N'XEXX010101000', N'DELPHI AUTOMOTIVE SYSTEMS LLC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03000', N'CLE0704205WA', N'COORDINADORA LOGISTICA EMPRESARIAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03001', N'ASC080922583', N'AGROPRODUCTORES SAN CAYETANO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03002', N'INV070330CD9', N'INVERTAPIAS S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03003', N'TEA950619MP8', N'TECNOLOGIA ESPECIALIZADA ASOCIADA DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03004', N'MSE021121F22', N'MARITIME SERVICES SC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03005', N'PAC131113AW6', N'PLAN DE ACATLAN SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03006', N'ADY150206V52', N'APEX DYNAMO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03007', N'ABX140407PA1', N'ALGODONERA B A SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03008', N'GPC080723EN3', N'GRUPO DE PRODUCTORES DEL CAMPO DE ATOTONILCO SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03009', N'FAL111102KK3', N'FREEZ & LOGISTICS MONTERREY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03010', N'CEY100729R85', N'COMERCIALIZADORA Y EMPACADORA  YSHAIN MAR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03011', N'TRA990510FF6', N'LOS TRABAJOSOS SPR DE RI')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03012', N'NIC021002MQ6', N'CARTERA TERRA WEALTH TRADER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03013', N'NMG0911305C0', N'CARTERA NH MERCADO GLOBAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03014', N'CEY100729R85', N'CARTERA COMERCIALIZADORA Y EMPACADORA YSHAIN MAR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03015', N'AEPL761127N41', N'JOSE LUIS ARREGUIN PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03016', N'CEA990830FA6', N'CEAGRO S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03017', N'PCF150522CX0', N'PRODUCTORA Y COMERCIALIZADORA EL FRIJOL SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03018', N'RIM110114EV1', N'RUZ IMAGINE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03019', N'ZUDA780909GA7', N'ALBERTO ZUÑIGA DELGADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03020', N'CMX160426EF3', N'CEHISA MX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03021', N'AAL150211DC2', N'ALIMAR DE LOS ALTOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03022', N'PRE95100687A', N'PROMOTORA DE RESISTENCIA SC DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03023', N'XEXX010101000', N'NEW YORK AIR BRAKE LLC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03024', N'RFM0806167H0', N'ROTO FRANK MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03025', N'GYU1504176S1', N'GRANEROS YUMKAX SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03026', N'AJU080901NP1', N'AGROINDUSTRIAS JUANCAR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03028', N'AEAA680607JL3', N'ANA CRISTINA ALMERAZ AVIÑA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03029', N'ZEHL771219EC9', N'LUZ ELENA ZEA HUERTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03030', N'ROVM820605SV9', N'JOSE MIGUEL RODRIGUEZ VIDAÑA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03031', N'CDO9003052S9', N'EL CAMARON DORADO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03032', N'LOJC770611D22', N'CARLOS ENRIQUE LOPEZ JUAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03033', N'XEXX010101000', N'VENTURESOURCE SOLUTIONS INC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03034', N'AGR160617H17', N'AGRUZA SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03035', N'DAD1210024T1', N'DISTRIBUIDORES AUTOMOTRICES DINA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03036', N'FLE160311634', N'FLEXOTRAY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03037', N'PNP0409287VA', N'SUN CITY NUT COMPANY DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03038', N'IJS930831J80', N'LA IGLESIA DE JESUCRISTO DE LOS SANTOS DE LOS ULTIMOS DIAS EN MEXICO AR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03039', N'SEC020227SY5', N'SARRE ECOLOGIA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03040', N'TOMJ761112A25', N'JORGE DEL TORO MARTINEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03041', N'PCC140523S74', N'PRODUCTORES EN CRECIMIENTO CONDIAGRO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03042', N'GCO820106RI5', N'CARTERA GRUPO COLLADO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03044', N'APO080527FA8', N'ACUICOLA PORTAL SC DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03045', N'DMC871114TP6', N'DIAGEO MEXICO COMERCIALIZADORA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03046', N'DMC160901KV5', N'DAL-TILE MEXICO COMERCIAL S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03047', N'GULV760617KV6', N'VICTOR GUIDO LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03048', N'HSO080326S9A', N'HI-TEC SOLUCIONES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03049', N'DKO101126QP2', N'DESARROLLOS KOROCON S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03050', N'LOEV911106JV4', N'EVA LOEWEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03051', N'PAG110622TB8', N'PRODUCTORA AGRIMEX SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03052', N'ODI160303BT3', N'OMC DISTRIBUCIONES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03053', N'GHI1610149Z8', N'GRUPO HUDSON INGREDIENTES S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03054', N'HTV950911RDA', N'CARTERA EXCLUSIVE HIGH TECH SA DE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03055', N'PCC101111C34', N'PRODUCTORES DEL CENTRO DE CHIAPAS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03056', N'SEVM761217BS4', N'MARIO ALBERTO SERRATOS VALDIVIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03057', N'GAFJ440531FIA', N'JORGE HUMBERTO GALLARDO FREGOSO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03058', N'UIS960617SX0', N'UNIVERSAL INTERNATIONAL SERVICES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03059', N'NLO130322SG4', N'CARTERA NG LOGISTICA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03060', N'DNO080118724', N'DISTRIBUIDORA LA NOGALERA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03061', N'CNO150702PP7', N'COMERCIAL NOGALERA S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03062', N'GCC961119348', N'GRUPO CONSTRUCTOR Y COMERCIALIZADOR CORINTIO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03063', N'KIU140516SR2', N'KLEMA IMPORTACIONES USA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03064', N'HER090130J15', N'HERNANMARTIN SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03065', N'AUP080624CV2', N'APICULTORES UNIDOS DE LA PENINSULA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03066', N'NAM150610MF3', N'COFCO AGRI MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03067', N'SYS060712Q9A', N'SYSPACK SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03068', N'TME080527TY3', N'TRANSPLACE DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03069', N'SGC1609225PA', N'SPL GLOBAL CARGO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03070', N'XEXX010101000', N'NYPRO DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03071', N'HEMJ951225KEA', N'JESUS HERNANDEZ MARIN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03072', N'XEXX010101000', N'THE ROTUBA EXTRUDERS INC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03073', N'PME921109IS8', N'PFS DE MEXICO SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03074', N'SAMJ4501204K5', N'J GUADALUPE SANCEN MARTINEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03076', N'DSC1101262A7', N'DISTRIBUIDORA DE SEMILLAS Y CHILES SECOS EL RANCHERO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03077', N'XEXX010101000', N'UBER BV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03078', N'AEAL770402V55', N'LUIS ESTEBAN ARELLANO ARAGON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03079', N'CLI1601274V8', N'CLIAMEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03080', N'XEXX010101000', N'CV LOGISTICS INC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03081', N'VASR5302229V6', N'ROBERTO VALVERDE SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03082', N'ADM131010MV5', N'AGRICOLA DOS MARGARITAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03083', N'PHM870907PP0', N'PARKER HANNIFIN DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03084', N'OSM140901RL6', N'ON STORES MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03085', N'SMI990401JS4', N'SANTA MARIA INDUSTRIAL PARTNERS LP')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03086', N'CESC6411057R9', N'CLAUDIO ISAAC CHEJFEC SAMICH')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03087', N'MAOA890809AT1', N'ALMA LIZETH MARTINEZ OJEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03088', N'MSH970109JX2', N'MEXPROUD SHIPPING SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03089', N'BME950712DE5', N'BOSAL MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03090', N'AFB941116FK8', N'ARRENDADORA Y FACTOR BANORTE SA DE CV SOFOM E R GRUPO FINANCIERO BANORTE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03091', N'LEM000414FV4', N'LG ELECTRONICS MONTERREY MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03092', N'MFR0312035C3', N'MERCADO DE FRIJOL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03093', N'MIM0811108T2', N'MAS INFORMACION CON MAS BENEFICIOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03094', N'MMT150304BD1', N'MAGNETI MARELLI TOLUCA MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03095', N'EMA03030581A', N'COMPAÑIA EXPORTADORA MACPO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03096', N'PNA971216TE3', N'PUNTO NATURAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03097', N'AGU1004263Q4', N'AGRONEGOCIOS DEL GUADIANA SA DE CV SOFOM ENR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03098', N'INI110606QN8', N'INNOVADORA NUTRIAN E INTEGRADOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03099', N'ZIT030808EJ0', N'ZAMBRANO INTERNATIONAL TRADING COMPANY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03100', N'ZAHB7501211B1', N'BENITO ZARAGOZA HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03101', N'MME000912Q44', N'NORTEK GLOBAL HVAC MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03102', N'ICO151009KY8', N'ICM COMERCIALIZADORA S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03103', N'MECN570227443', N'NORMA LUCILA MENDOZA CARRILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03104', N'MALA8809129E6', N'ALEJANDRA MARTINEZ LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03105', N'BMA1003314Q0', N'BONISIMO DEL MAR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03106', N'ASE1401083Q8', N'AMATISTA SEAFOOD SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03107', N'GAM030201I46', N'GRUPO AMATISTA DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03108', N'GEA120220PD0', N'GRUPO ESTRELLA DE ALTAMAR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03109', N'CCE520101TC7', N'THE COCA COLA EXPORT CORPORATION SUCURSAL EN MEXICO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03110', N'JMA100111B2A', N'JDV MARKCO SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03111', N'AGM150519110', N'AVICOLA Y GANADERA MILPILLAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03112', N'NEZM830812DC6', N'MELISA NEGRETE ZARATE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03113', N'TME930119HR3', N'TOTALENERGIES MARKETING MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03114', N'YPL170314CT9', N'YUANHANG PACIFICO LOGISTICA SA DE CV')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03115', N'APR081208986', N'AGRICOLA PROAGRO SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03116', N'ZKM9309153S2', N'ZELMA KOOLER DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03117', N'OMI950913TV2', N'OAXACA MIEL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03118', N'SER120201838', N'SERASIN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03119', N'HMP150216LZ7', N'HARI MASA DEL PACIFICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03120', N'BELL370108JR4', N'LUZ ESTHELA BELTRAN LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03121', N'SPR870504UBA', N'MOLINO VILLAFAÑE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03122', N'ISU990420765', N'INDUSTRIAS SUANCA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03123', N'ATM140127JW5', N'AC TABLEROS Y MADERAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03124', N'REM091005C3A', N'REMUZ SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03125', N'OSM150106MM9', N'OPERADORA DE SITES MEXICANOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03126', N'AGP170117QY6', N'ALMACENAJE DE GRANOS PLJ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03127', N'', N'INTERNATIONAL PAPER COMPANY')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03128', N'KSA870429268', N'KOHLER SANIMEX S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03129', N'GOGF910525NYO', N'FRANCISCO GONZALEZ GALLARDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03130', N'AME000417L83', N'ADVANCED METHODS CO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03131', N'HAC111222KM5', N'HOME & CREATE PRODUCTS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03132', N'SEI121105FX8', N'SOLUCIONES E INNOVACION EN NUTRICION ANIMAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03133', N'GFS160118H59', N'GRANEROS FRAGA DE SAN FERNANDO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03134', N'PRR9012281B3', N'GUADIANA DE ANAHUAC SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03135', N'SAL970610152', N'SIGMA ALIMENTOS LACTEOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03136', N'AEN921007269', N'ALVACO ENTERPRISES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03137', N'GSV140623RY8', N'GRANOS Y SEMILLAS VISARA SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03138', N'SEGJ980613RS3', N'JORGE ANTONIO SERRANO GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03139', N'BAFR7009196X5', N'JOSE ROBERTO BARAJAS FLORES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03140', N'MEVA6008053X6', N'ADALBERTO MENDIVIL VALENCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03141', N'MEGE921231S17', N'EMMANUEL GUADALUPE MENDIVIL GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03142', N'EOC1507283R1', N'ENERSOL DE OCCIDENTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03143', N'XEXX010101000', N'MINER ENTERPRISES INC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03144', N'FICB810810JC2', N'BRENDA LIZETH FIERRO COTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03145', N'CALR751001SW2', N'REGINALDO CASTRO LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03146', N'IULA921114L45', N'ANA FABIOLA INZUNZA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03147', N'IULF961107BGA', N'FABIAN ALBERTO INZUNZA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03148', N'LACM6002027C5', N'MAXIMIANO LARA CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03149', N'UCA930608651', N'UNION DE CREDITO ALLENDE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03150', N'RCE980807LN0', N'RANCHO CABALLERO ESTRADA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03151', N'AME941028N57', N'ARCELORMITTAL MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03152', N'AFE140926DL6', N'AGRICOLA FERDEL SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03153', N'ASF120504Q50', N'AGRICOLA SOTO FIERRO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03155', N'CPR960101354', N'EL CEMPOAL SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03156', N'SOVF770802PA0', N'FILIBERTO SOTO VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03157', N'FUML671215HQ9', N'LUIS ARTURO FUENTES MILAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03158', N'POAL831102JJ7', N'LUIS ROSENDO AKE POOT')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03159', N'CLO051018LU5', N'CSI LOGISTICS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03160', N'DCR961210GM4', N'D.R. 011 RIO LERMA GTO. S DE RL DE IP DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03161', N'ZKM1506234B2', N'ZEIT KORPORATIV DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03162', N'JCA100604EF4', N'JOHNSON CONTROLS ENTERPRISES MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03163', N'FMI080402EG1', N'FILTROX MICROFILTRACIONES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03164', N'COCR720120AP0', N'RAQUEL DESDEMONA COHEN COHEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03165', N'PRY971124419', N'PROMOTORA RIO YAQUI SA DE CV SOFOM ENR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03166', N'GDA960704644', N'GRUPO DE DESARROLLO AGRICOLA MEXICANO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03167', N'SSY1704203J6', N'SENTER SYNERGY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03168', N'OMA140507MG0', N'OPERADORA MAROA S DE RL CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03169', N'AMJ150828NE7', N'AGRICOLA MAMA JUANITA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03170', N'AGR14123094A', N'ANVER GRANOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03171', N'BIM030422975', N'CGI LOGISTICS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03172', N'CGA110418LH2', N'COMERCIALIZADORA DE GRANOS AZTECA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03173', N'GFM091009AA9', N'GRANOS Y FORRAJES MURO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03174', N'IMC850515U36', N'INTERCAMBIO MEXICANO DE COMERCIO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03175', N'AIA160601LN6', N'AQS INSPECTION & REWORK S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03176', N'OLC170403FB9', N'OPERADORA LOGISTICA COPLO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03178', N'MAGM7903242G4', N'MIGUEL MARTINEZ GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03179', N'COCR791121V66', N'RODRIGO CORTINA CADENA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03180', N'GORD820721212', N'JOSE DANIEL GOMEZ RINCON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03181', N'GALR810921H90', N'ROQUE ALEJANDRO GARCIA LOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03182', N'OIZF661022SX6', N'FRANCISCO JAVIER ORTIZ ZERMEÑO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03183', N'NMM9701278N4', N'NIPRO MEDICAL DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03185', N'AUHS370524NB1', N'SALVADOR ARGÜELLES HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03186', N'FETR370720RQ8', N'RIGOBERTO FELIX TORRES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03187', N'TME131122QD3', N'TENDA MEXICO S DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03188', N'PLM780314167', N'PHILIPS LUMINARIAS DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03189', N'DAD140702UR5', N'DISTRIBUIDORA ADHIPSA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03190', N'TLT120131KT9', N'TERMINAL LOGISTICS TRANSPORTE FISCALIZADO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03191', N'EME1612123Y0', N'EMERS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03192', N'VAHA740615663', N'JOSE ANGEL VALDEZ HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03193', N'MSU1502233W8', N'MS SUGAR SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03194', N'CPR0008233W6', N'CAIMAN PRODUCTS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03195', N'FJC780315E91', N'FABRICA DE JABON LA CORONA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03196', N'BPR0209094F4', N'BROCHAS Y PRODUCTOS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03197', N'LILP860929SS8', N'PABLO ALBERTO LIMON LOMELI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03198', N'SAMD740918BQ2', N'DAVID FERNANDO SALAZAR MALDONADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03199', N'XEXX010101000', N'KNAPPCO CORPORATION')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03200', N'YLM081111665', N'YUSEN LOGISTICS MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03201', N'PEE0007118TA', N'PALETS EMPAQUES Y EMBALAJES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03202', N'ECV1602106T1', N'ENLACE COMERCIAL VALMEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03203', N'FIN120118717', N'FINAGROSOL SA DE CV SOFOM ENR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03204', N'IME0410225W4', N'ILENDER MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03205', N'ERC911024QY3', N'EQUIPOS DE REFRIGERACION CUITLAHUAC SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03206', N'NCA000310FU3', N'NUESTRO CAMPO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03207', N'CME960830HB4', N'CERRACO MEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03208', N'ATJ121129Q36', N'AGRO TECNOLOGIAS DE JALISCO S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03209', N'BDD1304223S6', N'PRO MDF SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03210', N'DIS160322Q77', N'DISMAXXI S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03211', N'TGL130523MP0', N'TUNING GLOBAL LOGISTICS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03212', N'PME990511HU5', N'PHILPOT MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03213', N'IRD951206NFA', N'INNOVARE R & D SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03214', N'ROCG7609257V7', N'GABRIEL RODRIGUEZ CECEÑA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03215', N'FOMG600217H5A', N'GLORIA FLORES MARTINEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03216', N'AFO850601QM5', N'ACCESORIOS FORESTALES DE OCCIDENTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03217', N'GRU0109252R7', N'CARTERA GRUPAMA SA DE CV')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03218', N'JFN0702277I9', N'J. F. NUT COMPANY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03219', N'CSA1409112T7', N'CRIBA Y SEMILLAS LOS APAREJOS SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03220', N'GOGL811003HU5', N'LIDIA TERESITA GONZALEZ GOMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03221', N'HDM001017AS1', N'HOME DEPOT MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03222', N'DSA8412043D2', N'DISTRIBUIDORA SAJOR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03223', N'MEG1410294L3', N'MEGAMEX SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03224', N'ANO1607097N3', N'AGROMERCANTIL DEL NORTE SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03225', N'FME120803935', N'FACEBOOK MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03226', N'XEXX010101000', N'SALCO PRODUCTS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03227', N'XEXX010101000', N'METALEX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03228', N'NGT041122HA8', N'NORTH GRAINS TRADING SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03229', N'SFG950125RL4', N'SEMILLAS Y FERTILIZANTES EL GEYSER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03230', N'EGT1609233K2', N'EURO GAMES TECHNOLOGY MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03231', N'IMC850515U36', N'CARTERA INTERCAMBIO MEXICANO DE COMERCIO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03232', N'ACA160309F28', N'ACOPIADORA COMERCIAL Y AGROINDUSTRIAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03233', N'FMA130307UQ3', N'FRIJOL Y MAIZ DE ALLENDE FRIMALLE SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03234', N'PDA070426DMA', N'PRODUCTORA Y DESHIDRATADORA AGRICOLA IXTLAHUACAN SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03235', N'HGA1512236D5', N'HOLDIN GAINS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03236', N'PBO110526EI8', N'PRODUCTOS BODYCARE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03237', N'SAM131120CC1', N'SERVICIOS Y ASESORIA LA MAZORCA SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03238', N'MED170912IUA', N'MEDUPRO SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03239', N'MAQ990609DY4', N'MAQUITOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03240', N'NIN170301S56', N'NOWGROUP INC SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03241', N'KIN9008151K7', N'KY INDUSTRIAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03242', N'RPP040924190', N'RGS PRODUCTORA Y PROCESADORA DE FRUTAS SECAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03243', N'XEXX010101000', N'ELECTROLUX HOME PRODUCTS INC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03244', N'SMA790517863', N'SANCHEZ Y MARTIN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03245', N'RLO101101V18', N'R LOGISTICS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03246', N'WSM0401053F5', N'WILLIAMS SCOTSMAN MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03247', N'FSA030920NT1', N'FUMIGACIONES SANMOL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03248', N'LORA900201H12', N'AMADO LOPEZ RAYMUNDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03249', N'AOV110920360', N'AGRICOLA OVAL SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03250', N'DURA410701QIA', N'AARON DZUL RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03251', N'NIPA470707LC5', N'ABEL NIETO PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03252', N'KAWA881226RC4', N'ABRAM KLASSEN WALL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03253', N'AGR1108314E7', N'AGROPAPAYAS S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03254', N'LOKA940623GWA', N'ALVEN LOEWEN KAUENHOFEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03255', N'TUCA970308DM1', N'AUDOMARO TUN CHAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03256', N'GAPA610209TA1', N'AUSBERTO JESUS GARCIA PUGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03257', N'YECD8110067P9', N'DAMIAN JESUS YEH CAHUICH')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03258', N'FIRD960413DK2', N'DAVID FRIESEN REDECOP')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03259', N'NEVO810714JQ8', N'OSCAR EDUARDO NEVAREZ VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03260', N'FTP1706236Y1', N'FRUTAS TROPICALES DE LA PENINSULA S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03261', N'LOFG720211D59', N'GERHARD LOEWEN FEHR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03262', N'FILG5012301I4', N'GERHARD FRIESEN LOEWEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03263', N'KAWG790129KX3', N'GERHARD KLASSEN WALL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03264', N'HAKH831222GE6', N'HEINRICH HARMS KLASSEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03265', N'HAKJ8105255R6', N'JACOB HARMS KLASSEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03266', N'WABJ680119MT4', N'JACOB WALL BRAUN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03267', N'HAMJ541105UJ9', N'JACOB HARMS MARTENS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03268', N'SOZJ760424DF3', N'JOHAN STOESZ ZACHARIAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03269', N'ACA010515B73', N'AGROPECUARIA CASTARIZ SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03270', N'FITG620903BP0', N'GERHARD FRIESEN THIESSEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03271', N'TAUA730609SV4', N'JOSE ALFREDO TAMAY UICAB')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03272', N'MICL730724UVA', N'LUIS ALFONSO MIAN CHE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03273', N'GAAM761225P81', N'MANUEL JESUS GARCIA AKEB')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03274', N'HITM831115KFA', N'MARIA HIEBERT THIESSEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03275', N'UEHM870324A83', N'MARIA UNGER HIEBERT')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03276', N'PECM610805S38', N'MARIO OSVALDO PELAEZ CATALAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03277', N'GAGM851220M47', N'MARISELA GAMA GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03278', N'KUUM790606BD5', N'MATUZALEN KU UICAB')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03279', N'MOCP680411969', N'PEDRO MANUEL MOO CAMARA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03280', N'CAPP830928FY4', N'PEDRO MISAEL CAMARA PUGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03281', N'RIL101118B62', N'RANCHO ICH EK LAGUNA PRODUCTORES S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03282', N'KUCS820922CV6', N'SAMUEL KU CHE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03283', N'KALS7512036N1', N'SARA KAUENHOFEN LOEWEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03284', N'GAPS721210F39', N'SEVERIANO GARCIA PUGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03285', N'CIVA500214493', N'VALENTIN LEOCADIO CHI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03286', N'LOGW750813DG2', N'WILHELM LOEWEN GIESBRECHT')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03287', N'KAWH8411062I4', N'HEINRICH KLASSEN WALL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03288', N'ODE860421832', N'ODESA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03289', N'ING170123A34', N'INGALIM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03290', N'BCO110322ID5', N'BALTHAZAR COMMODITIES S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03291', N'ICA010807VB2', N'SOCIEDAD INTEGRADORA DEL CAMPO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03292', N'GOMA900813129', N'ABRAHAM GONZALEZ MALDONADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03293', N'VIDA540126963', N'ADALBERTO VIVAS DZIB')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03294', N'ACA0902185P2', N'AGRICULTORES CAMPECHANOS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03295', N'AIN0003277L7', N'AGRICULTURA INTEGRAL SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03296', N'YECA790921HIA', N'ALBERTO ROMAN YEH CANCHE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03297', N'UIUA690127B88', N'ALBERTO UICAB UICAB')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03298', N'LORA900201H12', N'AMADO LOPEZ RAYMUNDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03299', N'UIGA860607BF2', N'ARMANDO URIBE GOMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03300', N'BFA131204GJ2', N'BRAIN FACTORY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03301', N'HEBO7211208R4', N'OCTAVIO HERNANDEZ BELTRAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03302', N'TEVA7012102T3', N'ARTURO TREJO VEGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03303', N'GAPC631207KS2', N'CONCEPCION GARCIA PUGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03304', N'HOPC6207217F7', N'CRISTOBAL HORTA PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03305', N'LOFD790614M15', N'DAVID LOEWEN FEHR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03306', N'SMD110624IE2', N'SERVICIOS MARITIMOS Y DISTRIBUIDORES LOGISTICOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03307', N'PME170802PD8', N'PELEMIX MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03308', N'FIFD920517NI8', N'DIEDRICH FRIESEN FEHR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03309', N'MACD680113S22', N'DOMINGO MATIAS CARRILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03310', N'MOPE910220298', N'ELEAZAR MONROY POOT')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03311', N'NSP141027GQ5', N'NATURAL SYRUP PRODUCER SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03312', N'PEGE6711151G7', N'ERNESTO PEREZ GREGORIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03313', N'UITE4604159Q6', N'EULOGIO UICAB TUYUB')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03314', N'CECE580202D9A', N'EUTERPE CHE CHAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03315', N'GACG900921ST8', N'GEOVANNI DASSAEV GARCIA CAMARA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03316', N'CACG401010TY5', N'GREGORIO CASTILLO CAMARA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03317', N'KALH511001HS3', N'HEINRICH KAUENHOFEN LOEWEN')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03318', N'KAHH811116166', N'HENRICH KLASSE HIEBERT')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03319', N'HAMJ541105UJ9', N'JACOBO HARMS MARTENS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03320', N'KAPJ910824LPA', N'JOHAN KLASSEN PENNER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03321', N'CAYJ861022366', N'JOHOVANY CAMARA YEH')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03322', N'ESJO830424QR4', N'JORGE CESAR EK SANTOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03323', N'FRI160725ES8', N'FRIGOQUER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03324', N'OME100409HN2', N'OLAM AGRO MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03325', N'ACB150128693', N'ALIMENTOS CBZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03326', N'AICM540330RS7', N'JOSE MARIA AVILES CANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03327', N'CAPR880208AM4', N'JOSE RICARDO CAUICH PUC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03328', N'GAPR570921292', N'JOSE ROSARIO GARCIA PUGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03329', N'TEVJ650403U91', N'JUAN CARLOS TREJO VEGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03330', N'COHJ490624UZ9', N'JUANA CORONADO HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03331', N'EPI090218TH4', N'LA ESPERANZA DE PICH SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03332', N'MPR960311L77', N'LA MILPITA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03333', N'VISL440613UK4', N'LUCIANO VILLALOBOS SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03334', N'UICL790108NX5', N'LUIS MANUEL UICAB CHI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03335', N'MUB110918UK4', N'MANOS UNIDAS DE BONFIL SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03336', N'GIWM670222C64', N'MARGARETHA GIESBRECHT WIEBE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03337', N'TEHM6103185A5', N'MARIANA TE HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03338', N'AOCM351123BX5', N'MOYSES ACOSTA CASTILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03339', N'CAGP700603EF7', N'PAULINO CASTILLO GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03340', N'CAAR510118644', N'RAUL CASTILLO AVILEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03341', N'AICS460712MZ0', N'SALVADOR AVILES CANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03342', N'GATS360420V7A', N'SEVERIANO GARCIA TEC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03343', N'APJ130306CU4', N'SOCIEDAD DE APICULTORES EN PROGRESO DEL JABALI DE PICH SRL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03344', N'BOGR650923238', N'RICARDO BORUNDA GUERRERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03345', N'CADA950912G39', N'ALFONSO CAHUICH DOMINGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03346', N'MAMA741105V66', N'ARTURO MARTINEZ MENDOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03347', N'TUTA740512GG9', N'AUDOMARO TUN TUN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03348', N'HEBI720912F42', N'ISAAC HEIBERT BUECKERT')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03349', N'PHO070620PK2', N'LAS PALMAS DE HOPELCHEN SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03350', N'HUCM52072098A', N'MACEDONIO HUCHIN CHI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03351', N'CACM580206PS4', N'MANUEL CHAN CHI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03352', N'OOGM870531ML3', N'MARIO ORDOÑEZ GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03353', N'VALA780927PP5', N'AMADO VALDEZ LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03354', N'TUUC530402B74', N'CANDELARIO TUYUB UICAB')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03355', N'HESL400621BE2', N'JOSE LUIS HERNANDEZ SALAZAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03356', N'ABU0503225R9', N'AGROINDUSTRIAS DE BUENAVENTURA SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03357', N'CAGC900529GJA', N'CHRISTIAN FRANCISCO CARDENAS GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03358', N'GUPN760823P76', N'NOE OSVALDO GUTIERREZ PEÑA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03359', N'QURS670218L67', N'SIMEON LIBRADO QUEVEDO ROJAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03360', N'LOGR87100931A', N'ROSARIO JOVANNY LOPEZ GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03361', N'CAML580223GX3', N'JOSE LUIS CASTRO MOLINA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03362', N'CHS910204BW2', N'CAMPUZANO HERMANOS SPR DE RL  DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03363', N'CCL141112AN1', N'CERVECERIA CIELITO LINDO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03364', N'KPE1203168B0', N'KURUMI PECANS SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03365', N'AMA150305SK9', N'AGRONEGOCIOS MI MAIZ SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03366', N'VAOE560410QNA', N'ELVIA ROSALBA VARGAS OCAMPO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03368', N'AIGC910829LU7', N'CESAR ANDRES AVILES GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03369', N'AHB160926A48', N'ALGODONERA HBR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03370', N'CEL470228G64', N'COMERCIALIZADORA ELORO SA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03372', N'INC1503062C8', N'INTERNACIONAL DE NEGOCIOS CARRANZA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03373', N'CIM0401305G1', N'CRC INDUSTRIAS DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03374', N'YTM130306J60', N'YOKOHAMA TIRE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03375', N'CAUA500708PR9', N'AUDOMARO CASTILLO UC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03376', N'KACX480612FN8', N'ANTONIO KANTUN CAB')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03377', N'MAVL590114MG0', N'LEOVIJILDO MANZANILLA VIVAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03378', N'DEA7103086X2', N'DEACERO SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03379', N'ATD9605206J1', N'ALMACENES EL TRIGO DORADO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03380', N'KIN9008151K7', N'CARTERA KY INDUSTRIAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03381', N'EASA760608894', N'ARTURO ESCAMILLA SERRANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03382', N'MAMJ890509L78', N'JOSUE FRANCISCO MAGAÑA MORA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03383', N'MNM150227D32', N'COVESTRO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03384', N'MACV900728MZ5', N'VICTOR LEONARDO MARTINEZ CARDENAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03385', N'SOMS750103J85', N'SALVADOR SORIANO MARTINEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03386', N'PAMY680407192', N'YOLANDA PAZ MIRANDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03387', N'SAN130424V21', N'SISTEMAS ALIMENTICIOS NATURALES SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03388', N'SORS740401DK8', N'SANDRA LUZ SOLIS RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03389', N'MORR910604KD7', N'RODRIGO EDUARDO MORA RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03390', N'RME111205UC3', N'RENISHAW MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03391', N'GUHM731112M35', N'MARTHA ELBA GUZMAN HARO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03392', N'MEDJ5004093NA', N'JULIO MENDOZA DIAZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03393', N'KAPJ831003ED6', N'JACOB KLASSEN PENNER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03394', N'SAPD900104MB7', N'DAVID SAWATZKY PETERS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03395', N'FOMD950809B30', N'DAVID FROESE MARTENS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03396', N'FESH820822812', N'HEINRICH FEHR SAWATZKY')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03397', N'DOKH920213V75', N'HELENA DOERKSEN KAUENHOFEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03398', N'HALJ8412136V6', N'JOHAN HARDER LOEWEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03399', N'HAPJ6306261Y7', N'JUAN P HARDER PENNER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03400', N'FESS880628UF0', N'SARA FEHR SAWATZKY')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03401', N'JUGI660123RE4', N'JOSE ISIDRO JUAREZ GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03402', N'CGP180130E29', N'COMERCIALIZADORA GPMEX S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03403', N'TZW141008RS4', N'PRODUCTOS ALIMENTICIOS Y DIETETICOS RELAMPAGO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03404', N'PME8411016W6', N'PRODUCTOS MEXICANOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03405', N'GRA120223EA8', N'GRAJALSIN SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03406', N'HAKA950119IW8', N'ABRAHAM HARDER KAUENHOFEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03407', N'HAFA890308BX1', N'ANDREAS HARDER FROESE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03408', N'LIEA7806134K4', N'ANTONIO LINARES ENRIQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03409', N'KAHB851215T87', N'BENJAMIN KAUENHOFEN HARDER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03410', N'HAFB871023HF4', N'BERTHA HARDER FROESE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03411', N'HAKB890626T12', N'BERTHA HARDER KAUENHOFEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03412', N'HAKE910108JH5', N'ENRIQUE HARDER KAUENHOFEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03413', N'HAFE830803ID9', N'ESTHER HARDER FROESE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03414', N'HAKF991024DT5', N'FRANCISCO HARDER KAUENHOFEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03415', N'DOKH941221S24', N'HEINRICH DOERKSEN KAUENHOFEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03416', N'SAFM740731RW0', N'MARIA SAWATZKY FRIESEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03418', N'RGS141119N21', N'RANCHO GANADERO SAN CARLOS S. DE P.R. DE R.L.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03419', N'ZAWR960307CMA', N'RUBEN ZACHARIAS WIEBE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03420', N'ZAWW970220CB9', N'WALTER ZACHARIAS WIEBE')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03421', N'EME800507TB3', N'EMBOTELLADORA MEXICANA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03422', N'EVI060613AE2', N'ECM DE VINOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03423', N'KASA7404145B3', N'ANTON KAUENHOFEN SAWATZKY')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03424', N'FIPH511013G17', N'HEINRICH FRIESEN PENNER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03425', N'FOWH640804TQ9', N'HELENA FROESE WIEBE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03426', N'FOMM921118EA0', N'MARIA FROESE MARTENS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03427', N'UISR450801U29', N'RAFAEL URIBE SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03428', N'HAFA890308BX1', N'ALBERTO FRANCISCO ZAPATA SOUZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03430', N'LOFD790614M15', N'BERNHARD FRIESEN GOERTZEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03431', N'DOKH920213V75', N'JOSE VALADEZ HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03432', N'TAE9606216D6', N'TAENZA SA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03433', N'CAV900615LV7', N'CENTRO AUTOMOTRIZ VALLARTA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03434', N'PMA930216GB2', N'PRODUCTOS MAVER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03435', N'AGS1710261U5', N'ALMACENADORA DE GRANOS SAFINSA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03436', N'SBG971124PL2', N'SEGUROS BANORTE SA DE CV GRUPO FINANCIERO BANORTE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03437', N'BAKB9607211L2', N'BENJAMIN BARTSCH KLASSEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03438', N'GAPC651122TS5', N'CECILIO GARCIA PUGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03439', N'HADH940812I76', N'HELENA HARMS DYCK')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03440', N'EFI101119948', N'EFIRSA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03441', N'EMA1512113T7', N'EMALLUGE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03442', N'MAAA661207528', N'JOSE ALFREDO MAAS AKE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03443', N'MFR0312035C3', N'CARTERA MERCADO DE FRIJOL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03444', N'ZAPJ800522B47', N'JUAN ZACHARIAS PETERS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03445', N'FOML9401039UA', N'LISA FROESE MARTENS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03446', N'FER110929ID6', N'FERTIGAM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03447', N'KALA580316C77', N'ABRAM KAUNOFEN LOEWEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03448', N'DOKJ891206GD4', N'JUAN DOERKSEN KAUENHOFEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03449', N'SDE130207QJ5', N'EL SEGUNDO DESTINO S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03450', N'ROCM680328FM4', N'MIGUEL ANGEL RODRIGUEZ CASTILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03451', N'GMB140604NV3', N'GRANEROS MARIA BONITA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03452', N'PCA0301167A8', N'PERI CIMBRAS Y ANDAMIOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03453', N'PSI130227K9A', N'ESMALTERIA SAN IGNACIO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03454', N'TME930119HR3', N'TOTAL MEXICO SA DE CV (HIJO EXPEDITORS)')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03455', N'FATM950119ES0', N'MARCO ANTONIO FABIAN TEJEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03456', N'DEBL731025E61', N'LEONCIO DELGADO BRISEÑO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03457', N'ABM180201B11', N'AVOCADOS Y BERRYS MENDOZA VALLE  SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03458', N'FCG1607054H4', N'FRONTIER CAR GROUP MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03459', N'AVC170111KP0', N'AGROPRODUCTORES DEL VALLE DE CULIACAN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03460', N'PAF0408165Q1', N'PRODUCTOS AGRICOLAS Y FORESTALES DE CHIHUAHUA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03461', N'MACL851103Q7A', N'LILIANA MARGARITA MAGALLON CARDENAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03462', N'CUCG861027JN1', N'GLADYS CRUZ CABALLERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03463', N'MORA7109036I3', N'ADAN MONROY RIOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03464', N'TTR090818HW2', N'NUECES FINK SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03465', N'AGY1109309Q4', N'AYALA GRANOS Y SEMILLAS SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03499', N'RIGE511202615', N'EVERARDO RIVERA GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03500', N'GAHS5702118X4', N'MARIA SILVIA GARCIA HUERTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03664', N'LELF6603267I1', N'FRANCISCO LEYVA LANDEROS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03706', N'REHE421031C14', N'ELIAZAR REGALADO HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03711', N'MOBO510508PZA', N'MARIA OLIVA MORALES BALLEJO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03721', N'EIVS461225JD9', N'SALVADOR ESPINO VAZQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03725', N'COLC811022L20', N'CRISTIAN CONTRERAS LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03729', N'COLJ530721514', N'JUVENCIO CONTRERAS LEDESMA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03770', N'CALO370310GF5', N'OLEGARIO CASTRO LIERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03779', N'SAGR780501MH7', N'JOSE RENE SANCHEZ GALVEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03787', N'COMS5208209X8', N'SALVADOR CONTRERAS MORALES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03802', N'RIGJ790415HA9', N'JESUS MARTIN RIVERA GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03831', N'IAMF560713ED2', N'FRANCISCO JAVIER ISLAS MASCAREÑO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03837', N'CASR4708315G8', N'RAMON ARTURO CAMACHO SOTO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'03956', N'QUCT291109L31', N'TEODORO QUEVEDO COTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'04013', N'QUCO330212K45', N'CONSUELO QUINTERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'04030', N'BELR540728PW6', N'RAMON BELTRAN LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'04031', N'RAAM650723PKA', N'MARIBEL RAMIREZ ANDRADE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'04072', N'LOCX410804770', N'JOSE ARTURO LOPEZ CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'04328', N'LUGM441205HN9', N'JOSE MARIO LUGO GALVEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'04343', N'AELR660330LD1', N'ROMUALDO ARMENTA LIERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'04425', N'VACL570429GK7', N'LEONARDO VALDEZ CABRERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'05517', N'MERA491209EW0', N'RAMONA MENDOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'05641', N'LOFG650814BG7', N'JOSE GUADALUPE LOPEZ FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06382', N'LOFR8210196Q6', N'RENE LOPEZ FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06405', N'CUCJ390415MC1', N'JERONIMO CUEVAS CAMPOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06407', N'VAFH610418HL2', N'HERLEY VALENZUELA FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06431', N'CACL541116IA3', N'LEOBERTO CARRASCO CARO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06451', N'CAGC7301056L3', N'CARLOS ARMANDO CARDENAS GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06462', N'LUCA470402QX5', N'ADAN LUGO CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06482', N'LOGB390603RY6', N'BARDOMIANO LOPEZ GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06524', N'PELG420429837', N'GABRIEL PEÑUELAS LEYVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06592', N'LOGJ380115LM9', N'JUVENCIO LOPEZ GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06596', N'PELE4511021C0', N'ENRIQUE PEÑA LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06601', N'VABZ400707PV0', N'ZOILO VALDEZ BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06638', N'AUAR570616TL9', N'RAMON ANGULO AHUMADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06640', N'AAGE520215SK1', N'ENGELBERTO ARANJO GALLARDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06646', N'AECF631120GF0', N'FELIX AIDA ARMENTA CERVANTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06657', N'BELN771127UL1', N'NORMA RAMONA BENITEZ LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06678', N'DAAM470520DJ8', N'MARCIA MARISELA DAGNINO AHUMADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06730', N'LOAE880128PL6', N'EDHER ALLAN LOPEZ ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06732', N'LOLO610716V39', N'OLEGARIO LOPEZ LEYVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06769', N'QULR5709106E1', N'JOSE RAMON QUEVEDO LUQUE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06775', N'ROOT640426615', N'TRINIDAD RODRIGUEZ ORDUÑO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06794', N'SACR5110074DA', N'RAMON SANDOVAL CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06795', N'SAZM300709B97', N'JOSE MARIA SANDOVAL ZAVALA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06797', N'SEOR3912053S4', N'ROSARIO SERRANO OCHOA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06804', N'VAGV560608TI1', N'VICTOR MANUEL VALDEZ GAMBOA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06868', N'COHK890623B51', N'KARLA NOEMI CONTRERAS HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06870', N'DUPE390307MT5', N'ENRIQUE DURAN PADILLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06874', N'FELA780626R98', N'MARIA ANA FELIX LEON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06876', N'GAHM4810217Z8', N'MANUEL GARCIA HUERTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06908', N'OEVA581027AW4', N'ARMANDO ORTEGA VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06910', N'PELR531106Q30', N'MARIA RAFAELA PEÑA LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06919', N'RIAM6211151K6', N'MIRNA ALICIA RIOS AVILES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06924', N'TICJ730105R91', N'JUAN TIRADO CEJA')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'06982', N'VARM750711KA0', N'MARTHA ARMIDA VALDES RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'07012', N'BOGJ880919BM5', N'JESUS RUBEN BOJORQUEZ GALVEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'07576', N'AOCH570329QP4', N'HUMBERTO ACOSTA CRUZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'07581', N'RUHE770117VB3', N'ERIKA RUELAS HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'07625', N'MOEG761124AL0', N'GEORGINA MORALES ESPINO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'07668', N'FEHR741122DUA', N'RICARDO FELIX HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'07691', N'LUCA580515E22', N'AMADOR LUGO CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'07713', N'RUSJ760330BLA', N'JESUS MIGUEL RUBIO SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'07776', N'PELG560710CN3', N'MARIA GRACIELA PEÑA LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08064', N'AGE1105112J6', N'AGRICOLA LOS GERMAN SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08073', N'LULG740426360', N'GLORIA ALICIA LUGO LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08078', N'LOFL540110FZ2', N'LUCIANO LOPEZ FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08081', N'VIGO540215IY2', N'OSCAR VILLEGAS GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08143', N'RUSJ461125224', N'JESUS RUIZ SOTO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08159', N'BEMR590711EU6', N'ROSENDA BELTRAN MERCADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08160', N'CAVE520629PS9', N'EPIFANIO CARRASCO VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08163', N'CUME640318T97', N'ELIAS CUEVAS MORENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08171', N'GACE770211CK9', N'EDGAR OMAR GAMEZ CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08174', N'JUEL640922P45', N'ELIZABET JUAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08176', N'LORE570722MS3', N'EFRAIN LOPEZ RUBIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08182', N'MOLM7308172N8', N'MARTHA ELISA MORENO LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08183', N'RABE4901248D0', N'MARIA BELEN RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08187', N'VABI4504291Y0', N'ISRRAEL VALDEZ BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08208', N'AUMG7912019N9', N'JOSE GASPAR ANGULO MACHADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08212', N'AELL771012SDA', N'LIRESNA ARMENTA LEAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08220', N'CECC461206SL4', N'CATARINO CERVANTES CERVANTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08222', N'CEVJ690320JW1', N'JUSTINO CERVANTES VERDUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08248', N'OUMO711214EE5', N'OLMES ADAN OSUNA MENDOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08271', N'CALH630921SG4', N'HEPOLINARIO CASTRO LEAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08287', N'GOCR340627267', N'REYNALDO GODINEZ CARRILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08291', N'MAAS751108ID0', N'SALVADOR MARTINEZ ALVAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08324', N'MEOL5007291K7', N'OLGA MENDOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08334', N'MOCA510127V28', N'ANTONIO MORENO CHAVEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08582', N'GAJU830517GK6', N'JULIO CESAR GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08587', N'LOFE800724KHA', N'ESMERALDA LOPEZ FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08591', N'LULR790530FR4', N'ROSA AMALIA LUGO LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08605', N'VIGJ6803159Y9', N'JUAN CARLOS VILLEGAS GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08622', N'CACC490123MB7', N'CELIDA CARRASCO CARO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08653', N'BEBM940422IJ3', N'MIGUEL ANGEL BERUMEN BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08660', N'EIRR4512132Z1', N'RODOLFO ESPINOZA RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08714', N'CULG570625I98', N'GUILLERMO CRUZ LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08770', N'VIVP5803175P3', N'JOSE PATRICIO VILLANAZUL VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08922', N'MIVM620530NH6', N'MARTHA ELVA MIRANDA VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08934', N'CACS710414IJ7', N'SAMUEL CAMACHO CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08935', N'CAME4712014Q8', N'EVERARDO CAMACHO MONTOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08937', N'CADG511104CT2', N'MARIA GUADALUPE CASTRO DOMINGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08970', N'MEVJ681021LT7', N'JORGE MENDIVIL VALENCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08982', N'VIVJ530627TCA', N'JOEL VILLAFAÑA VELAZQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'08985', N'CACX4809264GA', N'AGUSTIN CAMBERO CARRILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09016', N'UIMA710627D34', N'JOSE ANGEL URIAS MORALES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09019', N'LEZR440812MN6', N'ROSENDA GUADALUPE LEYVA ZAVALA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09040', N'LUQP511019EVA', N'PASCUAL LUQUE QUEVEDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09045', N'QUCI450208S79', N'IGNACIO QUEVEDO CAMARGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09046', N'QUCF400215AX1', N'FORTINO QUEVEDO CUEVAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09047', N'QULR530704JI9', N'RAMON QUEVEDO LUQUE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09076', N'GUZF670609RX3', N'FELICIANO GUTIERREZ ZAVALA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09097', N'CORD950612PIA', N'DAVID ALONSO COTA RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09101', N'RILA651228BV3', N'ARTEMIO RIVERA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09243', N'MEMA640321UX3', N'MARTHA CECILIA MEDINA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09271', N'ASC0806308GA', N'AGRICOLA SOTELO CAMACHO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09292', N'PAAR6908318C0', N'RAMON PAEZ ALVAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09295', N'ATE1710072Z5', N'AGRICOLA TEMUYIN SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09297', N'EAAJ750310CA8', N'JOAQUIN ESCALANTE AHUMADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09305', N'BORO660907PR1', N'OLGA LIDIA BOJORQUEZ ROBLES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09309', N'VALB9010311Z8', N'BRINEIDA GUADALUPE VALENZUELA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09339', N'OICM590501EJ9', N'JOSE MANUEL ONTIVEROS CORRALES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09345', N'ROTL831129765', N'LILIANA PAOLA ROCHA TRASVIÑA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09359', N'SAG1710026P5', N'SAYCE AGRICULTORES SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09362', N'AOVR621112SD5', N'RENE ASTORGA VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09371', N'DEX160913UT7', N'DERMOGALENIC EXPERTS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09372', N'GAB020717LK2', N'GRUPO AGROPECUARIO BORBON SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09373', N'OCA040304D71', N'OLIVOS DE CALLEJONES SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09374', N'SBA030807V75', N'SALOMON BORBON AGUILAR SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09375', N'AGE170306AJ8', N'AGROPECUARIA GERCAN SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09376', N'AAC161205QG5', N'ACOPIADORA Y ALMACENADORA COLUMBIA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09377', N'CAR9610152L8', N'CARTOGRAPHIC SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09378', N'PAP160822680', N'PAPTECH SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09379', N'ASC1409126X9', N'AV SHOP CENTER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09380', N'AGU080717BUA', N'AGROPECUARIA LOS GUAYABOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09381', N'SAN060327V14', N'SERVICIOS AGROPECUARIOS NACIONALES AL CAMPO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09382', N'XEXX010101000', N'CASILLO COMMODITIES ITALIA SPA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09383', N'LFI010209G65', N'LUCKY FIRM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09384', N'XEXX010101000', N'MANUFACTURAS POST FORM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09385', N'AAN110413TG1', N'AGRICOLA ANDEAL SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09387', N'GFO090318SX5', N'GRUPO FOMENTI SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09388', N'AME990310DP4', N'ALPLA MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09389', N'NSS100713163', N'NATURAL SCENTS STORE S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09390', N'CLM710305QF2', N'COMPAÑIA DE MOTORES DOMESTICOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09391', N'IDI990810MC4', N'TERMINAL LOGISTICS DISTRIBUCION SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09393', N'OUGP661028FK6', N'PEDRO MARIO OSUNA GUZMAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09394', N'DCS150115331', N'BANCO SABADELL,S.A., INSTITUCION DE BANCA MULTIPLE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09395', N'CEMM630103UX2', N'MARIO ALBERTO CERVANTES MARTINEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09396', N'GAG161216EWA', N'VITERRA AGRICULTURE DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09397', N'GPS170403DAA', N'GRANJA PORCINA LA SOLEDAD SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09398', N'GPG160928P38', N'GRANJA PORCINA LOS GIRASOLES SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09399', N'UWO120511G57', N'ULTRAORGANICS WORLDWIDE SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09400', N'NCM920527KH7', N'NOVELTY CORP DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09401', N'FME860128GR5', N'FOTORAMA DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09402', N'INE911127JG1', N'ARTECHE NORTH AMERICA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09403', N'PRV970922FP0', N'VILLA SANTILLANA SPR DE RL')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09404', N'SME980702916', N'BOLLORE LOGISTICS MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09405', N'TMA9411011R3', N'TERMINAL MARITIMA DE ALTAMIRA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09406', N'ELO1010019E5', N'ENVIPAQ LOGISTICS S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09407', N'ALI1403116M2', N'AGROINDUSTRIAL LIDERLAC SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09408', N'GRU991206157', N'CARTERA GANADERA RUBIO S SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09409', N'IMI9709082M5', N'INDUSTRIAS MICHELIN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09410', N'PFM070918TTA', N'PERFORMANCE FIBERS OPERATIONS MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09411', N'ZLM170202SX2', N'ZAFCO LLANTAS MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09412', N'GBM11062273A', N'GIANT BICYCLE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09413', N'STT180502LB6', N'SCOOTERS Y TRICICLOS TITAN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09414', N'SABA830905JZ6', N'ALONSO ENRIQUE SAUCEDO BURQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09415', N'XEXX010101000', N'PARK-OHIO PRODUCTS INC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09416', N'XEXX010101000', N'ANCHOR BRAKE SHOE CO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09417', N'LMM071203LC6', N'LABORATORIOS MAVER DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09418', N'PDI070117ST6', N'PRODUCTOS DIDASEL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09419', N'GOCV880307L64', N'VANESSA ELIZABETH GOMEZ CERVANTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09420', N'MRS140815CA5', N'MODULO DE RIEGO SALVATIERRA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09421', N'LIC071025SW1', N'LOGISTICS INTEROCEANICA DE CARGA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09422', N'AAG180718U22', N'AVOCADOS AGUIRRE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09423', N'CMO161107251', N'CLOE MODA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09424', N'XEXX010101000', N'PEER BEARING CO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09425', N'WME980604B74', N'WABTEC DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09426', N'WMM1307249QB', N'WABTEC MANUFACTURING MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09427', N'ARA140611CR1', N'AGROEMPRESAS LA RAZA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09428', N'NWM9709244W4', N'NUEVA WAL MART DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09429', N'VENJ590507BZ2', N'JAIME VEGA NUÑEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09430', N'DBK0205305Q7', N'DISTRIBUIDORA BAHIA KINO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09431', N'PETJ850323336', N'JOSE PEREZ TELLEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09432', N'BNX0007241X8', N'BIOMIN N A SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09433', N'NAME791013AK4', N'MARIA ELENA NAVARRETE MANZO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09434', N'ADE0410146T1', N'ALGODONEROS DEL DESIERTO SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09435', N'DBM11011043A', N'DEUTSCHE BANK MEXICO SA INSTITUCION DE BANCA MULTIPLE DIVISION FIDUCIARIA F/1401')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09436', N'PDE1506038J8', N'PROCESADORA DEL DESIERTO SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09437', N'CGG130820C36', N'COMERCIALIZADORA EL GUERO GIL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09438', N'GSS180316C46', N'GOCA SOLUCIONES Y SERVICIOS EMPRESARIALES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09439', N'POL840116AS2', N'POLYCHEM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09440', N'EBI140121MB1', N'EURO BILT SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09441', N'ISM050826AZ3', N'INTEGRAL DE SERVICIOS MADEREROS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09442', N'ARA170210DL5', N'AGROALMACENADORAS RAMIREZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09443', N'DIP1002096W7', N'DIPEMI SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09444', N'MTI990726494', N'CROSSMOTION LOGISTICS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09445', N'FIN870710Q40', N'FERRETERIA INDAR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09446', N'CVA990426HT9', N'COMERCIALIZADORA DE VALOR AGREGADO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09447', N'CPR0008233W6', N'CARTERA CAIMAN PRODUCTS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09448', N'MET001004LX0', N'METECNO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09449', N'PPE080125REA', N'PRODUCTOS PESQUEROS DEL EVORA SC DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09450', N'GOCA870607SB4', N'ALAN GOMEZ CALDERON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09451', N'AGA080603CB9', N'AGRO GALI SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09452', N'IIM060908H33', N'CARTERA IMM INOX MARKET MESSICO S.A DE C.V)')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09453', N'AEBL700204TE9', N'JOSE LUIS AKE BURGOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09454', N'JAT130401M59', N'JICOTILLO DE ATOTONILCO SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09455', N'AVE101209PW8', N'ATMOSPHERA VERDE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09456', N'SIL1108115W5', N'SILOGISTICS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09457', N'XAXX010101000', N'JABIL INC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09458', N'SOU80101012A', N'SOURCEABILITY NORTH AMERICA LLC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09459', N'SME000303KAA', N'SOLVAY MEXICANA S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09460', N'PSC860516U2A', N'PRODUCTOS SANE DE CHAPALA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09461', N'LMO080401895', N'VIRTUS PRECISION TUBE S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09462', N'UME101208GA1', N'UNIPROVA DE MEXICO S.A DE C. V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09463', N'HEHM640929QE9', N'MIGUEL HERNANDEZ HERRERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09464', N'MIR010507RL4', N'EKO MOBILITY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09465', N'CAAH870406N61', N'HECTOR CHAVEZ ALVAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09466', N'IANI580926219', N'ISMAEL ANTONIO IBARRA NAVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09467', N'API170529D15', N'ALGODONERA LOS PIONEROS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09468', N'PME9706198Y2', N'PERONDA MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09469', N'XEXX010101000', N'CIRCOR ENERGY PRODUCTS INC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09470', N'CME160407K36', N'CIRCOR MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09471', N'ACE060911TU8', N'APLICACIONES DE CABLEADO ESTRUCTURADO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09472', N'ISE860228G83', N'INDUSTRIAS SERGAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09473', N'GAV090305DD9', N'GRUPO ACOPIADOR 24 DE AGOSTO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09474', N'TOC160510F10', N'TEAM 84 SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09475', N'AIC171129UAA', N'AGROECOLOGÍA INTENSIVA PARA EL CAMPO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09476', N'SLA180123R24', N'SERVICIOS LOGISTICOS ACOSTA KNEELAND SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09477', N'SDI5204223S9', N'SUPER DIESEL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09479', N'BGA831024IY2', N'CARTERA BODEGA DE GRANOS EL ALAZAN Y EL ROCIO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09480', N'CPM0407151WA', N'CENTRAL DE PESCADOS Y MARISCOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09481', N'SAAR950826FH8', N'RODOLFO SANCHEZ ACOSTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09482', N'CBO000622MP9', N'CARTERA CONCENTRADOS BOVILAC SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09483', N'PGJ110419US5', N'PRODUCTORES DE GRANOS JANTETELCO MORELOS S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09484', N'ALT141126M60', N'ALTIBAJA SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09485', N'SSU850523QJ8', N'SOLDADURAS Y SUPERALEACIONES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09486', N'ARG840523EW9', N'COMPAÑIA AZUCARERA DEL RIO GUAYALEJO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09487', N'IMA9211033S4', N'INGENIO EL MANTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09488', N'ITA840522FS4', N'INGENIO TAMAZULA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09489', N'DPC940701N56', N'CARTERA DON PEPE COFFEE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09490', N'CAG090914CN9', N'EL CAMPO AGROPECUARIA S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09491', N'UAM140522Q51', N'UNION ALGODONERA MOCTEZUMA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09492', N'CAM0007314M8', N'CALENTADORES DE AMERICA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09493', N'PUR090609AR6', N'PURO PISO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09494', N'AJU080901NP1', N'CARTERA AGROINDUSTRIAS JUANCAR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09495', N'OLO0311219W2', N'OLHMAN LOGISTICS S.A. DE  C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09496', N'HPA180202DB7', N'HARINERA PANAMERICANA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09497', N'MOGJ731228P42', N'JORGE LUIS MORALES GALAZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09498', N'RPL930422267', N'RANCHO PRODUCTOR DE LECHE ZARAGOZA HERMANOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09499', N'BCO911113VD7', N'BH COMERCIALIZADORA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09500', N'PNO0108017E3', N'CARTERA PROCESADORA LA NOGALERA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09501', N'ASP990306574', N'CARTERA AGRO SERVICIOS A PRODUCTORES DEL VALLE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09502', N'SAHJ610612PN2', N'JUAN JOSE SAENZ HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09503', N'CSE121026CG3', N'COMERCIALIZADORA SERVIGOSO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09504', N'AAE161215EC5', N'AGRO ALMACENADORA ESPECIAS MOY SAPI DE CV')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09505', N'AUU140325MA3', N'AGROINDUSTRIAL UUMBAL SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09506', N'TME111221LI3', N'SAFRAN HELICOPTER ENGINES MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09507', N'PAM1706122X9', N'PRODUCTOS ARECA DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09508', N'KIP170113PVA', N'KIPSERV SC DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09509', N'INV070330CD9', N'CARTERA INVERTAPIAS S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09510', N'XAXX010101000', N'CARTERA EL CAMPO AGROPECUARIA S DE PR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09511', N'AAL910305U62', N'ARGO ALMACENADORA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09512', N'GAVH850917MB7', N'HUMBERTA GALLARDO VARGAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09513', N'AUER931204185', N'ROSA FERNANDA AGUAYO ESPINOSA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09514', N'ASE1401083Q8', N'CARTERA AMATISTA SEAFOOD SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09515', N'BMA1003314Q0', N'CARTERA BONISIMO DEL MAR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09516', N'ANI110815BJ4', N'COOPERATIVA LAS ANIMAS SC DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09517', N'BNM840515VB1', N'BANCO NACIONAL DE MEXICO SA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09518', N'PME051206NG5', N'PUBLICACIONES METROPOLITANAS SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09519', N'KCA150708KVA', N'KSMV CAPITAL SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09520', N'BIN940223KE0', N'BANCO INVEX SA INSTITUCION DE BANCA MULTIPLE INVEX GRUPO FINANCIERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09521', N'XEXX010101000', N'VIRTUS PRECISION TUBE LLC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09522', N'AEN170628D69', N'ALGODONERA ENCINILLAS SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09523', N'TBL170710QL1', N'TAGLE BLINDER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09524', N'PMP1612162E7', N'POET DE MEXICO PRODUCTS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09525', N'GAGJ81101589A', N'JESUS PAUL GARCIA GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09526', N'RIMM750618BDA', N'MONICA RIOS MORALES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09527', N'ACO941024FG4', N'ACCEL COMERCIAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09528', N'ZLM120906H43', N'ZAT LOGISTICS MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09529', N'BRS051121T74', N'BIENES RAICES SAN ANTONIO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09530', N'SPR180305MU5', N'SPRAYGROUND SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09531', N'SLB080903DM3', N'SEMILLAS LEMUS DEL BAJIO MICHOACANO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09532', N'KME080128I90', N'KINETEK DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09533', N'IPA110601IV7', N'INGENIO PANUCO SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09534', N'SAGM890301UYA', N'MIGUEL ANGEL SAMPERIO GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09535', N'TME090515PC0', N'TERRAFERTIL MEXICO SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09536', N'MUSJ741216B42', N'JAIME ALBERTO MUÑIZ SANTILLAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09537', N'VWI130905IV6', N'EVEREST WINES AND SPIRITS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09538', N'SISM7204261M4', N'MARICELA SILVA SALAZAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09539', N'ZEGA820102LP4', N'ALDO SALVADOR ZEPEDA GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09540', N'DIND890901A28', N'DANIEL DIAZ NAVARRETE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09542', N'GOHM740915JI6', N'JOSE MIGUEL GONZALEZ HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09543', N'CABL8104048VA', N'LAZARO CARRAZCO BARRAZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09544', N'MUMA600427847', N'ALBERTO EDUARDO MUNGUIA MACIAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09545', N'PRM960215AZ6', N'PERNOD RICARD MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09546', N'XEXX010101000', N'ZHEJIANG SHIDAI CASTING CO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09547', N'IQU440510SQ3', N'INGENIO QUESERIA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09548', N'XEXX010101000', N'ARUNA ALLOY STEELS PVT. LTD')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09549', N'XEXX010101000', N'JIASHAN SINHAI PRECISION')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09550', N'XEXX010101000', N'BAKGIYAM ENGINEERING PVT LIMITED')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09551', N'XEXX010101000', N'AQUASUB ENGINEERING')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09552', N'XEXX010101000', N'LISHUI OUYI VALVE CO. LTD')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09553', N'XEXX010101000', N'VEEYES ENGINEERING PRIVATE LIMITED')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09554', N'XEXX010101000', N'LIYUAN INTERNATIONAL INDUSTR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09555', N'XEXX010101000', N'SATYAY TECHNOCAST PVT LTD')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09556', N'XEXX010101000', N'SUEERAA ALLOYS GLOBAL PVT LTD')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09557', N'XEXX010101000', N'SUZHOU DONGSHAN YOUHUA MACHINERY CO. LTD')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09558', N'XEXX010101000', N'SUZHOU YUEJIA MACHINERY CO LTD')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09559', N'XEXX010101000', N'FUNING ZHONGZHOU VALVE CO LTD')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09560', N'XEXX010101000', N'SUZHOU XINRUN MACHINERY MANUFACTURING CO LTD')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09561', N'XEXX010101000', N'SUZHOU TONGSHUN MECHANICAL & ELECTRICAL MANUFACTURE CO LTD')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09562', N'XEXX010101000', N'JIANGSU XUSHI MACHINERY MANUFACTURING CO LTD')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09563', N'XEXX010101000', N'SUZHOU SIP STARD AUTOMATION CO LTD')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09564', N'XEXX010101000', N'JIANGYIN GREAT METAL PRODUCTS CO LTD')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09565', N'XEXX010101000', N'SUZHOU ENVIL MACHINERY CO LTD')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09566', N'UAA181022H76', N'UUDS AERO AMERICA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09567', N'DME090609CL2', N'DEIMOS MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09568', N'XAXX010101000', N'RAVAGO SERVICIOS ADMINISTRATIVOS DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09569', N'FMA130810LE8', N'FINCA MONTE AZUL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09570', N'BEM9706255S2', N'BENCHMARK ELECTRONICS DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09571', N'CAM100625J29', N'CODIGO AMBAR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09572', N'XEXX010101000', N'TCCI MANUFACTURING LLC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09573', N'VEMJ600308R30', N'JUAN MANUEL VELASCO MONTERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09574', N'PEX570708IM2', N'PHARMACOS EXAKTA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09575', N'MOGI780611AY7', N'ISMAEL MOLINA GOMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09576', N'CGS140614EI9', N'COMERCIALIZADORA DE GRANOS SOTO S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09577', N'DPN9607129T6', N'DISTRIBUCIONES PLASTICAS DEL NORTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09578', N'BRS180328IA1', N'BAYWA RE SOLAR SYSTEMS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09579', N'LME110606PE0', N'LIUGONG MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09580', N'PIN740528CT1', N'PRODUCTOS INDUSTRIALIZADOS DEL NOROESTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09581', N'ECI920107SGA', N'COMPAÑÍA DE EQUIPAMIENTO AL COMERCIO INTEGRAL S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09582', N'ATI1308095D7', N'ALMACENADORA TIM S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09583', N'BIM150528M38', N'BENSI IMPORTS SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09584', N'UMT130610RGA', N'UBER MEXICO TECHNOLOGY & SOFTWARE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09585', N'RJA100506B34', N'REFRIGERADOS JALNAY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09586', N'TOBS350728CE4', N'SALVADOR TORRES BARAJAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09587', N'RLO150514F92', N'RICE LOGISTICS S.A. DE C.V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09588', N'BBE151118JP7', N'BRITISH BEERS SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09589', N'MSL890327I6A', N'UNI - TRADE BROKERS LOGISTICS SC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09590', N'ELE041112TW9', N'ELECTRONICSMDX S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09591', N'RESF7012135G8', N'FABIAN REA SOLIS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09592', N'RHU090714FL4', N'REAL HUANIMARO S.P.R. DE R.L.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09593', N'MIN161128GJ4', N'MERLINAS INC COMPANY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09594', N'OPE171110R1A', N'OPERGRAN S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09595', N'ISO100622UW8', N'IMPORTACIONES SOARMA S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09596', N'SAM081211682', N'SERVICIOS AVANZADOS DE MANTENIMIENTO INDUSTRIAL DEL NORESTE S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09597', N'BSM121106TY1', N'BASTIAN SOLUTIONS MEXICO S.A DE C.V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09598', N'XEXX010101000', N'NP SHELLING OPERATIONS LLC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09599', N'MVA390512KL0', N'MOLINERA DEL VALLE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09600', N'GLG171207S61', N'GRUPO LUGGO GLJ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09601', N'MHR500322HM9', N'MOLINO HARINERO EL ROSAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09602', N'HAN850621583', N'HARINERA ANAHUAC SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09603', N'ICF181030TF5', N'INDUSTRIAS CAMPO FRESCO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09604', N'MMA001202GW4', N'MIELES DEL MAYAB S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09605', N'ESU160914V95', N'ECOTECNOLOGIAS SUNLIGHT S DE RL DE CV')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09606', N'GPA991211DS5', N'GRANEROS PADILLA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09607', N'FCS180604CC8', N'FRONTIER CARGO SERVICE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09608', N'AAMA880915TB5', N'ABRAHAM ASSA MASLIAH')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09609', N'GCO0303128G0', N'GRUPO CONVERMEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09610', N'SPM171010BS4', N'SAQUE Y PAGUE MULTISERVICIOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09611', N'XEXX010101000', N'KIBAR AMERICAS INC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09612', N'PMM990518CG8', N'PRINCE MANUFACTURING DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09613', N'BRA1603043M1', N'BRAKAISA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09614', N'AGR1804121M7', N'AGRANS SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09615', N'PME780907754', N'PANASONIC DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09616', N'FEMJ461218UD2', N'JORGE ENRIQUE FERNANDEZ MARTIN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09617', N'PNH901016CE0', N'PRODUCTORA NACIONAL DE HUEVO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09618', N'POAS6012275X0', N'SERGIO WILBERT POOT AKE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09619', N'GOCE671228KI9', N'ENRIQUE GOMEZ CANDELARIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09620', N'LNI150219AL2', N'LOGISTICA NISA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09622', N'VAR140523PD0', N'VARDE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09623', N'AFM170615M77', N'ANDINA FREIGHT MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09624', N'AGP140910CY0', N'AGROINDUSTRIAS GP SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09625', N'PEG170907426', N'PAPEL Y EMPAQUES GONDI MONTERREY S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09626', N'PDV140214KH6', N'PASSIONE DE VINO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09627', N'LOG161014RH4', N'LOGISTRAP SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09628', N'RAME660423NA8', N'ELBA RAMOS MERITO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09629', N'SMC18112748A', N'SOPREMA MATERIALES DE CONSTRUCCION DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09630', N'DCM1808096Q3', N'DOMO CHEMICALS MEXICO S.A.P.I DE C.V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09631', N'TAI660817S90', N'INTERCARGO 365 SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09632', N'FRI030731270', N'FRISACEL S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09633', N'FGR121121MN6', N'FABELAS GRAIN SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09634', N'SAM190119LT9', N'SEGURIDAD ALIMENTARIA MEXICANA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09635', N'MLI830509AH4', N'MUEBLES LIZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09636', N'PAG160718UI3', N'PANIAGUA & GUTIERREZ CORPORATIVO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09637', N'BLM570301JJ5', N'BECKMAN LABORATORIES DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09638', N'ZME970818QB8', N'ZEBRA MEXICO S. A DE C.V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09639', N'RME050919G20', N'RENOLIT MÉXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09640', N'SLE9803135V4', N'SERVICIO DE LOGISTICA EMPRESARIAL Y COMERCIAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09641', N'LAN081028EK8', N'LANDERVAL SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09642', N'ALI081009RM7', N'AG LIGHTING SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09643', N'DPM131023QCA', N'DAB PUMPS DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09644', N'CSJ170517I39', N'COMERCIALIZADORA SASE JB SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09645', N'SME7811306Z7', N'SIKA MEXICANA S.A DE C.V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09646', N'PPA960517LZ1', N'CARTERA PESCADERIA EL PACIFICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09647', N'ASN9802176F9', N'CARTERA ALMACENES Y SERVICIOS DEL NOROESTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09648', N'ISO9712186F0', N'IMAGENES Y SOLUCIONES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09649', N'JORR8307238Q2', N'RICARDO JOHNSON RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09650', N'XEXX010101000', N'STONEX COMMODITY SOLUTIONS LLC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09651', N'DDG121221KR8', N'DISTRIBUIDORA DON GUSTAVO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09652', N'EUR030922SD6', N'EUROMEDIOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09653', N'FFR810330JX9', N'FERRETERIA LA FRAGUA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09654', N'VMA001114CF2', N'VINOS Y MAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09655', N'ICE150313MU7', N'IMPORTADORA COOPER EXPRESS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09656', N'KME160304F71', N'KEURIG MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09657', N'AQU8311173I2', N'COMPAÑIA AGROINDUSTRIAL QUERETANA S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09658', N'KME511226R99', N'KELLOGG DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09659', N'MOS130816875', N'MULTILIN OVERSEAS SOLUTIONS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09660', N'ICM1307265B4', N'IRON CLAN MOTORS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09661', N'HCL100215L59', N'HIKER CARGO LOGISTICS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09662', N'PEA0303203V5', N'PROCESAMIENTO ESPECIALIZADO DE ALIMENTOS SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09663', N'CARO800204DZ0', N'OSCAR HUGO CARLIN RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09664', N'MET001004LX0', N'CARTERA METECNO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09665', N'PMG110202LL5', N'PRODUCTORA Y MAQUILAS DE GOMAS RESINAS DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09666', N'JMA050817UA2', N'JUEGOS Y MAQUINARIA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09667', N'CAD080422B24', N'CULTIVO AGRICOLA DYDYSA S DE PR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09668', N'CUDS801123TQ9', N'SERGIO ARTURO CRUZ DIAZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09669', N'CPC990504VA7', N'COMERCIALIZADORA DE PESCADOS Y CAMARONES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09670', N'DCI1906217Q0', N'DESARROLLADORA DEL CAMPO INDIGENA SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09671', N'ZUFA7503168X6', N'ANA LIVIER ZUÑIGA FLORES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09672', N'AME190827D18', N'AUTOPARTES MEG SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09673', N'SAPD900405P22', N'JOSE DANIEL SANDOVAL PULIDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09674', N'TOMB6810069W3', N'BRAULIO TORRES MORFIN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09675', N'RORC761007K78', N'CARLOS ALBERTO RODRIGUEZ RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09676', N'MAOS810925E94', N'STEVEN MAYA OCHOA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09677', N'AMI791127P51', N'GTG LOGISTICS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09678', N'KME08061895A', N'KTM-SPORTMOTORCYCLE MEXICO S. DE R.L. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09679', N'ALM9910114D6', N'AB&C LEASING DE MEXICO SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09680', N'KRI100129BP9', N'KRISHKA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09681', N'UME1403247U5', N'ULTRAFRIO DE MÉRIDA S.A.P.I. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09682', N'GRO1703314K1', N'GRUPO ROSLEIN SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09683', N'RAI010613LW1', N'RAILPORT SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09684', N'CMO990720SX8', N'CEMENTOS MOCTEZUMA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09685', N'CMA810422UH5', N'CEBADAS Y MALTAS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09686', N'ZCA1707247A1', N'ZULU CAPITAL SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09687', N'CCA960711IA0', N'CONGELADORA CASTILLO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09688', N'MLO1808298L4', N'MHI LOGISTICS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09689', N'HVM161216851', N'HUNTER VENTILADORES DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09690', N'CCM150703HY9', N'CTS CEMENT MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09691', N'GCO110610UK8', N'GRUPO CONOCIDO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09692', N'ACP990511LF9', N'ANIMAL CARE PRODUCTS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09693', N'GOCF7202129G4', N'FERNANDO GOMEZ CANDELARIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09694', N'PRS090813E46', N'PROCESADORA RIO SAN PEDRO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09695', N'BVM951002LX0', N'BANCO VE POR MAS INSTITUCION DE BANCA MULTIPLEGRUPO FINANCIERO VE POR MAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09696', N'XEXX010101000', N'HANCHETT PAPER COMPANY')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09697', N'CCO910527223', N'CARTERA COMERCIALIZADORA COLUMBIA SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09698', N'AMA020408R95', N'ALMACENADORA Y MAQUILAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09699', N'MFO091021EF6', N'MACROPRODUCTOS FORRAJEROS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09700', N'WOL171114IH2', N'WOLSTRAT SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09701', N'CNO150702PP7', N'CARTERA COMERCIAL NOGALERA S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09702', N'AQU831117312', N'(NO USAR) COMPAÑIA AGROINDUSTRIAL QUERETANA S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09703', N'PBE900712TV4', N'PEÑAFIEL BEBIDAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09704', N'RSA110119HSA', N'CARTERA RL SEMILLAS Y AGRONEGOCIOS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09705', N'AIA890811J76', N'ALMACENADORA INTER AMERICANA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09706', N'RIRE810117HE6', N'EDGAR RIVERA REYES')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09707', N'ANG101215PG0', N'ANGUIPLAST SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09708', N'IFO060313MD0', N'INOVA FOODS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09709', N'IMA150324D65', N'CITYPLASTICOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09710', N'API950622T18', N'ALMACENES Y PUERTOS INTEGRADOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09711', N'MOHL940615G3A', N'JOSE LUIS MONTES HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09712', N'CGM1311089J2', N'COMERCIALIZADORA DE GRANOS MEDEL S.P.R DE R.L')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09713', N'APE170520192', N'ALGODONERA LA PERALTA SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09714', N'IGM16100344A', N'INTERBLOCK GAMING MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09715', N'BIO060602TK4', N'BIOSCENTS SC DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09716', N'AME050720JE6', N'AGRICULTURA MEXICANA EMPRESARIAL SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09717', N'SALE720603V92', N'EUGENIA SANCHEZ LUNA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09718', N'SEHJ8505227P0', N'JUAN DIEGO SERRANO HUERTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09719', N'CAEA4402202NA', N'JOSE ALBERTO CAMPOS ENCINES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09720', N'CZE060330HK9', N'CONSTRUCTORA ZERPA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09721', N'GOGL881202LIA', N'LUZ ARCELIA GODINEZ GALVEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09722', N'AAG1505283C9', N'ALGODONERA LAS AGUILAS SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09723', N'GEN080905861', N'GREENERGY ENERGIA NO CONVENCIONAL S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09724', N'CIB101126BW1', N'COMERCIALIZADORA IMPORTADORA DE BELLEZA NEW SENSATION SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09725', N'ALI1106142R7', N'AIGX LOGISTICA INTERNACIONAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09726', N'PMM1612086I2', N'PV MANUFACTURING MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09727', N'SADF721128QPA', N'FERNANDO SANCHEZ DOMINGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09728', N'ZEN0804216J8', N'ZENTH SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09729', N'TSC920130MH9', N'B&B LOGISTICS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09730', N'QIT161216CD4', N'Q&G INTERNATIONAL TRADING SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09731', N'ADU110531DB7', N'ALMACENADORA Y DISTRIBUCION UNIVERSAL SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09732', N'AME900814LM3', N'ANIXTER DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09733', N'SGE151015FP8', N'SERVICIOS GENERALES ENEMED SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09734', N'MME960722RT3', N'MIEL MEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09735', N'XEXX010101000', N'VSSA COMMODITIES LLC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09736', N'DTR160203G42', N'DEUTEX TRADING SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09737', N'EME0204237P0', N'E.J.B. DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09738', N'FEPF761029617', N'FAUSTO JAVIER FERNANDEZ PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09739', N'PLH86093081A', N'PAPELERIA LOZANO HERMANOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09740', N'ALT9310089F9', N'ALTECSA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09741', N'ALO171009TZ1', N'AV2 LOGISTICS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09742', N'FAS1504114C9', N'FASTFREIGHT S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09743', N'NLA820723FL4', N'NATTURA LABORATORIOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09744', N'FTE821028NW5', N'FERTILIZANTES TEPEYAC SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09745', N'GSJ1407252S5', N'GRANEROS SAN JORGE S.P.R DE R.L. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09746', N'PSI9609192FA', N'PRO SIL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09747', N'MDT171214NW2', N'MOVE 2 TRADE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09748', N'ASB810317293', N'AGROPECUARIA SIMON BOLIVAR SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09749', N'BTM000619AKA', N'BEKAERT TRADE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09750', N'SGC970619L65', N'SUN GRAIN COMERCIAL S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09751', N'MSJ8501018P0', N'MUNICIPIO DE EL SALTO JALISCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09752', N'IDC130905B78', N'IMPORTADORA DE DISEÑOS CARUVE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09753', N'IDM100712Q13', N'IMPORTADORA DE DISEÑOS DE MODA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09754', N'PDA970904NK1', N'PRODUCTOS Y DISTRIBUIDORA AZTECA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09755', N'BAG100225RL7', N'BAJA AGRIBIZ S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09756', N'PAD140814SJ8', N'PACIFIC & DISTRIBUCION SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09757', N'GOM011229I62', N'GRUPO OPERADOR MULTIMODAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09758', N'TEC170124LB1', N'TECNODORAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09759', N'BWI031024FV9', N'VANT EXGON SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09760', N'PAR140205696', N'PRODUCTORES AGRICOLAS DEL RIO LERMA S.P.R. DE R.L')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09761', N'PAU011121AF1', N'PEAK AUTOMOTRIZ S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09762', N'GHA0708211B8', N'GESTION HILCO- ACETEC S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09763', N'ISM130612ER3', N'INV SYSTEMS MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09764', N'CMC170327LW6', N'CH MAS CLUSTER SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09765', N'PCC991014SA9', N'PROCESADORA Y COMERCIALIZADORA CAMPEROS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09766', N'SSM0101235T6', N'SAMSUNG SDS MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09767', N'PEA0303203V5', N'CARTERA PROCESAMIENTO ESPECIALIZADO DE ALIMENTOS SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09768', N'MME960722RT3', N'CARTERA MIEL MEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09769', N'GAE150212T7A', N'GRANOS Y ALIMENTOS ESPECIALIZADOS, S. DE R.L. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09770', N'ZUDM670628E91', N'MARICELA ZUÑIGA DELGADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09771', N'AME051208JD9', N'ATYDE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09772', N'LIM180222IL3', N'LH IMPORTS DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09773', N'OORE640303HJ9', N'EDGAR FABIAN OROZCO RUIZ VELASCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09775', N'GCS1110105J0', N'GRUPO COMERCIAL SIME Y SCCARVH SA DE CV SOFOM ENR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09776', N'CALC720102JC2', N'CRUZ OMAR CAMPOS LEPE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09777', N'CCA180615EB1', N'CELERITAS CARGO SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09778', N'JURP900523RN2', N'PASCUAL JUSTO REYES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09779', N'AGL070629E77', N'ASOCIACION GANADERA LOCAL ESPECIALIZADA PARA EL FOMENTO Y LA EXPLOTACION PECUARIA DE LAGOS DE MORENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09780', N'APH091014R96', N'AGRO PRODUCTOS DE HOPELCHEN SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09781', N'PRO820519TM6', N'PROQUIGAMA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09782', N'TVC060802NE4', N'TVCENLINEA.COM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09783', N'CVF190507M85', N'CARNICOS VERDURAS Y FRUTAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09784', N'FGR130226682', N'FEJCEM GROUP SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09785', N'CCO180126EX2', N'COEF CONSTRUCCIONES S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09787', N'ACI1109069A1', N'AGRICOLA CHITA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09788', N'LOMA770111GW3', N'ARMANDO VALENTE LOPEZ DE LA MORA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09789', N'RIAD550221GV2', N'DOLORES DE JESUS RIOS AVILES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09790', N'IULF450205ID2', N'FELIPE DE JESUS ITURRIOS LEYVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09791', N'FAAL440702BP9', N'JOSE LUIS FAVELA ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09792', N'GAAJ930424ID6', N'JUAN DAVID GAXIOLA ASTORGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09793', N'VASL400115MW1', N'LEOPOLDO VALDEZ SANDOVAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09794', N'LQH9606199N6', N'LOPEZ QUIÑONEZ HERMANOS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09795', N'LEGL731229VDA', N'LUIS ANTONIO LEYVA GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09796', N'LUVM500207FD2', N'MANUEL DE JESUS LUGO VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09798', N'RUYJ710202DL2', N'MARIA DE JESUS RUIZ YUCUPICIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09799', N'GAEA741228N66', N'MARIA DE LOS ANGELES GALVEZ ESCALANTE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09800', N'HECM550425RR3', N'MARTHA OFELIA HERNANDEZ CUADRAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09801', N'PEMR591007UK7', N'ROSARIO PEÑUELAS MERCADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09802', N'LOGJ380115LM9', N'JUVENCIO LOPEZ GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09803', N'RIAA401101ES3', N'ANTONIO RIOS ANDRADE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09804', N'RIAD460218QM0', N'DANIEL RIOS ANDRADE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09805', N'RASE611014QJ3', N'ESTEBAN RAMIREZ SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09806', N'PAMJ480630DV0', N'J. BELEN PALOMARES MORALES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09807', N'AOSJ680914TG0', N'JOSE JAVIER ASTORGA SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09808', N'LEME551115IG2', N'MA. ELVIA LEON MEDINA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09809', N'MIVG610401CR3', N'GLORIA MIRANDA VALENZUELA')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09811', N'ZAAM451101JF2', N'MANUEL DE JESUS ZAVALA ABOYTE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09812', N'DUSH500919SP0', N'HILARIO DUARTE SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09813', N'EIOE880115S27', N'ESTEBAN ESPINOZA OLIVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09814', N'EISE550901L98', N'ESTEBAN ESPINOZA SALINAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09815', N'OIAL600705H49', N'LETICIA OLIVA ARREOLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09816', N'CAGX5303275E8', N'OCTAVIANO CAZAREZ GASTELUM')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09817', N'SOMF4802284Z2', N'FAUSTO SOSA MONTOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09818', N'MOAR241110JP2', N'MARIA DEL ROSARIO MONTOYA ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09819', N'SOMM640626GS7', N'MARTIN SOSA MONTOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09820', N'AEBI670730HP0', N'ISMAEL ARCE BELTRAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09821', N'AELI3803068V5', N'ISMAEL ARCE LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09824', N'LOM170927DY2', N'LOMAGRO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09825', N'CSM080612JQ9', N'CONSERVANDO EL SABOR MEXICANO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09826', N'APS810623IUA', N'AGROPECUARIA EL PORVENIR SOCIEDAD COOPERATIVA DE CONSUMO AGRARIO S.C.L.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09827', N'PARG800218AI9', N'GUILLERMO PADILLA RUBIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09828', N'AFC041215J12', N'AGROPECUARIA FINANCIERA SA DE CV SOFOM ENR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09829', N'GAY080521FE6', N'GRUPO AGRICOLA YAQUIMA S.P.R DE R.L.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09830', N'RAG151201C47', N'RAJA AGROINDUSTRIAL S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09831', N'AUR130715HD9', N'AGROPRODUCTORES URIAS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09832', N'GUSA440331RN9', N'ALFREDO GUTIERREZ SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09833', N'AAOB5901119Z3', N'BLANCA IRENE ALCANTAR ORTIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09834', N'CAGC941026AN1', N'CARLOS ALAN CASTRO GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09835', N'AGC141016BB5', N'AGRICOLA GAXIOLA CORTEZ SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09836', N'ACA180820BQ5', N'AGRICOLA CAPOMAS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09837', N'JAGE471201QXA', N'ELIGIO JAVALERA GIL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09838', N'CAQA4910105L8', N'AGUSTIN FEDERICO CANO QUIROS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09839', N'GACA970622CG6', N'AMAIRANY YAMILETH GAXIOLA CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09840', N'CAVB920906BY7', N'BRAULIO CASTRO VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09841', N'AJE151026KHA', N'AGRICOLA JESREY SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09842', N'LUOC361003AV4', N'CANDIDO LUQUE ORTEGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09843', N'GALC510703TG5', N'CONSTANCIO GAMEZ LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09844', N'ACU170617PBA', N'AGRICOLA LOS CUADRITOS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09845', N'MEVE730807DK0', N'ELIAZAR MENDEZ VITAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09846', N'GURE330715HB2', N'ENRIQUE GUERRERO ROCHIN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09847', N'ATE040612DVA', N'AGROPECUARIA LOS TEJONES SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09848', N'CAAA5708288Z8', N'AGUSTIN CHAVEZ ACOSTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09849', N'LUCA850331I25', N'ANUAR LUGO CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09850', N'AELB961218J50', N'BRAYAN ALEJANDRO ARCE LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09851', N'GAPC530601RN6', N'CARMEN GAMEZ PEREA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09852', N'LULC810111PC6', N'CESAR IVAN LUGO LARA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09853', N'BEBD820813442', N'DAGOBERTO BELTRAN BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09854', N'CAMD830321DD6', N'DAMASO CHAN MORENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09855', N'REVD851104JD5', N'DANIEL RENTERIA VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09856', N'LOUE840429AH6', N'EDGAR GUADALUPE LOPEZ URIAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09857', N'AOGE8210113I7', N'EDI ALONSO ACOSTA GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09858', N'UIEL340519KQ5', N'ELEUTERIA URIAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09859', N'AMS090807LS6', N'AGRICOLA MY SUKY SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09860', N'LUVE540401IC0', N'ELIGIO LUGO VALLE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09861', N'AWI080715KG8', N'AGRICOLA WILLIAM SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09862', N'VIMF911128D70', N'FRANCISCO JAVIER VILLANUEVA MARTINEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09863', N'VIRF610917U77', N'FRANCISCO VILLANUEVA RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09864', N'AIAA3906045Y0', N'ALEJANDRO AISPURO ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09865', N'GAGG910822JG5', N'GUADALUPE DEL CARMEN GAMEZ GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09866', N'AEAH901207C73', N'HERIBERTO ARCE ACOSTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09867', N'LOUH650101AG4', N'HERIBERTO LOPEZ URIAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09868', N'HECI570201BK0', N'IGNACIA REBECA HERNANDEZ CORTEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09869', N'RIGC660709493', N'CARLOS RIVERA GRIJALVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09870', N'AARC4510124D2', N'CARLOS ENRIQUE ANAYA RUIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09871', N'RIGC980714KC9', N'CARLOS RIVERA GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09872', N'AOBD701112DI2', N'DOLORES GUADALUPE ABOYTE BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09873', N'GAGJ761202JE7', N'JESUS ALONSO GAMEZ GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09874', N'AAGE670123AE8', N'EVARISTO ALVAREZ GASTELUM')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09875', N'BOCJ480315439', N'JESUS BOJORQUEZ CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09876', N'RUME570701CE2', N'EVERARDO RUIZ MALDONADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09877', N'BOFJ840124761', N'JESUS ORLANDO BOJORQUEZ FIGUEROA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09878', N'MAMJ920711FG4', N'JORGE LUIS MARTINEZ MONRREAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09879', N'AORI920522L31', N'ISMAEL ABOYTE RUIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09880', N'CACI410622HL2', N'ISMAEL CAMACHO CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09881', N'SOUJ680703K95', N'JESUS DIEGO SOTELO URIAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09882', N'VACJ410104D80', N'JORGE ANTONIO VALENZUELA CARLON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09883', N'OOGJ7912196Y2', N'JORGE MARIO OCHOA GRACIANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09884', N'LOFE6110134YA', N'JOSE EDUARDO LOPEZ FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09885', N'GOVA6702064N2', N'JOSE ANGEL GONZALEZ VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09886', N'GAVJ4812049F5', N'JOSE JESUS GAMEZ VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09887', N'AEIJ321103811', N'JOSE ARCE IBARRA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09888', N'VABM490818NR4', N'JOSE MANUEL VALDEZ BAJO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09889', N'RUJF670403GH8', N'JOSE FRANCISCO RUIZ JOCOBI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09890', N'CAVP590918N87', N'JOSE PEDRO CASTRO VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09891', N'AEVJ5112116X5', N'JUAN FRANCISCO ARMENTA VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09892', N'GAVJ450226R29', N'JUAN ANTONIO GAMEZ VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09893', N'LOAJ700327I77', N'JUANA LOPEZ ARAUJO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09894', N'BAGL470824VA4', N'LEOVIGILDO BARRAZA GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09895', N'AECL730724741', N'LUCINA ARMENTA CARDENAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09896', N'CAUK8205104B5', N'KARINA CHAVEZ URIAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09897', N'AORM401231HH5', N'MANUEL ACOSTA ROJO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09898', N'GASM5202109L9', N'MANUEL EVARISTO GASTELUM SERRANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09899', N'CONJ730205R84', N'MARIA DE JESUS CORRALES NAVARRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09900', N'CAV030920D14', N'LOS CAVAL SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09901', N'RUMR720220BM5', N'MARIA DEL ROSARIO RUIZ MAPULA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09902', N'FIFL701028JR1', N'LUIS ENRIQUE FIGUEROA FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09903', N'CASM8512305B3', N'MARINO CARDENAS SILVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09904', N'SEFM710421JF7', N'MAGDALENA SEPULVEDA FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09905', N'AEEO5002238E3', N'OBDULIA ARMENTA ESPINOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09906', N'CALM7402243J6', N'MARCO ANTONIO CASTILLO LEON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09907', N'COCP6406027M2', N'PEDRO ALBERTO COTA CORRAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09908', N'LALR591103QY2', N'MARIA ROSARIO LARA LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09909', N'VADR491117ID6', N'ROSARIO VALDEZ DIAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09910', N'CACY530201UV1', N'MARIA YOLANDA CARRASCO CARO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09911', N'MEZS5505095M3', N'SECUNDINO MENDIVIL ZAVALA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09912', N'BOLM760920912', N'MARICELA BOJORQUEZ LUGO')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09913', N'LURM650919SH2', N'MEDARDA LUGO REYES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09914', N'LUCP520830I57', N'PILAR LUGO CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09915', N'OOAV650517IZ4', N'VENANCIO OCHOA ALVAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09916', N'MOVP530504JZA', N'PORFIRIO MORALES VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09917', N'VECR800207TJ7', N'RICARDO VERDUGO CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09918', N'MOVR600511RE7', N'RODOLFO MORALES VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09919', N'LURO461102H21', N'ROSARIO LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09920', N'VALS551101F22', N'SAMUEL VALENZUELA LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09921', N'VABS5805209K3', N'SILVERIO VALDEZ BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09922', N'GAGT830228DD4', N'TOMAS ABRAHAM GAMEZ GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09923', N'AOGV9110235W8', N'VIANNEY KARINA ACOSTA GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09924', N'AEVY550801H43', N'YGNACIO ARCE VALLE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09925', N'MIMY580529G12', N'YOLANDA MIRANDA MIRANDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09926', N'COCJ661015SG3', N'JESUS ROBERTO COTA CONTRERAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09927', N'COBJ800919CL0', N'JORGE ALBERTO COTA BLANCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09928', N'CORJ910125T24', N'JORGE LUIS COTA RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09929', N'BAMA640204CF7', N'MARIA ARTEMISA BLANCO MORENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09930', N'AOJR721216MK3', N'ROCIO ASTORGA JAQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09931', N'OIAG521025AL9', N'GABINA OLIVAS ALCALA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09932', N'UISF4708098X8', N'FELIPE URIAS SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09933', N'VAGJ700228JG3', N'JESUS MACARIO VALLE GAXIOLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09934', N'AAEF5309272G6', N'FRANCISCO ALDAMA ESPINOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09935', N'GAHF560402GGA', N'FRANCISCO TRIFON GARCIA HIGUERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09936', N'MAGI370404LN7', N'ISIDORO MARTINEZ GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09937', N'OIJA750316GU1', N'JOSE ABRAHAM OLIVAS JAVALERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09938', N'CACI730107P21', N'ISMAEL CAMACHO CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09939', N'SOEJ570805P83', N'JOSE DE JESUS SOTO ESCARREGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09940', N'CACJ880117HT7', N'JAIME ANTONIO CAZAREZ CAZAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09941', N'GUVJ6503286A6', N'JAVIER ENRIQUE GUERRERO VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09942', N'AEPL490302P9A', N'LUCIANA ARMENTA PAZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09943', N'LOGA6101166I1', N'JOSE ANTONIO LOPEZ GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09944', N'SAGM890125KM0', N'MARA CECILIA SANCHEZ GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09945', N'GUGC4703316Q1', N'JOSE CARLOS GUTIERREZ GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09946', N'GUVA681111GCA', N'ARNOLDO GUTIERREZ VALLE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09947', N'CACR720404QR2', N'RAFAEL CASTRO CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09948', N'AURM630823TH7', N'JOSE MARIA ANGULO RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09949', N'LELR7411177Q9', N'REGINO LEYVA LEON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09950', N'VIRR970524HJ5', N'JOSE RAUL VIZCARRA REYES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09951', N'LELR550821HT0', N'RIGOBERTO LEYVA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09952', N'SAMR460126NS6', N'ROBERTO SANDOVAL MONGE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09953', N'BOCR631001177', N'JOSE RUBEN BOJORQUEZ CAMPOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09954', N'BELJ540808JN9', N'JOSEFINA BELTRAN LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09955', N'AEVA390215KK4', N'VALENTIN ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09956', N'HELJ4505237A0', N'JUAN RAMON HERALDEZ LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09957', N'BASA570525IF8', N'ANA LUISA BAEZ SARABIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09958', N'HECL780803N11', N'LEODEGARIO HERNANDEZ CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09959', N'AARJ630320CE6', N'JUANA ALVAREZ RUIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09960', N'MARM781225R3A', N'MANUEL MARTINEZ RANGEL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09961', N'MISR940602MPA', N'JOSE RAMSES MIRANDA SALAZAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09962', N'ROSJ641022186', N'JAVIEL ROMO SANDOVAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09963', N'CAAC520807SB7', N'CARLOS RAMON CASTRO ACOSTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09964', N'MOLM581231GI8', N'MANUEL MORENO LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09965', N'RIVM610918MTA', N'MARCO ANTONIO RIVERA VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09966', N'LAPC831123FG5', N'MARIA CLARA LANDERO PABLOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09967', N'RIEM910706RL8', N'MARKO ANTONIO RIVERA ESCOBAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09968', N'GAFM770924KM7', N'MAYRA GARCIA FAVELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09969', N'CACM650508IZ3', N'MIREYDA CASTRO CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09970', N'EOLM680205I82', N'MIRIAM ROSANA ESCOBAR LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09971', N'RIEM890904VCA', N'MYRIAM RIVERA ESCOBAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09972', N'AEGE980617SE3', N'EMILIO ANDRES ARMENTA GRACIANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09973', N'BOSL5010197P6', N'LAURA ELENA BOJORQUEZ SERRANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09974', N'PEVO901013423', N'OMAR EDUARDO PEREZ VILLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09975', N'BOBP410805QP9', N'PEDRO BOJORQUEZ BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09976', N'RAPR531217IG8', N'RAMON LAZARO RANGEL PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09977', N'GORA611222JUA', N'RAMON DEMETRIO GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09978', N'GAAR411223GA9', N'RAUL GARCIA AHUMADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09979', N'VAGS500627J34', N'SOCORRO VALENZUELA GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09980', N'REES750610TI8', N'SONIA PATRICIA REYES EGUINO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09981', N'PELV570628U61', N'VICTOR RAMON PEREZ LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09982', N'RIEX000804N54', N'XIMENA RIVERA ESCOBAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09983', N'GACY770720KW4', N'YESENIA GAXIOLA CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09984', N'SACZ520825LD4', N'ZAIDA ELENA SANCHEZ CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09985', N'VASE5006258P6', N'ENRIQUE VALENZUELA SERRANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09986', N'SIOA650915B54', N'ABEL SILVA OLIVAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09987', N'BAL0907163U8', N'BALIN MAYELIN SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09988', N'AELF9312055B9', N'FRANCISCO JAVIER ARMENTA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09989', N'EARA371005PP5', N'ANGELITA ESTRADA RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09990', N'CAAA731129I90', N'JOSE ALFREDO CHAVEZ ACOSTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09991', N'AOSC370422T56', N'CARMEN ACOSTA SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09992', N'HIRA721110QY7', N'ABELARDO HIGUERA REYES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09993', N'SOMA4103101X9', N'ABRAHAM SOSA MONTOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09994', N'ALC101118EG4', N'AGRICOLA LA CUICHE SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09995', N'ACI0206126W5', N'AGRICOLA LOS CHINITOS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09996', N'ATA1106083R7', N'AGRICOLA TAMABOCA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09997', N'AGR040813DL8', N'AGROBRISAS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09998', N'PECA470528UH5', N'AGUSTINA PEREZ CHAVEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'09999', N'RICA410613AB7', N'ALEJO RIOS CARRILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10000', N'GAHA360227GD0', N'ANTONIO GALINDO HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10001', N'MAGB4110014I8', N'BALTAZAR MARTINEZ GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10002', N'VICC791024DQA', N'CARLOS ERNESTO VILLA CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10003', N'UIJC520204RT7', N'CONSUELO URIVE JIMENEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10004', N'QUAD4207298UA', N'DANIEL QUEVEDO AVENDAÑO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10005', N'VEHA8704074D0', N'ADAN EDEN VEGA HERRERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10006', N'LOGD7406013Z5', N'DAVID SALVADOR LOPEZ GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10007', N'AGO180815GJ6', N'AGRICOLA GOVALSA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10008', N'AOLE510224DH3', N'ELADIO ASTORGA LEAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10009', N'LORE610405I74', N'EMILIA LOPEZ RUBIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10010', N'AGU190924US9', N'AGRICOLA GUPYS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10011', N'QULE780331465', N'EMILIANO QUEVEDO LUQUE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10012', N'MOLE640721T85', N'EMILIO MORENO LOPEZ')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10013', N'AUCE850802AD3', N'EMMANUEL ANGULO CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10014', N'MAOE5203246L4', N'ERASMO ALBERTO MALDONADO ORTIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10015', N'GUME5905176Y2', N'EVANGELINA GUTIERREZ MARTINEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10016', N'ASA061209RV5', N'AGRICOLA EL SABE SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10017', N'GAGE421023A47', N'EVERARDO GAXIOLA GAXIOLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10018', N'BEFE510606GM4', N'FELICITAS BELTRAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10019', N'FERF461120N8A', N'FELICITAS FELIX RIVAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10020', N'AOLF490204980', N'FIDEL ASTORGA LEAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10021', N'LOSG950926FX1', N'GABRIELA LOPEZ SOTELO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10022', N'CABG6106232D6', N'GILBERTO EUCEBIO CAMACHO BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10023', N'CEPG790110L27', N'GRISELDA CERVANTES PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10024', N'FEMG620709BF3', N'GUSTAVO FELIX MARQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10025', N'AAHH691223G62', N'HECTOR ALVAREZ HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10026', N'SOLH5708095L0', N'HUMBERTO SOTELO LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10027', N'ANS9607128S9', N'AGRICOLA LAS NORIAS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10028', N'ATE10082382A', N'AGRICOLA TRES EJIDOS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10029', N'GAUH700327ES9', N'HECTOR GAXIOLA URIAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10030', N'GABA691228R48', N'AGUSTIN GALVEZ BENITEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10031', N'AEBA651219V95', N'AIDA ARCE BELTRAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10032', N'GAGA641220SB8', N'ALICIA GALVEZ GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10033', N'FEGA801031IG2', N'ADAN ALBERTO FELIX GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10034', N'AHO141217PR0', N'AGRICOLA HERMANOS OLMO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10035', N'SOCA9211212D2', N'ALEJANDRA SOTO VALLE CHANG')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10036', N'AORA641028PS2', N'ALFONSO ANIBAL ACOSTA RENDON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10037', N'BELA4403131L2', N'ALFONSO BELTRAN LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10038', N'VECA621020MT5', N'ARIEL HERNANDO VERDUGO CERVANTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10039', N'SAMA5308197V7', N'ARMIDA SANCHEZ MERCADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10040', N'LUVB970808333', N'BEATRIZ ADRIANA LUGO VALDES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10041', N'OEMC710817B99', N'CESAR BERNARDO ORTEGA MELENDREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10042', N'LUME671128U61', N'EMILIO LUGO MEDINA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10043', N'LOPE760101RP9', N'ERENDIDA LOPEZ PUENTE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10044', N'RUAF460205LX0', N'FELIPE DE JESUS RUBIO ALVAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10045', N'EIRG420304V67', N'GILBERTO ESPINOZA RUBIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10046', N'VAGG391204K52', N'GUADALUPE VALDEZ GALVEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10047', N'FEGG4003045N6', N'GUILLERMO FELIX GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10048', N'GARH401215IG7', N'HELIODORO GARCIA RIVERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10049', N'LOCH550221AN5', N'HERMELINDA LOPEZ CASTILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10050', N'JARJ740630C68', N'JESUS BENJAMIN JAVALERA RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10051', N'EILJ691206KH7', N'JORGE PAUL ESPINOZA LEYVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10052', N'LEIA551101NI0', N'JOSE ANGEL LEAL INZUNZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10053', N'LELA831230Q58', N'JOSE ANTONIO LEYVA LEON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10054', N'SOFA6702228V7', N'JOSE ANTONIO SOTO VALLE FAVELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10055', N'AEMC6812239R0', N'JOSE CLEMENTE AMEZCUA MORENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10056', N'AIMM4503024M2', N'MACARIO AVILA MORALES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10057', N'LELM5907212D3', N'MANUEL DE JESUS LEYVA LEYVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10058', N'EIGR511218QF4', N'MARIA DEL ROSARIO ESPINOZA GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10059', N'LELG431023UGA', N'MARIA GREGORIA LEYVA LEYVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10060', N'RELM310808AW5', N'MARIA REYES LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10061', N'GARM610630P92', N'MERCEDES GARCIA RIVERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10062', N'REFO740129HF2', N'OSVALDO REYES FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10063', N'AUAP7009257B5', N'PEDRO AHUMADA ASTORGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10064', N'BEQP510405CU4', N'PEDRO BELTRAN QUINTERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10065', N'RCJ190426FU1', N'RANCHO CARLOS JR SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10066', N'LEAV341102111', N'VICTOR LEYVA ARCE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10067', N'QUGV250902LH5', N'VIRGINIA QUINTERO GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10068', N'MECJ6511173J5', N'JAVIER ELISEO MEXIA CUADRAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10069', N'AOCJ8908122F8', N'JAVIER OSBALDO ASTORGA CUADRAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10070', N'CASJ841005IB9', N'JESUS ALONSO CAMACHO SOTELO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10071', N'CAMJ590130656', N'JESUS MARTIN CHAVIRA MARES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10072', N'LOAJ810908FH4', N'JESUS OCTAVIO LOPEZ ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10073', N'MOAJ760110JR1', N'JITO MONTOYA ASTORGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10074', N'AIN180321FM9', N'AGRICOLA INTRALIGGUI SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10075', N'VAGJ830912940', N'JOEL ESTEBAN VALDES GASTELUM')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10076', N'AURA5702108R3', N'JOSE ALFREDO ANGULO RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10077', N'ROLF510622A9A', N'JOSE FEDERICO ROMO LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10078', N'AESJ561217PA6', N'JOSE JUAN ARREDONDO SANTOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10079', N'AARB600315IS3', N'BENJAMIN RAYMUNDO ALVAREZ REYES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10080', N'HEFA8308092I4', N'ALVARO HERRERA FORCADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10081', N'ROCM610509JM9', N'JOSE MANUEL RODRIGUEZ CARBAJAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10082', N'VACM520501CE9', N'JOSE MANUEL VALENZUELA CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10083', N'BOCM581014BJ9', N'JOSE MAURO BORQUEZ CERVANTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10084', N'LOAR611030GT0', N'JOSE RAMON LOPEZ ACOSTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10085', N'VALC711112U1A', N'CARLOS MARTIN VALDES LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10086', N'CAAJ301020K61', N'JUAN CAMPOS ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10087', N'GAVJ761014TI9', N'JUAN DE DIOS GARCIA VALLE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10088', N'AGA170213S68', N'AGROPECUARIA GATALA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10089', N'RICL750803L58', N'LIDIA RIOS CONTRERAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10090', N'MACL4509123H1', N'LUIS ALFONSO MASCAREÑO CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10091', N'MOGL6211266Y0', N'LUIS ALFREDO MONTOYA GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10092', N'BAGA600828N58', N'AGUSTIN BRASIL GALAVIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10093', N'CAML770521Q82', N'LUIS ENRIQUE CHAVEZ MARTINEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10094', N'CACC690813UH1', N'CRUZ CARRILLO CAMPOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10095', N'MOML651018BG2', N'LUIS FREDY MONTOYA MONTOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10096', N'VAQA780216ER0', N'ANTONIA VALDEZ QUINTERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10097', N'UELM5712047I6', N'MA. ISABEL URETA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10098', N'QUAM4404187Z1', N'MANUEL DE JESUS QUEVEDO AVENDAÑO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10099', N'MAGA7812193B2', N'ANWAR MARISCAL GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10100', N'CAVD521211NAA', N'DAMASO CHAN VERDUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10101', N'SOBM7002127C4', N'MARIA SOTELO BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10102', N'LUBE740721JLA', N'MARIA ELENA LUQUE BELTRAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10103', N'MOPE670719390', N'MARIA ELENA MORALES PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10104', N'PARE601023H80', N'MARIA ELIZABETH PAEZ ROBLES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10105', N'UIAR811211994', N'MARIA ROSARIO URIAS ACOSTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10106', N'AOVM6109125E3', N'MARIO ASTORGA VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10107', N'GAHM550125CI7', N'MARIO GARCIA HUERTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10108', N'BELE850518D37', N'EDWIT YOEL BELTRAN LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10109', N'RONM610213NH0', N'MARTHA ROJO NAVAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10110', N'AECM690203313', N'MEDARDO ARMENTA CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10111', N'HEMM5405309M1', N'MELECIO HERNANDEZ MANSILLAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10112', N'AAEM6706287E8', N'MIGUEL ANGEL ALDAMA ESPINOZA')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10113', N'LOSE650606D4A', N'ELEAZAR LOPEZ SAPIEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10114', N'SOBM540515HL0', N'MIGUEL SOTELO BURGOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10115', N'CACX750222KR4', N'OLEGARIO CASTRO CABRERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10116', N'RARP4812203P1', N'PEDRO RAMOS RAMOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10117', N'EIPA870917G68', N'ASBAL ESPINOZA PALAFOX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10118', N'HEPP670211DN4', N'PEDRO HERNANDEZ PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10119', N'GARE610805UK6', N'EMIGDIO GAXIOLA RUBIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10120', N'LOSR5603286I7', N'RAFAEL LOPEZ SANDOVAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10121', N'GOCR470510KI1', N'RAQUEL GODINEZ CARRILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10122', N'SOVB7005091J0', N'BALDEMAR SOTELO VALENCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10123', N'AOVR800206F65', N'RICARDO ASTORGA VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10124', N'LOAR461006EK6', N'ROQUE LOPEZ ACOSTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10125', N'FAMR480429HF1', N'ROSA ELVIRA FAVELA MONTOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10126', N'GAFE4604098K6', N'ESPERANZA GALVEZ FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10127', N'GAHR500401P27', N'ROSELIA GARCIA HUERTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10128', N'VAAF630712QA4', N'FAUSTO VALVERDE ARCE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10129', N'AUAS590407H86', N'SAUL ANGULO ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10130', N'CAAF710207GI6', N'FERNANDO CARRASCO AGUIRRE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10131', N'SALS721008G39', N'SERGIO ALEJANDRO SAUCEDA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10132', N'LUES751004DB0', N'SONIA FRANCISCA LUQUE ESPINOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10133', N'CAMT370108TH4', N'TEODOSA CAMACHO MASCAREÑO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10134', N'LORF420404BMA', N'FRANCISCO LOREDO RUIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10135', N'VAPT571206C15', N'TERESA DE JESUS VALENZUELA PLOMOSO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10136', N'CACV4809173A2', N'VENTURA CAMACHO CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10137', N'FOHB750704HN6', N'BEATRIZ FLORES HERRERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10138', N'AELF7702038P4', N'FRANCISCA MARIA ARMENTA LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10139', N'LUVF4610283I6', N'FROYLAN LUGO VALLE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10140', N'QURG511215JX6', N'GERARDO QUIÑONEZ RUBIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10141', N'ZAGG811003F85', N'GERARDO ZAVALA GALVEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10142', N'GUPG720512T99', N'GILBERTO CRUZ GUTIERREZ PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10143', N'RESG590722HR3', N'GUMERSINDA REYNA SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10144', N'IUVH790916C98', N'HEIDY INZUNZA VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10145', N'GOFC670305AVA', N'CRUZ MARIA GONZALEZ FLORES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10146', N'ROZI6302017Y5', N'IGNACIO RAMON ROMERO ZAMORA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10147', N'ROME340614TY9', N'ELISEO ROCHA MEZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10148', N'GAMJ730831SL2', N'JESUS OBED GAMEZ MACHADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10149', N'LUCJ8306209U1', N'JOEL LUGO CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10150', N'AEBJ750502EE5', N'JORGE AARON ARCE BELTRAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10151', N'AALE741109HE3', N'ELVIA AYALA LEYVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10152', N'SELE450303G59', N'EMETERIO SEPULVEDA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10153', N'CAHJ530109N62', N'JULIAN CAMPOS HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10154', N'VEZL740912AX2', N'LILIA GRACIELA VEA ZAVALA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10155', N'VAFL701024J46', N'LUIS ENRIQUE VALDES FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10156', N'FEGL450528K94', N'LUZ ESTHER FELIX GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10157', N'LODM7510065JA', N'MACARIO LOPEZ DIAZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10158', N'GACS561026JJ0', N'MARIA DEL SOCORRO GARCIA CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10159', N'GUAH420818BX2', N'MARIA HERMINIA GUTIERREZ ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10160', N'PULR560901FD9', N'MARIA REMEDIOS PUERTA LUNA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10161', N'PAAM5006206J0', N'MARTHA ALICIA PARRA AGRAMON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10162', N'GABM390218MC6', N'MIGUEL GALVEZ BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10163', N'QURM480715AZ9', N'MIGUEL ANGEL QUIÑONEZ RUBIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10164', N'BOCM430615V94', N'MODESTO BOJORQUEZ CHAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10165', N'AELN8001037Z4', N'NEREYDA ARELLANO LUNA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10166', N'VIMO791204DR8', N'OSCAR VILLEGAS MORENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10167', N'LEPM600507D37', N'MANUEL DE JESUS LEON PEREA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10168', N'AEPR410112S68', N'RAMON ARCE PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10169', N'OURA420916KF1', N'RAMON CORNELIO OSUNA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10170', N'GUBM480312KV1', N'MARIA MAGDALENA GUTIERREZ BUENROSTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10171', N'BOCR5201235T4', N'RAYMUNDO BOJORQUEZ CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10172', N'AEAG570901J24', N'JOSE GIL ARMENTA ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10173', N'BOBN6509085V3', N'NATIVIDAD BOJORQUEZ BURGOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10174', N'BARR7505026L4', N'ROSARIO BERENICE BALDENEBRO ROMERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10175', N'CULI690227G46', N'IBONNE AIDEE CRUZ LUNA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10176', N'BORR640104TS0', N'RUBEN BOJORQUEZ RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10177', N'LEVH6302186W3', N'MARIA HILARIA LEYVA VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10178', N'VABR470429F19', N'RUBEN VALDEZ BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10179', N'SABC981104DG7', N'CARLOS RAYMUNDO SANCHEZ BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10180', N'ROLA7704246Q7', N'ANGEL GUSTAVO ROJO LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10181', N'PADF6810203U0', N'FRANCISCO JAVIER PALAFOX DOMINGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10182', N'SOBG741030LV8', N'GERARDO SOTO BARRERAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10183', N'EILG541204JU3', N'GUADALUPE ESPINOZA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10184', N'PARH7907302K3', N'HECTOR PARTIDA RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10185', N'GOVV551230PB9', N'VICTOR MANUEL GONZALEZ VALLE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10186', N'JIRJ540921676', N'J.LUIS JIMENEZ RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10187', N'RAGJ790315H34', N'JESUS DANIEL RANGEL GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10188', N'CAVJ931031NB5', N'JESUS LADISLAO CARDENAS VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10189', N'AAVJ9511168E5', N'JESUS MANUEL AYALA VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10190', N'OUCJ550225TB7', N'JESUS MANUEL ORDUÑO CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10191', N'DIQJ7203188G5', N'JESUS MARIA DIAZ QUIÑONEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10192', N'GAAJ710320786', N'JOAQUIN GARCIA ARAUJO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10193', N'OUCJ7802097S3', N'JORGE OLGUIN CARABBEO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10194', N'PAPC9404145F0', N'JOSE CARLOS PALAFOX PAZOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10195', N'GUFA830805DF0', N'JOSE ANTONIO GUERRERO FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10196', N'SOVR771221KD4', N'JOSE RAMON SOTELO VALENCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10197', N'GUOJ390619QY3', N'JULIA GUZMAN ORTIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10198', N'GAMG510510AG0', N'GUSTAVO GAXIOLA MONTOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10199', N'MEGL431215E20', N'LUCINDA MEZA GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10200', N'BESS960919E37', N'SANDRA ARELY BELTRAN SEPULVEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10201', N'SOAL931002DQ0', N'LUISA VALERIA SOTO AYALA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10202', N'GUVL680119398', N'LUZ MARIA GUTIERREZ VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10203', N'AALM700223II3', N'MANUEL AYALA LEYVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10204', N'TUAM610721NF0', N'MARIA TRUJILLO ARELLANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10205', N'LOER6512186V4', N'MARIA DEL ROSARIO LOPEZ ESTRADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10206', N'AAOM650404IK6', N'MARIBEL ALVARADO OLGUIN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10207', N'CABM860725SY2', N'MARTIN CARDENAS BENITEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10208', N'BAGM950929Q66', N'MIGUEL ANTONIO BANDA GURROLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10209', N'MOGN670801CGA', N'NORMA ALICIA MOLINA GUZMAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10210', N'AOAO940313II6', N'OBED ACOSTA ALVAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10211', N'AALO690402RUA', N'OFELIO AYALA LEYVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10212', N'VEBP771123EP8', N'PRIMO VEGA BARRERAS')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10213', N'GUPR661024EG9', N'RAFAEL GUERRERO PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10214', N'LEAR710213K69', N'RAULATO LEAL ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10215', N'MOGR400721MU3', N'ROGELIO MOLINA GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10216', N'EIVR380904RU5', N'ROSA ESPINOZA VILLANAZUL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10217', N'AART6306095X9', N'TRINIDAD ALVAREZ REYES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10218', N'AARL8002232P3', N'LORENA ALVAREZ RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10219', N'COLJ790927E68', N'JULIO HUMBERTO COTA LEYVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10220', N'COCJ6807101D7', N'JORGE FRANCISCO COTA CONTRERAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10221', N'BECM7504022BA', N'MARIANA BELTRAN COLIN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10222', N'ROCM680225HT0', N'MIRNA OLIVIA RODRIGUEZ COTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10223', N'HUGT7509187F6', N'TATIANA MARGARITA HUBBARD GIL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10224', N'MIOL650715945', N'LORENZA MIRANDA OSOBAMPO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10225', N'OERA510918Q66', N'JOSE AGRIPINO ORTEGA ROSAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10226', N'SAMJ5104014Y8', N'JOSEFA SANCHEZ MONTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10227', N'SOPE580303S10', N'EMETERIO SOTO PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10228', N'VAGF600205424', N'FELIPA DE JESUS VALENZUELA GALVEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10229', N'CAFE560330U2A', N'EFRAIN CAMPOS FABELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10230', N'QUCG420610MU7', N'GENARO QUEVEDO CARDENAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10231', N'AOAI750918727', N'ISMAEL ASTORGA ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10232', N'CAAM860825NA9', N'JOSE MARTIN CASTRO ARAUJO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10233', N'MARB491123UR6', N'BENJAMIN MASCAREÑO RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10234', N'FICA741215QF9', N'ARTURO FIERRO COTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10235', N'ZARR500210420', N'REYNALDA ZAVALA RENTERIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10236', N'FILF511218L55', N'FORTINO FIERRO LEYVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10237', N'VEHF7707302F0', N'FLOR DEL CARMEN VEGA HEREDIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10238', N'CAVG971213HB0', N'GISEL CASTRO VEGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10239', N'LOGJ440203U76', N'MARIA JESUS LOPEZ GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10240', N'LOVG76022873A', N'GABRIEL ROBERTO LOPEZ VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10241', N'UISM460117HE4', N'MARTHA OLIVIA URIAS SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10242', N'ROMR461016518', N'RAMON ROSAS MIRANDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10243', N'MOMA650319QZ9', N'AGUEDA MORALES MEZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10244', N'ALA080915CU4', N'AGRICOLA LALITO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10245', N'GEGA7007271B5', N'AURELIO GERMAN GANDARILLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10246', N'VALE451122RL4', N'EDUARDO VALENZUELA LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10247', N'SOVE860823285', N'ESMERANDA SOTO VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10248', N'LOSA501130KF0', N'ADALBERTO LOPEZ SOTELO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10249', N'AJM1901257U2', N'AGRICOLA JESUS MOLINA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10250', N'LUVA790211CC7', N'ADALBERTO LUQUE VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10251', N'PAMA940315IG3', N'ALMA ANDREA PALAFOX MALDONADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10252', N'APE140911DE1', N'AGRICOLA LA PELTI SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10253', N'BEAA630102GBA', N'ANDRES BECERRA AGUILAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10254', N'CUAC490929R81', N'CARLOS CRUZ ARGUELLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10255', N'FIAC960415AM9', N'CESAR ADRIAN FIERRO ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10256', N'LEFC420706SI1', N'CONRADO LEAL FLORES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10257', N'LOGF510628CK5', N'FRANCISCO MIGUEL LOPEZ GAXIOLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10258', N'CUPD660623SLA', N'DORA ALICIA CRUZ PARRA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10259', N'COCC971025UJA', N'CHRISTIAN HUMBERTO COTA CARRILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10260', N'LUMA851124QQ3', N'ALEXI LUQUE MELENDREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10261', N'MOLF531020QP2', N'FAUSTO MONTOYA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10262', N'GUOG800406EM0', N'GLORIA GUERRERO OSUNA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10263', N'LOLD461020QB6', N'DEMETRIA LOPEZ LEYVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10264', N'COBE940205C55', N'EDGAR EDUARDO COTA BRAVO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10265', N'GARF5910262R6', N'FRANCISCA CECILIA GAMEZ ROMERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10266', N'LUAH7510199K1', N'HUGO LUGO ARCE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10267', N'AEGU5605271QA', N'GUSTAVO ANTONIO ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10268', N'GARE4001267Q8', N'ESTEFANA GAMEZ RUBIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10269', N'LOLJ670423EU0', N'JORGE LOPEZ LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10270', N'AUZJ6910165Y7', N'JORGE MARIO AHUMADA ZUÑIGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10271', N'AOCC680716FE2', N'JOSE CARMEN ASTORGA CERVANTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10272', N'ROLJ850826466', N'JOSE DE JESUS RODRIGUEZ LEYVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10273', N'MOCM4505117E9', N'JOSE MAXIMO MONTOYA CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10274', N'CAGR990127TH3', N'JOSE RAFAEL CASTRO GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10275', N'BEBL600127S76', N'JOSE LUIS BERNAL BARRERAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10276', N'GULR660906NT8', N'JOSE RAMON GUTIERREZ LEON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10277', N'REVR940708FW1', N'JOSE ROBERTO REYES VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10278', N'PABJ8108062F0', N'JUAN ANTONIO PAYAN BURGOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10279', N'CEPA6410225I8', N'ARCELIA CERVANTES PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10280', N'MOSJ410705D38', N'JUANA MORA SANDOVAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10281', N'SARL960723S62', N'LUIS ARNOLDO SANDOVAL RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10282', N'AOVA4907119BA', N'ARNOLDO ATONDO VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10283', N'VESM900301871', N'MANUEL EZEQUIEL VEGA SOTO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10284', N'MAMM3404256SA', N'MARCOS MACHADO MORENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10285', N'MOJR690301P83', N'MARIA DEL ROSARIO MONTOYA JUAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10286', N'LELA4401234M0', N'ARSENIO LEAL LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10287', N'CAAA6908138U7', N'JOSE ANGEL CARRASCO AGUIRRE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10288', N'VARH700218UA4', N'MARIA HORTENCIA VALENZUELA REYES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10289', N'GUGO571027HR6', N'MARIA ORALIA GUTIERREZ GASTELUM')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10290', N'AAAM380705GA2', N'MIGUEL ALVAREZ ALCANTAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10291', N'AUVM370826CNA', N'MIGUEL ANGEL SANCHEZ MERCADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10292', N'PARF380917GE7', N'FELIX PALAFOX ROBLES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10293', N'CIVM560318J73', N'MIGUEL ROSARIO CHICUATE VERDUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10294', N'MOGF500530HI0', N'FERNANDO MOLINA GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10295', N'GABG7106168CA', N'JOSE GUADALUPE GAMEZ BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10296', N'AEBB860614TPA', N'BERENICE MARIA ARREDONDO BERNAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10297', N'LUCB860501I64', N'BERTHA ZULEMA LUQUE CAMARGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10298', N'DARO590805G76', N'ROQUE AZAEL DAGNINO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10299', N'AEAL491118J54', N'JOSE LUCAS ARELLANES ARELLANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10300', N'LELR520424EJ1', N'RUBEN LEYVA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10301', N'GAMC7210248R9', N'CARLOS GARCIA MORALES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10302', N'SAMC4201188P4', N'CARLOTA SANCHEZ MEDINA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10303', N'LEBT530109PJ0', N'TEODORA LEYVA BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10304', N'PILV6306099P8', N'VENJAMIN PINTO LLANES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10305', N'CUBC7711033B2', N'CELENE CUADRAS BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10306', N'LOCV710612FU2', N'VENTURA LOPEZ CERVANTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10307', N'ROSC7010188D5', N'CLAUDIO ROMAN SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10308', N'FACO521104617', N'CONSUELO FAVELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10309', N'GUMR460306I48', N'JOSE ROSARIO GUERRERO MEXIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10310', N'LOAC761116P78', N'CRESCENCIO LOPEZ ACOSTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10311', N'CAGE751122MN9', N'EDUARDO CHAVEZ GASCA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10312', N'AAML420530535', N'LAZARO ARAGON MEZA')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10313', N'MAAG410913L63', N'GLORIA OLIVIA MAPULA ALVARADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10314', N'RAPE491030HE3', N'EDUARDO RANGEL PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10315', N'BEBH7501218R9', N'HUGO INDALECIO BERUMEN BARRON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10316', N'UIML420903TQ9', N'LIDIA URIAS MORALES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10317', N'COCJ651113S60', N'JAVIER COTA CORRAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10318', N'BEAJ601126EX3', N'JUAN JOSE BECERRA AGUILAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10319', N'FICJ700620Q1A', N'JULIO CESAR FIERRO COTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10320', N'AUAE690923ED1', N'ELBA ANGULO ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10321', N'MAAE6304241P8', N'ENRIQUE MARTINEZ ARELLANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10322', N'PELO480427C62', N'MA. OLGA PEREZ LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10323', N'LOME6306036Q2', N'ERASMO LOPEZ MEDINA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10324', N'FILJ940719RJ5', N'JULIO CESAR FIERRO LEY')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10325', N'MOAE901231ED0', N'EUNICE MONTOYA ARIAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10326', N'ROAR320109LU1', N'MARIA ROSARIO RODRIGUEZ ARANA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10327', N'OUVT521001J90', N'MARIA TERESA OSUNA VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10328', N'CALJ7011089H3', N'JULIO ENRIQUE CHAVIRA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10329', N'SAAM600310KQ5', N'MARTHA ALICIA SAUCEDA ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10330', N'RMO050715TL3', N'LA RAZA DE MORENO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10331', N'CAGF890311792', N'FRANCISCO CHAVEZ GASCA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10332', N'NAMF4204072S0', N'FRANCISCO NARANJO MORENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10333', N'GUMR430104ID1', N'RIGOBERTO GUTIERREZ MELENDREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10334', N'SOCF8104052E5', N'FREDY SOTELO CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10335', N'PACL920110GP4', N'LIZBETH PACHECO CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10336', N'MIER831003AI5', N'ROSALIO MIRANDA ESPARZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10337', N'VEBG700715RV1', N'GERARDO RENE VELAZQUEZ BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10338', N'CODM570627279', N'MA. DEL SOCORRO COTA DOMINGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10339', N'RARG420326CD4', N'GUILLERMO RAYA RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10340', N'FOTO531221V2A', N'TOMAS FLORES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10341', N'CACY920804PD0', N'YURIDIANA CAMPAS CHAVEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10342', N'CAMH5807185T6', N'HECTOR MANUEL CARDENAS MONTAÑO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10343', N'LOGH4310089I8', N'HECTOR MANUEL LOPEZ GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10344', N'SACH640811EJ1', N'HERICELDA SANCHEZ CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10345', N'VIVH510108F32', N'HIPOLITO VILLAFAÑA VELAZQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10346', N'SALH560424GI8', N'HORTENSIA SANCHEZ LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10347', N'LOLI521127QE5', N'IGNACIO LOPEZ LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10348', N'AAHJ521201PS0', N'J ISMAEL ANDRADE HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10349', N'AARJ450710HP5', N'J. HECTOR ALBARES RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10350', N'EIVJ540703SX6', N'J. TRINIDAD ESPINO VAZQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10351', N'TICJ5810273F1', N'JAIME TIRADO CEJA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10352', N'VABJ930422N8A', N'JESUS DANIEL VAZQUEZ BACA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10353', N'QUCJ541214TW2', N'JORGE QUINTERO CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10354', N'RIVA670824LU1', N'JOSE ANGEL RIVERA VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10355', N'LOEE820916139', N'JOSE EFRAIN LOPEZ ESPINOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10356', N'GASG550427DI5', N'JOSE GERARDO GARCIA SANTOYO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10357', N'AEBJ900805N92', N'JOSE JUAN ARREDONDO BERNAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10358', N'MOOJ951107UJ9', N'JOSE MONTOYA OBESO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10359', N'AITR5101043Q6', N'JOSE RIGOBERTO AISPURO TORRES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10360', N'GAEJ6003289P4', N'JUAN DAMACIO GRACIANO ESPARZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10361', N'GAEJ5909198P8', N'JUAN GENARO GAONA ESPINOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10362', N'MEDL720403VB5', N'LEOBARDO MEJIA DUARTE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10363', N'GOLO630331GS0', N'LOURDES GUADALUPE GODINEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10364', N'AUVL540717CX0', N'LUIS AGUILAR VILLEGAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10365', N'LOSL640213UX8', N'LUIS ENRIQUE LOPEZ SALAZAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10366', N'LECM920625U4A', N'MARCO ANTONIO LEYVA COTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10367', N'ROMA520613QW9', N'MA. ANTONIA RODRIGUEZ MARTINEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10368', N'CARA750328I95', N'MARIA ALBERTINA CARRILLO RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10369', N'PERM600321BD9', N'MA. TERESA PEREZ RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10370', N'SAFA650104QF1', N'MARIA DE LOS ANGELES SANCHEZ FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10371', N'MOML460211RA7', N'MARIA DE LOURDES MORA MACIAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10372', N'AIHG620607RT8', N'MARIA GUADALUPE ARIAS HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10373', N'VAGG610424820', N'MARIA GUADALUPE VAZQUEZ GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10374', N'OUGM760205740', N'MARLENE OSUNA GASTELUM')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10375', N'PICA950303DC1', N'ADRIAN PINTO CRUZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10376', N'CALM5511118F3', N'MARTIN CASTRO LIERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10377', N'TOCG741223DE3', N'MARIA GUADALUPE TORRES CARRILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10378', N'ZAGM420608EQA', N'MAXIMINA ZARAGOZA GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10379', N'COMI6205064P1', N'MARIA ISABEL COTA MURRIETA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10380', N'SOCM8809051R0', N'MIGUEL SOTELO CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10381', N'GIER411213334', N'MARIA ROSARIO GRIJALVA ESCALANTE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10382', N'COLN680910BV8', N'NICOLAS CONTRERAS LARA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10383', N'MOSM760508A46', N'MARIBEL MOLINA SANDOVAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10384', N'CASN541011GP5', N'NORMA ALICIA CAMACHO SANTILLANES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10385', N'RECM530831IF7', N'MARTHA ELENA RESENDIZ CASTILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10386', N'SARO5911058Z8', N'OLIVIA SANCHEZ RENTERIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10387', N'GARO781125BY7', N'OSVALDO GARCIA ROSALES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10388', N'AOQD630429S83', N'DOMINGO ASTORGA QUINTERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10389', N'QUQP5011106Z8', N'PEDRO QUEVEDO QUEVEDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10390', N'AUBP460118M37', N'PRISCA ELISAMA ANGULO BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10391', N'VAG100825AU6', N'EL VIVERO AGRICOLA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10392', N'VACA640205V91', N'ADELA VALENZUELA CARRASCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10393', N'VEJN860503R4A', N'NILBIA CRUZ VELAZQUEZ JAQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10394', N'BOAR451014SE4', N'RAMIRO BOJORQUEZ ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10395', N'MOGR6911177E2', N'RAQUEL MOSQUEDA GASCA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10396', N'PERR450621V63', N'RAYMUNDO PEREZ RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10397', N'MATR8411265KA', N'ROGELIO MARTINEZ TORRES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10398', N'CAAR510607PN6', N'RUPERTA CAMARENA AYON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10399', N'HEMV790905HK3', N'VERONICA HEREDIA MONTOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10400', N'CALR560904HP3', N'ROSALIA CASTRO LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10401', N'BEBV910316151', N'VICTOR MANUEL BERUMEN BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10402', N'CUCR520907E40', N'ROSARIO HUMBERTO CUADRAS CUEVAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10403', N'BATS730519BM4', N'SAUL BARRAZA TORRES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10404', N'CORS590910FNA', N'SERGIO CORTES RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10405', N'CAAS8808249M0', N'SILVER ADONIS CASTRO ARAUJO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10406', N'CAMT670521IZ2', N'TRINIDAD CHAVEZ MARTINEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10407', N'SOBY821014U15', N'YUDY ARACELI SOLORIO BERRELLEZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10408', N'DILY820610MU9', N'YUVIA GUADALUPE DIAZ LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10409', N'QULZ751126TK1', N'ZULEMA KARINA QUEVEDO LUQUE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10410', N'SAGC850207E46', N'CARLOS ALBERTO SANCHEZ GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10411', N'ROBC5303186F1', N'CIRILO RODRIGUEZ BRICEÑO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10412', N'SAGD970825EB7', N'DIANA LAURA SANCHEZ GAMEZ')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10413', N'COBD840227EE4', N'DYRENE ENIDE COTA BLANCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10414', N'SAGF900225GV9', N'FRANCELIA SANCHEZ GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10415', N'COCJ861114MJ9', N'JESUS JUNUE COTA COTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10416', N'COCM820211G62', N'MANUEL ANTONIO COTA COTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10417', N'COMR470410222', N'RODOLFO COTA MURRIETA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10418', N'VAPV751026T93', N'VIRGEN OLIVIA VARELA PALAFOX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10419', N'COCW880829U53', N'WILBERTH ALONSO COTA COTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10420', N'AEAR6907146PA', N'ROBERTO ARMENTA ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10421', N'AEVA530111967', N'ARMANDO ARMENTA VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10422', N'LELR461020CT6', N'RAFAEL LEAL LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10423', N'ROIE760713LLA', N'ERIKA BEATRIZ ROCHA INZUNZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10424', N'GABS4712148Q8', N'SANTIAGO GAMEZ BELTRAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10425', N'MACC700218H63', N'JOSE CESAR MACHADO CORONEL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10426', N'LUQF400411DBA', N'FIDEL LUQUE QUEVEDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10427', N'VAPE6511194E5', N'ENEDINA VALENZUELA PORTILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10428', N'MOLI670731TV9', N'IGNACIO MORENO LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10429', N'LOVG670802H15', N'GUSTAVO LOPEZ VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10430', N'GAVA740305J5A', N'AGUSTIN GAXIOLA VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10431', N'SALL681230RF6', N'JOSE LUIS SANCHEZ LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10432', N'LUVR420831V8A', N'REGULO LUQUE VERDUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10433', N'LUST551003LT5', N'MARIA TEREZA LUGO SOTO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10434', N'MEQP361019KG6', N'PETRA MENDOZA QUINTERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10435', N'ABA1210184V1', N'AGRICOLA BENITA ACOSTA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10436', N'MORA7705178H9', N'AGLAE MORALES RUIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10437', N'GUAH8312144TA', N'HUGO GUTIERREZ AYALA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10438', N'AOJJ7411199PA', N'JORGE LUIS ASTORGA JAQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10439', N'AORA750710P95', N'JOSE ABRAHAM ARROYO RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10440', N'RAGA650708A93', N'ADRIAN RAMIREZ GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10441', N'VACA510607G96', N'MARIA DE LOS ANGELES VALENZUELA CARLON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10442', N'EACA710127KKA', N'ALBERTO ESCAMILLA CORRAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10443', N'LOMC8212265N7', N'CESAR ALBERTO LOMELI MORALES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10444', N'LENC750503SF2', N'CRUZ LILIANA LEYVA NAVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10445', N'AARC5305033W5', N'CRUZ RAMON ANDALON RAMOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10446', N'RAVD651120960', N'DELIA RASGADO VASQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10447', N'ROLD870704QUA', N'DULCE MARIA ROMERO LLANES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10448', N'EIER640604EW0', N'ERNESTO ESPINOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10449', N'MOMS7508051J5', N'SONIA BEATRIZ MOLINA MOLINA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10450', N'ROTE4810213A3', N'ERNESTO ROCHA TERRAZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10451', N'OURM310210EI9', N'MELITON OSUNA ROBLES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10452', N'EASE680406SR8', N'EVERARDO ESCALANTE SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10453', N'LOVA691007894', N'ALBERTO LOPEZ VALDES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10454', N'UIUB4204251V0', N'BELIZARIO URIAS URIAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10455', N'AEVF370517HY0', N'FERNANDO ARCE VALLE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10456', N'MOLD730923AU8', N'DAMIAN MORENO LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10457', N'GABF410723741', N'FRANCISCO GALVEZ BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10458', N'RUGF561004QW6', N'FRANCISCO RUBIO GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10459', N'MEGD610225CT8', N'DORA ELVIA MELENDRES GALVEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10460', N'SELG590628GB9', N'GILBERTO SEPULVEDA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10461', N'IUCG5507052B5', N'GLAFIRA BEATRIZ INZUNZA CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10462', N'VAVD7703235C5', N'DULCE MARIA VALENZUELA VALDES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10463', N'NAGG890817HYA', N'GRIS AZUCENA NAVARRO GIL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10464', N'MORA671022ST0', N'ABDON MONTOYA ROMERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10465', N'UAGU5806145U2', N'GUADALUPE UZARRAGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10466', N'UIGH770313B89', N'HERIBERTO URIAS GARIBALDI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10467', N'AUBA450419MG6', N'ABEL ANGULO BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10468', N'GUAH580319L5A', N'HERMELINDA GUTIERREZ ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10469', N'ROHI560207TI8', N'IRMA ROCHIN HIGUERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10470', N'CARI761201PV5', N'IRMA ALICIA CARRILLO ROCHIN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10471', N'AOLF5303075R4', N'FRANCISCO ACOSTA LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10472', N'BAUI930713DF6', N'ISAMAR BALDERRAMA URQUIDES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10473', N'GAVJ720327IP0', N'JAIME ENRIQUE GALVEZ VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10474', N'SESI501110HF0', N'ISIDRO SERRANO SEPULVEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10475', N'EEMJ710907IH0', N'JESUS ANGELICA ELENES MONGE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10476', N'AOGJ890222M41', N'JESUS IVAN ACOSTA GALAVIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10477', N'AOLJ820120PJ7', N'JESUS ISRRAEL ASTORGA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10478', N'GARJ800302DP8', N'JAVIER RAMON GARCIA RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10479', N'AOAI531214J80', N'ISRAEL ASTORGA AGRAMON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10480', N'LOBJ370624HJ4', N'JORGE LOPEZ BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10481', N'AAJJ700216EZ2', N'JUAN CARLOS ALCALDE JIMENEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10482', N'MEAJ751220AR7', N'JUAN GABRIEL MELENDRES ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10483', N'EIBJ6012271H1', N'JUAN RODOLFO ESPINOZA BELTRAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10484', N'MIFJ6910084I8', N'JULIAN MIRANDA FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10485', N'GABL541106KL5', N'LEONARDA GALAVIZ BORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10486', N'FOAM4901015A1', N'MA YOLANDA FLORES ARCE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10487', N'AEFJ960919UE3', N'MARIA JOSE ARCE FONSECA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10488', N'AEQR430514EM6', N'RAMONA ARMENTA QUINTERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10489', N'AMA190125U10', N'AGRICOLA MAYLLIW SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10490', N'AAFR720607DT9', N'ROBERTO ALVAREZ FLORES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10491', N'MIER810921H41', N'ROBERTO MIRANDA ESPARZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10492', N'AGR190710T44', N'AGRICOLEY SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10493', N'GURR440610NI4', N'RODOLFO GUTIERREZ ROMERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10494', N'RORR811101EI3', N'ROSARIO IVET ROMAN ROMERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10495', N'CECJ601220AJ6', N'JESUS MANUEL CERVANTES CUADRAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10496', N'ROVJ760612718', N'JESUS MIGUEL ROCHA VELAZQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10497', N'NENS570918V35', N'SOFIA NEVAREZ NEVAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10498', N'AOCT611011CL5', N'TRINIDAD ACOSTA CHAVEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10499', N'MEPY000217TV9', N'YAMILETH CAROLINA MELENDRES PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10500', N'VATA710414SQ9', N'AGUSTINA VALENZUELA TORRES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10501', N'LULA651001H87', N'JOSE ANGEL LUNA LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10502', N'GAUY7602012S0', N'YOLANDA GARCIA URIBE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10503', N'AEVA6104104W5', N'ALBA LUZ ARMENTA VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10504', N'SOCA890530V48', N'JOSE ANTONIO SOTO VALLE CHANG')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10505', N'ACD091017RP0', N'AGRICOLA CAMPOS DIMAS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10506', N'DIVA560716S36', N'ALFREDO DIMAS VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10507', N'BOPJ461225EQ7', N'JESUS BOJORQUEZ PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10508', N'MEMA850916GT1', N'AMIN MEXIA MEDINA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10509', N'BOFE741113CD0', N'FELIPE DE JESUS BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10510', N'AEPL451019AQA', N'JOSE LUIS ARCE PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10511', N'VAML960302AG5', N'JOSE LUIS VALDEZ MELENDREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10512', N'SAAJ470122FX8', N'JUAN FELIPE SANDOVAL ARAUJO')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10513', N'CAFK890923D29', N'KARELY CASTRO FLORES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10514', N'BAUK9107206G6', N'KARLA KARELY BALDERRAMA URQUIDES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10515', N'LOAK920419QX5', N'KRISNA VALERIA LOPEZ ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10516', N'UUTF700803N48', N'FAUSTINA URQUIDES TRASVIÑA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10517', N'FEFR540827Q47', N'ROSARIO EMILIA FERNDANDEZ FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10518', N'FEGL8210273E5', N'LEONEL FELIX GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10519', N'SOGC461113NV1', N'CARLOS RODOLFO DE JESUS SOTO GUZMAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10520', N'RODL560810F53', N'LORENZO OCTAVIO RODRIGUEZ DIAZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10521', N'LELL790621SF4', N'LUIS ALBERTO LEYVA LEON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10522', N'VAVC8102259K2', N'CLAUDIA IVETH VALDEZ VILLEGAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10523', N'MEID730620UH3', N'DIANA KARYNA MENDIVIL IRAZOQUI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10524', N'SOCL960714AV4', N'LUIS ERNESTO SOTO VALLE CHANG')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10525', N'LOAL500214V94', N'LUZ ARMIDA LOPEZ AVENDAÑO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10526', N'OUDE640828TE2', N'ENRIQUE OSUNA DOMINGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10527', N'AADE461012IT8', N'MARIA ELENA ARAUJO DAGNINO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10528', N'SAPE830519RP6', N'ERICK ALBERTO SANCHEZ PORRAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10529', N'RUAF710301LN1', N'FELIX ALFONSO RUELAS AGRAMON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10530', N'MAVA5103171K7', N'ANDRES MARTINEZ VAZQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10531', N'AACM550610NR5', N'MARIA MARGARITA AGRAMON CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10532', N'CAMA920529A8A', N'ANGELICA MEREDITH CASTRO MONTOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10533', N'RUCF441218GP1', N'FLORENCIO RUIZ CARLON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10534', N'MOAM731102GN4', N'MARISOL MOLINERO ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10535', N'AERM661022E22', N'MATILDE ARMENTA REYES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10536', N'JUFM790710MZ7', N'MELESIO JUAREZ FLORES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10537', N'AEVN720720VE9', N'NORMA ALICIA ARMENTA VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10538', N'EINF540110Q41', N'FRANCISCO ESPINOZA NUÑEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10539', N'DUVM7611267M6', N'MIGUEL AGUSTIN DUARTE VERDUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10540', N'BAUO9801307F7', N'OSCAR BALDERRAMA URQUIDES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10541', N'CACP4604251P8', N'PROCOPIO CASTELO CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10542', N'CALR421024TN4', N'RAFAEL CASTRO LUQUE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10543', N'GACR68040764A', N'RAMON ANTONIO GAMEZ CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10544', N'CACR480913CR6', N'RAMON CAMPAS CERVANTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10545', N'LELR410907KN4', N'REGINO LEYVA LEYVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10546', N'RAB010424358', N'RICARDO ARMENTA BELTRAN SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10547', N'CARR470115NK4', N'ROSA MARIA CAMACHO RUBIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10548', N'GUCR6210071T6', N'ROSARIO EVERARDO GUTIERREZ CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10549', N'ROIS800624JL1', N'SAUL ROCHA INZUNZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10550', N'ROCS490220F98', N'SAUL ABELARDO ROCHA CAMARGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10551', N'LORS941231GF8', N'SINUE LOPEZ RUBIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10552', N'GUAT750701AY4', N'TOMASA JUDITH GUTIERREZ ARAMBULA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10553', N'MEVZ891104GZ4', N'ZULEMA GUADALUPE MEDRANO VILLALOBOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10554', N'BEMG000302NR5', N'GEMA ELENA BECERRA MORENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10555', N'VEBJ6203253XA', N'JAVIER VEGA BARRERAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10556', N'IALJ6604088E5', N'JESUS EMILIO IZAGUIRRE LUNA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10557', N'MOUJ820627660', N'JESUS HUMBERTO MONTOYA URIAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10558', N'COLJ7308155I1', N'JESUS MARIO CORRALES LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10559', N'LOCJ440830AU4', N'JESUS ROSAURO LOPEZ COTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10560', N'VEVA410127QA7', N'ANGELINA VEGA VIZCARRA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10561', N'CAGX490626MS6', N'ANTONIO CASTRO GUERRERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10562', N'PAGA950112SV9', N'ALEXIS PAYAN GURROLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10563', N'AIRA680128MY0', N'ARMIDA AVILEZ ROCHIN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10564', N'FESG850627UXA', N'JOSE GUADALUPE FERNANDEZ SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10565', N'AEAA620708LF3', N'AURELIO ARMENTA ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10566', N'BEBL600127S76', N'JOSE LUIS BERNAL BARRERAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10567', N'AUCA860704AR3', N'AZAREEL ANGULO CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10568', N'VAMB480710840', N'BENITO VALDEZ MASCAREÑO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10569', N'MAVB660919H30', N'BERNARDO MARTINEZ VAZQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10570', N'VECM511010CVA', N'JOSE MARIO VEGA CAZAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10571', N'OUGM580228TJ2', N'JOSE MARTIN OSUNA GASTELUM')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10572', N'MEDC771017QQ1', N'CARMEN MARIELA MEJIA DUARTE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10573', N'LECJ800108IE2', N'JUAN CARLOS LEAL CERVANTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10574', N'SIMC430926LG1', N'CIPRIANO SILLAS MOLINA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10575', N'RORL440106IN6', N'LEONARDO ROSILLO RUIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10576', N'CAGD4301032T0', N'DAVID ALFONSO CASTRO GASTELUM')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10577', N'EIGE880905TB9', N'EDER ESPINO GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10578', N'GAFE901117Q22', N'EDUARDO GARCIA FAVELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10579', N'RIVE761220KW4', N'EDUARDO RIVERA VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10580', N'AUBE640214IV1', N'ELEAZAR ANGULO BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10581', N'CALE470513A5A', N'ELIA MARGARITA CAMACHO LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10582', N'CIPE561011G10', N'ELVIRA CISNEROS PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10583', N'BALE420905P17', N'EMIGDIA BARRAZA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10584', N'SARL6408109J2', N'LETICIA SAÑUDO RIVERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10585', N'EICL771107BT8', N'LIRIO FRANCISCA ESPINOZA COTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10586', N'CAAF8604118A4', N'FERNANDO JAIR CAMARGO ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10587', N'MOEL620612DI0', N'LUZ MARIA MORENO ESPITIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10588', N'MACY791205GG2', N'YESENIA SOBEIDA MACHADO CORONEL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10589', N'GUBM8105259R0', N'MANUEL DE JESUS GUTIERREZ BERNAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10590', N'LEVO481219910', N'MARIA OTILIA LEAL VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10591', N'GARF941225IX8', N'FLOR ALEYDA GARCIA ROJO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10592', N'VECR4709211M7', N'MARIA ROSARIO VEGA CAZARES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10593', N'SOGF390110IJ5', N'FRANCISCO SOTO GASTELUM')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10594', N'PAGF8812046T1', N'FROILAN PAYAN GURROLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10595', N'DEAM710719J61', N'MARIO HUMBERTO DELGADO ARAUJO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10596', N'CACM7101302E5', N'MARTHA CARRILLO CORRAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10597', N'VABG680507DK6', N'GABRIEL VALENZUELA BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10598', N'LOCG780212HQ0', N'GEINER LOPEZ CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10599', N'MEPN5411109E2', N'NOE MEZA PEREA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10600', N'EILG280217TX4', N'GLORIA ESPERANZA ELIZALDE LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10601', N'CAAG551126SK9', N'GREGORIO CAMACHO AVENDAÑO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10602', N'SOLG600920M29', N'GUADALUPE SOTELO LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10603', N'QUCG670320LJ0', N'GUDBERTO QUINTERO CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10604', N'MUCN870724MX3', N'NORMA MARIA MURILLO CRUZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10605', N'LOLP760622I71', N'PEDRO LOREDO LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10606', N'CARH730429CP2', N'HERIBERTO CASTRO RUBIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10607', N'VECP380609U94', N'PRIMO VEGA CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10608', N'CACR651108EY7', N'RADAMEX CAMACHO CAZAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10609', N'CAGJ5410185F6', N'JORGE LUIS CARDENAS GAXIOLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10610', N'LULH840330DL1', N'HECTOR LUQUE LUQUE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10611', N'GALR6507137WA', N'RAFAEL GASTELUM LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10612', N'ROPR510110B55', N'RAQUEL ROMAN PINEDA')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10613', N'BEAR5106105TA', N'REFUGIO BECERRA AGUILAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10614', N'LILR720429AZ3', N'REFUGIO MARTINA LIMON LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10615', N'LOLR821105Q95', N'RICARDO LOREDO LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10616', N'MOGR7202198L3', N'ROSA ISELA MOLINA GUZMAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10617', N'CASS411110P33', N'SANTOS CASTRO SOTO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10618', N'MARJ5508216W9', N'J.GUADALUPE MARTINEZ RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10619', N'VAMJ870409557', N'JAVIER BALDEMAR VALDEZ MASCAREÑO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10620', N'MAGJ9603269J5', N'JESSICA SELENE MARTINEZ GODINEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10621', N'AUVJ600228LUA', N'JESUS ANGULO VERDUZCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10622', N'LOAS571010C35', N'SERGIO ADRIAN LOPEZ ARREDONDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10623', N'OUDS760421CW5', N'SERGIO OSUNA DOMINGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10624', N'VAUJ830816UI6', N'JESUS ALBERTO VAZQUEZ URIBE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10625', N'RURT6411096N8', N'TEODORO RUIZ RUELAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10626', N'FESU911213TZ8', N'ULISES FELIX SAÑUDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10627', N'FESU8909261G6', N'UZIEL FELIX SAÑUDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10628', N'SOFJ750826US7', N'JESUS MARCIAL SOSA FAVELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10629', N'MOGV430719AR9', N'VICENTE MOLINA GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10630', N'AULJ891130VE2', N'JESUS MARIELA ANGULO LEYVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10631', N'CABJ720216784', N'JESUS MARTIN CAMACHO BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10632', N'MOJJ740820D94', N'JESUS RAMON MOLINA JACOBO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10633', N'SABJ691227JT3', N'JORGE SALOMON BENITEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10634', N'MELJ7303257E8', N'JORGE LUIS MEDINA LARA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10635', N'SOIA6901301P0', N'JOSE ABRAHAM SOSA IRIBE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10636', N'MAJE3202108B8', N'JOSE JESUS MARTINEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10637', N'MABL600807886', N'JOSE LUIS MARTINEZ BAZQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10638', N'MUCM780517B50', N'JOSE MIGUEL MUNDACA CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10639', N'GALJ4511157A9', N'JOSEFINA GASCA LARA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10640', N'LOJJ360127NS3', N'JUAN PABLO LOPEZ JIMENEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10641', N'RUSJ440516GC8', N'JUANA RUBIO SOTO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10642', N'CUFL870807BI1', N'LORENZO ANTONIO CRUZ FAVELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10643', N'VEVM390310MK2', N'MACARIO VEGA VIZCARRA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10644', N'EIMM731125BW0', N'MAGDALENA ESPINOZA MENDOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10645', N'GACM7302103F2', N'MAIDA IMELDA GAXIOLA CORTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10646', N'MELM7807019M6', N'MANUEL MEDINA LARA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10647', N'MUCM740715FZ9', N'MANUEL MUNDACA CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10648', N'CAGM620425C55', N'MARCOS JESUS CAMARGO GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10649', N'CALM421120PJ6', N'MARGARITO CASTRO LIERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10650', N'OEAN590802421', N'MARIA DE LOS ANGELES ERNESTINA OBESO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10651', N'AUCC7212317D6', N'MARIA DEL CARMEN ANGULO CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10652', N'PAVC690716QH1', N'MARIA DEL CARMEN PAYAN VILLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10653', N'LORR5110174F2', N'MARIA DEL ROSARIO LOPEZ ROJO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10654', N'FABE580825821', N'MARIA ELENA FAVELA BELTRAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10655', N'AUVE620715T19', N'MARIA ENRIQUETA ANGULO VERDUZCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10656', N'TICE5301018Z3', N'MARIA ESTHELA TIRADO CEJA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10657', N'GAFL750213SC0', N'MARIA LOURDES GARCIA FAVELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10658', N'AULM9405138Y3', N'MARIBEL ANGULO LEYVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10659', N'VAMM571226TY8', N'MARINA VALDEZ MEZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10660', N'TARM5608129V4', N'MARIO TARIN RENDON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10661', N'CACM400526CKA', N'MIGUEL BELEN CAMACHO CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10662', N'SOFM351202HJ9', N'MIGUEL SOSA FLORES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10663', N'REAN7008245BA', N'NEDEL REYES ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10664', N'UIZN7705161P7', N'NEDEL URIAS ZUÑIGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10665', N'MEDN790206739', N'NEREYDA MEJIA DUARTE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10666', N'LOCN800920TI2', N'NORA KARINA LOPEZ CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10667', N'LEMO4209277Q3', N'OBED LEYVA MONTOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10668', N'AUBP5906291N2', N'PABLO AGUIRRE BARAJAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10669', N'VESP7609061A0', N'PABLO HUMBERTO VERDUGO SANTOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10670', N'LELY621112N28', N'YOLANDA LEYVA LANDEROS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10671', N'RASS550713588', N'SILVANO RAMIREZ SOTELO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10672', N'LESP6908273Y9', N'PEDRO ANTONIO LEAL SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10673', N'BALR6908319B7', N'RAMON NOE BAEZ LEYVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10674', N'UIAR620222A64', N'RODOLFO URIBE APODACA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10675', N'AUCR521005U56', N'ROSARIO AGUILAR CUEVAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10676', N'LORU530228P13', N'RUBEN ANTONIO LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10677', N'AUVS6601229W1', N'SERGIO ANGULO VERDUZCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10678', N'LEOU6609075W7', N'UVALDINA LEYVA OBESO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10679', N'MOLV410714CK0', N'VENTURA MONTOYA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10680', N'LOCY5207057Z5', N'YOLANDA LOPEZ CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10681', N'AOBA740411U91', N'ADRIANA LIDIA ACOSTA BUITIMEA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10682', N'MACA860924CD2', N'AGUSTIN MARTINEZ CABRERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10683', N'EME9706039U4', N'ESSILOR MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10684', N'PIA830912IL3', N'PROVEEDORA DE INSUMOS AGROPECUARIOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10685', N'LOSJ910812DG6', N'JESUS FRANCISCO LOPEZ SOTO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10686', N'AOCC860805L37', N'JOSE CARLOS ACOSTA CHAVIRA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10687', N'AOCL881031H3A', N'LUIS FRANCISCO ACOSTA CHAVIRA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10688', N'DIUD4804079U3', N'DALIA DELFINA DIAZ URIAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10689', N'AKO190924PI7', N'AGRICOLA KORNY SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10690', N'UIGE6103128F7', N'ELEACIN URIAS GAXIOLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10691', N'UISE581227395', N'ENCARNACION URIAS SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10692', N'EAHC540318HC9', N'CELIA ESTRADA HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10693', N'LOCE720912MMA', N'EDGAR LOPEZ CERVANTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10694', N'SABE731210KC4', N'EMMA SANDOVAL BORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10695', N'VEVF490318SI3', N'FELIDA VERDUGO VERDUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10696', N'GUSG460306EV7', N'GILBERTO GUTIERREZ SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10697', N'ROFJ540624A43', N'JUAN ANTONIO ROSALES FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10698', N'MEVI290423IXA', N'VICTORIA MEDINA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10699', N'VEHI740810IZ7', N'IGNACIO VEGA HERRERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10700', N'VICL6005148N6', N'JOSE LUIS VILLEGAS COTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10701', N'LUCM530124U59', N'MANUEL DE JESUS LUQUE CAMARGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10702', N'PEIM540224NU7', N'MARTHA OLIVIA PEÑUELAS INZUNZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10703', N'EAOC621008BY4', N'MARIA DEL CARMEN ESTRADA OLVERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10704', N'AICG700116U4A', N'MARIA GUADALUPE AVILA CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10705', N'CAMR5204301M1', N'RAMONA CAMACHO MASCAREÑO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10706', N'EAGV751229PD8', N'VICTOR MANUEL ESTRADA GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10707', N'GAAR371122PR2', N'RAMIRO GARCIA ALVAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10708', N'PEBF511110AR1', N'FLORENCIO PEREZ BORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10709', N'VIGF630920EH1', N'FRANCISCO VILLEGAS GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10710', N'CAAG7111032CA', N'GABRIEL CHAVEZ ACOSTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10711', N'PACR400925ML2', N'RAMON LORENZO PALAFOX COTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10712', N'ROFL6509055S7', N'LUIS ENRIQUE ROSALES FELIX')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10713', N'CACR771113AT8', N'RAMSES CAMACHO CAZAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10714', N'ROBS770521JDA', N'SILVIA RODRIGUEZ BRICEÑO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10715', N'UIUJ401128K16', N'JESUS URIAS URIAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10716', N'QUST6010137G1', N'TEODORO QUEVEDO SALOMON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10717', N'CAVJ5310257XA', N'JESUS OCTAVIO CARRASCO VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10718', N'VIGJ720412CI2', N'JULIO CESAR VILLEGAS GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10719', N'LOBN410411QE1', N'NAZARIO LOPEZ BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10720', N'LUPS500711QC8', N'SARA LUGO PEÑA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10721', N'RARV410223RR1', N'VICENTE RAMIREZ RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10722', N'MOFJ320205767', N'MARIA DE JESUS MONTOYA FERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10723', N'BORJ5010242D5', N'J BASILIO BOJORQUEZ RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10724', N'COCM780718Q64', N'MARINA LEONOR COTA CONTRERAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10725', N'MEVR700622AI7', N'RODOLFO MENDIVIL VALENCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10726', N'LEMS3710052RA', N'SOFIA LEYVA MIRANDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10727', N'AED1512025T9', N'AGRICOLA EDWARPER SPR DE RI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10728', N'BOGE5405033F7', N'ELIAZAR ANTONIO BOJORQUEZ GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10729', N'RUOG680107TUA', N'GABRIEL RUIZ ORTEGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10730', N'GOPA361208SP7', N'ALFONSO GODINEZ PINEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10731', N'AJA1404103Z6', N'AGRICOLA JAYAJO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10732', N'BOGA610820RZ6', N'AMALIA BOJORQUEZ GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10733', N'HABB881111MC5', N'BIANCA VANESSA HARO BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10734', N'VISB600424Q40', N'BARTOLO VILLALOBOS SOTO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10735', N'BEMF400202P18', N'FERNANDO BELTRAN MORALES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10736', N'AEUH400317987', N'HERIBERTO ARELLANO URIAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10737', N'LECS531219NUA', N'SILVERIO LEYVA CERVANTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10738', N'LELV710505866', N'VICTOR JOEL LEYVA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10739', N'PAMR911006G74', N'ROSARIO GUADALUPE PACHECO MORENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10740', N'CAGM531205613', N'MARIO ENRIQUE CASTRO GUERRERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10741', N'PERM7108302B3', N'MARIO RAUL PEREZ ROJO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10742', N'LECI460518FR7', N'JOSE IGNACIO LEPE CARDENAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10743', N'AARP930821NW2', N'PEDRO ALBERTO ALVAREZ ROMAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10744', N'MELA680924E68', N'AURELIO MEDINA LEYVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10745', N'LOFC880213F26', N'CARLOS RAMON LOPEZ FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10746', N'LOFD860114E50', N'JOSE DOLORES LOPEZ FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10747', N'CAD190417EX9', N'COMERCIALIZADORA AL GRANO 2019 SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10748', N'MABP710429RB0', N'PETRA GUADALUPE MATA BARRADAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10749', N'PAAP900418HIA', N'PAULINA PADILLA ARREOLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10750', N'GAAR530521994', N'ROSARIO GARCIA AYALA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10751', N'TEGE860416L79', N'ERIC EMMANUEL TREVIÑO GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10752', N'NAA020423CU6', N'NUTRIMENTOS ACUICOLAS AZTECA S.A DE C.V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10753', N'PRR9502198D1', N'LAGUNA DE ORO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10754', N'FEGR780319T56', N'RAFAEL FERNANDEZ GOMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10755', N'AEDS720303MZ1', N'SUSANA ARECHIGA DIAZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10756', N'ARS051205Q56', N'ENCORE EVENT TECHNOLOGIES MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10757', N'LIC071025SW1', N'CARTERA LOGISTICS INTEROCEANICA DE CARGA S.A DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10758', N'GOHM740915JI6', N'JOSE MIGUEL GONZALEZ HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10759', N'GULL650107L41', N'LUIS ALFREDO GUTIERREZ LEON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10760', N'AES06082624A', N'AGRICOLA EL ESPEJO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10761', N'EIBC7306209U8', N'CASTULO ESPINOZA BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10762', N'AEVC3909272A3', N'COSME ARMENTA VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10763', N'VAPF650215I17', N'FAUSTINO VALENZUELA PAREDES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10764', N'BORG5810127N4', N'GUSTAVO BOJORQUEZ RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10765', N'SABD701017NU8', N'JOSE DAGOBERTO SANCHEZ BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10766', N'MIFR561007J52', N'JOSE ROBERTO MIRANDA FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10767', N'CAPM430821157', N'MANUEL HUGO CARRILLO PUERTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10768', N'IURL700216640', N'LUIS FELIPE ITURRIOS RENTERIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10769', N'IUEL941108MV7', N'LUIS FERNANDO ITURRIOS ESPINOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10770', N'RECM500118996', N'MARTHA ELENA RENTERIA CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10771', N'CACP670518EU8', N'PATRICIA CASTRO CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10772', N'EIBV670906HK4', N'VICTOR MANUEL ESPINOZA BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10773', N'EICV8904177P9', N'VICTOR MANUEL ESPINOZA CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10774', N'MIEY890117LC0', N'YENIVE GUADALUPE MIRANDA ESPARZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10775', N'SOGF3901101J5', N'FRANCISCO SOTO GASTELUM')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10776', N'AUCJ640131BY7', N'JOEL ANGULO CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10777', N'LOCN800920T21', N'NORA KARINA LOPEZ CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10778', N'SAMA820513GM1', N'ARALI SANCHEZ MONTOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10779', N'NAMF420407SS0', N'FRANCISCO NARANJO MORENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10780', N'SAAE7001193J9', N'EFREN RODRIGO SANCHEZ ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10781', N'HALG630817BC9', N'GILBERTO HANSEN LEON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10782', N'AVC990301EVA', N'AGRICOLA VALDEZ CORRALES SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10783', N'VALB750322PA8', N'BLANCA IRENE VALENZUELA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10784', N'MORC4112254YA', N'CELIDA MONTIEL ROMAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10785', N'TIAC661124F87', N'CESAR ALBERTO TIRADO ALVAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10786', N'MORE8610137J6', N'ENRIQUE MORALES ROBLES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10787', N'COCE490911NE5', N'EPIFANIO COTA COTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10788', N'CALE810811KL5', N'ERENDIDA DANAE CARRILLO LOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10789', N'MOGF450215HU6', N'FAUSTINO MOLINA GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10790', N'LOLF460223E59', N'FLORENCIO LOPEZ LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10791', N'VERA670415U18', N'ANASTACIO VERDUGO RUBIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10792', N'RERB880122G67', N'BRENDA BEATRIZ REYES RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10793', N'OOVI550111HXA', N'INDOLFO MARINO OCHOA VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10794', N'QUAJ630304JZ1', N'JAIME ARTURO QUINTERO ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10795', N'VACG650417F34', N'GLORIA VACA CISNEROS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10796', N'AEGA980709A76', N'JOSE ALBERTO ARMENTA GAXIOLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10797', N'PADA83100174A', N'JOSE ALBERTO PALAFOX DOMINGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10798', N'FIVJ7401256M9', N'JUAN CARLOS FIERRO VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10799', N'ROMJ660327UP9', N'JUANA ROBLES MORENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10800', N'LORM920815Q1A', N'MARIA LOPEZ RENTERIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10801', N'AOVM641116321', N'MARICELA APODACA VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10802', N'CALP7804274K4', N'PORFIRIO ALBERTO CARRILLO LOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10803', N'NABR321126CL2', N'RAMON NAZERAU BORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10804', N'VAOT911113AY1', N'TANIA LIZETH VALENZUELA ORTEGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10805', N'AEAH450813FX4', N'HIPOLITO ARMENTA ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10806', N'VALI661027J8A', N'IGNACIO VALDEZ LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10807', N'BARI690113S11', N'ILDEFONSO BAJO ROJAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10808', N'VEAJ450911R63', N'JACINTO VERDUGO ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10809', N'LEJE540522MX7', N'JESUS MANUEL LEYVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10810', N'GOAA601023MG3', N'JOSE ALBERTO GONZALEZ ATONDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10811', N'GOAA680701AT7', N'JOSE ARON GONZALEZ AHUMADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10812', N'RULJ510922PQ5', N'JUAN RUBIO LEYVA')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10813', N'OIAL6408257J5', N'MARIA LUISA OLIVAS ALCALA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10814', N'GUOM451010UT4', N'MARIA MARTA GUTIERREZ OBESO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10815', N'CAGM660809DF8', N'MIGUEL ANGEL CAMARGO GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10816', N'VECO391028I92', N'OCTAVIO VERDUGO CERVANTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10817', N'GAAJ540202KJ2', N'JESUS CANDELARIO GAXIOLA ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10818', N'AELJ6206174S7', N'JUANA ARREOLA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10819', N'HEVJ8108142H2', N'JULIO BERNARDO HERALDEZ VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10820', N'AUGE900323PUA', N'ELEAZAR ANGULO GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10821', N'FEGD5603063Y8', N'DAVID FERNANDEZ GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10822', N'CAGM660809DF8', N'MIGUEL ANGEL CAMARGO GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10823', N'FIEJ8701252U3', N'JORGE ABEL FIGUEROA ESTRADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10824', N'FIEP9102084T4', N'PABLO CESAR FIGUEROA ESTRADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10825', N'MAFG870523MZ7', N'GIBRAN GUADALUPE MARTINEZ FALOMIR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10826', N'PAVJ630713430', N'JERONIMO PALAFOX VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10827', N'GOGR600210255', N'RAYMUNDO GONZALEZ GALLEGOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10828', N'ROGC690919N71', N'CLAUDIA MARIA ROSALES GURROLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10829', N'IUTJ630601RA5', N'JESUS INZUNZA TRIAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10830', N'AOCC680716FE2', N'JOSE CARMEN ASTORGA CERVANTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10831', N'CELR780814PN0', N'MARIA DEL ROSARIO CERVANTES LUQUE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10832', N'TIIS390627TA9', N'SOILA TRIAS INZUNZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10833', N'GART601002163', N'TOMAS GALVAN RUIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10834', N'HEFA8605287H1', N'ABRAHAM HEREDIA FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10835', N'PAGA9107168F9', N'ALEJANDRO ELI PALAFOX GALLEGOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10836', N'CALA770317HQ9', N'ARCELIA CARRILLO LOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10837', N'VEAA680924BB9', N'ARNOLDO VEGA ALVAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10838', N'FABF810520U63', N'FRANCISCO FALOMIR BERNAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10839', N'LOVF950925TA7', N'FREDDY ANTONIO LOPEZ VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10840', N'CALG8504306V2', N'GENOVEVA CARRILLO LOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10841', N'PAVI5803305S5', N'IRMA YOLANDA PARRA VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10842', N'CAGX690928793', N'ALDO ENRIQUE CASTRO GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10843', N'LEGA550310817', N'ARMANDO ANTONIO LEAL GAXIOLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10844', N'OALI811102213', N'MARIA ISABEL ORRANTIA LUNA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10845', N'BAVS881011JT3', N'SANDY MERCEDES BAÑUELOS VEGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10846', N'CAAL7112252S1', N'JOSE LUIS CARRILLO ABOYTE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10847', N'CACE711010F14', N'ESEQUIEL CAMACHO CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10848', N'HIRM7001172R4', N'MARCO ANTONIO HIGUERA RUBIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10849', N'UISP620105926', N'PEDRO URIAS SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10850', N'EILR4608299P0', N'RAMON ESPINOZA LEAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10851', N'EICR000410MP0', N'REBECA ESPINOZA CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10852', N'CFI190214FC2', N'LA CONCHA DE LOS FIGUEROA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10853', N'COMF650531FH8', N'JOSE FERNANDO COTA MURRIETA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10854', N'FOLA471029N99', N'APOLINAR FLORES LOERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10855', N'ACA1712306L9', N'AGRICOLA CANUTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10856', N'AELU611127R33', N'JOSE DE LA LUZ ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10857', N'LOHJ770821Q68', N'JAVIER LOPEZ HIGUERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10858', N'CALJ9808206M6', N'JULIO ANDRES CHAVIRA LOMELI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10859', N'RULR3901174Y7', N'MARIA DEL ROSARIO RUIZ LEON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10860', N'CUGM761016DXA', N'MARIO ALBERTO CRUZ GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10861', N'HEES720106IF8', N'SERGIO HEREDIA ESTRADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10862', N'ADY060810C14', N'AGRICOLA DYRENE SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10863', N'CNS0803102Z9', N'CALLE # 7 SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10864', N'GUMC770401CY4', N'CAMILO GUTIERREZ MARTINEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10865', N'CAVL6810062Z2', N'LUZ DEL CARMEN CHANG VELIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10866', N'BELS860907IW1', N'SAUD ISAAC BENARD LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10867', N'PASD820923RB0', N'DIANA PAOLA PALAFOX SIERRA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10868', N'LOPF551129AG6', N'FELIPA LOYA PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10869', N'VACF8301212Y2', N'FRANCISCA VALLE CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10870', N'SIZK760106MCA', N'KIMBERLY MARIE SWIFT ZARATE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10871', N'LOQE7101036G6', N'ELOY LOPEZ QUIÑONEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10872', N'RURL680706NK4', N'LAURA RUBIO RENTERIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10873', N'GOVN761112GK5', N'NICELINA GOMEZ VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10874', N'UEBM6606154Q3', N'MIGUEL ANGEL URETA BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10875', N'UERM8802132G7', N'MIGUEL ANGEL URETA RUBIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10876', N'ABE011201M84', N'AGRICOLA BERSE SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10877', N'UEBU281021BH5', N'URBANO URETA BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10878', N'PEAA781111PQ4', N'ANNABELL PEÑUÑURI AGUILAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10879', N'MORB680508PE8', N'BRENDA LISSETTE MONTIEL RUELAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10880', N'MORS770406QD5', N'SERGIO MONTIEL RUELAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10881', N'EAMR641129573', N'ROBERTO ESTRADA MORENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10882', N'LOPM770902AH7', N'MARCO ANTONIO LOPEZ PIÑA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10885', N'ALO130918357', N'AGRICOLA LOUISIANA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10887', N'COLJ740701IS3', N'JOEL CONTRERAS LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10911', N'GAMA490315P97', N'ABRAHAM GAXIOLA MONTOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10951', N'SOSJ891215885', N'JESUS GUADALUPE SOTELO SOTELO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10971', N'TASM590824437', N'MIREYA MARISELA TRASVIÑA SOTO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10991', N'UIVF621010UN0', N'FRANCISCA URIAS VERDUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10994', N'VACD610423RK4', N'MARIA DOLORES VALENZUELA CARRASCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'10999', N'RIFR711215SI2', N'RIGOBERTO RIVERA FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11002', N'BASJ430307EK8', N'JULIA BARRON SALMERON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11003', N'BEBV6204151S3', N'VICTOR MANUEL BERUMEN BARRON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11007', N'CACE560529GZA', N'ERNESTINA CARRAZCO CAMARGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11008', N'MECR831024GA4', N'RAFAEL MERCADO CARRAZCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11010', N'UIVF710906DM0', N'FAUSTO URIAS VERDUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11011', N'BILI740827CL5', N'ISELA GUADALUPE BRISEÑO LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11028', N'AAV1507295W5', N'AGRICOLA ARROYO VIEJO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11048', N'CARG750916KRA', N'GISELA CAZAREZ RIOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11061', N'CUCR4809237T2', N'RAMON ANTONIO CUADRAS CINCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11062', N'CUMF450124952', N'FELICIANO CRUZ MELENDREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11064', N'MOAE580531F65', N'ERNESTO MORALES ACOSTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11070', N'MUEP540818T4A', N'PEDRO MUÑOZ ESCARREGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11072', N'NALE341128LL3', N'ESTEBAN NAVARRO LEAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11079', N'GUPE500909L9A', N'PEDRO GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11080', N'MELG501103BD5', N'GERMAN MEXIA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11087', N'MUAD771025193', N'DALEYDA JUDITH MUÑOZ ACOSTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11098', N'ACE181113DK1', N'AGRICOLA CEIVAN SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11104', N'LUAM740319MS1', N'JOSE MANUEL LUGO ARCE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11105', N'VIGJ971020U17', N'JUAN CARLOS VILLEGAS GALVEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11118', N'BEAJ5109125K6', N'JOSE BELTRAN ARCE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11123', N'PECI850707BE6', N'ISAAC MAURICIO PEÑA CAÑEDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11130', N'LUAF720616UX0', N'FRANCISCA LUGO ACOSTA')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11136', N'MEAD801121A7A', N'DORA ALICIA MELENDRES ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11148', N'GUHE600507UP2', N'ENRIQUE GUERRERO HARO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11149', N'AGA010416962', N'AGRICOLA GACO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11156', N'GAGR461009RN4', N'RAMON GAMEZ GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11160', N'IURA760712F74', N'ALEJANDRO ITURRIOS RENTERIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11176', N'ARE1104286Q6', N'AGRICOLA EL RELAMPAGO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11200', N'APE1407142C5', N'AGRICOLA DE LOS PEREA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11218', N'FIRM3108187H8', N'MARTIN GILBERTO FIERRO RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11230', N'COCL410320SV2', N'LIDIA ESTELA COTA CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11554', N'VAAM480713VB1', N'MANUEL VALLE ARCE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11565', N'VIMI740728DX2', N'ISAEL VILLEGAS MORENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11567', N'GABG720121MW7', N'GRACIELA GALVEZ BENITES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11568', N'BOVK7410295W8', N'KAREN BOJORQUEZ VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11576', N'AEFG780624PE6', N'GABRIELA ARCE FONSECA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11578', N'CUMA680703DAA', N'ANICACIO CUEVAS MORENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11579', N'LOMA991220D83', N'AUDON LOPEZ MORENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11587', N'GUMG4802175Y9', N'GILBERTO GUERRERO MIRANDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11599', N'ABA110603T7A', N'AGRICOLA EL BUEN ARADO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11601', N'BECF460105QQ9', N'FELIPE BERNAL CERVANTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11620', N'BEBA610524ES9', N'ANTONIO BERNAL BELTRAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11621', N'PAMR620328EC1', N'ROSA MARIA PASTRANO MORENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11626', N'LOEA500209VB7', N'APOLONIO LOPEZ ESPINOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11630', N'CELA4701028N5', N'AGUSTIN CERVANTES LEYVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11638', N'CAVJ561225ID5', N'JESUS ESTELA CASTRO VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11658', N'BAEB541125PS9', N'BENITO BAEZ ESPINOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11686', N'AALL740921GU4', N'JOSE LUIS ARAUJO LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11695', N'ROCD600201EG8', N'JOSE DAGOBERTO ROJO CHAVIRA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11696', N'RUVM540828B69', N'MOISES RUBIO VILLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11703', N'PAPJ7604114Y6', N'JESUS ROSARIO PALAFOX PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11708', N'SASA0102113I0', N'ANGELES MARIA SANDOVAL SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11709', N'SASM930309EV8', N'MIGUEL SANDOVAL SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11711', N'VABJ5808033W9', N'JAVIER VAZQUEZ BORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11712', N'SACH740112MJ6', N'HORTENCIA SANCHEZ COTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11713', N'PEMF580616JZ9', N'FELICIANO PEÑUELAS MERCADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11714', N'SABH710325UXA', N'HUMBERTO SANDOVAL BORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11722', N'GOSD5912115A7', N'DANIEL GOMEZ SOTELO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11742', N'LAUR860705828', N'ROSARIO ALICIA LACHICA URIAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11745', N'LEVM810730KW0', N'MANUEL ALBERTO LEY VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11763', N'ROOR6009043Y8', N'ROSALIA RODRIGUEZ ORDUÑO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11776', N'GASC740211E50', N'CARLOS RAMON GALLEGOS SANDOVAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11779', N'ALO170822814', N'AGRICOLA LOESMA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11797', N'SOBE010621C96', N'ERNESTO SOTELO BUENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11798', N'UICF001025JL8', N'FAUSTO JESUS URIAS CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11805', N'SOEG310901IJ1', N'GILBERTA SOTELO ESPINOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11812', N'SOUV470707UL4', N'VIRGILIO SOLANO URIAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11826', N'SERH471117QW1', N'HUMBERTO SERRANO RUIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11832', N'MERJ811215215', N'JESUS ALEJANDRO MERAZ ROJO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11833', N'MEMM861117TR4', N'MARIBEL MENDIVIL MIRANDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11834', N'MIVG640401CR3', N'GLORIA MIRANDA VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11837', N'RUOG680107TUA', N'GABRIEL RUIZ ORTEGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11838', N'BEBC9708239A8', N'JOSE CARLOS BELTRAN BENITEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11839', N'BEBK991019TW1', N'KEVIN IGNACIO BELTRAN BENITEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11848', N'VIMM721110HD8', N'MAURO VILLAGOMEZ MENDOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11855', N'RAEJ5507313PA', N'JUAN MANUEL RAMIREZ ESPINOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11868', N'CAEA511204V60', N'ARMIDA CASTRO ESPINOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11870', N'CALG490104V5A', N'GUILLERMO CASTRO LIERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11871', N'UIHR840131K87', N'ROSARIO URIAS HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11876', N'ACA171229VD4', N'AGRICOLA CASARA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11899', N'UICA450903Q12', N'ANGELA URIBE CASTILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11900', N'GOUR7412061UA', N'RICARDO GODINEZ URIBE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11915', N'CAVO951229CV2', N'OLIVIA CASTRO VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11916', N'CAVT940112RP3', N'TATIANA CASTRO VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11917', N'CARJ640417HM0', N'JESUS MANUEL CASTRO ROJO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11919', N'ACA0806267U6', N'AGRICOLA CANACHO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11920', N'EGL160502SC2', N'4E GLOBAL SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11921', N'CEM2002204G6', N'COMERCIALIZADORA EMRM S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11922', N'SAG100803E19', N'SAGAQUIM S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11923', N'PWM190619NS0', N'PLEXUS WORLDWIDE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11924', N'GLE131008MN4', N'GRANEROS LERMA S.P.R DE R.L')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11925', N'FOM0505097A6', N'FIBRAS OPTICAS DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11926', N'CAEJ7909214P4', N'JORGE ALBERTO CALDERON ESPINOSA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11927', N'RASG7904167M5', N'GRACIELA RAMOS SANTOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11928', N'ROTB770827SL3', N'MARIA BARBARA RODRIGUEZ TAPIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11929', N'CEA990830FA6', N'CEAGRO SPR DE RL (NO USAR)')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11930', N'MND951206SPA', N'MYN DISTRIBUIDORA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11931', N'NAT0104253X3', N'NATURASOL S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11932', N'METL9507246L0', N'LUCAS MATIAS MEDAL TRINIDAD')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11933', N'DMP070315GZ1', N'DISTRIBUIDORA METROPOLITANA DE  PAPEL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11934', N'DASJ620117DZ5', N'JESUS ROBERTO DAVILA SANDOVAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11935', N'OIJS771123H68', N'SERGIO ORTIZ JIMENEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11936', N'ACJ120821R81', N'AGRICOLA CHAVEZ JAQUEZ SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11937', N'IME1407154V2', N'IOM DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11938', N'ECD150408QDA', N'EI CARGA Y DISTRIBUCION S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11939', N'DME181018KS0', N'DARIGOLD MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11940', N'RPM031001DW0', N'RED POSTAL MEXICANA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11941', N'ASP020215CH6', N'ENCERVSA S.A DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11942', N'VAGL960521RU2', N'LUIS ANTONIO VALERIO GALINDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11943', N'CALL730803Q1A', N'LILIA DEL CARMEN CAMPOS LEPE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11944', N'HEVR710304MPA', N'ROSA MARIA HERNANDEZ VIRRUETA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11945', N'SEGJ0107099Y6', N'JARED ALBERTO SERRANO GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11946', N'CUSA831208E16', N'ALDO CUEVAS SANDOVAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11947', N'MEBG691025N79', N'GABINO MESTIZA BAUTISTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11948', N'WLA180118FW6', N'WAVETEC LATAM S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11949', N'ACM0502241Z5', N'ACUICOLA CUATE MACHADO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11950', N'GZM171115412', N'GRUPO ZAMORA MEXICO 2017 S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11951', N'STE180102B86', N'SEAL TELECOM S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11952', N'MMO0501142T5', N'MOTOS MORELIA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11953', N'CMO9707163F0', N'COMERCIALIZADORA DE MOTOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11954', N'MMO870813LR2', N'MATSURI SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11955', N'ROPL580602TS2', N'JOSE LUIS RODRIGUEZ PRADO')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11956', N'MEBF860118EH4', N'FRESA MENDOZA BRANDY')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11957', N'LCO1405275L6', N'LOCKERS COMESA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11958', N'CIC050729BH6', N'CARTERA CONSORCIO INTERNACIONAL DE CARNES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11959', N'GACS810829AZ8', N'SANDRA GARCIA CHAIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11960', N'AIG191105CG3', N'AGROINSUMOS IMPORTADOS GUIPAUL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11961', N'POL060222VA2', N'POLIMADE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11962', N'AGR841003D96', N'AGROCRIBAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11963', N'AGG000808N45', N'ARRENDADORA GAMBOA GONZALEZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11964', N'JHM021008HZ4', N'JF HILLEBRAND MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11965', N'LEF1505256V4', N'L EPICERIE FRANCAISE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11966', N'XEXX010101000', N'ALLPORT CARGO SERVICES USA INC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11967', N'ACT050922360', N'AGRICOLA COMERCIAL DE LA TRINIDAD SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11968', N'XEXX010101000', N'GENERAL ELECTRIC COMPANY')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11969', N'NAT0104253X3', N'CARTERA NATURASOL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11970', N'PIS010511M28', N'PRESTADORA INTEGRAL DE SERVICIOS PARA LA INDUSTRIA DE OCCIDENTE S.A DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11971', N'MAS141030U24', N'MASARELA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11972', N'GDE140620312', N'GRUPO DEGAG SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11973', N'PEM170317EM6', N'PRODUCTOS ESPECIALIZADOS DE MEXICO DDM S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11974', N'FLO170202DL1', N'FIT LOGISTICS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11975', N'XME2004234M6', N'XETADE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11976', N'IAF061020SX0', N'INMOBILIARIA Y ARRENDADORA LA FORTALEZA S.A DE C.V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11977', N'SAC060711K70', N'SERVICIOS CORPORATIVOS SCOTIA S.A DE C.V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11978', N'GCM17051139A', N'GRAINDESK COMMODITIES MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11979', N'AAS9406255Y0', N'ASOCIACIONES AGROINDUSTRIALES SERRANAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11980', N'DMR1602264N0', N'DISTRIBUIDORA DE MATERIALES REPUBLICA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11981', N'NUT110415S78', N'NOGALEROS UNIDOS TECNIFICADOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11982', N'SHU040119HR6', N'SEMILLAS EL HUNGARO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11983', N'NORH920411JM1', N'HECTOR FERNANDO NORIEGA RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11984', N'FSA200130JCA', N'FELIX SOLIS AVANTIS MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11985', N'CCA180420ME9', N'CERVEZA CALAVERA SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11986', N'ANX940223JQ0', N'ALEN DEL NORTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11987', N'OECE691122P44', N'EFREN OBESO CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11988', N'LOCH731004SC4', N'HUMBERTO LOPEZ CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11989', N'SEVC8203119D3', N'CARLOS JESUS SEPULVEDA VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11990', N'COPS460725582', N'SANTIAGO CORTEZ PASOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11991', N'BEMS690729DA6', N'SALVADOR BECERRA MARTINEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11992', N'MAMS7010089Q1', N'SERGIO MARTINEZ MARIN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11993', N'FOCA4802089TA', N'ATILANA FLORES CHAVEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11994', N'RIOC8207075Q8', N'CLAUDIA LIZETH RIVERA ORTEGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11995', N'HEEM750512V74', N'MARCOS CESAR HEREDIA ESTRADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11996', N'HEEP511109CP8', N'PEDRO HEREDIA ESTRADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11997', N'HERP860924RA4', N'PEDRO ALBERTO HEREDIA RENDON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11998', N'VAVL9706121S8', N'LUIS ISRAEL VALDEZ VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'11999', N'VACA670903IU7', N'ALMA JUDITH VALENZUELA CARRASCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12000', N'COCA620816GU1', N'ARACELI COTA CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12001', N'METL480304LAA', N'LEOPOLDO MEDINA TINOCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12002', N'MARY870921V24', N'YERENE GUADALUPE MARTINEZ RUBIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12003', N'CALJ970520G29', N'JOEL OMAR CASTRO LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12004', N'CAVG6403301J9', N'GLORIA CAMACHO VERDUZCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12005', N'PLE12022188A', N'PLECAMER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12006', N'BSC940905F38', N'BODEGA DE SEMILLAS DEL CAMPO 305 COLONIA JAGUEYES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12007', N'SAPD830831TA2', N'DAYNA SANTOS PERALTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12008', N'MME200609CNA', N'MINELAB DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12009', N'ASC080922583', N'CARTERA AGROPRODUCTORES SAN CAYETANO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12010', N'JAT130401M59', N'CARTERA JICOTILLO DE ATOTONILCO SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12011', N'MPR200914H59', N'MALCAM PRODUCTOS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12012', N'HVA080624169', N'HACIENDA LOS VALDIVIA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12013', N'GCE970116GE6', N'CARTERA GRANEROS CEDILLOS S.A. DE C.V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12014', N'ARA170210DL5', N'CARTERA AGROALMACENADORAS RAMIREZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12015', N'BCA0303127J9', N'CARTERA BALL CASTRO AGRICULTORES SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12016', N'MOAR780511614', N'RENE MORALES ALVARADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12017', N'CCC130221EL3', N'COMERCIALIZADORA CAMARONICOLA CEA´S S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12019', N'XEXX010101000', N'LA NOGALERA USA, INC.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12020', N'REBA650131DC0', N'AGANETHA REDECOP BARTSCH')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12021', N'AUDO920904GF4', N'OSCAR AGUILERA DOMINGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12023', N'AUD130624BC8', N'AGROEMPRENDEDORES UNIDOS DE LOS ALTOS SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12024', N'FSA130228PGA', N'CARTERA FINANCIERA SAKXIM SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12025', N'PME070116DB4', N'CARTERA PASION MEXICANA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12026', N'NSM010820UY4', N'NATURAL SCENTS DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12027', N'GALM860412SK4', N'JOSE MIGUEL GARCIA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12028', N'LOLH010619415', N'HEINRICH LOEWEN LOEWEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12029', N'WAKI830605SN9', N'ISAAC WALL KLASSEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12030', N'KACJ810511TL4', N'JUAN GABRIEL KAU CAHUICH')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12031', N'MAHM7011187Q0', N'MARGARETHA MARTENS HARDER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12032', N'HAKH970622SN1', N'HERMAN HARMS KLASSEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12033', N'FEHN020802GN0', N'NAEMA FEHR HARDER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12034', N'CII191028EIA', N'CHOCOLATERA IBARRA SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12035', N'COG011017FR1', N'CARTERA COGAFO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12036', N'AUDO920904GF4', N'CARTERA AGROEMPRENDEDORES UNIDOS DE LOS ALTOS SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12037', N'GIA1203311QA', N'CARTERA GRANOS E INSUMOS AGRICOLAS SAN MARTIN SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12038', N'EHM0409102X0', N'CARTERA EX HACIENDA DEL MALUCO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12039', N'HVA080624169', N'CARTERA HACIENDA LOS VALDIVIA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12040', N'UPR080630294', N'UNION DE PRODUCTORES RURALES EL CAPULIN S.P.R. DE R.L.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12041', N'LOVA931105TL3', N'ANTONIO EFRAIN LOPEZ VIVAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12042', N'VIHD791212F21', N'DAVID ENRIQUE VIVAS HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12043', N'SALE7805088E2', N'ELMA SAWATZKY LOEWEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12044', N'NEFJ991030AE1', N'JACOB NEUDORF FRIESEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12045', N'CITK901118H13', N'KIAVETH MISADAI CHI TAMAY')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12046', N'LOLW991203I70', N'WILLY LOEWEN LOEWEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12047', N'MAX181204IK0', N'MAXINEUMATICOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12048', N'AGR120824GM6', N'CARTERA AGROINSUMOS GRAFECA SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12049', N'CEA990830FA6', N'CARTERA CEAGRO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12050', N'NEFD880420151', N'DAVID NEUDORF FEHR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12051', N'OEVG590213SEA', N'GLORIA MARINA ORTEGON VERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12052', N'GAU101114PG8', N'GRUPO AGROPECUARIO LOS UICAB DE EMILANO ZAPATA S.C. DE R.L. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12053', N'WAGH0103025X0', N'HEINRICH WALL GIESBRECHT')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12054', N'HAMJ541105UJ9', N'JACOBO HARMS MARTENS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12055', N'BAVJ660418UJ1', N'JESUS DEL CARMEN BAUTISTA VILLALOBOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12056', N'GAPJ780531BA1', N'JORGE DAVID GARCIA PUGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12057', N'PENP8007223UA', N'PATRICIA DE LOS ANGELES PECH NEGRETE')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12058', N'MEI080322DI0', N'MAICEROS DEL EJIDO ICH EK SC DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12059', N'PMN100520GX0', N'PROVEEDORA DE MATERIALES NATURALES S.P.R. DE R.L. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12060', N'CGR100607L47', N'CHIA GROWERS S.P.R. DE R.L.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12061', N'APO141218Q80', N'ALGODONERA DEL PONIENTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12062', N'MHO971107F70', N'MAYA HONEY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12063', N'SLB080903DM3', N'CARTERA SEMILLAS LEMUS DEL BAJIO MICHOACANO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12064', N'YECO891102TI2', N'OSCAR DANIEL YEH CANCHE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12065', N'FIRA8907086I9', N'ANNA FRIESSEN REDECOP')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12066', N'SAM131120CC1', N'CARTERA SERVICIOS Y ASESORIA LA MAZORCA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12067', N'GRI030430AV2', N'CARTERA GRANOS EL RINCON SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12068', N'PGA040316MU0', N'PORCICOLA GARLEON S.A DE C.V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12069', N'RACE931227P80', N'CESAR AUGUSTO RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12070', N'CAUE920823V2A', N'ERIK ELEAZAR CALLES UC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12071', N'MESF830205UM0', N'FRANCISCO JAVIER MEDINA SALDAÑA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12072', N'NEBF880301EU1', N'FRANZ NEUDORF BLATZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12073', N'MACI661111NM2', N'ISIDRO MATOS CHI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12074', N'HAPM790821GB8', N'MARTHA HARDER PENNER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12075', N'YECA790921HIA', N'ALBERTO ROMAN YEH CANCHE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12076', N'HUCE480825K91', N'ENRIQUE HUCHIN CHI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12077', N'HAMJ541105UJ9', N'JACOBO HARMS MARTENS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12078', N'HEGO730606H26', N'JOSE OSCAR HERNANDEZ GUERRERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12079', N'UIKJ470624DR9', N'JUAN BAUTISTA UICAB KU')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12080', N'MAMJ430131IJ8', N'JUAN MARQUEZ MENDIOLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12081', N'WAGM880807475', N'MARGARETHA WALL GIESBRECHT')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12082', N'NICM731024771', N'MIGUEL NIETO CAMARGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12083', N'AAGS800704FY7', N'SALOME ASAC GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12084', N'AUPW5505024Q2', N'WILFRIDO AGUILAR PACHECO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12085', N'SFI191030PC7', N'SOLUCIONES EN FILAMENTO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12086', N'DICA541108KP7', N'ALEJANDRO DZIB CHAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12087', N'WIKA750425AE8', N'ANTON WIEBE KAUENHOFEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12088', N'CANJ700506LW3', N'JAVIER ANTONIO CANCHE NOH')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12089', N'FIFJ921220QI3', N'JOHAN FRIESSEN FRIESSEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12090', N'CAMO800622T65', N'OLEGARIO CASTILLO MOGUEL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12091', N'MACV730105ED6', N'VICTOR MANUEL MATOS CHI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12092', N'MOMA830907951', N'ANA LAURA MONTERO MONTERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12093', N'CAGL9108275F9', N'LIZBETH CARRILLO GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12094', N'AFO920203UG3', N'ALIMENTOS FINOS DE OCCIDENTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12095', N'ALO110324UK0', N'AMERISA LOGISTICS S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12096', N'XEXX010101001', N'KG TECHNOLOGIES INC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12097', N'PBA2011175I4', N'PULSES DEL BAJIO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12098', N'CSP090309MI9', N'CARGO SERVICIOS PROFESIONALES S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12099', N'LODA960920EY1', N'ABRAHAM LOEWEN DOERKSEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12100', N'CAPA641227BP1', N'ANGELINO CAHUICH PUCH')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12101', N'GARL811114M40', N'JOSE LUIS GALVAN RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12102', N'GIWM670222C64', N'MARGARETHA GIESBRECHT WIEBE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12103', N'CAPM7312235J5', N'MAXIMO CAHUICH PUCH')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12104', N'VAAS8505049U0', N'SALVADOR VALENCIA ALCAZAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12105', N'BEMJ560902411', N'J. CRESCENCIO BENAVIDES MARTINEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12106', N'MOAJ721217AA0', N'J. JESUS MORALES AGUILAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12107', N'PUPL830204KPA', N'LAURA DEL CARMEN PUC PACHECO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12108', N'FIGB7809194F7', N'BERNHARD FRIESEN GOERTZEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12109', N'HOIA5509208L0', N'ALBERTO HOMA IC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12110', N'GAHE700729R1A', N'EMILIANO GAMAS HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12111', N'LOFH720709P52', N'HEINRICH LOEWEN FEHR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12112', N'SAHM6503193U5', N'JOSE MANUEL SANSORES HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12113', N'NEFJ000111C15', N'JUDITH NEUDORF FEHR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12114', N'SACR660213IJ1', N'RAFAEL SALAZAR CAUICH')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12115', N'HCA2004063X7', N'HARBOR CARGO SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12116', N'UCG1508105S0', N'UNIVERSAL CARS GROUP S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12117', N'PHU9604172M3', N'PORCICULTORES DEL HUMAYA, S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12118', N'SAMF4710048V8', N'FRANCISCO SANCHEZ MENDOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12119', N'JITC730102RG3', N'CARLOS JIMENEZ TEC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12120', N'SAKE540627TH1', N'EMILIO PERFECTO SANCHEZ KANTUN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12121', N'RORF410302FG7', N'FELICIANO RODRIGUEZ RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12122', N'PEGJ341124NP9', N'JUAN PEREZ GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12123', N'FIRK9710088Z8', N'KATHARINA FRIESSEN REDECOP')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12124', N'ROZL740221Q45', N'LUIS ANTONIO ROSADO ZAMORA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12125', N'YOTM781207UG2', N'MARCELINO YOTZ TEPAZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12126', N'CODF700315RX5', N'MARIA FELIPA CONTRERAS DOMINGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12127', N'LOVP580208TD9', N'PABLO LOPEZ VIVAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12128', N'AUOP6207198R6', N'PAULINO AGUILAR OSORIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12129', N'OGRA661111651', N'RAFAEL DE LA O GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12130', N'AEDR710301PU3', N'ROBERTO AKE DELGADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12131', N'GUGA9308234L4', N'ABRAM GUENTHER GUENTHER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12132', N'WIFB891113766', N'BENJAMIN WIEBE FROESE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12133', N'AEGJ620728PUA', N'JUAN DIEGO DEL CARMEN AKE GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12134', N'COSR5412279X3', N'REYNALDO TOMAS COBA SOSA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12135', N'GAM150723TH3', N'GSM AUTOMOTIVE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12136', N'YECA790921HIA', N'ALBERTO ROMAN YEH CANCHE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12137', N'MATE590823CF4', N'ELEAZAR MARTIN TRUJEQUE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12138', N'AOMA8607107F0', N'ABDEEL ABIMAEL ATONDO MURRIETA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12139', N'PECI6512185C5', N'ILDEFONSO PEÑA CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12140', N'MART590519I41', N'MA. TERESA MACIAS RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12141', N'AGF140826RR9', N'AGROALIMENTOS GRANOS Y FORRAJES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12142', N'MEMA480729SPA', N'ALFONSO MEDEROS MARTIN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12143', N'DIYB951017TH1', N'BERLICN ROLAND DZIB YEH')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12144', N'GAYP9110209K9', N'PAULA ALEJANDRA GARCIA YEH')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12145', N'GCP010828B54', N'GRUPO CORPORATIVO PAPELERA S.A. DE C. V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12146', N'CPS120525QJ3', N'CYBER POWER SYSTEMS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12147', N'PDK190528FS5', N'PROYECTOS Y DESARROLLOS KAUSE S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12148', N'CCT140122J68', N'CENTRO CARDIOLOGICO Y TERAPIA ENDOVASCULAR DE OCCIDENTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12149', N'GONR840430M20', N'JOSE RUBEN GLORIA NAJERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12150', N'UEZ9705093Y1', N'UNION DE EJIDOS ZONA DE CALPULALPAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12151', N'CSE120606RG2', N'COMERCIALIZADORA SEJUM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12152', N'RIAA820902PX3', N'ANWART ADOLFO RIOS ARIZAGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12153', N'CRS12072358A', N'COMERCIALIZADORA FARMACEUTICA SALEZA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12154', N'LOKA951109E49', N'ADOLF LOEWEN KAUENHOFEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12155', N'RODC790703R42', N'CONSUELO ROMERO DIAZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12156', N'PAIS580515DF9', N'ISIDRO PAPALOTZI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12157', N'KADP9508306K9', N'PETER KAUENHOFEN DOERKSEN')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12158', N'MIKP781025RQ3', N'PETER MILLER KAUENHOFEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12159', N'MIFR981101KB8', N'RUDY MILLER FROESE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12160', N'HAFD660526AZ9', N'DANIEL HARDER FALK')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12161', N'LOWD780418KA8', N'DAVID LOEWEN WIEBE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12162', N'LOFE770330FX1', N'ELIZABETH LOEWEN FRIESEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12163', N'FOWG670817EK7', N'GERHARD FROESE WIEBE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12164', N'HALM7909111G9', N'MARGARITA HARDER LOEWEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12165', N'PESM881010LW9', N'MARIA PENNER SAWATZKY')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12166', N'PESM881010LW9', N'MARTHA FROESE WIEBE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12167', N'SHU040119HR6', N'CARTERA SEMILLAS EL HUNGARO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12168', N'IAZ981013324', N'IMPULSORA AGRICOLA DE ZAPOTLAN DEL REY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12169', N'MIKG690823J41', N'GUILLERMO MILLER KAUENOFEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12170', N'GARI881103F60', N'ISRAEL GALVAN RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12171', N'WIHJ650825Q95', N'JOHANN WIEBE HARDER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12172', N'PESK781121A79', N'KATHARINA PENNER SAWATZKI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12173', N'SAMW980920QZA', N'WALTER SAWATZKY MILLER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12174', N'VIVA840618BD0', N'JOSE ALFREDO VILLA VILLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12175', N'SID930918KR0', N'SIDERTUL S.A DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12176', N'OECM740823N26', N'MIRIAM ADRIANA CENTENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12177', N'JCB100702TQ1', N'JOHNSON CONTROLS BE OPERATIONS MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12178', N'LOGM901030SI4', N'MARIA LOEWEN GROENING')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12179', N'DIJM9611122C2', N'MIGUEL ANGEL DIAZ JIMENEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12180', N'FIFE731105HJA', N'ELENA FRIESEN FRIESEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12181', N'MEEE9803311P5', N'ELISA GERAMEL MERIDA ESTRADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12182', N'KAHH820522KD9', N'HELENA KAUENHOFEN HARDER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12183', N'AEKJ851205S35', N'JOHANN ANDRES KNELSEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12184', N'WIKP670307J55', N'PETER WIELER KETHLER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12185', N'HAKA911225829', N'ANNA HARDER KAUENHOFEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12186', N'SOLJ9705182S9', N'JOHAN STOESZ LOEWEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12187', N'SAPJ970512HH5', N'JOHAN SAWATZKY PENNER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12188', N'LOWA730520D83', N'ANNA LOEWEN WIEBE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12189', N'RAOF520916CV2', N'FRANCISCO RAMOS OROZCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12190', N'HAKS970808FR8', N'SUSANA HARDER KAUENHOFEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12191', N'MWT050912HM7', N'MAX WORLD TRADING SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12192', N'ACO5603138E3', N'ACEROS CORSA S.A DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12193', N'APS771217137', N'AVICOLA PROMESA SINALOA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12194', N'MOLC820630FE6', N'CARMELA MORALES LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12195', N'CRS200825J50', N'COMERCIALIZADORA RUVI DE SINALOA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12196', N'NEM180307FB3', N'NEMECISCO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12197', N'VIVG910129363', N'GERARDO VILLA VILLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12198', N'FAFI980615IJA', N'IRMA FALK FROESE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12199', N'DOSM680728884', N'MARIANO DOMINGO SALES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12200', N'NEBP981029GQ7', N'PETER NEUFELD BUECKERT')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12201', N'IUCR9302156J5', N'RODRIGO ALEJANDRO INURRETA CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12202', N'WIHC720407189', N'CORNELIUS WIEBE HARDER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12203', N'LOKA981130C76', N'ABRAM LOEWEN KAUENHOFEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12204', N'CARB6009271U8', N'BENITO CARRILLO DE LA ROSA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12205', N'RAVD850131RI9', N'DANIEL RAMOS VALENCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12206', N'GUGJ950908MC0', N'JACOB GUENTHER GUENTHER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12207', N'HIVJ7603016F6', N'JOHAN HILDEBRAND VOGT')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12208', N'SAGM690226U83', N'JOSE MACARIO SALAZAR GALLEGOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12209', N'FIBJ930329PT5', N'JACOB FRIESSEN BRAUN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12210', N'MAIA6507126GA', N'JOSE ANDRES MARQUEZ ISLAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12211', N'CAAY910820DA4', N'YURAI CASTILLO ALFARO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12212', N'TEVJ900728H47', N'JORGE LUIS TREJO VILLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12213', N'FOWR820403569', N'RUBEN FROESE WIEBE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12214', N'GRE011210H81', N'GRAFO REGIA S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12215', N'CCO920213F84', N'COMPAÑIA CERVECERA DE COAHUILA S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12216', N'GICS670318C17', N'SALVADOR GIL CORONEL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12217', N'WIFW920227IB1', N'WILLY GIERT WIEBE FROESE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12218', N'GARJ640914ND7', N'JAIME GALLARDO ROSAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12219', N'CGS181217GY8', N'COMERCIALIZADORA GRANOS Y SEMILLAS EL MANA, SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12220', N'GIP89112992A', N'GRUPO INDUSTRIAL PERSAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12221', N'GSR181114RN9', N'GRUPO SAI REPRESENTATION SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12222', N'KAWG790129KX3', N'GERHARD KLASSEN WALL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12223', N'HECR650104C63', N'RENE HERNANDEZ CARBAJAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12224', N'CEHI5105157I2', N'ISIDRO CERVANTES HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12225', N'CAMJ671112PZ7', N'JACQUELINE DE LOS ANGELES CASTAÑEDA MEDINA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12226', N'MGA090730QL3', N'MIEL GABRIELA, S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12227', N'AMM080408N29', N'AUTOMOTIVE M MANNESMANN VDO KIENZLE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12228', N'SAPA8203308I3', N'ANA SAWATZKY PETERS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12229', N'GAYJ8606083C9', N'JUAN CARLOS GARCIA YEH')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12230', N'AGM201007NH2', N'AGRO GRANOS MAVI SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12231', N'PME160407178', N'PROYECTOS MECANICO ESTRUCTURALES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12233', N'FSC1909059C3', N'FIBRAS Y SEMILLAS DE CHIHUAHUA SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12234', N'MCO200108RQA', N'MOTO CONTINENTAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12235', N'FRG1210264E8', N'FORRAJES RUBIO DE GUASAVE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12236', N'IBV050428KC3', N'IMPORTACIONES BB VINO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12237', N'GNO9501012L9', N'GRANERA DEL NOROESTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12238', N'NEX061207NK8', N'NOPAL EXPORT SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12239', N'MEX1209134Q7', N'MEXSESDERMA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12240', N'APC900928A82', N'EL ALBA PRODUCTORA DE CARNE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12241', N'MEA040122LA6', N'MAQUINARIA Y ESTRUCTURAS AGRICOLAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12242', N'GAG0402189U9', N'CARTERA GRUPO ACOPIADORES DE GUASAVE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12243', N'ICO690525UV8', N'CARTERA INDUSTRIAS COREREPE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12244', N'ASS040209GR3', N'CARTERA ALMACENES Y SERVICIOS SANTA ROSA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12245', N'MMO7611126H4', N'CARTERA MOLINOS MOCHIS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12246', N'SAN060327V14', N'CARTERA SERVICIOS AGROPECUARIOS NACIONALES AL CAMPO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12247', N'MAS970311L62', N'CARTERA MD AGROPRODUCTORES SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12248', N'MNU070216BN1', N'MI NUEZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12249', N'GAD180622QF4', N'GRANOS Y ALIMENTOS PARA EL DESARROLLO AGROPECUARIO, S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12250', N'TORA461130BV2', N'ANDRES TORRES RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12251', N'OEAA6408026J1', N'ANGEL OCEGUEDA ARANCIBIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12252', N'TEEA490427BT3', N'ANTONIO TREJO ESTRADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12253', N'ZUEC8912066Z6', N'CRISTIAN ALFONSO ZUÑIGA ESTRADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12254', N'OEAJ641101HD6', N'JAIME OCEGUEDA AGUIRRE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12255', N'AAEG630110GH2', N'JOSE GONZALO DE ALBA ESTRADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12256', N'AUMG600407K24', N'MARIA GUADALUPE AGUAYO MUÑOZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12257', N'OOGR651113NE7', N'RAUL OCHOA GARIBAY')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12258', N'NAHR660725PA8', N'ROGELIO NAPOLES HERNANDEZ')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12259', N'SARR600907IG2', N'ROGELIO SALAZAR ROJO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12260', N'CAGX980413SZ7', N'ADRIANA LIZBETH CARRANZA GODINEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12261', N'EARE790329GZ9', N'EDGAR ESTRADA RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12262', N'VECF561120A94', N'FELIX VELASCO CRUZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12263', N'GOVJ771225S55', N'JUAN MANUEL GODINEZ VELASCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12264', N'LOZM521112NC6', N'MARTHA LOPEZ ZUÑIGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12265', N'CASM9101139N1', N'MAURICIO CARMONA SERRANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12266', N'CAVM600929913', N'MIGUEL CARMONA VELASCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12267', N'EAOL540311299', N'LUIS ESTRADA OCEGUEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12268', N'NALJ530521RM8', N'J. IGNACIO NAVARRO LOMELI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12269', N'GOOA8207023C2', N'ALBERTO GODINEZ OCEGUEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12270', N'SASR7606104X3', N'RUBEN SAHAGUN SALAZAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12271', N'PLD000602575', N'COOPERATIVA PRODUCTORA DE LACTEOS Y DERIVADOS PALOMA SC DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12272', N'OEPI480727EC5', N'IGNACIO OCEGUEDA PADILLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12273', N'EME850711Q1A', N'ENERSYS DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12274', N'SSC121012SP0', N'SYB SCHMITT SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12275', N'VALC490924MB3', N'CARLOS VALDEZ LUNA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12276', N'FRI030228PX2', N'CARTERA FRITIERRA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12277', N'SATH401109A93', N'HELEODORO SANCHEZ TRASVIÑA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12278', N'MOGC860304P40', N'CLARISSA MORALES GOMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12279', N'CAIY880507JDA', N'YOLANDA CASTRO ITURRIOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12280', N'AEVY550401H43', N'YGNACIO ARCE VALLE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12281', N'VABX920828GN9', N'XICOTENCATL VALLE BELTRAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12282', N'PEVT910215M70', N'TOMAS GALILEO PEÑA VELAZQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12283', N'BECS5707184V1', N'SARA ELIA BELTRAN CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12284', N'ROTK801020P11', N'KARLA VERONICA ROCHA TRASVIÑA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12285', N'GOFM570730UK4', N'MATIAS GONZALEZ FLORES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12286', N'UIEL340519KQ5', N'ELEUTERIA URIAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12287', N'TACF931228L96', N'FLOR MARIELA TARIN CARO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12288', N'AELH231008S78', N'HERLINDA ARCE LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12289', N'RAMM6307244G8', N'MA. CRISTINA RANGEL MORALES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12290', N'GUSC980608PX8', N'CARLOS GONZALO GUERRERO SILVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12291', N'GAFR640901S32', N'MARIA DEL REFUGIO GAMEZ FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12292', N'LERR9004074T9', N'RIGOBERTO LEYVA RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12293', N'BIVA430926HL4', N'ARTURO BRICEÑO VALDES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12294', N'CALM460311629', N'MANUEL CARDENAS LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12295', N'UICJ020426F90', N'JESUS ROSARIO URIAS CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12296', N'ACA2008038Y7', N'AGRICOLA CARRAZCO ARMENTA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12297', N'SASM880101MH5', N'MIRIAM JUNIBY SANCHEZ SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12298', N'AEVA470312LG0', N'AURELIANO ARCE VALLE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12299', N'GUAA561120KG3', N'AURORA GUTIERREZ ACOSTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12300', N'AOSC370422T56', N'CARMEN ACOSTA SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12301', N'AVEC3909272A3', N'COSME ARMENTA VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12302', N'VACF720715R75', N'FAVIO ENRIQUE VALDEZ CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12303', N'BEHJ731129PF4', N'JORGE LUIS BELTRAN HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12304', N'VITJ7906245M0', N'JUAN FORTINO VIZCARRA TAVIZON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12305', N'CACX701127GH2', N'OTONIEL CARDENAS CARDENAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12306', N'BEHP8312204H6', N'PEDRO BELTRAN HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12307', N'CESP630602KV6', N'PEDRO CERVANTES SOTO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12308', N'AELE010609VB2', N'EFRAIN ARCE LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12309', N'OILV880904IB1', N'VIANEY KARELI OLIVAS LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12310', N'IAAA8709216S0', N'ANAYANCI IBARRA ACOSTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12311', N'EIRC780619NR0', N'CAMELIA ESPINOZA R0SAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12312', N'RUZE870731F87', N'EDGAR RUBIO ZAMUDIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12313', N'ARA130220RW7', N'AGRICOLA EL RADA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12314', N'QUSA711009KM4', N'JOSE ANTONIO QUEVEDO SALOMON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12315', N'EAGA730927QX7', N'AGAPITO ESTRADA GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12316', N'RUVR470202CR1', N'RITA RUIZ VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12317', N'CAPF770601SZ4', N'FIDEL CASTRO PEÑUELAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12318', N'PAAJ740318NW2', N'JESUS ALBERTO PALAFOX AYALA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12319', N'PAAP630915MC3', N'JOSE PORFIRIO PALAFOX AYALA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12320', N'AOGG831113RX1', N'GLADYS ACOSTA GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12321', N'VALA431031HD4', N'ANDRES VALDEZ LARA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12322', N'GOLJ791015B47', N'JUAN ANTONIO GONZALEZ LARA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12323', N'AERA3501225J8', N'ARTURO ARCE ROMAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12324', N'BARL450312MA5', N'LEONARDO BALDERRAMA RABAGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12325', N'VACE6307141Y1', N'ELOY VALDEZ CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12326', N'VAAF600509RS9', N'FIDEL VALLE ARCE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12327', N'VARF5909285Y6', N'FRANCISCA VALDEZ ROMERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12328', N'PERM4503027S6', N'MARIA MERCEDES PEIRO RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12329', N'EOLN721220L24', N'NEREYDA ESCOBAR LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12330', N'AEGI871020FV5', N'ISAEL YURNUE ARCE GALAVIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12331', N'LELR650425248', N'ROBERTO ARIEL LEYVA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12332', N'CACJ6806134F3', N'JOSE JOEL CARDENAS CARDENAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12333', N'BADL511011MH7', N'JOSE LUIS BALDENEBRO DELGADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12334', N'MOAJ770226D42', N'JUAN ANTONIO MORENO ASTORGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12335', N'RICE861003A53', N'EDGAR GERARDO RIVAS CAMARGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12336', N'LUAL7601029H4', N'LEONEL LUGO ARCE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12337', N'AUPJ8910049V7', N'JESUS ALFREDO ANGULO PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12338', N'AOCM940314214', N'MARIO WILFRIDO ASTORGA CUADRAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12339', N'MOCM690426B19', N'MATILDE MONRREAL CHAPARRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12340', N'VALR381215GL4', N'RAMON VALDEZ LARA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12341', N'VEGT591125PN9', N'TEOFILO VERDUGO GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12342', N'VAMV8611087E8', N'VIRIDIANA VALDEZ MORENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12343', N'GASM661111GC4', N'MARTINA GAMEZ SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12344', N'MAAH661121U21', N'HERLINDA MARTINEZ ALVAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12345', N'SOCJ670113923', N'JESUS ALFONSO SOSA CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12346', N'PAE921125K86', N'CARTERA PRODUCTORES AGRICOLAS DE ELOTA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12347', N'AVC170111KP0', N'CARTERA AGROPRODUCTORES DEL VALLE DE CULIACAN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12348', N'CACJ7707123E5', N'JAIME SALVADOR CHAN CAUICH')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12349', N'BAL961213533', N'CARTERA BODEGAS ALFER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12350', N'FEAC5811121B6', N'CLODOMIRA FELIX ALVARADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12351', N'AEMR6409185W0', N'ROSARIO ARMENTA MIRANDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12352', N'OIPJ461107IM3', N'JOSE OLIVAS PAEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12353', N'BOLI970330KY1', N'ISAC FERNANDO BOJORQUEZ LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12354', N'VARL660617AZ4', N'JOSE LEONCIO VALENZUELA REYES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12355', N'PAPE440330LJ3', N'MARIA EVANGELINA PARRA PARRA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12356', N'VACI471216GV0', N'JOSE ISMAEL VALENZUELA CARLON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12357', N'ACV170823B19', N'AGRONEGOCIOS CAMPO VERDE SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12358', N'MIVJ571020QU4', N'JAIME MIRANDA VALDEZ')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12359', N'APE120911ID4', N'AGRICOLA PEGIR SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12360', N'BEAA9112298ZA', N'ANDRES DE JESUS BECERRA ALVARADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12361', N'MOGZ3904223TA', N'MARIA ZENAIDA MOLINA GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12362', N'MOPA800825C75', N'ANA MARIA MORALES PARRA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12363', N'CUSC530830D14', N'CARLOS JAVIER CHUCUAN SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12364', N'UIGE590112PI3', N'EVERARDO URIAS GASTELUM')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12365', N'EOLN721219L24', N'NEREYDA ESCOBAR LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12366', N'VIAG0102182U7', N'GLADYS ARLETH VIZCARRA ACOSTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12367', N'GAOR6608315V2', N'RAMON ALBERTO GASTELUM ORRANTIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12368', N'PEHG5509149R4', N'GLORIA MARINA PEREZ HIGUERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12369', N'SOBR730414IE6', N'RAUL SOSA BURGOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12370', N'AOAF8111146F6', N'FAVIO ASTORGA ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12371', N'LUME7611297N1', N'EVERARDO LUQUE MENDOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12372', N'CAGR5306217P0', N'ROGELIO CARDENAS GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12373', N'CAAR751110H5A', N'ROGELIO CHAVEZ ACOSTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12374', N'VIGA820214DA1', N'ALVARO VILLASEÑOR GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12375', N'VITR820804HI4', N'ROSA ISELA VIZCARRA TAVIZON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12376', N'AUAS590407H86', N'SAUL ANGULO ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12377', N'HECC8602179V5', N'CINTHIA FABIOLA HERRERA CAZAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12378', N'CUP8607025M3', N'JOSE CARLOS JAVIER CHUCUAN PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12379', N'LUEE470827FE9', N'EDUARDO LUGO ESCARREGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12380', N'QUQD620618498', N'JOSE DOLORES QUEVEDO QUEVEDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12381', N'MORR430814MH5', N'RUBEN MONDACA RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12382', N'AELR520404V22', N'RAMONA GUADALUPE ARMENTA LEAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12383', N'UISM890817C6A', N'MARCO ANTONIO URIAS SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12384', N'VAAE561208JDA', N'EMILIO VALDEZ AGUILAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12385', N'SOMR4607204Y2', N'MARIA DEL ROSARIO SOSA MONTOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12386', N'MOBG580610VB9', N'GUADALUPE MORALES BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12387', N'ZAVI4709188F7', N'JOSE IGNACIO ZAMBRANO VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12388', N'CAAL660917BZ1', N'LIBERATO CARRASCO AGUIRRE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12389', N'CAZL951203RZ9', N'LUIS ARTEMIO CARDENAS ZAMBRANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12390', N'CAZL990303PZ6', N'LUIS FERNANDO CARDENAS ZAMBRANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12391', N'VAVC711208PN0', N'MARIA CONCEPCION VADEZ VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12392', N'GASY901214233', N'MARIA YOLANDA GALVEZ SILVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12393', N'VAMN8709023E8', N'NETLY ZITLALIC VALDEZ MORENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12394', N'MOFR570102H29', N'RAMON DE JESUS MORENO FLORES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12395', N'MOVR620908CY5', N'REYNA ISABEL MORENO VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12396', N'UIGR8504208R8', N'ROBERTO URIAS GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12397', N'VIHS840628589', N'SAUL ALONSO VILLASEÑOR HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12398', N'QUEL550320J24', N'ELIGIO HUMBERTO QUEVEDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12399', N'ZAMV720428UM9', N'VERONICA ZAMBRANO MELENDREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12400', N'HEEE5909126V8', N'ESMERALDO HERRERA ESTRADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12401', N'GOSE7604052L7', N'EMILIO GONZALEZ SOTO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12402', N'FOML6910283E7', N'JOSE LUIS FLORES MORENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12403', N'FIAH390425EX3', N'HERMINIA FIGUEROA ARROYO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12404', N'CAAR900824VC5', N'RAMON CAMACHO ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12405', N'COBJ900123IR3', N'JESUS ENRIQUE CORVERA BURGOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12406', N'PAAE650906LT9', N'ERNESTO GUADALUPE PALAFOX AYALA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12407', N'RORI730328EV3', N'IGNACIO ROMERO RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12408', N'MELV560728MS3', N'VICTOR MANUEL MEZA LEON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12409', N'BIB150316JU8', N'BEBIDAS INTERNACIONALES BEPENSA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12410', N'NACE830922DH3', N'EMANUEL NAVARRO CHACON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12411', N'MOUM430612I50', N'MARCO ANTONIO MONTIEL URIAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12412', N'BUIE54082279A', N'MARIA ESTHER BURGOS INODA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12413', N'FOLS011024P25', N'SOFIA CAROLINA FLORES LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12414', N'CAAL731113PS9', N'LUIS ROBERTO CHAVEZ AGRAZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12415', N'LUMF680102EX8', N'FLORENCIO LUQUE MENDOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12416', N'QUCJ951126A94', N'JESUS MANUEL QUEVEDO CASTILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12417', N'CEMP891114MB8', N'PEDRO ANTONIO CERVANTES MORENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12418', N'AUR200818677', N'AGRICOLA URGA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12419', N'LOGA3304226G9', N'ANDRES LOPEZ GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12420', N'LEEO4802048B4', N'OCTAVIO LEYVA EVANS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12421', N'IUCJ7208282LA', N'JORGE LUIS INZUNZA CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12422', N'MAVN440805J23', N'ADRIANA ZAMORANO CAÑEDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12423', N'DUMM7504126H4', N'MARCELA DURAN MORENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12424', N'CASB810527V16', N'BELEN CAMACHO SOSA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12425', N'BAHC960201T41', N'CUAUHTEMOC EDUARDO BARRERAS HIGUERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12426', N'GIAI570724GU8', N'ISABEL CRISTINA GRIJALVA ARCE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12427', N'HEAM970601LP1', N'MARIO HERNANDEZ ACOSTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12428', N'ZAUF660116UC9', N'FELIPE ZAVALA URIBE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12429', N'CACH6112236X3', N'HORACIO CASTRO CORTEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12430', N'AESA601202UX9', N'ALBA LUZ ARMENTA SOTO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12431', N'AUMO600304A42', N'OLEGARIO ANGULO MONTOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12432', N'GAMD820513G91', N'DALILA GASTELUM MONTOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12433', N'AUMO710728G29', N'OSCAR ANGULO MONTOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12434', N'LESM590131CR7', N'MARCOS ANTONIO LEYVA SOTO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12435', N'GARG000322AB7', N'GABRIELA JAZMIN GARCIA ROCHA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12436', N'CAAE7210046E8', N'ELIA PATRICIA CHAVEZ AGRAZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12437', N'CAAL810722JZ4', N'LORENA IVETTE CHAVEZ AGRAZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12438', N'CAVL4404265X9', N'LUIS ROBERTO CHAVEZ VINCENT')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12439', N'TICA610301SP6', N'ANTONIO TIRADO CEJA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12440', N'UUVD7102159Y1', N'JOSE DAVID URQUIDEZ VILLANUEVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12441', N'LUVJ741003GA6', N'JAVIER ENRIQUE LUQUE VERDUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12442', N'GUCC510215E71', N'MA. CRISTINA GUTIERREZ CAMPOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12443', N'AELC7302151Q6', N'CARLOS ALFREDO ARMENTA LUNA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12444', N'LILR830906879', N'RICARDO LIRA LIZARRAGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12445', N'HECA390201SB2', N'ANTONIA HERNANDEZ CERVANTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12446', N'BULA810813956', N'AURORA BURGOS LUNA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12447', N'EIAE6206027V0', N'ERASMO ESPINOZA ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12448', N'QUCI730504RQ3', N'ISIDRO QUEVEDO CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12449', N'BEJE5903291S0', N'JESUS SALVADOR BELTRAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12450', N'QUQS800403IIA', N'SANTA GLORIA QUEVEDO QUINTERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12451', N'GAVE430714PF5', N'VENTURA GAXIOLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12452', N'CUCV360514J62', N'VICTOR CRUZ CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12453', N'MOAE600128I41', N'EDALIO MONTOYA ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12454', N'CANG390301KV1', N'GUADALUPE CAZARES NIEBLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12455', N'COPM7410141A3', N'MARIA CONTRERAS PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12456', N'BELP530209L83', N'PETRA CIRIA BENARD LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12457', N'GUMR7411129Z9', N'RENE GUTIERREZ MARTINEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12458', N'QUGO7602248K2', N'OSCAR QUEVEDO GARCIA')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12459', N'LUSR530105GX8', N'ROSARIO LUNA SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12460', N'GASJ511101ST2', N'JORGE GAMEZ SALAZAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12461', N'HICJ500208VE7', N'JUAN DE DIOS HIGUERA CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12462', N'COGJ590220228', N'JUAN MANUEL CONTRERAS GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12463', N'CAAV5311248M9', N'MARIA VICTORIA CAMACHO AVENDAÑO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12464', N'COGX681018SU4', N'ESTHER CONTRERAS GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12465', N'NALF9403066D2', N'FRANCISCO NARANJO LARA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12466', N'GIA840731NA7', N'AZUCAR GRUPO SAENZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12467', N'BOAE470721SQ8', N'MARIA ELENA BOJORQUEZ ARBAYO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12468', N'HEGO3612209K4', N'OLIVERIO HERNANDEZ GODOY')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12469', N'AGR1805247W3', N'AGROINDUSTRIAS GRAMEX SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12470', N'XAXX010101000', N'REGAL BELOIT DE GUADALAJARA S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12471', N'XAXX010101000', N'JDH IMMEX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12472', N'XAXX010101000', N'SUMITOMO CORPORATION DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12473', N'CWI041019RI7', N'CDC WIRE S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12474', N'SDI850407RR7', N'SISTEMA PARA EL DESARROLLO INTEGRAL DE LA FAMILIA DEL MUNICIPIO DE GUADALAJARA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12475', N'BOJ160530N21', N'BOJORMEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12476', N'IAR130401E84', N'INVEX ARRENDADORA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12477', N'XAXX010101000', N'STRATO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12478', N'XAXX010101000', N'CARESTREAM DENTAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12479', N'XAXX010101000', N'DISTRIBUIDORA QUIMICA MUNDIAL JAFERCEL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12480', N'XAXX010101000', N'MAX WELDING INDUSTRIAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12481', N'XAXX010101000', N'BELSKIN S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12482', N'XAXX010101000', N'APEEL TOTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12483', N'XAXX010101000', N'KEYSIGHT TECHNOLOGIES MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12484', N'HSI831014EW3', N'HARINERA DE SINALOA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12485', N'MAC201025FN1', N'MEKAPALI AUTO CARGO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12486', N'AEFJ960919UE3', N'MARIA JOSE ARCE FONSECA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12487', N'MOCA631113JV9', N'ALMA ROCIO MORALES CONTRERAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12488', N'LUEM710105UK5', N'MIRNA ALICIA LUQUE ESPINOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12489', N'CALR620128SK2', N'RAMON CAMACHO LEYVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12490', N'AVF1008059DA', N'AGRONEGOCIOS DEL VALLE DEL FUERTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12491', N'MOPL760618N31', N'JOSE LUIS MOLINA PLACENCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12492', N'AONB5808012X6', N'BENJAMIN ASTORGA NIEBLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12493', N'GOMN460618SZ2', N'NATIVIDAD GOMEZ MENDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12494', N'SAAF760629767', N'FLERIDA LETICIA SAUCEDA AGUILAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12495', N'GOCR761014NQ6', N'ROSA YADIRA GOMEZ CORNEJO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12496', N'ACE1411226G6', N'AGRO CULTIVOS DEL EVORA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12497', N'GARA670725PJ0', N'AVELARDO GARIBALDI REYES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12498', N'SOGM440115I81', N'MAURICIA SOTO GUZMAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12499', N'SOAF511016B59', N'FLORENTINO SOLORIO ALCALA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12500', N'SARC630430JP4', N'CATALINA SANCHEZ RUIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12501', N'CACJ671103K93', N'JULIO CESAR CABRERA CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12502', N'CASS520302FL8', N'MARIA SARA CASTRO SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12503', N'NEVR810105PZ9', N'RAUL NERY VERDUZCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12504', N'AUVA681215EZ2', N'MARIA DE LOS ANGELES ANGULO VERDUZCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12505', N'MOUA7807074Z1', N'ANABEL MONTOYA URETA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12506', N'MODY980329IK4', N'YOHANA RAQUEL MORALES DURAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12507', N'QUVF620906193', N'FAUSTO QUEVEDO VERDUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12508', N'AUAS590407H86', N'ROBERTO ANGULO ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12509', N'LOQE6709254S2', N'ELIAZAR LOPEZ QUEVEDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12510', N'GOSJ750624Q53', N'JUAN CARLOS GOMEZ SOTELO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12511', N'GOCJ660926240', N'JESUS ANTONIO GODINEZ CASTILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12512', N'GOUA660321SD3', N'AVELARDO GODINEZ URIBE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12513', N'AELF970101KS2', N'FREDY ARMENTA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12514', N'FIAF470807AQ1', N'FRANCISCO FIGUEROA ARROYO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12515', N'GOVE610821AK5', N'EFREN GODOY VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12516', N'METL480304LAA', N'LEOPOLDO MEDINA TINOCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12517', N'DUOD741016FHA', N'DANIEL DURAN ORTIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12518', N'GARA570902HI4', N'ALMA GUADALUPE GARCIA ROJO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12519', N'LAVJ530304QW3', N'J. GUADALUPE LARA VARGAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12520', N'LERG771211LX1', N'JOSE GUADALUPE LEDEZMA RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12521', N'CODA671208R45', N'ASENCION CORRALES DURAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12522', N'AOGA790916FC8', N'ARNOLDO ASTORGA GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12523', N'AALT540328CE8', N'MARIA TERESA ANDRADE LEON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12524', N'CAOM550829G11', N'MARTHA ELENA CASTRO OBESO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12525', N'FECJ840624724', N'JUANA HAYDE FELIX CERVANTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12526', N'CARA370922GH3', N'JOSE ALVINO CAMARGO RENTERIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12527', N'PEPI600924JU7', N'IMELDA PEREZ PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12528', N'LOCS671012BLA', N'SANTOS GUILLEMRO LOPEZ CAMARGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12529', N'NISI400706UK5', N'JUAN EDUARDO ASTORGA NIEBLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12530', N'SDI950418PS4', N'SISTEMA PARA EL DESARROLLO INTEGRAL DE LA FAMILIA DEL MUNICIPIO DE TLAQUEPAQUE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12531', N'SGR960715HK1', N'JOHNSON CONTROLS BTS MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12532', N'MISM501120PA3', N'JOSE MANUEL MIRANDA SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12533', N'QVI1703212L3', N'QUALE VINUM SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12534', N'CALF7005175N3', N'JOSE FRANCISCO CAMEZ LEYVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12535', N'DOCM030718FP2', N'JOSE MIGUEL DOMINGUEZ COTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12536', N'HSE701218532', N'HDI SEGUROS, SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12537', N'GACL590110DD6', N'JOSE LUIS GAMEZ CABRERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12538', N'AUAS590407H86', N'SAUL ANGULO ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12539', N'RORA620410SX5', N'APOLONIO ROMERO RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12540', N'UUVD720806RTA', N'DANIEL URQUIDEZ VILLANUEVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12541', N'BMO140410KX6', N'BASAL MONTERREY S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12542', N'GAGR470711989', N'CARTERA RUBEN GARZA GONZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12543', N'LER771026J45', N'LG ELECTRONICS REYNOSA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12544', N'PME011219VE8', N'PFERD DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12545', N'EILA750523KN0', N'ANA LILIA ENRIQUEZ LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12546', N'PIL070720F26', N'PQ INTEGRADORA LOGISTICA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12547', N'CURH731014QU1', N'HECTOR MANUEL CUEVAS ROJAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12548', N'BADO890918S87', N'OSMAND ARIEL BALDENEBRO DIMAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12549', N'ACM841025CA5', N'ARROW COMPONENTS MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12550', N'XAXX010101000', N'OSCO IMMEX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12551', N'LOBN410411QE1', N'NASARIO LOPEZ BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12552', N'PPK0801115Z7', N'PRODUCTOS PESQUEROS KINO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12553', N'OGO110228GP8', N'OPERADORA GODE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12554', N'ACE170512T4A', N'ACERWORK S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12555', N'PRA181029S3A', N'PRAELIOR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12556', N'AAL960229CV2', N'AGROPRODUCTOS ALFER SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12557', N'PLO011011930', N'PROFRIO LOGISTICA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12558', N'FIVA9109193B0', N'ANGELINA FIGUEROA VALENCIA')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12559', N'CMI950920TR8', N'NAVISTAR MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12560', N'XEXX010101000', N'LINEA PET PERU S.A')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12561', N'ASA140602ET3', N'ARRENDAMIENTO Y SOLUCIONES EN ACTIVOS SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12562', N'ASN060224BU0', N'ARRENDADORA Y SOLUCIONES DE NEGOCIOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12563', N'OFR1209281V5', N'OEC FREIGHT S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12564', N'AVM950418QQ6', N'ARRENDADORA VE POR MAS SA DE CV, SOFOM, ER.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12565', N'RBE150820MA5', N'RG COMPAÑIA BENEFICIADORA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12566', N'CME950207866', N'COMPUCENTER DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12567', N'NAAC900809NT3', N'CARTERA CAROLINA NAVARRO AGUIRRE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12568', N'CAJ001206620', N'CARTERA CAJOMA, S.A DE C.V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12569', N'VPM160707EP3', N'VIKING PRODUCTS DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12570', N'PES171206865', N'PRODUCTOS DE EMPAQUE STICK PALLET S  SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12571', N'LOI2004061T3', N'LOGISTICA OLI INTL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12572', N'NAM080908U60', N'NILFISK DE MEXICO MANUFACTURING S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12573', N'CGT2012243M4', N'COMERCIALIZADORA DE GRANOS 30 DE OCTUBRE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12574', N'VTR190830IC8', N'VYC TRES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12575', N'GCM1511181N4', N'GRUPO COMERCIAL MAPEZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12576', N'TME931214KU6', N'TIP DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12577', N'XEXX010101000', N'ED & F MAN SUGAR INC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12578', N'LTY180117JX0', N'LCH TYRES S.A DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12579', N'CPS980430P27', N'CAJA POPULAR SAN RAFAEL SC AP DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12580', N'XEXX010101000', N'NIDEC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12581', N'PJA1105251L8', N'PORTO JAIBO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12582', N'XEXX010101000', N'APTIV MANUFATURA E SERVICOS DE DISTRIBUICAO LTDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12583', N'RIAA820902PX3', N'CARTERA ANWART ADOLFO  RIOS ARIZAGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12584', N'IRE061215JS1', N'IMPULSORA DE RECICLAJES, SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12585', N'COP180823286', N'COMERCIALIZADORA OPTOVIK SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12586', N'BRM940216EQ6', N'BANCO REGIONAL SA INSTITUCION DE BANCA MULTIPLE BANREGIO GRUPO FINANCIERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12587', N'PMA14021043A', N'PCH MAYOREO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12588', N'DPM160902SB4', N'DAREI PESCADOS Y MARISCOS S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12589', N'VAQF601202CF3', N'FRANCISCO JAVIER VALDEZ QUIÑONES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12590', N'LMD880513832', N'LIFERPAL M D SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12591', N'LME970206NR6', N'LALLEMAND MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12592', N'SGJ110526C40', N'SEMILLAS Y GRANOS DE JAGUEYES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12593', N'LTY180117JX0', N'CARTERA LCH TYRES S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12594', N'PJA1105251L8', N'CARTERA PORTO JAIBO S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12595', N'VASR6407275JA', N'RAFAEL VALENZUELA SOBERANES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12596', N'BMU8605134I8', N'BEBIDAS MUNDIALES S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12597', N'AGR841003D96', N'CARTERA AGROCRIBAS S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12598', N'DIA1108179PA', N'DISTRIBUIDORA DE INSUMOS AGROPECUARIOS DE CHIHUAHUA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12599', N'XAXX010101000', N'DL MOTORS CO LTD')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12600', N'CGC080109Q62', N'CJ LOGISTICS MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12601', N'CMF150918US1', N'COMERCIALIZADORA MEXICANA DE FRUTOS SECOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12602', N'DEX121116BJ7', N'DESTILERIA LA EXPERIENCIA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12603', N'BAR0003318J9', N'BEAUTY ART SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12604', N'CMP940808ST7', N'CAMPO MAYO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12605', N'AGB120629FZ0', N'AGROINDUSTRIA GANADERA BUENA VISTA S DE PR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12606', N'BALR660129R35', N'RAMON BARAJAS LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12607', N'GAV090305DD9', N'GRUPO ACOPIADOR 24 DE AGOSTO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12608', N'SUC090612QB4', N'SUCROLIQ SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12609', N'BME170309GTA', N'BGE MEXICO S. DE R.L. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12610', N'DGF920601FY6', N'DHL GLOBAL FORWARDING (MEXICO) SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12611', N'DTM170718JB9', N'DYSON TECHNOLOGY MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12612', N'KNP910729KU7', N'KISS NAIL PRODUCTS INC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12613', N'AAS9406255Y0', N'CARTERA ASOCIACIONES AGROINDUSTRIALES SERRANAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12615', N'SIF111220R61', N'SOLUCIONES INTEGRALES FONTE SC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12616', N'MMS9303229L9', N'CARTERA MARIANO MATAMOROS DE SAN ANTONIO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12617', N'XAXX010101000', N'LECTRA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12618', N'IEM110811AR1', N'IMPORTADORA Y EXPORTADORA DE MARISCOS DE CENTRO AMERICA Y EL CARIBE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12619', N'YEMD980930KQ8', N'DAVID DANIEL YEH MAY')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12620', N'AUVC800108BN3', N'CAROLD ALEJANDRA AGUILAR VIVAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12621', N'PACF830702VE2', N'FAVIAN PAPALOTZI CRUZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12622', N'OERL540324222', N'LEONARDO OBREGON DE LA ROSA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12623', N'GPA130521K46', N'GRUPO PECUARIO ARCE S. DE P.R. DE R.L.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12624', N'BIN141013UD7', N'BFF INTERNATIONAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12625', N'IME990527NG7', N'ISOVOLTA DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12626', N'MAY190726MR1', N'MAYAHVE COMPANY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12627', N'UFR9909228Z9', N'UNIVERSO DE FRAGANCIAS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12628', N'KADM910420T52', N'MARIA KAUENHOFEN DOERKSEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12629', N'GOGB530707IM3', N'BENEDICTO GOMEZ GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12630', N'CICE690708HJ2', N'ELIAZAR CHIN CHAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12631', N'CICE7101138B8', N'EZEQUIEL CHIN CHAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12632', N'MOVF920502LP4', N'FRANCISCO ROBERTO MORENO VARGAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12633', N'MESH930513FV6', N'HECTOR MEDINA SALDAÑA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12634', N'DIVK950124NY3', N'KEREN NOEMI DZIB VIVAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12635', N'VIPA8909194J2', N'AMADO VIVAS PECH')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12636', N'GARD861129V71', N'DAVID GALVAN RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12637', N'COCE660718DC7', N'EMILIO COCON CACH')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12638', N'MAGE530407829', N'ENRIQUE MARTINEZ GUZMAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12639', N'VAPJ881101257', N'JESUS VARGAS PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12640', N'MEMJ610624HT1', N'JUAN BAUTISTA MEZETA MATOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12641', N'CIUL6803026X2', N'LEOCADIO CHIN UC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12642', N'ROCL690615421', N'LEONARDO RODRIGUEZ CASTILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12643', N'GAGG9302038K1', N'MARIA GUADALUPE GALLARDO GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12644', N'CARO890223UX4', N'OSBALDO CARRILLO REVELES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12645', N'COSR5412279X3', N'REYNALDO TOMAS COBA SOSA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12646', N'OECS860703BG1', N'SEINI VIVIANA OBREGON CORONADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12647', N'CAGY950806M14', N'YANETH CARRILLO GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12648', N'GAPS721210F39', N'SEVERIANO GARCIA PUGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12649', N'OECD590320EH3', N'JOSE DOLORES ORTEGA CAHUICH')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12650', N'FIFK890402I81', N'KATHARINA FRIESSEN FRIESSEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12651', N'UMAV6407225Z1', N'AVIMAEL UC MAYTORENA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12652', N'YEGC9401288W7', N'CLAUDIA YARITZA YEH GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12653', N'GUTF510918AP1', N'FRANCISCO GUTIERREZ TUPUL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12654', N'TATF540609US8', N'FRANCISCO TAMAY TAMAY')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12655', N'BELJ960624JWA', N'JACOB BERGEN LOEWEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12656', N'PEPM760527DL4', N'JOSE MANUEL PEDRAZA PECH')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12657', N'UCMA790309B43', N'JOSE MANUEL UC CANUL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12658', N'VIDO9108168L8', N'ODEIMI ANTONIA VIVAS DZIB')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12659', N'VICR701220AJ6', N'ROBERTO VILLALOBOS CUEVAS')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12660', N'TACS590807LP3', N'SILVIA MARIA LUISA TACU CHAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12661', N'ANR200911DHA', N'AGRO NUECES REJA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12662', N'GEA120220PD0', N'CARTERA GRUPO ESTRELLA DE ALTAMAR S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12663', N'MBA0802288V5', N'CARTERA MULTIGRANOS DE BAJIO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12664', N'ADJ990203698', N'ACUICOLA DON JORGE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12665', N'AFE160108I52', N'AGROPECUARIA FERCIM SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12666', N'XAXX010101000', N'KIC LLC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12667', N'PRE820415237', N'PANEL REY SA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12668', N'MGR1901318J6', N'MONTES GRAIN Y CIA EN, S. DE  R.L DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12669', N'MGU140924BI9', N'METALERA DE GUASAVE S.A.P.I DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12670', N'AUMM871024GB4', N'MYROSLAVA AGUILAR MORALES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12671', N'COD010426KR9', N'COMERCIAL Y OPERADORA DOMESTICA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12672', N'IGR090622D45', N'INDEX GRANOS S.A. DE C.V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12673', N'TPT041028J40', N'CARTERA TEOCUITATLAN PRODUCE PARA TI CEREAL S.P.R. DE R.L.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12674', N'VTM1710235S2', N'VALIA TRADING MEXICO SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12675', N'CACJ720726DF3', N'JULIO CESAR CASTILLO CARRILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12676', N'CAUA571019KL0', N'ADA NELI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12677', N'GOGA5504091YA', N'ADALBERTO DEL JESUS GONZALEZ GONGORA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12678', N'APH210728AH1', N'AGROPECUARIA PECH HUCHIN SAS DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12679', N'CAUC920803U46', N'CHRISTIAM EMMANUEL CANCHE UC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12680', N'AIM210526N42', N'ACE INGREDIENTS MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12681', N'LOAF980513S77', N'FRANCISCO JAVIER LOPEZ ALCOCER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12682', N'GARJ490725294', N'J. ANTONIO GARCIA ROMERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12683', N'FOWJ770823TZ9', N'JOHANN FROESE WIEBE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12684', N'SOCD4702172V9', N'JOSE DOLORES SOSA CHI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12685', N'CIUL640723I14', N'LIBORIO CHIN UC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12686', N'CPE130213IBA', N'LOS CUATES DE PENJAMO S.P.R DE R.L.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12687', N'UIRL690621PUA', N'LUIS DE JESUS URIZAR REYES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12688', N'SAEM9111203C7', N'MISAEL SANDOVAL ESTRADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12689', N'LORN8406239Y5', N'NERIO LOPEZ RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12690', N'MAYP500626P34', N'PABLO MALDONADO YEBRA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12691', N'VBO210722CM6', N'VILLALOBOS DE BOLONCHEN SAS DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12692', N'CARA710115EC6', N'ARTURO CARRILLO DE LA ROSA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12693', N'RIFF881220228', N'FRANCISCO ANTONIO DEL RIO FAVELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12694', N'MELG690615290', N'GABRIEL ARTURO MERIDA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12695', N'MASJ9101086FA', N'JORGE LUIS MALDONADO SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12696', N'GOGP480314KY8', N'PEDRO GONZALEZ GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12697', N'EIRS8306082E5', N'STANLEY ENRIQUEZ RUIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12698', N'MEMH960710SU8', N'HENRY JHONATAN MEDINA MASS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12699', N'MIM030710NR5', N'MANUFACTURAS INTEGRALES DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12700', N'EXI1910049VA', N'EXIMMOBILEN SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12701', N'FGA040211299', N'FORRAJES Y GRANOS AGROPECUARIOS DE YUCATAN, SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12702', N'BEML571217TG7', N'LAZARO BERISTAIN MATEOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12703', N'VAPR711223GZ8', N'REYNALDO VARELA PACHECO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12704', N'LEPR841118978', N'ROBERTO DE JESUS LEDEZMA PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12705', N'ASJ150513DC7', N'ALTERNATIVA EN SEMINUEVOS JALISCO S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12706', N'XAXX010101000', N'AVERY DENISON COVERTED PRODUCTS DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12707', N'SCS1601119DA', N'SUCRO CAN SOURCING LLC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12708', N'BUHA710712295', N'ARON BUECKERT HIEBERTH')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12709', N'KAHL061002AF2', N'LUCAS KAUENHOFEN HARDER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12710', N'PNE101004984', N'PIRELLI NEUMATICOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12711', N'FASM800803527', N'MARTIN FABILA SANDOVAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12712', N'MIN050912Q11', N'SOCIEDAD VERIFICADORA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12713', N'FIGC770302KK5', N'CORNELIUS FRIESEN GOERTZEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12714', N'FIDE860701LA3', N'ELIZABETH FRIESEN DOERKSEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12715', N'LOFE730317SU1', N'ELMER LOEWEN FEHR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12716', N'KAHM171101E29', N'MATEO KAUENHOFEN HARDER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12717', N'CCO950220HGA', N'COMERCIALIZADORA C.G. DE OCCIDENTE  SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12718', N'RIS190502S74', N'RA&T INTEGRATIVE SOLUTIONS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12719', N'MAPJ840719L87', N'JULIO MYSLABODSKI PIER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12720', N'UGR610105E88', N'CARTERA UNION GANADERA REGIONAL DE PORCICULTORES DE GUANAJUATO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12721', N'IEM110811AR1', N'CARTERA IMPORTADORA Y EXPORTADORA DE MARISCOS DE CENTRO AMERICA Y EL CARIBE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12722', N'REJE740822DI5', N'ERIC RICARDO RENTERIA JIMENEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12723', N'VEZG7707057W0', N'GERARDO VELASCO ZARAGOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12724', N'GAMJ680915QB7', N'JAIME GARIBAY MARTINEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12725', N'EAOJ7103204V4', N'JORGE LUIS ESTRADA OSEGUEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12726', N'BOEL730328HX5', N'JOSE LUIS BOTELLO ESTRADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12727', N'GONM750920LE4', N'MIGUEL GONZALEZ NAVARRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12728', N'VEGM8906088W5', N'JOSE MANUEL VELASCO GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12729', N'ZUGM630318V92', N'MANUEL ZUÑIGA GODINEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12730', N'GAER6604067Q3', N'RAMON GARIBAY ESTRADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12731', N'AUDA901222F12', N'ALMA DELIA AGUIRRE DIAZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12732', N'AUAA600613UT7', N'ANTONIO AGUIÑAGA ARELLANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12733', N'MEZJ6211069A5', N'JAVIER MELENDREZ ZUÑIGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12734', N'GOLF610512CD0', N'FRANCISCO GODINEZ LIMON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12735', N'AEVL380317AW2', N'JOSE LUIS ACEVES VALENCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12736', N'GOAL780105JI4', N'JOSE LUIS GONZALEZ ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12737', N'GOOR450414DF1', N'RODOLFO GODINEZ OCEGUEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12738', N'GOOA550623DQ3', N'ANDRES GODINEZ OCEGUEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12739', N'CUZC940602RIA', N'CESAR CRUZ ZARAGOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12740', N'GOVG690629AE1', N'GUILLERMO GONZALEZ VELAZCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12741', N'VEAJ621229FG4', N'JESUS VELASCO ACEVES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12742', N'BAAJ780509RS4', N'JOAQUIN BAÑALES ANDRADE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12743', N'GOOP6807084Y3', N'PEDRO GODINEZ OCEGUEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12744', N'MURE5309105B5', N'ENRIQUE MUÑIZ RAZO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12745', N'ZUVJ700814T37', N'JESUS ZUÑIGA VELASCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12746', N'ZUVJ890113H9A', N'JOSUE ANTONIO ZUÑIGA VELASCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12747', N'GOVJ7409259T4', N'JUAN GONZALEZ VELASCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12748', N'ZAAM400407AJ4', N'MARGARITA ZARAGOZA ARANDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12749', N'GONR681024AS7', N'RAFAEL GONZALEZ NAVARRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12750', N'GOGB610324BD9', N'BERNARDO GOMEZ GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12751', N'LITF900914NN3', N'FATIMA DEL CARMEN LIMON TORRES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12752', N'ZUVJ5406153D7', N'J JESUS ZUÑIGA VELASCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12753', N'GOZJ590511G19', N'JUAN GODINEZ ZUÑIGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12754', N'BOGJ460724GS0', N'JUAN BOTELLO GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12755', N'VEZZ7412217C5', N'ZENAIDO VELASCO ZARAGOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12756', N'ZUBA8607091E8', N'ALEJANDRO ZUÑIGA BARBOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12757', N'VESA930930IH0', N'ANALI GUADALUPE LESLY VELASCO SALCIDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12758', N'ZUCC741010LS0', N'CARLOS ZUÑIGA CARMONA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12759', N'MEBG910216KA1', N'GERARDO MARTIN MEJIA BARBOZA')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12760', N'GAGJ6512134E5', N'J. TRINIDAD GARIBAY GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12761', N'ZUNS510320QC4', N'J.SANTOS ZUÑIGA NAVARRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12762', N'ZUCJ7302071F9', N'JUAN ZUÑIGA CARMONA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12763', N'OOGJ741018JQ2', N'JULIO EVERARDO OCHOA GARIBAY')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12764', N'CUZA701228F57', N'ALEJANDRO CRUZ ZARAGOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12765', N'ZUIE720901UW0', N'ELIAS ZUÑIGA IÑIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12766', N'CAZJ760524R25', N'JESUS CARMONA ZARAGOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12767', N'GOTJ580313R5A', N'JESUS GODINEZ TEMORES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12768', N'OOVG640227TCA', N'MARIA GUADALUPE OCHOA VELASCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12769', N'GOIN780827QC0', N'NOE USBALDO GODINEZ ISLAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12770', N'CAVR610209ID2', N'RAMIRO CARMONA VELASCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12771', N'VEOR730112NM6', N'RAUL VELASCO OCEGUEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12772', N'ZAAR440906C49', N'ROBERTO ZARAGOZA ARANDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12773', N'VEVS720629JD4', N'SANDRA VELASCO VELASCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12774', N'GAEA710416H88', N'ALEJANDRO GARIBAY ESTRADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12775', N'BIOE520528G53', N'ELISA BRISEÑO ORTEGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12776', N'GOOF640329FY1', N'FRANCISCO GODINEZ OCEGUEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12777', N'OEGJ430209A8A', N'JAVIER OSEGUEDA GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12778', N'GOVJ770528QU2', N'JORGE GONZALEZ VELASCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12779', N'MEHJ510319AKA', N'JOSE MELENDREZ HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12780', N'MEHJ7506088T3', N'JUAN CARLOS MELENDREZ HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12781', N'GOCJ881015TP4', N'JUAN FRANCISCO GODINEZ CARMONA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12782', N'GOPL761226TA9', N'LUIS ALBERTO GODINEZ PATIÑO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12783', N'GOZL720317RZ8', N'MA. DE LOURDES GODINEZ ZUÑIGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12784', N'SOVR570603CV4', N'RAMIRO SOLIS VELASCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12785', N'OOCR9204241K5', N'RAUL ALEJANDRO OCHOA CARMONA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12786', N'MAVS5212083U1', N'SALVADOR MARTINEZ VELASCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12787', N'EAMA7209169M3', N'ADRIAN ESTRADA MUÑIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12788', N'MEEA820713UC7', N'ALMA PAULINA MELENDEZ ESTRADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12789', N'MAVA601216EP2', N'ARTURO MARTINEZ VELASCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12790', N'LIOJ700409SP5', N'JOSE LIMON OSEGUEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12791', N'CASL960703CC8', N'LUIS HUMBERTO CARMONA SERRANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12792', N'MUAR591011A93', N'ROBERTO MUÑIZ ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12793', N'VEZA8403058N6', N'ADRIAN VELASCO ZUÑIGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12794', N'CUZA5611254P8', N'ANTONIO CRUZ ZUÑIGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12795', N'IIFB490614QLA', N'BENJAMIN IÑIGUEZ FIGUEROA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12796', N'GORF530201R17', N'FERNANDO GONZALEZ RINCON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12797', N'ZUCH680830BM8', N'JOSE HECTOR ZUÑIGA CARMONA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12798', N'ZUOJ5706243VA', N'JUAN ZUÑIGA ORTEGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12799', N'LASC730808819', N'MA DEL CARMEN LARA SANTIAGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12800', N'AUBM440103H69', N'MAXIMINA AGUIRRE BECERRA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12801', N'GOER730513P87', N'RENE GONZALEZ ESTRADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12802', N'OOGF5608041Q1', N'FILIBERTO OCHOA GARIBAY')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12803', N'JIPJ510319BM5', N'JOSE JIMENEZ PARTIDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12804', N'CARZ680612T79', N'RAFAEL CARMONA ZARAGOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12805', N'GARM030508CCA', N'MARTIN GAEL GARCIA ROA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12806', N'AUDA810726B44', N'ALBARO AGUIRRE DIAZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12807', N'CAVA450128IKO', N'AMADO CARMONA VELASCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12808', N'LOIA620420JC0', N'ANTONIO LOPEZ IÑIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12809', N'GORM740405GK2', N'MA. ESTHER GODINEZ RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12810', N'GORS651215LX0', N'SERGIO GONZALEZ RINCON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12811', N'AUDV960515N38', N'VICTOR MANUEL AGUIRRE DIAZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12812', N'AAFA930920KD0', N'ALDO RICARDO ALATORRE FUENTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12813', N'OIIA5806198PA', N'ARTURO ORTIZ IÑIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12814', N'MUTJ921020SA9', N'JORGE LUIS MUÑIZ TRUJILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12815', N'GOPM500701A68', N'MA MAGDALENA GONZALEZ PENILLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12816', N'ZULM830930LK3', N'MAYRA ZUÑIGA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12817', N'CUZP400811KM5', N'POLITO CRUZ ZARAGOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12818', N'GOVY921204TR8', N'YESENIA GODINEZ VELASCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12819', N'GOTB6905088X4', N'BASILIO GODINEZ TEMORES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12820', N'GOME641101180', N'ENRIQUE GONZALEZ MONTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12821', N'CUOM731224256', N'MA MAGDALENA CRUZ OCHOA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12822', N'GOGA7606141G3', N'ANA LILIA GODINEZ GOMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12823', N'GOOJ680726T59', N'JUAN GODINEZ OCHOA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12824', N'VESL950418GE4', N'LIZETH ESMERALDA VELASCO SALCIDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12825', N'NARM8411234B2', N'MIREYA NAVARRO RAZO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12826', N'LOCR810210N63', N'RAFAEL LOPEZ CASTAÑEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12827', N'FOAJ570215K83', N'JAIME FRANCISCO FLORES AGUIAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12828', N'OOPN430519TV4', N'NORBERTO OCHOA PAREDES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12829', N'SAOF6309075F6', N'FELIPE SALCIDO OCEGUEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12830', N'MUGJ610531HB2', N'J TRINIDAD MUÑIZ GODINEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12831', N'TULF951004728', N'JOSE FRANCISCO TRUJILLO LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12832', N'ZUZM720915C27', N'MA GUADALUPE ZUÑIGA ZUÑIGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12833', N'TEGR810518LK1', N'RAFAEL TREJO GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12834', N'ZAIJ4406299P5', N'JUANA ZARAGOZA IÑIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12835', N'RASG8503288H6', N'GABRIEL RAMIREZ SUAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12836', N'VIRI490814A55', N'IGNACIO VIVAS RAMOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12837', N'ACA990927LG4', N'AGROPRODUCTOS DE CAMPECHE S.P.R. DE R.L.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12838', N'HAFD9406074I8', N'DAVID HARDER FROESE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12839', N'VAVG920402LU7', N'GIOVANNI VARELA VALENCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12840', N'LODH980910DA6', N'HEINRICH LOEWEN DOERKSEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12841', N'HVN210810RS8', N'HERMANOS VILLA DE NUEVO PENJAMO SAS DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12842', N'LOGK800315EB5', N'KATHARINA LOEWEN GIESBRECHT')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12843', N'MOCG761126IF2', N'GILMAR AROLDO MONTEJO CARDONA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12844', N'SME940128526', N'SERVICIO METALDRETT SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12845', N'MALP750823512', N'PEDRO MACIEL LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12846', N'GLS151215GT2', N'GOOD LUCK STORAGE SPR DE  RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12847', N'BUBA600803NR4', N'ABRAM BUECKERT BRAUN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12848', N'AMO210627PR4', N'AGRICULTORA MASAM DE OCAMPO SAS DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12849', N'FOGF8707089N4', N'FRANZ FROESE GUENTHER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12850', N'GNS210223CQ9', N'GRUPO LA NORIA DEL SURESTE SAS DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12851', N'GSF210206DM0', N'GRUPO SAN FERNANDO DE NUEVO PENJAMO 2000 SAS DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12852', N'LOFH760109SA9', N'HELENA LOEWEN FEHR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12853', N'WIHW971118144', N'WALTER WIEBE HARDER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12854', N'HAKA030901PV6', N'AGANETHA HARDER KAUENHOFEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12855', N'KAWE71051676A', N'ELIZABETH KAUENHOFEN WOLF')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12856', N'WIFE9802056T5', N'EVA WIELER FRIESEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12857', N'VAPL710509G55', N'JOSE LUIS VALENCIA PINEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12858', N'HAFM9606207Q3', N'MARIA HARDER FROESE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12859', N'VIAO9806136W2', N'ORLANDO VILLA AVILES')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12860', N'PEVS720130SR6', N'SUSANA PENNER VOTH')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12861', N'VAPJ671217DQ9', N'JOSE VARELA PACHECO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12862', N'CACN000214NS5', N'NAYELI SURISADAHI CHAN CHI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12863', N'OMI140730SV0', N'ORGANICOS MILENARIOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12864', N'SFM190801FI2', N'SEPHINA FOODS MEXICO S. DE R.L. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12865', N'RAR140328BV3', N'RANCHO AGROPECUARIO RAMADA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12866', N'MNA110810AR0', N'MANUFACTURAS NATUREX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12867', N'BME631003N72', N'BOSTIK MEXICANA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12868', N'HAZD8602174Z6', N'DIEDRICH HARDER ZACHARIAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12869', N'HEAE8605175R9', N'ERWIN HERNANDEZ AGUIRRE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12870', N'ROAH960710436', N'HARIPH RODRIGUEZ AGUAYO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12871', N'AAMR7302106P0', N'RICARDO ALCARAZ MEZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12872', N'PEMA980921BJ1', N'ABRAM PETERS MARTENS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12873', N'TITA790422MF0', N'AGATHA THIESSEN TEICHROEB')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12874', N'FEFB8504157X3', N'BERNARDO FEHR FEHR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12875', N'LOLD0104111W1', N'DAVID LOEWEN LOEWEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12876', N'BAHD8812262N4', N'DIEDRICH BRAUN HEIDE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12877', N'LOLH991021FA8', N'HERMAN LOEWEN LOEWEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12878', N'LOFJ670416DH2', N'JACOB LOEWEN FEHR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12879', N'HITP0009278XA', N'PETER HILDEBRANDT THIESSEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12880', N'BELE000917761', N'ERDMAN BERGEN LOEWEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12881', N'IDI990311MQ0', N'IMPORTACIONES Y DISTRIBUCIONES INTERNACIONALES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12882', N'MAVA8804243B3', N'ALEJANDRA MARTINEZ VAZQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12883', N'MOFF7201103I9', N'FABIANA MORALES FELIPE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12884', N'MIKH830225KX8', N'HELENA MILLER KAUENHOFEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12885', N'CGM210507FH4', N'CONDESA GINEBRA MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12886', N'DHEL7701168L0', N'ELISABETH DYCK HARDER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12887', N'MABJ710901BJ7', N'JACOBO MARTENS BUEKERT')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12888', N'MIKM800606G27', N'MARGARETHA MILLER KAUENHOFEN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12889', N'VCI150616EJ4', N'VALLE CHILAM SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12890', N'PTR1508072P9', N'PIDAG TRADING SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12891', N'FBE930202QFA', N'FINANCIERA BEPENSA S.A. DE C.V. SOFOM ER.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12892', N'BLE1512082R9', N'BEPENSA LEASING SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12893', N'OVA210804NF8', N'ORLANDO Y ASOCIADOS SAS DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12894', N'EUAE620829G90', N'JOSE EDECIO EHUAN AKE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12895', N'AAMM68121168A', N'JOSE MARIA ALCARAZ MEZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12896', N'CARJ630711Q22', N'J. ENCARNACION CARRILLO DE LA ROSA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12897', N'GORO851120890', N'OCTAVIO GONZALEZ RAMOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12898', N'MGA090730QL3', N'CARTERA MIEL GABRIELA S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12899', N'HESM960711MI0', N'MARCELO ISAI HERNANDEZ SALAZAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12900', N'PEM1512089S1', N'PROCESADORA Y ENVASADORA DE MEZCALES ARTESANALES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12901', N'LORJ900227QU8', N'JOSE LOBATO RUIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12902', N'IPU400509KB8', N'INGENIO DE PUGA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12903', N'ALU091019P61', N'ALURA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12904', N'MGU840223U79', N'GRUPO KASTO MOLINOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12905', N'PSM100507SZ4', N'CARTERA PALMICULTORES DE SAN MARCOS S.P.R. DE R.L.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12906', N'CGU101126SA2', N'SHELSER S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12907', N'UAR210920B17', N'UNION AGRICOLA REGIONAL DE SINALOA S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12908', N'PCB110527R81', N'PRODUCTOS DE CALIDAD DEL BAJIO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12909', N'SME200214IG5', N'SAFONOL DE MEXICO SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12911', N'DIN060703B93', N'DIGITA INTEGRAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12912', N'BMN930209927', N'BANCO MERCANTIL DEL NORTE SA INSTITUCION DE BANCA MULTIPLE GRUPO FINANCIERO BANORTE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12913', N'LOEB620212EM5', N'JOSE BRUNO LOPEZ ESQUER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12914', N'VEVM510717E56', N'MIGUEL ANGEL VEGA VALENCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12915', N'QULR741228821', N'REY DAVID QUEVEDO LUQUE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12916', N'WES151019NY5', N'WESTREMAR SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12917', N'VAAS5605104L4', N'MARIA ASCENCION VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12918', N'CUVC530519SV7', N'CARLOS CUEVAS VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12919', N'OECE480828622', N'ENRIQUE ORTEGA CAMARGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12920', N'SABR680702362', N'MARIA DEL ROSARIO SANDOVAL BORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12921', N'LOMR5610248E3', N'RAFAEL LOPEZ MASCAREÑO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12922', N'LUCS7004209B8', N'SILVIA LUQUE CAMARGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12923', N'BOSV590306EZ9', N'VICTORIA BON SALDIVAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12924', N'ACM130921MZ7', N'AGRICOLA CML SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12925', N'DUVR8412301S3', N'ROLANDO DUARTE VERDUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12926', N'RARM980823MQ6', N'MARIO EDUARDO RANGEL RUIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12927', N'PUC110427S26', N'PRODUCTORES UNIDOS DE LA CEBOLLA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12928', N'APA050901IR4', N'AGRICOLA  PACOS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12929', N'AAG180109AQ8', N'AGRICOLA ARCE GALAVIZ SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12930', N'GABM640219PU9', N'MARTIN GALVEZ BENITES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12931', N'GALR460207R41', N'ROSARIO GAMEZ LEYVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12932', N'FEVS790205NY9', N'SIXTO ERIX FELIX VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12933', N'AEFE8610174Q7', N'MARIA ELENA ARCE FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12934', N'AIS211001CQ5', N'AGRICOLA ISAMAR SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12935', N'ARA210930HM0', N'AGRICOLA RAMARLEYALAX SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12936', N'CUGG9402092H2', N'GIZEH MASSAI CUEVAS GALVEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12937', N'PEOG550404KV9', N'GRACIELA PEÑUELAS ORTEGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12938', N'FELS940223SZ9', N'SILVIA AIDA FELIX LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12939', N'ROVR680206BM2', N'MARIA DEL ROSARIO RODRIGUEZ VERDUZCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12940', N'CALJ580312RP6', N'JESUS CARDENAS LUQUE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12941', N'BACD760921P93', N'DANIEL BARRAZA COTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12942', N'VEBS9406157C7', N'SERGIO MISAEL VEGA BARRAZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12943', N'CAPJ821114LK2', N'JOEL BENJAMIN CASTRO PINEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12944', N'LOVE8207198ZA', N'EVERARDO LOPEZ VELAZQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12945', N'CAPF260620E11', N'FIDEL CARRASCO PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12946', N'AAAA901107JI7', N'ANGELICA MARIA ALVAREZ ALVAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12947', N'MOCH470805CF8', N'JOSE HUMBERTO MONTES CHINCHILLAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12948', N'PEZA481220LP8', N'ANTONIO PEREZ ZAVALA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12949', N'PEZE461220GT2', N'EDUVIGES PEREZ ZAVALA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12950', N'CALM390314EX4', N'MATILDE REYNA CASTRO LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12951', N'VAGV651128H78', N'VICTOR MANUEL VALENZUELA GIRON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12952', N'AELI790301T36', N'ISAAC ARCE LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12953', N'AELA811203768', N'AARON ARCE LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12954', N'SAOR760911UV3', N'RAMON ANTONIO SAPIEN OSORIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12955', N'LOSG610912M23', N'GUADALUPE LOPEZ SOTELO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12956', N'MUAG500725T68', N'GUADALUPE MUÑOZ AGUILAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12957', N'GABZ761217AMA', N'ZULEMA ADRIANA GARCIA BERRELLEZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12958', N'CEM880726UZA', N'CEMEX SAB DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12959', N'RCA940729470', N'RYDER CAPITAL S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12960', N'PSE931116PLA', N'PRESENTATION SERVICES SA DE CV')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12961', N'MAQ2108036I0', N'MOLINOS AGROINDUSTRIALES DE QUERETARO SRL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12962', N'LUAD980120A45', N'DIANA LAURA LUGO ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12963', N'AOVS531127SVA', N'SILVIA ACOSTA VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12964', N'AAHE790704NR7', N'ERIKA DEL REFUGIO ALVARADO HOLGUIN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12965', N'AAOJ500125G62', N'JOSE JESUS ALVAREZ OCHOA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12966', N'AOVI6212312Q3', N'IRMA MIRELLA APODACA VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12967', N'CMU220329ST8', N'CAMPOS MURRIETA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12968', N'LACA971210I66', N'ALMA INES LACHICA CHAPARRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12969', N'BEBC970105INA', N'CINDY MALENI BELTRAN BLANCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12970', N'ROPK930401HW8', N'KATHIA JUDITH RODRIGUEZ PALAFOX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12971', N'ADG200803J73', N'AGRICOLA DOÑA GELO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12972', N'EISA420620HX0', N'ALEJANDRO ESPINOZA SUAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12973', N'ATO1409194T8', N'AGRICOLA TOMASA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12974', N'QUCH530313M47', N'HUMBERTO QUINTERO CARRILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12975', N'MEJI931008MF6', N'IESUS EMMANUEL MERCADO JIMENEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12976', N'LAG170309D21', N'LARPI AGRICOLA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12977', N'VARM830918666', N'MAGDALENA VALLE ROMERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12978', N'GAGE730111FJ7', N'MARIA ESMERALDA GARCIA GASTELUM')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12979', N'NAVN820805R37', N'NATALIA NAVARRO VERDUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12980', N'BECS7201185BA', N'SAUL BERNAL CERVANTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12981', N'EIBI510410RU8', N'ISIDRO ESPINOZA BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12982', N'OUBJ540716NV9', N'JOAQUIN OSUNA BARBEYTIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12983', N'AESA510101T93', N'ANTONIO ARREDONDO SAUCEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12984', N'SAHF6705014U4', N'FERNANDO SANDOVAL HIGUERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12985', N'RICS680805264', N'JOSE SALOME RIVERA CHAVEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12986', N'COGR511115A36', N'JOSE RITO CORTEZ GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12987', N'AEFR761006898', N'ROSARIO EDEL ARREDONDO FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12988', N'ZALM740929LXA', N'MIGUEL EUGENIO ZAMORA LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12989', N'CACR730105PB1', N'REY DAVID CHAVEZ CAMARGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12990', N'LELS4709284H3', N'SIMONA LEON LEAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12991', N'AAL211202SG7', N'AGRICOLA ALVE SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12992', N'CAAL7812286K5', N'LIBRADA CABANILLAS ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12993', N'RURA681124TI3', N'ALEJANDRO RUIZ RUELAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12994', N'IABA9005032D7', N'ANDREA VALERIA INTRALIGGI BETANCOURT')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12995', N'LOMB880310QJ7', N'BRUNO SARATHIEL LOPEZ MARTINEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12996', N'EAOC7509017G2', N'CLAUDIA GABRIELA ESTRADA OLVERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12997', N'RUVF620129MJA', N'FRANCISCO RUIZ VEGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12998', N'SOPM440313R80', N'MARGARITA SOTO PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'12999', N'GAVP9401289B5', N'PAOLA AYERIM GARCIA VILLEGAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13000', N'PVJ100520R49', N'PUEBLO VIEJO DE JURICAHUI SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13001', N'AILA7202056T3', N'AARON GUADALUPE AISPURO LAZCANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13002', N'RURR720419189', N'RICARDO RUIZ RUELAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13003', N'MALJ940124QR2', N'JESUS MANUEL MARTINEZ LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13004', N'COGA430128H51', N'ADOLFO CORTEZ GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13005', N'COAA730820JP4', N'ADRIAN CORTEZ ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13006', N'ATC100823N35', N'AGRICOLA 35 TAMAZULA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13007', N'ASM070829CZA', N'AGRICOLA SANTA MARIA FRANCISCO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13008', N'AMR130513LD6', N'AGRICOLA MONTOYA ROMERO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13009', N'AULC790719F9A', N'CARLOS RUBEN ANGULO LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13010', N'CAAD800730GHA', N'DENISSE IVETTE CHAVEZ ARAUJO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13011', N'LOCE720526MN0', N'EVERARDO LOPEZ CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13012', N'VACF730205KF7', N'FREDI VALENZUELA CERVANTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13013', N'LOMA571017V54', N'MARTHA ELENA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13014', N'CAC09101651A', N'COMERCIAL AGRICOLA COSTERA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13015', N'CAVO550214VAA', N'OCTAVIO CHAVEZ VEGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13016', N'NISI400706UK5', N'ISAAC NIEBLAS SERRANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13017', N'GESJ5610077X9', N'JUAN FRANCISCO GERARDO SOTO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13018', N'ROSL800623B91', N'LUIS ALONSO ROJO SOSA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13019', N'AUPI480121A20', N'MARIA IGNACIA ANGULO PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13020', N'CADT560325QQ6', N'MARIA TEODULA CAMACHO DOMINGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13021', N'PAMP850213DN2', N'PETRA GUADALUPE PARRA MEDINA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13022', N'SAGR660819NY4', N'RAMONA SANCHEZ GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13023', N'FOCY841230KD9', N'YADELI SECUNDINA FLORES CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13024', N'LOAC950829A40', N'CENDRY GUADALUPE LONGORIA ACOSTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13025', N'UICG600619A22', N'GUMARO URIAS CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13026', N'LUGI550713131', N'ISABEL GUADALUPE LUGO GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13027', N'RIBA9102141C7', N'AGUSTIN RIVERA BELTRAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13028', N'LAGM570420QD3', N'JOSE MARTIN LANDEROS GUERRA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13029', N'RIFJ911223MC0', N'JESUS RAUL RIVERA FAVELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13030', N'LEC060329NE5', N'LECASTIAGRO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13031', N'GACR9901283K0', N'ROBERTO CARLOS GAMEZ CARRASCO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13032', N'MUMA711019TA3', N'ALEJANDRO MURILLO MURO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13033', N'LOLH410928UT9', N'HERLINDA LOPEZ LEYVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13034', N'SOUI800113978', N'IRAN GUADALUPE SOTELO URIAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13035', N'OEPJ841123GE4', N'JUANA CLEMENTINA ORNELAS PARRA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13036', N'APH220324645', N'AGRICOLA PELLEGRINI HERMANOS SPR D RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13037', N'BAGA600828N58', N'AGUSTIN BRASIL GALAVIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13038', N'CAMR871211216', N'ROGELIO GUADALUPE CAMEZ MIRANDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13039', N'COMR600612TP9', N'RAMON TRINIDAD COTA MURRIETA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13040', N'VAMG0208132D5', N'GLADILU VALDEZ MELENDREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13041', N'LICM741129CDA', N'MARTHA ELENA LIMON CORRALES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13042', N'IUPF6601207W7', N'FABIAN ALBERTO INZUNZA PEREA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13043', N'VAPI400802FM5', N'ISAAC VARELA PACHECO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13044', N'PAAM701029378', N'MARIA PAEZ ALVAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13045', N'VEHR760414127', N'RAUL VEGA HERRERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13046', N'LOZV9005217M6', N'VALENTE LOYA ZAMORA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13047', N'LELR520404EJ1', N'RUBEN LEYVA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13048', N'SEME641006P94', N'EFRAIN SEPULVEDA MERCADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13049', N'AUVA501103I51', N'APOLONIO AHUMADA VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13050', N'UICO500317NT6', N'OSCAR URIAS CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13051', N'BEMR531130K43', N'RAFAEL BELTRAN MACHADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13052', N'LUBD980722UX3', N'DANIELA LUGO BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13053', N'LARJ720121TJ4', N'JUAN GABRIEL LLANES ROMERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13054', N'MOGM640307MB8', N'MA.  DOLORES MONTAÑEZ GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13055', N'AUQA691123GI0', N'AUDOMARO AHUMADA QUINTERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13056', N'HELF780905DY9', N'FAUSTO HEREDIA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13057', N'LELR610328TA4', N'JOSE ROSARIO LEAL LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13058', N'DULA630416TA9', N'ANTONIO DUARTE LEAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13059', N'PELB901220AK7', N'BRIZNA YARELI PEINADO LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13060', N'AAZC600718DN6', N'CAMILA AGRAMON ZAMBRANO')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13061', N'SAVC481231NH0', N'CELESTINO SALAS VILLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13062', N'MOLJ520624NQ1', N'JUANA MARIA MORENO LEYVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13063', N'VIAM510723F84', N'MANUEL DE JESUS VILLANUEVA AHUMADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13064', N'AULM721118PY2', N'MIRNA LORENA AGUILAR LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13065', N'AEGS750525FM7', N'SUSANA ARCEO GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13066', N'ROCL850205KW0', N'LUIS EDUARDO ROMERO COLIO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13067', N'GAN070504872', N'GANPROVER SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13068', N'IME181009845', N'INBIOMEX DE MEXICO SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13069', N'PPS050210128', N'PRODUCTORA DE PAVOS DEL SURESTE SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13070', N'LPA1908136N2', N'LLANTRACTO DEL PACIFICO S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13071', N'IQC850820K25', N'INTERNACIONAL QUIMICA DE COBRE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13072', N'ROLE511211MS3', N'EULOGIO ROCHA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13073', N'FOQE550715JH2', N'ENRIQUETA FLORES QUINTERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13074', N'EALC340616S21', N'CARMEN ESPARZA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13075', N'FOGJ521104NC1', N'JOSE FLORES GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13076', N'AAQL6403238G7', N'LUIS AVALOS QUEVEDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13077', N'CABA840813M56', N'ARTURO CABRERA BELTRAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13078', N'AOIR671223PJ2', N'IRMA NORMA ACOSTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13079', N'AAQM560908JD5', N'MOISES AVALOS QUEVEDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13080', N'LOFL9706028A4', N'LESLEY  DAYANA LOPEZ FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13081', N'AUVE491227LU3', N'ESTHELA AGUIRRE VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13082', N'CODL010823RF0', N'LUIS ANGEL COTA DIAZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13083', N'FOFA7911049J1', N'ALBERTO FLORES FIGUEROA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13084', N'ROSM750401FQ8', N'JOSE MARIA RODRIGUEZ SAUCEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13085', N'EAVO5711208I1', N'OCTAVIO ESCALANTE VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13086', N'GOVY9212195P7', N'YOLANI GONZALEZ VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13087', N'HDT090627533', N'EL HALCON DORADO DE TAMAZULA II SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13088', N'MIAB9206287S3', N'BRENDA GUADALUPE MIRANDA APODACA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13089', N'VAMC4503185XA', N'CIRILO VALDEZ MENDIVIL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13090', N'RURC64111769A', N'CECILIA ENRIQUETA RUIZ RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13091', N'SOSC400503Q79', N'CRUZ SOTO SOTO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13092', N'PAFD751122RP0', N'DOLORES KARINA PALAFOX FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13093', N'AARD690224UV3', N'MARIA DOLORES AYALA RUELAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13094', N'GAER030429QT4', N'RUBI GARCIA ESPINOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13095', N'LUGH991108F5A', N'HEIBY MERELIN LUQUE GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13096', N'RORJ930126JA2', N'JULIO CESAR RODRIGUEZ RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13097', N'ACA2008074V9', N'AGRICOLA LA CHALATA SC DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13098', N'AOOJ7105237E0', N'JESUS RAMON ACOSTA OBESO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13099', N'DUAC780712GC9', N'CARLOS ENRIQUE DUARTE ADAMS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13100', N'LEGF460808322', N'FRANCISCO MIGUEL LEAL GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13101', N'EACG710726C98', N'GERMAN ESPARZA CORTEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13102', N'AAGG5512165J9', N'GUADALUPE ADAMS GAXIOLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13103', N'MUEJ470831BP8', N'JESUS RAMON MUÑOZ ESCARREGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13104', N'AUCL850927KX1', N'LEONARDO AHUMADA CORTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13105', N'ROLA3502087UA', N'MARIA ANGELINA RODRIGUEZ LEON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13106', N'AALJ470121KV6', N'MARIA DE JESUS ARANDA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13107', N'OELN020314GF2', N'NAYELI IZAMAR OBESO LEAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13108', N'SOMO861221JW7', N'OBDIEL SOLANO MELENDREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13109', N'QUVO691201AT9', N'OSCAR ANTONIO QUEVEDO VERDUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13110', N'PER020713LJ5', N'PRODUCTORS EJIDALES LA RINCONADA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13111', N'ROMR5312113E0', N'ROSA ELVIRA ROSAS MEDINA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13112', N'DULW580531Q60', N'WENCESLAO DUARTE LEAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13113', N'MIMA630626V1A', N'JOSE ANTELMO MIRANDA MIRANDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13114', N'LOPF791127FQ4', N'JOSE FRANCISCO LOREDO PARRA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13115', N'HAVJ5204069B4', N'JOSE JOEL HAUCHBAUM VAZQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13116', N'CAVB730530B85', N'BLANCA ESTELA CARVAJAL VAZQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13117', N'SOJE540930IB6', N'JERONIMO SOTO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13118', N'CESL610223IQA', N'LUCINDA CERVANTES SOTO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13119', N'GABR021126DN3', N'RAMON ALBERTO GASTELUM BELTRAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13120', N'VALR770420IRA', N'RUBEN VALDES LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13121', N'VASG5204124E2', N'GLORIA GUADALUPE VALENZUELA SERRANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13122', N'VARM84100363A', N'JOSE MIGUEL VALENZUELA RUIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13123', N'HAAU800704LJ9', N'URIEL HARO ACOSTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13124', N'AOSE5505174E1', N'ENRIQUE ACOSTA SEPULVEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13125', N'SASJ980424TQ8', N'JAQUELINNE GUADALUPE SANCHEZ SEPULVEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13126', N'MAGA540920RV8', N'ALBA ELBA MASCAREÑO GASTELUM')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13127', N'REVA940309JD9', N'ALEJANDRO REYES VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13128', N'AEVH920716R73', N'HIBRANN ALFREDO ARREDONDO VALLE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13129', N'QUAJ8703099W0', N'JESUS HUMBERTO QUINTERO ARCE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13130', N'CAIJ4905036M4', N'JORGE CASTRO INZUNZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13131', N'RIVL7707252A5', N'JOSE LUIS RIVERA VALDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13132', N'DPE100818QT0', N'LAS 2 PALMAS DEL EBANO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13133', N'DUOM720419HF4', N'MANUEL DURAN ORTIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13134', N'CAAM000718RW1', N'MARCOS JESUS CAMARGO ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13135', N'DUOR650218J96', N'RITA DURAN ORTIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13136', N'AUAR680130RI4', N'ROBERTO ANGULO ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13137', N'LOAR630712UG0', N'ROGELIO LOPEZ ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13138', N'QUQP5011106Z8', N'PEDRO QUEVEDO QUEVEDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13139', N'VILR581113CD9', N'ROSA AMELIA VILLANAZUL LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13140', N'VACG6412246D9', N'GERMAN VALDEZ CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13141', N'LECE560226', N'MARIA ESTHER LEON CARMONA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13142', N'JIPJ831115RZ3', N'JUAN LUIS JIMENEZ PATIÑO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13143', N'AOLI641119MV0', N'ISABEL TOLENTINO ACOSTA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13144', N'LUDO411209TL7', N'OLEGARIO LUNA DIAZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13145', N'AOAO960903G52', N'OMAR ELIAZIR ACOSTA ALVAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13146', N'OEAA570424HLA', N'ALEJANDRA ORTEGA ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13147', N'ATI0907312B4', N'AGRICOLA TIO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13148', N'VAVJ7910185Q5', N'JORGE ANTONIO VALENZUELA VILLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13149', N'RIVA670824LUI', N'JOSE ANGEL RIVERA VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13150', N'SOMJ640626KT1', N'JUANA SOSA MONTOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13151', N'VELM570416SP3', N'MARTHA VEGA LEGARRA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13152', N'NACE750602386', N'ERICA RAQUEL NAVIDAD CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13153', N'VAFC480811HP8', N'CARMEN VALENZUELA FIERRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13154', N'VALA560810131', N'LADISLAO VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13155', N'AOGN6311108NA', N'NOE ACOSTA GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13156', N'ACU080812EU4', N'AGRICOLA LOS CULICHIS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13157', N'API1008207N9', N'AGRICOLA LOS PITOS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13158', N'ROAB770926SX8', N'BLANCA LILIAN CARMELINA RODRIGUE ADAMS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13159', N'ROVB901009Q6A', N'BRIANDA YARELI ROMAN VEGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13160', N'VABE6808181P1', N'EVERARDO VALLE BUELNA')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13161', N'AELA001005AX5', N'JOSE ALEJANDRO ARMENTA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13162', N'CAGX0209088M6', N'JOSE ALFREDO CASTRO GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13163', N'CAGJ010330581', N'JOSE JAIRO CASTRO GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13164', N'LUBJ500808KW3', N'JOSE LUGO BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13165', N'LOMA441228MF4', N'MACEDONIO LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13166', N'CACR550804MT5', N'MARIA DEL ROSARIO CASTRO CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13167', N'IUED461025FM0', N'MARIA DOLORES INZUNZA ESPINOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13168', N'DULM480701TN2', N'MIGUEL AGUSTIN DUARTE LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13169', N'ACM220420S89', N'AGRICOLA LA CH MIRANDA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13170', N'VEOC670516GR2', N'CECILIO VERDUGO ORTIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13171', N'BOGL4510223E1', N'JOSE LUIS BOBADILLA GIL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13172', N'GUAJ620208PZ0', N'JUANA GUADALUPE GUTIERREZ ALVAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13173', N'ROAL991111Q97', N'LUIS CARLOS ROMERO ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13174', N'BOLR601110EE4', N'RODRIGO BOJORQUEZ LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13175', N'REML6512085Q1', N'LORENA REYNA MOLINARES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13176', N'AIC150304SC9', N'AGRICOLA EL INDIO DE LA CUESTA SPR CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13177', N'BOPR9208227Y2', N'ROSENDA IDSEL BOBADILLA PORTILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13178', N'CALE700415AA5', N'ERNESTINA CARO LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13179', N'CAMS410625GV4', N'SILVESTRE CASTILLO MURILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13180', N'VITR7206263S5', N'JOSE RAUL VIZCARRA TAVIZON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13181', N'BENJ511011KY4', N'JUAN NICASIO BELTRAN NUÑEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13182', N'CACL9512124QA', N'LORENA GUADALUPE CAMACHO CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13183', N'LOJM910103436', N'MARCELA LOPEZ JURADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13184', N'AURM690610PK5', N'MINERVA ANGULO RUELAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13185', N'CAME900118E95', N'ELVIA LIVIER CADENA MELENDRES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13186', N'ROSS580127EH5', N'SOTERO ROMAN SOTELO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13187', N'SAGN680219QY7', N'NORMA SANCHEZ GUTIERREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13188', N'AAJO9203077S4', N'OMAR LIDIER ALVARADO JUAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13189', N'PTI1008065L0', N'PROCESADORES DE LA TIERRA SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13190', N'COAC510810IU5', N'CLARA CORNEJO AMAYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13191', N'LEOS7211018Y3', N'SANTOS GUADALUPE LEYVA OBESO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13192', N'GAEV830911511', N'VENTURA DANIEL GARCIA ESQUIVEL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13193', N'ACI161219J45', N'AGRICOLA EL CHIBATO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13194', N'AKA100823SN0', N'AGRICOLA KARD SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13195', N'ALZ160212746', N'AGRICOLA LA LLAVE DE ZAPATA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13196', N'AGG080530P25', N'AGRICOLA Y GANADERA GUSALO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13197', N'VEAA971030SW5', N'ALONDRA GUADALUPE VELAZQUEZ ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13198', N'AEVA7307271Y0', N'AROL VENANCIO ARMENDARIZ VEGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13199', N'RORD000213CR9', N'DIANA ROSARIO RODRIGUEZ RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13200', N'ROMC940602AD4', N'CLAUDIO JESUS ROMAN MOSQUEDA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13201', N'AUAE670307JA5', N'EDRULFO ANGULO ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13202', N'PAGF0011277V7', N'FILIBERTO PANIAGUA GONZALEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13203', N'BOSE91112845A', N'ELEANE BOJORQUEZ SOTELO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13204', N'LOVF6509221C8', N'JOSE FRANCISCO LOPEZ VERDUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13205', N'AELD610220FI1', N'DAVID ARMENTA LUNA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13206', N'COGL441219DS0', N'LORENZO COTA GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13207', N'GORJ810329D34', N'MARIA JOSE GONZALEZ ROMO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13208', N'ABA161220URA', N'AGRICULTORES DE LA BARRANCA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13209', N'FILN840517BR5', N'NIDIA DEYANIRA FIERRO LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13210', N'SAIC020823CP1', N'CESAR ALEJANDRO SANCHEZ INZUNZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13211', N'MOCJ710916R25', N'JAVIER MONTENEGRO CORRALES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13212', N'AUPJ591012791', N'JUAN ANGUIANO PEÑA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13213', N'BOBB9906248I8', N'BRYAN GUADALUPE BOJORQUEZ BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13214', N'GAVC7201051EA', N'CELIA DEL CARMEN GASTELUM VILLARREAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13215', N'SASS740919NC8', N'SOCORRO SANTOS SOLIS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13216', N'MIAO741120', N'ORLANDO MIRANDA ARAGON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13217', N'HEND570301SZ2', N'DOLORES JUANA HERNANDEZ NUÑEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13218', N'LOHS8011198F2', N'SANTIAGO LOPEZ HERRERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13219', N'VALA850812HH8', N'ALONSO FAVIO VALENZUELA LEON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13220', N'COAP001125493', N'PERLA MARINA CORTEZ ALVAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13221', N'BASC921230S55', N'CARLOS YUNUEL BARRERAS SOTO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13222', N'SOTK760515665', N'KARINA RAFAELA SOTELO TAM')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13223', N'AEGA980824H11', N'ADILENE ARMENTA GAXIOLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13224', N'VAEC561107QI6', N'CONCEPCION DE LA VARA ESTRADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13225', N'GACA860815GV4', N'ARNULFO GARCIA CHAVEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13226', N'LOCM871213DC3', N'MIGUEL LEOBARDO LOPEZ CERVANTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13227', N'NICE020113FW9', N'ELIA MARIA NIETO CHAVEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13228', N'OOGL610807KW1', N'JOSE LUIS OSORIO GAMBOA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13229', N'FELE501021BM3', N'MARIA ELENA FELIX LUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13230', N'LUCJ540220EU7', N'JOSE LUQUE CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13231', N'GOVR681121AQ6', N'RAMON GELACIO GONZALEZ VILLAMAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13232', N'AUHR960125R2A', N'ROCIO ANGULO HIGUERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13233', N'SASS6412037D6', N'SONIA SANCHEZ SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13234', N'CASV740705SS4', N'VICTORIANO CAMACHO SAVEDRA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13235', N'MOHY001026K75', N'YAMILET GUADALUPE MONTOYA HEREDIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13236', N'SACA4501068X8', N'ALVARO SANCHEZ CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13237', N'QUVF75021478A', N'FRANCISCO QUEVEDO VIDALES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13238', N'MELH4710295I5', N'HIPOLITO MEZA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13239', N'OULJ710703KKA', N'JOEL OSUNA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13240', N'CAMI9905087V3', N'JOSE INDALECIO CASTRO MALDONADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13241', N'PECL710220Q1A', N'LUDIVINA PEÑUELAS CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13242', N'CAML9209207Z8', N'LUIS MIGUEL CASTRO MALDONADO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13243', N'SRG100805RK9', N'SIEMBRA Y RECOLECCION DE GRANOS SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13244', N'CAGX490626M56', N'ANTONIO CASTRO GUERRERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13245', N'LOGS460725EF9', N'SANTIAGO LOPEZ GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13246', N'PAPR760909MG8', N'ROSARIO MARGARITA PLATA PLATA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13247', N'GALA540330NK2', N'AURELIANO GARCIA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13248', N'MIPB750501RJ9', N'BERTHA ALICIA MILLAN PARRA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13249', N'QUPD540210JX6', N'DOMINGA QUIÑONEZ PARRA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13250', N'GAME7711145T8', N'ELEAZAR GAXIOLA MONTOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13251', N'PAA1607152Y7', N'PRODUCTORES AGRICOLAS DE ALHUEY LOS ABUELOS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13252', N'JIHM7705013G3', N'MARGARITA JIMENEZ HERNANDEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13253', N'CARG551007625', N'MARIA GUADALUPE CHAVEZ RAMIREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13254', N'IUCG620818S20', N'GILFREDO INZUNZA CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13255', N'MATG750210HV2', N'GUILLERMO MARTINEZ TORRES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13256', N'AITR5101043Q6', N'JOSE RIGOBERTO AISPURO TORRES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13257', N'AUMH720124PT3', N'JOSE HORACIO ANGULO MONTOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13258', N'MACL8407316D0', N'LUCERO MASCAREÑO CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13259', N'ALI100626AD8', N'AGRICOLA LIMONTITA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13260', N'ASI210903KX0', N'AGRICOLA EL SIERRILLAS SPR DE RL')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13261', N'AYA100924ETA', N'AGRICOLA YACHOCHITO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13262', N'APV210212IW8', N'AGRICOLA PEREZ VILLA, S.P.R. DE R.L.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13263', N'ACO110812HR9', N'AGRICOLA LOS COMELINES SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13264', N'MOEE561028JT5', N'EMMA GUADALUPE MONTOYA ELIZALDE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13265', N'MOLA880816DK1', N'ABELINO MONTOYA LEON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13266', N'VALA85070136A', N'AGLAHEL VALENZUELA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13267', N'AAG180720I73', N'AGRICOLA  AGROYOVE SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13268', N'AEL080819IB5', N'AGRICOLA ERASMO LOPEZ MEDINA SPR RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13269', N'BEBJ860111A13', N'JESUS ARMANDO BELTRAN BARRAZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13270', N'BEBM800722TD2', N'MACLOVIO BELTRAN BARRAZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13271', N'SARA640915FW7', N'ARTEMISA SANCHEZ RENTERIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13272', N'AEFA651205NV7', N'AURORA ARECHIGA FELIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13273', N'AUCC781206U65', N'CESAR FREDY ANGULO CARDENAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13274', N'COCE531220JK1', N'ELENA CONTRERAS CHAVEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13275', N'BASE891001PE7', N'EMMANUEL BACA SALDAÑA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13276', N'RELF721017KH7', N'FELIPE REYES LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13277', N'AUMF740228TG1', N'FLERIDA ANGULO MONTOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13278', N'EIHG841009JW8', N'GERMAN ESPINOZA HIGUERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13279', N'VAUC480914935', N'JOSE CARMEN VALDES URIBE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13280', N'VICJ4008297Z0', N'JOSE JESUS VILLANUEVA CASTILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13281', N'POB100823S76', N'LAS PALMAS Y LOS OLIVOS DE BO RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13282', N'SASC461126RY0', N'MARIA CRISTINA SANCHEZ SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13283', N'CAUM720222H20', N'MIGUEL GERARDO CASTRO URETA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13284', N'AICM9402277J4', N'MOISES AARON AVILEZ CERVANTES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13285', N'UIMR5609235V8', N'ROSALINA URIAS MONTOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13286', N'MOCF980104GP9', N'FARID MONTOYA CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13287', N'ABR1008108CA', N'AGRICOLA LOS BRASILES SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13288', N'ATE220202FU0', N'AGRICOLA TEPEHUAJITO SR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13289', N'CUMG750410DG0', N'GILBERTO CRUZ MENDOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13290', N'LORJ630319AW5', N'JOSE LOPEZ RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13291', N'CAVL580825AH0', N'LUIS REY CASTRO VERDUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13292', N'SOCR49052169A', N'ROSALVA SOTELO CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13293', N'MOFS560918546', N'SOCORRO MONTOYA FAVELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13294', N'CUMI950519KR7', N'IRVING JESUS CUADRAS MONTENEGRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13295', N'XAXX010101000', N'ALUPIR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13296', N'IBA190514L17', N'IMPORTACIONES BASCOM S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13297', N'VYM010411120', N'DE LOS VALLES DEL YAQUI MAYO Y GUAYMAS A.R.I.C DE R.I.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13298', N'AAC070701IDA', N'ACCION ACUACULTURA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13299', N'SAC920117AFA', N'SIGMA ALIMENTOS CENTRO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13300', N'ATM820303597', N'AIR TEMP DE MÉXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13301', N'AAC990902IX9', N'ACCION ACUICOLA, S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13302', N'PRM070627QT3', N'PANEL REY MEXICO SA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13303', N'GUQH460808U3A', N'HECTOR GUTIERREZ QUINTERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13304', N'BOBI020618B89', N'IMANOL ARTEMIO BOJORQUEZ BOJORQUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13305', N'RORR731212UE4', N'RENAN RODRIGUEZ RIVERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13306', N'MUCG650330I88', N'GUADALUPE MURILLO CORRALES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13307', N'COMM960206BZ7', N'MARIA JOSE COTA MURILLO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13308', N'CSE170830E94', N'CALLE 6 SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13309', N'LUEC730416SE3', N'CORNELIO LUQUE ESPINOZA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13310', N'ACV130412654', N'AGRICOLA CAMPO 21 SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13311', N'COLR590430A10', N'RAMON CONTRERAS LARA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13312', N'DIGS421224L28', N'SALVADOR DIAZ GODINEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13313', N'CUME6001203G2', N'ERNESTO CUADRAS MONTOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13314', N'LOLA5003107U1', N'ANTONIA LOZOYA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13315', N'DULJ701114U46', N'MARIA DE JESUS DURAN LOSOYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13316', N'AGU170104MYA', N'AGRICOLA GUTMON SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13317', N'ACS150818DA5', N'AGRICOLA EL CHARRITO DE SAN ANTONIO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13318', N'AGT200904TA1', N'AGRICOLA Y GANADERA TRIANGULOP SPR RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13319', N'AUAC551013BW6', N'CARMEN GRACIELA ANGULO ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13320', N'AASJ001222E84', N'JORGE LUIS ARAUJO SOTO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13321', N'AELJ620617457', N'JUANA ARREOLA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13322', N'VEAL7902233L9', N'LUZ MARIELA VEGA ANAYA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13323', N'MAI170814EN8', N'MAIXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13324', N'XEXX010101000', N'VITAMIX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13325', N'XEXX010101000', N'TIFFANY')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13326', N'XEXX010101000', N'EATON')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13327', N'XEXX010101000', N'EASTMAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13328', N'XEXX010101000', N'ESPACEX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13329', N'XEXX010101000', N'TAJIN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13330', N'ADE090713F31', N'ALMACENES DOÑA EUGENIA DEL SURESTE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13331', N'IVE141127CK7', N'INDORAMA VENTURES ECOMEX S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13332', N'PIN210414IW7', N'PROBASIKOS INTERNACIONAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13333', N'VEAO8209079F6', N'OSCAR OMAR VERDUGO ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13334', N'CAG161221UM0', N'CURVA DE LA AGUA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13335', N'ENA201113UK5', N'ENALIN SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13336', N'LOAS980912RD1', N'STEPHANIA LOPEZ ASTORGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13337', N'PSU100805QQ5', N'SOCIEDAD DE PROCESO DEL SUELO SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13338', N'ATI161219UH9', N'AGRICOLA EL TITERE SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13339', N'CALJ710302Q3A', N'MARIA JESUS CHAVEZ LEYVA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13340', N'MAGZ5303086Q0', N'ZAIDA MASCAREÑO GASTELUM')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13341', N'AOOF890630HD6', N'FRANCISCO ENRIQUE APODACA ORTEGA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13342', N'BECA590531DA2', N'ALVA ROSA BELTRAN CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13343', N'AEED750317K4A', N'EDGAR OMAR ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13344', N'LUCJ8003173E6', N'JORGE LUQUE CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13345', N'AFA120216V57', N'AGRICOLA LOS FALUCOS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13346', N'AHO080918MQ7', N'AGRICOLA LOS HORCONES SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13347', N'COAA950112DE7', N'ALEXIS RAMON CONTRERAS ARREOLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13348', N'CAAM900607QD0', N'JOSE MIGUEL CAMARGO ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13349', N'MOLF730227ER8', N'FIDELIA MONTOYA LLANES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13350', N'VASP371005PX4', N'JOSE PLACIDO VALDEZ SANDOVAL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13351', N'PAF960917BE1', N'PRODUCTORES AGRICOLA FELICIANO PEÑA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13352', N'CACS620419437', N'SANTA EMMA CASTRO CARDENAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13353', N'LEVJ620405G85', N'JOSE DE JESUS LEYVA VALENZUELA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13354', N'PAMM880229AB0', N'MANUELA LILIANA PACHECO MORENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13355', N'OEAR641024A37', N'RAFAEL ORTEGA ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13356', N'EAVS630710432', N'SIGIFREDO ESCALANTE VILLEGAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13357', N'MOGA9308244Q4', N'ALAIN MISAEL MOLINA GUZMAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13358', N'LORC840913GF0', N'CLAUDIA LIZETH LOBO RESPARDO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13359', N'PIR150715KW5', N'EL PIRRA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13360', N'LUCJ8003173E6', N'JORGE LUQUE CASTRO')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13361', N'PEHM850116NE9', N'MARCELA EDITH PEREZ HIGUERA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13362', N'AAD1309111A8', N'AGRICOLA ASI DALE SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13363', N'ADB080906Q1A', N'AGRICOLA DOÑA BERNA SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13364', N'ATO080906G71', N'AGRICOLA EL TORRUCO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13365', N'GAXA5403288E0', N'AMADA  GAMEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13366', N'LIAG0002105G2', N'GRECK AXEL LIZARRAGA AYALA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13367', N'CUVJ9502209F6', N'JENNIFER CRUZ VERDUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13368', N'PMA120725BK4', N'PRODUCTORA MEXICANA DE ARROZ SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13369', N'MEOL870102J22', N'LUCERO ALEJANDRA MERCADO ORDUÑO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13370', N'VECA431002J76', N'ANGELITA VERDUGO CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13371', N'PERA5805023F0', N'ATANACIO PEÑA RODRIGUEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13372', N'FIAJ5810218Z9', N'JORGE ABEL FIGUEROA ARMENTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13373', N'VALD970923HQ6', N'DANIELA GUADALUPE VALDEZ LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13374', N'ROCN6410317U0', N'NEMESIO ROMERO CRUZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13375', N'OERA690915EW7', N'ALFONSO PORFIRIO ORNELAS ROMERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13376', N'ACO220506643', N'AGRICOLA COVAL SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13377', N'RORL960118NI4', N'LUIS ANTONIO ROJO RUIZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13378', N'SCO811026KFA', N'SANTANDER CONSUMO SA DE CV SOFOM ER GRUPO FINANCIERO SANTANDER')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13379', N'AKE120926S72', N'AGRICOLA KEVIN ERNESTO SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13380', N'GABE450714IV1', N'BENTURA GAXIOLA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13381', N'LEMD5612207J7', N'DOMINGO LEAL MORENO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13382', N'PEAJ780922NV6', N'JUAN CARLOS PEREZ AHUMADA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13383', N'LODA7603156F5', N'ARTURO ALFONSO LOPEZ DUARTE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13384', N'CAAM900607QD0', N'JOSE MIGUEL CAMARGO ANGULO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13385', N'JGS190311K34', N'LOS JUNIORS GS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13386', N'AIUM700921DG2', N'MATEO AISPURO URIAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13387', N'SAAA4206139Y4', N'ABELARDO SANTOS AGUILAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13388', N'AUAE661013GB9', N'EDUARDO ANGULO AGUILAR')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13389', N'OICJ790906CX8', N'JESUS MANUEL OLIVAS CORRALES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13390', N'NIE210827F53', N'NUUK IMPORTADORA Y EXPORTADORA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13391', N'PMA120725BK4', N'CARTERA PRODUCTORA MEXICANA DE ARROZ SAPI  DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13392', N'ATM820303597', N'CARTERA AIR TEMP DE MEXICO SA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13393', N'AGR1605244P9', N'ATTEBURY GROUP S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13394', N'AELM820425M86', N'MARCO ANTONIO ARMENTA LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13395', N'COCF750214537', N'FILIBERTO COTA COTA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13396', N'CACC700301I8A', N'CESAR LUIS CASTRO CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13397', N'DABA830410TM1', N'MARIA ADELY DAGNINO BELTRAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13398', N'DABR890730UJ1', N'RONALDO EUSEBIO DAGNINO BELTRAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13399', N'BICS6612025A1', N'SATURNINO BRICEÑO CASTRO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13400', N'CFA1203283M6', N'COMERCIALIZADORA DE FRIJOL EL AGUANAVAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13401', N'DEL140117R95', N'CARTERA MINSA COMERCIAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13402', N'MUMA600427847', N'ALBERTO EDUARDO MUNGUIA MACIAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13403', N'MER160920PR7', N'MERKAMUNDU SAPI DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13404', N'ROCF780915828', N'FERNANDO ROMERO CHICUATE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13405', N'GULC680615JG0', N'CARLOS GUERRERO LOPEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13406', N'LEDR501019LU7', N'ROSA ALBINA LEAL DIAZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13407', N'VAOC010107JU8', N'CARMEN ZUGEY VALENZUELA OLIVAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13408', N'NENL540811JV3', N'JOSE LUIS NEVAREZ NEVAREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13409', N'GUCM730330J7A', N'MELESIO GUTIERREZ CAMACHO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13410', N'LOBA340104HA0', N'ANGELINA LOPEZ BELTRAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13411', N'VERR550403BEA', N'MARIA DEL ROSARIO VELIZ RUELAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13412', N'VIMM8311082C0', N'MIRIAM BERENICE VILLALOBOS MOLINARES')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13413', N'MEBR7204165J5', N'ROMAN MERCADO BELTRAN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13414', N'ZARO3508102Y0', N'ROSARIO ELISA ZAMBRANO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13415', N'PEN1510153Z3', N'PENPACK S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13416', N'GAPX9802025BA', N'XIOMARA GALLEGOS PEREZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13417', N'GCM15111814N', N'GRUPO COMERCIAL MAPEZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13418', N'MME201130S56', N'MAYANSHUL MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13419', N'EAG811205M74', N'EMBOTELLADORA AGA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13420', N'VTM1710235S2', N'CARTERA VALIA TRADING MEXICO SAPI DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13421', N'GCM1511181N4', N'CARTERA COMERCIAL MAPEZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13422', N'SOGO811223DC0', N'OMAR SOTO GARCIA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13423', N'CMG090417IK4', N'COMERCIALIZADORA MAYORISTA DEL GOLFO, S.A. DE C.V.')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13424', N'ACD130725L54', N'AGROPECUARIA CDH S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13425', N'IALJ751112UQ5', N'JESUS OCTAVIO IBARRA LEDESMA')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13426', N'PAM131030PB9', N'PRODUCCION AGRICOLA DE MAIZ SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13427', N'AAC070701IDA', N'CARTERA ACCION ACUACULTURA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13428', N'DCS1603188P7', N'DINA COMERCIALIZACION SERVICIOS Y REFACCIONES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13429', N'TSE850710837', N'TEQUILAS DEL SEÑOR SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13430', N'PFA961023H84', N'PRODUCTOS FINOS DE AGAVE SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13431', N'CEI110614FX9', N'DENALI PACIFIC GRUPO INDUSTRIAL SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13432', N'AUC621030DF9', N'ALMACENADORA UCAMAYO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13433', N'EES1607142G3', N'ENTSERV ENTERPRISE SERVICES MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13434', N'CACX7207175Z1', N'ALFONSO CAMILLI CAMINO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13435', N'GACR590816KE1', N'RAMON GAMBOA CARDENAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13436', N'MULO910605HI4', N'OMAR MURGUIA LARIOS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13437', N'HESJ810821LJ3', N'JORGE FRANCISCO HERNANDEZ SANCHEZ')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13438', N'SES0603094H9', N'SISTEMAS DE ECOLOGIA SOLAR S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13439', N'AUR980715RU4', N'AGRICULTORES UNIDOS DEL RINCÓN  SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13440', N'SER020110FFA', N'SERICAM SPR DE RL')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13441', N'CAM190726JU1', N'CRIBAS Y ALMACENES DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13442', N'CLO030829BX6', N'CONGELADORA LOCZA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13443', N'MIGL731018195', N'LAURA LILIA MIRANDA GUERRERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13444', N'FER120507Q9A', N'FERTICADENA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13445', N'FOJR980412KX4', N'RICARDO DANIEL FLORES JARERO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13446', N'ATC100616HA3', N'AGRICOLA TERRO CULTIVOS SPR DE RI')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13447', N'CAR190513680', N'COMERCIALIZADORA ARDICH')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13448', N'DLC1901269Q9', N'DAGER LOGISTICA Y COMERCIO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13449', N'GAR170210751', N'GRUPO ARVESTRA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13450', N'GTS130102533', N'GAMAS TRADE SOLUTIONS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13451', N'SHO010216I73', N'SEMILLAS HERMANOS OLVERA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13452', N'MAD1708036N3', N'MADOBOX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13453', N'PAR2201057F4', N'POLYMERS & RESINS DE MEXICO S DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13454', N'ACE900319JT9', N'ACEROMEX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13455', N'CRM9611142X7', N'CONGELADORA REY MAR DE TAMPICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13456', N'GAVA7509227Q4', N'ADA MARITZA GARCIA VERDUGO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13457', N'PIN191104RM4', N'PIAGA INDUSTRY SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13458', N'ALI220412367', N'ALLIERA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13459', N'LFM881024QE1', N'LUBRICANTES FUCHS DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13460', N'CYT980805529', N'CYTNIS SA DE CV')
GO
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13461', N'AFR091208S25', N'AGROTRACTORES DE FRESNILLO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13462', N'UCA470901D45', N'UNION DE CREDITO AGRICOLA DEL MAYO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13463', N'BSE161116IJ2', N'BONYARD SERVICIOS SC')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13464', N'ALC1311258G5', N'AGRICOLA LA COMPUERTA DE LAGUNILLAS S.P.R DE R.L DE C.V')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13465', N'CMF150918US1', N'CARTERA COMERCIALIZADORA MEXICANA DE FRUTOS SECOS SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13466', N'SIFB8912045C3', N'BERNHARD SCHMITT FROESE')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13467', N'OECR741115GH2', N'RAFAEL JESUS ORTEGON CATZIN')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13468', N'AEL170727B28', N'ALMACENADORA ELMET SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13469', N'AME030407SE3', N'ALUBIN DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13470', N'CGN220303DQ0', N'COMERCIALIZADORA DE GRANOS NAVES SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13471', N'JAF100920Q26', N'JB AGROINDUSTRIA FORRAJERA SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13472', N'CEA180825HY4', N'CONAGRO ESPECIALIDAD AGRICOLAS')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13473', N'FRI190425H90', N'FRIARESA SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13474', N'DMI1210263E4', N'DIMINOX')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13475', N'ABU0503225R9', N'CARTERA AGROINDUSTRIAS DE BUENAVENTURA SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13476', N'EWM111005EU6', N'EMBALAJES WINPAK DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13477', N'IAT100318UD8', N'IMPULSORA AZUCARERA DEL TROPICO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13478', N'KTM1507068L0', N'KUMHO TIRE DE MEXICO SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13479', N'NAC140821JY4', N'NUECES AGUA CALIENTE SPR DE RL DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13480', N'ECL040220DV7', N'CARTERA ENLACE COMERCIALY LOGISTICO BARB''S SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13481', N'GFO990909TD5', N'GRUPO FOX SA DE CV')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13482', N'RAAG8209261Z7', N'GERARDO DAVID RAMOS AVENDAÑO')
INSERT [dbo].[Client] ([AccountNum], [Rfc], [Name]) VALUES (N'13483', N'XAXX010101001', N'INDUSTRIAS PATITO SA DE CV')
GO
SET IDENTITY_INSERT [dbo].[Documents] ON 

INSERT [dbo].[Documents] ([Id], [Name], [DocumentTypeId]) VALUES (1, N'Acta constitutiva', N'1')
INSERT [dbo].[Documents] ([Id], [Name], [DocumentTypeId]) VALUES (2, N'Poderes', N'1')
INSERT [dbo].[Documents] ([Id], [Name], [DocumentTypeId]) VALUES (3, N'INE', N'2')
INSERT [dbo].[Documents] ([Id], [Name], [DocumentTypeId]) VALUES (4, N'Licencia', N'2')
INSERT [dbo].[Documents] ([Id], [Name], [DocumentTypeId]) VALUES (5, N'Identificación', N'2')
INSERT [dbo].[Documents] ([Id], [Name], [DocumentTypeId]) VALUES (6, N'Comprobante de domicilio', N'2')
SET IDENTITY_INSERT [dbo].[Documents] OFF
GO
SET IDENTITY_INSERT [dbo].[DocumentType] ON 

INSERT [dbo].[DocumentType] ([Id], [Name]) VALUES (1, N'Linea Transportista')
INSERT [dbo].[DocumentType] ([Id], [Name]) VALUES (2, N'Chofer')
SET IDENTITY_INSERT [dbo].[DocumentType] OFF
GO
SET IDENTITY_INSERT [dbo].[ModuleCategories] ON 

INSERT [dbo].[ModuleCategories] ([Id], [Key], [Name], [Description], [StatusId]) VALUES (1, N'DateManagment', N'Gestor de Citas', N'Categoria que contiene los modulos para el proceso de Gestion de Citas.', 1)
INSERT [dbo].[ModuleCategories] ([Id], [Key], [Name], [Description], [StatusId]) VALUES (2, N'Catalogs', N'Catalogos', N'Categoria que contiene los catalogos que guardan la informacion utilizada para el proceso de Gestion de Citas.', 1)
INSERT [dbo].[ModuleCategories] ([Id], [Key], [Name], [Description], [StatusId]) VALUES (3, N'Configuration', N'Configuracion', N'Categoria que contiene los modulos de configuracion para el portal.', 1)
INSERT [dbo].[ModuleCategories] ([Id], [Key], [Name], [Description], [StatusId]) VALUES (4, N'Reports', N'Reportes', N'Categoria que contiene los reportes generados apartir de las citas realizadas.', 1)
SET IDENTITY_INSERT [dbo].[ModuleCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Modules] ON 

INSERT [dbo].[Modules] ([Id], [Key], [ModuleCategoriesId], [Name], [Description], [StatusId], [Icon]) VALUES (1, N'Dates', 1, N'Citas', N'Modulo de gestion de citas.', 1, N'bx-home-circle')
INSERT [dbo].[Modules] ([Id], [Key], [ModuleCategoriesId], [Name], [Description], [StatusId], [Icon]) VALUES (2, N'AuditDocumentation', 1, N'Documentacion por Auditar', N'Modulo de gestion de autorizaciones de documentacion.', 1, N'bx-detail')
INSERT [dbo].[Modules] ([Id], [Key], [ModuleCategoriesId], [Name], [Description], [StatusId], [Icon]) VALUES (3, N'ChangePassword', 3, N'Cambio de Contraseña', N'Modulo para cambio de contraseña.', 1, N'bx-detail')
INSERT [dbo].[Modules] ([Id], [Key], [ModuleCategoriesId], [Name], [Description], [StatusId], [Icon]) VALUES (4, N'Users', 3, N'Usuarios', N'Modulo de gestion de Usuarios.', 1, N'bx-detail')
INSERT [dbo].[Modules] ([Id], [Key], [ModuleCategoriesId], [Name], [Description], [StatusId], [Icon]) VALUES (5, N'Permissions', 3, N'Permisos', N'Modulo de gestion de permisos', 1, N'bxs-key')
INSERT [dbo].[Modules] ([Id], [Key], [ModuleCategoriesId], [Name], [Description], [StatusId], [Icon]) VALUES (6, N'Transports', 2, N'Transportes', N'Modulo de gestion de permisos', 1, N'bxs-truck')
INSERT [dbo].[Modules] ([Id], [Key], [ModuleCategoriesId], [Name], [Description], [StatusId], [Icon]) VALUES (7, N'TransportLines', 2, N'Lineas de Transporte', N'Modulo de gestion de permisos', 1, N'bxs-business')
INSERT [dbo].[Modules] ([Id], [Key], [ModuleCategoriesId], [Name], [Description], [StatusId], [Icon]) VALUES (8, N'Drivers', 2, N'Choferes', N'Modulo de gestion de permisos', 1, N'bxs-group')
INSERT [dbo].[Modules] ([Id], [Key], [ModuleCategoriesId], [Name], [Description], [StatusId], [Icon]) VALUES (9, N'Documents', 2, N'Documentos', N'Modulo de gestion de permisos', 1, N'bxs-file-doc')
INSERT [dbo].[Modules] ([Id], [Key], [ModuleCategoriesId], [Name], [Description], [StatusId], [Icon]) VALUES (10, N'Products', 2, N'Productos', N'Modulo de gestion de permisos', 1, N'bx-detail')
INSERT [dbo].[Modules] ([Id], [Key], [ModuleCategoriesId], [Name], [Description], [StatusId], [Icon]) VALUES (11, N'Penalties', 4, N'Reportes', N'Modulo de reportes', 1, N'bx-detail')
SET IDENTITY_INSERT [dbo].[Modules] OFF
GO
SET IDENTITY_INSERT [dbo].[Operation] ON 

INSERT [dbo].[Operation] ([Id], [Name]) VALUES (1, N'Carga')
INSERT [dbo].[Operation] ([Id], [Name]) VALUES (2, N'Descarga')
SET IDENTITY_INSERT [dbo].[Operation] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (2, N'00001-105522-SSW-LENB/0911 /0N', N'105522SSWLENB09110N', N'PAL', N'KG')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (3, N'00034-0571', N'571', N'PAL', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (4, N'00034-BIOXIDO DE TITANIO', N'BIOXIDODETITANIO', N'PAL', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (5, N'00051-124396', N'ELOTE CHI 40P 22.4OZ/640G', N'CAJ', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (6, N'00051-124402', N'PALERINDA 40P 22.4OZ/640G', N'CAJ', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (7, N'00051-124409', N'PICATAM 100P 21.2OZ/600G 8', N'CAJ', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (8, N'00148-DL 22244i', N'DL22244i', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (9, N'01425-23OX', N'BERMOCOLLE23OX', N'BUL', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (10, N'01425-ERA100', N'ELOTEXERA100', N'BUL', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (11, N'01425-FL2280', N'ELOTEXFL2280', N'BUL', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (12, N'01425-FX2322', N'ELOTEXFX2322', N'BUL', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (13, N'01425-FX5600 ELOTEX', N'(ELOTEX FX5600)', N'BUL', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (14, N'01641-205/45ZR17YMPS4N', N'205/45ZR17YMPS4N', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (15, N'01641-215/60R16VPPS880I', N'21560R16VPPS880I', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (16, N'01641-CORR20HNM', N'CORR20HNM', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (17, N'01922-185/70R13TPPS870I', N'18570R13TPPS870I', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (18, N'01922-185/70R14HPMPS21I', N'18570R14HPMPS21I', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (19, N'01922-215/55R17WCF710I', N'21555R17WCF710I', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (20, N'01922-275/45ZR20VRR06I', N'27545ZR20VRR06I', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (21, N'01922-P235/70R16TPVALHTI ', N'P23570R16TPVALHTI ', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (22, N'01922-P235/70R16TPVATI ', N'P23570R16TPVATI ', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (23, N'01922-P235/75R15TPVATI ', N'P23575R15TPVATI ', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (24, N'01922-P245/65R17TPVALATI ', N'P24565R17TPVALATI ', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (25, N'01922-P245/75R16TPVATI ', N'P24575R16TPVATI ', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (26, N'01922-P255/70R16TPVALATI ', N'P25570R16TPVALATI ', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (27, N'01922-P265/70R16TPVATI', N'P26570R16TPVATI', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (28, N'01922-P265/70R17TPVALATI ', N'P24570R16TPVATI', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (29, N'01922-P265/70R17TPVHTI ', N'P26570R17TPVHTI ', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (30, N'01922-P265/70R18SPVATI ', N'P26570R18SPVATI ', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (31, N'01922-P265/75R16TPVALATI ', N'P26575R16TPVALATI ', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (32, N'01922-P275/55R20TPVALATI ', N'P27555R20TPVALATI ', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (33, N'01922-P275/60R20TPVATI ', N'P27560R20TPVATI ', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (34, N'01922-P275/65R18TPVALATI ', N'P27565R18TPVALATI ', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (35, N'02300-GSW-UVC', N'GSWUVC', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (36, N'02300-NAUTILUS 20', N'NAUTILUS20', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (37, N'02699-BC0706', N'BC0706', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (38, N'02699-EA0178', N'EA0178', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (39, N'02699-EA0392', N'EA0392', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (40, N'02699-GB0613', N'GB0613', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (41, N'02699-HA0192', N'HA0192', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (42, N'02699-HC0788', N'HC0788', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (43, N'02746-899-09/MULTICOLOR', N'02746-899-09/MULTICOLOR', N'CAJ', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (44, N'02902-20008081', N'20008081', N'KGS', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (45, N'02902-220000971', N'220000971', N'KGS', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (46, N'02902-220000973', N'220000973', N'KGS', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (47, N'02902-220000979', N'220000979', N'KGS', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (48, N'02902-8000007232', N'8000007232', N'KGS', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (49, N'02902-817Y0A11', N'817Y0A11', N'BUL', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (50, N'029728-99911-11', N'9991111', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (51, N'03113-207129', N'03113-207129', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (52, N'03113-213341', N'213341', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (53, N'03113-228776', N'228776', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (54, N'03223-ALBCSE-220-AD', N'ALBCSE220AD', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (55, N'03223-Bobina50vatios', N'Bobina50vatios', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (56, N'03223-BOTE DE BASURA', N'BOTEDEBASURA', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (57, N'03223-C12561', N'C12561', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (58, N'03223-CATALOGOS', N'CATALOGOS', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (59, N'03223-M3L15WR', N'M3L15WR', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (60, N'03223-P175 REJILLAS', N'P175REJILLAS', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (61, N'03223-PLoteTest', N'PLoteTest', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (62, N'03223-STL60', N'STL60', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (63, N'03241-RLFBTC-013-220050', N'RLFBTC013220050', N'BUL', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (64, N'03241-RLFMTC-PRM- 205050', N'RLFMTCPRM205050', N'BUL', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (65, N'03289-EXTRACTO MALTA POLVO BAN', N'EXTRACTOMALTAPOLVOBANDA', N'BUL', N'KG')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (66, N'03289-PATAGONIA MALTA PILSEN', N'PATAGONIAMALTAPILSEN', N'BUL', N'KG')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (67, N'03370-416311', N'JUMEX TETRABRIK 1890 ML 4 PACK', N'CAJ', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (68, N'03370-510902', N'MINIJUMEX 24/200ML. NECTAR MAN', N'CAJ', N'PALL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (69, N'03370-511902', N'Jumex Mini 8X3 Pack 200ml Nect', N'CAJ', N'PALL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (70, N'03370-513406', N'JUMEX COMBI 8/1892 ML NECTAR G', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (71, N'03370-516311', N'GREAT VALUE 12/1000 ML PINEAPP', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (72, N'03370-519103', N'JUMEX MINIBRIK 44/125 ML MANGO', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (73, N'03370-520611', N'Jumex TB 12/1000ml Prisma Nect', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (74, N'03370-520653', N'Jumex TB 12/1000ml Prisma Nec', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (75, N'03370-521311', N'Jumex Prisma 12/1000ml Piña I/', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (76, N'03370-521323', N'Jumex Prisma 12/1000ml Fresa-P', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (77, N'03370-525702', N'Mini Kerns 8X3 Pack/200ml Nec', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (78, N'03370-525801', N'MINIKERNS 24/200ML NECTAR PEAR', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (79, N'03370-525811', N'MINIKERNS 24/200ML NECTAR PINE', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (80, N'03370-526219', N'Jumex Prisma 12/1000ml Fresa A', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (81, N'03370-526223', N'Jumex Prisma 12/1000ml Fresa P', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (82, N'03370-530602', N'Jmx 12/1000ml Prisma Manzana H', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (83, N'03370-60017588', N'60017588', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (84, N'09545-22276', N'BALLANTINESF750BALF37512PQ40AV', N'PAQ', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (85, N'09545-27723', N'CAMPOVIEJOART67502013V2135AV', N'BOTE', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (86, N'09545-28100', N'INSTESTPASS1LBAL2001', N'PZA', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (87, N'09545-28656', N'BARRAFRONTALGLENLIVET2018', N'PZA', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (88, N'09545-47170', N'ESTABSOLUTRASPBERRY2020', N'PZA', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (89, N'09545-49312', N'MUMMGRANDC7502COPIMP6PQ12AV', N'PAQ', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (90, N'09545-49460', N'HAVANA TRIBUTO3 700GE 2020 IMP', N'BOTE', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (91, N'09545-61087', N'INST/EST2 PASS7002BT+3PASS200', N'PZA', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (92, N'09545-61261', N'SEPESTHAVSEL7002VDELUXE', N'PZA', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (93, N'09545-62116', N'STICMUMMSSA203301201A0687', N'PZA', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (94, N'09545-62185', N'ALFOMBRACHICAROSA2020', N'PZA', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (95, N'09545-62248', N'CJ BALLANT SLEEVE 12 700', N'PZA', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (96, N'09545-62497', N'CHIVAS12Y6175LGEIMP40AV', N'BOTE', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (97, N'09545-62938', N'COPA BF BLACKBERRY MINI 202', N'PZA', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (98, N'09545-MX004550', N'PERNOD200AÑOS6*700', N'BOTE', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (99, N'09545-MX005638', N'ABSOLUTBLU12*750', N'BOTE', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (100, N'09728-09728-72571-BV', N'0972872571BV', N'PZA', N'CAJ')
GO
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (101, N'09728-09728-73147-XX: 73147-TT', N'0972873147XX73147TT', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (102, N'09728-09728-77524-BL', N'0972877524BL', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (103, N'09728-1377958-4A-BL', N'COMPONENTS GRIFERIA LAVABO', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (104, N'09728-13939000', N'13939000', N'', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (105, N'09728-24271', N'24271', N'PZA', N'PZA')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (106, N'09728-24787', N'24787', N'PZA', N'PZA')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (107, N'09728-25547', N'25547', N'PZA', N'PZA')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (108, N'09728-25714', N'25714', N'PZA', N'PZA')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (109, N'09728-25848', N'25848', N'PZA', N'PZA')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (110, N'09728-25851', N'25851', N'PZA', N'PZA')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (111, N'09728-2605000', N'2605000', N'PZA', N'PZA')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (112, N'09728-26530-BV', N'26530BV', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (113, N'09728-27381000', N'27381000', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (114, N'09728-36416000', N'36416000', N'PZA', N'PZA')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (115, N'09728-37345M-CP', N'37345MCP', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (116, N'09728-393537-GL', N'393537GL', N'PZA', N'PZA')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (117, N'09728-42835990', N'42835990', N'PZA', N'PZA')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (118, N'09728-47912310', N'47912310', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (119, N'09728-5415-A-BL', N'5415ABL', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (120, N'09728-5443-55-CP', N'69550CP', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (121, N'09728-57085-RB', N'57085RB', N'', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (122, N'09728-5865021', N'5865021', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (123, N'09728-693535-GL', N'693535GL', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (124, N'09728-70.7003.23', N'LAVABO RECTANGULAR DE SOBREPON', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (125, N'09728-71554000', N'71554000', N'PZA', N'PZA')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (126, N'09728-7173400', N'7173400', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (127, N'09728-73176-4-CP', N'731764CP', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (128, N'09728-80160.D', N'80160D', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (129, N'09728-88.200.01', N'8820001', N'PZA', N'PZA')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (130, N'09728-965-AK-BGD', N'2.5 GPM SINGLE-FUNCTION WALL-M', N'PZA', N'PZA')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (131, N'09728-9880000', N'9880000', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (132, N'09728-9916-11', N'TOALLERO DE BARRA NEGRO', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (133, N'09728-DESARME FUZ7260CCR5IWW', N'DESARMEFUZ7260CCR5IWW', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (134, N'09728-DS 2157011014', N'DS2157011014', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (135, N'09728-EXHIB P-PISO NEGRO GDE', N'EXHIBPPISONEGROGDE', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (136, N'09728-EXHIBIDOR PARA PISO BLAN', N'EXHIBIDORPARAPISOBLANCO', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (137, N'09728-F-23172-1', N'F231721', N'PZA', N'PZA')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (138, N'09728-H-201-EB', N'H201EB', N'PZA', N'PZA')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (139, N'09728-HERA BIANCO', N'HERA BIANCO', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (140, N'09728-HX5875-GL.', N'HX5875GL', N'PZA', N'PZA')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (141, N'09728-KWCADA8509', N'KWCADA8509', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (142, N'09728-MX26403625-0028', N'REGADERA DE MANO. INCLUYE CODO', N'PZA', N'PZA')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (143, N'09728-POGG10', N'POGG10', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (144, N'09728-QUARESTONE GREY 60X120', N'QUARESTONEGREY60X120', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (145, N'09728-RL94EP', N'RL94EP', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (146, N'09728-SH5000-CZ', N'HYDRACHOICE BODY SPRAY HEAD', N'', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (147, N'09728-SH5003-BL', N'SH5003BL', N'PZA', N'PZA')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (148, N'09728-T4759-CZFL', N'CONTEMPORARY FLOOR-MOUNT TUB F', N'PZA', N'PZA')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (149, N'09728-TARIMA', N'TARIMA', N'PZA', N'PZA')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (150, N'09728-TRGP.80160.S', N'TRGP80160S', N'PZA', N'PZA')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (151, N'09728-TVC00000600061', N'TVC00000600061', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (152, N'09749-102935', N'DRAMIX® 3D 80/30BGP (P60X20KG)', N'BUL', N'KG')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (153, N'09749-221608-BP-DRAMIX ® 3D 80', N'221608BPDRAMIX®3D8060BG', N'PAL', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (154, N'09749-697262', N'LENB/2183 /1,200mm/3600/FB800', N'PAL', N'KG')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (155, N'100', N'FRIJOL AZUFRADO HIGU', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (156, N'103', N'FRIJOL AZUFRADO NACI', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (157, N'105', N'Sin Nombre', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (158, N'106', N'FRIJOL NAL. BAYO QUE', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (159, N'107', N'FRIJOL CANARIO', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (160, N'108', N'FRIJOL FLOR DE JULIO', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (161, N'109', N'FRIJOL FLOR DE JUNIO', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (162, N'110', N'FRIJOL FLOR DE MAYO', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (163, N'112', N'FRIJOL HIGUERA NACIO', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (164, N'113', N'FRIJOL JAPONES', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (165, N'117', N'FRIJOL NAL.MEDIA ORE', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (166, N'118', N'FRIJOL NEGRO AMERICA', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (167, N'120', N'FRIJOL NEGRO IMPORTA', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (168, N'121', N'FRIJOL NEGRO JAMAPA', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (169, N'122', N'FRIJOL NEGRO MICHIGA', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (170, N'124', N'FRIJOL NEGRO QUERETA', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (171, N'12473-URUCD0318AS0100N', N'URUCD0318AS0100N', N'CAJ', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (172, N'125', N'FRIJOL NEGRO SAN LUI', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (173, N'12544-67604115', N'67604115', N'PZA', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (174, N'126', N'FRIJOL NEGRO ZACATEC', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (175, N'127', N'FRIJOL PERUANO', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (176, N'128', N'FRIJOL PERUANO BOLA', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (177, N'129', N'FRIJOL PINTO IMPORTA', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (178, N'131', N'FRIJOL PINTO NACIONA', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (179, N'132', N'FRIJOL PINTO SALTILL', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (180, N'133', N'FRIJOL PINTO VILLA', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (181, N'135', N'FRIJOL ROSA DE CASTI', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (182, N'136', N'FRIJOL ROSA IMPORTAD', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (183, N'138', N'FRIJOL SOYA IMPORTAD', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (184, N'140', N'FRIJOL VACA CAFE', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (185, N'141', N'GARBANZO NACIONAL', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (186, N'145', N'LENTEJA', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (187, N'146', N'MAIZ AMARILLO IMPORT', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (188, N'147', N'MAIZ AMARILLO NACION', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (189, N'148', N'MAIZ AMARILLO QUEBRA', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (190, N'150', N'MAIZ BLANCO IMPORTAD', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (191, N'151', N'MAIZ BLANCO NACIONAL', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (192, N'152', N'MAIZ PALOMERO', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (193, N'153', N'MAIZ WAXY', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (194, N'154', N'MIJO ROJO', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (195, N'156', N'SEMILLA DE CANOLA', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (196, N'158', N'SEMILLA DE GIRASOL', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (197, N'15859', N'218-012 LECHE DESC T', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (198, N'162', N'SORGO NACIONAL', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (199, N'163', N'TRIGO IMPORTADO', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (200, N'16725', N'SORGO BLANCO', N'TON', N'')
GO
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (201, N'16727', N'736852200LECHECARNAT', N'PZA', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (202, N'17803', N'745063000 NESTLELECH', N'PZA', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (203, N'19247', N'GARBANZO', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (204, N'19291', N'FRIJOL FLOR DE JUNIO', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (205, N'19293', N'AVENA', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (206, N'19722', N'MAIZ BLANCO IMPORTAD', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (207, N'19723', N'MAIZ BLANCO IMPORTAD', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (208, N'19734', N'MAIZ AMARILLO IMPORT', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (209, N'20297', N'LINAZA', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (210, N'20436', N'(277-072)LDENTERAFOR', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (211, N'21', N'AZUCAR ESTANDAR EMIL', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (212, N'21015', N'HARINA DE MAIZ', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (213, N'2119', N'FRIJOL PERUANO HIGUE', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (214, N'2151', N'FRIJOL AZUFRADO', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (215, N'2152', N'FRIJOL HIGUERA', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (216, N'2157', N'ARROZ', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (217, N'2158', N'ALPISTE', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (218, N'2169', N'FERTILIZANTE CLORURO', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (219, N'2170', N'FERTILIZANTE FOSFATO', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (220, N'2189', N'SORGO ROJO NACIONAL', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (221, N'2190', N'AZUCAR REFINADA', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (222, N'2191', N'SORGO', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (223, N'2192', N'MAIZ AMARILLO', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (224, N'2193', N'FRIJOL ALUBIA', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (225, N'2194', N'FRIJOL PINTO BILL Z', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (226, N'2195', N'MAIZ POZOLERO', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (227, N'2201', N'292-092 LECHE ENT FO', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (228, N'2202', N'(270-132) LECHE ENT', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (229, N'2205', N'290-092 LECHE ENT FO', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (230, N'2208', N'(277-130) LECHE ENT', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (231, N'2211', N'(278-130) LECHE ENT.', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (232, N'2213', N'FRIJOL AZUFRADO REGI', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (233, N'22691', N'AJONJOLI', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (234, N'22846', N'LENTEJA IMPORTADA', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (235, N'2459', N'FRIJOL NEGRO SAN LUI', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (236, N'2466', N'FERTILIZANTE FOSFONI', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (237, N'2484', N'FRIJOL PINTO VILLA', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (238, N'2489', N'FRIJOL NAL. CANARIO', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (239, N'2490', N'FRIJOL BAYO BLANCO', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (240, N'2513', N'FRIJOL NAL. FLOR DE', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (241, N'2514', N'FRIJOL MEDIA OREJA', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (242, N'2518', N'FRIJOL NAL. FLOR DE', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (243, N'2529', N'MIJO BLANCO', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (244, N'2537', N'UREA PRILADA IMPORTA', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (245, N'25412', N'CLIPS', N'CAJ', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (246, N'2543', N'PASTA DE SOYA', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (247, N'2561', N'LECHE ENTERA', N'KGS', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (248, N'2565', N'TRIGO', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (249, N'25882', N'PANELES DE ALUMINIO', N'PZA', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (250, N'2596', N'FRIJOL BAYO QUERETAR', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (251, N'2599', N'FERTILIZANTE UREA PR', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (252, N'26150', N'TEQUILA EXTRA AÑEJO', N'LTR', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (253, N'2687', N'MAIZ BLANCO NACIONAL', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (254, N'2688', N'MAIZ BLANCO NACIONAL', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (255, N'27857', N'ALPISTE', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (256, N'28046', N'TEQUILA BLANCO %', N'LTR', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (257, N'2808', N'GRANZA DE MAIZ BLANC', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (258, N'28245', N'FRIJOL NEGRO AMERICA', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (259, N'2837', N'(297-090) LECHE ENTE', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (260, N'2965', N'TEQUILA BLANCO 100 %', N'LTR', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (261, N'2994', N'CACAHUATE CON CASCAR', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (262, N'3', N'ALBERJON', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (263, N'3008', N'SISTEMAS DE ENERGIA', N'CAJ', N'PZA')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (264, N'3022', N'AZUCAR ESTANDAR CALI', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (265, N'30833', N'ROLLOS DE 300 MTS', N'RLL', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (266, N'31', N'AZUCAR ESTANDAR MARG', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (267, N'312', N'BOBINA DE CABLE', N'RLL', N'PZA')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (268, N'3177', N'AZUCAR ESTANDAR MELC', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (269, N'3216', N'AZUCAR ESTANDAR', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (270, N'3217', N'AZUCAR REFINADA', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (271, N'3227', N'298-090 LECHE ENTERA', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (272, N'3304', N'FERTILIZANTE SULFATO', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (273, N'33676', N'SEMILLA  DE  GIRASOL', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (274, N'34091', N'LLANTAS215/75R14KR06', N'PZA', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (275, N'34132', N'CAMARON TALLA 21-25', N'TON', N'CAJ')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (276, N'35', N'AZUCAR ESTANDAR PLAN', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (277, N'35145', N'DISCO COMPACTO GRAVA', N'CAJ', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (278, N'35704', N'ROLLOS DE PAPEL PERI', N'KG', N'RLL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (279, N'36', N'AZUCAR ESTANDAR PLAN', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (280, N'36869', N'FRIJOL BAYO BARRENDO', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (281, N'37339', N'FRIJOL CLARO MAYOCOB', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (282, N'39', N'AZUCAR ESTANDAR PROV', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (283, N'39308', N'ALBERJON', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (284, N'39983', N'CAJAS CON ESTUCHES P', N'CAJ', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (285, N'4', N'ARROZ IMPORTADO', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (286, N'4095', N'MAIZ NACIONAL', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (287, N'4096', N'AZUCAR REF. COLOMBIA', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (288, N'43946', N'NUEZ CON CASCARA', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (289, N'46729', N'NABO', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (290, N'47373', N'CHICHARO', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (291, N'48501', N'NUEZ PECANA', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (292, N'49414', N'ROLLOS DE PAPEL PERI', N'KG', N'RLL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (293, N'49416', N'ROLLOS DE PAPEL PERI', N'KG', N'RLL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (294, N'49748', N'ROLLOS DE PAPEL PERI', N'KGS', N'RLL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (295, N'51776', N'RON', N'LTR', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (296, N'51777', N'MEZCAL BLANCO', N'LTR', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (297, N'51778', N'TEQUILA EXTRA AÑEJO', N'LTR', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (298, N'51779', N'TEQUILA AÑEJO', N'LTR', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (299, N'51780', N'TEQUILA BLANCO', N'LTR', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (300, N'52569', N'ROLLOS DE PAPEL PERI', N'KGS', N'RLL')
GO
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (301, N'5446', N'AZUCAR REFINADA IMPO', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (302, N'54649', N'PAPEL PRENSA 63.5 CM', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (303, N'54752', N'FIBRA GB', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (304, N'54753', N'FIBRA OT', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (305, N'54754', N'ESPACIADOR', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (306, N'54755', N'CLIPS ( CLIPS DE PLA', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (307, N'54756', N'MUESTRAS ( PRODUCTOS', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (308, N'54757', N'TUBOS PARA DRENAJE', N'PZA', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (309, N'54796', N'PAPEL PRENSA 152 CM', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (310, N'54988', N'TEQUILA BLANCO 100%', N'LTR', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (311, N'55569', N'NUEZ PECANA CON CASC', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (312, N'5557', N'736852100 LECHE CARN', N'PZA', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (313, N'55823', N'JUGUETE  ( HELICOPTE', N'CAJ', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (314, N'55825', N'JUGUETE  ( AUTOS )', N'CAJ', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (315, N'55826', N'ARBOLES ARTIFICIALES', N'CAJ', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (316, N'55940', N'ROLLOS DE PAPEL PERI', N'KGS', N'RLL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (317, N'56096', N'PASTA DE GERMEN', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (318, N'56310', N'AZUCAR BLANCA POPULA', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (319, N'56311', N'AZUCAR ESTANDAR', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (320, N'56329', N'AZUCAR REFINADA', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (321, N'56364', N'AZUCAR REFINADA   (B', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (322, N'56365', N'AZUCAR REFINADA NORM', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (323, N'56368', N'AZUCAR ESTANDAR  (BA', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (324, N'56383', N'ROLLOS DE PAPEL PERI', N'KGS', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (325, N'56402', N'NITRATO DE CALCIO', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (326, N'56404', N'AZUCAR ESTANDAR PNC', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (327, N'56405', N'AZUCAR ESTANDAR PNC', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (328, N'56407', N'AZUCAR REFINADA PNC', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (329, N'56408', N'AZUCAR REFINADA PNC', N'TON', N'BUL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (330, N'56453', N'MAQUINARIA Y EQUIPO', N'PZA', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (331, N'56566', N'PAPEL PRENSA 95.3 CM', N'TON', N'RLL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (332, N'56576', N'PAPEL PRENSA 38.0 CM', N'TON', N'RLL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (333, N'56577', N'PAPEL PRENSA 76.0 CM', N'TON', N'RLL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (334, N'56578', N'PAPEL PRENSA 82.0 CM', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (335, N'56615', N'ROLLOS DE PAPEL PERI', N'KGS', N'RLL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (336, N'56616', N'ROLLOS DE PAPEL PERI', N'KGS', N'RLL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (337, N'56617', N'ROLLOS DE PAPEL PERI', N'KGS', N'RLL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (338, N'56629', N'PAPEL PRENSA 71.0 CM', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (339, N'56754', N'CASCARILLA DE MAIZ', N'TON', N'PAL')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (340, N'56824', N'NITRATO DE AMONIO CA', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (341, N'6024', N'732805101 SANTA CLAR', N'PZA', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (342, N'6069', N'732804101 SANTA CLAR', N'PZA', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (343, N'6203', N'AZUCAR RFINADA SAN C', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (344, N'626', N'DDG GRANO SECO DE DE', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (345, N'6438', N'277-132 LECHE ENTERA', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (346, N'6439', N'272-132 LECHE ENTERA', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (347, N'6691', N'AZUCAR BLANCO P. NIC', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (348, N'6896', N'222-102 LECHE DESCRE', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (349, N'73', N'AZUCAR REFINADA EMIL', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (350, N'84', N'AZUCAR REFINADA PUGA', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (351, N'8434', N'297-092 LECHE ENTERA', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (352, N'9036', N'MAIZ PALOMERO', N'PAL', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (353, N'91', N'AZUCAR REFINADA SANT', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (354, N'93', N'AZUCAR REFINADA TAMA', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (355, N'9414', N'210- 012 LECHE DESC', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (356, N'96', N'COSTALERA DE POLIPRO', N'PZA', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (357, N'97', N'FERTILIZANTE', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (358, N'9760', N'FRIJOL NACIONAL', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (359, N'99185', N'SEMILLA DE ACHIOTE', N'TON', N'')
INSERT [dbo].[Products] ([Id], [ItemId], [Name], [Unit], [SecondaryUnit]) VALUES (360, N'99189', N'SEMILLA DE FRIJOL PARA SIEMBRA', N'TON', N'BUL')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Key], [Name], [Description], [StatusId]) VALUES (1, N'SeguridadPatrimonial', N'Seguridad Patrimonial', N'El que registra si llegaron a la citas o no, pide folio de confirmacion, si no llegan a tiempo se bloquean las citas.', 1)
INSERT [dbo].[Roles] ([Id], [Key], [Name], [Description], [StatusId]) VALUES (2, N'Planeador', N'Planeador', N'El que tiene control total de las citas', 1)
INSERT [dbo].[Roles] ([Id], [Key], [Name], [Description], [StatusId]) VALUES (3, N'Juridico', N'Juridico', N'El que se encarga de revisar la documentacion de los choferes y las lineas transportistas.', 1)
INSERT [dbo].[Roles] ([Id], [Key], [Name], [Description], [StatusId]) VALUES (4, N'Cliente', N'Cliente', N'Puede agregar datos de sus catalogos y puede generar sus citas, puede cancelar sus citas.', 1)
INSERT [dbo].[Roles] ([Id], [Key], [Name], [Description], [StatusId]) VALUES (5, N'Admin', N'Administrador', N'Puede hacer todo.', 1)
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
INSERT [dbo].[RolesPermissions] ([RolId], [ModuleId]) VALUES (1, 1)
INSERT [dbo].[RolesPermissions] ([RolId], [ModuleId]) VALUES (5, 1)
INSERT [dbo].[RolesPermissions] ([RolId], [ModuleId]) VALUES (5, 5)
INSERT [dbo].[RolesPermissions] ([RolId], [ModuleId]) VALUES (5, 6)
INSERT [dbo].[RolesPermissions] ([RolId], [ModuleId]) VALUES (5, 7)
INSERT [dbo].[RolesPermissions] ([RolId], [ModuleId]) VALUES (5, 8)
INSERT [dbo].[RolesPermissions] ([RolId], [ModuleId]) VALUES (5, 9)
INSERT [dbo].[RolesPermissions] ([RolId], [ModuleId]) VALUES (3, 9)
INSERT [dbo].[RolesPermissions] ([RolId], [ModuleId]) VALUES (4, 1)
INSERT [dbo].[RolesPermissions] ([RolId], [ModuleId]) VALUES (4, 6)
INSERT [dbo].[RolesPermissions] ([RolId], [ModuleId]) VALUES (4, 7)
INSERT [dbo].[RolesPermissions] ([RolId], [ModuleId]) VALUES (4, 8)
INSERT [dbo].[RolesPermissions] ([RolId], [ModuleId]) VALUES (2, 1)
GO
SET IDENTITY_INSERT [dbo].[Schedule] ON 

INSERT [dbo].[Schedule] ([Id], [StartTime], [EndTime]) VALUES (1, CAST(N'01:00:00' AS Time), CAST(N'08:00:00' AS Time))
INSERT [dbo].[Schedule] ([Id], [StartTime], [EndTime]) VALUES (2, CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Schedule] ([Id], [StartTime], [EndTime]) VALUES (3, CAST(N'12:00:00' AS Time), CAST(N'16:00:00' AS Time))
INSERT [dbo].[Schedule] ([Id], [StartTime], [EndTime]) VALUES (4, CAST(N'16:00:00' AS Time), CAST(N'20:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Schedule] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [Key], [Name]) VALUES (1, N'Active', N'Activo')
INSERT [dbo].[Status] ([Id], [Key], [Name]) VALUES (2, N'Inactive', N'Inactivo')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[TransportLineType] ON 

INSERT [dbo].[TransportLineType] ([Id], [Type]) VALUES (1, N'Propia')
INSERT [dbo].[TransportLineType] ([Id], [Type]) VALUES (2, N'Rentada')
SET IDENTITY_INSERT [dbo].[TransportLineType] OFF
GO
SET IDENTITY_INSERT [dbo].[TransportType] ON 

INSERT [dbo].[TransportType] ([Id], [Type]) VALUES (1, N'Torton')
INSERT [dbo].[TransportType] ([Id], [Type]) VALUES (2, N'Trailer')
INSERT [dbo].[TransportType] ([Id], [Type]) VALUES (3, N'Flatbed')
INSERT [dbo].[TransportType] ([Id], [Type]) VALUES (4, N'Box Truck')
INSERT [dbo].[TransportType] ([Id], [Type]) VALUES (5, N'Full Truckload')
SET IDENTITY_INSERT [dbo].[TransportType] OFF
GO
ALTER TABLE [dbo].[Dates] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[DocumentFiles] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  StoredProcedure [dbo].[SpAddOrUpdateDates]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpAddOrUpdateDates]
    @DateId int,
    @UserId int,
    @SheduleTimeId int,
    @OperationTypeId int,
    @ProductId int,
    @TransportLineId int,
    @TransportId int,
    @TransportPlate varchar(50),
    @TransportPlate2 varchar(50),
    @TransportPlate3 varchar(50),
    @DriverId int,
    @Volume int,
    @Success BIT OUTPUT,
    @Message VARCHAR(100) OUTPUT
AS BEGIN
    SET NOCOUNT ON;
	DECLARE @AccountNum INT, @TransportTypeId INT;
	SET @AccountNum = (SELECT AccountNum FROM Users WHERE Id = @UserId)

    -- HAZ VALIDACIONES POR CADA DATO QUE RECIBES
    IF @UserId IS NULL OR @UserId = 0
    BEGIN
        SET @Success = 0
        SET @Message = 'Hubo un error al procesar la cita'
        RETURN
    END

    IF @SheduleTimeId IS NULL OR @SheduleTimeId = 0
    BEGIN
        SET @Success = 0
        SET @Message = 'Es necesario asignar un horario'
        RETURN
    END

    IF @OperationTypeId IS NULL OR @OperationTypeId = 0
    BEGIN
        SET @Success = 0
        SET @Message = 'Es necesario asignar un tipo de operación'
        RETURN
    END

    IF @ProductId IS NULL OR @ProductId = 0
    BEGIN
        SET @Success = 0
        SET @Message = 'Es necesario asignar un producto'
        RETURN
    END

    IF @TransportLineId IS NULL OR @TransportLineId = 0
    BEGIN
        SET @Success = 0
        SET @Message = 'Es necesario asignar una línea de transporte'
        RETURN
    END

    IF @TransportId IS NULL OR @TransportId = 0
    BEGIN
        SET @Success = 0
        SET @Message = 'Es necesario asignar un transporte'
        RETURN
    END

	SET @TransportTypeId = (SELECT TransportTypeId FROM Transports WHERE Id = @TransportId)

	IF (LEN(LTRIM(RTRIM(@TransportPlate))) = 0)
	BEGIN
		SET @Success = 0
		SET @Message = 'Falta especificar la placa del transporte.'
		RETURN
	END

	IF ((@TransportTypeId = 2 AND LEN(LTRIM(RTRIM(@TransportPlate2))) = 0) 
		OR (@TransportTypeId = 5 AND LEN(LTRIM(RTRIM(@TransportPlate2))) = 0))
	BEGIN
		SET @Success = 0
		SET @Message = 'Falta especificar la placa de la caja 1.'
		RETURN
	END
		
	IF (@TransportTypeId = 5 AND LEN(LTRIM(RTRIM(@TransportPlate3))) = 0 )
	BEGIN
		SET @Success = 0
		SET @Message = 'Falta especificar la placa de la caja 2.'
		RETURN
	END

    IF @DriverId IS NULL OR @DriverId = 0
    BEGIN
        SET @Success = 0
        SET @Message = 'Es necesario asignar un conductor'
        RETURN
    END

    IF @Volume IS NULL OR @Volume = 0
    BEGIN
        SET @Success = 0
        SET @Message = 'Es necesario asignar un volumen'
        RETURN
    END

    -- SI TODO ESTA BIEN, INSERTA LOS DATOS EN LA TABLA DATES
    IF @DateId IS NULL OR @DateId = 0
    BEGIN
        INSERT INTO [dbo].[Dates]
            ([UserId]
			,[AccountNum]
            ,[ScheduleTimeId]
            ,[OperationId]
            ,[ProductId]
            ,[TransportLineId]
            ,[TransportId]
            ,[TransportPlate1]
            ,[TransportPlate2]
            ,[TransportPlate3]
            ,[DriverId]
            ,[Volume])
        VALUES
            (@UserId
			,@AccountNum
            ,@SheduleTimeId
            ,@OperationTypeId
            ,@ProductId
            ,@TransportLineId
            ,@TransportId
            ,@TransportPlate
            ,@TransportPlate2
            ,@TransportPlate3
            ,@DriverId
            ,@Volume)

        SET @Success = 1
        SET @Message = 'Cita creada correctamente'
        RETURN
    END ELSE BEGIN
        -- ACTUALIZA LOS DATOS EN LA TABLA DATES
        UPDATE [dbo].[Dates]
        SET [UserId] = @UserId
			,[AccountNum] = @AccountNum
            ,[ScheduleTimeId] = @SheduleTimeId
            ,[OperationId] = @OperationTypeId
            ,[ProductId] = @ProductId
            ,[TransportLineId] = @TransportLineId
            ,[TransportId] = @TransportId
            ,[TransportPlate1] = @TransportPlate
            ,[TransportPlate2] = @TransportPlate2
            ,[TransportPlate3] = @TransportPlate3
            ,[DriverId] = @DriverId
            ,[Volume] = @Volume
        WHERE Id = @DateId
        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[SpAddOrUpdateDriver]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpAddOrUpdateDriver]
@UserId INT,
@TemporalDocumentId INT,
@DriverId INT OUTPUT,
@FirstName VARCHAR(255),
@LastName VARCHAR(255),
@SecondLastName VARCHAR(255),
@PhoneNumber VARCHAR(20),
@Birthdate DATE,
@Success BIT OUTPUT,
@Message VARCHAR(100) OUTPUT
AS
BEGIN
	BEGIN TRY
		DECLARE @AccountNum VARCHAR(MAX),
		@StatusId INT = 1;

		IF @FirstName IS NULL OR @FirstName = ''
		BEGIN
			SET @Success = 0
			SET @Message = 'El nombre es un campo requerido.'
			RETURN
		END

		IF @LastName IS NULL OR @LastName = ''
		BEGIN
			SET @Success = 0
			SET @Message = 'El apellido es un campo requerido.'
			RETURN
		END

		IF @SecondLastName IS NULL OR @SecondLastName = ''
		BEGIN
			SET @Success = 0
			SET @Message = 'El apellido materno es un campo requerido.'
			RETURN
		END

		IF @PhoneNumber IS NULL OR @PhoneNumber = ''
		BEGIN
			SET @Success = 0
			SET @Message = 'El número telefónico es un campo requerido.'
			RETURN
		END

		SELECT @AccountNum = AccountNum FROM Users WHERE Id = @UserId

		IF @DriverId IS NULL OR @DriverId = 0
		BEGIN
		
			IF NOT EXISTS(SELECT 1 FROM DocumentFiles WHERE DocumentId = 3 AND TemporalDocumentId = @TemporalDocumentId)
			BEGIN
				SET @Success = 0
				SET @Message = 'Es necesario subir el documento de INE.'
				RETURN
			END
			
			IF NOT EXISTS(SELECT 1 FROM DocumentFiles WHERE DocumentId = 4 AND TemporalDocumentId = @TemporalDocumentId)
			BEGIN
				SET @Success = 0
				SET @Message = 'Es necesario subir el documento de Licencia.'
				RETURN
			END

			IF NOT EXISTS(SELECT 1 FROM DocumentFiles WHERE DocumentId = 6 AND TemporalDocumentId = @TemporalDocumentId)
			BEGIN
				SET @Success = 0
				SET @Message = 'Es necesario subir el documento de Comprobante de domicilio.'
				RETURN
			END

			-- Insertar un nuevo registro
			INSERT INTO Drivers (AccountNum, FirstName, LastName,SecondLastName, PhoneNumber, Birthdate, StatusId)
			VALUES (@AccountNum,@FirstName, @LastName,@SecondLastName, @PhoneNumber, @Birthdate, @StatusId)

			SET @DriverId = SCOPE_IDENTITY();
			UPDATE DocumentFiles SET ModuleId = @DriverId, TemporalDocumentId = NULL WHERE TemporalDocumentId = @TemporalDocumentId
			SET @TemporalDocumentId = 0;
			SET @Success = 1
			SET @Message = 'El registro ha sido insertado.'
			RETURN
		END
		ELSE
		BEGIN

			IF NOT EXISTS(SELECT 1 FROM DocumentFiles WHERE DocumentId = 3 AND ModuleId = @DriverId)
			BEGIN
				SET @Success = 0
				SET @Message = 'Es necesario subir el documento de INE.'
				RETURN
			END
			
			IF NOT EXISTS(SELECT 1 FROM DocumentFiles WHERE DocumentId = 4 AND ModuleId = @DriverId)
			BEGIN
				SET @Success = 0
				SET @Message = 'Es necesario subir el documento de Licencia.'
				RETURN
			END

			IF NOT EXISTS(SELECT 1 FROM DocumentFiles WHERE DocumentId = 6 AND ModuleId = @DriverId)
			BEGIN
				SET @Success = 0
				SET @Message = 'Es necesario subir el documento de Comprobante de domicilio.'
				RETURN
			END

			-- Actualizar el registro
			UPDATE Drivers
			SET FirstName = @FirstName,
				LastName = @LastName,
				SecondLastName = @SecondLastName,
				PhoneNumber = @PhoneNumber,
				Birthdate = @Birthdate,
				StatusId = @StatusId
			WHERE Id = @DriverId
			SET @Success = 1
			SET @Message = 'El registro ha sido actualizado.'
			RETURN
		END
	END TRY
	BEGIN CATCH
		SET @Success = 0
		SET @Message = 'Error: ' + ERROR_MESSAGE()
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SpAddOrUpdateDriverDocument]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpAddOrUpdateDriverDocument]
	@UserId INT,
	@TemporalDocumentId INT OUTPUT,
	@DocumentId INT,
	@ModuleId INT,
	@FieldName VARCHAR(255),
	@OriginalName VARCHAR(255),
	@Mimetype VARCHAR(255),
	@FileData VARBINARY(MAX),
	@Size INT,
	@Success BIT OUTPUT,
	@Message VARCHAR(MAX) OUTPUT
AS
BEGIN
	DECLARE @DocumentFileId INT 

	-- Initialize success and message output parameters
	SET @Success = 0
	SET @Message = ''

	IF @DocumentId IS NULL OR @DocumentId = 0
	BEGIN
		SET @Message = 'Es necesario asignar el tipo de documento.'
		SET @Success = 0
		RETURN
	END

	IF @ModuleId IS NULL OR @ModuleId = 0
	BEGIN
		-- Insert document file without module id
		INSERT INTO DocumentFiles (UserId, TemporalDocumentId, DocumentId, FieldName, OriginalName, Mimetype, FileData, Size)
		VALUES (@UserId, @TemporalDocumentId, @DocumentId, @FieldName, @OriginalName, @Mimetype, @FileData, @Size)
		SET @DocumentFileId = SCOPE_IDENTITY();

		IF @TemporalDocumentId IS NULL OR @TemporalDocumentId = 0
		BEGIN
			-- Create new temporal document for the document file
			INSERT INTO TemporalDocuments (DocumentFileId) VALUES (@DocumentFileId)
			SET @TemporalDocumentId = SCOPE_IDENTITY()

			-- Update the temporal document id of the document file
			UPDATE DocumentFiles SET TemporalDocumentId = @TemporalDocumentId WHERE Id = @DocumentFileId
		END
		
		DELETE DocumentFiles WHERE Id != @DocumentFileId AND UserId = @UserId AND TemporalDocumentId = @TemporalDocumentId  AND DocumentId = @DocumentId
		
		SET @Message = 'Se ha guardado el archivo correctamente'
		SET @Success = 1

		RETURN
	END 
	-- Insert document file with module id
	INSERT INTO DocumentFiles (UserId, ModuleId, DocumentId, FieldName, OriginalName, Mimetype, FileData, Size)
	VALUES (@UserId, @ModuleId, @DocumentId, @FieldName, @OriginalName, @Mimetype, @FileData, @Size)
	
	SET @DocumentFileId = SCOPE_IDENTITY();

	DELETE DocumentFiles WHERE Id != @DocumentFileId AND UserId = @UserId AND ModuleId = @ModuleId  AND DocumentId = @DocumentId

	-- Set success output parameter to true
	SET @Success = 1
	SET @Message = 'Se ha guardado el archivo correctamente'
	SET @TemporalDocumentId = 0;

	RETURN
END

GO
/****** Object:  StoredProcedure [dbo].[SpAddOrUpdateLineDocuments]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpAddOrUpdateLineDocuments]
	@UserId INT,
	@TemporalDocumentId INT OUTPUT,
	@DocumentId INT,
	@ModuleId INT,
	@FieldName VARCHAR(255),
	@OriginalName VARCHAR(255),
	@Mimetype VARCHAR(255),
	@FileData VARBINARY(MAX),
	@Size INT,
	@Success BIT OUTPUT,
	@Message VARCHAR(MAX) OUTPUT
AS
BEGIN
	DECLARE @DocumentFileId INT 

	-- Initialize success and message output parameters
	SET @Success = 0
	SET @Message = ''

	IF @DocumentId IS NULL OR @DocumentId = 0
	BEGIN
		SET @Message = 'Es necesario asignar el tipo de documento.'
		SET @Success = 0
		RETURN
	END

	IF @ModuleId IS NULL OR @ModuleId = 0
	BEGIN

		-- Insert document file without module id
		INSERT INTO DocumentFiles (UserId, TemporalDocumentId, DocumentId, FieldName, OriginalName, Mimetype, FileData, Size)
		VALUES (@UserId, @TemporalDocumentId, @DocumentId, @FieldName, @OriginalName, @Mimetype, @FileData, @Size)
		SET @DocumentFileId = SCOPE_IDENTITY();

		IF @TemporalDocumentId IS NULL OR @TemporalDocumentId = 0
		BEGIN
			-- Create new temporal document for the document file
			INSERT INTO TemporalDocuments (DocumentFileId) VALUES (@DocumentFileId)
			SET @TemporalDocumentId = SCOPE_IDENTITY()

			-- Update the temporal document id of the document file
			UPDATE DocumentFiles SET TemporalDocumentId = @TemporalDocumentId WHERE Id = @DocumentFileId
		END
		
		DELETE DocumentFiles WHERE Id != @DocumentFileId AND UserId = @UserId AND TemporalDocumentId = @TemporalDocumentId  AND DocumentId = @DocumentId
		
		SET @Message = 'Se ha guardado el archivo correctamente'
		SET @Success = 1

		RETURN
	END 
	-- Insert document file with module id
	INSERT INTO DocumentFiles (UserId, ModuleId, DocumentId, FieldName, OriginalName, Mimetype, FileData, Size)
	VALUES (@UserId, @ModuleId, @DocumentId, @FieldName, @OriginalName, @Mimetype, @FileData, @Size)

	SET @DocumentFileId = SCOPE_IDENTITY();

	DELETE DocumentFiles WHERE Id != @DocumentFileId AND UserId = @UserId AND ModuleId = @ModuleId  AND DocumentId = @DocumentId

	-- Set success output parameter to true
	SET @Success = 1
	SET @Message = 'Se ha guardado el archivo correctamente'
	SET @TemporalDocumentId = 0;

	RETURN
END

GO
/****** Object:  StoredProcedure [dbo].[SpAddOrUpdateTransport]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpAddOrUpdateTransport]
@TransportId INT,
@UserId INT,
@TransportTypeId INT,
@TransportPlate1 VARCHAR(10),
@TransportPlate2 VARCHAR(10),
@TransportPlate3 VARCHAR(10),
@Capacity INT,
@Success BIT OUTPUT,
@Message VARCHAR(MAX) OUTPUT
AS
BEGIN
	BEGIN TRY
	
		DECLARE @AccountNum INT,
				@StatusId INT = 1;

		IF (@TransportTypeId IS NULL OR @TransportTypeId = 0)
		BEGIN
			SET @Success = 0
			SET @Message = 'Falta especificar el tipo de transporte.'
			RETURN
		END

		IF (LEN(LTRIM(RTRIM(@TransportPlate1))) = 0)
		BEGIN
			SET @Success = 0
			SET @Message = 'Falta especificar la placa del transporte.'
			RETURN
		END

		IF ((@TransportTypeId = 2 AND LEN(LTRIM(RTRIM(@TransportPlate2))) = 0) 
			OR (@TransportTypeId = 5 AND LEN(LTRIM(RTRIM(@TransportPlate2))) = 0))
		BEGIN
			SET @Success = 0
			SET @Message = 'Falta especificar la placa de la caja 1.'
			RETURN
		END
		
		IF (@TransportTypeId = 5 AND LEN(LTRIM(RTRIM(@TransportPlate3))) = 0 )
		BEGIN
			SET @Success = 0
			SET @Message = 'Falta especificar la placa de la caja 2.'
			RETURN
		END

		SELECT @AccountNum = AccountNum FROM Users WHERE Id = @UserId

		IF @TransportId IS NULL OR @TransportId = 0
		BEGIN
			-- Insertar nuevo registro
			INSERT INTO Transports (
				AccountNum,
				TransportTypeId,
				TransportPlate1,
				TransportPlate2,
				TransportPlate3,
				Capacity,
				StatusId
			)
			VALUES (
				@AccountNum,
				@TransportTypeId,
				@TransportPlate1,
				@TransportPlate2,
				@TransportPlate3,
				@Capacity,
				@StatusId
			)
		SET @Message = 'Registro realizado con exito.'
		END
		ELSE
		BEGIN
			-- Actualizar registro existente
			UPDATE Transports
			SET
				--ClientId = @ClientId,
				TransportTypeId = @TransportTypeId,
				TransportPlate1 = @TransportPlate1,
				TransportPlate2 = @TransportPlate2,
				TransportPlate3 = @TransportPlate3,
				Capacity = @Capacity
				--StatusId = @StatusId
			WHERE Id = @TransportId
		SET @Message = 'Registro actualizado correctamente.'
		END

		SET @Success = 1
	END TRY
	BEGIN CATCH
		SET @Success = 0
		SET @Message = 'Error: ' + ERROR_MESSAGE()
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SpAddOrUpdateTransportLine]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpAddOrUpdateTransportLine]
@TransportLineId INT OUTPUT,
@TemporalDocumentId INT OUTPUT,
@UserId INT,
@Name VARCHAR(50),
@LineTypeId INT,
@Success BIT OUTPUT,
@Message VARCHAR(100) OUTPUT
AS
BEGIN
	BEGIN TRY
		DECLARE @AccountNum VARCHAR(MAX);
		SELECT @AccountNum = AccountNum FROM Users WHERE Id = @UserId

		IF @Name IS NULL OR @Name = ''
		BEGIN
			SET @Success = 0
			SET @Message = 'Es necesario asignar un nombre.'
			RETURN
		END

		IF @LineTypeId IS NULL OR @LineTypeId = 0
		BEGIN
			SET @Success = 0
			SET @Message = 'Es necesario asignar el tipo de linea.'
			RETURN
		END

		IF @TransportLineId IS NULL OR @TransportLineId = 0
		BEGIN

			IF NOT EXISTS(SELECT 1 FROM DocumentFiles WHERE DocumentId = 1 AND TemporalDocumentId = @TemporalDocumentId)
			BEGIN
				SET @Success = 0
				SET @Message = 'Es necesario subir el documento de Acta Constitutiva.'
				RETURN
			END

			-- Insertar un nuevo registro
			INSERT INTO TransportLines (AccountNum, Name, LineTypeId, StatusId)
			VALUES (@AccountNum, @Name, @LineTypeId, 1)

			SET @TransportLineId = SCOPE_IDENTITY();

			UPDATE DocumentFiles SET ModuleId = @TransportLineId, TemporalDocumentId = NULL WHERE TemporalDocumentId = @TemporalDocumentId
			SET @TemporalDocumentId = 0;

			SET @Success = 1
			SET @Message = 'Se inserto el registro.'
			RETURN
		END
		ELSE
		BEGIN

			IF NOT EXISTS(SELECT 1 FROM DocumentFiles WHERE DocumentId = 1 AND ModuleId = @TransportLineId)
			BEGIN
				SET @Success = 0
				SET @Message = 'Es necesario subir el documento de Acta Constitutiva.'
				RETURN
			END

			-- Actualizar el registro
			UPDATE TransportLines
			SET AccountNum = @AccountNum,
				Name = @Name,
				LineTypeId = @LineTypeId
			WHERE Id = @TransportLineId
			SET @Success = 1
			SET @Message = 'Se actualizo el registro.'
		RETURN
		END
	END TRY
	BEGIN CATCH
		SET @Success = 0
		SET @Message = 'Error: ' + ERROR_MESSAGE()
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SpAddOrUpdateUser]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpAddOrUpdateUser]
@AccountNum VARCHAR(50),
@name VARCHAR(50),
@mail VARCHAR(50),
@userName VARCHAR(50),
@userTypeId INT,
@password VARCHAR(50),
@success BIT OUTPUT,
@Id INT OUTPUT,
@PrivacyNotice INT OUTPUT,
@successMessage VARCHAR(100) OUTPUT,
@errorMessage VARCHAR(100) OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @RolId INT;
	IF @userTypeId = 1 
	BEGIN 
		SET @RolId = 1 
		SET @PrivacyNotice = 1
		SET @successMessage = 'Registro exitoso.';
	END
	ELSE IF  @userTypeId = 2 BEGIN
		SET @RolId = 4;
		SET @PrivacyNotice = 0;	
		SET @successMessage = 'Es necesario aceptar el aviso de privacidad.';
	END
	BEGIN TRY
		IF EXISTS(SELECT 1 FROM Users WHERE userName = @userName AND (password = @password OR LastPassword = @password))
		BEGIN
			UPDATE Users SET
			AccountNum = @AccountNum,
			name = @name,
			mail = @mail,
			userName = @userName,
			userTypeId = @userTypeId,
			password = @password,
			RolId = @RolId
			WHERE userName = @userName AND password = @password;
			
			SET @success = 1;
			SET @Id = (SELECT Id FROM Users WHERE userName = @userName AND (password = @password OR LastPassword = @password));
			SET @PrivacyNotice = (SELECT PrivacyNotice FROM Users WHERE Id = @Id);
			SET @PrivacyNotice = ISNULL(@PrivacyNotice,0);
			IF @PrivacyNotice = 0
			BEGIN
				SET @successMessage = 'Es necesario aceptar el aviso de privacidad.';
			END ELSE BEGIN
				SET @successMessage = 'Login correcto.';
			END
		END
		ELSE
		BEGIN
			INSERT INTO Users (AccountNum, name, mail, userName, userTypeId, password, RolId,PrivacyNotice)
			VALUES (@AccountNum, @name, @mail, @userName, @userTypeId, @password,@RolId,@PrivacyNotice);
	  
			SET @Id = SCOPE_IDENTITY();
			SET @success = 1;
		END
	END TRY
	BEGIN CATCH
		SET @errorMessage = 'Error al intentar actualizar o insertar el registro.';
		SET @success = 0;
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SpDeleteDocumentById]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpDeleteDocumentById]
@DocumentFileId INT,
@Success BIT OUTPUT,
@Message VARCHAR(100) OUTPUT
AS BEGIN

	DELETE FROM DocumentFiles WHERE Id = @DocumentFileId
	SET @Success = 1
	SET @Message = 'Se ha eliminado el archivo.'

END
GO
/****** Object:  StoredProcedure [dbo].[SpGetDates]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpGetDates]
@UserId INT,
@StartDate VARCHAR(MAX) = NULL,
@EndDate VARCHAR(MAX) = NULL
AS BEGIN
	DECLARE @AccountNum INT;
	SET @AccountNum = (SELECT AccountNum FROM Users WHERE Id = @UserId)
	
	SELECT 
		FORMAT(d.CreatedDate,'dd-MM-yyyy') AS 'Fecha de Cita',
		d.Id AS Id,
		ISNULL(d.Id, 0) AS ScheduleTimeId,
		 CONCAT(
            FORMAT(CONVERT(datetime, st.StartTime), N'hh:mm tt'), ' a ',
            FORMAT(CONVERT(datetime, st.EndTime), N'hh:mm tt')
        ) AS  Horario,
		ISNULL(d.Id, 0) AS OperationId,
		ISNULL(o.Name, '') AS Operacion,
		ISNULL(d.Id, 0) AS TransportLineId,
		ISNULL(tl.Name, '') AS 'Linea de Transporte',
		ISNULL(d.TransportId, 0) AS TransportId,
		CONCAT(ISNULL(tt.Type,''), ' ', ISNULL(d.TransportPlate1,' '))  AS Transporte,
		ISNULL(d.TransportPlate1, 0) AS 'Placa de Transporte',
		ISNULL(d.TransportPlate2, 0) AS 'Placa de Caja #1',
		ISNULL(d.TransportPlate3, 0) AS 'Placa de Caja #2',
		ISNULL(d.DriverId, 0) AS DriverId,
		CONCAT(ISNULL(dr.FirstName,''),' ',ISNULL(dr.LastName,''),' ',ISNULL(dr.SecondLastName,'')) AS Chofer,
		ISNULL(d.ProductId, 0) AS ProductId,
		ISNULL(p.Name,'') AS Producto,
		ISNULL(d.Volume, 0) AS Volumen
	FROM dates d
	LEFT JOIN Schedule st ON d.ScheduleTimeId = st.Id
	LEFT JOIN Operation o ON d.OperationId = o.Id
	LEFT JOIN TransportLines tl ON d.TransportLineId = tl.Id
	LEFT JOIN Transports t ON t.Id = d.TransportId
	LEFT JOIN TransportType tt ON tt.Id = t.TransportTypeId
	LEFT JOIN Drivers dr ON d.DriverId = dr.Id
	LEFT JOIN Products p ON d.ProductId = p.Id
	WHERE d.AccountNum = @AccountNum 
	AND (ISNULL(@StartDate,'') = '' OR CAST(d.CreatedDate AS DATE) >= CAST(@StartDate AS DATE)) 
	AND (ISNULL(@EndDate,'') = '' OR CAST(d.CreatedDate AS DATE) <= CAST(@EndDate AS DATE))
	ORDER BY d.CreatedDate DESC

END

GO
/****** Object:  StoredProcedure [dbo].[SpGetDriverDocuments]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpGetDriverDocuments]
@DriverId INT,
@TemporalDocumentId INT
AS BEGIN

	IF @DriverId IS NULL OR @DriverId = 0
	BEGIN
		
		SELECT 
			f.Id,
			FORMAT(f.CreateDate,'dd-MM-yyyy') AS Fecha,
			d.Name AS 'Tipo de Documento',
			f.OriginalName AS 'Nombre'
		FROM DocumentFiles f
		LEFT JOIN Documents d ON d.Id = f.DocumentId
		WHERE TemporalDocumentId = @TemporalDocumentId

	END ELSE BEGIN
	
		SELECT 
			f.Id,
			FORMAT(f.CreateDate,'dd-MM-yyyy') AS Fecha,
			d.Name AS 'Tipo de Documento',
			f.OriginalName AS 'Nombre'
		FROM DocumentFiles f
		LEFT JOIN Documents d ON d.Id = f.DocumentId
		WHERE d.DocumentTypeId = 2 AND f.ModuleId = @DriverId
	END

END


GO
/****** Object:  StoredProcedure [dbo].[SpGetDrivers]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpGetDrivers]
    @UserId INT
AS
BEGIN
    DECLARE @AccountNum VARCHAR(255);
    SELECT @AccountNum = Accountnum FROM users WHERE Id = @UserId
    
    SELECT 
        ISNULL(d.Id, 0) AS Id, 
        ISNULL(d.FirstName, '') AS Nombre, 
        ISNULL(d.LastName, '') AS Apellido,
        ISNULL(d.SecondLastName, '') AS 'Apellido materno',
        ISNULL(d.PhoneNumber, '') AS Telefono,
        CONVERT(VARCHAR, CAST(d.Birthdate AS DATE), 103) AS 'Fecha de Nacimiento'
    FROM Drivers d
    WHERE d.Accountnum = @AccountNum

END

GO
/****** Object:  StoredProcedure [dbo].[SpGetDriversDocuments]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpGetDriversDocuments]
AS BEGIN

	SELECT 
		ISNULL(Id,0) AS Id,
		ISNULL(Name,'') AS Name
	FROM Documents WHERE DocumentTypeId = 2

END


GO
/****** Object:  StoredProcedure [dbo].[SpGetFileById]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpGetFileById]
@DocumentFilId INT
AS BEGIN

	SELECT 
		OriginalName,
		Mimetype,
		FileData
	FROM DocumentFiles WHERE Id = @DocumentFilId

END

GO
/****** Object:  StoredProcedure [dbo].[SpGetLineDocuments]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpGetLineDocuments]
@TransportLineId INT,
@TemporalDocumentId INT
AS BEGIN

	IF @TransportLineId IS NULL OR @TransportLineId = 0
	BEGIN
		
		SELECT 
			f.Id,
			FORMAT(f.CreateDate,'dd-MM-yyyy') AS Fecha,
			d.Name AS 'Tipo de Documento',
			f.OriginalName AS 'Nombre'
		FROM DocumentFiles f
		LEFT JOIN Documents d ON d.Id = f.DocumentId
		WHERE TemporalDocumentId = @TemporalDocumentId

	END ELSE BEGIN
	
		SELECT 
			f.Id,
			FORMAT(f.CreateDate,'dd-MM-yyyy') AS Fecha,
			d.Name AS 'Tipo de Documento',
			f.OriginalName AS 'Nombre'
		FROM DocumentFiles f
		LEFT JOIN Documents d ON d.Id = f.DocumentId
		WHERE d.DocumentTypeId = 1 AND f.ModuleId = @TransportLineId
	END

END


GO
/****** Object:  StoredProcedure [dbo].[SpGetOperationType]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpGetOperationType]
AS BEGIN

	SELECT Id,Name FROM Operation

END
GO
/****** Object:  StoredProcedure [dbo].[SpGetOperationTypes]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpGetOperationTypes]
AS BEGIN

	SELECT Id, Name FROM Operation

END
GO
/****** Object:  StoredProcedure [dbo].[SpGetProducts]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SpGetProducts]
AS BEGIN

	SELECT Id, Name FROM Products

END
GO
/****** Object:  StoredProcedure [dbo].[SpGetRoles]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpGetRoles]
AS BEGIN

	SELECT 
		ISNULL(Id,0) AS Id,
		ISNULL(Name,'') AS Rol
	FROM Roles

END
GO
/****** Object:  StoredProcedure [dbo].[SpGetSheduleTime]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpGetSheduleTime]
AS
BEGIN
    SELECT 
        Id,
        CONCAT(
            FORMAT(CONVERT(datetime, StartTime), N'hh:mm tt'), ' a ',
            FORMAT(CONVERT(datetime, EndTime), N'hh:mm tt')
        ) AS TimeRange
    FROM Schedule

END
GO
/****** Object:  StoredProcedure [dbo].[SpGetTransportLineDocuments]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpGetTransportLineDocuments]
AS BEGIN

	SELECT 
		ISNULL(Id,0) AS Id,
		ISNULL(Name,'') AS Name
	FROM Documents WHERE DocumentTypeId = 1

END

GO
/****** Object:  StoredProcedure [dbo].[SpGetTransportLines]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpGetTransportLines]
	@UserId INT
AS
BEGIN
	DECLARE @AccountNum INT;
	SELECT @AccountNum = AccountNum FROM Users WHERE Id = @UserId
	
	SELECT 
		ISNULL(tl.Id, 0) AS Id, 
		ISNULL(tl.Name, '') AS 'Linea de Transporte', 
		ISNULL(tl.LineTypeId, 0) AS LineTypeId,
		[type].Type AS 'Tipo de Linea'
	FROM TransportLines tl
	LEFT JOIN TransportLineType [type] ON [type].Id = tl.LineTypeId
	WHERE tl.AccountNum = @AccountNum

END

GO
/****** Object:  StoredProcedure [dbo].[SpGetTransportLineTypes]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpGetTransportLineTypes]
AS BEGIN

	SELECT 
		Id,
		ISNULL(Type,'') AS Type
	FROM TransportLineType

END
GO
/****** Object:  StoredProcedure [dbo].[SpGetTransports]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpGetTransports]
  @TransportId INT,
  @UserId INT
AS
BEGIN

	DECLARE @AccountNum INT;
	SELECT @AccountNum = AccountNum FROM Users WHERE Id = @UserId;

  IF @TransportId IS NULL OR @TransportId = 0
    SELECT 
        t.Id
      --, t.ClientId
      , t.TransportTypeId
	  , ISNULL([type].Type,'') AS 'Tipo de Transporte'
      , ISNULL(t.TransportPlate1, '') AS 'Placa de Transporte'
      , ISNULL(t.TransportPlate2, '') AS 'Placa de Caja #1'
      , ISNULL(t.TransportPlate3, '') AS 'Placa de Caja #2'
      , ISNULL(t.Capacity,0)  AS 'Capacidad'
      --, t.StatusId
    FROM Transports t
	LEFT JOIN TransportType [type] ON [type].Id = t.TransportTypeId
	WHERE AccountNum = @AccountNum;
  ELSE
    SELECT 
        t.Id
      --, t.ClientId
      , t.TransportTypeId
	  , ISNULL([type].Type,'') AS 'Tipo de Transporte'
      , ISNULL(t.TransportPlate1, '') AS 'Placa de Transporte'
      , ISNULL(t.TransportPlate2, '') AS 'Placa de Caja #1'
      , ISNULL(t.TransportPlate3, '') AS 'Placa de Caja #2'
      , ISNULL(t.Capacity,0)  AS 'Capacidad'
      --, t.StatusId
    FROM Transports t
	LEFT JOIN TransportType [type] ON [type].Id = t.TransportTypeId
    WHERE t.Id = @TransportId;
END;

GO
/****** Object:  StoredProcedure [dbo].[SpGetTransportType]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpGetTransportType]
AS BEGIN

	SELECT 
		Id,
		ISNULL(Type,'') AS Type
	FROM TransportType

END
GO
/****** Object:  StoredProcedure [dbo].[SpGetUserData]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpGetUserData]
@UserId INT
AS BEGIN

	SELECT 
		ISNULL(AccountNum,'') AS AccountNum,
		ISNULL(Name,'') AS Name,
		ISNULL(mail,'') AS mail,
		ISNULL(userName,'') AS userName
	FROM Users
	WHERE Id = @UserId

END
GO
/****** Object:  StoredProcedure [dbo].[SpGetUserRol]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SpGetUserRol]
AS BEGIN

	SELECT 
		ISNULL(u.Id, '') AS 'UserId'
		, ISNULL(u.name, '') AS 'Nombre'
		, ISNULL(u.userName, '') AS 'Usuario' 
		, ISNULL(r.Id, '') AS 'RolId'
		, ISNULL(r.Name, '') AS 'Rol'
	FROM Users u
	LEFT JOIN Roles r ON r.Id = u.RolId

END

GO
/****** Object:  StoredProcedure [dbo].[SpInsertPasswordResetToekns]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpInsertPasswordResetToekns]
    @user VARCHAR(MAX),
    @email VARCHAR(MAX),
    @token VARCHAR(255),
	@Success BIT OUTPUT,
	@Message VARCHAR(MAX) OUTPUT
AS
BEGIN
	DECLARE @UserId INT;
	SELECT @UserId = Id FROM Users WHERE userName = @user AND mail = @email;

    INSERT INTO PasswordRestTokens (UserId, userName, Email, Token, Expired, CreatedDate)
    VALUES (@userId,@user, @email, @token, 0, GETDATE());
	SET @Success = 1;
	SET @Message = 'Se inserto el registro';
END
GO
/****** Object:  StoredProcedure [dbo].[SpLoginUser]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SpLoginUser]
@AccountNum VARCHAR(50),
@name VARCHAR(50),
@mail VARCHAR(50),
@userName VARCHAR(50),
@userTypeId INT,
@password VARCHAR(50),
@success BIT OUTPUT,
@Id INT OUTPUT,
@PrivacyNotice INT OUTPUT,
@successMessage VARCHAR(100) OUTPUT,
@errorMessage VARCHAR(100) OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @RolId INT;
	IF @userTypeId = 1 SET @RolId = 1 ELSE IF @userTypeId = 2 SET @RolId = 4;

	BEGIN TRY
		IF EXISTS(SELECT 1 FROM Users WHERE userName = @userName AND password = @password)
		BEGIN
			UPDATE Users SET
			AccountNum = @AccountNum,
			name = @name,
			mail = @mail,
			userName = @userName,
			userTypeId = @userTypeId,
			password = @password,
			RolId = @RolId
			WHERE userName = @userName AND password = @password;
			
			SET @success = 1;
			SET @Id = (SELECT Id FROM Users WHERE userName = @userName AND password = @password);
			SET @PrivacyNotice = (SELECT PrivacyNotice FROM Users WHERE Id = @Id);
			SET @successMessage = 'El registro se actualizó correctamente.';
		END
		ELSE
		BEGIN
			INSERT INTO Users (AccountNum, name, mail, userName, userTypeId, password, RolId,PrivacyNotice)
			VALUES (@AccountNum, @name, @mail, @userName, @userTypeId, @password,@RolId,0);
	  
			SET @Id = SCOPE_IDENTITY();
			SET @success = 1;
			SET @PrivacyNotice = 0;
			SET @successMessage = 'El registro se insertó correctamente.';
		END
	END TRY
	BEGIN CATCH
		SET @errorMessage = 'Error al intentar actualizar o insertar el registro.';
		SET @success = 0;
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SpUpdateNewPassword]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpUpdateNewPassword]
@user VARCHAR(MAX),
@email VARCHAR(MAX),
@token VARCHAR(MAX),
@NewPassword VARCHAR(MAX),
@Success VARCHAR(MAX) OUTPUT,
@Message VARCHAR(MAX) OUTPUT
AS BEGIN
	DECLARE @LastPassword VARCHAR(MAX)

	SET @LastPassword = (SELECT password FROM Users WHERE userName = @user AND mail = @email)

	UPDATE Users SET password = @NewPassword, LastPassword = @LastPassword WHERE userName = @user AND mail = @email
	UPDATE PasswordRestTokens SET Expired = 1 WHERE userName = @user AND Email = @email AND Token = @token

	SET @Success = 1;
	SET @Message = 'Su contraseña ha sido restablecida correctamente';
	RETURN
	--UPDATE Users SET password = @NewPassword WHERE userName = @user AND mail = @email

END

GO
/****** Object:  StoredProcedure [dbo].[SpUpdatePermission]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SpUpdatePermission]
@Permissions_UserId INT,
@RolId INT,
@success BIT OUTPUT,
@successMessage VARCHAR(100) OUTPUT,
@errorMessage VARCHAR(100) OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY

		IF @RolId = 0 OR @RolId IS NULL
		BEGIN
			SET @success = 0;
			SET @successMessage = 'Es necesario asignar un rol.';
			
			RETURN
		END

		UPDATE Users SET RolId = @RolId
		SET @success = 1;
		SET @successMessage = 'El registro se actualizo correctamente.';
	END TRY
	BEGIN CATCH
		SET @errorMessage = 'Error al intentar actualizar o insertar el registro.';
		SET @success = 0;
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SpUserCategories]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpUserCategories]
@UserId INT
AS BEGIN
	
	DECLARE @RolId INT
	SELECT @RolId = RolId FROM Users WHERE Id = @UserId

	SELECT DISTINCT
		mc.Id
		, mc.[Key]
		, mc.Name
		, mc.Description
	FROM ModuleCategories mc 
		LEFT JOIN Modules m ON m.ModuleCategoriesId = mc.Id
		LEFT JOIN RolesPermissions rp ON rp.ModuleId = m.Id
	WHERE rp.RolId = @RolId

END

GO
/****** Object:  StoredProcedure [dbo].[SpUserModules]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpUserModules]
@UserId INT
AS BEGIN
	
	DECLARE @RolId INT
	SELECT @RolId = RolId FROM Users WHERE Id = @UserId

	SELECT
		ISNULL(m.Id, 0) AS Id
	, ISNULL(m.ModuleCategoriesId, 0) AS ModuleCategoriesId
	, ISNULL(m.[Key], '') AS [Key]
	, ISNULL(m.Name, '') AS Name
	, ISNULL(m.Description, '') AS Description
	, ISNULL(m.Icon, '') AS Icon
	FROM Modules m 
		LEFT JOIN RolesPermissions rp ON rp.ModuleId = m.Id
	WHERE rp.RolId = @RolId

END


GO
/****** Object:  StoredProcedure [dbo].[SpUserPrivacyNotice]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpUserPrivacyNotice]
@UserId INT,
@success BIT OUTPUT
AS BEGIN

	UPDATE Users SET PrivacyNotice = 1, PrivacyNoticeDate = GETDATE() WHERE Id = @UserId
    SET @success = 1;
	RETURN
END

GO
/****** Object:  StoredProcedure [dbo].[SpUserRol]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpUserRol]
@UserId INT
AS BEGIN
	
	DECLARE @RolId INT
	SELECT @RolId = RolId FROM Users WHERE Id = @UserId

	SELECT
		r.Id
		, r.[Key]
		, r.Name
		, r.Description
	FROM Roles r
	WHERE r.Id = @RolId

END

GO
/****** Object:  StoredProcedure [dbo].[SpValidateChangePassword]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpValidateChangePassword]
@user VARCHAR(MAX),
@email VARCHAR(MAX),
@token VARCHAR(MAX),
@NewPassword VARCHAR(MAX),
@ConfirmedNewPassword VARCHAR(MAX),
@OldPassword VARCHAR(MAX) OUTPUT,
@Success BIT OUTPUT,
@Message VARCHAR(MAX) OUTPUT
AS BEGIN
	DECLARE @Expired BIT, @CreatedDate DATETIME;

	IF @NewPassword = NULL OR @NewPassword = ''
	BEGIN
		SET @Message = 'Es necesario asignar una nueva contraseña.'
		SET @Success = 0;
		RETURN
	END

	IF @ConfirmedNewPassword = NULL OR @ConfirmedNewPassword = ''
	BEGIN
		SET @Message = 'Es necesario confirmar tu contraseña.'
		SET @Success = 0;
		RETURN
	END
	
	IF NOT EXISTS(SELECT 1 FROM PasswordRestTokens WHERE userName = @user AND Email = @email AND Token = @token)
	BEGIN
		SET @Message = 'Hubo un problema con la solicitud, comunicate con un administrador.'
		SET @Success = 0;
		RETURN
	END

	SELECT @Expired = Expired, @CreatedDate = CreatedDate FROM PasswordRestTokens WHERE userName = @user AND Email = @email AND Token = @token

	IF @Expired = 1 
	BEGIN
		SET @Message = 'Su link ya fue utilizado o ha expirado, de ser necesario, solicite un nuevo cambio de contraseña.'
		SET @Success = 0;
		RETURN
	END

	IF @NewPassword != @ConfirmedNewPassword
	BEGIN
		SET @Message = 'Las contraseñas no coinciden.'
		SET @Success = 0;
		RETURN
	END
		SET @OldPassword = (SELECT [password] FROM Users WHERE userName = @user AND mail = @email)
		SET @Success = 1;
		SET @Message = 'Se ha generado el cambio de contraseña.'
		RETURN
	--UPDATE Users SET password = @NewPassword WHERE userName = @user AND mail = @email

END


GO
/****** Object:  StoredProcedure [dbo].[SpValidateUser]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpValidateUser]
@userName VARCHAR(50),
@password VARCHAR(50),
@success BIT OUTPUT,
@Id INT OUTPUT,
@PrivacyNotice INT OUTPUT,
@successMessage VARCHAR(100) OUTPUT,
@errorMessage VARCHAR(100) OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		IF EXISTS(SELECT 1 FROM Users WHERE userName = @userName AND password = @password)
		BEGIN
			SELECT 
				@Id = Id, 
				@success = 1, 
				@PrivacyNotice = PrivacyNotice, 
				@successMessage = 'Usuario registrado.' 
				FROM Users 
				WHERE userName = @userName AND password = @password
		END
	END TRY
	BEGIN CATCH
		SET @errorMessage = 'Error al intentar actualizar o insertar el registro.';
		SET @success = 0;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SpValidateUserEmail]    Script Date: 21/03/2023 12:56:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpValidateUserEmail]
@User VARCHAR(MAX),
@Mail VARCHAR(MAX),
@MailExists BIT OUTPUT 
AS BEGIN

	IF EXISTS(SELECT 1 FROM Users WHERE mail = @Mail AND userName = @User) SET @MailExists = 1 ELSE SET @MailExists = 0
END
GO
USE [master]
GO
ALTER DATABASE [GesCit] SET  READ_WRITE 
GO
