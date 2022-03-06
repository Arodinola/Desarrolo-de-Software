CREATE PROCEDURE VerificarLogin
@User Varchar (30),
@Password Varchar (50)
AS
SET NOCOUNT ON;

IF exists (select COUNT(*) from Usuarios WHERE Usuario = @User AND password = @Password) select USuario,password from Usuarios WHERE Usuario = @User AND password = @Password
else raiserror('Error!! Usuario o Contraseña Invalidos, utiliza otro por favor', 16, 1)