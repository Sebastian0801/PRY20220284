USE [master]
GO
/****** Object:  Database [WALLET]    Script Date: 14/11/2023 23:01:40 ******/
CREATE DATABASE [WALLET]
GO
USE [WALLET]
GO
/****** Object:  User [admin]    Script Date: 14/11/2023 23:01:42 ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin]
GO
/****** Object:  Table [dbo].[Balance]    Script Date: 14/11/2023 23:01:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Balance](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[balance] [decimal](13, 2) NULL,
 CONSTRAINT [PK_Balance] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Codigos]    Script Date: 14/11/2023 23:01:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Codigos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero] [varchar](200) NULL,
	[codigo] [int] NOT NULL,
	[fechaCreacion] [datetime] NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_Codigos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 14/11/2023 23:01:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flujos]    Script Date: 14/11/2023 23:01:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flujos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_HeaderFlujo] [int] NULL,
	[orden] [int] NULL,
	[mensaje] [varchar](500) NULL,
 CONSTRAINT [PK_Flujo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HeaderFlujos]    Script Date: 14/11/2023 23:01:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HeaderFlujos](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[flujo] [varchar](100) NULL,
 CONSTRAINT [PK_Flujos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mensajeria]    Script Date: 14/11/2023 23:01:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mensajeria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[emisor] [varchar](50) NULL,
	[receptor] [varchar](50) NULL,
	[body] [varchar](500) NULL,
	[id_flujo] [int] NULL,
	[fechaCreacion] [datetime] NULL,
	[estado] [int] NULL,
	[numeroContacto] [varchar](50) NULL,
 CONSTRAINT [PK_Mensajes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solicitud]    Script Date: 14/11/2023 23:01:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solicitud](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[monto] [decimal](15, 2) NULL,
	[usuario] [int] NULL,
	[estado] [int] NULL,
	[fechaCreacion] [datetime] NULL,
	[tipo] [int] NULL,
 CONSTRAINT [PK_Solicitud] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Transaccion]    Script Date: 14/11/2023 23:01:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Transaccion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_Tipo_Transaccion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Usuarios]    Script Date: 14/11/2023 23:01:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_Tipo_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transacciones]    Script Date: 14/11/2023 23:01:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transacciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[tipo] [int] NULL,
	[monto] [decimal](13, 2) NULL,
	[fechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Transacciones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 14/11/2023 23:01:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DNI] [varchar](500) NULL,
	[nombres] [varchar](500) NULL,
	[apellidos] [varchar](500) NULL,
	[celular] [varchar](500) NULL,
	[contraseña] [varchar](500) NULL,
	[tipo] [int] NULL,
	[estado] [int] NULL,
	[fechaCreacion] [datetime] NULL,
	[correo] [varchar](500) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Balance] ON 

INSERT [dbo].[Balance] ([id], [id_usuario], [balance]) VALUES (1, 1, CAST(114.30 AS Decimal(13, 2)))
INSERT [dbo].[Balance] ([id], [id_usuario], [balance]) VALUES (2, 4, CAST(11.00 AS Decimal(13, 2)))
INSERT [dbo].[Balance] ([id], [id_usuario], [balance]) VALUES (3, 5, CAST(2143.00 AS Decimal(13, 2)))
INSERT [dbo].[Balance] ([id], [id_usuario], [balance]) VALUES (4, 6, CAST(79.70 AS Decimal(13, 2)))
INSERT [dbo].[Balance] ([id], [id_usuario], [balance]) VALUES (5, 2, CAST(0.00 AS Decimal(13, 2)))
INSERT [dbo].[Balance] ([id], [id_usuario], [balance]) VALUES (6, 8, CAST(21.50 AS Decimal(13, 2)))
INSERT [dbo].[Balance] ([id], [id_usuario], [balance]) VALUES (8, 10, CAST(5.00 AS Decimal(13, 2)))
INSERT [dbo].[Balance] ([id], [id_usuario], [balance]) VALUES (9, 11, CAST(7.00 AS Decimal(13, 2)))
SET IDENTITY_INSERT [dbo].[Balance] OFF
GO
SET IDENTITY_INSERT [dbo].[Codigos] ON 

INSERT [dbo].[Codigos] ([id], [numero], [codigo], [fechaCreacion], [estado]) VALUES (1, N'+51963739613', 476626, CAST(N'2023-05-03T11:31:40.423' AS DateTime), 1)
INSERT [dbo].[Codigos] ([id], [numero], [codigo], [fechaCreacion], [estado]) VALUES (2, N'+51987286862', 711693, CAST(N'2023-05-03T17:23:02.330' AS DateTime), 1)
INSERT [dbo].[Codigos] ([id], [numero], [codigo], [fechaCreacion], [estado]) VALUES (3, N'+51987286862', 132456, CAST(N'2023-05-03T17:42:22.890' AS DateTime), 1)
INSERT [dbo].[Codigos] ([id], [numero], [codigo], [fechaCreacion], [estado]) VALUES (4, N'+51987286862', 585056, CAST(N'2023-05-03T17:45:48.223' AS DateTime), 1)
INSERT [dbo].[Codigos] ([id], [numero], [codigo], [fechaCreacion], [estado]) VALUES (5, N'+51987286862', 786597, CAST(N'2023-05-03T17:48:24.700' AS DateTime), 1)
INSERT [dbo].[Codigos] ([id], [numero], [codigo], [fechaCreacion], [estado]) VALUES (6, N'+51987286862', 567860, CAST(N'2023-05-03T17:50:25.887' AS DateTime), 1)
INSERT [dbo].[Codigos] ([id], [numero], [codigo], [fechaCreacion], [estado]) VALUES (7, N'+51987286862', 886369, CAST(N'2023-05-03T17:52:37.307' AS DateTime), 1)
INSERT [dbo].[Codigos] ([id], [numero], [codigo], [fechaCreacion], [estado]) VALUES (8, N'+51987286862', 779278, CAST(N'2023-05-03T18:04:51.080' AS DateTime), 1)
INSERT [dbo].[Codigos] ([id], [numero], [codigo], [fechaCreacion], [estado]) VALUES (9, N'+51987286862', 731946, CAST(N'2023-05-03T18:19:38.247' AS DateTime), 1)
INSERT [dbo].[Codigos] ([id], [numero], [codigo], [fechaCreacion], [estado]) VALUES (10, N'+51987286862', 915169, CAST(N'2023-05-03T18:59:34.570' AS DateTime), 1)
INSERT [dbo].[Codigos] ([id], [numero], [codigo], [fechaCreacion], [estado]) VALUES (11, N'+51963739613', 723501, CAST(N'2023-05-03T19:24:01.260' AS DateTime), 1)
INSERT [dbo].[Codigos] ([id], [numero], [codigo], [fechaCreacion], [estado]) VALUES (12, N'+51963739613', 667575, CAST(N'2023-05-03T19:25:37.390' AS DateTime), 1)
INSERT [dbo].[Codigos] ([id], [numero], [codigo], [fechaCreacion], [estado]) VALUES (13, N'+51963739613', 647349, CAST(N'2023-05-03T19:27:13.597' AS DateTime), 1)
INSERT [dbo].[Codigos] ([id], [numero], [codigo], [fechaCreacion], [estado]) VALUES (14, N'+51963739613', 167375, CAST(N'2023-05-03T19:28:47.800' AS DateTime), 1)
INSERT [dbo].[Codigos] ([id], [numero], [codigo], [fechaCreacion], [estado]) VALUES (15, N'+51987286862', 179158, CAST(N'2023-05-03T19:43:11.390' AS DateTime), 1)
INSERT [dbo].[Codigos] ([id], [numero], [codigo], [fechaCreacion], [estado]) VALUES (16, N'+51963739613', 985392, CAST(N'2023-05-04T11:41:21.713' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Codigos] OFF
GO
SET IDENTITY_INSERT [dbo].[Estado] ON 

INSERT [dbo].[Estado] ([id], [descripcion]) VALUES (0, N'Eliminado')
INSERT [dbo].[Estado] ([id], [descripcion]) VALUES (1, N'Acitvo')
INSERT [dbo].[Estado] ([id], [descripcion]) VALUES (2, N'Inactivo')
SET IDENTITY_INSERT [dbo].[Estado] OFF
GO
SET IDENTITY_INSERT [dbo].[Flujos] ON 

INSERT [dbo].[Flujos] ([id], [id_HeaderFlujo], [orden], [mensaje]) VALUES (1, 0, 1, N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta')
INSERT [dbo].[Flujos] ([id], [id_HeaderFlujo], [orden], [mensaje]) VALUES (2, 0, 2, N'Por favor introduzca una opción válida.')
INSERT [dbo].[Flujos] ([id], [id_HeaderFlujo], [orden], [mensaje]) VALUES (3, 1, 1, N'Por favor, responda a los siguientes campos para poder registrarlo.')
INSERT [dbo].[Flujos] ([id], [id_HeaderFlujo], [orden], [mensaje]) VALUES (4, 1, 2, N'DNI:')
INSERT [dbo].[Flujos] ([id], [id_HeaderFlujo], [orden], [mensaje]) VALUES (5, 1, 3, N'Nombres:')
INSERT [dbo].[Flujos] ([id], [id_HeaderFlujo], [orden], [mensaje]) VALUES (6, 1, 4, N'Apellidos:')
INSERT [dbo].[Flujos] ([id], [id_HeaderFlujo], [orden], [mensaje]) VALUES (7, 1, 5, N'Ingrese su contraseña en la llamada.')
INSERT [dbo].[Flujos] ([id], [id_HeaderFlujo], [orden], [mensaje]) VALUES (8, 1, 6, N'Introduzca el codigo de seguridad enviado.')
INSERT [dbo].[Flujos] ([id], [id_HeaderFlujo], [orden], [mensaje]) VALUES (9, 1, 7, N'Verficado correctamente, su cuenta ya está activa.')
INSERT [dbo].[Flujos] ([id], [id_HeaderFlujo], [orden], [mensaje]) VALUES (10, 1, 8, N'Verficado correctamente, su cuenta ya está activa.')
SET IDENTITY_INSERT [dbo].[Flujos] OFF
GO
SET IDENTITY_INSERT [dbo].[HeaderFlujos] ON 

INSERT [dbo].[HeaderFlujos] ([id], [flujo]) VALUES (0, N'Inicial')
INSERT [dbo].[HeaderFlujos] ([id], [flujo]) VALUES (1, N'Registro')
INSERT [dbo].[HeaderFlujos] ([id], [flujo]) VALUES (2, N'Login')
INSERT [dbo].[HeaderFlujos] ([id], [flujo]) VALUES (3, N'Recuperar cuenta')
SET IDENTITY_INSERT [dbo].[HeaderFlujos] OFF
GO
SET IDENTITY_INSERT [dbo].[Mensajeria] ON 

INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (30, N'+51987286862', N'+15075805071', N'Jsjsjs', 1, CAST(N'2023-04-05T08:43:58.060' AS DateTime), 0, NULL)
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (31, N'+15075805071', N'+51987286862', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-05T08:43:58.080' AS DateTime), 0, NULL)
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (32, N'+15075805071', N'+51987286862', N'Por favor introduzca una opción válida.', 1, CAST(N'2023-04-05T08:44:12.353' AS DateTime), 0, NULL)
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (33, N'+15075805071', N'+51987286862', N'Por favor introduzca una opción válida.', 1, CAST(N'2023-04-05T08:44:21.950' AS DateTime), 0, NULL)
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (36, N'+51963739613', N'+15075805071', N'Hol', 1, CAST(N'2023-04-05T09:39:19.263' AS DateTime), 0, NULL)
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (37, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-05T09:39:19.283' AS DateTime), 0, NULL)
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (52, N'+51987286862', N'+15075805071', N'1', 3, CAST(N'2023-04-05T10:47:24.547' AS DateTime), 0, NULL)
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (53, N'+15075805071', N'+51987286862', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-04-05T10:47:24.547' AS DateTime), 0, NULL)
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (54, N'+51987286862', N'+15075805071', N'DNI:', 4, CAST(N'2023-04-05T10:47:24.697' AS DateTime), 0, NULL)
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (55, N'+51987286862', N'+15075805071', N'76530684', 5, CAST(N'2023-04-05T10:47:54.460' AS DateTime), 0, NULL)
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (56, N'+15075805071', N'+51987286862', N'Nombres:', 5, CAST(N'2023-04-05T10:47:54.470' AS DateTime), 0, NULL)
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (57, N'+51987286862', N'+15075805071', N'Sebastián ', 6, CAST(N'2023-04-05T15:06:41.683' AS DateTime), 0, NULL)
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (58, N'+15075805071', N'+51987286862', N'Apellidos:', 6, CAST(N'2023-04-05T15:06:41.693' AS DateTime), 0, NULL)
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (59, N'+51987286862', N'+15075805071', N'Díaz ', 7, CAST(N'2023-04-05T15:06:51.703' AS DateTime), 0, NULL)
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (60, N'+15075805071', N'+51987286862', N'Celular:', 7, CAST(N'2023-04-05T15:06:51.703' AS DateTime), 0, NULL)
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (61, N'+51987286862', N'+15075805071', N'963739613', 8, CAST(N'2023-04-05T15:07:12.847' AS DateTime), 0, NULL)
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (62, N'+15075805071', N'+51987286862', N'Contraseña:', 8, CAST(N'2023-04-05T15:07:12.850' AS DateTime), 0, NULL)
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (63, N'+51963739613', N'+15075805071', N'1', 3, CAST(N'2023-04-05T15:09:13.583' AS DateTime), 0, NULL)
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (64, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-05T15:09:13.587' AS DateTime), 0, NULL)
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (65, N'+51963739613', N'+15075805071', N'1', 3, CAST(N'2023-04-05T15:09:26.570' AS DateTime), 0, NULL)
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (66, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-05T15:09:26.573' AS DateTime), 0, NULL)
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (67, N'+15075805071', N'+51963739613', N'Por favor introduzca una opción válida.', 1, CAST(N'2023-04-05T15:09:40.103' AS DateTime), 0, NULL)
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (68, N'+51963739613', N'+15075805071', N'1', 3, CAST(N'2023-04-05T15:09:46.223' AS DateTime), 0, NULL)
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (69, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-05T15:09:46.227' AS DateTime), 0, NULL)
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (70, N'+51963739613', N'+15075805071', N'2', 3, CAST(N'2023-04-05T15:09:55.113' AS DateTime), 0, NULL)
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (71, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-05T15:09:55.117' AS DateTime), 0, NULL)
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (72, N'+51963739613', N'+15075805071', N'Hola ', 1, CAST(N'2023-04-05T15:18:38.293' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (73, N'+15075805071', N'+51963739613', N'Por favor introduzca una opción válida.', 1, CAST(N'2023-04-05T15:19:28.173' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (74, N'+51963739613', N'+15075805071', N'1', 3, CAST(N'2023-04-05T15:21:26.643' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (75, N'+15075805071', N'+51963739613', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-04-05T15:21:26.650' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (76, N'+51963739613', N'+15075805071', N'DNI:', 4, CAST(N'2023-04-05T15:21:26.813' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (77, N'+51963739613', N'+15075805071', N'76530684', 5, CAST(N'2023-04-05T15:22:30.217' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (78, N'+15075805071', N'+51963739613', N'Nombres:', 5, CAST(N'2023-04-05T15:22:30.220' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (79, N'+51963739613', N'+15075805071', N'Sebastian David ', 6, CAST(N'2023-04-05T15:22:55.497' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (80, N'+15075805071', N'+51963739613', N'Apellidos:', 6, CAST(N'2023-04-05T15:22:55.500' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (81, N'+51963739613', N'+15075805071', N'Diaz Muñoz ', 7, CAST(N'2023-04-05T15:23:02.060' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (82, N'+15075805071', N'+51963739613', N'Celular:', 7, CAST(N'2023-04-05T15:23:02.063' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (83, N'+51963739613', N'+15075805071', N'963739613', 8, CAST(N'2023-04-05T15:23:49.810' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (84, N'+15075805071', N'+51963739613', N'Contraseña:', 8, CAST(N'2023-04-05T15:23:49.817' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (85, N'+51963739613', N'+15075805071', N'Ah', 1, CAST(N'2023-04-05T15:27:10.060' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (86, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-05T15:27:10.060' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (87, N'+51963739613', N'+15075805071', N'1', 3, CAST(N'2023-04-05T15:28:34.827' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (88, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-05T15:28:34.830' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (89, N'+51963739613', N'+15075805071', N'1', 3, CAST(N'2023-04-05T15:28:42.763' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (90, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-05T15:28:42.770' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (91, N'+51963739613', N'+15075805071', N'Hola', 1, CAST(N'2023-04-05T15:30:58.483' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (92, N'123', N'213', N'asdasd', 1, CAST(N'2023-04-05T15:41:01.810' AS DateTime), 0, N'123')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (93, N'12321312', N'12312312', N'asdasd', 1, CAST(N'2023-04-05T15:42:58.647' AS DateTime), 0, N'12321312')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (94, N'22', N'333', N'staaring', 1, CAST(N'2023-04-05T15:43:43.310' AS DateTime), 0, N'22')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (95, N'333', N'22', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-05T15:43:45.170' AS DateTime), 0, N'22')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (96, N'+51963739613', N'+15075805071', N'Holaa', 1, CAST(N'2023-04-05T15:45:56.503' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (97, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-05T15:45:56.520' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (98, N'+51963739613', N'+15075805071', N'1', 3, CAST(N'2023-04-05T15:46:27.843' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (99, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-05T15:46:27.847' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (100, N'+51963739613', N'+15075805071', N'1', 3, CAST(N'2023-04-05T15:47:29.963' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (101, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-05T15:47:29.963' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (102, N'+51987286862', N'+15075805071', N'Que fue mano ', 1, CAST(N'2023-04-05T15:49:08.213' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (103, N'+15075805071', N'+51987286862', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-05T15:49:08.220' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (104, N'+51963739613', N'+15075805071', N'1', 3, CAST(N'2023-04-05T15:50:44.880' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (105, N'+51963739613', N'+15075805071', N'1', 3, CAST(N'2023-04-05T15:52:59.290' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (106, N'+15075805071', N'+51963739613', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-04-05T15:52:59.883' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (107, N'+51963739613', N'+15075805071', N'Holaa', 1, CAST(N'2023-04-05T15:54:39.933' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (108, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-05T15:54:39.947' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (109, N'+51963739613', N'+15075805071', N'1', 3, CAST(N'2023-04-05T15:54:58.230' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (110, N'+15075805071', N'+51963739613', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-04-05T15:54:58.230' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (111, N'+51963739613', N'+15075805071', N'Holaaa', 1, CAST(N'2023-04-05T15:58:14.770' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (112, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-05T15:58:14.783' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (113, N'+15075805071', N'+51963739613', N'Por favor introduzca una opción válida.', 1, CAST(N'2023-04-05T16:00:20.203' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (114, N'+51987286862', N'+15075805071', N'Joo', 1, CAST(N'2023-04-05T16:01:08.453' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (115, N'+15075805071', N'+51987286862', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-05T16:01:08.457' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (116, N'+51987286862', N'+15075805071', N'1', 3, CAST(N'2023-04-05T16:01:30.637' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (117, N'+15075805071', N'+51987286862', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-04-05T16:01:30.637' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (118, N'+51987286862', N'+15075805071', N'DNI:', 4, CAST(N'2023-04-05T16:01:30.797' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (119, N'+51987286862', N'+15075805071', N'124', 4, CAST(N'2023-04-05T16:01:59.047' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (120, N'+15075805071', N'+51987286862', N'DNI:', 4, CAST(N'2023-04-05T16:01:59.047' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (121, N'+51987286862', N'+15075805071', N'Holaa', 1, CAST(N'2023-04-05T16:08:45.070' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (122, N'+15075805071', N'+51987286862', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-05T16:08:45.090' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (123, N'+51987286862', N'+15075805071', N'1', 3, CAST(N'2023-04-05T16:09:00.907' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (124, N'+15075805071', N'+51987286862', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-04-05T16:09:00.910' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (125, N'+51987286862', N'+15075805071', N'DNI:', 4, CAST(N'2023-04-05T16:09:01.080' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (126, N'+51987286862', N'+15075805071', N'76530684', 4, CAST(N'2023-04-05T16:09:24.083' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (127, N'+15075805071', N'+51987286862', N'Nombres:', 5, CAST(N'2023-04-05T16:09:24.087' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (128, N'+51987286862', N'+15075805071', N'Sebastián ', 6, CAST(N'2023-04-05T16:10:16.070' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (129, N'+15075805071', N'+51987286862', N'Celular:', 7, CAST(N'2023-04-05T16:10:16.073' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (130, N'+51987286862', N'+15075805071', N'963739613', 8, CAST(N'2023-04-05T16:10:27.603' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (131, N'+15075805071', N'+51987286862', N'Introduzca el codigo de seguridad enviado.', 9, CAST(N'2023-04-05T16:10:27.603' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (132, N'+51987286862', N'+15075805071', N'Holaa', 1, CAST(N'2023-04-05T16:17:33.680' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (133, N'+15075805071', N'+51987286862', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-05T16:17:33.703' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (134, N'+51987286862', N'+15075805071', N'1', 3, CAST(N'2023-04-05T16:17:49.280' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (135, N'+15075805071', N'+51987286862', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-04-05T16:17:49.290' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (136, N'+15075805071', N'+51987286862', N'DNI:', 4, CAST(N'2023-04-05T16:17:49.460' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (147, N'+51987286862', N'+15075805071', N'76530684', 4, CAST(N'2023-04-05T16:33:34.987' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (148, N'+15075805071', N'+51987286862', N'Nombres:', 5, CAST(N'2023-04-05T16:33:35.580' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (149, N'+51987286862', N'+15075805071', N'sebastian', 5, CAST(N'2023-04-05T16:33:54.600' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (150, N'+15075805071', N'+51987286862', N'Apellidos:', 6, CAST(N'2023-04-05T16:33:55.217' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (151, N'+51987286862', N'+15075805071', N'diaz', 6, CAST(N'2023-04-05T16:34:10.127' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (152, N'+15075805071', N'+51987286862', N'Celular:', 7, CAST(N'2023-04-05T16:34:10.707' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (153, N'+51987286862', N'+15075805071', N'963739613', 7, CAST(N'2023-04-05T16:34:32.833' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (154, N'+15075805071', N'+51987286862', N'Contraseña:', 8, CAST(N'2023-04-05T16:34:33.600' AS DateTime), 0, N'+51987286862')
GO
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (155, N'+51987286862', N'+15075805071', N'zxsder258', 8, CAST(N'2023-04-05T16:44:32.970' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (156, N'+15075805071', N'+51987286862', N'Introduzca el codigo de seguridad enviado.', 9, CAST(N'2023-04-05T16:44:33.617' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (157, N'+15075805071', N'+51987286862', N'Verficado correctamente, ya se encuentra con una cuenta activa.', 10, CAST(N'2023-04-05T18:31:52.400' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (158, N'+51987286880', N'+15075805071', N'asdasd', 1, CAST(N'2023-04-06T10:56:02.640' AS DateTime), 0, N'+51987286880')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (159, N'+15075805071', N'+51987286880', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-06T10:56:05.350' AS DateTime), 0, N'+51987286880')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (160, N'+51987286880', N'+15075805071', N'hollaa', 1, CAST(N'2023-04-06T10:56:57.287' AS DateTime), 0, N'+51987286880')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (161, N'+15075805071', N'+51987286880', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-06T10:56:57.340' AS DateTime), 0, N'+51987286880')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (162, N'+15075805071', N'+51987286880', N'Por favor introduzca una opción válida.', 1, CAST(N'2023-04-06T10:57:26.773' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (163, N'+15075805071', N'+51987286880', N'Por favor introduzca una opción válida.', 1, CAST(N'2023-04-06T10:57:45.323' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (164, N'+51987286810', N'+15075805071', N'asdasd', 1, CAST(N'2023-04-06T11:02:30.257' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (165, N'+15075805071', N'+51987286810', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-06T11:02:30.317' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (166, N'+51987286810', N'+15075805071', N'noseeeee', 3, CAST(N'2023-04-06T11:02:41.720' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (167, N'+15075805071', N'+51987286810', N'Por favor introduzca una opción válida.', 1, CAST(N'2023-04-06T11:02:41.793' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (168, N'+51987286810', N'+15075805071', N'1', 3, CAST(N'2023-04-06T11:04:09.920' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (169, N'+15075805071', N'+51987286810', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-04-06T11:04:09.970' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (170, N'+51987286810', N'+15075805071', N'DNI:', 4, CAST(N'2023-04-06T11:08:23.630' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (171, N'+51987286810', N'+15075805071', N'12345678', 4, CAST(N'2023-04-06T11:08:50.633' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (172, N'+15075805071', N'+51987286810', N'Nombres:', 5, CAST(N'2023-04-06T11:08:50.680' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (173, N'+51987286810', N'+15075805071', N'David', 5, CAST(N'2023-04-06T11:08:56.713' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (174, N'+15075805071', N'+51987286810', N'Apellidos:', 6, CAST(N'2023-04-06T11:08:56.763' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (175, N'+51987286810', N'+15075805071', N'Diaz', 6, CAST(N'2023-04-06T11:08:59.763' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (176, N'+15075805071', N'+51987286810', N'Celular:', 7, CAST(N'2023-04-06T11:08:59.820' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (177, N'+51987286810', N'+15075805071', N'963739613', 7, CAST(N'2023-04-06T11:09:50.877' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (178, N'+15075805071', N'+51987286810', N'Contraseña:', 8, CAST(N'2023-04-06T11:09:50.927' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (179, N'+51987286810', N'+15075805071', N'asd123', 8, CAST(N'2023-04-06T11:09:58.667' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (180, N'+15075805071', N'+51987286810', N'Introduzca el codigo de seguridad enviado.', 9, CAST(N'2023-04-06T11:09:58.717' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (182, N'+51987286810', N'+15075805071', N'AC1404DE-7558-46FD-81DD-D83D04CF0CAC', 3, CAST(N'2023-04-06T11:16:31.083' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (183, N'+15075805071', N'+51987286810', N'Por favor introduzca una opción válida.', 1, CAST(N'2023-04-06T11:16:31.157' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (184, N'+51987286810', N'+15075805071', N'AC1404DE-7558-46FD-81DD-D83D04CF0CAC', 1, CAST(N'2023-04-06T11:17:04.583' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (185, N'+15075805071', N'+51987286810', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-06T11:17:04.633' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (186, N'+51987286810', N'+15075805071', N'1', 3, CAST(N'2023-04-06T11:17:14.653' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (187, N'+15075805071', N'+51987286810', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-04-06T11:17:14.703' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (188, N'+51987286810', N'+15075805010', N'DNI:', 4, CAST(N'2023-04-06T11:18:22.200' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (189, N'+51987286810', N'+15075805071', N'11112222', 4, CAST(N'2023-04-06T11:28:58.523' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (190, N'+15075805071', N'+51987286810', N'Nombres:', 5, CAST(N'2023-04-06T11:28:58.593' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (191, N'+51987286810', N'+15075805071', N'Anthonella', 5, CAST(N'2023-04-06T11:29:07.133' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (192, N'+15075805071', N'+51987286810', N'Apellidos:', 6, CAST(N'2023-04-06T11:29:07.230' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (193, N'+51987286810', N'+15075805071', N'Del Campo', 6, CAST(N'2023-04-06T11:29:14.243' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (194, N'+15075805071', N'+51987286810', N'Celular:', 7, CAST(N'2023-04-06T11:29:14.293' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (195, N'+51987286810', N'+15075805071', N'954785123', 7, CAST(N'2023-04-06T11:29:27.150' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (196, N'+15075805071', N'+51987286810', N'Contraseña:', 8, CAST(N'2023-04-06T11:29:27.213' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (197, N'+51987286810', N'+15075805071', N'asdqweasd', 8, CAST(N'2023-04-06T11:29:35.063' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (198, N'+15075805071', N'+51987286810', N'Introduzca el codigo de seguridad enviado.', 9, CAST(N'2023-04-06T11:29:35.123' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (199, N'+51987286810', N'+15075805071', N'E5FC26F8-FEB7-4CA0-8854-10DF8C3AAF6D', 9, CAST(N'2023-04-06T11:29:54.230' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (200, N'+15075805071', N'+51987286810', N'Ya existe una cuenta registrada con esos datos.', 9, CAST(N'2023-04-06T11:29:57.007' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (201, N'+51987286820', N'+15075805071', N'ads', 1, CAST(N'2023-04-06T11:32:42.123' AS DateTime), 0, N'+51987286820')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (202, N'+15075805071', N'+51987286820', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-06T11:32:42.173' AS DateTime), 0, N'+51987286820')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (203, N'+51987286820', N'+15075805071', N'4', 3, CAST(N'2023-04-06T11:32:47.240' AS DateTime), 0, N'+51987286820')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (204, N'+15075805071', N'+51987286820', N'Por favor introduzca una opción válida.', 1, CAST(N'2023-04-06T11:32:47.353' AS DateTime), 0, N'+51987286820')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (205, N'+51987286820', N'+15075805071', N'1', 3, CAST(N'2023-04-06T11:32:54.040' AS DateTime), 0, N'+51987286820')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (206, N'+15075805071', N'+51987286820', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-04-06T11:32:54.127' AS DateTime), 0, N'+51987286820')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (207, N'+51987286810', N'+15075805020', N'DNI:', 4, CAST(N'2023-04-06T11:33:13.863' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (208, N'+51987286820', N'+15075805071', N'11223344', 4, CAST(N'2023-04-06T11:34:18.607' AS DateTime), 0, N'+51987286820')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (209, N'+15075805071', N'+51987286820', N'Nombres:', 5, CAST(N'2023-04-06T11:34:18.680' AS DateTime), 0, N'+51987286820')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (210, N'+51987286820', N'+15075805071', N'zxc', 5, CAST(N'2023-04-06T11:34:24.537' AS DateTime), 0, N'+51987286820')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (211, N'+15075805071', N'+51987286820', N'Apellidos:', 6, CAST(N'2023-04-06T11:34:24.587' AS DateTime), 0, N'+51987286820')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (212, N'+51987286820', N'+15075805071', N'asd', 6, CAST(N'2023-04-06T11:34:26.253' AS DateTime), 0, N'+51987286820')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (213, N'+15075805071', N'+51987286820', N'Celular:', 7, CAST(N'2023-04-06T11:34:26.303' AS DateTime), 0, N'+51987286820')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (214, N'+51987286820', N'+15075805071', N'111222333', 7, CAST(N'2023-04-06T11:34:36.173' AS DateTime), 0, N'+51987286820')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (215, N'+15075805071', N'+51987286820', N'Contraseña:', 8, CAST(N'2023-04-06T11:34:36.223' AS DateTime), 0, N'+51987286820')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (216, N'+51987286820', N'+15075805071', N'asd123', 8, CAST(N'2023-04-06T11:35:33.007' AS DateTime), 0, N'+51987286820')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (217, N'+15075805071', N'+51987286820', N'Introduzca el codigo de seguridad enviado.', 9, CAST(N'2023-04-06T11:35:33.057' AS DateTime), 0, N'+51987286820')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (218, N'+51987286820', N'+15075805071', N'EF9B5E8D-3359-4EA6-972B-8C06927BD4DC', 9, CAST(N'2023-04-06T11:35:52.817' AS DateTime), 0, N'+51987286820')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (219, N'+15075805071', N'+51987286820', N'Verficado correctamente, ya se encuentra con una cuenta activa.', 10, CAST(N'2023-04-06T11:36:59.450' AS DateTime), 0, N'+51987286820')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (220, N'+51987286830', N'+15075805071', N'8148FA56-7D6F-4246-B68C-B4D5482D0271', 1, CAST(N'2023-04-06T11:51:58.160' AS DateTime), 0, N'+51987286830')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (221, N'+15075805071', N'+51987286830', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-06T11:51:58.230' AS DateTime), 0, N'+51987286830')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (222, N'+51987286830', N'+15075805071', N'2', 3, CAST(N'2023-04-06T11:52:06.713' AS DateTime), 0, N'+51987286830')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (223, N'+15075805071', N'+51987286830', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-04-06T11:52:06.770' AS DateTime), 0, N'+51987286830')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (224, N'+51987286830', N'+15075805071', N'2', 1, CAST(N'2023-04-06T11:52:33.620' AS DateTime), 0, N'+51987286830')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (225, N'+15075805071', N'+51987286830', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-06T11:52:33.673' AS DateTime), 0, N'+51987286830')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (226, N'+51987286830', N'+15075805071', N'1', 3, CAST(N'2023-04-06T11:52:39.907' AS DateTime), 0, N'+51987286830')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (227, N'+15075805071', N'+51987286830', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-04-06T11:52:39.963' AS DateTime), 0, N'+51987286830')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (228, N'+51987286840', N'+15075805071', N'8148FA56-7D6F-4246-B68C-B4D5482D0271', 1, CAST(N'2023-04-06T11:53:23.367' AS DateTime), 0, N'+51987286840')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (229, N'+15075805071', N'+51987286840', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-06T11:53:23.420' AS DateTime), 0, N'+51987286840')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (230, N'+51987286840', N'+15075805071', N'1', 2, CAST(N'2023-04-06T11:53:27.573' AS DateTime), 0, N'+51987286840')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (231, N'+15075805071', N'+51987286840', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-04-06T11:53:27.627' AS DateTime), 0, N'+51987286840')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (232, N'+51987286810', N'+15075805040', N'DNI:', 4, CAST(N'2023-04-06T11:53:52.053' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (233, N'+51987286840', N'+15075805071', N'123123', 4, CAST(N'2023-04-06T11:53:58.487' AS DateTime), 0, N'+51987286840')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (234, N'+15075805071', N'+51987286840', N'Nombres:', 5, CAST(N'2023-04-06T11:53:58.537' AS DateTime), 0, N'+51987286840')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (235, N'+51987286810', N'+15075805001', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-06T11:54:56.863' AS DateTime), 0, N'+15075805001')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (236, N'+51987286810', N'+15075805001', N'Por favor introduzca una opción válida.', 1, CAST(N'2023-04-06T11:54:59.693' AS DateTime), 0, N'+15075805001')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (237, N'+51987286810', N'+15075805001', N'Por favor introduzca una opción válida.', 1, CAST(N'2023-04-06T11:55:02.403' AS DateTime), 0, N'+15075805001')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (238, N'+51987286810', N'+15075805001', N'Por favor introduzca una opción válida.', 1, CAST(N'2023-04-06T11:55:04.870' AS DateTime), 0, N'+15075805001')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (239, N'+51987286810', N'+15075805001', N'Por favor introduzca una opción válida.', 1, CAST(N'2023-04-06T11:55:10.237' AS DateTime), 0, N'+15075805001')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (240, N'+51987286810', N'+15075805001', N'Por favor introduzca una opción válida.', 1, CAST(N'2023-04-06T11:55:56.040' AS DateTime), 0, N'+15075805001')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (241, N'+51987286802', N'+15075805071', N'8148FA56-7D6F-4246-B68C-B4D5482D0271', 1, CAST(N'2023-04-06T11:56:17.450' AS DateTime), 0, N'+51987286802')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (242, N'+15075805071', N'+51987286802', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-06T11:56:17.503' AS DateTime), 0, N'+51987286802')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (243, N'+51987286802', N'+15075805071', N'sss', 2, CAST(N'2023-04-06T11:56:24.900' AS DateTime), 0, N'+51987286802')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (244, N'+15075805071', N'+51987286802', N'Por favor introduzca una opción válida.', 1, CAST(N'2023-04-06T11:56:24.973' AS DateTime), 0, N'+51987286802')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (245, N'+51987286802', N'+15075805071', N'1', 2, CAST(N'2023-04-06T11:56:30.467' AS DateTime), 0, N'+51987286802')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (246, N'+15075805071', N'+51987286802', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-04-06T11:56:30.517' AS DateTime), 0, N'+51987286802')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (247, N'+51987286812', N'+15075805071', N'8148FA56-7D6F-4246-B68C-B4D5482D0271', 1, CAST(N'2023-04-06T11:58:27.173' AS DateTime), 0, N'+51987286812')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (248, N'+15075805071', N'+51987286812', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-06T11:58:27.233' AS DateTime), 0, N'+51987286812')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (249, N'+51987286812', N'+15075805071', N'111', 2, CAST(N'2023-04-06T11:58:34.053' AS DateTime), 0, N'+51987286812')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (250, N'+15075805071', N'+51987286812', N'Por favor introduzca una opción válida.', 2, CAST(N'2023-04-06T11:58:34.103' AS DateTime), 0, N'+51987286812')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (251, N'+51987286862', N'+15075805071', N'8148FA56-7D6F-4246-B68C-B4D5482D0271', 1, CAST(N'2023-04-06T12:00:51.033' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (252, N'+15075805071', N'+51987286862', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-06T12:00:51.123' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (253, N'+51987286863', N'+15075805071', N'8148FA56-7D6F-4246-B68C-B4D5482D0271', 1, CAST(N'2023-04-06T12:00:58.747' AS DateTime), 0, N'+51987286863')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (254, N'+15075805071', N'+51987286863', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-06T12:00:58.803' AS DateTime), 0, N'+51987286863')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (255, N'+51987286863', N'+15075805071', N'8148FA56-7D6F-4246-B68C-B4D5482D0271', 2, CAST(N'2023-04-06T12:01:07.003' AS DateTime), 0, N'+51987286863')
GO
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (256, N'+15075805071', N'+51987286863', N'Por favor introduzca una opción válida.', 2, CAST(N'2023-04-06T12:01:07.057' AS DateTime), 0, N'+51987286863')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (257, N'+51987286863', N'+15075805071', N'1', 2, CAST(N'2023-04-06T12:01:13.127' AS DateTime), 0, N'+51987286863')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (258, N'+15075805071', N'+51987286863', N'Por favor introduzca una opción válida.', 2, CAST(N'2023-04-06T12:01:13.190' AS DateTime), 0, N'+51987286863')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (259, N'+51987286863', N'+15075805071', N'1', 2, CAST(N'2023-04-06T12:01:16.293' AS DateTime), 0, N'+51987286863')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (260, N'+15075805071', N'+51987286863', N'Por favor introduzca una opción válida.', 2, CAST(N'2023-04-06T12:01:16.347' AS DateTime), 0, N'+51987286863')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (261, N'+51987286863', N'+15075805071', N'1', 2, CAST(N'2023-04-06T12:01:47.593' AS DateTime), 0, N'+51987286863')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (262, N'+15075805071', N'+51987286863', N'Por favor introduzca una opción válida.', 2, CAST(N'2023-04-06T12:01:52.447' AS DateTime), 0, N'+51987286863')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (263, N'+51987286861', N'+15075805071', N'8148FA56-7D6F-4246-B68C-B4D5482D0271', 1, CAST(N'2023-04-06T12:03:20.140' AS DateTime), 0, N'+51987286861')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (264, N'+15075805071', N'+51987286861', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-06T12:03:20.207' AS DateTime), 0, N'+51987286861')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (265, N'+51987286861', N'+15075805071', N'8148FA56-7D6F-4246-B68C-B4D5482D0271', 2, CAST(N'2023-04-06T12:03:25.233' AS DateTime), 0, N'+51987286861')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (266, N'+15075805071', N'+51987286861', N'Por favor introduzca una opción válida.', 2, CAST(N'2023-04-06T12:03:25.290' AS DateTime), 0, N'+51987286861')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (267, N'+51987286861', N'+15075805071', N'1', 2, CAST(N'2023-04-06T12:03:32.437' AS DateTime), 0, N'+51987286861')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (268, N'+15075805071', N'+51987286861', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-04-06T12:03:32.493' AS DateTime), 0, N'+51987286861')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (269, N'+51987286863', N'+15075805071', N'1', 2, CAST(N'2023-04-06T12:04:22.173' AS DateTime), 0, N'+51987286863')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (270, N'+15075805071', N'+51987286863', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-04-06T12:04:22.223' AS DateTime), 0, N'+51987286863')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (271, N'+51987286863', N'+15075805071', N'1', 2, CAST(N'2023-04-06T12:04:46.013' AS DateTime), 0, N'+51987286863')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (272, N'+15075805071', N'+51987286863', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-04-06T12:04:46.067' AS DateTime), 0, N'+51987286863')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (273, N'+51987286863', N'+15075805071', N'11', 4, CAST(N'2023-04-06T12:04:58.827' AS DateTime), 0, N'+51987286863')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (274, N'+15075805071', N'+51987286863', N'Nombres:', 5, CAST(N'2023-04-06T12:04:58.877' AS DateTime), 0, N'+51987286863')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (275, N'+51987286863', N'+15075805071', N'11', 1, CAST(N'2023-04-06T12:05:07.897' AS DateTime), 0, N'+51987286863')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (276, N'+15075805071', N'+51987286863', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-06T12:05:07.950' AS DateTime), 0, N'+51987286863')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (277, N'+51987286863', N'+15075805071', N'11', 2, CAST(N'2023-04-06T12:05:10.380' AS DateTime), 0, N'+51987286863')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (278, N'+15075805071', N'+51987286863', N'Por favor introduzca una opción válida.', 2, CAST(N'2023-04-06T12:05:10.437' AS DateTime), 0, N'+51987286863')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (279, N'+51987286863', N'+15075805071', N'1', 2, CAST(N'2023-04-06T12:05:33.880' AS DateTime), 0, N'+51987286863')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (280, N'+15075805071', N'+51987286863', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-04-06T12:05:50.777' AS DateTime), 0, N'+51987286863')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (281, N'+51987286863', N'+15075805071', N'DNI:', 4, CAST(N'2023-04-06T12:06:53.447' AS DateTime), 0, N'+51987286863')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (282, N'+51987286863', N'+15075805071', N'12222', 4, CAST(N'2023-04-06T12:07:08.987' AS DateTime), 0, N'+51987286863')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (283, N'+15075805071', N'+51987286863', N'Nombres:', 5, CAST(N'2023-04-06T12:07:12.347' AS DateTime), 0, N'+51987286863')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (284, N'+51987286862', N'+15075805071', N'8148FA56-7D6F-4246-B68C-B4D5482D0271', 1, CAST(N'2023-04-06T13:00:57.487' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (285, N'+15075805071', N'+51987286862', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-06T13:00:57.533' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (286, N'+51987286862', N'+15075805071', N'4', 2, CAST(N'2023-04-06T13:01:02.160' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (287, N'+15075805071', N'+51987286862', N'Por favor introduzca una opción válida.', 2, CAST(N'2023-04-06T13:01:02.210' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (288, N'+51987286862', N'+15075805071', N'2', 2, CAST(N'2023-04-06T13:01:13.743' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (289, N'+15075805071', N'+51987286862', N'Ingrese su DNI.', 12, CAST(N'2023-04-06T13:01:14.400' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (290, N'+51987286862', N'+15075805071', N'76530684', 12, CAST(N'2023-04-06T13:12:28.183' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (291, N'+15075805071', N'+51987286862', N'Ingrese su Contraseña.', 13, CAST(N'2023-04-06T13:12:28.213' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (292, N'+51987286862', N'+15075805071', N'zxsder258', 13, CAST(N'2023-04-06T15:33:26.860' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (293, N'+15075805071', N'+51987286862', N'Seleccione la operación que desea hacer:/n 1.Transferir dinero /n 2.Obtener reportes /n 3.Actualizar datos', 14, CAST(N'2023-04-06T15:33:41.113' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (294, N'+51987654321', N'+15075805071', N'8148FA56-7D6F-4246-B68C-B4D5482D0271', 1, CAST(N'2023-04-06T15:49:19.127' AS DateTime), 0, N'+51987654321')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (295, N'+15075805071', N'+51987654321', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-06T15:49:19.190' AS DateTime), 0, N'+51987654321')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (296, N'+51987654321', N'+15075805071', N'8148FA56-7D6F-4246-B68C-B4D5482D0271', 2, CAST(N'2023-04-06T15:50:50.233' AS DateTime), 0, N'+51987654321')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (297, N'+15075805071', N'+51987654321', N'Por favor introduzca una opción válida.', 2, CAST(N'2023-04-06T15:50:50.287' AS DateTime), 0, N'+51987654321')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (298, N'+51987654321', N'+15075805071', N'1', 2, CAST(N'2023-04-06T15:50:56.473' AS DateTime), 0, N'+51987654321')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (299, N'+15075805071', N'+51987654321', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-04-06T15:50:56.527' AS DateTime), 0, N'+51987654321')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (300, N'+51987654321', N'+15075805071', N'DNI:', 4, CAST(N'2023-04-06T15:51:18.050' AS DateTime), 0, N'+51987654321')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (301, N'+51987654321', N'+15075805071', N'45127845', 4, CAST(N'2023-04-06T15:51:27.480' AS DateTime), 0, N'+51987654321')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (302, N'+15075805071', N'+51987654321', N'Nombres:', 5, CAST(N'2023-04-06T15:51:27.530' AS DateTime), 0, N'+51987654321')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (303, N'+51987654321', N'+15075805071', N'Pamela', 5, CAST(N'2023-04-06T15:51:33.717' AS DateTime), 0, N'+51987654321')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (304, N'+15075805071', N'+51987654321', N'Apellidos:', 6, CAST(N'2023-04-06T15:51:33.770' AS DateTime), 0, N'+51987654321')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (305, N'+51987654321', N'+15075805071', N'Ruiz', 6, CAST(N'2023-04-06T15:51:38.430' AS DateTime), 0, N'+51987654321')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (306, N'+15075805071', N'+51987654321', N'Contraseña:', 7, CAST(N'2023-04-06T15:51:38.473' AS DateTime), 0, N'+51987654321')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (307, N'+51987654321', N'+15075805071', N'zxsder258', 7, CAST(N'2023-04-06T15:51:49.697' AS DateTime), 0, N'+51987654321')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (308, N'+15075805071', N'+51987654321', N'Introduzca el codigo de seguridad enviado.', 8, CAST(N'2023-04-06T15:51:49.750' AS DateTime), 0, N'+51987654321')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (309, N'+51987654321', N'+15075805071', N'8DE81E49-6066-4882-B7FC-EA6DF461E855', 8, CAST(N'2023-04-06T15:52:09.830' AS DateTime), 0, N'+51987654321')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (310, N'+51456123789', N'+15075805071', N'8148FA56-7D6F-4246-B68C-B4D5482D0271', 1, CAST(N'2023-04-06T15:56:27.483' AS DateTime), 0, N'+51456123789')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (311, N'+15075805071', N'+51456123789', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-06T15:56:27.530' AS DateTime), 0, N'+51456123789')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (312, N'+51456123789', N'+15075805071', N'1', 2, CAST(N'2023-04-06T15:56:34.267' AS DateTime), 0, N'+51456123789')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (313, N'+15075805071', N'+51456123789', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-04-06T15:56:34.317' AS DateTime), 0, N'+51456123789')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (314, N'+15075805071', N'+51456123789', N'DNI:', 4, CAST(N'2023-04-06T15:56:59.440' AS DateTime), 0, N'+51456123789')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (315, N'+51456123789', N'+15075805071', N'14521254', 4, CAST(N'2023-04-06T15:57:21.427' AS DateTime), 0, N'+51456123789')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (316, N'+15075805071', N'+51456123789', N'Nombres:', 5, CAST(N'2023-04-06T15:57:21.480' AS DateTime), 0, N'+51456123789')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (317, N'+51456123789', N'+15075805071', N'Aemlia', 5, CAST(N'2023-04-06T15:57:26.970' AS DateTime), 0, N'+51456123789')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (318, N'+15075805071', N'+51456123789', N'Apellidos:', 6, CAST(N'2023-04-06T15:57:27.020' AS DateTime), 0, N'+51456123789')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (319, N'+51456123789', N'+15075805071', N'Mendoza', 6, CAST(N'2023-04-06T15:57:31.297' AS DateTime), 0, N'+51456123789')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (320, N'+15075805071', N'+51456123789', N'Contraseña:', 7, CAST(N'2023-04-06T15:57:31.350' AS DateTime), 0, N'+51456123789')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (321, N'+51456123789', N'+15075805071', N'zxsder258', 7, CAST(N'2023-04-06T15:57:41.350' AS DateTime), 0, N'+51456123789')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (322, N'+15075805071', N'+51456123789', N'Introduzca el codigo de seguridad enviado.', 8, CAST(N'2023-04-06T15:57:41.400' AS DateTime), 0, N'+51456123789')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (323, N'+51456123789', N'+15075805071', N'642DA551-BDF0-4BCB-BDF1-20DA69E1E494', 8, CAST(N'2023-04-06T15:57:52.627' AS DateTime), 0, N'+51456123789')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (324, N'+15075805071', N'+51456123789', N'Verficado correctamente, ya se encuentra con una cuenta activa.', 9, CAST(N'2023-04-06T15:58:29.290' AS DateTime), 0, N'+51456123789')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (325, N'+51456123789', N'+15075805071', N'8148FA56-7D6F-4246-B68C-B4D5482D0271', 1, CAST(N'2023-04-06T16:03:37.013' AS DateTime), 0, N'+51456123789')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (326, N'+15075805071', N'+51456123789', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-06T16:03:37.067' AS DateTime), 0, N'+51456123789')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (327, N'+51456123789', N'+15075805071', N'2', 2, CAST(N'2023-04-06T16:03:46.353' AS DateTime), 0, N'+51456123789')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (328, N'+15075805071', N'+51456123789', N'Ingrese su DNI.', 12, CAST(N'2023-04-06T16:03:46.380' AS DateTime), 0, N'+51456123789')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (329, N'+51456123789', N'+15075805071', N'14521254', 12, CAST(N'2023-04-06T16:03:58.933' AS DateTime), 0, N'+51456123789')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (330, N'+15075805071', N'+51456123789', N'Ingrese su Contraseña.', 13, CAST(N'2023-04-06T16:03:58.960' AS DateTime), 0, N'+51456123789')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (331, N'+51456123789', N'+15075805071', N'zxsder258', 13, CAST(N'2023-04-06T16:04:13.417' AS DateTime), 0, N'+51456123789')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (332, N'+15075805071', N'+51456123789', N'Seleccione la operación que desea hacer:/n 1.Transferir dinero /n 2.Obtener reportes /n 3.Actualizar datos', 14, CAST(N'2023-04-06T16:04:42.533' AS DateTime), 0, N'+51456123789')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (333, N'+51987456123', N'+15075805071', N'8148FA56-7D6F-4246-B68C-B4D5482D0271', 1, CAST(N'2023-04-12T19:16:24.833' AS DateTime), 0, N'+51987456123')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (334, N'+15075805071', N'+51987456123', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-12T19:16:24.880' AS DateTime), 0, N'+51987456123')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (335, N'+51987456123', N'+15075805071', N'1', 2, CAST(N'2023-04-12T19:16:32.307' AS DateTime), 0, N'+51987456123')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (336, N'+15075805071', N'+51987456123', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-04-12T19:16:32.337' AS DateTime), 0, N'+51987456123')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (337, N'+15075805071', N'+51987456123', N'DNI:', 4, CAST(N'2023-04-12T19:16:52.180' AS DateTime), 0, N'+51987456123')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (338, N'+51987456123', N'+15075805071', N'76530684', 4, CAST(N'2023-04-12T19:17:02.827' AS DateTime), 0, N'+51987456123')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (339, N'+15075805071', N'+51987456123', N'Nombres:', 5, CAST(N'2023-04-12T19:17:02.837' AS DateTime), 0, N'+51987456123')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (340, N'+51987456123', N'+15075805071', N'Sebastian David', 5, CAST(N'2023-04-12T19:17:10.333' AS DateTime), 0, N'+51987456123')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (341, N'+15075805071', N'+51987456123', N'Apellidos:', 6, CAST(N'2023-04-12T19:17:10.337' AS DateTime), 0, N'+51987456123')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (342, N'+51987456123', N'+15075805071', N'Diaz Muñoz', 6, CAST(N'2023-04-12T19:17:19.310' AS DateTime), 0, N'+51987456123')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (343, N'+15075805071', N'+51987456123', N'Contraseña:', 7, CAST(N'2023-04-12T19:17:19.327' AS DateTime), 0, N'+51987456123')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (344, N'+51963739613', N'+15075805071', N'8148FA56-7D6F-4246-B68C-B4D5482D0271', 1, CAST(N'2023-04-12T19:39:27.363' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (345, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-04-12T19:39:27.383' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (346, N'+51963739613', N'+15075805071', N'1', 2, CAST(N'2023-04-12T19:39:35.550' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (347, N'+15075805071', N'+51963739613', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-04-12T19:39:35.560' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (348, N'+15075805071', N'+51963739613', N'DNI:', 4, CAST(N'2023-04-12T19:40:11.093' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (349, N'+51963739613', N'+15075805071', N'76530684', 4, CAST(N'2023-04-12T19:40:34.217' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (350, N'+15075805071', N'+51963739613', N'Nombres:', 5, CAST(N'2023-04-12T19:40:34.217' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (351, N'+51963739613', N'+15075805071', N'Sebastian', 5, CAST(N'2023-04-12T19:40:39.870' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (352, N'+15075805071', N'+51963739613', N'Apellidos:', 6, CAST(N'2023-04-12T19:40:39.870' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (359, N'+51963739613', N'+15075805071', N'Apellidos:', 6, CAST(N'2023-04-12T19:50:30.867' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (370, N'+51987444444', N'+15075805071', N'8148FA56-7D6F-4246-B68C-B4D5482D0271', 1, CAST(N'2023-04-15T12:07:56.393' AS DateTime), 0, N'+51987444444')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (371, N'+15075805071', N'+51987444444', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-04-15T12:07:56.540' AS DateTime), 0, N'+51987444444')
GO
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (372, N'+15075805071', N'+51987444444', N'Por favor introduzca una opción válida.', 2, CAST(N'2023-04-15T12:12:55.383' AS DateTime), 0, N'+51987444444')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (373, N'+51987286862', N'+15075805071', N'+51987444444', 1, CAST(N'2023-04-15T12:17:41.140' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (374, N'+15075805071', N'+51987286862', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-04-15T12:17:41.170' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (375, N'++51987444444', N'+15075805071', N'+asdasd', 1, CAST(N'2023-04-15T12:17:57.203' AS DateTime), 0, N'++51987444444')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (376, N'+15075805071', N'++51987444444', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-04-15T12:17:57.233' AS DateTime), 0, N'++51987444444')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (377, N'+1', N'+15075805071', N'asdasd', 1, CAST(N'2023-04-15T12:18:53.757' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (378, N'+15075805071', N'+1', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-04-15T12:18:53.787' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (379, N'+1', N'+15075805071', N'21', 2, CAST(N'2023-04-15T12:19:03.220' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (380, N'+15075805071', N'+1', N'Por favor introduzca una opción válida.', 2, CAST(N'2023-04-15T12:19:03.250' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (381, N'+1', N'+15075805071', N'21', 2, CAST(N'2023-04-15T12:27:30.550' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (382, N'+15075805071', N'+1', N'Por favor introduzca una opción válida.', 2, CAST(N'2023-04-15T12:27:30.587' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (383, N'+1', N'+15075805071', N'21', 2, CAST(N'2023-04-15T12:27:36.100' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (384, N'+15075805071', N'+1', N'Por favor introduzca una opción válida.', 2, CAST(N'2023-04-15T12:27:36.127' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (385, N'+1', N'+15075805071', N'1', 2, CAST(N'2023-04-15T12:27:43.997' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (386, N'+1', N'+15075805071', N'1', 2, CAST(N'2023-04-15T12:28:25.313' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (387, N'+1', N'+15075805071', N'1', 2, CAST(N'2023-04-15T12:28:53.533' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (388, N'+15075805071', N'+1', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-04-15T12:28:53.563' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (390, N'+15075805071', N'+1', N'DNI', 4, CAST(N'2023-04-15T14:42:59.570' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (397, N'+2', N'+15075805071', N'21', 1, CAST(N'2023-04-15T14:55:48.253' AS DateTime), 0, N'+2')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (398, N'+15075805071', N'+2', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-04-15T14:55:48.287' AS DateTime), 0, N'+2')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (399, N'+2', N'+15075805071', N'21', 2, CAST(N'2023-04-15T14:55:52.777' AS DateTime), 0, N'+2')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (400, N'+15075805071', N'+2', N'Por favor introduzca una opción válida.', 2, CAST(N'2023-04-15T14:55:52.810' AS DateTime), 0, N'+2')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (401, N'+2', N'+15075805071', N'1', 2, CAST(N'2023-04-15T14:55:58.443' AS DateTime), 0, N'+2')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (402, N'+15075805071', N'+2', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-04-15T14:55:58.473' AS DateTime), 0, N'+2')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (403, N'+15075805071', N'+2', N'DNI:', 4, CAST(N'2023-04-15T14:56:13.253' AS DateTime), 0, N'+2')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (404, N'+2', N'+15075805071', N'76530684', 4, CAST(N'2023-04-15T14:56:37.413' AS DateTime), 0, N'+2')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (405, N'+15075805071', N'+2', N'Nombres:', 5, CAST(N'2023-04-15T14:56:37.447' AS DateTime), 0, N'+2')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (406, N'+2', N'+15075805071', N'Sebastian Diaz', 5, CAST(N'2023-04-15T14:57:08.203' AS DateTime), 0, N'+2')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (407, N'+15075805071', N'+2', N'Apellidos:', 6, CAST(N'2023-04-15T14:57:08.507' AS DateTime), 0, N'+2')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (408, N'+15075805071', N'+51987286810', N'pasó procesar digitos', 7, CAST(N'2023-04-15T17:08:30.697' AS DateTime), 0, N'+51987286810')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (409, N'+2', N'+1', N'pasó procesar digitos', 7, CAST(N'2023-04-15T17:11:03.763' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (410, N'+2', N'+1', N'pasó procesar digitos', 7, CAST(N'2023-04-15T17:11:32.970' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (411, N'+1', N'+2', N'asd', 7, CAST(N'2023-04-15T17:23:51.257' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (412, N'+1', N'+2', N'asd', 7, CAST(N'2023-04-15T17:27:47.900' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (413, N'+1', N'+2', N'asd', 7, CAST(N'2023-04-15T17:31:31.697' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (414, N'+1', N'+2', N'asd', 7, CAST(N'2023-04-15T17:33:13.727' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (415, N'+2', N'+1', N'1234', 7, CAST(N'2023-04-15T17:33:22.813' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (416, N'+1', N'+2', N'asd', 7, CAST(N'2023-04-15T17:42:38.480' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (417, N'+1', N'+2', N'asd', 7, CAST(N'2023-04-15T17:48:11.550' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (418, N'+2', N'+1', N'Microsoft.AspNetCore.Http.DefaultHttpRequest', 7, CAST(N'2023-04-15T17:48:18.470' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (419, N'+1', N'+2', N'asd', 7, CAST(N'2023-04-15T17:49:44.523' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (420, N'+2', N'+1', N'Microsoft.AspNetCore.Server.IIS.Core.HttpRequestStream', 7, CAST(N'2023-04-15T17:49:50.497' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (421, N'+1', N'+2', N'asd', 7, CAST(N'2023-04-15T17:52:29.463' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (422, N'+2', N'+1', N'+51963739613', 7, CAST(N'2023-04-15T17:52:34.577' AS DateTime), 0, N'+1')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (423, N'+15075805071', N'+51963739613', N'123456', 7, CAST(N'2023-04-16T11:52:30.593' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (424, N'+3', N'+15075805071', N'8148FA56-7D6F-4246-B68C-B4D5482D0271', 1, CAST(N'2023-04-16T14:16:56.673' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (425, N'+15075805071', N'+3', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-04-16T14:16:59.153' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (426, N'+3', N'+15075805071', N'8148FA56-7D6F-4246-B68C-B4D5482D0271', 2, CAST(N'2023-04-16T14:18:58.050' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (427, N'+15075805071', N'+3', N'Por favor introduzca una opción válida.', 2, CAST(N'2023-04-16T14:18:58.080' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (428, N'+3', N'+15075805071', N'1', 2, CAST(N'2023-04-16T14:19:08.650' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (429, N'+15075805071', N'+3', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-04-16T14:19:08.680' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (430, N'+15075805071', N'+3', N'DNI:', 4, CAST(N'2023-04-16T14:19:32.173' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (431, N'+3', N'+15075805071', N'76530684', 4, CAST(N'2023-04-16T14:20:36.670' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (432, N'+15075805071', N'+3', N'Nombres:', 5, CAST(N'2023-04-16T14:20:36.697' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (433, N'+3', N'+15075805071', N'Sebastian David', 5, CAST(N'2023-04-16T14:20:45.967' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (434, N'+15075805071', N'+3', N'Apellidos:', 6, CAST(N'2023-04-16T14:20:45.993' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (435, N'+3', N'+15075805071', N'Diaz Muñoz', 6, CAST(N'2023-04-16T14:20:58.880' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (436, N'+15075805071', N'+3', N'Introduzca su contraseña en la llamada.', 7, CAST(N'2023-04-16T14:20:58.910' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (439, N'+3', N'+15075805071', N'VeOpCubsFLdjHdoXx5Df9A==', 7, CAST(N'2023-04-16T14:48:45.903' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (442, N'+15075805071', N'+3', N'Introduzca el codigo de seguridad enviado:', 8, CAST(N'2023-04-18T16:34:34.617' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (448, N'+3', N'+15075805071', N'4e185e83-ad2b-4668-ad7f-c722ee5eca0f', 8, CAST(N'2023-04-18T17:01:01.463' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (449, N'+15075805071', N'+3', N'Registrado correctamente.', 9, CAST(N'2023-04-18T17:01:06.013' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (450, N'+3', N'+15075805071', N'asd', 1, CAST(N'2023-04-18T17:07:08.267' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (451, N'+15075805071', N'+3', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-04-18T17:07:08.273' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (454, N'+3', N'+15075805071', N'2', 2, CAST(N'2023-04-18T17:08:56.780' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (455, N'+15075805071', N'+3', N'Ingrese su DNI:', 10, CAST(N'2023-04-18T17:09:00.030' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (457, N'+3', N'+15075805071', N'76530684', 10, CAST(N'2023-04-18T23:27:48.377' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (458, N'+15075805071', N'+3', N'Introduzca su contraseña en la llamada.', 11, CAST(N'2023-04-18T23:27:48.740' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (459, N'+3', N'+15075805071', N'VeOpCubsFLdjHdoXx5Df9A==', 11, CAST(N'2023-04-18T23:28:32.700' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (460, N'+15075805071', N'+3', N'Seleccione la operación que desea hacer:/n 1.Transferir dinero /n 2.Obtener reportes /n 3.Actualizar datos', 12, CAST(N'2023-04-18T23:37:03.980' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (463, N'+3', N'+15075805071', N'8148FA56-7D6F-4246-B68C-B4D5482D0271', 13, CAST(N'2023-04-19T09:20:19.597' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (464, N'+15075805071', N'+3', N'Por favor introduzca una opción válida.', 13, CAST(N'2023-04-19T09:20:19.630' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (465, N'+3', N'+15075805071', N'1', 13, CAST(N'2023-04-19T09:20:27.470' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (466, N'+15075805071', N'+3', N'Ingrese el número de celular al que desea transferir.', 14, CAST(N'2023-04-19T09:20:27.497' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (467, N'+3', N'+15075805071', N'963739613', 14, CAST(N'2023-04-19T09:37:57.320' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (468, N'+15075805071', N'+3', N'Monto a enviar:', 15, CAST(N'2023-04-19T09:37:57.727' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (476, N'+3', N'+15075805071', N'10.10', 15, CAST(N'2023-04-19T14:53:46.980' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (477, N'+15075805071', N'+3', N'El monto ingresado es mayor al saldo de su cuenta.', 16, CAST(N'2023-04-19T14:53:50.840' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (478, N'+3', N'+15075805071', N'10.10', 1, CAST(N'2023-04-19T14:54:17.900' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (479, N'+15075805071', N'+3', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-04-19T14:54:17.927' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (480, N'+3', N'+15075805071', N'2', 2, CAST(N'2023-04-19T14:54:28.693' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (481, N'+15075805071', N'+3', N'Ingrese su DNI:', 10, CAST(N'2023-04-19T14:54:28.733' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (482, N'+3', N'+15075805071', N'963739613', 1, CAST(N'2023-04-19T14:55:43.533' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (483, N'+15075805071', N'+3', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-04-19T14:55:43.563' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (484, N'+3', N'+15075805071', N'2', 2, CAST(N'2023-04-19T14:56:04.423' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (485, N'+15075805071', N'+3', N'Ingrese su DNI:', 10, CAST(N'2023-04-19T14:56:08.857' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (486, N'+3', N'+15075805071', N'76530684', 10, CAST(N'2023-04-19T14:59:05.743' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (487, N'+15075805071', N'+3', N'Introduzca su contraseña en la llamada.', 11, CAST(N'2023-04-19T14:59:05.773' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (488, N'+3', N'+15075805071', N'VeOpCubsFLdjHdoXx5Df9A==', 11, CAST(N'2023-04-19T15:00:31.140' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (489, N'+15075805071', N'+3', N'Seleccione la operación que desea hacer:/n 1.Transferir dinero /n 2.Obtener reportes /n 3.Actualizar datos', 12, CAST(N'2023-04-19T15:02:22.740' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (490, N'+3', N'+15075805071', N'1', 13, CAST(N'2023-04-19T15:02:37.937' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (491, N'+15075805071', N'+3', N'Ingrese el número de celular al que desea transferir.', 14, CAST(N'2023-04-19T15:02:40.813' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (492, N'+3', N'+15075805071', N'963739613', 14, CAST(N'2023-04-19T15:02:55.923' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (493, N'+15075805071', N'+3', N'Monto a enviar:', 15, CAST(N'2023-04-19T15:02:56.360' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (500, N'+3', N'+15075805071', N'10.302', 15, CAST(N'2023-04-19T15:23:47.683' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (501, N'+15075805071', N'+3', N'Transferencia realizada correctamente.', 16, CAST(N'2023-04-19T15:24:26.253' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (502, N'+3', N'+15075805071', N'8148FA56-7D6F-4246-B68C-B4D5482D0271', 1, CAST(N'2023-04-19T15:57:13.343' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (503, N'+15075805071', N'+3', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-04-19T15:57:13.373' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (504, N'+3', N'+15075805071', N'2', 2, CAST(N'2023-04-19T15:57:37.707' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (505, N'+15075805071', N'+3', N'Ingrese su DNI:', 10, CAST(N'2023-04-19T15:57:37.740' AS DateTime), 0, N'+3')
GO
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (506, N'+3', N'+15075805071', N'76530684', 10, CAST(N'2023-04-19T15:57:46.440' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (507, N'+15075805071', N'+3', N'Introduzca su contraseña en la llamada.', 11, CAST(N'2023-04-19T15:57:46.470' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (508, N'+3', N'+15075805071', N'VeOpCubsFLdjHdoXx5Df9A==', 11, CAST(N'2023-04-19T15:58:11.263' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (509, N'+15075805071', N'+3', N'Seleccione la operación que desea hacer:/n 1.Transferir dinero /n 2.Estado de la cuenta /n 3.Actualizar datos', 12, CAST(N'2023-04-19T17:40:38.370' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (510, N'+3', N'+15075805071', N'2', 13, CAST(N'2023-04-19T17:40:49.583' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (511, N'+15075805071', N'+3', N'Balance general: 79,70/n 10,30 -> Transferencia Emitida/n 10,00 -> Transferencia Emitida/n 1010,00 -> Transferencia Emitida', 18, CAST(N'2023-04-19T17:42:13.120' AS DateTime), 0, N'+3')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (512, N'+51963739613', N'+15075805071', N'asd', 1, CAST(N'2023-04-30T00:27:38.737' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (513, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-04-30T00:27:38.773' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (514, N'+51963739613', N'+15075805071', N'asd', 2, CAST(N'2023-04-30T00:27:42.520' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (515, N'+15075805071', N'+51963739613', N'Por favor introduzca una opción válida.', 2, CAST(N'2023-04-30T00:27:42.553' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (516, N'+51963739613', N'+15075805071', N'asd', 2, CAST(N'2023-04-30T00:27:48.303' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (517, N'+15075805071', N'+51963739613', N'Por favor introduzca una opción válida.', 2, CAST(N'2023-04-30T00:27:48.340' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (518, N'+51963739613', N'+15075805071', N'1', 2, CAST(N'2023-04-30T00:27:51.157' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (519, N'+15075805071', N'+51963739613', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-04-30T00:27:51.187' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (520, N'+15075805071', N'+51963739613', N'DNI:', 4, CAST(N'2023-04-30T00:28:10.897' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (533, N'+51963739613', N'+15075805071', N'76530684', 4, CAST(N'2023-04-30T00:51:32.990' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (534, N'+15075805071', N'+51963739613', N'Fecha de nacimiento DDMMAAAA(01012001):', 5, CAST(N'2023-04-30T00:51:33.047' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (535, N'+51963739613', N'+15075805071', N'08052001', 5, CAST(N'2023-04-30T00:51:50.900' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (536, N'+15075805071', N'+51963739613', N'Nombre del padre:', 6, CAST(N'2023-04-30T00:51:50.927' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (537, N'+51963739613', N'+15075805071', N'RICHARD', 6, CAST(N'2023-04-30T00:51:59.287' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (538, N'+15075805071', N'+51963739613', N'Nombre de la madre:', 7, CAST(N'2023-04-30T00:51:59.313' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (539, N'+51963739613', N'+15075805071', N'MARIA', 7, CAST(N'2023-04-30T00:52:07.140' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (540, N'+15075805071', N'+51963739613', N'Lugar de Nacimiento DEPARTAMENTO*PROVINCIA*DISTRITO (ICA*ICA*ICA):', 8, CAST(N'2023-04-30T00:52:07.193' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (545, N'+51963739613', N'+15075805071', N'LIMA/LIMA/LIMA', 8, CAST(N'2023-05-01T23:35:43.383' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (546, N'+15075805071', N'+51963739613', N'Introduzca su contraseña en la llamada.', 9, CAST(N'2023-05-01T23:36:12.520' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (547, N'+51963739613', N'+15075805071', N'r5ts3zI8cjS2oq0FYJUqzg==', 9, CAST(N'2023-05-01T23:39:58.830' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (548, N'+15075805071', N'+51963739613', N'Introduzca el codigo de seguridad enviado:', 10, CAST(N'2023-05-03T11:31:43.470' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (549, N'+51963739613', N'+15075805071', N'476626', 8, CAST(N'2023-05-03T11:39:44.047' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (550, N'+15075805071', N'+51963739613', N'Ya existe una cuenta registrada con esos datos.', 9, CAST(N'2023-05-03T11:39:59.347' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (551, N'76530684', N'123', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-05-03T11:57:32.523' AS DateTime), 0, N'123')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (552, N'+51987286862', N'+15075805071', N'Hola ', 1, CAST(N'2023-05-03T14:27:19.920' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (553, N'+15075805071', N'+51987286862', N'Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta', 1, CAST(N'2023-05-03T14:27:19.940' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (554, N'+51987286862', N'+15075805071', N'1', 2, CAST(N'2023-05-03T14:27:37.123' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (555, N'+15075805071', N'+51987286862', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-05-03T14:27:37.123' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (556, N'+51987286862', N'+15075805071', N'DNI:', 4, CAST(N'2023-05-03T14:27:37.290' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (557, N'+51987286862', N'+15075805071', N'DNI:', 4, CAST(N'2023-05-03T14:27:37.293' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (558, N'+51987286862', N'+15075805071', N'76530684', 4, CAST(N'2023-05-03T14:28:08.340' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (559, N'+15075805071', N'+51987286862', N'Nombres:', 5, CAST(N'2023-05-03T14:28:08.350' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (560, N'+51987286862', N'+15075805071', N'Holaa', 1, CAST(N'2023-05-03T14:38:29.643' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (561, N'+15075805071', N'+51987286862', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-05-03T14:38:29.667' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (562, N'+51987286862', N'+15075805071', N'1', 2, CAST(N'2023-05-03T14:39:31.227' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (563, N'+15075805071', N'+51987286862', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-05-03T14:39:31.227' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (564, N'+51987286862', N'+15075805071', N'DNI:', 4, CAST(N'2023-05-03T14:39:31.380' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (565, N'+51987286862', N'+15075805071', N'DNI:', 4, CAST(N'2023-05-03T14:39:31.387' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (566, N'+51987286862', N'+15075805071', N'Ajsjd', 1, CAST(N'2023-05-03T14:41:18.180' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (567, N'+15075805071', N'+51987286862', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-05-03T14:41:18.183' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (571, N'+51987286862', N'+15075805071', N'1', 2, CAST(N'2023-05-03T14:45:08.403' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (572, N'+15075805071', N'+51987286862', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-05-03T14:45:08.407' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (573, N'+15075805071', N'+51987286862', N'DNI:', 4, CAST(N'2023-05-03T14:45:08.560' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (574, N'+51987286862', N'+15075805071', N'76530684', 4, CAST(N'2023-05-03T14:45:40.680' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (575, N'+15075805071', N'+51987286862', N'Fecha de nacimiento DDMMAAAA(01012001):', 5, CAST(N'2023-05-03T14:45:40.680' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (576, N'+51987286862', N'+15075805071', N'08052001', 5, CAST(N'2023-05-03T14:46:04.507' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (577, N'+15075805071', N'+51987286862', N'Nombre del padre:', 6, CAST(N'2023-05-03T14:46:04.510' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (578, N'+51987286862', N'+15075805071', N'RICHARD', 6, CAST(N'2023-05-03T14:46:14.650' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (579, N'+15075805071', N'+51987286862', N'Nombre de la madre:', 7, CAST(N'2023-05-03T14:46:14.653' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (625, N'+51987286862', N'+15075805071', N'ELENA ', 7, CAST(N'2023-05-03T17:04:43.240' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (626, N'+15075805071', N'+51987286862', N'Lugar de Nacimiento DEPARTAMENTO*PROVINCIA*DISTRITO (ICA*ICA*ICA). Luego, se validarán sus datos:', 8, CAST(N'2023-05-03T17:04:43.267' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (691, N'+51987286862', N'+15075805071', N'LIMA/LIMA/LIMA', 8, CAST(N'2023-05-03T18:19:09.103' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (692, N'+15075805071', N'+51987286862', N'Introduzca su contraseña en la llamada.', 9, CAST(N'2023-05-03T18:19:38.007' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (693, N'+15075805071', N'+51987286862', N'Introduzca el codigo de seguridad enviado:', 10, CAST(N'2023-05-03T18:19:38.900' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (694, N'+51987286862', N'+15075805071', N'VeOpCubsFLdjHdoXx5Df9A==', 9, CAST(N'2023-05-03T18:20:01.127' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (709, N'+51987286862', N'+15075805071', N'731946', 10, CAST(N'2023-05-03T18:43:19.190' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (710, N'+15075805071', N'+51987286862', N'Registrado correctamente.', 11, CAST(N'2023-05-03T18:43:19.753' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (711, N'+51987286862', N'+15075805071', N'Hola ', 1, CAST(N'2023-05-03T18:43:46.290' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (712, N'+15075805071', N'+51987286862', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-05-03T18:43:46.320' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (716, N'+51987286862', N'+15075805071', N'2', 2, CAST(N'2023-05-03T18:52:52.560' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (717, N'+15075805071', N'+51987286862', N'Ingrese su DNI:', 12, CAST(N'2023-05-03T18:52:52.590' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (803, N'+51987286862', N'+15075805071', N'76530684', 12, CAST(N'2023-05-03T19:52:59.670' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (804, N'+15075805071', N'+51987286862', N'Ingrese su contraseña en la llamada.', 13, CAST(N'2023-05-03T19:52:59.700' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (805, N'+51987286862', N'+15075805071', N'VeOpCubsFLdjHdoXx5Df9A==', 13, CAST(N'2023-05-03T19:53:14.197' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (806, N'+15075805071', N'+51987286862', N'Seleccione la operación que desea hacer:/n 1.Transferir dinero /n 2.Estado de la cuenta /n 3.Actualizar datos', 14, CAST(N'2023-05-03T19:53:39.940' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (807, N'+51987286862', N'+15075805071', N'1', 15, CAST(N'2023-05-03T19:54:40.917' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (808, N'+15075805071', N'+51987286862', N'Ingrese el número de celular al que desea transferir.', 14, CAST(N'2023-05-03T19:54:40.947' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (809, N'+51987286862', N'+15075805071', N'963739613', 15, CAST(N'2023-05-03T19:55:34.043' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (810, N'+15075805071', N'+51987286862', N'Por favor introduzca una opción válida.', 13, CAST(N'2023-05-03T19:55:34.073' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (811, N'+51963739613', N'+15075805071', N'Hola', 1, CAST(N'2023-05-04T11:40:09.073' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (812, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-05-04T11:40:09.120' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (813, N'+51963739613', N'+15075805071', N'1', 2, CAST(N'2023-05-04T11:40:15.017' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (814, N'+15075805071', N'+51963739613', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-05-04T11:40:15.053' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (815, N'+15075805071', N'+51963739613', N'DNI:', 4, CAST(N'2023-05-04T11:40:15.100' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (816, N'+51963739613', N'+15075805071', N'76530684', 4, CAST(N'2023-05-04T11:40:22.910' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (817, N'+15075805071', N'+51963739613', N'Fecha de nacimiento DDMMAAAA(01012001):', 5, CAST(N'2023-05-04T11:40:22.940' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (818, N'+51963739613', N'+15075805071', N'08052001', 5, CAST(N'2023-05-04T11:40:29.733' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (819, N'+15075805071', N'+51963739613', N'Nombre del padre:', 6, CAST(N'2023-05-04T11:40:29.770' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (820, N'+51963739613', N'+15075805071', N'RICHARD', 6, CAST(N'2023-05-04T11:40:35.693' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (821, N'+15075805071', N'+51963739613', N'Nombre de la madre:', 7, CAST(N'2023-05-04T11:40:35.723' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (822, N'+51963739613', N'+15075805071', N'ELENA', 7, CAST(N'2023-05-04T11:40:40.570' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (823, N'+15075805071', N'+51963739613', N'Lugar de Nacimiento DEPARTAMENTO*PROVINCIA*DISTRITO (ICA*ICA*ICA). Luego, se validarán sus datos:', 8, CAST(N'2023-05-04T11:40:40.600' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (824, N'+51963739613', N'+15075805071', N'LIMA/LIMA/LIMA', 8, CAST(N'2023-05-04T11:40:51.960' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (825, N'+15075805071', N'+51963739613', N'Introduzca su contraseña en la llamada.', 9, CAST(N'2023-05-04T11:41:21.627' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (826, N'+15075805071', N'+51963739613', N'Introduzca el codigo de seguridad enviado:', 10, CAST(N'2023-05-04T11:41:22.567' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (827, N'+51963739613', N'+15075805071', N'VeOpCubsFLdjHdoXx5Df9A==', 9, CAST(N'2023-05-04T11:41:44.893' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (828, N'+51963739613', N'+15075805071', N'985392', 10, CAST(N'2023-05-04T11:42:15.873' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (829, N'+15075805071', N'+51963739613', N'Registrado correctamente.', 11, CAST(N'2023-05-04T11:42:16.577' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (830, N'+51963739613', N'+15075805071', N'Hola', 1, CAST(N'2023-05-04T11:42:54.527' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (831, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-05-04T11:42:54.560' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (832, N'+51963739613', N'+15075805071', N'2', 2, CAST(N'2023-05-04T11:42:59.373' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (833, N'+15075805071', N'+51963739613', N'Ingrese su DNI:', 12, CAST(N'2023-05-04T11:42:59.400' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (834, N'+51963739613', N'+15075805071', N'76530684', 12, CAST(N'2023-05-04T11:43:07.193' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (835, N'+15075805071', N'+51963739613', N'Ingrese su contraseña en la llamada.', 13, CAST(N'2023-05-04T11:43:07.220' AS DateTime), 0, N'+51963739613')
GO
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (836, N'+51963739613', N'+15075805071', N'VeOpCubsFLdjHdoXx5Df9A==', 13, CAST(N'2023-05-04T11:43:18.517' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (837, N'+15075805071', N'+51963739613', N'Seleccione la operación que desea hacer:/n 1.Transferir dinero /n 2.Estado de la cuenta /n 3.Actualizar datos', 14, CAST(N'2023-05-04T11:43:47.350' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (850, N'+51963739613', N'+15075805071', N'1', 14, CAST(N'2023-05-04T11:55:11.220' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (851, N'+15075805071', N'+51963739613', N'Ingrese el número de celular al que desea transferir.', 15, CAST(N'2023-05-04T11:55:11.250' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (852, N'+51963739613', N'+15075805071', N'989105678', 15, CAST(N'2023-05-04T11:56:45.370' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (853, N'+15075805071', N'+51963739613', N'Monto a enviar:', 16, CAST(N'2023-05-04T11:56:45.400' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (854, N'+51963739613', N'+15075805071', N'1', 16, CAST(N'2023-05-04T11:57:58.187' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (855, N'+15075805071', N'+51963739613', N'El monto ingresado es mayor al saldo de su cuenta.', 17, CAST(N'2023-05-04T11:57:58.423' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (856, N'+51963739613', N'+15075805071', N'Hola', 1, CAST(N'2023-05-04T12:01:15.723' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (857, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-05-04T12:01:15.753' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (858, N'+51963739613', N'+15075805071', N'1', 2, CAST(N'2023-05-04T12:04:56.973' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (859, N'+15075805071', N'+51963739613', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-05-04T12:04:57.020' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (860, N'+15075805071', N'+51963739613', N'DNI:', 4, CAST(N'2023-05-04T12:04:57.060' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (861, N'+51963739613', N'+15075805071', N'MUCHAS GRACIAS. ', 4, CAST(N'2023-05-04T12:08:20.957' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (862, N'+15075805071', N'+51963739613', N'Fecha de nacimiento DDMMAAAA(01012001):', 5, CAST(N'2023-05-04T12:08:20.987' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (863, N'+51963739611', N'+15075805071', N'lima*lima*lima', 1, CAST(N'2023-05-04T12:15:53.227' AS DateTime), 0, N'+51963739611')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (864, N'+15075805071', N'+51963739611', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-05-04T12:15:53.607' AS DateTime), 0, N'+51963739611')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (865, N'++1987286862', N'+15075805071', N'lima*lima*lima', 1, CAST(N'2023-05-04T12:16:14.770' AS DateTime), 0, N'++1987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (866, N'+15075805071', N'++1987286862', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-05-04T12:16:14.980' AS DateTime), 0, N'++1987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (867, N'+51987286862', N'+15075805071', N'1', 1, CAST(N'2023-05-04T12:19:19.557' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (868, N'+15075805071', N'+51987286862', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-05-04T12:19:19.590' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (869, N'+51987286862', N'+15075805071', N'2', 2, CAST(N'2023-05-04T12:20:36.747' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (870, N'+15075805071', N'+51987286862', N'Ingrese su DNI:', 12, CAST(N'2023-05-04T12:20:36.777' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (871, N'+51987286862', N'+15075805071', N'76530690', 12, CAST(N'2023-05-04T12:20:55.903' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (872, N'+15075805071', N'+51987286862', N'Ingrese su contraseña en la llamada.', 13, CAST(N'2023-05-04T12:20:55.933' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (873, N'+51987286862', N'+15075805071', N'VeOpCubsFLdjHdoXx5Df9A==', 13, CAST(N'2023-05-04T12:21:14.527' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (874, N'+15075805071', N'+51987286862', N'Error al validar las credenciales', 14, CAST(N'2023-05-04T12:21:36.147' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (875, N'+51987286862', N'+15075805071', N'Hola', 1, CAST(N'2023-05-04T12:26:21.567' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (876, N'+15075805071', N'+51987286862', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-05-04T12:26:21.600' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (877, N'+51987286862', N'+15075805071', N'2', 2, CAST(N'2023-05-04T12:26:41.623' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (878, N'+15075805071', N'+51987286862', N'Ingrese su DNI:', 12, CAST(N'2023-05-04T12:26:41.650' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (879, N'+51987286862', N'+15075805071', N'76530690', 12, CAST(N'2023-05-04T12:26:57.263' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (880, N'+15075805071', N'+51987286862', N'Ingrese su contraseña en la llamada.', 13, CAST(N'2023-05-04T12:26:57.290' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (881, N'+51987286862', N'+15075805071', N'VeOpCubsFLdjHdoXx5Df9A==', 13, CAST(N'2023-05-04T12:27:08.560' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (882, N'+15075805071', N'+51987286862', N'Error al validar las credenciales', 14, CAST(N'2023-05-04T12:27:37.383' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (883, N'+51987286862', N'+15075805071', N'Hola', 1, CAST(N'2023-05-04T12:32:01.300' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (884, N'+15075805071', N'+51987286862', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-05-04T12:32:01.333' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (885, N'+51987286862', N'+15075805071', N'2', 2, CAST(N'2023-05-04T12:32:19.670' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (886, N'+15075805071', N'+51987286862', N'Ingrese su DNI:', 12, CAST(N'2023-05-04T12:32:19.700' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (887, N'+51987286862', N'+15075805071', N'76530690', 12, CAST(N'2023-05-04T12:32:31.837' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (888, N'+15075805071', N'+51987286862', N'Ingrese su contraseña en la llamada.', 13, CAST(N'2023-05-04T12:32:31.863' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (889, N'+51987286862', N'+15075805071', N'VeOpCubsFLdjHdoXx5Df9A==', 13, CAST(N'2023-05-04T12:32:51.227' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (890, N'+15075805071', N'+51987286862', N'Seleccione la operación que desea hacer:/n 1.Transferir dinero /n 2.Estado de la cuenta /n 3.Actualizar datos', 14, CAST(N'2023-05-04T12:33:11.947' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (891, N'+51987286862', N'+15075805071', N'1', 14, CAST(N'2023-05-04T12:34:22.987' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (892, N'+15075805071', N'+51987286862', N'Ingrese el número de celular al que desea transferir.', 15, CAST(N'2023-05-04T12:34:23.017' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (893, N'+51987286862', N'+15075805071', N'963739613', 15, CAST(N'2023-05-04T12:34:34.890' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (894, N'+15075805071', N'+51987286862', N'Monto a enviar:', 16, CAST(N'2023-05-04T12:34:34.913' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (895, N'+51987286862', N'+15075805071', N'1', 16, CAST(N'2023-05-04T12:35:09.460' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (896, N'+15075805071', N'+51987286862', N'Transferencia realizada correctamente.', 17, CAST(N'2023-05-04T12:35:09.787' AS DateTime), 0, N'+51987286862')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1729, N'+51963739613', N'+15075805071', N'HOL', 5, CAST(N'2023-05-18T17:18:53.750' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1730, N'+15075805071', N'+51963739613', N'Nombre del padre:', 6, CAST(N'2023-05-18T17:18:53.780' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1731, N'+51963739613', N'+15075805071', N'Hola', 1, CAST(N'2023-05-18T17:20:28.127' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1732, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-05-18T17:20:28.157' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1733, N'+51963739613', N'+15075805071', N'Hola', 2, CAST(N'2023-11-12T22:44:47.400' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1734, N'+15075805071', N'+51963739613', N'Por favor introduzca una opción válida.', 2, CAST(N'2023-11-12T22:44:47.427' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1735, N'+51963739613', N'+15075805071', N'Holaa', 1, CAST(N'2023-11-13T14:45:07.397' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1736, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-13T14:45:07.403' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1737, N'+51963739613', N'+15075805071', N'2', 2, CAST(N'2023-11-13T14:48:02.957' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1738, N'+15075805071', N'+51963739613', N'Ingrese su DNI:', 10, CAST(N'2023-11-13T14:48:02.957' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1739, N'+51963739613', N'+15075805071', N'76530684', 10, CAST(N'2023-11-13T14:48:14.320' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1740, N'+15075805071', N'+51963739613', N'Introduzca su contraseña en la llamada.', 11, CAST(N'2023-11-13T14:48:14.320' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1741, N'+51963739613', N'+15075805071', N'Holaaa', 1, CAST(N'2023-11-13T15:10:06.547' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1742, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-13T15:10:06.550' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1743, N'+51963739613', N'+15075805071', N'2', 2, CAST(N'2023-11-13T15:10:18.953' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1744, N'+15075805071', N'+51963739613', N'Ingrese su DNI:', 10, CAST(N'2023-11-13T15:10:18.957' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1745, N'+51963739613', N'+15075805071', N'76530684', 10, CAST(N'2023-11-13T15:10:36.117' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1746, N'+15075805071', N'+51963739613', N'Introduzca su contraseña en la llamada.', 11, CAST(N'2023-11-13T15:10:36.117' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1747, N'+51963739613', N'+15075805071', N'Holaa', 1, CAST(N'2023-11-13T15:16:28.837' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1748, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-13T15:16:28.840' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1749, N'+51963739613', N'+15075805071', N'2', 2, CAST(N'2023-11-13T15:16:34.767' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1750, N'+15075805071', N'+51963739613', N'Ingrese su DNI:', 10, CAST(N'2023-11-13T15:16:34.767' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1751, N'+51963739613', N'+15075805071', N'76530684', 10, CAST(N'2023-11-13T15:16:43.257' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1752, N'+15075805071', N'+51963739613', N'Introduzca su contraseña en la llamada.', 11, CAST(N'2023-11-13T15:16:43.257' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1753, N'+51963739613', N'+15075805071', N'Holaa', 1, CAST(N'2023-11-13T15:47:30.337' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1754, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-13T15:47:30.353' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1755, N'+51963739613', N'+15075805071', N'2', 2, CAST(N'2023-11-13T15:47:37.043' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1756, N'+15075805071', N'+51963739613', N'Ingrese su DNI:', 10, CAST(N'2023-11-13T15:47:37.043' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1757, N'+51963739613', N'+15075805071', N'76530684', 8, CAST(N'2023-11-13T15:47:44.693' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1758, N'+51963739613', N'+15075805071', N'76530684', 8, CAST(N'2023-11-13T15:50:26.017' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1759, N'+51963739613', N'+15075805071', N'Hola', 1, CAST(N'2023-11-13T15:53:49.777' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1760, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-13T15:53:49.987' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1761, N'+51963739613', N'+15075805071', N'2', 2, CAST(N'2023-11-13T15:54:04.640' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1762, N'+15075805071', N'+51963739613', N'Ingrese su DNI:', 10, CAST(N'2023-11-13T15:54:04.730' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1763, N'+51963739613', N'+15075805071', N'76530684', 8, CAST(N'2023-11-13T15:54:30.907' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1764, N'+51963739613', N'+15075805071', N'Hola', 1, CAST(N'2023-11-13T16:18:37.547' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1765, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-13T16:18:37.757' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1766, N'+51963739613', N'+15075805071', N'2', 2, CAST(N'2023-11-13T16:18:45.513' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1767, N'+15075805071', N'+51963739613', N'Ingrese su DNI:', 20, CAST(N'2023-11-13T16:18:45.723' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1768, N'+51963739613', N'+15075805071', N'76530684', 20, CAST(N'2023-11-13T16:19:28.517' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1769, N'+15075805071', N'+51963739613', N'Ingrese su contraseña en la llamada.', 21, CAST(N'2023-11-13T16:19:28.620' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1770, N'+51963739613', N'+15075805071', N'G', 1, CAST(N'2023-11-13T16:32:18.300' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1771, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-13T16:32:18.317' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1772, N'+51963739613', N'+15075805071', N'2', 2, CAST(N'2023-11-13T16:32:24.707' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1773, N'+15075805071', N'+51963739613', N'Ingrese su DNI:', 20, CAST(N'2023-11-13T16:32:24.707' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1774, N'+51963739613', N'+15075805071', N'76530684', 20, CAST(N'2023-11-13T16:32:30.317' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1775, N'+15075805071', N'+51963739613', N'Ingrese su contraseña en la llamada.', 21, CAST(N'2023-11-13T16:32:30.317' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1776, N'+51963739613', N'+15075805071', N'Asd', 1, CAST(N'2023-11-13T16:36:02.820' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1777, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-13T16:36:02.820' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1778, N'+51963739613', N'+15075805071', N'2', 2, CAST(N'2023-11-13T16:36:08.960' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1779, N'+15075805071', N'+51963739613', N'Ingrese su DNI:', 20, CAST(N'2023-11-13T16:36:08.960' AS DateTime), 0, N'+51963739613')
GO
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1780, N'+51963739613', N'+15075805071', N'76530684', 20, CAST(N'2023-11-13T16:36:20.177' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1781, N'+15075805071', N'+51963739613', N'Ingrese su contraseña en la llamada.', 21, CAST(N'2023-11-13T16:36:20.177' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1782, N'+51963739613', N'+15075805071', N'VeOpCubsFLdjHdoXx5Df9A==', 21, CAST(N'2023-11-13T16:36:38.550' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1783, N'+51963739613', N'+15075805071', N'Hh', 1, CAST(N'2023-11-13T16:41:31.950' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1784, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-13T16:41:31.950' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1785, N'+51963739613', N'+15075805071', N'2', 2, CAST(N'2023-11-13T16:44:16.010' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1786, N'+15075805071', N'+51963739613', N'Ingrese su DNI:', 20, CAST(N'2023-11-13T16:44:16.013' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1787, N'+51963739613', N'+15075805071', N'76530684', 20, CAST(N'2023-11-13T16:44:28.380' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1788, N'+15075805071', N'+51963739613', N'Ingrese su contraseña en la llamada.', 21, CAST(N'2023-11-13T16:44:28.393' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1789, N'+51963739613', N'+15075805071', N'Q4PnqnJ/WBTjifyb0BT1Eg==', 21, CAST(N'2023-11-13T16:44:53.863' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1790, N'+51963739613', N'+15075805071', N'Hola ', 1, CAST(N'2023-11-13T16:46:07.837' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1791, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-13T16:46:07.840' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1792, N'+51963739613', N'+15075805071', N'2', 2, CAST(N'2023-11-13T16:46:13.780' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1793, N'+15075805071', N'+51963739613', N'Ingrese su DNI:', 20, CAST(N'2023-11-13T16:46:13.783' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1794, N'+51963739613', N'+15075805071', N'76530684', 20, CAST(N'2023-11-13T16:46:21.420' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1795, N'+15075805071', N'+51963739613', N'Ingrese su contraseña en la llamada.', 21, CAST(N'2023-11-13T16:46:21.423' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1796, N'+51963739613', N'+15075805071', N'VeOpCubsFLdjHdoXx5Df9A==', 21, CAST(N'2023-11-13T16:46:37.950' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1797, N'+15075805071', N'+51963739613', N'Seleccione la operación que desea hacer:/n 1.Transferir dinero /n 2.Estado de la cuenta /n 3.Actualizar datos', 22, CAST(N'2023-11-13T16:54:37.230' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1798, N'+51963739613', N'+15075805071', N'Haja', 1, CAST(N'2023-11-13T16:55:07.860' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1799, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-13T16:55:07.860' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1800, N'+51963739613', N'+15075805071', N'2', 2, CAST(N'2023-11-13T16:55:17.353' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1801, N'+15075805071', N'+51963739613', N'Ingrese su DNI:', 20, CAST(N'2023-11-13T16:55:17.353' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1806, N'+51963739613', N'+15075805071', N'76530684', 20, CAST(N'2023-11-13T17:03:01.933' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1807, N'+15075805071', N'+51963739613', N'Ingrese su contraseña en la llamada.', 21, CAST(N'2023-11-13T17:03:01.933' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1808, N'+51963739613', N'+15075805071', N'VeOpCubsFLdjHdoXx5Df9A==', 21, CAST(N'2023-11-13T17:03:17.357' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1809, N'+15075805071', N'+51963739613', N'Seleccione la operación que desea hacer:/n 1.Transferir dinero /n 2.Estado de la cuenta /n 3.Actualizar datos', 22, CAST(N'2023-11-13T17:03:43.543' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1810, N'+51963739613', N'+15075805071', N'Ad', 1, CAST(N'2023-11-13T17:18:37.767' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1811, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-13T17:18:37.767' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1812, N'+51963739613', N'+15075805071', N'Aaa', 2, CAST(N'2023-11-13T17:33:08.183' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1813, N'+15075805071', N'+51963739613', N'Por favor introduzca una opción válida.', 2, CAST(N'2023-11-13T17:33:08.183' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1814, N'+51963739613', N'+15075805071', N'Hola', 2, CAST(N'2023-11-13T17:34:06.410' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1815, N'+15075805071', N'+51963739613', N'Por favor introduzca una opción válida.', 2, CAST(N'2023-11-13T17:34:06.413' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1816, N'+51963739613', N'+15075805071', N'Hols', 2, CAST(N'2023-11-13T17:43:53.647' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1817, N'+15075805071', N'+51963739613', N'Por favor introduzca una opción válida.', 2, CAST(N'2023-11-13T17:43:53.647' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1818, N'+51963739613', N'+15075805071', N'2', 2, CAST(N'2023-11-13T17:55:07.330' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1819, N'+15075805071', N'+51963739613', N'Ingrese su DNI:', 20, CAST(N'2023-11-13T17:55:07.333' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1820, N'+51963739613', N'+15075805071', N'76530684', 20, CAST(N'2023-11-13T17:55:19.730' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1821, N'+15075805071', N'+51963739613', N'Ingrese su contraseña en la llamada.', 21, CAST(N'2023-11-13T17:55:19.730' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1822, N'+51963739613', N'+15075805071', N'Hola ', 1, CAST(N'2023-11-13T17:57:24.770' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1823, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-13T17:57:24.783' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1824, N'+51963739613', N'+15075805071', N'2', 2, CAST(N'2023-11-13T17:57:29.943' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1825, N'+15075805071', N'+51963739613', N'Ingrese su DNI:', 20, CAST(N'2023-11-13T17:57:29.943' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1826, N'+51963739613', N'+15075805071', N'76530684', 20, CAST(N'2023-11-13T17:57:39.110' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1827, N'+15075805071', N'+51963739613', N'Ingrese su contraseña en la llamada.', 21, CAST(N'2023-11-13T17:57:39.110' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1828, N'+51963739613', N'+15075805071', N'VeOpCubsFLdjHdoXx5Df9A==', 21, CAST(N'2023-11-13T17:57:55.640' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1829, N'+15075805071', N'+51963739613', N'Seleccione la operación que desea hacer:/n 1.Transferir dinero /n 2.Estado de la cuenta /n 3.Actualizar datos', 22, CAST(N'2023-11-13T17:58:20.193' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1843, N'+51963739613', N'+15075805071', N'2', 22, CAST(N'2023-11-13T19:44:08.903' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1844, N'+15075805071', N'+51963739613', N'Balance general: 5,00/n 1,00 -> Transferencia Emitida/n 1,00 -> Transferencia Recibida/n 5,00 -> Ingreso', 28, CAST(N'2023-11-13T19:44:27.127' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1845, N'+51963739613', N'+15075805071', N'Hola ', 1, CAST(N'2023-11-13T20:21:43.640' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1846, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-13T20:21:43.653' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1847, N'+51963739613', N'+15075805071', N' 3', 2, CAST(N'2023-11-13T20:22:42.603' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1848, N'+15075805071', N'+51963739613', N'Por favor introduzca una opción válida.', 2, CAST(N'2023-11-13T20:22:42.603' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1849, N'+51963739613', N'+15075805071', N'3', 2, CAST(N'2023-11-13T20:23:20.913' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1850, N'+15075805071', N'+51963739613', N'Ingrese su DNI:', 40, CAST(N'2023-11-13T20:23:20.913' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1853, N'+51924351972', N'+15075805071', N'12345678', 1, CAST(N'2023-11-13T21:32:56.097' AS DateTime), 0, N'+51924351972')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1854, N'+15075805071', N'+51924351972', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-13T21:32:56.110' AS DateTime), 0, N'+51924351972')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1855, N'+15075805071', N'+51963739613', N'Hola ', 2, CAST(N'2023-11-14T00:20:47.857' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1856, N'+51963739613', N'+15075805071', N'Por favor introduzca una opción válida.', 2, CAST(N'2023-11-14T00:20:47.857' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1857, N'+15075805071', N'+51963739613', N'Hola ', 1, CAST(N'2023-11-14T00:21:27.590' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1858, N'+51963739613', N'+15075805071', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-14T00:21:27.590' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1859, N'+51963739613', N'+15075805071', N'Hola ', 1, CAST(N'2023-11-14T00:21:54.560' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1860, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-14T00:21:54.577' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1861, N'+51963739613', N'+15075805071', N'Hola', 2, CAST(N'2023-11-14T00:26:54.170' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1862, N'+15075805071', N'+51963739613', N'Por favor introduzca una opción válida.', 2, CAST(N'2023-11-14T00:26:54.187' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1863, N'+51963739613', N'+15075805071', N'1', 2, CAST(N'2023-11-14T00:27:17.660' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1864, N'+15075805071', N'+51963739613', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-11-14T00:27:17.660' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1865, N'+15075805071', N'+51963739613', N'DNI:', 4, CAST(N'2023-11-14T00:27:17.840' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1866, N'+51963739613', N'+15075805071', N'1', 4, CAST(N'2023-11-14T01:04:03.870' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1867, N'+15075805071', N'+51963739613', N'Fecha de nacimiento DDMMAAAA(01012001):', 5, CAST(N'2023-11-14T01:04:03.870' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1868, N'+51963739613', N'+15075805071', N'123456', 5, CAST(N'2023-11-14T01:04:22.873' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1869, N'+15075805071', N'+51963739613', N'Nombre del padre:', 6, CAST(N'2023-11-14T01:04:22.877' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1870, N'+51963739613', N'+15075805071', N'123456', 1, CAST(N'2023-11-14T11:34:36.353' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1871, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-14T11:34:36.353' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1872, N'+51963739613', N'+15075805071', N'123456', 2, CAST(N'2023-11-14T11:37:30.563' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1873, N'+15075805071', N'+51963739613', N'Por favor introduzca una opción válida.', 2, CAST(N'2023-11-14T11:37:30.563' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1874, N'+51963739613', N'+15075805071', N'1', 2, CAST(N'2023-11-14T11:37:40.613' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1875, N'+15075805071', N'+51963739613', N'Por favor, responda a los siguientes campos para poder registrarlo.', 3, CAST(N'2023-11-14T11:37:40.613' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1876, N'+15075805071', N'+51963739613', N'DNI:', 4, CAST(N'2023-11-14T11:37:40.643' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1877, N'+51963739613', N'+15075805071', N'1', 4, CAST(N'2023-11-14T11:37:52.793' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1878, N'+15075805071', N'+51963739613', N'Fecha de nacimiento DDMMAAAA(01012001):', 5, CAST(N'2023-11-14T11:37:52.793' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1879, N'+51963739613', N'+15075805071', N'Hola', 1, CAST(N'2023-11-14T11:46:13.943' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1880, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-14T11:46:13.943' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1881, N'+51963739613', N'+15075805071', N'2', 2, CAST(N'2023-11-14T11:51:32.600' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1882, N'+15075805071', N'+51963739613', N'Ingrese su DNI:', 20, CAST(N'2023-11-14T11:51:32.600' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1883, N'+51963739613', N'+15075805071', N'76530684', 20, CAST(N'2023-11-14T11:51:44.257' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1884, N'+15075805071', N'+51963739613', N'Ingrese su contraseña en la llamada.', 21, CAST(N'2023-11-14T11:51:44.257' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1885, N'+51963739613', N'+15075805071', N'VeOpCubsFLdjHdoXx5Df9A==', 41, CAST(N'2023-11-14T11:52:06.533' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1886, N'+51989105678', N'+15075805071', N'Hola', 1, CAST(N'2023-11-14T12:14:24.917' AS DateTime), 0, N'+51989105678')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1887, N'+15075805071', N'+51989105678', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-14T12:14:24.917' AS DateTime), 0, N'+51989105678')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1888, N'+51963739613', N'+15075805071', N'Holaa', 1, CAST(N'2023-11-14T12:21:10.260' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1889, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-14T12:21:10.277' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1890, N'+51963739123', N'+15075805071', N'Holaa', 1, CAST(N'2023-11-14T12:22:24.240' AS DateTime), 0, N'+51963739123')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1891, N'+15075805071', N'+51963739123', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-14T12:22:24.257' AS DateTime), 0, N'+51963739123')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1892, N'+51963739123', N'+15075805071', N'2', 2, CAST(N'2023-11-14T12:23:43.487' AS DateTime), 0, N'+51963739123')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1893, N'+15075805071', N'+51963739123', N'Ingrese su DNI:', 20, CAST(N'2023-11-14T12:23:43.487' AS DateTime), 0, N'+51963739123')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1894, N'+51963739123', N'+15075805071', N'76530684', 20, CAST(N'2023-11-14T12:24:19.727' AS DateTime), 0, N'+51963739123')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1895, N'+15075805071', N'+51963739123', N'Ingrese su contraseña en la llamada.', 21, CAST(N'2023-11-14T12:24:19.727' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1896, N'+51963739613', N'+15075805071', N'Hola ', 1, CAST(N'2023-11-15T00:12:37.230' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1897, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-15T00:12:37.230' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1898, N'+51963739613', N'+15075805071', N'2', 2, CAST(N'2023-11-15T00:13:35.340' AS DateTime), 0, N'+51963739613')
GO
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1899, N'+15075805071', N'+51963739613', N'Ingrese su DNI:', 20, CAST(N'2023-11-15T00:13:35.340' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1900, N'+51963739613', N'+15075805071', N'76530684', 20, CAST(N'2023-11-15T00:13:44.867' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1901, N'+15075805071', N'+51963739613', N'Ingrese su contraseña en la llamada.', 21, CAST(N'2023-11-15T00:13:44.867' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1902, N'+51963739613', N'+15075805071', N'+rfvS5f6e90SR9tJHuzmeA==', 21, CAST(N'2023-11-15T00:13:59.970' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1903, N'+15075805071', N'+51963739613', N'Error al validar las credenciales', 22, CAST(N'2023-11-15T00:14:25.577' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1904, N'+51963739613', N'+15075805071', N'Holaa', 1, CAST(N'2023-11-15T00:29:35.893' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1905, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-15T00:29:35.893' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1906, N'+51963739613', N'+15075805071', N'2', 2, CAST(N'2023-11-15T00:29:43.710' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1907, N'+15075805071', N'+51963739613', N'Ingrese su DNI:', 20, CAST(N'2023-11-15T00:29:43.723' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1908, N'+51963739613', N'+15075805071', N'76530684', 20, CAST(N'2023-11-15T00:29:53.893' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1909, N'+15075805071', N'+51963739613', N'Ingrese su contraseña en la llamada.', 21, CAST(N'2023-11-15T00:29:53.893' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1910, N'+51963739613', N'+15075805071', N'VeOpCubsFLdjHdoXx5Df9A==', 21, CAST(N'2023-11-15T00:30:06.997' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1911, N'+15075805071', N'+51963739613', N'Seleccione la operación que desea hacer:/n 1.Transferir dinero /n 2.Estado de la cuenta', 22, CAST(N'2023-11-15T00:30:34.467' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1912, N'+51963739613', N'+15075805071', N'2', 22, CAST(N'2023-11-15T00:31:51.600' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1913, N'+15075805071', N'+51963739613', N'Balance general: 7.00/n 2.00 -> Ingreso/n 1.00 -> Transferencia Emitida/n 1.00 -> Transferencia Recibida', 28, CAST(N'2023-11-15T00:31:51.613' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1914, N'+51963739613', N'+15075805071', N'Hola ', 1, CAST(N'2023-11-15T01:34:54.830' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1915, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-15T01:34:54.847' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1916, N'+51963739613', N'+15075805071', N'3', 2, CAST(N'2023-11-15T01:35:00.920' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1917, N'+15075805071', N'+51963739613', N'Ingrese su DNI:', 40, CAST(N'2023-11-15T01:35:00.920' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1920, N'+51963739613', N'+15075805071', N'76530684', 40, CAST(N'2023-11-15T01:36:54.367' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1921, N'+15075805071', N'+51963739613', N'Ingrese su contraseña antigua en la llamada.', 41, CAST(N'2023-11-15T01:36:54.367' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1922, N'+51963739613', N'+15075805071', N'VeOpCubsFLdjHdoXx5Df9A==', 41, CAST(N'2023-11-15T01:37:09.237' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1923, N'+15075805071', N'+51963739613', N'Ingrese su nueva contraseña en la llamada.', 41, CAST(N'2023-11-15T01:37:35.420' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1924, N'+51963739613', N'+15075805071', N'VeOpCubsFLdjHdoXx5Df9A==', 41, CAST(N'2023-11-15T01:37:49.130' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1925, N'+15075805071', N'+51963739613', N'Contraseña actualizada correctamente.', 41, CAST(N'2023-11-15T01:38:15.650' AS DateTime), 0, N'+15075805071')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1926, N'+51963739613', N'+15075805071', N'Hola', 1, CAST(N'2023-11-15T02:23:25.290' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1927, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-15T02:23:25.320' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1928, N'+51963739613', N'+15075805071', N'3', 2, CAST(N'2023-11-15T02:23:31.363' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1929, N'+15075805071', N'+51963739613', N'Ingrese su DNI:', 40, CAST(N'2023-11-15T02:23:31.363' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1930, N'+51963739613', N'+15075805071', N'76530684', 40, CAST(N'2023-11-15T02:23:43.380' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1931, N'+15075805071', N'+51963739613', N'Ingrese su contraseña antigua en la llamada.', 41, CAST(N'2023-11-15T02:23:43.380' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1932, N'+51963739613', N'+15075805071', N'VeOpCubsFLdjHdoXx5Df9A==', 41, CAST(N'2023-11-15T02:23:57.073' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1933, N'+15075805071', N'+51963739613', N'Ingrese su nueva contraseña en la llamada.', 42, CAST(N'2023-11-15T02:24:24.210' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1934, N'+51963739613', N'+15075805071', N'HnGL/zf4J+1FT4kM7KN0iQ==', 42, CAST(N'2023-11-15T02:24:43.140' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1935, N'+15075805071', N'+51963739613', N'Contraseña actualizada correctamente.', 43, CAST(N'2023-11-15T02:25:04.273' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1936, N'+51963739613', N'+15075805071', N'Hola ', 1, CAST(N'2023-11-15T02:50:07.703' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1937, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-15T02:50:07.713' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1938, N'+51963739613', N'+15075805071', N'3', 2, CAST(N'2023-11-15T02:50:14.567' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1939, N'+15075805071', N'+51963739613', N'Ingrese su DNI:', 40, CAST(N'2023-11-15T02:50:14.570' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1940, N'+51963739613', N'+15075805071', N'76530684', 40, CAST(N'2023-11-15T02:50:24.417' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1941, N'+15075805071', N'+51963739613', N'Ingrese su contraseña antigua en la llamada.', 41, CAST(N'2023-11-15T02:50:24.417' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1942, N'+51963739613', N'+15075805071', N'VeOpCubsFLdjHdoXx5Df9A==', 41, CAST(N'2023-11-15T02:50:39.220' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1943, N'+15075805071', N'+51963739613', N'Ingrese su nueva contraseña en la llamada.', 42, CAST(N'2023-11-15T02:51:05.300' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1944, N'+51963739613', N'+15075805071', N'VeOpCubsFLdjHdoXx5Df9A==', 42, CAST(N'2023-11-15T02:51:17.773' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1946, N'+15075805071', N'+51963739613', N'Contraseña actualizada correctamente.', 43, CAST(N'2023-11-15T03:03:11.897' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1947, N'+51963739613', N'+15075805071', N'Hola ', 1, CAST(N'2023-11-15T03:08:43.253' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1948, N'+15075805071', N'+51963739613', N'Estimado usuario, por favor seleccione la opción que desea:
1. Registro
2. Login
3. Recuperar cuenta', 1, CAST(N'2023-11-15T03:08:43.267' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1949, N'+51963739613', N'+15075805071', N'3', 2, CAST(N'2023-11-15T03:08:49.117' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1950, N'+15075805071', N'+51963739613', N'Ingrese su DNI:', 40, CAST(N'2023-11-15T03:08:49.117' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1951, N'+51963739613', N'+15075805071', N'76530684', 40, CAST(N'2023-11-15T03:08:59.017' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1952, N'+15075805071', N'+51963739613', N'Ingrese su contraseña antigua en la llamada.', 41, CAST(N'2023-11-15T03:08:59.017' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1953, N'+51963739613', N'+15075805071', N'VeOpCubsFLdjHdoXx5Df9A==', 41, CAST(N'2023-11-15T03:09:13.957' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1954, N'+15075805071', N'+51963739613', N'Ingrese su nueva contraseña en la llamada.', 42, CAST(N'2023-11-15T03:09:39.833' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1955, N'+51963739613', N'+15075805071', N'0of1ip9mBeCgJS00qWqEuw==', 42, CAST(N'2023-11-15T03:09:54.217' AS DateTime), 0, N'+51963739613')
INSERT [dbo].[Mensajeria] ([id], [emisor], [receptor], [body], [id_flujo], [fechaCreacion], [estado], [numeroContacto]) VALUES (1956, N'+15075805071', N'+51963739613', N'Contraseña actualizada correctamente.', 43, CAST(N'2023-11-15T03:10:19.910' AS DateTime), 0, N'+51963739613')
SET IDENTITY_INSERT [dbo].[Mensajeria] OFF
GO
SET IDENTITY_INSERT [dbo].[Solicitud] ON 

INSERT [dbo].[Solicitud] ([id], [monto], [usuario], [estado], [fechaCreacion], [tipo]) VALUES (8, CAST(2.00 AS Decimal(15, 2)), 8, 3, CAST(N'2023-04-26T14:13:19.213' AS DateTime), NULL)
INSERT [dbo].[Solicitud] ([id], [monto], [usuario], [estado], [fechaCreacion], [tipo]) VALUES (9, CAST(2.00 AS Decimal(15, 2)), 8, 3, CAST(N'2023-04-26T16:08:31.303' AS DateTime), 1)
INSERT [dbo].[Solicitud] ([id], [monto], [usuario], [estado], [fechaCreacion], [tipo]) VALUES (10, CAST(1.00 AS Decimal(15, 2)), 8, 3, CAST(N'2023-04-26T16:35:01.440' AS DateTime), 2)
INSERT [dbo].[Solicitud] ([id], [monto], [usuario], [estado], [fechaCreacion], [tipo]) VALUES (11, CAST(1.00 AS Decimal(15, 2)), 8, 3, CAST(N'2023-04-26T18:50:26.657' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Solicitud] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipo_Transaccion] ON 

INSERT [dbo].[Tipo_Transaccion] ([id], [descripcion], [estado]) VALUES (1, N'Ingreso', 1)
INSERT [dbo].[Tipo_Transaccion] ([id], [descripcion], [estado]) VALUES (2, N'Retiro', 1)
INSERT [dbo].[Tipo_Transaccion] ([id], [descripcion], [estado]) VALUES (3, N'Transferencia Emitida', 1)
INSERT [dbo].[Tipo_Transaccion] ([id], [descripcion], [estado]) VALUES (4, N'Transferencia Recibida', 1)
SET IDENTITY_INSERT [dbo].[Tipo_Transaccion] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipo_Usuarios] ON 

INSERT [dbo].[Tipo_Usuarios] ([id], [descripcion], [estado]) VALUES (1, N'Usuario BOT', 1)
INSERT [dbo].[Tipo_Usuarios] ([id], [descripcion], [estado]) VALUES (2, N'Agente', 1)
INSERT [dbo].[Tipo_Usuarios] ([id], [descripcion], [estado]) VALUES (3, N'Administrador', 1)
SET IDENTITY_INSERT [dbo].[Tipo_Usuarios] OFF
GO
SET IDENTITY_INSERT [dbo].[Transacciones] ON 

INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (1, 1, 1, CAST(13.00 AS Decimal(13, 2)), CAST(N'2023-04-05T18:31:44.687' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (2, 4, 1, CAST(22.00 AS Decimal(13, 2)), CAST(N'2023-04-05T18:31:44.687' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (3, 5, 1, CAST(11.00 AS Decimal(13, 2)), CAST(N'2023-04-05T18:31:44.687' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (4, 1, 1, CAST(5.50 AS Decimal(13, 2)), CAST(N'2023-04-05T18:35:44.687' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (5, 4, 2, CAST(2.00 AS Decimal(13, 2)), CAST(N'2023-04-05T20:31:45.687' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (6, 5, 1, CAST(10.00 AS Decimal(13, 2)), CAST(N'2023-04-12T17:49:19.533' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (7, 5, 1, CAST(5.00 AS Decimal(13, 2)), CAST(N'2023-04-12T17:54:43.270' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (8, 5, 1, CAST(45.00 AS Decimal(13, 2)), CAST(N'2023-04-12T18:02:29.720' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (9, 5, 1, CAST(10.00 AS Decimal(13, 2)), CAST(N'2023-04-12T18:16:14.570' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (10, 5, 1, CAST(10.00 AS Decimal(13, 2)), CAST(N'2023-04-12T18:16:53.390' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (11, 5, 1, CAST(10.00 AS Decimal(13, 2)), CAST(N'2023-04-12T18:21:17.587' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (12, 5, 1, CAST(10.00 AS Decimal(13, 2)), CAST(N'2023-04-12T18:21:35.790' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (13, 5, 1, CAST(10.00 AS Decimal(13, 2)), CAST(N'2023-04-12T18:24:50.037' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (14, 5, 2, CAST(10.00 AS Decimal(13, 2)), CAST(N'2023-04-12T18:25:15.047' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (15, 5, 2, CAST(10.00 AS Decimal(13, 2)), CAST(N'2023-04-12T18:25:36.223' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (16, 6, 1, CAST(0.00 AS Decimal(13, 2)), CAST(N'2023-04-19T09:53:35.973' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (17, 6, 1, CAST(20.00 AS Decimal(13, 2)), CAST(N'2023-04-19T14:52:59.707' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (18, 6, 3, CAST(1010.00 AS Decimal(13, 2)), CAST(N'2023-04-19T15:08:18.627' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (19, 1, 4, CAST(1010.00 AS Decimal(13, 2)), CAST(N'2023-04-19T15:08:19.197' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (20, 1, 4, CAST(1010.00 AS Decimal(13, 2)), CAST(N'2023-04-19T15:08:19.197' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (21, 1, 3, CAST(1010.00 AS Decimal(13, 2)), CAST(N'2023-04-19T15:08:19.197' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (22, 6, 3, CAST(10.00 AS Decimal(13, 2)), CAST(N'2023-04-19T15:15:33.090' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (23, 1, 4, CAST(10.00 AS Decimal(13, 2)), CAST(N'2023-04-19T15:15:57.527' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (24, 1, 4, CAST(10.00 AS Decimal(13, 2)), CAST(N'2023-04-19T15:16:59.307' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (25, 1, 4, CAST(10.00 AS Decimal(13, 2)), CAST(N'2023-04-19T15:17:22.740' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (26, 1, 4, CAST(10.10 AS Decimal(13, 2)), CAST(N'2023-04-19T15:19:32.110' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (27, 6, 3, CAST(10.30 AS Decimal(13, 2)), CAST(N'2023-04-19T15:24:26.180' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (28, 1, 4, CAST(10.30 AS Decimal(13, 2)), CAST(N'2023-04-19T15:24:26.217' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (30, 8, 1, CAST(0.00 AS Decimal(13, 2)), CAST(N'2023-04-26T10:36:02.967' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (31, 1, 1, CAST(2.00 AS Decimal(13, 2)), CAST(N'2023-04-26T14:06:24.353' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (32, 1, 1, CAST(2.00 AS Decimal(13, 2)), CAST(N'2023-04-26T14:06:52.387' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (33, 2, 1, CAST(2.00 AS Decimal(13, 2)), CAST(N'2023-04-26T14:09:55.687' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (34, 8, 1, CAST(2.00 AS Decimal(13, 2)), CAST(N'2023-04-26T14:13:42.540' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (35, 8, 1, CAST(2.00 AS Decimal(13, 2)), CAST(N'2023-04-26T16:11:44.453' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (36, 8, 1, CAST(1.00 AS Decimal(13, 2)), CAST(N'2023-04-26T17:28:01.053' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (37, 8, 1, CAST(1.00 AS Decimal(13, 2)), CAST(N'2023-04-26T19:31:23.460' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (38, 8, 1, CAST(1.00 AS Decimal(13, 2)), CAST(N'2023-04-26T19:33:16.420' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (39, 8, 1, CAST(20.50 AS Decimal(13, 2)), CAST(N'2023-04-26T21:10:35.907' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (41, 10, 1, CAST(0.00 AS Decimal(13, 2)), CAST(N'2023-05-03T18:43:19.727' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (42, 11, 1, CAST(0.00 AS Decimal(13, 2)), CAST(N'2023-05-04T11:42:16.547' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (43, 11, 1, CAST(5.00 AS Decimal(13, 2)), CAST(N'2023-05-04T11:46:45.287' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (44, 10, 1, CAST(5.00 AS Decimal(13, 2)), CAST(N'2023-05-04T12:34:57.717' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (45, 10, 3, CAST(1.00 AS Decimal(13, 2)), CAST(N'2023-05-04T12:35:09.627' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (46, 11, 4, CAST(1.00 AS Decimal(13, 2)), CAST(N'2023-05-04T12:35:09.720' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (47, 11, 3, CAST(1.00 AS Decimal(13, 2)), CAST(N'2023-11-13T19:19:16.243' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (48, 10, 4, CAST(1.00 AS Decimal(13, 2)), CAST(N'2023-11-13T19:19:19.067' AS DateTime))
INSERT [dbo].[Transacciones] ([id], [id_usuario], [tipo], [monto], [fechaCreacion]) VALUES (49, 11, 1, CAST(2.00 AS Decimal(13, 2)), CAST(N'2023-11-14T13:33:57.953' AS DateTime))
SET IDENTITY_INSERT [dbo].[Transacciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([id], [DNI], [nombres], [apellidos], [celular], [contraseña], [tipo], [estado], [fechaCreacion], [correo]) VALUES (1, N'12457845', N'sebastian', N'diaz', N'+51963739612', N'VeOpCubsFLdjHdoXx5Df9A==', 1, 1, CAST(N'2023-04-05T18:31:44.687' AS DateTime), N' ')
INSERT [dbo].[Usuarios] ([id], [DNI], [nombres], [apellidos], [celular], [contraseña], [tipo], [estado], [fechaCreacion], [correo]) VALUES (2, N'12345678', N'Sebastiannnn', N'Diaz', N'963739444', N'Bj5X5fslzj/9Tnu292I+mg==', 3, 1, CAST(N'2023-04-05T18:31:44.687' AS DateTime), N'sebastian.dm.08@gmail.com')
INSERT [dbo].[Usuarios] ([id], [DNI], [nombres], [apellidos], [celular], [contraseña], [tipo], [estado], [fechaCreacion], [correo]) VALUES (4, N'11223344', N'Lucero', N'Paiva', N'+111222333', N'asd123', 1, 2, CAST(N'2023-04-06T11:36:53.770' AS DateTime), N'')
INSERT [dbo].[Usuarios] ([id], [DNI], [nombres], [apellidos], [celular], [contraseña], [tipo], [estado], [fechaCreacion], [correo]) VALUES (5, N'14521254', N'Aemlia', N'Mendoza', N'+51456123789', N'Bj5X5fslzj/9Tnu292I+mg==', 1, 1, CAST(N'2023-04-06T15:58:28.673' AS DateTime), N'')
INSERT [dbo].[Usuarios] ([id], [DNI], [nombres], [apellidos], [celular], [contraseña], [tipo], [estado], [fechaCreacion], [correo]) VALUES (6, N'76530685', N'Fred David', N'Diaz Rios', N'+3', N'VeOpCubsFLdjHdoXx5Df9A==', 1, 1, CAST(N'2023-04-18T17:01:06.003' AS DateTime), N'')
INSERT [dbo].[Usuarios] ([id], [DNI], [nombres], [apellidos], [celular], [contraseña], [tipo], [estado], [fechaCreacion], [correo]) VALUES (8, N'12451245', N'Test', N'Agente', N'+51989105678', N'V7sJCx1bPA72AePgklxLdA==', 2, 1, CAST(N'2023-04-26T10:36:02.963' AS DateTime), N'cebada081408@gmail.com')
INSERT [dbo].[Usuarios] ([id], [DNI], [nombres], [apellidos], [celular], [contraseña], [tipo], [estado], [fechaCreacion], [correo]) VALUES (10, N'76530690', N'MIGUEL', N'TEJADA', N'+51987286862', N'VeOpCubsFLdjHdoXx5Df9A==', 1, 1, CAST(N'2023-05-03T18:43:19.723' AS DateTime), N'')
INSERT [dbo].[Usuarios] ([id], [DNI], [nombres], [apellidos], [celular], [contraseña], [tipo], [estado], [fechaCreacion], [correo]) VALUES (11, N'76530684', N'SEBASTIAN DAVID', N'DIAZ MUÑOZ', N'+51963739613', N'VeOpCubsFLdjHdoXx5Df9A==', 1, 1, CAST(N'2023-05-04T11:42:16.540' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Balance]  WITH CHECK ADD  CONSTRAINT [FK_Balance_Usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuarios] ([id])
GO
ALTER TABLE [dbo].[Balance] CHECK CONSTRAINT [FK_Balance_Usuarios]
GO
ALTER TABLE [dbo].[Codigos]  WITH CHECK ADD  CONSTRAINT [FK_Codigos_Estado] FOREIGN KEY([estado])
REFERENCES [dbo].[Estado] ([id])
GO
ALTER TABLE [dbo].[Codigos] CHECK CONSTRAINT [FK_Codigos_Estado]
GO
ALTER TABLE [dbo].[Mensajeria]  WITH CHECK ADD  CONSTRAINT [FK_Mensajeria_Estado] FOREIGN KEY([estado])
REFERENCES [dbo].[Estado] ([id])
GO
ALTER TABLE [dbo].[Mensajeria] CHECK CONSTRAINT [FK_Mensajeria_Estado]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [FK_Transacciones_Tipo_Transaccion] FOREIGN KEY([tipo])
REFERENCES [dbo].[Tipo_Transaccion] ([id])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [FK_Transacciones_Tipo_Transaccion]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [FK_Transacciones_Usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuarios] ([id])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [FK_Transacciones_Usuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Estado] FOREIGN KEY([estado])
REFERENCES [dbo].[Estado] ([id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Estado]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Tipo_Usuarios] FOREIGN KEY([tipo])
REFERENCES [dbo].[Tipo_Usuarios] ([id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Tipo_Usuarios]
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_Contrasenia]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Actualizar_Contrasenia]
@emisor varchar(100)
AS

DECLARE @resultado NVARCHAR(MAX)

SELECT @resultado = body
FROM [WALLET].[dbo].[Mensajeria]
WHERE id_flujo IN (42) AND emisor = @emisor AND estado = 1
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_Solicitud]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Actualizar_Solicitud]
@estado int
AS

declare @id int
	set @id=(select top 1 id from solicitud where estado in (1,2))

declare @idUsuario int
	set @idUsuario=(select usuario from solicitud where id=@id)

declare @montoIngresado int
	set @montoIngresado=(select monto from solicitud where id=@id)

declare @tipo int
	set @tipo=(select tipo from solicitud where id=@id)

	--
	update Solicitud
	set estado=@estado
	where id=@id
	--
IF @tipo = 1 BEGIN    
	IF @estado = 3 BEGIN    
	EXEC [dbo].[SP_Registrar_Transaccion_Ingreso]
		@id = @idUsuario,
		@tipo = 1,
		@monto = @montoIngresado
	END 
END 

IF @tipo = 2 BEGIN    
	IF @estado = 3 BEGIN    
	EXEC [dbo].[SP_Registrar_Transaccion_Retiro]
		@id = @idUsuario,
		@tipo = 1,
		@monto = @montoIngresado
	END 
END 

GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_Usuario]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[SP_Actualizar_Usuario]
@id int,
@dni varchar(50),
@nombres varchar(50),
@apellidos varchar(500),
@celular varchar(500),
@contraseña varchar(500),
@correo varchar(500)
AS
	update Usuarios
	set DNI=@dni,
		nombres=@nombres,
		apellidos=@apellidos,
		celular=@celular,
		contraseña=@contraseña,
		correo=@correo
	where id=@id
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_Usuario_Billetera]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Actualizar_Usuario_Billetera]
@id int,
@dni varchar(50),
@nombres varchar(200),
@apellidos varchar(200),
@celular varchar(200),
@estado int
AS
update Usuarios
set DNI=@dni,nombres=@nombres,apellidos=@apellidos,celular=@celular,estado=@estado
where id=@id
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_Codigo]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[SP_Buscar_Codigo]
@numero varchar(100)
AS

select codigo from codigos where numero=@numero
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_CodigoXEmisor]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Buscar_CodigoXEmisor]
@emisor varchar(100) 
AS

	select top(1) codigo from codigos where numero=@emisor order by id desc
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_Datos_Balance]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Buscar_Datos_Balance]

AS
  select B.*,u.nombres+' '+u.apellidos as NombreCompleto,'S/. '+CONVERT(VARCHAR, B.balance) AS balanceSoles from Balance B inner join Usuarios U on b.id_usuario=u.id
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_Datos_Dashboard]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Buscar_Datos_Dashboard]

AS

	WITH Meses AS (
    SELECT 1 AS mes
    UNION SELECT 2
    UNION SELECT 3
    UNION SELECT 4
    UNION SELECT 5
    UNION SELECT 6
    UNION SELECT 7
    UNION SELECT 8
    UNION SELECT 9
    UNION SELECT 10
    UNION SELECT 11
    UNION SELECT 12
)
SELECT
    Meses.mes,
    COALESCE(COUNT(t.fechaCreacion), 0) AS cantidad
FROM
    Meses
LEFT JOIN
    [WALLET].[dbo].[Transacciones] t ON MONTH(t.fechaCreacion) = Meses.mes
GROUP BY
    Meses.mes
ORDER BY
    Meses.mes;
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_Datos_Monto_Transferir]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Buscar_Datos_Monto_Transferir]
@emisor varchar(100)
AS

	select body FROM [WALLET].[dbo].[Mensajeria] where id_flujo in (24,22) and emisor=@emisor and estado=1
	order by id desc
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_Datos_Nuevo_Usuario]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Buscar_Datos_Nuevo_Usuario]
@emisor varchar(100)
AS

	select body FROM [WALLET].[dbo].[Mensajeria] where id_flujo in (4,5,6,7,9) and emisor=@emisor and estado=1
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_Datos_Transaccion]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Buscar_Datos_Transaccion]

AS
  select T.*,TT.descripcion as descripcionTipo,u.nombres+' '+u.apellidos as NombreCompleto,'S/. ' + CONVERT(VARCHAR, t.monto) AS montoSoles from transacciones T 
  INNER JOIN Tipo_Transaccion TT on TT.id=t.tipo
  LEFT JOIN Usuarios U on U.id=T.id_usuario
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_Datos_Validacion_RENIEC]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Buscar_Datos_Validacion_RENIEC]
@emisor varchar(100)
AS

	select body FROM [WALLET].[dbo].[Mensajeria] where id_flujo in (4,5,6,7,8) and emisor=@emisor and estado=1
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_Datos_Validar_Usuario]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Buscar_Datos_Validar_Usuario]
@emisor varchar(100)
AS

	select body FROM [WALLET].[dbo].[Mensajeria] where id_flujo in (20,21) and emisor=@emisor and estado=1
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_Datos_Validar_Usuario2]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Buscar_Datos_Validar_Usuario2]
@emisor varchar(100)
AS

	select body FROM [WALLET].[dbo].[Mensajeria] where id_flujo in (40,41) and emisor=@emisor and estado=1
	order by 1 asc
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_FlujoXID]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[SP_Buscar_FlujoXID]
@id int 
AS

	select * from Flujos where id=@id
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_MontoXID]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[SP_Buscar_MontoXID]
@id int
AS

select balance from Balance where id_usuario=@id
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_Posible_Solicitud]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[SP_Buscar_Posible_Solicitud]
AS

select top 1 tipo FROM [WALLET].[dbo].[Solicitud] where estado in (1,2)
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_RespuestaValidacion]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Buscar_RespuestaValidacion]
@id int,
@monto decimal(15,2)
AS

select estado from solicitud where usuario=@id and monto=@monto and estado in (3,4)
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_Ultimas3TransaccionesXID]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[SP_Buscar_Ultimas3TransaccionesXID]
@id int
AS

select top(3)* from transacciones where id_usuario=@id order by 1 desc
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_Ultimas5TransaccionesXID]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Buscar_Ultimas5TransaccionesXID]
@id int
AS

select top(5)* from transacciones where id_usuario=@id order by 1 desc
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_Ultimo_Mensaje_X_EMISOR]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Buscar_Ultimo_Mensaje_X_EMISOR]
@emisor varchar(50) 
AS
	select top(1) * from Mensajeria where receptor=@emisor AND estado=1 order by 1 desc
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_Ultimo_Mensaje_X_EMISOR_aux]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[SP_Buscar_Ultimo_Mensaje_X_EMISOR_aux]
@emisor varchar(50) 
AS
	select top(1) * from Mensajeria where emisor=@emisor AND estado=1 order by 1 desc
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_UsuarioXCelular]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Buscar_UsuarioXCelular]
@celular varchar(500)
AS

select u.*,b.balance from usuarios u 
inner join balance b on u.id=b.id_usuario
where celular like '%'+@celular+'%'
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_UsuarioXCorreo]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Buscar_UsuarioXCorreo]
@correo varchar(100)
AS

select * from usuarios where estado=1 and tipo in (2,3) and correo=@correo
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_UsuarioXDNI]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Buscar_UsuarioXDNI]
@dni varchar(100)
AS

select * from usuarios where dni=@dni and estado=1 and tipo in (1,2)
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_UsuarioXID]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[SP_Buscar_UsuarioXID]
@id int
AS

select * from usuarios where id=@id
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_ValidacionEnEspera]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Buscar_ValidacionEnEspera]
AS

select top 1 CAST(monto AS int) from solicitud where estado=1 and tipo=1 order by 1 asc
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_ValidarYapeUltimo]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Buscar_ValidarYapeUltimo]
@monto varchar(10)
AS

 declare @id int
	set @id=(select top 1 id from solicitud where estado in (1,2))

select count(*) from solicitud where id=@id and monto like '%'+@monto+'%'
GO
/****** Object:  StoredProcedure [dbo].[SP_Cerrar_Flujo]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Cerrar_Flujo]
@numero varchar(100)
AS

UPDATE Mensajeria
SET estado = 0
WHERE numeroContacto = @numero
    OR emisor LIKE '%' + @numero + '%'
    OR receptor LIKE '%' + @numero + '%'
GO
/****** Object:  StoredProcedure [dbo].[SP_Contar_Emitido_Monto]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Contar_Emitido_Monto]
AS

select SUM(MONTO) from transacciones where tipo=2
GO
/****** Object:  StoredProcedure [dbo].[SP_Contar_Recibido_Monto]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[SP_Contar_Recibido_Monto]
AS

select SUM(MONTO) from transacciones where tipo=1
GO
/****** Object:  StoredProcedure [dbo].[SP_Contar_Transacciones]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Contar_Transacciones]
AS

select count(*) from transacciones
GO
/****** Object:  StoredProcedure [dbo].[SP_Contar_Ultimas5CuentasCreadas]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[SP_Contar_Ultimas5CuentasCreadas]
AS

select top(5) * from Usuarios where tipo=1 and estado=1 order by 1 desc
GO
/****** Object:  StoredProcedure [dbo].[SP_Contar_Ultimas5MovimientosRealizados]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Contar_Ultimas5MovimientosRealizados]
AS

select top(5) t.*, u.nombres +' ' + u.apellidos as nombreUsuario from transacciones t
inner join Usuarios u on t.id_usuario=u.id
order by 1 desc
GO
/****** Object:  StoredProcedure [dbo].[SP_Contar_UsuariosActivos]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[SP_Contar_UsuariosActivos]
AS

select count(*) from Usuarios where tipo=1 and estado=1
GO
/****** Object:  StoredProcedure [dbo].[SP_Generar_Codigo]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Generar_Codigo]
@numero varchar(100)
AS

declare @randomNumer int

set @randomNumer=(SELECT ROUND(((999999 - 111111) * RAND() + 111111), 0))

	insert into Codigos([numero]
      ,[codigo]
      ,[fechaCreacion]
      ,[estado])
	values(@numero,@randomNumer,GETDATE(),1)


	
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_SolicitudXID]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Listar_SolicitudXID]
@id int
AS

select * from solicitud where usuario=@id
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Usuarios]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Listar_Usuarios]

AS

select u.*,b.balance,t.tipo,t.monto,t.fechaCreacion from Usuarios u
inner join balance b on u.id=b.id_usuario
inner join transacciones t on t.id_usuario=u.id
where u.tipo in (1,2) and t.fechaCreacion=(SELECT max(t2.fechaCreacion)
FROM transacciones t2
where t2.id_usuario=u.id)
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_CelularXID]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[SP_Obtener_CelularXID]
AS
declare @idUsuario int
	set @idUsuario=(select top 1 tipo FROM [WALLET].[dbo].[Solicitud] where estado in (1,2))

select RIGHT(celular, LEN(celular) - 3) from Usuarios where id=8
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_MontoAYapear]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[SP_Obtener_MontoAYapear]
AS
select top 1 CAST(monto AS int) FROM [WALLET].[dbo].[Solicitud] where estado in (1,2)
GO
/****** Object:  StoredProcedure [dbo].[SP_Registrar_Mensaje]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Registrar_Mensaje]
@emisor varchar(50),
@receptor varchar(50),
@body varchar(500),
@id_flujo int,
@numeroContacto varchar(500)
AS
	insert into Mensajeria (emisor, receptor, body, id_flujo, fechaCreacion, estado, numeroContacto)
	values (@emisor, @receptor, @body, @id_flujo, GETDATE(),1, @numeroContacto)
GO
/****** Object:  StoredProcedure [dbo].[SP_Registrar_Solicitud]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Registrar_Solicitud]
@id int,
@monto decimal(15,2),
@tipo int
AS
	insert into Solicitud (monto, usuario, estado, fechaCreacion, tipo)
	values (@monto,@id,1,GETDATE(),@tipo)
GO
/****** Object:  StoredProcedure [dbo].[SP_Registrar_Transaccion_Ingreso]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Registrar_Transaccion_Ingreso]
@id int,
@tipo int,
@monto decimal(13, 2)
AS
	insert into Transacciones(id_usuario, tipo, monto, fechaCreacion)
	values (@id,@tipo,@monto,GETDATE())

	update Balance
	set balance=balance+@monto
	where id_usuario=@id
GO
/****** Object:  StoredProcedure [dbo].[SP_Registrar_Transaccion_Retiro]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Registrar_Transaccion_Retiro]
@id int,
@tipo int,
@monto decimal(13, 2)
AS
	insert into Transacciones(id_usuario, tipo, monto, fechaCreacion)
	values (@id,@tipo,@monto,GETDATE())

	update Balance
	set balance=balance-@monto
	where id_usuario=@id
GO
/****** Object:  StoredProcedure [dbo].[SP_Registrar_Transaccion_Transferencia_Enviada]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Registrar_Transaccion_Transferencia_Enviada]
@id int,
@tipo int,
@monto decimal(13, 2)
AS
	insert into Transacciones(id_usuario, tipo, monto, fechaCreacion)
	values (@id,@tipo,@monto,GETDATE())

	update Balance
	set balance=balance-@monto
	where id_usuario=@id
GO
/****** Object:  StoredProcedure [dbo].[SP_Registrar_Transaccion_Transferencia_Recibida]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Registrar_Transaccion_Transferencia_Recibida]
@id int,
@tipo int,
@monto decimal(13, 2)
AS
	insert into Transacciones(id_usuario, tipo, monto, fechaCreacion)
	values (@id,@tipo,@monto,GETDATE())

	update Balance
	set balance=balance+@monto
	where id_usuario=@id
GO
/****** Object:  StoredProcedure [dbo].[SP_Registrar_Usuario]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Registrar_Usuario]
@dni varchar(50),
@nombres varchar(50),
@apellidos varchar(500),
@celular varchar(500),
@contraseña varchar(500),
@tipo int
AS
	insert into Usuarios (DNI, nombres, apellidos, celular, contraseña, tipo, estado, fechaCreacion, correo)
	values (@dni,@nombres,@apellidos,@celular,@contraseña,@tipo,1,GETDATE(),'')

	declare @idUsuario int
	set @idUsuario=(select id from Usuarios where DNI=@dni and nombres=@nombres and apellidos=@apellidos and celular=@celular)

	insert into Balance(id_usuario,balance)
	values(@idUsuario,0)

	insert into Transacciones(id_usuario,tipo,monto,fechaCreacion)
	values(@idUsuario,1,0,GETDATE())
GO
/****** Object:  StoredProcedure [dbo].[SP_Registrar_Usuario2]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Registrar_Usuario2]
@dni varchar(50),
@nombres varchar(50),
@apellidos varchar(500),
@celular varchar(500),
@contraseña varchar(500),
@correo varchar(500),
@tipo int
AS
	insert into Usuarios (DNI, nombres, apellidos, celular, contraseña, tipo, estado, fechaCreacion, correo)
	values (@dni,@nombres,@apellidos,@celular,@contraseña,@tipo,1,GETDATE(),@correo)

	declare @idUsuario int
	set @idUsuario=(select id from Usuarios where DNI=@dni and nombres=@nombres and apellidos=@apellidos and celular=@celular)

	insert into Balance(id_usuario,balance)
	values(@idUsuario,0)

	insert into Transacciones(id_usuario,tipo,monto,fechaCreacion)
	values(@idUsuario,1,0,GETDATE())
GO
/****** Object:  StoredProcedure [dbo].[SP_Siguiente_Flujo]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Siguiente_Flujo]
@id int 
AS

declare @getOrdern int
declare @getHeaderFlujo int

set @getOrdern=(select orden from Flujos where @id=id)
set @getHeaderFlujo=(select id_HeaderFlujo from Flujos where @id=id)

	select * from Flujos where id_HeaderFlujo=@getHeaderFlujo and orden=@getOrdern
GO
/****** Object:  StoredProcedure [dbo].[SP_Validar_Solicitud]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Validar_Solicitud]
AS

	select count(*) from solicitud where estado in (1,2)
GO
/****** Object:  StoredProcedure [dbo].[SP_Validar_UsuarioXSMS]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[SP_Validar_UsuarioXSMS]
@dni varchar(100),
@contraseña varchar(100)
AS

	select * from Usuarios where tipo=1 and estado=1 and dni=@dni and contraseña=@contraseña
GO
/****** Object:  StoredProcedure [dbo].[SP_ValidarRecarga_Solicitud]    Script Date: 14/11/2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_ValidarRecarga_Solicitud]
AS

	select count(*) from solicitud where estado in (1,2)
GO
USE [master]
GO
ALTER DATABASE [WALLET] SET  READ_WRITE 
GO
