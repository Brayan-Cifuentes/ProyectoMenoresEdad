/*creado 11-09-2022*/
USE UNDERAGE_FINGERPRINTS;

/*Storage Procedure para realizar la insercion de datos biográficos del menor de edad*/
ALTER PROCEDURE SP_InsertarMenorEdad(
							@primerNombre varchar(35),
							@segundoNombre varchar(35),
							@tercerYMasNombres varchar(50),
							@primerApellido varchar(35),
							@segundoApellido varchar(35),
							@fechaNacimiento date,
							@idGenero int,
							@idPaisNacimiento int,
							@idDepartamentoNac int,
							@idMunicipioNac int,
							@fotografia varbinary(MAX),
							@CUIGenerado BIGINT OUTPUT)
AS
BEGIN
	/*Variables*/
	DECLARE @CUIMenor BIGINT;
	DECLARE @estatus char(1) = 'A';

	/*Llamada a SP para generar CUI*/
	EXEC SP_GenerarCUIMenor @idDepartamentoNac, @idMunicipioNac, @CUIMenor OUTPUT;

	INSERT INTO MenorEdad VALUES(@CUIMenor, @primerNombre, @segundoNombre, @tercerYMasNombres, @primerApellido, @segundoApellido,
	@fechaNacimiento, @idGenero, @idPaisNacimiento, @idDepartamentoNac, @idMunicipioNac, @fotografia, @estatus);

	SET @CUIGenerado = @CUIMenor;
	
END