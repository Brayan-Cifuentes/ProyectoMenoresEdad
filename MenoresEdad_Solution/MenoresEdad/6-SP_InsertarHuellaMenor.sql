--creado 13/09/2022

USE UNDERAGE_FINGERPRINTS;

ALTER PROC SP_InsertarHuellaMenor (@CUIMenor bigint,
									@idDedoMano int,
									@template varbinary(MAX),
									@bitmapHuella varbinary(MAX)
)
AS
BEGIN
	INSERT INTO HuellaDactilar VALUES(@CUIMenor, @idDedoMano, @template, @bitmapHuella);
END


-----------------------
/*select * from MenorEdad; --2489618050101
select * from HuellaDactilar;
insert into HuellaDactilar values (2489618050101, 1, 001, 002);

prueba

IF NOT EXISTS(SELECT TOP(1) CUIMenor, idDedoMano FROM HuellaDactilar WHERE CUIMenor = 1583604330108 AND idDedoMano = 1)
	PRINT 'NO EXISTE';
ELSE
BEGIN
	PRINT 'EXISTE';
	RETURN;
END
*/