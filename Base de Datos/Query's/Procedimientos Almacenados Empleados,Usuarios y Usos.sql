-------------------------------------------------CONSULTAS EMPLEADO-----------------------------------------------------------------------------------------------------------
Create PROCEDURE ConsultaGeneralEmpleado
	AS
	SET NOCOUNT ON;

	SELECT        Empleados.PKIdEmpleado [Id], Empleados.IdentidadEmpleado [Identidad], Empleados.NombreEmpleado [Nombre], Empleados.ApellidoEmpleado [Apellido], Empleados.TelefonoEmpleado [Telefono], Empleados.CorreoEmpleado [Correo], EstadosCiviles.NombreEstadoCivil [Estado Civil], 
                         Empleados.FechaNacimientoEmpleado
FROM            Empleados INNER JOIN
                         EstadosCiviles ON Empleados.FkEstadoCivilEmpleado = EstadosCiviles.PKIdEstadoCivil
						 Where EstadoEmpleado != 0 AND EstadoEmpleado != 0

CREATE PROCEDURE ConsultaEmpleadoPorCodigo
@Codigo int
AS 
SET NOCOUNT ON;
SELECT        Empleados.PKIdEmpleado [Id], Empleados.IdentidadEmpleado [Identidad], Empleados.NombreEmpleado [Nombre], Empleados.ApellidoEmpleado [Apellido], Empleados.TelefonoEmpleado [Telefono], Empleados.CorreoEmpleado [Correo], EstadosCiviles.NombreEstadoCivil [Estado Civil], 
                         Empleados.FechaNacimientoEmpleado
FROM            Empleados INNER JOIN
                         EstadosCiviles ON Empleados.FkEstadoCivilEmpleado = EstadosCiviles.PKIdEstadoCivil
						 Where EstadoEmpleado != 0 AND PKIdEmpleado = @Codigo

CREATE PROCEDURE ConsultaEmpleadoPorNombre 
@Nombre nchar(30)
AS
SET NOCOUNT ON;


SELECT        Empleados.PKIdEmpleado [Id], Empleados.IdentidadEmpleado [Identidad], Empleados.NombreEmpleado [Nombre], Empleados.ApellidoEmpleado [Apellido], Empleados.TelefonoEmpleado [Telefono], Empleados.CorreoEmpleado [Correo], EstadosCiviles.NombreEstadoCivil [Estado Civil], 
                         Empleados.FechaNacimientoEmpleado
FROM            Empleados INNER JOIN
                         EstadosCiviles ON Empleados.FkEstadoCivilEmpleado = EstadosCiviles.PKIdEstadoCivil
						 Where EstadoEmpleado != 0 AND NombreEmpleado LIKE  CONCAT(@Nombre,'%%')


CREATE PROCEDURE AgregarEmpleado
(@Identidad varchar (15),
@Nombre varchar (30),
@Apellido varchar (30),
@Telefono varchar (16),
@Correo varchar (50),
@IdCategoria int,
@FechaNacimiento date
)
AS
SET NOCOUNT ON;

if exists (select IdentidadEmpleado  from Empleados where IdentidadEmpleado=@Identidad and EstadoEmpleado = 1)raiserror('Error!! Este Empleado ya existe, utiliza otro por favor', 16, 1)
else if exists (select IdentidadEmpleado from Empleados where IdentidadEmpleado=@Identidad and EstadoEmpleado = 0) UPDATE Empleados SET EstadoEmpleado = 1
 WHERE IdentidadEmpleado = @Identidad
ELSE

INSERT INTO [dbo].[Empleados]
           ([IdentidadEmpleado]
           ,[NombreEmpleado]
           ,[ApellidoEmpleado]
           ,[TelefonoEmpleado]
           ,[CorreoEmpleado]
           ,[FkEstadoCivilEmpleado]
           ,[FechaNacimientoEmpleado])
     VALUES
           (@Identidad,
		   @Nombre,
		   @Apellido,
		   @Telefono,
		   @Correo,
		   @IdCategoria,
		   @FechaNacimiento)
GO

CREATE PROCEDURE EditarEmpleado
(
		@Id int,
		@Identidad varchar (15),
		@Nombre varchar (30),
		@Apellido varchar (30),
		@Telefono varchar (16),
		@Correo varchar (50),
		@IdCategoria int,
		@FechaNacimiento date
)
AS
SET NOCOUNT ON;

UPDATE [dbo].[Empleados]
   SET [IdentidadEmpleado] = @Identidad
      ,[NombreEmpleado] = @Nombre
      ,[ApellidoEmpleado] = @Apellido
      ,[TelefonoEmpleado] = @Telefono
      ,[CorreoEmpleado] = @Correo
      ,[FkEstadoCivilEmpleado] = @IdCategoria
      ,[FechaNacimientoEmpleado] = @FechaNacimiento
 WHERE PKIdEmpleado = @Id  AND EstadoEmpleado != 0
GO



