USE [UNDERAGE_FINGERPRINTS]
GO
/****** Object:  Table [dbo].[MunicipioNacimiento]    Script Date: 8/31/2022 1:56:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MunicipioNacimiento](
	[idMunicipio] [int] NOT NULL,
	[idDepartamento] [int] NOT NULL,
	[nombre] [varchar](35) NOT NULL,
 CONSTRAINT [PK__Municipi__3132BB9804C1FD16] PRIMARY KEY CLUSTERED 
(
	[idMunicipio] ASC,
	[idDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaisNacimiento]    Script Date: 8/31/2022 1:56:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaisNacimiento](
	[idPais] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](35) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (1, 1, N'GUATEMALA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (1, 2, N'GUASTATOYA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (1, 3, N'ANTIGUA GUATEMALA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (1, 4, N'CHIMALTENANGO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (1, 5, N'ESCUINTLA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (1, 6, N'CUILAPA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (1, 7, N'SOLOLÁ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (1, 8, N'TOTONICAPÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (1, 9, N'QUETZALTENANGO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (1, 10, N'MAZATENANGO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (1, 11, N'RETALHULEU')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (1, 12, N'SAN MARCOS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (1, 13, N'HUEHUETENANGO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (1, 14, N'SANTA CRUZ DEL QUICHÉ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (1, 15, N'SALAMÁ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (1, 16, N'COBÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (1, 17, N'FLORES')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (1, 18, N'PUERTO BARRIOS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (1, 19, N'ZACAPA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (1, 20, N'CHIQUIMULA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (1, 21, N'JALAPA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (1, 22, N'JUTIAPA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (2, 1, N'SANTA CATARINA PINULA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (2, 2, N'MORAZÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (2, 3, N'JOCOTENANGO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (2, 4, N'SAN JOSÉ POAQUIL')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (2, 5, N'SANTA  LUCIA COTZUMALGUAPA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (2, 6, N'BARBERENA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (2, 7, N'SAN JOSÉ CHACAYA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (2, 8, N'SAN CRISTÓBAL TOTONICAPÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (2, 9, N'SALCAJÁ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (2, 10, N'CUYOTENANGO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (2, 11, N'SAN SEBASTIÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (2, 12, N'SAN PEDRO SACATEPÉQUEZ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (2, 13, N'CHIANTLA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (2, 14, N'CHICHÉ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (2, 15, N'SAN MIGUEL CHICAJ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (2, 16, N'SANTA CRÚZ VERAPAZ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (2, 17, N'SAN JOSÉ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (2, 18, N'LIVINGSTON')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (2, 19, N'ESTANZUELA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (2, 20, N'SAN JOSÉ LA ARADA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (2, 21, N'SAN PEDRO PINULA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (2, 22, N'EL  PROGRESO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (3, 1, N'SAN JOSÉ PINULA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (3, 2, N'SAN AGUSTÍN ACASAGUASTLÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (3, 3, N'PASTORES')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (3, 4, N'SAN MARTÍN JILOTEPEQUE')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (3, 5, N'LA DEMOCRACIA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (3, 6, N'SANTA ROSA DE LIMA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (3, 7, N'SANTA MARÍA VISITACIÓN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (3, 8, N'SAN FRANCISCO EL ALTO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (3, 9, N'OLINTEPEQUE')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (3, 10, N'SAN FRANCISCO ZAPOTITLÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (3, 11, N'SANTA CRUZ MULUÁ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (3, 12, N'SAN ANTONIO SACATEPÉQUEZ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (3, 13, N'MALACATANCITO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (3, 14, N'CHINIQUE')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (3, 15, N'RABINAL')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (3, 16, N'SAN CRISTÓBAL VERAPAZ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (3, 17, N'SAN BENITO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (3, 18, N'EL ESTOR')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (3, 19, N'RÍO HONDO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (3, 20, N'SAN  JUAN  ERMITA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (3, 21, N'SAN LUIS JILOTEPEQUE')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (3, 22, N'SANTA CATARINA MITA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (4, 1, N'SAN JOSÉ DEL GOLFO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (4, 2, N'SAN CRISTÓBAL ACASAGUASTLÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (4, 3, N'SUMPANGO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (4, 4, N'SAN JUAN COMALAPA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (4, 5, N'SIQUINALA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (4, 6, N'CASILLAS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (4, 7, N'SANTA LUCIA UTATLÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (4, 8, N'SAN ANDRÉS XECUL')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (4, 9, N'SAN CARLOS SIJA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (4, 10, N'SAN BERNARDINO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (4, 11, N'SAN MARTIN ZAPOTITLÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (4, 12, N'COMITANCILLO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (4, 13, N'CUILCO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (4, 14, N'ZACUALPA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (4, 15, N'CUBULCO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (4, 16, N'TACTIC')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (4, 17, N'SAN ANDRÉS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (4, 18, N'MORALES')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (4, 19, N'GUALÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (4, 20, N'JOCOTÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (4, 21, N'SAN MANUEL CHAPARRON')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (4, 22, N'AGUA BLANCA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (5, 1, N'PALENCIA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (5, 2, N'EL JICARO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (5, 3, N'SANTO DOMINGO XENACOJ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (5, 4, N'SANTA APOLONIA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (5, 5, N'MASAGUA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (5, 6, N'SAN RAFAEL LAS FLORES')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (5, 7, N'NAHUALA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (5, 8, N'MOMOSTENANGO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (5, 9, N'SIBILIA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (5, 10, N'SAN JOSÉ EL ÍDOLO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (5, 11, N'SAN FELIPE')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (5, 12, N'SAN MIGUEL IXTAHUACÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (5, 13, N'NENTÓN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (5, 14, N'CHAJUL')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (5, 15, N'GRANADOS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (5, 16, N'TAMAHÚ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (5, 17, N'LA LIBERTAD')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (5, 18, N'LOS AMATES')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (5, 19, N'TECULUTÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (5, 20, N'CAMOTÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (5, 21, N'SAN CARLOS ALZATATE')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (5, 22, N'ASUNCIÓN MITA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (6, 1, N'CHINAUTLA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (6, 2, N'SANSARE')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (6, 3, N'SANTIAGO SACATEPÉQUEZ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (6, 4, N'TECPÁN GUATEMALA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (6, 5, N'TIQUISATE')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (6, 6, N'ORATORIO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (6, 7, N'SANTA CATARINA IXTAHUACÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (6, 8, N'SANTA MARIA CHIQUIMULA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (6, 9, N'CABRICAN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (6, 10, N'SANTO DOMINGO SUCHITEPÉQUEZ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (6, 11, N'SAN ANDRÉS VILLA SECA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (6, 12, N'CONCEPCIÓN TUTUAPA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (6, 13, N'SAN PEDRO NECTA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (6, 14, N'CHICHICASTENANGO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (6, 15, N'SANTA CRUZ EL CHOL')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (6, 16, N'TUCURÚ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (6, 17, N'SAN FRANCISCO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (6, 19, N'USUMATLÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (6, 20, N'OLOPA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (6, 21, N'MONJAS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (6, 22, N'YUPILTEPEQUE')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (7, 1, N'SAN PEDRO AYAMPUC')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (7, 2, N'SANARATE')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (7, 3, N'SAN BARTÓLOME MILPAS ALTAS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (7, 4, N'PATZÚN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (7, 5, N'LA GOMERA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (7, 6, N'SAN JUAN TECUACO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (7, 7, N'SANTA CLARA LA LAGUNA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (7, 8, N'SANTA LUCIA LA REFORMA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (7, 9, N'CAJOLÁ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (7, 10, N'SAN LORENZO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (7, 11, N'CHAMPERICO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (7, 12, N'TACANÁ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (7, 13, N'JACALTENANGO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (7, 14, N'PATZITE')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (7, 15, N'SAN JERÓNIMO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (7, 16, N'PANZOS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (7, 17, N'SANTA ANA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (7, 19, N'CABAÑAS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (7, 20, N'ESQUIPULAS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (7, 21, N'MATAQUESCUINTLA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (7, 22, N'ATESCATEMPA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (8, 1, N'MIXCO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (8, 2, N'SAN ANTONIO LA PAZ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (8, 3, N'SAN LUCAS SACATEPÉQUEZ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (8, 4, N'SAN MIGUEL POCHUTA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (8, 5, N'GUANAGAZAPA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (8, 6, N'CHIQUIMULILLA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (8, 7, N'CONCEPCIÓN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (8, 8, N'SAN BARTÓLO AGUAS CALIENTES')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (8, 9, N'SAN MIGUEL SIGILA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (8, 10, N'SAMAYAC')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (8, 11, N'NUEVO SAN CARLOS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (8, 12, N'SIBINAL')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (8, 13, N'SAN PEDRO SOLOMA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (8, 14, N'SAN ANTONIO ILOTENANGO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (8, 15, N'PURULHA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (8, 16, N'SENAHÚ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (8, 17, N'DOLORES')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (8, 19, N'SAN DIEGO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (8, 20, N'CONCEPCIÓN LAS MINAS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (8, 22, N'JEREZ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (9, 1, N'SAN PEDRO SACATEPÉQUEZ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (9, 3, N'SANTA LUCÍA MILPAS ALTAS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (9, 4, N'PATZICIA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (9, 5, N'SAN JOSE')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (9, 6, N'TAXISCO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (9, 7, N'SAN ANDRES SEMETABAJ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (9, 9, N'OSTUNCALCO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (9, 10, N'SAN PABLO JOCOPILAS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (9, 11, N'EL ASINTAL')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (9, 12, N'TAJUMULCO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (9, 13, N'SAN IDELFONSO IXTAHUACÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (9, 14, N'SAN PEDRO JOCOPILAS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (9, 16, N'SAN PEDRO CARCHA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (9, 17, N'SAN LUIS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (9, 19, N'LA UNIÓN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (9, 20, N'QUEZALTEPEQUE')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (9, 22, N'EL ADELANTO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (10, 1, N'SAN JUAN SACATEPÉQUEZ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (10, 3, N'MAGDALENA MILPAS ALTAS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (10, 4, N'SANTA CRUZ BALANYA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (10, 5, N'IZTAPA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (10, 6, N'SANTA MARIA IXHUATÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (10, 7, N'PANAJACHEL')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (10, 9, N'SAN MATEO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (10, 10, N'SAN ANTONIO SUCHITEPÉQUEZ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (10, 12, N'TEJUTLA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (10, 13, N'SANTA BÁRBARA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (10, 14, N'CUNEN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (10, 16, N'SAN JUAN CHAMELCO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (10, 17, N'SAYAXCHÉ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (10, 19, N'HUITE')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (10, 20, N'SAN JACINTO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (10, 22, N'ZAPOTITLÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (11, 1, N'SAN RAYMUNDO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (11, 3, N'SANTA MARÍA DE JESÚS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (11, 4, N'ACATENANGO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (11, 5, N'PALÍN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (11, 6, N'GUAZACAPÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (11, 7, N'SANTA CATARINA PALOPO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (11, 9, N'CONCEPCIÓN CHIQUIRICHAPA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (11, 10, N'SAN MIGUEL PANÁM')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (11, 12, N'SAN RAFAEL PIE DE LA CUESTA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (11, 13, N'LA LIBERTAD')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (11, 14, N'SAN JUAN COTZAL')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (11, 16, N'LANQUÍN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (11, 17, N'MELCHOR DE MENCOS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (11, 19, N'SAN JORGE')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (11, 20, N'IPALA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (11, 22, N'COMAPA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (12, 1, N'CHUARRANCHO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (12, 3, N'CIUDAD VIEJA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (12, 4, N'SAN PEDRO YEPOCAPA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (12, 5, N'SAN VICENTE PACAYA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (12, 6, N'SANTA CRUZ EL NARANJO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (12, 7, N'SAN ANTONIO PALOPO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (12, 9, N'SAN  MARTÍN SACATEPÉQUEZ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (12, 10, N'SAN GABRIEL')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (12, 12, N'NUEVO PROGRESO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (12, 13, N'LA DEMOCRACIA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (12, 14, N'JOYABAJ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (12, 16, N'CAHABÓN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (12, 17, N'POPTÚN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (12, 22, N'JALPATAGUA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (13, 1, N'FRAIJANES')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (13, 3, N'SAN MIGUEL DUEÑAS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (13, 4, N'SAN ANDRÉS ITZAPA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (13, 5, N'NUEVA CONCEPCIÓN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (13, 6, N'PUEBLO NUEVO VIÑAS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (13, 7, N'SAN LUCAS TOLIMÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (13, 9, N'ALMOLONGA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (13, 10, N'CHICACAO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (13, 12, N'EL TUMBADOR')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (13, 13, N'SAN MIGUEL ACATÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (13, 14, N'NEBAJ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (13, 16, N'CHISEC')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (13, 17, N'LAS CRUCES')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (13, 22, N'CONGUACO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (14, 1, N'AMATITLÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (14, 3, N'ALOTENANGO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (14, 4, N'PARRAMOS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (14, 5, N'SIPACATE')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (14, 6, N'NUEVA SANTA ROSA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (14, 7, N'SANTA CRUZ LA LAGUNA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (14, 9, N'CANTEL')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (14, 10, N'PATULUL')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (14, 12, N'EL RODEO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (14, 13, N'SAN RAFAEL LA INDEPENDENCIA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (14, 14, N'SAN ANDRES SAJCABAJA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (14, 16, N'CHAHAL')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (14, 17, N'EL CHAL')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (14, 22, N'MOYUTA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (15, 1, N'VILLA NUEVA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (15, 3, N'SAN ANTONIO AGUAS CALIENTES')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (15, 4, N'ZARAGOZA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (15, 7, N'SAN PABLO LA LAGUNA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (15, 9, N'HUITAN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (15, 10, N'SANTA BARBARA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (15, 12, N'MALACATÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (15, 13, N'TODOS LOS SANTOS CUCHUMATÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (15, 14, N'USPANTÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (15, 16, N'FRAY BARTOLOMÉ DE LAS CASAS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (15, 22, N'PASACO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (16, 1, N'VILLA CANALES')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (16, 3, N'SANTA CATARINA BARAHONA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (16, 4, N'EL TEJAR')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (16, 7, N'SAN MARCOS LA LAGUNA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (16, 9, N'ZUNIL')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (16, 10, N'SAN JUAN BAUTISTA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (16, 12, N'CATARINA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (16, 13, N'SAN JUAN ATITÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (16, 14, N'SACAPULAS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (16, 16, N'SANTA CATARINA LA TINTA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (16, 22, N'SAN JOSÉ ACATEMPA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (17, 1, N'SAN MIGUEL PETAPA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (17, 7, N'SAN JUAN LA LAGUNA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (17, 9, N'COLOMBA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (17, 10, N'SANTO TOMAS LA UNIÓN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (17, 12, N'AYUTLA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (17, 13, N'SANTA EULALIA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (17, 14, N'SAN BARTOLOMÉ JOCOTENANGO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (17, 16, N'RAXRUHÁ')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (17, 22, N'QUESADA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (18, 7, N'SAN PEDRO LA LAGUNA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (18, 9, N'SAN FRANCISCO LA UNIÓN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (18, 10, N'ZUNILITO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (18, 12, N'OCOS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (18, 13, N'SAN MATEO IXTATÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (18, 14, N'CANILLA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (19, 7, N'SANTIAGO ATITLÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (19, 9, N'EL PALMAR')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (19, 10, N'PUEBLO NUEVO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (19, 12, N'SAN PABLO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (19, 13, N'COLOTENANGO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (19, 14, N'CHICAMÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (20, 9, N'COATEPEQUE')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (20, 10, N'RIO BRAVO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (20, 12, N'EL QUETZAL')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (20, 13, N'SAN SEBASTIÁN HUEHUETENANGO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (20, 14, N'IXCÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (21, 9, N'GENOVA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (21, 10, N'SAN JOSÉ LA MÁQUINA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (21, 12, N'LA REFORMA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (21, 13, N'TECTITÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (21, 14, N'PACHALÚM')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (22, 9, N'FLORES COSTA CUCA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (22, 12, N'PAJAPITA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (22, 13, N'CONCEPCIÓN HUISTA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (23, 9, N'LA ESPERANZA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (23, 12, N'IXCHIGUÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (23, 13, N'SAN  JUAN IXCOY')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (24, 9, N'PALESTINA DE LOS ALTOS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (24, 12, N'SAN JOSÉ OJETENAM')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (24, 13, N'SAN ANTONIO HUISTA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (25, 12, N'SAN CRISTÓBAL CUCHO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (25, 13, N'SAN SEBASTIÁN COATAN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (26, 12, N'SIPACAPA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (26, 13, N'SANTA CRUZ BARILLAS')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (27, 12, N'ESQUIPULAS  PALO GORDO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (27, 13, N'AGUACATÁN')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (28, 12, N'RÍO BLANCO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (28, 13, N'SAN RAFAEL PETZAL')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (29, 12, N'SAN LORENZO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (29, 13, N'SAN GASPAR IXCHIL')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (30, 12, N'LA BLANCA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (30, 13, N'SANTIAGO CHIMALTENANGO')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (31, 13, N'SANTA ANA HUISTA')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (32, 13, N'UNIÓN CANTINIL')
GO
INSERT [dbo].[MunicipioNacimiento] ([idMunicipio], [idDepartamento], [nombre]) VALUES (33, 13, N'PETATÁN')
GO
SET IDENTITY_INSERT [dbo].[PaisNacimiento] ON 
GO
INSERT [dbo].[PaisNacimiento] ([idPais], [nombre]) VALUES (1, N'GUATEMALA')
GO
SET IDENTITY_INSERT [dbo].[PaisNacimiento] OFF
GO
ALTER TABLE [dbo].[MunicipioNacimiento]  WITH CHECK ADD  CONSTRAINT [FK__Municipio__idDep__29572725] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[DepartamentoNacimiento] ([idDepartamento])
GO
ALTER TABLE [dbo].[MunicipioNacimiento] CHECK CONSTRAINT [FK__Municipio__idDep__29572725]
GO
