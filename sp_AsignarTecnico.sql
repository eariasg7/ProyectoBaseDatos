USE REPARACIONES_DB
GO
--
CREATE PROCEDURE sp_AsignarTecnico
AS
BEGIN
    --declara variables 
    DECLARE @REPARACIONID BIGINT;
    DECLARE @TECNICOID BIGINT;
    --
    --BUSCA UNA REPARACION SIN ASIGNAR
    SELECT TOP 1 @REPARACIONID = r.ReparacionID FROM dbo.Reparaciones AS r LEFT JOIN dbo.Asignaciones AS a
    ON r.ReparacionID = a.ReparacionID WHERE a.ReparacionID IS NULL;
    --BUSCA UN TECNICO SIN ASIGNACIONES
    IF @REPARACIONID IS NOT NULL
    BEGIN
        --busca tecnicos disponibles
        SELECT TOP 1 @TECNICOID = t.TecnicoID FROM dbo.Tecnicos AS t LEFT JOIN dbo.Asignaciones AS a
        ON t.TecnicoID = a.TecnicoID WHERE a.TecnicoID IS NULL;
        --veriica si hay algun tecnico
        IF @TECNICOID IS NOT NULL
        BEGIN
            -- SI EXITE TANTO LA REPARACION COMO EL TECNICO CREA LA ASIGNACION
            INSERT INTO dbo.Asignaciones (ReparacionID, TecnicoID, FechaAsignacion) VALUES
            (@REPARACIONID, @TECNICOID, SYSDATETIME());
            PRINT 'La reparacion ue asignada correctamente';
        END;
        ELSE-- si no hay tecnicos disponibles muestra mensaje
        BEGIN
            PRINT 'No hay tecnicos disponibles';
        END;
    END;
    ELSE
    BEGIN
        PRINT 'No hay reparaciones pendientes de asignar.';
    END;
END;
GO