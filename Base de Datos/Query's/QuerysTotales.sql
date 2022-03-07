
--REINICIAR CONTADOR IDENTITY
--DBCC CHECKIDENT ('Compras', RESEED, 1)


use FarmaciaDesarrollo
go

-------------------------------------------------TABLA CLIENTES-----------------------------------------------------------------------------------------------------------

-------------------------------------------------CONSULTAS CLIENTE-----------------------------------------------------------------------------------------------------------
Create PROCEDURE ConsultaGeneralCLiente
	AS
	SET NOCOUNT ON;
	SELECT PKIDcliente 'Id',[IdentidadCliente]'Identidad',[NombreCliente]'Nombre',[ApellidoCliente] 'Apellido',[TelefonoCliente] 'Telefono',[CorreoCliente] 'Correo',
	[DireccionCliente] 'Dirección'  From Clientes
	WHERE EstadoCliente != 0
	GO
CREATE PROCEDURE ConsultaClientePorCodigo
@Codigo int
AS 
SET NOCOUNT ON;

SELECT PKIDcliente 'Id',[IdentidadCliente]'Identidad',[NombreCliente]'Nombre',[ApellidoCliente] 'Apellido',[TelefonoCliente] 'Telefono',[CorreoCliente] 'Correo',
[DireccionCliente] 'Dirección'  From Clientes WHERE PKIDcliente = @Codigo AND EstadoCliente !=0
GO
CREATE PROCEDURE ConsultaClientePorNombre 
@Nombre nchar(30)
AS
SET NOCOUNT ON;

SELECT PKIDcliente 'Id',[IdentidadCliente]'Identidad',[NombreCliente]'Nombre',[ApellidoCliente] 'Apellido',[TelefonoCliente] 'Telefono',[CorreoCliente] 'Correo',
[DireccionCliente] 'Dirección'  From Clientes WHERE NombreCliente LIKE  CONCAT(@Nombre,'%%') AND EstadoCliente !=0
GO

-------------------------------------------------CRUD CLIENTE-----------------------------------------------------------------------------------------------------------

CREATE PROCEDURE AgregarCliente
(@Identidad varchar (15),
@Nombre varchar (30),
@Apellido varchar (30),
@Telefono varchar (16),
@Correo varchar (50),
@Direccion varchar (100)
)
AS
SET NOCOUNT ON;
if exists (select IdentidadCliente  from Clientes where IdentidadCliente=@Identidad and EstadoCliente = 1)raiserror('Error!! Este Producto ya existe, utiliza otro por favor', 16, 1)
else if exists (select IdentidadCliente from Clientes where IdentidadCliente=@Identidad and EstadoCliente = 0) UPDATE Clientes SET EstadoCliente = 1
 WHERE IdentidadCliente = @Identidad
ELSE

INSERT INTO [dbo].[Clientes]
           ([IdentidadCliente]
           ,[NombreCliente]
           ,[ApellidoCliente]
           ,[TelefonoCliente]
           ,[CorreoCliente]
           ,[DireccionCliente])
     VALUES(
		@Identidad,
		@Nombre,
		@Apellido,
		@Telefono,
		@Correo,
		@Direccion)
GO
CREATE PROCEDURE EditarCliente
(
	@Id int,
	@Identidad varchar (15),
	@Nombre varchar (30),
	@Apellido varchar (30),
	@Telefono varchar (16),
	@Correo varchar (50),
	@Direccion varchar (100)

)
AS
SET NOCOUNT ON;
UPDATE Clientes
   SET [IdentidadCliente] = @Identidad,
       [NombreCliente] = @Nombre,
       [ApellidoCliente] = @Apellido,
       [TelefonoCliente] = @Telefono,
       [CorreoCliente] = @Correo,
       [DireccionCliente] = @Direccion
 WHERE PKIDcliente = @Id And EstadoCliente = 1
GO
CREATE PROCEDURE EliminarCliente
(
	@Id int
)
AS
SET NOCOUNT ON;

UPDATE Clientes
   SET EstadoCliente = 0
 WHERE PKIDcliente = @Id And EstadoCliente = 1
