USE [Libreria]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarCarrito]    Script Date: 23/4/2023 17:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_InsertarCarrito](
@IdUsuario int,
@ISBN varchar(150),
@Resultado int output
)
as
begin
	set @Resultado = 0
	if not exists (select * from CARRITO where @ISBN = @ISBN and IdUsuario = @IdUsuario)
	begin
		insert into CARRITO(IdUsuario,ISBN) values ( @IdUsuario,@ISBN)
		set @Resultado = 1
	end
end