--creado 17-09-2022
--procedimiento para retornar datos por medio de lista en c#

USE UNDERAGE_FINGERPRINTS;

ALTER PROC SP_RetornarDatos(@CUIMenor bigint)
AS
BEGIN

	SELECT M.CUIMenor, M.primerNombre 'Primer Nombre', M.segundoNombre 'Segundo Nombre', M.tercerMasNombres 'Tercer y mas Nombres', 
		M.primerApellido 'Primer Apellido', M.segundoApellido 'Segundo Apellido',
		M.fechaNacimiento 'Fecha Nacimiento', G.nombre 'Genero', P.nombre 'Pais', 
		(select nombre from DepartamentoNacimiento where idDepartamento = MU.idDepartamento) 'Departamento', 
		Mu.nombre 'Municipio', M.fotografia
	FROM MenorEdad AS M
	INNER JOIN Genero AS G ON M.idGenero = G.idGenero
	INNER JOIN PaisNacimiento AS P ON M.idPaisNacimiento = P.idPais
	INNER JOIN MunicipioNacimiento AS MU ON M.idDepartamentoNac = Mu.idDepartamento AND M.idMunicipioNac = MU.idMunicipio
	WHERE CUIMenor = @CUIMenor

END