GO

-------------------------------------------------TABLA PROVEEDORES-----------------------------------------------------------------------------------------------------------

-------------------------------------------------CONSULTAS Proveedor-----------------------------------------------------------------------------------------------------------

CREATE PROCEDURE ConsultaGeneralProveedor
	AS
	SET NOCOUNT ON;

	SELECT        PKIdProveedor [Proveedor], NombreProveedor [Nombre], TelefonoProveedor [Telefono], CorreoProveedor [Correo Electrónico], DireccionProveedor [Dirección], RTNProveedor[RTN]
	FROM            Proveedores
	WHERE EstadoProveedores != 0
	GO
CREATE PROCEDURE ConsultaProveedorPorCodigo
@Codigo int
AS 
SET NOCOUNT ON;

SELECT        PKIdProveedor [Proveedor], NombreProveedor [Nombre], TelefonoProveedor [Telefono], CorreoProveedor [Correo Electrónico], DireccionProveedor [Dirección], RTNProveedor[RTN]
FROM            Proveedores
WHERE PKIdProveedor = @Codigo AND EstadoProveedores != 0
GO
CREATE PROCEDURE ConsultaProveedorPorNombre 
@Nombre varchar(30)
AS
SET NOCOUNT ON;
SELECT        PKIdProveedor [Proveedor], NombreProveedor [Nombre], TelefonoProveedor [Telefono], CorreoProveedor [Correo Electrónico], DireccionProveedor [Dirección], RTNProveedor[RTN]
FROM            Proveedores
WHERE NombreProveedor  LIKE  CONCAT(@Nombre,'%%') AND EstadoProveedores != 0
GO
-------------------------------------------------CRUD Proveedor-----------------------------------------------------------------------------------------------------------


CREATE PROCEDURE AgregarProveedor
(@Nombre varchar (50),
@Telefono varchar (15),
@Correo varchar (100),
@Direccion varchar (100),
@RTN varchar (16)
)
AS
SET NOCOUNT ON;
if exists (select NombreProveedor  from Proveedores where NombreProveedor=@Nombre and EstadoProveedores = 1)raiserror('Error!! Este Producto ya existe, utiliza otro por favor', 16, 1)
else if exists (select NombreProveedor from Proveedores where NombreProveedor=@Nombre and EstadoProveedores = 0) UPDATE Proveedores SET EstadoProveedores = 1
 WHERE NombreProveedor = @Nombre
ELSE
INSERT INTO Proveedores
           ([NombreProveedor]
           ,[TelefonoProveedor]
           ,[CorreoProveedor]
           ,[DireccionProveedor]
           ,[RTNProveedor])
     VALUES
           (
		@Nombre,
		@Telefono,
		@Correo,
		@Direccion,
		@RTN)
GO

CREATE PROCEDURE EditarProveedor(
	@Id int,
	@Nombre varchar (50),
	@Telefono varchar (15),
	@Correo varchar (100),
	@Direccion varchar (100),
	@RTN varchar (16)
)
AS
SET NOCOUNT ON;
UPDATE Proveedores
   SET 
       NombreProveedor = @Nombre,
       TelefonoProveedor = @Telefono,
       CorreoProveedor = @Correo,
       DireccionProveedor = @Direccion,
	   RTNProveedor = @RTN
 WHERE PKIdProveedor = @Id And EstadoProveedores = 1
GO


CREATE PROCEDURE EliminarProveedor
(
	@Id int
)
AS
SET NOCOUNT ON;
UPDATE Proveedores
   SET EstadoProveedores = 0
 WHERE PKIdProveedor = @Id And EstadoProveedores = 1
GO

-------------------------------------------------TABLA PERFILES-----------------------------------------------------------------------------------------------------------
-------------------------------------------------CONSULTAS PERFILES-----------------------------------------------------------------------------------------------------------

Create PROCEDURE ConsultaGeneralPerfiles
	AS
	SET NOCOUNT ON;

SELECT        PKIdPerfiles [Id], PerfilNombre[Perfil]
FROM            Perfiles
WHERE EstadoPerfil != 0
go


