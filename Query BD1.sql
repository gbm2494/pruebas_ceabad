USE [ceabad]
GO

/****** Object:  Table [dbo].[Persona]    Script Date: 13/11/2016 08:16:26 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Persona](
	[cedula] [varchar](10) NOT NULL,
	[nombre] [varchar](30) NULL,
	[apellido1] [varchar](30) NULL,
	[apellido2] [varchar](30) NULL,
	[tipoPersona] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Persona]  WITH CHECK ADD FOREIGN KEY([tipoPersona])
REFERENCES [dbo].[tipo_persona] ([id])
GO


