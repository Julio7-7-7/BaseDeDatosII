--Son procedimientos especiales que no se llaman y se ejecutan automaticamente cuando algo sucede en la tabla
--Los almacenados no se relacionan con nadie aunque sean parte de la bd
--y los triggers si. Son objetos pertenecientes a las tablas
--El procedimiento tiene argumentos y los triggers no

--El evento tiene momentos que pueden ser antes durante y despues

--create trigger nombre_trigger on table (momento) (before for after) (evento)(insert update delete)
--crear un desencadenador con nombre blabla en tabla bla bla antes durante o despues de crear la tabla

--LAS TABLAS TEMPORALES DEL SISTEMA
--1) Created y deleted las define el sistema y se usan para cuando se insertan nuevos registros y es temporal 

-----TRIGGERS-----

-----A) AL METER UN PRODUCTO EN LA COMPRA-----
CREATE TRIGGER tg_dc_importeinserted ON compradetalle AFTER INSERT AS
    DECLARE @n INT

	SELECT @n=nroc FROM inserted  
	EXEC pa_importecompra @n
GO

-----B) AL QUITAR UN PRODUCTO DE LA COMPRA-----
CREATE TRIGGER tg_dc_importedeleted ON compradetalle AFTER DELETE,UPDATE AS
  	DECLARE @n INT

	SELECT @n=nroc FROM deleted  
	EXEC pa_importecompra @n
GO


-----C) AL METER UN PRODUCTO EN LA VENTA-----
CREATE TRIGGER tg_dv_importeinserted ON ventadetalle AFTER INSERT AS
    DECLARE @n INT

    SELECT @n=nrov FROM inserted  
    EXEC pa_importeventa @n
GO


------D) AL QUITAR UN PRODUCTO DE LA COMPRA-----

CREATE TRIGGER tg_dv_importedeleted ON ventadetalle AFTER DELETE,UPDATE AS
    DECLARE @n INT

	SELECT @n=nrov FROM deleted  
	EXEC pa_importeventa @n
GO

-----E) ACTUALIZAR EL STOCK AL COMPRAR-----
CREATE TRIGGER tg_stockcompra ON compra AFTER UPDATE AS
    DECLARE @estado CHAR(1)
    DECLARE @nroc INT

    SELECT @nroc = nroc, @estado = estado 
    FROM inserted
    if @estado = 'C'
    exec pa_aumentarstock @nroc
GO

-----F) ACTUALIZAR STOCK AL VENDER-----

CREATE TRIGGER tg_stockventa ON venta AFTER UPDATE AS
    DECLARE @estado CHAR(1) 
    DECLARE @nrov INT

    SELECT @nrov = nrov, @estado = estado 
    FROM inserted 
    IF @estado = 'C'
        EXEC pa_disminuirstock @nrov
GO

-----PARA BORRAR UN TRIGGER------
DELETE trigger importdel
DROP TRIGGER des_importeup 

