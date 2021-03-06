
--REINICIAR CONTADOR IDENTITY
--DBCC CHECKIDENT ('Compras', RESEED, 1)

-----------------------------------------------------------PROCEDIMIENTOS ALMACENADOS PARA PRODUCTOS--------------------------------------
--------------------------------------------------------------------------------BUSCAR POR NOMBRE---------------------------------------------------------
ALTER PROCEDURE ConsultaProductoPorNombre
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

EXEC ConsultaProductoPorNombre 'A'

---------------------------------------------------------------BUSCAR POR ID-------------------------------------------------------------------

ALTER PROCEDURE ConsultaProductoPorID
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

EXEC ConsultaProductoPorID 5

--BUSCAR SI NULL

ALTER PROCEDURE ConsultaProductoVacio
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


EXEC ConsultaProductoVacio


--------------------------------------------------CRUD PARA PRODUCTOS -------------------------------------------

------------------------------------------------------------INSERTAR------------------------------------------------------------

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


EXEC InsertarUnProducto 'Acetaminofen',3,5,1,1,1,1,1
SELECT*FROM Productos
------------------------------------------------------------ACTUALIZAR------------------------------------------------------------

CREATE PROCEDURE ActualizarUnProducto
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

EXEC ActualizarUnProducto 5,'Acetaminofen MK',5,10,1,1,1,1,1


------------------------------------------------------------ELIMINAR------------------------------------------------------------

ALTER PROCEDURE EliminarUnProductoMod
@Id int
AS
SET NOCOUNT ON;
BEGIN
UPDATE Productos
SET EstadoProducto = 0
WHERE IDProducto = @Id
END

SELECT*FROM Productos
EXEC EliminarUnProductoMod 6

SELECT*FROM Productos

------------------------------------------------PROCEDIMIENTOS ALMACENADOS PARA CATEGORIA PRODUCTO------------------------------------------------

--------------------------------------------------------------------------------BUSCAR POR NOMBRE---------------------------------------------------------

ALTER PROCEDURE ConsultaCategoriaProductoPorNombre
@NombreCatProducto Varchar(30)
AS
SET NOCOUNT ON;
SELECT [IdCategoriaProducto] 'ID' ,[NombreCategoria] 'Nombre' FROM CategoriaProducto
WHERE NombreCategoria LIKE CONCAT (@NombreCatProducto, '%%') AND EstadoCategoria != 0

EXEC ConsultaCategoriaProductoPorNombre 'S'

----------------------------------------------------------------------------BUSCAR POR ID------------------------------------------------------------------

ALTER PROCEDURE ConsultaCategoriaProductoPorID
@IDCategoriaProducto Int
AS
SET NOCOUNT ON;
SELECT [IdCategoriaProducto] 'ID' ,[NombreCategoria] 'Nombre' FROM CategoriaProducto
WHERE IdCategoriaProducto = @IDCategoriaProducto AND EstadoCategoria !=0

EXEC ConsultaCategoriaProductoPorID 4

----------------------------------------------------------------------------BUSCAR POR NULL------------------------------------------------------------------

ALTER PROCEDURE ConsultaCategoriaProductoVacio
AS
SET NOCOUNT ON;
SELECT [IdCategoriaProducto] 'ID' ,[NombreCategoria] 'Nombre' FROM CategoriaProducto 
WHERE EstadoCategoria !=0


EXEC ConsultaCategoriaProductoVacio 

--------------------------------------------------CRUD PARA CATEGORIA PRODUCTOS -------------------------------------------

------------------------------------------------------------INSERTAR------------------------------------------------------------

ALTER PROCEDURE InsertarCategoriaProducto
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

EXEC InsertarCategoriaProducto 'Cuidado Corporal'

SELECT * FROM CategoriaProducto
------------------------------------------------------------ACTUALIZAR------------------------------------------------------------

CREATE PROCEDURE ActualizarCategoriaProducto
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

EXEC ActualizarCategoriaProducto 4,'Sistema Nervioso', 0

------------------------------------------------------------ELIMINAR------------------------------------------------------------

ALTER PROCEDURE EliminarCategoriaProducto
@Id Int
AS
SET NOCOUNT ON;
BEGIN
UPDATE CategoriaProducto
SET EstadoCategoria = 0
WHERE IdCategoriaProducto = @Id
END

EXEC EliminarCategoriaProducto 3

------------------------------------------------PROCEDIMIENTOS ALMACENADOS PARA LABORATORIO------------------------------------------------

--------------------------------------------------------------------------------BUSCAR POR NOMBRE---------------------------------------------------------

ALTER PROCEDURE ConsultaLaboratorioPorNombre
@NombreLab Varchar(30)
AS
SET NOCOUNT ON;
SELECT [IdLaboratorio] 'ID' , [NombreLaboratorio] 'Nombre' FROM Labororios
WHERE NombreLaboratorio  LIKE CONCAT (@NombreLab, '%%') AND EstadoLaboratorio !=0

EXEC ConsultaLaboratorioPorNombre 'D'


--------------------------------------------------------------------------------BUSCAR POR ID---------------------------------------------------------

ALTER PROCEDURE ConsultaLaboratorioPorID
@IDLaboratorio Int
AS
SET NOCOUNT ON;
SELECT [IdLaboratorio] 'ID' , [NombreLaboratorio] 'Nombre' FROM Labororios
WHERE IdLaboratorio = @IDLaboratorio AND EstadoLaboratorio !=0

