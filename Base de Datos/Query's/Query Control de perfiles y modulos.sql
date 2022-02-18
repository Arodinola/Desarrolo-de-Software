
--*************************************************************************************************************************************************
INSERT INTO [dbo].[Perfiles]
           ([PerfilNombre]
           ,[EstadoPerfil])
     VALUES
           ('Administrador',null ),
		   ('Finanzas',null),
		   ('Ventas',null),
		   ('Gerente General',null)


INSERT INTO Modulos (ModuloDescripcion)
VALUES
		('Usuario'),
		('Ventas'),
		('Clientes'),
		('Compras'),
		('Empleados'),
		('Proveedores'),
		('Reportes')

SELECT * FROM Perfiles
SELECT * FROM Modulos
SELECT * FROM PerfilesModulos

INSERT INTO PerfilesModulos(FKPerfilId,FKModulosId)
VALUES
	(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),
	(2,3),(2,5),(2,6),(2,7),
	(3,2),(3,3),
	(4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7)

SELECT        Perfiles.PerfilNombre, Modulos.ModuloDescripcion
FROM            Perfiles INNER JOIN
                         PerfilesModulos ON Perfiles.PKIdPerfiles = PerfilesModulos.FKPerfilId INNER JOIN
                         Modulos ON PerfilesModulos.FKModulosId = Modulos.PKModulosID
GROUP BY Modulos.ModuloDescripcion, PerfilesModulos.FKPerfilId, Perfiles.PerfilNombre
HAVING        (PerfilesModulos.FKPerfilId = 3)

--*************************************************************************************************************************************************
INSERT INTO [dbo].[EstadosCiviles]
           ([NombreEstadoCivil])
     VALUES
           ('Soltero'),
		   ('Casado'),
		   ('Divorciado'),
		   ('Union Libre')

INSERT INTO [dbo].[Empleados]
           ([IdentidadEmpleado]
           ,[NombreEmpleado]
           ,[ApellidoEmpleado]
           ,[TelefonoEmpleado]
           ,[CorreoEmpleado]
           ,[FkEstadoCivilEmpleado]
           ,[FechaNacimientoEmpleado])
     VALUES
           ('0501-2001-10666',
		   'Elmer Eduardo',
		   'Sabillon Chandia',
		   '3312-2949',
		   'Elmerchandia0615@gmail.com',
		   1,
		   '19971002'),

		   ('1312-2002-0085',
		   'Jobany',
		   'Abrego',
		   '9835-1799',
		   'Yobany@gmail.com',
		   1,
		   '20020806'
		   )

		   select * from Empleados

-- Regresar el contador del ID a 0 
DBCC CHECKIDENT(Usurios,RESEED,0)

INSERT INTO Usuarios ([Usuario],[password],[FKEmpleados],[FKPerfiles],estadoUsuario)
VALUES
	('Chandi17',
	'Holaquehace',
	1,
	2,
	NULL),
	('Jose02',
	'Holamundo',
	2,
	1,
	NULL)


SELECT        Empleados.NombreEmpleado, Usuarios.Usuario, Usuarios.password, Perfiles.PerfilNombre, Modulos.ModuloDescripcion
FROM            Empleados INNER JOIN
                         Usuarios ON Empleados.PKIdEmpleado = Usuarios.FKEmpleados INNER JOIN
                         Perfiles ON Usuarios.FKPerfiles = Perfiles.PKIdPerfiles INNER JOIN
                         PerfilesModulos ON Perfiles.PKIdPerfiles = PerfilesModulos.FKPerfilId INNER JOIN
                         Modulos ON PerfilesModulos.FKModulosId = Modulos.PKModulosID
WHERE        (Usuarios.PKIdUsuario = 2)





