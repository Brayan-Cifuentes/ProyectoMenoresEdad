use UNDERAGE_FINGERPRINTS;

ALTER PROC GenerarCUIMenor
	@departamento int,
	@municipio int,
	@aleatorio Bigint OUTPUT,
	@aleatorioUnificado Bigint OUTPUT
AS
BEGIN 
	/*variables */
	declare @cantidad int;
	declare @deptoConvertido as varchar(2);
	declare @munConvertido as varchar(2);


	-- convertir departamento 
	IF LEN(@departamento) = 1
	BEGIN
		SET @deptoConvertido = CAST(@departamento as varchar(1));
		SELECT @deptoConvertido = RIGHT('0'+ @deptoConvertido, 2);
	END
	
	-- convertir municipio 
	IF LEN(@municipio) = 1
	BEGIN
		SET @munConvertido = CAST(@municipio as varchar(1));
		SELECT @munConvertido = RIGHT('0'+ @munConvertido, 2);
	END
	

	-- GENERANDO NUMERO ALEATORIO --
	SET @aleatorio = FLOOR(RAND()*(999999999-1)+1);
	--select @aleatorio;

	WHILE NOT LEN(@aleatorio) = 9
	BEGIN
		SET @aleatorio = FLOOR(RAND()*(999999999-1)+1);
		--select @aleatorio;
	END
	

	/*Comprobando iguales*/
	WHILE EXISTS(SELECT TOP(1) cuiGenerado from prueba where LEFT(cui,9)=@aleatorio) /*los 9 digitos generados por el sistema*/
	BEGIN
		SET @aleatorio = FLOOR(RAND()*(1000000000-1)+1);
	--	SELECT CONCAT('otro numero: ', @aleatorio);
	
		SELECT @cantidad = COUNT(*) FROM prueba;
		IF(@cantidad =1000000000)
			RETURN
	END

	-- CONCATENANDO ULTIMOS VALORES
	IF (LEN(@departamento) = 1 AND LEN(@municipio) = 1)
		SET @aleatorioUnificado = CONCAT(@aleatorio, @deptoConvertido, @munConvertido);
	ELSE IF (LEN(@departamento) = 1)
		SET @aleatorioUnificado = CONCAT(@aleatorio, @deptoConvertido, @municipio);
	ELSE IF (LEN(@municipio) = 1)
		SET @aleatorioUnificado = CONCAT(@aleatorio, @departamento, @munConvertido);
	ELSE
		SET @aleatorioUnificado = CONCAT(@aleatorio, @departamento, @municipio);
	
END


--------------------------------------
/*pruebas de generacion ciclo - generar cui
declare @i int = 0;
declare @j int = 0;
while @i<10
BEGIN
	
	declare @valorI bigint;
	declare @valorF bigint;
	EXEC GenerarCUIMenor @i, @j, @valorI OUTPUT, @valorF OUTPUT
	/*select @valor*/
	
	
	INSERT INTO prueba values (@valorI, CONCAT('Registro (',@i, ' ',@j, ')'), @valorF);
	/*SELECT * FROM prueba;*/

	SET @i+=1;
	SET @j+=2;
END*/


/*PRUEBA CON DEPTO Y MUN*/
declare @pa int
declare @mu int 
declare @i int = 1

while @i <= 24
BEGIN
	
	SELECT @pa = D.idDepartamento, @mu =M.idMunicipio FROM MunicipioNacimiento as M
		INNER JOIN DepartamentoNacimiento as D ON M.idDepartamento = D.idDepartamento
		where D.idDepartamento = 9 and M.idMunicipio = @i
	
	
	declare @valorI bigint;
	declare @valorF bigint;
	EXEC GenerarCUIMenor @pa, @mu, @valorI OUTPUT, @valorF OUTPUT
	/*select @valor*/
	
	
	INSERT INTO prueba values (@valorI, CONCAT('Registro (',@i,')'), @valorF);
	

	SET @i = @i+1;
END




truncate table prueba;
select * from prueba where nombre = 'Esteban';

-------------------------------------

/*
create table prueba(
	cui int,
	nombre varchar(35),
	cuiGenerado bigint
)

select *, LEFT(cuiGenerado, 9) 'tomando' from prueba;


select * from prueba;
--SELECT TOP(1) cuiGenerado from prueba where LEFT(cui,9)=773771872  aca generará otro cui porque ya esta asignado este codigo que fue 
																 --  generado por el sistema a un menor de edad																 */