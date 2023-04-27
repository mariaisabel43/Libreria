Use Libreria
Create PROCEDURE [dbo].[spGetLib]
	@ISBN varchar
AS
BEGIN
	SELECT 
		ISBN,
		Portada,
		Titulo,
		Autor,
		Descripcion,
		FechaRegistro,
		Precio
	FROM Libro
	WHERE ISBN = @ISBN
END