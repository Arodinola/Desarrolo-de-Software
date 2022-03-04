
--REINICIAR CONTADOR IDENTITY

-----------------------------------------------------------PROCEDIMIENTOS ALMACENADOS PARA PRODUCTOS--------------------------------------

--------------------------------------------------------------------------------BUSCAR POR NOMBRE---------------------------------------------------------
ALTER PROCEDURE ConsultaProductoPorNombre
ON P.FkIdProveedor = PROV.PKIdProveedor
INNER JOIN CategoriaProducto CP
ON CP.IdCategoriaProducto = P.FKIdCategoria
ON P.FkIdProveedor = PROV.PKIdProveedor
INNER JOIN CategoriaProducto CP
ON CP.IdCategoriaProducto = P.FKIdCategoria
WHERE IDProducto = @IDProducto  AND EstadoProducto != 0
ON P.FkIdProveedor = PROV.PKIdProveedor
INNER JOIN CategoriaProducto CP
ON CP.IdCategoriaProducto = P.FKIdCategoria
WHERE EstadoProducto != 0


ALTER PROCEDURE ConsultaCategoriaProductoPorNombre

ALTER PROCEDURE ConsultaCategoriaProductoPorID

ALTER PROCEDURE ConsultaCategoriaProductoVacio

ALTER PROCEDURE ConsultaLaboratorioPorNombre

ALTER PROCEDURE ConsultaLaboratorioPorID

ALTER PROCEDURE ConsultaLaboratorioVacio

CREATE PROCEDURE ConsultaComprasPorOrden

CREATE PROCEDURE ConsultaComprasPorID

CREATE PROCEDURE ConsultaComprasVacio