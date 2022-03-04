--USE AdventureWorks2012;  
--GO  
--CREATE PROCEDURE HumanResources.uspGetEmployeesTest2   
--    @LastName nvarchar(50),   
--    @FirstName nvarchar(50)   
--AS   
--
--    SET NOCOUNT ON;  
 --   SELECT FirstName, LastName, Department  
 --   FROM HumanResources.vEmployeeDepartmentHistory  
  --  WHERE FirstName = @FirstName AND LastName = @LastName  
  --  AND EndDate IS NULL;  
--GO  

--Procedimientos almacenados de CLientes
-------------------------------------------------CONSULTAS CLIENTE-----------------------------------------------------------------------------------------------------------
Create PROCEDURE ConsultaGeneralCLiente
	AS
	SET NOCOUNT ON;

	SELECT PKIDcliente 'Id',[IdentidadCliente]'Identidad',[NombreCliente]'Nombre',[ApellidoCliente] 'Apellido',[TelefonoCliente] 'Telefono',[CorreoCliente] 'Correo',
	[DireccionCliente] 'Dirección'  From Clientes


CREATE PROCEDURE ConsultaClientePorCodigo
@Codigo int
AS 
SET NOCOUNT ON;

SELECT PKIDcliente 'Id',[IdentidadCliente]'Identidad',[NombreCliente]'Nombre',[ApellidoCliente] 'Apellido',[TelefonoCliente] 'Telefono',[CorreoCliente] 'Correo',
[DireccionCliente] 'Dirección'  From Clientes WHERE PKIDcliente = @Codigo

ALTER PROCEDURE ConsultaClientePorNombre 
@Nombre nchar(30)
AS
SET NOCOUNT ON;

SELECT PKIDcliente 'Id',[IdentidadCliente]'Identidad',[NombreCliente]'Nombre',[ApellidoCliente] 'Apellido',[TelefonoCliente] 'Telefono',[CorreoCliente] 'Correo',
[DireccionCliente] 'Dirección'  From Clientes WHERE NombreCliente LIKE  CONCAT('%',@Nombre,'%')


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

-------------------------------------------------CONSULTAS Proveedor-----------------------------------------------------------------------------------------------------------

Create PROCEDURE ConsultaGeneralProveedor
	AS
	SET NOCOUNT ON;

	SELECT        PKIdProveedor [Proveedor], NombreProveedor [Nombre], TelefonoProveedor [Telefono], CorreoProveedor [Correo Electrónico], DireccionProveedor [Dirección], RTNProveedor[RTN]
FROM            Proveedores


CREATE PROCEDURE ConsultaProveedorPorCodigo
@Codigo int
AS 
SET NOCOUNT ON;

SELECT        PKIdProveedor [Proveedor], NombreProveedor [Nombre], TelefonoProveedor [Telefono], CorreoProveedor [Correo Electrónico], DireccionProveedor [Dirección], RTNProveedor[RTN]
FROM            Proveedores
WHERE PKIdProveedor = @Codigo

ALTER PROCEDURE ConsultaProveedorPorNombre 
@Nombre nchar(30)
AS
SET NOCOUNT ON;

SELECT        PKIdProveedor [Proveedor], NombreProveedor [Nombre], TelefonoProveedor [Telefono], CorreoProveedor [Correo Electrónico], DireccionProveedor [Dirección], RTNProveedor[RTN]
FROM            Proveedores
WHERE NombreProveedor  LIKE  CONCAT('%',@Nombre,'%')


CREATE PROCEDURE AgregarProveedor
(@Nombre varchar (50),
@Telefono varchar (15),
@Correo varchar (100),
@Direccion varchar (100),
@RTN varchar (16)
)
AS
SET NOCOUNT ON;

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


-------------------------------------------------CONSULTAS Proveedor-----------------------------------------------------------------------------------------------------------

Create PROCEDURE ConsultaGeneralPerfiles
	AS
	SET NOCOUNT ON;

SELECT        PKIdPerfiles [Id], PerfilNombre[Perfil]
FROM            Perfiles
go


CREATE PROCEDURE ConsultaPerfilPorCodigo
@Codigo int
AS 
SET NOCOUNT ON;

SELECT        PKIdPerfiles [Id], PerfilNombre[Perfil]
FROM            Perfiles
WHERE PKIdPerfiles = @Codigo

CREATE PROCEDURE ConsultaPerfilesPorNombre 
@Nombre nchar(30)
AS
SET NOCOUNT ON;

SELECT        PKIdPerfiles [Id], PerfilNombre[Perfil]
FROM            Perfiles
WHERE PerfilNombre  LIKE  CONCAT('%',@Nombre,'%')


CREATE PROCEDURE AgregarPerfiles
(@Nombre varchar (50)
)
AS
SET NOCOUNT ON;

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

