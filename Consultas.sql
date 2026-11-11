--Consultas

USE REPARACIONES_DB;

--Informe de equipos y usuarios con tecnicos
Select u.Nombre as Usuario, e.TipoEquipo as Equipo, e.Modelo, r.FechaSolicitud as fecha_reparacion, t.Nombre as Tecnico from dbo.Usuarios as u 
INNER JOIN dbo.Equipos as e on e.UsuarioID = u.UsuarioID 
INNER JOIN dbo.Reparaciones as r on r.EquipoID = e.EquipoId
INNER JOIN dbo.Asignaciones a on a.ReparacionID = r.ReparacionID
INNER JOIN dbo.Tecnicos as t on t.TecnicoID = a.TecnicoID;

--Estadistica de cargas de trabajo
SELECT COUNT(r.ReparacionID) as Reparaciones, t.Nombre as Tecnico 
FROM dbo.Reparaciones as r 
INNER JOIN dbo.Asignaciones as a on a.ReparacionID = r.ReparacionID
INNER JOIN dbo.Tecnicos as t on t.TecnicoID = a.TecnicoID
GROUP BY t.Nombre;

--Filtro de seguridad
SELECT * FROM dbo.Equipos as e 
INNER JOIN dbo.Reparaciones as r on r.EquipoID = e.EquipoId
INNER JOIN dbo.Asignaciones as a on a.ReparacionID = r.ReparacionID
INNER JOIN dbo.Tecnicos as t on t.TecnicoID = a.TecnicoID
WHERE e.Modelo = '17 Pro Max' AND r.FechaSolicitud BETWEEN '2026-11-01T00:00:00' AND '2026-11-30T23:59:59.9999999';

EXEC dbo.sp_registrarReparacion 1, '2026-11-11';