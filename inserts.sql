USE REPARACIONES_DB;
--POBLAR TABLA DE USUAIROS
INSERT INTO dbo.Usuarios VALUES ('Juan Perez', 'juan"email.com', 22583089);
INSERT INTO dbo.Usuarios VALUES ('Juana Guzman', 'juana@email.com', 22583089);
INSERT INTO dbo.Usuarios VALUES ('Pedro Alvarado', 'pedro@email.com', 22583089);
INSERT INTO dbo.Usuarios VALUES ('Cynthia Gomez', 'cyn@email.com', 22583089);
INSERT INTO dbo.Usuarios VALUES ('Samantha Arevalos', 'sam@email.com', 22583089);

--POBLAR TABLA EQUIPOS
INSERT INTO dbo.Equipos (TipoEquipo, Modelo, UsuarioID) VALUES ('Iphone', '17 Pro Max', 1);
INSERT INTO dbo.Equipos (TipoEquipo, Modelo, UsuarioID) VALUES ('Google Pixel', '8', 2);
INSERT INTO dbo.Equipos (TipoEquipo, Modelo, UsuarioID) VALUES ('Asus', 'Rog', 3);
INSERT INTO dbo.Equipos (TipoEquipo, Modelo, UsuarioID) VALUES ('Iphone', 'Duo', 4);
INSERT INTO dbo.Equipos (TipoEquipo, Modelo, UsuarioID) VALUES ('MacBook', 'Pro', 5);

--POBLAR TABLA TECNICOS
INSERT INTO dbo.Tecnicos VALUES ('Ramon Valdez', 'Movil');
INSERT INTO dbo.Tecnicos VALUES ('Carlos Villagran', 'PC');
INSERT INTO dbo.Tecnicos VALUES ('Edgar Vivar', 'Laptop');
INSERT INTO dbo.Tecnicos VALUES ('Florinda Meza', 'Apple');
INSERT INTO dbo.Tecnicos VALUES ('Maria Antonieta de las Nieves', 'Samsung');

--POBLAR TABLA REPARCIONES
INSERT INTO dbo.Reparaciones VALUES (1, SYSDATETIME(), 'PENDIENTE');
INSERT INTO dbo.Reparaciones VALUES (2, SYSDATETIME(), 'PENDIENTE');
INSERT INTO dbo.Reparaciones VALUES (3, SYSDATETIME(), 'PENDIENTE');
INSERT INTO dbo.Reparaciones VALUES (4, SYSDATETIME(), 'PENDIENTE');
INSERT INTO dbo.Reparaciones VALUES (5, SYSDATETIME(), 'PENDIENTE');

--POBLAR TABLA ASIGNACIONES
INSERT INTO dbo.Asignaciones (ReparacionID, TecnicoID, FechaAsignacion) VALUES (1, 1, SYSDATETIME());
INSERT INTO dbo.Asignaciones (ReparacionID, TecnicoID, FechaAsignacion) VALUES (2, 2, SYSDATETIME());
INSERT INTO dbo.Asignaciones (ReparacionID, TecnicoID, FechaAsignacion) VALUES (3, 3, SYSDATETIME());
INSERT INTO dbo.Asignaciones (ReparacionID, TecnicoID, FechaAsignacion) VALUES (4, 4, SYSDATETIME());
INSERT INTO dbo.Asignaciones (ReparacionID, TecnicoID, FechaAsignacion) VALUES (5, 5, SYSDATETIME());

--POBLAR TABLA DETALLE
INSERT INTO dbo.DetalleReparacion (ReparacionID, Descripcion, FechaInicio) VALUES (1, 'Mantenimiento', SYSDATETIME());
INSERT INTO dbo.DetalleReparacion (ReparacionID, Descripcion, FechaInicio) VALUES (2, 'Cambio pantalla', SYSDATETIME());
INSERT INTO dbo.DetalleReparacion (ReparacionID, Descripcion, FechaInicio) VALUES (3, 'Limpieza', SYSDATETIME());
INSERT INTO dbo.DetalleReparacion (ReparacionID, Descripcion, FechaInicio) VALUES (4, 'Cambio Bateria', SYSDATETIME());
INSERT INTO dbo.DetalleReparacion (ReparacionID, Descripcion, FechaInicio) VALUES (5, 'Mantenimiento', SYSDATETIME());