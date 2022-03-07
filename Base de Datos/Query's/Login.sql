ALTER PROCEDURE VerificarLogin
@User Varchar (30),
@Password Varchar (50)
AS
SET NOCOUNT ON;

IF exists (select COUNT(*) from Usuarios WHERE Usuario = @User AND password = @Password) select PerfilNombre from Usuarios
INNER JOIN Perfiles P
ON P.PKIdPerfiles = Usuarios.FKPerfiles
WHERE Usuario = @User AND estadoUsuario!=0  AND password = @Password AND Usuario COLLATE Latin1_General_CS_AS = @User AND password COLLATE Latin1_General_CS_AS = @Password 
else raiserror('Error!! Usuario o Contraseña Invalidos, utiliza otro por favor', 16, 1)

EXEC VerificarLogin 'Jose02','Holamundo'