GO

CREATE PROCEDURE EliminarEmpleado
(
	@Id int
)
AS
SET NOCOUNT ON;

UPDATE Empleados
   SET EstadoEmpleado = 0
 WHERE PKIdEmpleado = @Id And EstadoEmpleado = 1
GO

-------------------------------------------------CONSULTAS USOS-----------------------------------------------------------------------------------------------------------
Create PROCEDURE ConsultaGeneralUsos
	AS
	SET NOCOUNT ON;

	SELECT       PKIdUsos [ID], Descripcion [Descripción]
FROM            Usos
WHERE Estado!= 0


CREATE PROCEDURE ConsultaUsosPorCodigo
@Codigo int
AS 
SET NOCOUNT ON;
SELECT       PKIdUsos [ID], Descripcion [Descripción]
FROM            Usos
WHERE Estado!= 0 AND PKIdUsos = @Codigo



CREATE PROCEDURE ConsultaUsosPorNombre 
@Nombre nchar(30)
AS
SET NOCOUNT ON;

SELECT       PKIdUsos [ID], Descripcion [Descripción]
FROM            Usos
WHERE Estado!= 0 AND Descripcion LIKE  CONCAT(@Nombre,'%%')


CREATE PROCEDURE AgregarUsos
(@Nombre varchar (30)
)
AS
SET NOCOUNT ON;

if exists (select Descripcion  from Usos where Descripcion=@Nombre and Estado = 1)raiserror('Error!! Este Uso ya existe, utiliza otro por favor', 16, 1)
else if exists (select Descripcion from Usos where Descripcion=@Nombre and Estado = 0) UPDATE Usos SET Estado = 1
 WHERE Descripcion = @Nombre
ELSE

INSERT INTO [dbo].[Usos]
           ([Descripcion])
     VALUES
           (@Nombre)
GO



CREATE PROCEDURE EditarUsos
(	@ID int,
	@Nombre varchar (30)
)
AS
SET NOCOUNT ON;

UPDATE [dbo].[Usos]
   SET [Descripcion] = @Nombre
	Where PKIdUsos = @ID and Estado!=0
GO


CREATE PROCEDURE EliminarUsos
(
	@Id int
)
AS
SET NOCOUNT ON;
UPDATE Usos
   SET Estado = 0
 WHERE PKIdUsos = @Id And Estado = 1
GO

-------------------------------------------------CONSULTAS USUARIOS-----------------------------------------------------------------------------------------------------------
------------------------------------------------------------POR ID------------------------------------------
CREATE PROCEDURE ConsultaUsuarioPorID
@IDUsuario Int
AS
SET NOCOUNT ON;

SELECT PKIdUsuario 'ID', Usuario 'Nombre', password'Contraseña', E.NombreEmpleado'Nombre Empleado', P.PerfilNombre'Nombre Perfil' FROM Usuarios
INNER JOIN Empleados E
ON E.PKIdEmpleado = Usuarios.FKEmpleados
INNER JOIN Perfiles P
ON P.PKIdPerfiles = Usuarios.FKPerfiles
WHERE PKIdUsuario = @IDUsuario  AND estadoUsuario != 0

EXEC ConsultaUsuarioPorID 1


------------------------------------------------------------POR NULL------------------------------------------
CREATE PROCEDURE ConsultaUsuarioVacio
AS
SET NOCOUNT ON;

SELECT PKIdUsuario 'ID', Usuario 'Nombre', password'Contraseña', E.NombreEmpleado'Nombre Empleado', P.PerfilNombre'Nombre Perfil' FROM Usuarios
INNER JOIN Empleados E
ON E.PKIdEmpleado = Usuarios.FKEmpleados
INNER JOIN Perfiles P
ON P.PKIdPerfiles = Usuarios.FKPerfiles
WHERE estadoUsuario !=0

EXEC ConsultaUsuarioVacio

CREATE PROCEDURE ConsultaPorUsuario@User Varchar(30)ASSET NOCOUNT ON;SELECT PKIdUsuario 'ID', Usuario 'Nombre', password'Contraseña', E.NombreEmpleado'Nombre Empleado', P.PerfilNombre'Nombre Perfil' FROM UsuariosINNER JOIN Empleados EON E.PKIdEmpleado = Usuarios.FKEmpleadosINNER JOIN Perfiles PON P.PKIdPerfiles = Usuarios.FKPerfilesWHERE Usuario LIKE CONCAT (@User, '%%') AND estadoUsuario !=0



------------------------------------------------------------INSERTAR------------------------------------------------------------

ALTER PROCEDURE InsertarUsuario
@User Varchar(30),
@Pass Varchar(50),
@IdEmpleado Int,
@IdPerfil Int
AS
SET NOCOUNT ON;
BEGIN
if exists (select @User from Usuarios where Usuario=@User and estadoUsuario = 1)raiserror('Error!! Este Usuario ya existe, utiliza otro por favor', 16, 1)
else if exists (select @User from Usuarios where Usuario =@User and estadoUsuario = 0) UPDATE Usuarios SET estadoUsuario = 1 
 WHERE Usuario = @User
