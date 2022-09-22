USE UNDERAGE_FINGERPRINTS

SELECT * FROM HuellaDactilar;

select M.*, M.primerNombre, D.nombreDedoMano from MenorEdad as M
INNER JOIN HuellaDactilar as H ON M.CUIMenor = H.CUIMenor
INNER JOIN DedoMano as D ON H.idDedoMano = D.idDedoMano
where M.CUIMenor = 3681599980101 and H.idDedoMano = 2;

delete from HuellaDactilar where CUIMenor = 3681599980101 and idDedoMano between 7 and 10;
select * from HuellaDactilar where CUIMenor = 3681599980101;


select * from MenorEdad 

update MenorEdad set idDepartamentoNac = 1, idMunicipioNac = 1 where CUIMenor = 3681599980101

--consulta

SELECT M.CUIMenor, M.primerNombre, M.segundoNombre, M.tercerMasNombres,M.primerApellido, M.segundoApellido,
M.fechaNacimiento, G.nombre as 'Genero', P.nombre as 'Pais', 
(select nombre from DepartamentoNacimiento where idDepartamento = MU.idDepartamento) as 'Departamento', 
Mu.nombre as 'Municipio'
FROM MenorEdad AS M
INNER JOIN Genero AS G ON M.idGenero = G.idGenero
INNER JOIN PaisNacimiento AS P ON M.idPaisNacimiento = P.idPais
INNER JOIN MunicipioNacimiento AS MU ON M.idDepartamentoNac = Mu.idDepartamento AND M.idMunicipioNac = MU.idMunicipio
WHERE CUIMenor = 3681599980101


select * from DepartamentoNacimiento
select * from MunicipioNacimiento