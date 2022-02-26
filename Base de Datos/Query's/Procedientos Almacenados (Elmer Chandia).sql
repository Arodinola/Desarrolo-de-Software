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
Create PROCEDURE ConsultaClientesGeneral
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


EXEC ConsultaClientePorNombre 'Elm'

select * from Clientes


