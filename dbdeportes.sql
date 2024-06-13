USE [master]
GO
/****** Object:  Database [dbdeportes]    Script Date: 27/05/2024 10:32:00 p. m. ******/
CREATE DATABASE [dbdeportes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbdeportes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\dbdeportes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbdeportes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\dbdeportes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [dbdeportes] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbdeportes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbdeportes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbdeportes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbdeportes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbdeportes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbdeportes] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbdeportes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbdeportes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbdeportes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbdeportes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbdeportes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbdeportes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbdeportes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbdeportes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbdeportes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbdeportes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbdeportes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbdeportes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbdeportes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbdeportes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbdeportes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbdeportes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbdeportes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbdeportes] SET RECOVERY FULL 
GO
ALTER DATABASE [dbdeportes] SET  MULTI_USER 
GO
ALTER DATABASE [dbdeportes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbdeportes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbdeportes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbdeportes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbdeportes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbdeportes] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbdeportes', N'ON'
GO
ALTER DATABASE [dbdeportes] SET QUERY_STORE = ON
GO
ALTER DATABASE [dbdeportes] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [dbdeportes]
GO
/****** Object:  Table [dbo].[Elemento_Inventario]    Script Date: 27/05/2024 10:32:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Elemento_Inventario](
	[Codigo] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Marca] [varchar](50) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Id_Usuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estadistica]    Script Date: 27/05/2024 10:32:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estadistica](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Partidos_Jugados] [int] NOT NULL,
	[Goles] [int] NOT NULL,
	[Asistencias] [int] NOT NULL,
	[Amarillas] [int] NOT NULL,
	[Rojas] [int] NOT NULL,
	[Id_Usuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evento]    Script Date: 27/05/2024 10:32:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evento](
	[Id] [int] NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Id_Usuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 27/05/2024 10:32:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Icono] [varchar](250) NOT NULL,
	[Controlador] [varchar](250) NOT NULL,
	[PaginaAccion] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 27/05/2024 10:32:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolMenu]    Script Date: 27/05/2024 10:32:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolMenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdRol] [int] NOT NULL,
	[IdMenu] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 27/05/2024 10:32:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Documento] [int] NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
	[Estado] [bit] NOT NULL,
	[Clave] [varchar](100) NOT NULL,
	[Id_Rol] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Elemento_Inventario] ([Codigo], [Nombre], [Marca], [Cantidad], [Id_Usuario]) VALUES (1, N'Camiseta Azul', N'Adidas', 30, 1234567890)
INSERT [dbo].[Elemento_Inventario] ([Codigo], [Nombre], [Marca], [Cantidad], [Id_Usuario]) VALUES (2, N'Tenis Air Rojos', N'Nike', 11, 1009876234)
INSERT [dbo].[Elemento_Inventario] ([Codigo], [Nombre], [Marca], [Cantidad], [Id_Usuario]) VALUES (3, N'Balón Mediano Blanco ', N'Golty', 15, 1234567890)
INSERT [dbo].[Elemento_Inventario] ([Codigo], [Nombre], [Marca], [Cantidad], [Id_Usuario]) VALUES (4, N'Conos Naranjas', N'Under Armony', 50, 1009876234)
GO
SET IDENTITY_INSERT [dbo].[Estadistica] ON 

INSERT [dbo].[Estadistica] ([Id], [Partidos_Jugados], [Goles], [Asistencias], [Amarillas], [Rojas], [Id_Usuario]) VALUES (4, 15, 6, 2, 3, 0, 1007345675)
INSERT [dbo].[Estadistica] ([Id], [Partidos_Jugados], [Goles], [Asistencias], [Amarillas], [Rojas], [Id_Usuario]) VALUES (5, 18, 8, 4, 2, 0, 1001414541)
INSERT [dbo].[Estadistica] ([Id], [Partidos_Jugados], [Goles], [Asistencias], [Amarillas], [Rojas], [Id_Usuario]) VALUES (6, 16, 2, 2, 3, 0, 1004567321)
INSERT [dbo].[Estadistica] ([Id], [Partidos_Jugados], [Goles], [Asistencias], [Amarillas], [Rojas], [Id_Usuario]) VALUES (7, 10, 1, 1, 5, 0, 1005564378)
INSERT [dbo].[Estadistica] ([Id], [Partidos_Jugados], [Goles], [Asistencias], [Amarillas], [Rojas], [Id_Usuario]) VALUES (8, 17, 5, 9, 2, 0, 1004213456)
SET IDENTITY_INSERT [dbo].[Estadistica] OFF
GO
INSERT [dbo].[Evento] ([Id], [Descripcion], [Fecha], [Id_Usuario]) VALUES (20240528, N'Entrenamiento Físico', CAST(N'2024-05-28' AS Date), 1007919053)
INSERT [dbo].[Evento] ([Id], [Descripcion], [Fecha], [Id_Usuario]) VALUES (20240601, N'Partido Jornada 14', CAST(N'2024-06-01' AS Date), 1007919053)
GO
INSERT [dbo].[Menu] ([Id], [Nombre], [Icono], [Controlador], [PaginaAccion]) VALUES (1, N'Usuarios', N'fas fa-user fa-sm fa-fw mr-2', N'Usuario', N'Index')
INSERT [dbo].[Menu] ([Id], [Nombre], [Icono], [Controlador], [PaginaAccion]) VALUES (2, N'Inventario', N'fas fa-fw fa-clipboard-list', N'Inventario', N'Index')
INSERT [dbo].[Menu] ([Id], [Nombre], [Icono], [Controlador], [PaginaAccion]) VALUES (3, N'Estadísticas', N'fas fa-fw fa-signal', N'Estadistica', N'Index')
INSERT [dbo].[Menu] ([Id], [Nombre], [Icono], [Controlador], [PaginaAccion]) VALUES (4, N'Eventos', N'fas fa-fw fa-calendar', N'Evento', N'Index')
INSERT [dbo].[Menu] ([Id], [Nombre], [Icono], [Controlador], [PaginaAccion]) VALUES (5, N'Estadísticas', N'fas fa-fw fa-signal', N'Estadistica', N'EstadisticaJugador')
INSERT [dbo].[Menu] ([Id], [Nombre], [Icono], [Controlador], [PaginaAccion]) VALUES (6, N'Eventos', N'fas fa-fw fa-calendar', N'Evento', N'EventoJugador')
GO
INSERT [dbo].[Rol] ([Id], [Nombre]) VALUES (1, N'Administrador')
INSERT [dbo].[Rol] ([Id], [Nombre]) VALUES (2, N'Técnico')
INSERT [dbo].[Rol] ([Id], [Nombre]) VALUES (3, N'Jugador')
GO
SET IDENTITY_INSERT [dbo].[RolMenu] ON 

INSERT [dbo].[RolMenu] ([Id], [IdRol], [IdMenu]) VALUES (1, 1, 1)
INSERT [dbo].[RolMenu] ([Id], [IdRol], [IdMenu]) VALUES (2, 1, 2)
INSERT [dbo].[RolMenu] ([Id], [IdRol], [IdMenu]) VALUES (3, 2, 3)
INSERT [dbo].[RolMenu] ([Id], [IdRol], [IdMenu]) VALUES (4, 2, 4)
INSERT [dbo].[RolMenu] ([Id], [IdRol], [IdMenu]) VALUES (5, 3, 5)
INSERT [dbo].[RolMenu] ([Id], [IdRol], [IdMenu]) VALUES (6, 3, 6)
SET IDENTITY_INSERT [dbo].[RolMenu] OFF
GO
INSERT [dbo].[Usuario] ([Documento], [Nombre], [Estado], [Clave], [Id_Rol]) VALUES (1001414541, N'Miguel Largo', 1, N'f275e6e60d8cc00e1e84157e9ffaab2c194eafb6968b092574749566f57df044', 3)
INSERT [dbo].[Usuario] ([Documento], [Nombre], [Estado], [Clave], [Id_Rol]) VALUES (1001440987, N'Juan Gómez', 1, N'044393d090bc032032e8ff23d2806187479dafb0ce7aa934fcb7cc1502dd8164', 3)
INSERT [dbo].[Usuario] ([Documento], [Nombre], [Estado], [Clave], [Id_Rol]) VALUES (1002345098, N'Mauricio Ramirez', 1, N'571973ef8dbba9ba972d9b47f885174f9c2a9de708f3f20d4115a6f4f6c956cf', 2)
INSERT [dbo].[Usuario] ([Documento], [Nombre], [Estado], [Clave], [Id_Rol]) VALUES (1004213456, N'Camilo Ospina', 1, N'4ba8511d6e327c41f55a6af918074da7d5aaab27bf3e008db8df4d092df2b797', 3)
INSERT [dbo].[Usuario] ([Documento], [Nombre], [Estado], [Clave], [Id_Rol]) VALUES (1004567321, N'Manuel Cadavid', 1, N'd22184fb8d18ef5c3d1b8570804ad02ece340638acb5988e0e26f8f7decc458e', 3)
INSERT [dbo].[Usuario] ([Documento], [Nombre], [Estado], [Clave], [Id_Rol]) VALUES (1005564378, N'Luis Londoño', 1, N'b336ec48cff06cd999e8281d8f6e9eeb782adc221dce5616e12e208db7be0513', 3)
INSERT [dbo].[Usuario] ([Documento], [Nombre], [Estado], [Clave], [Id_Rol]) VALUES (1007345675, N'Yeison Osorio', 1, N'd30e525ec7de788516b745d98bee1a58a702d38cf8fe45cfcbdd59b1a321be85', 3)
INSERT [dbo].[Usuario] ([Documento], [Nombre], [Estado], [Clave], [Id_Rol]) VALUES (1007767098, N'Emmanuel Álvarez', 0, N'71255b0dbd72beddcd0352d4b9c477177d1b7d162ea6ac0ac1f584fec96c3d05', 3)
INSERT [dbo].[Usuario] ([Documento], [Nombre], [Estado], [Clave], [Id_Rol]) VALUES (1007919053, N'Andrés Tabares', 1, N'a6cba0a306a4cb4bac1d169ac19b1e6f6c5df56be1497970e1d3e2f3a38e39ec', 2)
INSERT [dbo].[Usuario] ([Documento], [Nombre], [Estado], [Clave], [Id_Rol]) VALUES (1008919053, N'Jose López', 1, N'7dd3065274468e335e3164152fb94d2c59489bc0241328969784e72155ab998b', 3)
INSERT [dbo].[Usuario] ([Documento], [Nombre], [Estado], [Clave], [Id_Rol]) VALUES (1009675342, N'David Taborda', 0, N'5c9b504ef982e89d18593963d190f6f529980c13dff9e5c761de7e75991af452', 3)
INSERT [dbo].[Usuario] ([Documento], [Nombre], [Estado], [Clave], [Id_Rol]) VALUES (1009876234, N'Andrés Zapata', 1, N'dd5672fb223ef33a60e70e876b2777656edfaef13732fb31e3ec0228329e9c7d', 1)
INSERT [dbo].[Usuario] ([Documento], [Nombre], [Estado], [Clave], [Id_Rol]) VALUES (1234567890, N'Paulina Vargas', 1, N'df7c160104bd34bf24b82cf177e8e6eacaa04b7d2fb2d95f2a27818eaaa10f6d', 1)
GO
ALTER TABLE [dbo].[Elemento_Inventario]  WITH CHECK ADD  CONSTRAINT [elemento_usuario] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Usuario] ([Documento])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Elemento_Inventario] CHECK CONSTRAINT [elemento_usuario]
GO
ALTER TABLE [dbo].[Estadistica]  WITH CHECK ADD  CONSTRAINT [estadisticas_usuario] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Usuario] ([Documento])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Estadistica] CHECK CONSTRAINT [estadisticas_usuario]
GO
ALTER TABLE [dbo].[Evento]  WITH CHECK ADD  CONSTRAINT [evento_usuario] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Usuario] ([Documento])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Evento] CHECK CONSTRAINT [evento_usuario]
GO
ALTER TABLE [dbo].[RolMenu]  WITH CHECK ADD  CONSTRAINT [rol_menu] FOREIGN KEY([IdMenu])
REFERENCES [dbo].[Menu] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RolMenu] CHECK CONSTRAINT [rol_menu]
GO
ALTER TABLE [dbo].[RolMenu]  WITH CHECK ADD  CONSTRAINT [rol_rol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RolMenu] CHECK CONSTRAINT [rol_rol]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [rol_usuario] FOREIGN KEY([Id_Rol])
REFERENCES [dbo].[Rol] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [rol_usuario]
GO
USE [master]
GO
ALTER DATABASE [dbdeportes] SET  READ_WRITE 
GO