CREATE PROCEDURE ConsultaPerfilPorCodigo
@Codigo int
AS 
SET NOCOUNT ON;
SELECT        PKIdPerfiles [Id], PerfilNombre[Perfil]
FROM            Perfiles
WHERE PKIdPerfiles = @Codigo AND EstadoPerfil != 0
GO

CREATE PROCEDURE ConsultaPerfilesPorNombre 
@Nombre nchar(30)
AS
SET NOCOUNT ON;
SELECT        PKIdPerfiles [Id], PerfilNombre[Perfil]
FROM            Perfiles
WHERE PerfilNombre  LIKE  CONCAT('%',@Nombre,'%') AND EstadoPerfil != 0
GO

-------------------------------------------------CRUD PERFILES-----------------------------------------------------------------------------------------------------------

CREATE PROCEDURE AgregarPerfiles
(@Nombre varchar (50)
)
AS
SET NOCOUNT ON;
if exists (select PerfilNombre  from Perfiles where PerfilNombre=@Nombre and EstadoPerfil = 1)raiserror('Error!! Este Producto ya existe, utiliza otro por favor', 16, 1)
else if exists (select PerfilNombre from Perfiles where PerfilNombre=@Nombre and EstadoPerfil = 0) UPDATE Perfiles SET EstadoPerfil = 1
 WHERE PerfilNombre = @Nombre
INSERT INTO Perfiles
           ([PerfilNombre])

     VALUES(
		@Nombre)
GO

CREATE PROCEDURE EditarPerfiles
	(
	@Id int,
	@Nombre varchar (30)
	)
AS
SET NOCOUNT ON;
UPDATE Perfiles
   SET 
       PerfilNombre = @Nombre
 WHERE PKIdPerfiles = @Id And EstadoPerfil = 1
GO

CREATE PROCEDURE EliminarPerfiles
(
	@Id int
)
AS
SET NOCOUNT ON;

UPDATE Perfiles
   SET EstadoPerfil = 0
 WHERE PKIdPerfiles = @Id And EstadoPerfil = 1
GO
-------------------------------------------------TABLA EMPLEADO-----------------------------------------------------------------------------------------------------------
-------------------------------------------------CONSULTAS EMPLEADO-----------------------------------------------------------------------------------------------------------
Create PROCEDURE ConsultaGeneralEmpleado
	AS
	SET NOCOUNT ON;
	SELECT        Empleados.PKIdEmpleado [Id], Empleados.IdentidadEmpleado [Identidad], Empleados.NombreEmpleado [Nombre], Empleados.ApellidoEmpleado [Apellido], Empleados.TelefonoEmpleado [Telefono], Empleados.CorreoEmpleado [Correo], EstadosCiviles.NombreEstadoCivil [Estado Civil], 
                         Empleados.FechaNacimientoEmpleado
FROM Empleados INNER JOIN
    EstadosCiviles ON Empleados.FkEstadoCivilEmpleado = EstadosCiviles.PKIdEstadoCivil
	Where EstadoEmpleado != 0 
GO

CREATE PROCEDURE ConsultaEmpleadoPorCodigo
@Codigo int
AS 
SET NOCOUNT ON;
SELECT        Empleados.PKIdEmpleado [Id], Empleados.IdentidadEmpleado [Identidad], Empleados.NombreEmpleado [Nombre], Empleados.ApellidoEmpleado [Apellido], Empleados.TelefonoEmpleado [Telefono], Empleados.CorreoEmpleado [Correo], EstadosCiviles.NombreEstadoCivil [Estado Civil], 
                         Empleados.FechaNacimientoEmpleado
FROM            Empleados INNER JOIN
                         EstadosCiviles ON Empleados.FkEstadoCivilEmpleado = EstadosCiviles.PKIdEstadoCivil
						 Where EstadoEmpleado != 0 AND PKIdEmpleado = @Codigo
GO

