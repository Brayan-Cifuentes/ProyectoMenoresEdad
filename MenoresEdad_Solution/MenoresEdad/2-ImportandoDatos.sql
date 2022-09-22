USE UNDERAGE_FINGERPRINTS;

----------------------------------------------------------

/*IMPORTANDO VALORES A DEPARTAMENTO*/
Insert into DepartamentoNacimiento
select [Nombre del departamento] from DEPARTAMENTOS

select * from DepartamentoNacimiento


--------------------------------------------------------------

/*IMPORTANDO VALORES A MUNICIPIO*/

INSERT INTO MunicipioNacimiento 
SELECT [Codigo Municipio]
      ,[Codigo Departamento]
      ,[Nombre Municipio]
  FROM [UNDERAGE_FINGERPRINTS].[dbo].[MUNICIPIOS$]


------------------------------------


/*ALTERS PARA COLOCAR PAIS*/
-------------------------------------
INSERT INTO PaisNacimiento values ('GUATEMALA');


ALTER TABLE DepartamentoNacimiento ADD idPais int;


--alter para referenciar el codigo pais de la tabla departamento hacia el idPais tabla pais
ALTER TABLE DepartamentoNacimiento ADD FOREIGN KEY (idPais) REFERENCES PaisNacimiento(idPais);

--update llave foránea para que se inserte y diga que son de guatemala
update DepartamentoNacimiento set idPais = 1;


/*VERIFICANDO VALORES*/
select * from PaisNacimiento;
select * from DepartamentoNacimiento;
select * from MunicipioNacimiento;