use UNDERAGE_FINGERPRINTS

SELECT COUNT(*) FROM HuellaDactilar

select CUIMenor, primerApellido, segundoApellido, primerNombre, segundoNombre, tercerMasNombres, fechaNacimiento from MenorEdad

select MAX(tiempo) from tiempoIdentificacion
select MIN(tiempo) from tiempoIdentificacion

select M.CUIMenor, primerNombre, primerApellido, idDedo, D.nombreDedoMano, t.tiempo from tiempoIdentificacion as t
LEFT OUTER JOIN MenorEdad as M ON t.CUIMenor = M.CUIMenor
LEFT OUTER JOIN DedoMano as D ON t.idDedo = D.idDedoMano
where M.CUIMenor NOT IN (1084998380101, 8567040910101)


update MenorEdad set primerApellido = 'LÓPEZ', segundoApellido = 'CIFUENTES' WHERE CUIMenor =9176015360101

select * from tiempoIdentificacion

select * from tiempoIdentificacion where CUIMenor = 1084998380101 
select * from tiempoIdentificacion where CUIMenor = 8567040910101

delete from tiempoIdentificacion where codigo between 48 and 55


select * from MenorEdad where CUIMenor = 2358468290101

SELECT * FROM MenorEdad WHERE CUIMenor =1084998380101

SELECT COUNT(*) FROM HuellaDactilar

CREATE TRIGGER 