CREATE PROCEDURE ConsultaEmpleadoPorNombre 
@Nombre nchar(30)
AS
SET NOCOUNT ON;
SELECT        Empleados.PKIdEmpleado [Id], Empleados.IdentidadEmpleado [Identidad], Empleados.NombreEmpleado [Nombre], Empleados.ApellidoEmpleado [Apellido], Empleados.TelefonoEmpleado [Telefono], Empleados.CorreoEmpleado [Correo], EstadosCiviles.NombreEstadoCivil [Estado Civil], 
                         Empleados.FechaNacimientoEmpleado
FROM            Empleados INNER JOIN
                         EstadosCiviles ON Empleados.FkEstadoCivilEmpleado = EstadosCiviles.PKIdEstadoCivil
						 Where EstadoEmpleado != 0 AND NombreEmpleado LIKE  CONCAT(@Nombre,'%%')
GO
-------------------------------------------------CRUD EMPLEADO-----------------------------------------------------------------------------------------------------------

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
-------------------------------------------------TABLA USOS-----------------------------------------------------------------------------------------------------------

-------------------------------------------------CONSULTAS USOS-----------------------------------------------------------------------------------------------------------
CREATE PROCEDURE ConsultaGeneralUsos
	AS
	SET NOCOUNT ON;
	SELECT       PKIdUsos [ID], Descripcion [Descripción]
FROM            Usos
WHERE Estado!= 0
GO
CREATE PROCEDURE ConsultaUsosPorCodigo
@Codigo int
AS 
SET NOCOUNT ON;
SELECT       PKIdUsos [ID], Descripcion [Descripción]
FROM            Usos
WHERE Estado!= 0 AND PKIdUsos = @Codigo
GO
CREATE PROCEDURE ConsultaUsosPorNombre 
@Nombre nchar(30)
AS
SET NOCOUNT ON;
SELECT       PKIdUsos [ID], Descripcion [Descripción]
FROM            Usos
WHERE Estado!= 0 AND Descripcion LIKE  CONCAT(@Nombre,'%%')
GO

-------------------------------------------------CRUD USOS-----------------------------------------------------------------------------------------------------------

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

-------------------------------------------------TABLA USUARIOS-----------------------------------------------------------------------------------------------------------
-------------------------------------------------CONSULTA USUARIOS--------------------------------------------------------------------------------------------------------
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
GO

EXEC ConsultaUsuarioPorID 3

CREATE PROCEDURE ConsultaUsuarioGeneral
AS
SET NOCOUNT ON;
SELECT PKIdUsuario 'ID', Usuario 'Nombre', password'Contraseña', E.NombreEmpleado'Nombre Empleado', P.PerfilNombre'Nombre Perfil' FROM Usuarios
INNER JOIN Empleados E
ON E.PKIdEmpleado = Usuarios.FKEmpleados
INNER JOIN Perfiles P
ON P.PKIdPerfiles = Usuarios.FKPerfiles
WHERE estadoUsuario !=0
go

CREATE PROCEDURE ConsultaPorUsuario
@User Varchar(30)
AS
SET NOCOUNT ON;
SELECT PKIdUsuario 'ID', Usuario 'Nombre', password'Contraseña', E.NombreEmpleado'Nombre Empleado', P.PerfilNombre'Nombre Perfil' FROM Usuarios
INNER JOIN Empleados E
ON E.PKIdEmpleado = Usuarios.FKEmpleados
INNER JOIN Perfiles P
ON P.PKIdPerfiles = Usuarios.FKPerfiles
WHERE Usuario LIKE CONCAT (@User, '%%') AND estadoUsuario !=0
GO

EXEC ConsultaPorUsuario 'J'
------------------------------------------------------------CRUD USUARIOS------------------------------------------------------------

CREATE PROCEDURE InsertarUsuario
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
GO

CREATE PROCEDURE EditarUsuario
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
GO

-----------------------------------------------------------TABLA ESTADOS CIVILES-------------------------------------

