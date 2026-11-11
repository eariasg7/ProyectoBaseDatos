USE REPARACIONES_DB
GO
--
CREATE PROCEDURE sp_registrarReparacion
    @EquipoID BIGINT,
    @FechaSolicitud VARCHAR(10)--FORMATO YYYY-MM-DD (AÑO-MES-DIA)
AS 
BEGIN
    --declara variables
    DECLARE @IDEQUIPO BIGINT;
    DECLARE @IDTECNICO BIGINT;
    DECLARE @REPARACIONID BIGINT;
    DECLARE @FECHA_FORMATEADA NVARCHAR(20) = CONCAT(@FechaSolicitud, 'T00:00:00');
    -- inicio principal del procedimiento
    -- busca el equipo por el id que se suministro
    SELECT @IDEQUIPO = e.EquipoId FROM dbo.Equipos as e WHERE e.EquipoId = @EquipoID;
    --veriica que el id del equipo sea valido
    IF @IDEQUIPO IS NOT NULL
    BEGIN
        -- esta consulta verifica si existen tecnicos sin una asignacion 
        SELECT TOP 1 @IDTECNICO = t.TecnicoID FROM dbo.Tecnicos as t 
        LEFT JOIN dbo.Asignaciones as a on t.TecnicoID = a.TecnicoID
        WHERE a.TecnicoID IS NULL;
        --
        IF @IDTECNICO IS NOT NULL
        BEGIN
            -- si existe un tecnico sin asignacines crea la reparacion y se la asigna al tecnico
            INSERT INTO dbo.Reparaciones (EquipoID, FechaSolicitud, Estado) VALUES (@EquipoID, @FECHA_FORMATEADA, 'PENDIENTE');
            --obtiene el id de la reparacion creada
            SELECT @REPARACIONID = r.ReparacionID FROM dbo.Reparaciones r WHERE r.EquipoID = @IDEQUIPO;
            --asocia la reparacioncon el tecnico
            INSERT INTO dbo.Asignaciones (ReparacionID, TecnicoID, FechaAsignacion) VALUES (@REPARACIONID, @IDTECNICO, SYSDATETIME());
            --muestra mensaje exitoso
            PRINT 'Reparacion creada y asociada correctamente.';
        END
        ELSE
        BEGIN
            INSERT INTO dbo.Reparaciones (EquipoID, FechaSolicitud, Estado) VALUES (@EquipoID, @FECHA_FORMATEADA, 'PENDIENTE');
            PRINT 'Reparacion creada sin una asignacion.';
        END;
    END
    ELSE
    BEGIN
        PRINT 'No se encontró ningún EQUIPO con eL ID suministrado.';
    END;
END;
GO