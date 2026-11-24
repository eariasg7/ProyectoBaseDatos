-- DATOS DE PRUEBA ADICIONALES - SQL Server
-- Agrega 5 registros nuevos a cada una de las 6 tablas (30 en total).
-- Ejecutar en SSMS sobre la estructura de DDL.sql, una sola vez.
-- Los datos son ficticios y los correos usan el dominio example.com.
-- No requiere que los IDs existentes sean consecutivos ni comiencen en 1.
-- No contiene sentencias UPDATE ni DELETE.
-- Si se repite la ejecucion, los correos UNIQUE provocaran un error y
-- la transaccion revertira todas las inserciones de esa ejecucion.

USE REPARACIONES_DB;
GO
SET NOCOUNT ON;
SET XACT_ABORT ON;

DECLARE @UsuarioID BIGINT;
DECLARE @EquipoID BIGINT;
DECLARE @TecnicoID BIGINT;
DECLARE @ReparacionID BIGINT;
DECLARE @FechaSolicitud DATETIME2 = SYSDATETIME();

BEGIN TRY
    BEGIN TRANSACTION;

    -- CASO 1: Samsung Galaxy S24 FE
    -- Primero se crean las filas independientes (usuario y tecnico).
    INSERT INTO dbo.Usuarios (Nombre, CorreoElectronico, Telefono)
    VALUES (N'Ana Solano', N'ana.solano.prueba@example.com', 88881001);
    SET @UsuarioID = CONVERT(BIGINT, SCOPE_IDENTITY());

    INSERT INTO dbo.Tecnicos (Nombre, Especialidad)
    VALUES (N'Luis Rojas', N'Reparacion de celulares');
    SET @TecnicoID = CONVERT(BIGINT, SCOPE_IDENTITY());

    -- Las llaves foraneas usan los IDs recien generados.
    INSERT INTO dbo.Equipos (TipoEquipo, Modelo, UsuarioID)
    VALUES (N'Samsung', N'Galaxy S24 FE', @UsuarioID);
    SET @EquipoID = CONVERT(BIGINT, SCOPE_IDENTITY());

    INSERT INTO dbo.Reparaciones (EquipoID, FechaSolicitud, Estado)
    VALUES (@EquipoID, @FechaSolicitud, N'PENDIENTE');
    SET @ReparacionID = CONVERT(BIGINT, SCOPE_IDENTITY());

    INSERT INTO dbo.Asignaciones (ReparacionID, TecnicoID, FechaAsignacion)
    VALUES (@ReparacionID, @TecnicoID, @FechaSolicitud);

    -- El trabajo comienza pendiente: FechaFin permanece NULL.
    INSERT INTO dbo.DetalleReparacion
        (ReparacionID, Descripcion, FechaInicio, FechaFin)
    VALUES (@ReparacionID, N'Diagnostico de microfono inferior con volumen bajo.', @FechaSolicitud, NULL);

    -- CASO 2: Lenovo ThinkPad T470
    -- Primero se crean las filas independientes (usuario y tecnico).
    INSERT INTO dbo.Usuarios (Nombre, CorreoElectronico, Telefono)
    VALUES (N'Diego Mora', N'diego.mora.prueba@example.com', 88881002);
    SET @UsuarioID = CONVERT(BIGINT, SCOPE_IDENTITY());

    INSERT INTO dbo.Tecnicos (Nombre, Especialidad)
    VALUES (N'Sofia Vargas', N'Laptops y baterias');
    SET @TecnicoID = CONVERT(BIGINT, SCOPE_IDENTITY());

    -- Las llaves foraneas usan los IDs recien generados.
    INSERT INTO dbo.Equipos (TipoEquipo, Modelo, UsuarioID)
    VALUES (N'Lenovo', N'ThinkPad T470', @UsuarioID);
    SET @EquipoID = CONVERT(BIGINT, SCOPE_IDENTITY());

    INSERT INTO dbo.Reparaciones (EquipoID, FechaSolicitud, Estado)
    VALUES (@EquipoID, @FechaSolicitud, N'PENDIENTE');
    SET @ReparacionID = CONVERT(BIGINT, SCOPE_IDENTITY());

    INSERT INTO dbo.Asignaciones (ReparacionID, TecnicoID, FechaAsignacion)
    VALUES (@ReparacionID, @TecnicoID, @FechaSolicitud);

    -- El trabajo comienza pendiente: FechaFin permanece NULL.
    INSERT INTO dbo.DetalleReparacion
        (ReparacionID, Descripcion, FechaInicio, FechaFin)
    VALUES (@ReparacionID, N'Revision de bateria con poca autonomia.', @FechaSolicitud, NULL);

    -- CASO 3: Apple iPhone 12 Pro Max
    -- Primero se crean las filas independientes (usuario y tecnico).
    INSERT INTO dbo.Usuarios (Nombre, CorreoElectronico, Telefono)
    VALUES (N'Valeria Castro', N'valeria.castro.prueba@example.com', 88881003);
    SET @UsuarioID = CONVERT(BIGINT, SCOPE_IDENTITY());

    INSERT INTO dbo.Tecnicos (Nombre, Especialidad)
    VALUES (N'Andres Jimenez', N'Dispositivos Apple');
    SET @TecnicoID = CONVERT(BIGINT, SCOPE_IDENTITY());

    -- Las llaves foraneas usan los IDs recien generados.
    INSERT INTO dbo.Equipos (TipoEquipo, Modelo, UsuarioID)
    VALUES (N'Apple', N'iPhone 12 Pro Max', @UsuarioID);
    SET @EquipoID = CONVERT(BIGINT, SCOPE_IDENTITY());

    INSERT INTO dbo.Reparaciones (EquipoID, FechaSolicitud, Estado)
    VALUES (@EquipoID, @FechaSolicitud, N'PENDIENTE');
    SET @ReparacionID = CONVERT(BIGINT, SCOPE_IDENTITY());

    INSERT INTO dbo.Asignaciones (ReparacionID, TecnicoID, FechaAsignacion)
    VALUES (@ReparacionID, @TecnicoID, @FechaSolicitud);

    -- El trabajo comienza pendiente: FechaFin permanece NULL.
    INSERT INTO dbo.DetalleReparacion
        (ReparacionID, Descripcion, FechaInicio, FechaFin)
    VALUES (@ReparacionID, N'Diagnostico de pantalla con fallas tactiles.', @FechaSolicitud, NULL);

    -- CASO 4: Dell OptiPlex 7080
    -- Primero se crean las filas independientes (usuario y tecnico).
    INSERT INTO dbo.Usuarios (Nombre, CorreoElectronico, Telefono)
    VALUES (N'Pablo Ramirez', N'pablo.ramirez.prueba@example.com', 88881004);
    SET @UsuarioID = CONVERT(BIGINT, SCOPE_IDENTITY());

    INSERT INTO dbo.Tecnicos (Nombre, Especialidad)
    VALUES (N'Daniela Chaves', N'Computadoras de escritorio');
    SET @TecnicoID = CONVERT(BIGINT, SCOPE_IDENTITY());

    -- Las llaves foraneas usan los IDs recien generados.
    INSERT INTO dbo.Equipos (TipoEquipo, Modelo, UsuarioID)
    VALUES (N'Dell', N'OptiPlex 7080', @UsuarioID);
    SET @EquipoID = CONVERT(BIGINT, SCOPE_IDENTITY());

    INSERT INTO dbo.Reparaciones (EquipoID, FechaSolicitud, Estado)
    VALUES (@EquipoID, @FechaSolicitud, N'PENDIENTE');
    SET @ReparacionID = CONVERT(BIGINT, SCOPE_IDENTITY());

    INSERT INTO dbo.Asignaciones (ReparacionID, TecnicoID, FechaAsignacion)
    VALUES (@ReparacionID, @TecnicoID, @FechaSolicitud);

    -- El trabajo comienza pendiente: FechaFin permanece NULL.
    INSERT INTO dbo.DetalleReparacion
        (ReparacionID, Descripcion, FechaInicio, FechaFin)
    VALUES (@ReparacionID, N'Limpieza interna y revision de temperaturas.', @FechaSolicitud, NULL);

    -- CASO 5: Asus TUF Gaming F15
    -- Primero se crean las filas independientes (usuario y tecnico).
    INSERT INTO dbo.Usuarios (Nombre, CorreoElectronico, Telefono)
    VALUES (N'Mariana Torres', N'mariana.torres.prueba@example.com', 88881005);
    SET @UsuarioID = CONVERT(BIGINT, SCOPE_IDENTITY());

    INSERT INTO dbo.Tecnicos (Nombre, Especialidad)
    VALUES (N'Gabriel Montero', N'Mantenimiento de laptops');
    SET @TecnicoID = CONVERT(BIGINT, SCOPE_IDENTITY());

    -- Las llaves foraneas usan los IDs recien generados.
    INSERT INTO dbo.Equipos (TipoEquipo, Modelo, UsuarioID)
    VALUES (N'Asus', N'TUF Gaming F15', @UsuarioID);
    SET @EquipoID = CONVERT(BIGINT, SCOPE_IDENTITY());

    INSERT INTO dbo.Reparaciones (EquipoID, FechaSolicitud, Estado)
    VALUES (@EquipoID, @FechaSolicitud, N'PENDIENTE');
    SET @ReparacionID = CONVERT(BIGINT, SCOPE_IDENTITY());

    INSERT INTO dbo.Asignaciones (ReparacionID, TecnicoID, FechaAsignacion)
    VALUES (@ReparacionID, @TecnicoID, @FechaSolicitud);

    -- El trabajo comienza pendiente: FechaFin permanece NULL.
    INSERT INTO dbo.DetalleReparacion
        (ReparacionID, Descripcion, FechaInicio, FechaFin)
    VALUES (@ReparacionID, N'Revision de teclado con teclas sin respuesta.', @FechaSolicitud, NULL);

    COMMIT TRANSACTION;
    PRINT N'Se agregaron 5 registros a cada tabla: 30 registros en total.';
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0
        ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO

-- Verifica los cinco casos mediante sus correos exclusivos de prueba.
SELECT
    u.Nombre AS Usuario,
    u.CorreoElectronico,
    e.TipoEquipo,
    e.Modelo,
    t.Nombre AS Tecnico,
    r.ReparacionID,
    r.Estado,
    d.Descripcion,
    d.FechaFin
FROM dbo.Usuarios AS u
INNER JOIN dbo.Equipos AS e ON e.UsuarioID = u.UsuarioID
INNER JOIN dbo.Reparaciones AS r ON r.EquipoID = e.EquipoId
INNER JOIN dbo.Asignaciones AS a ON a.ReparacionID = r.ReparacionID
INNER JOIN dbo.Tecnicos AS t ON t.TecnicoID = a.TecnicoID
INNER JOIN dbo.DetalleReparacion AS d ON d.ReparacionID = r.ReparacionID
WHERE u.CorreoElectronico IN (
    N'ana.solano.prueba@example.com',
    N'diego.mora.prueba@example.com',
    N'valeria.castro.prueba@example.com',
    N'pablo.ramirez.prueba@example.com',
    N'mariana.torres.prueba@example.com'
)
ORDER BY u.UsuarioID;
