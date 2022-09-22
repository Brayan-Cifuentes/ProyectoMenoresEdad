truncate table prueba;
select * from prueba;
drop table prueba;
create table prueba(
	cui bigint primary key not null,
	nombre varchar(15) not null,
	cuiGenerado bigint
);

/*--------------------------------------------------------------------*/
ALTER PROC GenerarCUIMenor
	@aleatorio int OUTPUT
AS
BEGIN 
	declare @cui int;
	declare @cantidad int;
	--SELECT @aleatorio = FLOOR(RAND()*(9999999999999-0000000000001)+0000000000001);
	
	SELECT @aleatorio = FLOOR(RAND()*(900-1)+1);
	/*print LEN(@aleatorio);*/
	print @aleatorio;

	IF LEN(@aleatorio) <9
	BEGIN
		SET @aleatorio = FLOOR(RAND()*(900-1)+1);
		/*PRINT('corregido');*/
		/*print(@aleatorio);*/
	END
	
	/*corroborando iguales*/
/*	IF EXISTS(SELECT TOP(1) * from prueba where CUI = @aleatorio) 
	BEGIN
		SET @aleatorio = FLOOR(RAND()*(100-1)+1);
	END*/

	/*SELECT TOP(1) @cui = cui from prueba where CUI = @aleatorio;
	
	while @cui = @aleatorio
	BEGIN
		SET @aleatorio = FLOOR(RAND()*(50-22)+50);
	END*/
	WHILE EXISTS(SELECT TOP(1) cui from prueba where cui=@aleatorio)
	BEGIN
		SET @aleatorio = FLOOR(RAND()*(900-1)+1);
		SELECT CONCAT('otro numero: ', @aleatorio);
	
		SELECT @cantidad = COUNT(*) FROM prueba;
		IF(@cantidad =900)
			return
	END
END


/*Ejecucion Query*/
------------------------------------------------------------------------
declare @i int = 0;

while @i<900
BEGIN
	declare @valor int;
	EXEC GenerarCUIMenor @valor OUTPUT 
	/*select @valor*/
	
	
	INSERT INTO prueba values (@valor, CONCAT('No.',@i));
	/*SELECT * FROM prueba;*/

	SET @i+=1;
END


select * from prueba
where cui between 200 and 900;


-------------------------------------------------------

declare @random int;
declare @cantidad int;
SET @random = FLOOR(RAND()*(25-1)+1);
SELECT @random;


WHILE EXISTS(SELECT TOP(1) cui from prueba where cui=@aleatorio)
BEGIN
	SET @random = FLOOR(RAND()*(25-1)+1);
	SELECT CONCAT('otro numero: ', @random);

	/*SELECT @cantidad = COUNT(*) FROM prueba;
	
	IF(@cantidad =24)
		return*/
	 
END


insert into prueba values (@random, CONCAT('Random ',@random));	

