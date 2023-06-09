Use Libreria
go
Create procedure ObCompra(
	@IdCompra int,
	@Nombre varchar(250),
	@Apellido varchar(250),
	@Email varchar(550),
	@Address varchar(450),
	@Pais varchar(250),
	@Provincia varchar(350),
	@Postal int,
	@NTarjeta int,
	@CodigoS int,
	@FExpiracion varchar(150),
	@Costo decimal(10, 2),
	@Total decimal (10, 2)
	)
	AS
BEGIN
	insert into COMPRA(IdCompra, Nombre, Apellido, Email, Address, Pais, Provincia, Postal, NTarjeta, CodigoS, FExpiracion, Costo, Total) 
	 values (@IdCompra, @Nombre, @Apellido, @Email, @Address, @Pais, @Provincia, @Postal, @NTarjeta, @CodigoS, @FExpiracion, @Costo, @Total)
end