USE [DW_Chinook]
GO
/****** Object:  Table [dbo].[DIM_artista]    Script Date: 12-05-2023 11:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_artista](
	[id_artista] [int] NOT NULL,
	[nombre] [nvarchar](120) NULL,
 CONSTRAINT [PK_DIM_artista] PRIMARY KEY CLUSTERED 
(
	[id_artista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_cliente]    Script Date: 12-05-2023 11:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_cliente](
	[id_cliente] [int] NOT NULL,
	[nombre] [nvarchar](40) NOT NULL,
	[apellido] [nvarchar](20) NOT NULL,
	[compania] [nvarchar](80) NULL,
	[ciudad] [nvarchar](40) NULL,
	[pais] [nvarchar](40) NULL,
	[codigo_postal] [nvarchar](40) NULL,
 CONSTRAINT [PK_DIM_cliente] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_empleado]    Script Date: 12-05-2023 11:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_empleado](
	[id_empleado] [int] NOT NULL,
	[apellido] [nvarchar](20) NOT NULL,
	[nombre] [nvarchar](20) NOT NULL,
	[titulo] [nvarchar](30) NULL,
	[fecha_cumpleanio] [datetime] NULL,
	[fecha_contratacion] [datetime] NULL,
 CONSTRAINT [PK_DIM_empleado] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_tiempo]    Script Date: 12-05-2023 11:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_tiempo](
	[id_tiempo] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[dia] [int] NULL,
	[mes] [int] NULL,
	[anio] [int] NULL,
 CONSTRAINT [PK_DIM_tiempo] PRIMARY KEY CLUSTERED 
(
	[id_tiempo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HO_venta]    Script Date: 12-05-2023 11:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HO_venta](
	[id_venta] [int] NOT NULL,
	[total] [numeric](10, 2) NULL,
	[precio_unitario] [numeric](10, 2) NULL,
	[cantidad] [int] NULL,
	[id_artista] [int] NULL,
	[id_empleado] [int] NULL,
	[id_cliente] [int] NULL,
	[id_tiempo] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_HO_venta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HO_venta]  WITH CHECK ADD  CONSTRAINT [FK_HO_venta_DIM_artista] FOREIGN KEY([id_artista])
REFERENCES [dbo].[DIM_artista] ([id_artista])
GO
ALTER TABLE [dbo].[HO_venta] CHECK CONSTRAINT [FK_HO_venta_DIM_artista]
GO
ALTER TABLE [dbo].[HO_venta]  WITH CHECK ADD  CONSTRAINT [FK_HO_venta_DIM_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[DIM_cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[HO_venta] CHECK CONSTRAINT [FK_HO_venta_DIM_cliente]
GO
ALTER TABLE [dbo].[HO_venta]  WITH CHECK ADD  CONSTRAINT [FK_HO_venta_DIM_empleado] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[DIM_empleado] ([id_empleado])
GO
ALTER TABLE [dbo].[HO_venta] CHECK CONSTRAINT [FK_HO_venta_DIM_empleado]
GO
ALTER TABLE [dbo].[HO_venta]  WITH CHECK ADD  CONSTRAINT [FK_HO_venta_DIM_tiempo] FOREIGN KEY([id_tiempo])
REFERENCES [dbo].[DIM_tiempo] ([id_tiempo])
GO
ALTER TABLE [dbo].[HO_venta] CHECK CONSTRAINT [FK_HO_venta_DIM_tiempo]
GO
