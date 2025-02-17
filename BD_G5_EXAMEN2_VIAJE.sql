/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.1601)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [BD_G5_EXAMEN2_VIAJE]
GO
/****** Object:  Table [dbo].[tb_Cliente]    Script Date: 04/11/2018 11:41:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombreCliente] [varchar](50) NOT NULL,
	[apellidosCliente] [varchar](50) NOT NULL,
	[fechaNacimientoCliente] [date] NOT NULL,
	[dniCliente] [varchar](15) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Pais]    Script Date: 04/11/2018 11:41:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Pais](
	[idPais] [int] IDENTITY(1,1) NOT NULL,
	[nombrePais] [varchar](50) NOT NULL,
	[codigoPais] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Tarjeta]    Script Date: 04/11/2018 11:41:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Tarjeta](
	[idTarjeta] [int] IDENTITY(1,1) NOT NULL,
	[numeroTarjeta] [varchar](30) NOT NULL,
	[tipoTarjeta] [varchar](20) NOT NULL,
	[modoPago] [varchar](20) NOT NULL,
	[fechaVencimiento] [char](10) NOT NULL,
	[idCliente] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Viaje]    Script Date: 04/11/2018 11:41:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Viaje](
	[idViaje] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NOT NULL,
	[idPais] [int] NOT NULL,
	[fechaInicioViaje] [date] NOT NULL,
	[fechaFinViaje] [date] NULL,
	[estadoViaje] [char](1) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_Cliente] ON 
GO
INSERT [dbo].[tb_Cliente] ([idCliente], [nombreCliente], [apellidosCliente], [fechaNacimientoCliente], [dniCliente]) VALUES (1, N'Juan Manuel', N'Perez Juarez', CAST(N'1980-10-10' AS Date), N'45963584')
GO
INSERT [dbo].[tb_Cliente] ([idCliente], [nombreCliente], [apellidosCliente], [fechaNacimientoCliente], [dniCliente]) VALUES (2, N'Milagros', N'Valencia Torres', CAST(N'1975-04-05' AS Date), N'16975488')
GO
INSERT [dbo].[tb_Cliente] ([idCliente], [nombreCliente], [apellidosCliente], [fechaNacimientoCliente], [dniCliente]) VALUES (3, N'Karla', N'Fuentes Yon', CAST(N'1991-02-16' AS Date), N'65398754')
GO
INSERT [dbo].[tb_Cliente] ([idCliente], [nombreCliente], [apellidosCliente], [fechaNacimientoCliente], [dniCliente]) VALUES (5, N'Bernardo', N'Benites Gallo', CAST(N'1992-08-24' AS Date), N'45987832')
GO
SET IDENTITY_INSERT [dbo].[tb_Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Pais] ON 
GO
INSERT [dbo].[tb_Pais] ([idPais], [nombrePais], [codigoPais]) VALUES (1, N'USA', N'P001U')
GO
INSERT [dbo].[tb_Pais] ([idPais], [nombrePais], [codigoPais]) VALUES (8, N'Suiza', N'P008S')
GO
SET IDENTITY_INSERT [dbo].[tb_Pais] OFF
GO
/****** Object:  Index [PK2]    Script Date: 04/11/2018 11:41:24 ******/
ALTER TABLE [dbo].[tb_Cliente] ADD  CONSTRAINT [PK2] PRIMARY KEY NONCLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK4]    Script Date: 04/11/2018 11:41:24 ******/
ALTER TABLE [dbo].[tb_Pais] ADD  CONSTRAINT [PK4] PRIMARY KEY NONCLUSTERED 
(
	[idPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK1]    Script Date: 04/11/2018 11:41:24 ******/
ALTER TABLE [dbo].[tb_Tarjeta] ADD  CONSTRAINT [PK1] PRIMARY KEY NONCLUSTERED 
(
	[idTarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK3]    Script Date: 04/11/2018 11:41:24 ******/
ALTER TABLE [dbo].[tb_Viaje] ADD  CONSTRAINT [PK3] PRIMARY KEY NONCLUSTERED 
(
	[idViaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tb_Tarjeta]  WITH CHECK ADD  CONSTRAINT [Reftb_Cliente1] FOREIGN KEY([idCliente])
REFERENCES [dbo].[tb_Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[tb_Tarjeta] CHECK CONSTRAINT [Reftb_Cliente1]
GO
ALTER TABLE [dbo].[tb_Viaje]  WITH CHECK ADD  CONSTRAINT [Reftb_Cliente2] FOREIGN KEY([idCliente])
REFERENCES [dbo].[tb_Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[tb_Viaje] CHECK CONSTRAINT [Reftb_Cliente2]
GO
ALTER TABLE [dbo].[tb_Viaje]  WITH CHECK ADD  CONSTRAINT [Reftb_Pais3] FOREIGN KEY([idPais])
REFERENCES [dbo].[tb_Pais] ([idPais])
GO
ALTER TABLE [dbo].[tb_Viaje] CHECK CONSTRAINT [Reftb_Pais3]
GO