ELSE
INSERT INTO Usuarios (Usuario,password, FKEmpleados,FKPerfiles) VALUES
( @User,@Pass,@IdEmpleado,@IdPerfil)
END

----------------------------------------------------------------ACTUALIZAR----------------------------------------------------
CREATE PROCEDURE ActualizarUsuario
@IdUser Int,
@User Varchar(30),
@Pass Varchar(50),
@IdEmpleado Int,
@IdPerfil Int
AS
SET NOCOUNT ON;
BEGIN
UPDATE Usuarios
SET Usuario = @User,
        password = @Pass,
		FKEmpleados = @IdEmpleado,
		FKPerfiles = @IdPerfil
 WHERE PKIdUsuario = @IdUser
END

EXEC ActualizarUsuario 3,Juan,Hello,1,1



GO

CREATE PROCEDURE EliminarUsuario
(@IdUser Int)
AS
SET NOCOUNT ON;
BEGIN
if exists (select PKIdUsuario from Usuarios where PKIdUsuario=@IdUser and estadoUsuario = 0)raiserror('Error!! Este Usuario no esta disponible, utiliza otro por favor', 16, 1)
else (select @IdUser from Usuarios where Usuario =@IdUser and estadoUsuario = 1) UPDATE Usuarios SET estadoUsuario = 0 
WHERE PKIdUsuario = @IdUser
END

EXEC EliminarUsuario 2


-----------------------------------------------------------PROCEDIMIENTOS ALMACENADOS PAR ESTADOS CIVILES-------------------------------------

--------------------------------------------------------------------------------BUSCAR POR NOMBRE---------------------------------------------------------
CREATE PROCEDURE ConsultaPorNombreEstadoCivil
@Nombre VARCHAR(30)
AS
SET NOCOUNT ON;
SELECT PKIdEstadoCivil 'ID', NombreEstadoCivil 'Estado Civil' FROM EstadosCiviles
WHERE NombreEstadoCivil LIKE CONCAT (@Nombre, '%%') AND EstadoEstadosCivil !=0

EXEC ConsultaPorNombreEstadoCivil 'S'

--------------------------------------------------------------------------------BUSCAR POR ID---------------------------------------------------------
CREATE PROCEDURE ConsultaPorIDEstadoCivil
@ID Int
AS
SET NOCOUNT ON;
SELECT PKIdEstadoCivil 'ID', NombreEstadoCivil 'Estado Civil' FROM EstadosCiviles
WHERE PKIdEstadoCivil = @ID AND EstadoEstadosCivil !=0

EXEC ConsultaPorIDEstadoCivil 2


CREATE PROC ConsultaVacioEStadoCivil
AS
SET NOCOUNT ON;
BEGIN
SELECT PKIdEstadoCivil 'ID', NombreEstadoCivil 'Estado Civil' FROM EstadosCiviles
WHERE EstadoEstadosCivil !=0
END

EXEC ConsultaVacioEStadoCivil

--------------------------------------------------CRUD PARA ESTADS CIVILES -------------------------------------------

------------------------------------------------------------INSERTAR------------------------------------------------------------

CREATE PROCEDURE InsertarEstadoCivil
@Nombre Varchar(30)
AS
SET NOCOUNT ON;
BEGIN
if exists (select @Nombre from EstadosCiviles where NombreEstadoCivil=@Nombre and EstadoEstadosCivil = 1)raiserror('Error!! Este Estado Civil ya existe, utiliza otro por favor', 16, 1)
else if exists (select @Nombre from EstadosCiviles where NombreEstadoCivil =@Nombre and EstadoEstadosCivil = 0) UPDATE EstadosCiviles SET EstadoEstadosCivil = 1 
 WHERE NombreEstadoCivil = @Nombre
ELSE
INSERT INTO EstadosCiviles(NombreEstadoCivil) VALUES
( @Nombre)
END

EXEC InsertarEstadoCivil 'Casado'


------------------------------------------------------------ACTUALIZAR------------------------------------------

CREATE PROC ActualizarEstadoCivil
@IDEstadoCivil Int,
@Nombre VARCHAR(30)
AS
SET NOCOUNT ON;
BEGIN
UPDATE EstadosCiviles
SET NombreEstadoCivil = @Nombre
WHERE PKIdEstadoCivil = @IDEstadoCivil
END

EXEC ActualizarEstadoCivil 4,'UnionLibre'

---------------------------------------------------------------------ELIMINAR---------------------------------------------
CREATE PROCEDURE EliminarEstadoCivil
(
	@Id int
)
AS
SET NOCOUNT ON;
UPDATE EstadosCiviles
   SET EstadoEstadosCivil = 0
 WHERE PKIdEstadoCivil = @Id And EstadoEstadosCivil = 1
GO