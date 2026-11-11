USE REPARACIONES_DB
GO
--
CREATE TRIGGER trg_finalizarReparacion
ON dbo.DetalleReparacion
AFTER INSERT
AS
BEGIN
    --VARIABLE PARA LA REPARACION
    DECLARE @REPARACIONID BIGINT;
    --veriica que se creo un detalle de un trabajo finalizado
    IF EXISTS (SELECT 1 FROM dbo.DetalleReparacion AS d INNER JOIN 
                dbo.Reparaciones AS r ON d.ReparacionID = r.ReparacionID
                WHERE d.Descripcion = 'FINALIZADO')
    BEGIN
        SELECT @REPARACIONID = d.ReparacionID FROM dbo.DetalleReparacion AS d 
        INNER JOIN  dbo.Reparaciones AS r ON d.ReparacionID = r.ReparacionID
        WHERE d.Descripcion = 'FINALIZADO'
        --
        UPDATE dbo.Reparaciones SET Estado = 'FINALIZADO' WHERE ReparacionID = @REPARACIONID;
    END;
END;
GO