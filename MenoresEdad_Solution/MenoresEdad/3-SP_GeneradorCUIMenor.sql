use UNDERAGE_FINGERPRINTS;

/*PROCEDIMIENTO ALMACENADO PARA LA GENERACION DE CUI*/

ALTER PROC SP_GenerarCUIMenor (@departamento int,
							   @municipio int,
							   @aleatorioUnificado Bigint OUTPUT)
AS
BEGIN 
	/*variables Globales*/
	declare @aleatorio Bigint;
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

	WHILE NOT LEN(@aleatorio) = 9
	BEGIN
		SET @aleatorio = FLOOR(RAND()*(999999999-1)+1);
		--select @aleatorio;
	END
	

	/*Comprobando iguales*/
	WHILE EXISTS(SELECT TOP(1) CUIMenor from MenorEdad where LEFT(CUIMenor,9)=@aleatorio) /*los 9 digitos generados por el sistema*/
	BEGIN
		SET @aleatorio = FLOOR(RAND()*(1000000000-1)+1);
	--	SELECT CONCAT('otro numero: ', @aleatorio);
	
		SELECT @cantidad = COUNT(*) FROM MenorEdad;
		IF(@cantidad =1000000000)
			RETURN                 /*si llega al tope se termina el ciclo*/
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