--procedimiento para verificar si la huella ya existe o no en la BD
--creado 13-09-2022

USE UNDERAGE_FINGERPRINTS;

ALTER PROC SP_VerificarHuellaIngresada(@CUIMenor bigint,
									@idDedoMano int,
									@respuesta int OUTPUT
								   )
AS
BEGIN
	IF NOT EXISTS (SELECT TOP(1) CUIMenor, idDedoMano FROM HuellaDactilar WHERE CUIMenor = @CUIMenor AND idDedoMano = @idDedoMano)
		SET @respuesta = 0;
	ELSE
		SET @respuesta = 1;
END