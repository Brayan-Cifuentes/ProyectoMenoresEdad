select m.idMunicipio as 'ID Municipio', m.nombre as 'Nombre Municipio' from MunicipioNacimiento as m
INNER JOIN DepartamentoNacimiento as d ON m.idDepartamento = d.idDepartamento
where d.idDepartamento = 5;

/*PRUEBAS CON ALMACENADO DE HUELLAS - BITMAP Y RETORNO*/

create table pruebaHuella(
	Id int IDENTITY(1,1) primary key not null,
	template varbinary(MAX),
	valorHuella varbinary(MAX)
)

create table pruebaHuella2(
	Id int IDENTITY(1,1) primary key not null,
	valorHuella varbinary(MAX)
)

select * from pruebaHuella;
select * from pruebaHuella2;

truncate table pruebaHuella2;
truncate table pruebaHuella;

insert into pruebaHuella values(1, 1)

select bitmap from pruebaHuella where id = 1;

/*Comprobando si los bitmap son iguales*/
declare @valor1 varbinary(MAX)
declare @valor2 varbinary(MAX)

select @valor1 = valorHuella from pruebaHuella2 where id = 1
select @valor2 = valorHuella from pruebaHuella2 where id = 2

IF @valor1 = @valor2 
	PRINT 'VALORES IGUALES'
ELSE
BEGIN
	PRINT 'NO SON VALORES IGUALES'
	PRINT @valor1
	PRINT @valor2
END