-----------------------------------------------------------CONSULTAS ESTADOS CIVILES-------------------------------------
CREATE PROCEDURE ConsultaPorNombreEstadoCivil
@Nombre VARCHAR(30)
AS
SET NOCOUNT ON;
SELECT PKIdEstadoCivil 'ID', NombreEstadoCivil 'Estado Civil' FROM EstadosCiviles
WHERE NombreEstadoCivil LIKE CONCAT (@Nombre, '%%') AND EstadoEstadosCivil !=0
GO


CREATE PROCEDURE ConsultaPorIDEstadoCivil
@ID Int
AS
SET NOCOUNT ON;
SELECT PKIdEstadoCivil 'ID', NombreEstadoCivil 'Estado Civil' FROM EstadosCiviles
WHERE PKIdEstadoCivil = @ID AND EstadoEstadosCivil !=0
GO

CREATE PROC ConsultaEstadoCivilGeneral
AS
SET NOCOUNT ON;
BEGIN
SELECT PKIdEstadoCivil 'ID', NombreEstadoCivil 'Estado Civil' FROM EstadosCiviles
WHERE EstadoEstadosCivil !=0
END
GO

--------------------------------------------------CRUD PARA ESTADS CIVILES -------------------------------------------

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
GO

CREATE PROC EditarEstadoCivil
@IDEstadoCivil Int,
@Nombre VARCHAR(30)
AS
SET NOCOUNT ON;
BEGIN
UPDATE EstadosCiviles
SET NombreEstadoCivil = @Nombre
WHERE PKIdEstadoCivil = @IDEstadoCivil
END
GO

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

----------------------------------------------------------TABLA PRODUCTOS---------------------------------------------------------------------------------
----------------------------------------------------------CONSULTAS PRODUCTOS-----------------------------------------------------------------------------
CREATE PROCEDURE ConsultaProductoPorNombre
@NombreProducto Varchar(30)
AS
SET NOCOUNT ON;
SELECT  P.IDProducto 'ID', P.NombreProducto 'Nombre', P.Precio 'Precio', P.CantidadProducto 'Cantidad',
L.NombreLaboratorio 'Laboratorio', PROV.NombreProveedor 'Proveedor', U.Descripcion 'Usos', CP.NombreCategoria 'Categoria' FROM Productos P 
INNER JOIN Labororios L
ON P.FKIdLaboratorio = L.IdLaboratorio
INNER JOIN Usos U
ON P.FKIdUsos = U.PKIdUsos 
INNER JOIN Proveedores PROV
ON P.FkIdProveedor = PROV.PKIdProveedor
INNER JOIN CategoriaProducto CP
ON CP.IdCategoriaProducto = P.FKIdCategoria
WHERE P.NombreProducto LIKE CONCAT (@NombreProducto, '%%') AND EstadoProducto !=0
GO

CREATE PROCEDURE ConsultaProductoPorID
@IDProducto Int
AS
SET NOCOUNT ON;
SELECT  P.IDProducto 'ID', P.NombreProducto 'Nombre', P.Precio 'Precio', P.CantidadProducto 'Cantidad',
L.NombreLaboratorio 'Laboratorio', PROV.NombreProveedor 'Proveedor', U.Descripcion 'Usos', CP.NombreCategoria 'Categoria' FROM Productos P 
INNER JOIN Labororios L
ON P.FKIdLaboratorio = L.IdLaboratorio
INNER JOIN Usos U
ON P.FKIdUsos = U.PKIdUsos 
INNER JOIN Proveedores PROV
ON P.FkIdProveedor = PROV.PKIdProveedor
INNER JOIN CategoriaProducto CP
ON CP.IdCategoriaProducto = P.FKIdCategoria
WHERE IDProducto = @IDProducto  AND EstadoProducto != 0
GO


CREATE PROCEDURE ConsultaProductoGeneral
AS
SET NOCOUNT ON;
SELECT  P.IDProducto 'ID', P.NombreProducto 'Nombre', P.Precio 'Precio', P.CantidadProducto 'Cantidad',
L.NombreLaboratorio 'Laboratorio', PROV.NombreProveedor 'Proveedor', U.Descripcion 'Usos', CP.NombreCategoria 'Categoria' FROM Productos P 
INNER JOIN Labororios L
ON P.FKIdLaboratorio = L.IdLaboratorio
INNER JOIN Usos U
ON P.FKIdUsos = U.PKIdUsos 
INNER JOIN Proveedores PROV
ON P.FkIdProveedor = PROV.PKIdProveedor
INNER JOIN CategoriaProducto CP
ON CP.IdCategoriaProducto = P.FKIdCategoria
WHERE EstadoProducto != 0
go
--------------------------------------------------CRUD PARA PRODUCTOS -------------------------------------------

