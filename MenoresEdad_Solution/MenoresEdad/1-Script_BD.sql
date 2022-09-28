-- DROP DATABASE UNDERAGE_FINGERPRINTS;
CREATE DATABASE UNDERAGE_FINGERPRINTS;
USE UNDERAGE_FINGERPRINTS;

CREATE TABLE PaisNacimiento(
	idPais int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	nombre varchar(35) NOT NULL,
	--estado char(1) NOT NULL
);

CREATE TABLE DepartamentoNacimiento(
	idDepartamento int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	nombre varchar(15) NOT NULL,
	--estado char(1) NOT NULL,
);

CREATE TABLE MunicipioNacimiento(
	idMunicipio int NOT NULL,
	idDepartamento int NOT NULL,
	nombre varchar(35) NOT NULL,
	--estado char(1) NOT NULL,
	PRIMARY KEY (idMunicipio, idDepartamento),

	FOREIGN KEY (idDepartamento) REFERENCES DepartamentoNacimiento(idDepartamento)
);

CREATE TABLE Genero(
	idGenero int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	nombre varchar(9) NULL,
);

/*CREATE TABLE PlantillaBiometrica(
	idPlantilla int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	fpPulgar1 varbinary(max) NULL,
	fpIndice1 varbinary(max) NULL,
	fpMedio1 varbinary(max) NULL,
	fpAnular1 varbinary(max) NULL,
	fpMenique varbinary(max) NULL,
	fpPulgar2 varbinary(max) NULL,
	fpIndice2 varbinary(max) NULL,
	fpMedio2 varbinary(max) NULL,
	fpAnular2 varbinary(max) NULL,
	fpMenique2 varbinary(max) NULL,
);*/

CREATE TABLE MenorEdad(
	CUIMenor BIGINT PRIMARY KEY NOT NULL, --This must be long 13 characters
	primerNombre varchar(35) NOT NULL,
	segundoNombre varchar(35) NOT NULL,
	tercerMasNombres varchar(50) NULL,
	primerApellido varchar(35) NOT NULL,
	segundoApellido varchar(35) NOT NULL,
	fechaNacimiento date NOT NULL,
	idGenero int NOT NULL,
	idPaisNacimiento int NOT NULL,
	idDepartamentoNac int NOT NULL, -- Este se buscara por medio del municipio con la llave del departamento al que pertenece
	idMunicipioNac int NOT NULL,
	--idPlantilla int NOT NULL,
	fotografia varbinary(MAX) NOT NULL,
	estatus char(1) NOT NULL,

	FOREIGN KEY (idGenero) REFERENCES Genero (idGenero),
	FOREIGN KEY(idPaisNacimiento) REFERENCES PaisNacimiento (idPais),
	FOREIGN KEY (idMunicipioNac, idDepartamentoNac) REFERENCES MunicipioNacimiento (idMunicipio, idDepartamento),
	--FOREIGN KEY (idPlantilla) REFERENCES PlantillaBiometrica (idPlantilla)
);

CREATE TABLE DedoMano(
	idDedoMano INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	nombreDedoMano VARCHAR(23) NOT NULL, --por el nombre quedo de esa longitud
);

CREATE TABLE HuellaDactilar(
	CUIMenor BIGINT NOT NULL,
	idDedoMano INT NOT NULL,
	template VARBINARY(MAX) NOT NULL,
	bitmapHuella VARBINARY(MAX) NOT NULL,

	PRIMARY KEY(CUIMenor, idDedoMano),  --llave compuesta

	--Foreign Key
	FOREIGN KEY (CUIMenor) REFERENCES MenorEdad (CUIMenor),
	FOREIGN KEY (idDedoMano) REFERENCES DedoMano (idDedoMano)
);


CREATE TABLE TipoDocumento(
	idTipoDocto int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	nombre varchar(35) NOT NULL,
	estado char(1) NULL,
);

CREATE TABLE Nacionalidad(
	idNacionalidad int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	nombre varchar(35) NOT NULL,
	estado char(1) NOT NULL,
);

CREATE TABLE DatosPadre(
	NoDoctoIdentificacionPadre int PRIMARY KEY NOT NULL,
	idTipoDocto int NOT NULL,
	primerNombre varchar(35) NOT NULL,
	segundoNombre varchar(35) NOT NULL,
	tercerMasNombres varchar(50) NULL,
	primerApellido varchar(35) NOT NULL,
	segundoApellido varchar(35) NOT NULL,
	fechaNacimiento date NOT NULL,
	idNacionalidad int NOT NULL,

	FOREIGN KEY (idNacionalidad) REFERENCES Nacionalidad (idNacionalidad),
	FOREIGN KEY (idTipoDocto) REFERENCES TipoDocumento (idTipoDocto)
);

CREATE TABLE AsignarPadreMenor(
	NoDoctoIdentificacionPadre int NOT NULL,
	cuiMenor int NOT NULL,

	PRIMARY KEY(NoDoctoIdentificacionPadre, cuiMenor),

	FOREIGN KEY (NoDoctoIdentificacionPadre) REFERENCES DatosPadre (NoDoctoIdentificacionPadre),
	FOREIGN KEY (cuiMenor) REFERENCES MenorEdad (cuiMenor)
);


/*---------SECURITY AREA -----------*/
CREATE TABLE TipoUsuario(
	idTipoUsuario int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	nombre varchar(35) NOT NULL,
	estado char(1) NOT NULL,
);

CREATE TABLE Usuario(
	cuiUsuario int PRIMARY KEY NOT NULL,
	nombres varchar(50) NOT NULL,
	apellidos varchar(50) NOT NULL,
	fechaNacimiento date NOT NULL,
	password varchar(50) NOT NULL,
	idTipoUsuario int NOT NULL,

	FOREIGN KEY(idTipoUsuario) REFERENCES TipoUsuario (idTipoUsuario)
);

CREATE TABLE Permiso(
	idPermiso int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	nombre varchar(35) NOT NULL,
	estado char(1) NOT NULL,
);

CREATE TABLE PermisoUsuario(
	idTipoUsuario int NOT NULL,
	idPermiso int NOT NULL,

	PRIMARY KEY (idTipoUsuario, idPermiso),
	
	FOREIGN KEY(idPermiso) REFERENCES Permiso (idPermiso),
	FOREIGN KEY(idTipoUsuario) REFERENCES TipoUsuario (idTipoUsuario)
);

CREATE TABLE Bitacora(
	idBitacora INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	cuiUsuario INT NOT NULL,
	cuiMenor INT NOT NULL,
	fechaHoraAccion DATETIME NOT NULL,
	descripcionAccion VARCHAR(50) NOT NULL,

	FOREIGN KEY(cuiUsuario) REFERENCES Usuario (cuiUsuario),
	FOREIGN KEY(cuiMenor) REFERENCES MenorEdad (cuiMenor)
);
