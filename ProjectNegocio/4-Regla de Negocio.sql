USE NEGOCIOBD
GO

/* ********  PROCEDIMIENTOS ALMACENADOS  ************/

create procedure pa_IMporteVenta @N int As
   declare @total smallmoney

   select @total = sum(cantidad*preciou) from ventadetalle where nrov = @n
   update venta set importe = @total where nrov = @n
go 


create procedure pa_IMporteCompra @N int As
   declare @total smallmoney

   select @total = sum(cantidad*preciou) from compradetalle where nroc = @n
   update compra set importe = @total where nroc = @n
go 







/*********  DESENCADENADORES   *********/

 /*****   TABLA VENTADETALLE **********/
	create trigger des_VD_importeIns ON ventadetalle AFTER INSERT AS
    		 declare @n int

		 select @n=nrov from inserted  
		 EXEC pa_importeventa @n
        go


	create trigger des_VD_importeDel ON ventadetalle AFTER DELETE,UPDATE AS
  	       declare @n int

	       select @n=nrov from deleted  
	       EXEC pa_importeventa @n
        go

/*****   TABLA COMPRADETALLE **********/
	create trigger des_CD_ImporteIns ON compradetalle AFTER INSERT AS
    		 declare @n int

		 select @n=nroc from inserted  
		 EXEC pa_importecompra @n
        go

	create trigger des_CD_importeDel ON compradetalle AFTER DELETE,UPDATE AS
  	       declare @n int

	       select @n=nroc from deleted  
	       EXEC pa_importecompra @n
         go