CREATE PROCEDURE InsertarUnProducto
@NombreProducto Nchar(30),
@Precio float,
@Cantidad Int,
@EstadoProducto Int,
@IdLaboratorio int,
@IdProveedor Int,
@IdCategoria Int,
@IdUsos Int
AS
SET NOCOUNT ON;
BEGIN
if exists (select @NombreProducto from Productos where NombreProducto=@NombreProducto and EstadoProducto = 1)raiserror('Error!! Este Producto ya existe, utiliza otro por favor', 16, 1)
else if exists (select @NombreProducto from Productos where NombreProducto=@NombreProducto and EstadoProducto = 0) UPDATE [Productos]SET EstadoProducto = 1 
 WHERE NombreProducto = @NombreProducto
ELSE
INSERT INTO Productos VALUES
( @NombreProducto, @Precio, @Cantidad, @EstadoProducto, @IdLaboratorio, @IdProveedor, @IdCategoria, @IdUsos)
END
GO

CREATE PROCEDURE EditarProducto
@IDProducto Int,
@NombreProducto Nchar(30),
@Precio float,
@Cantidad Int,
@EstadoProducto Int,
@IdLaboratorio int,
@IdProveedor Int,
@IdCategoria Int,
@IdUsos Int
AS
SET NOCOUNT ON;
BEGIN
UPDATE Productos
SET NombreProducto = @NombreProducto,
        Precio = @Precio,
		CantidadProducto = @Cantidad,
		EstadoProducto = @EstadoProducto,
		FKIdLaboratorio = @IdLaboratorio,
		FkIdProveedor = @IdProveedor,
		FKIdCategoria = @IdCategoria,
		FKIdUsos = @IdUsos
WHERE IDProducto = @IDProducto
END
GO

CREATE PROCEDURE EliminarProducto
@Id int
AS
SET NOCOUNT ON;
BEGIN
UPDATE Productos
SET EstadoProducto = 0
WHERE IDProducto = @Id AND EstadoProducto =1
END
GO
--------------------------------------------------------------------TABLA CATEGORIA PRODUCTO------------------------------------------------

---------------------------------------------------------------------CONSULTAS CATEGORIA PRODUCTO--------------------------------------------------------

CREATE PROCEDURE ConsultaCategoriaProductoPorNombre
@NombreCatProducto Varchar(30)
AS
SET NOCOUNT ON;
SELECT [IdCategoriaProducto] 'ID' ,[NombreCategoria] 'Nombre' FROM CategoriaProducto
WHERE NombreCategoria LIKE CONCAT (@NombreCatProducto, '%%') AND EstadoCategoria != 0
GO

CREATE  PROCEDURE ConsultaCategoriaProductoPorID
@IDCategoriaProducto Int
AS
SET NOCOUNT ON;
SELECT [IdCategoriaProducto] 'ID' ,[NombreCategoria] 'Nombre' FROM CategoriaProducto
WHERE IdCategoriaProducto = @IDCategoriaProducto AND EstadoCategoria !=0
GO

CREATE PROCEDURE ConsultaCategoriaProductoGeneral
AS
SET NOCOUNT ON;
SELECT [IdCategoriaProducto] 'ID' ,[NombreCategoria] 'Nombre' FROM CategoriaProducto 
WHERE EstadoCategoria !=0
GO

--------------------------------------------------CRUD PARA CATEGORIA PRODUCTOS -------------------------------------------

CREATE PROCEDURE InsertarCategoriaProducto
@NombreCategoria Varchar(30)
AS
SET NOCOUNT ON;
BEGIN