EXEC ConsultaLaboratorioPorID 2

--------------------------------------------------------------------------------BUSCAR POR NULL---------------------------------------------------------

ALTER PROCEDURE ConsultaLaboratorioVacio
AS
SET NOCOUNT ON;
SELECT [IdLaboratorio] 'ID' , [NombreLaboratorio] 'Nombre' FROM Labororios
WHERE EstadoLaboratorio !=0

EXEC ConsultaLaboratorioVacio

--------------------------------------------------CRUD PARA LABORATORIOS -------------------------------------------

------------------------------------------------------------INSERTAR------------------------------------------------------------

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

EXEC InsertarLaboratorio 'FundaFarm' 

SELECT* FROM Labororios
------------------------------------------------------------ACTUALIZAR------------------------------------------------------------

CREATE PROCEDURE ActualizarLaboratorio
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

EXEC ActualizarLaboratorio 2,'FundaFarm',0

------------------------------------------------------------ELIMINAR------------------------------------------------------------

ALTER PROCEDURE EliminarLaboratorio
@Id Int
AS
SET NOCOUNT ON;
BEGIN
UPDATE Labororios
SET EstadoLaboratorio = 0
WHERE IdLaboratorio = @Id
END

EXEC EliminarLaboratorio 3

------------------------------------------------PROCEDIMIENTOS ALMACENADOS PARA COMPRAS------------------------------------------------

--------------------------------------------------------------------------------BUSCAR POR ORDEN_COMPRA---------------------------------------------------------

CREATE PROCEDURE ConsultaComprasPorOrdenCompra
@OrdenCompra Int
AS
SET NOCOUNT ON;
SELECT [IdCompra] 'ID' ,[OrdenCompra]'Orden de Compra', [FKIdProveedor] 'Id Proveedor',[FechaCompra]'Fecha de Compra' FROM Compras C
INNER JOIN Proveedores P
ON C.FKIdProveedor = P.PKIdProveedor
WHERE  OrdenCompra = @OrdenCompra

EXEC ConsultaComprasPorOrdenCompra 1234

------------------------------------------------PROCEDIMIENTOS ALMACENADOS PARA LABORATORIO------------------------------------------------

--------------------------------------------------------------------------------BUSCAR POR ID---------------------------------------------------------

CREATE PROCEDURE ConsultaComprasPorID
@IDCompra Int
AS
SET NOCOUNT ON;
SELECT [IdCompra] 'ID' ,[OrdenCompra]'Orden de Compra', [FKIdProveedor] 'Id Proveedor',[FechaCompra]'Fecha de Compra' FROM Compras C
INNER JOIN Proveedores P
ON C.FKIdProveedor = P.PKIdProveedor
WHERE  IdCompra = @IDCompra


EXEC ConsultaComprasPorID 1

--------------------------------------------------------------------------------BUSCAR POR NULL---------------------------------------------------------

CREATE PROCEDURE ConsultaComprasVacio
AS
SET NOCOUNT ON;
SELECT [IdCompra] 'ID' ,[OrdenCompra]'Orden de Compra', [FKIdProveedor] 'Id Proveedor',[FechaCompra]'Fecha de Compra' FROM Compras C
INNER JOIN Proveedores P
ON C.FKIdProveedor = P.PKIdProveedor

EXEC ConsultaComprasVacio 

--------------------------------------------------CRUD PARA COMPRAS -------------------------------------------

------------------------------------------------------------INSERTAR------------------------------------------------------------

ALTER PROCEDURE InsertarCompras
@OrdenCompra Int,
@IdProveedores int,
@FechaCompra DATE
AS
SET NOCOUNT ON;
BEGIN
if exists (select @OrdenCompra from Compras where OrdenCompra=@OrdenCompra and EstadoCompra = 1)raiserror('Error!! Esta Compra ya existe, utiliza otro por favor', 16, 1)
else if exists (select @OrdenCompra from Compras Where OrdenCompra=@OrdenCompra and EstadoCompra = 0) UPDATE Compras SET EstadoCompra = 1
 WHERE OrdenCompra = @OrdenCompra
ELSE
INSERT INTO Compras (OrdenCompra, FKIdProveedor, FechaCompra)  VALUES
(@OrdenCompra, @IdProveedores, @FechaCompra)
END

SELECT*FROM Compras
EXEC InsertarCompras 4321,1, '2022-05-03'


ALTER PROCEDURE InsertarCategoriaProducto
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

------------------------------------------------------------ACTUALIZAR------------------------------------------------------------

CREATE PROCEDURE ActualizarCompras
@IDCompra Int,
@OrdenCompra Int,
@IdProveedor Int,
@FechaCompra Date
AS
SET NOCOUNT ON;
BEGIN
UPDATE Compras
SET OrdenCompra =@OrdenCompra,
        FKIdProveedor = @IdProveedor,
		FechaCompra = @FechaCompra
WHERE IdCompra = @IDCompra
END

EXEC ActualizarCompras 1, 1234,1,'2022/05/02'

------------------------------------------------------------ELIMINAR------------------------------------------------------------

CREATE PROCEDURE EliminarCompras
@IDcompra Int
AS
SET NOCOUNT ON;
BEGIN
DELETE FROM Compras
WHERE IdCompra = @IDcompra
END

EXEC EliminarCompras 2



SELECT * FROM Productos
SELECT*FROM Labororios
SELECT*FROM Compras
SELECT*FROM CategoriaProducto

