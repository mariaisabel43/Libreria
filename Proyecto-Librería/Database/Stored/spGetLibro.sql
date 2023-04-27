Use Libreria
CREATE PROCEDURE [dbo].[spGetLibro]
	
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
END
GO