if exists (select @NombreCategoria from CategoriaProducto where NombreCategoria=@NombreCategoria and EstadoCategoria = 1)raiserror('Error!! Esta Categoria ya existe, utiliza otro por favor', 16, 1)
else if exists (select @NombreCategoria from CategoriaProducto Where NombreCategoria=@NombreCategoria and EstadoCategoria = 0) UPDATE CategoriaProducto SET EstadoCategoria = 1
 WHERE NombreCategoria = @NombreCategoria
ELSE
INSERT INTO CategoriaProducto  (NombreCategoria)VALUES
( @NombreCategoria)
END
GO

CREATE PROCEDURE EditarCategoriaProducto
@IdCategoria Int,
@NombreCategoria Varchar(30),
@EstadoCategoria Int
AS
SET NOCOUNT ON;
BEGIN
UPDATE CategoriaProducto
SET NombreCategoria = @NombreCategoria,
        EstadoCategoria = @EstadoCategoria
WHERE IdCategoriaProducto = @IdCategoria
END
GO

CREATE PROCEDURE EliminarCategoriaProducto
@Id Int
AS
SET NOCOUNT ON;
BEGIN
UPDATE CategoriaProducto
SET EstadoCategoria = 0
WHERE IdCategoriaProducto = @Id AND EstadoCategoria =1
END
GO

-------------------------------------------------TABLA LABORATORIO------------------------------------------------

------------------------------------------------CONSULTAS LABORTORIO---------------------------------------------------------

CREATE PROCEDURE ConsultaLaboratorioPorNombre
@NombreLab Varchar(30)
AS
SET NOCOUNT ON;
SELECT [IdLaboratorio] 'ID' , [NombreLaboratorio] 'Nombre' FROM Labororios
WHERE NombreLaboratorio  LIKE CONCAT (@NombreLab, '%%') AND EstadoLaboratorio !=0
GO

CREATE PROCEDURE ConsultaLaboratorioPorID
@IDLaboratorio Int
AS
SET NOCOUNT ON;
SELECT [IdLaboratorio] 'ID' , [NombreLaboratorio] 'Nombre' FROM Labororios
WHERE IdLaboratorio = @IDLaboratorio AND EstadoLaboratorio !=0
GO

CREATE PROCEDURE ConsultaLaboratorioGeneral
AS
SET NOCOUNT ON;
SELECT [IdLaboratorio] 'ID' , [NombreLaboratorio] 'Nombre' FROM Labororios
WHERE EstadoLaboratorio !=0
GO

--------------------------------------------------CRUD PARA LABORATORIOS -------------------------------------------

CREATE PROCEDURE InsertarLaboratorio
@NombreLaboratorio Varchar(30)
AS
SET NOCOUNT ON;
BEGIN

if exists (select @NombreLaboratorio from Labororios where NombreLaboratorio=@NombreLaboratorio and EstadoLaboratorio = 1)raiserror('Error!! Este Laboratorio ya existe, utiliza otro por favor', 16, 1)
else if exists (select @NombreLaboratorio from Labororios Where NombreLaboratorio=@NombreLaboratorio and EstadoLaboratorio = 0) UPDATE Labororios SET EstadoLaboratorio = 1
 WHERE NombreLaboratorio = @NombreLaboratorio
ELSE
INSERT INTO Labororios (NombreLaboratorio)VALUES
( @NombreLaboratorio)
END
GO

CREATE PROCEDURE EditarLaboratorio
@IdLaboratorio Int,
@NombreLab Varchar(30),
@EstadoLab int
AS
SET NOCOUNT ON;
BEGIN
UPDATE Labororios
SET  NombreLaboratorio = @NombreLab,
         EstadoLaboratorio = @EstadoLab
WHERE IdLaboratorio = @IdLaboratorio
END
GO

CREATE PROCEDURE EliminarLaboratorio
@Id Int
AS
SET NOCOUNT ON;
BEGIN
UPDATE Labororios
SET EstadoLaboratorio = 0
WHERE IdLaboratorio = @Id AND EstadoLaboratorio = 1
END
GO

