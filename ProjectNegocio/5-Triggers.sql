--Procedimiento especial que no se llama y se ejecutan automaticamente cuando algo sucede en la tabla
--Los almacenados no se relacionan con nadie aunque sean parte de la bd
--y los triggers si son objetos pertenecientes a las tablas
--El precedimiento tiene argumentos y los triggers no

--El evento tiene momentos que pueden ser antes durante y despues

--create trigger nombre_trigger on table (momento) (before for after) (evento)(insert update delete)
--crear un desencadenador con nombre blabla en tabla bla bla antes durante o despues de crear la tabla

--LAS TABLAS TEMPORALES DEL SISTEMA
--1) Created y deleted las define el sistema y se usan para cuando se insertan nuevos registros y es temporal 

-----TRIGGERS O DISPARADORES-----

-----A) TABLA VENTADETALLE-----
CREATE TRIGGER tgr_vd_importeins ON ventadetalle AFTER INSERT AS
    DECLARE @n INT

    SELECT @n=nrov FROM inserted  
    EXEC pa_importeventa @n
GO


------TRIGGER PARA CUANDO SE BORRA-----

CREATE TRIGGER tgr_vd_importedel ON ventadetalle AFTER DELETE,UPDATE AS
    DECLARE @n INT

	SELECT @n=nrov FROM deleted  
	EXEC pa_importeventa @n
GO

-----TABLA COMPRADETALLE-----
CREATE TRIGGER tgr_cd_importeins ON compradetalle AFTER INSERT AS
    DECLARE @n INT

	SELECT @n=nroc FROM inserted  
	EXEC pa_importecompra @n
GO

CREATE TRIGGER des_CD_importeDel ON compradetalle AFTER DELETE,UPDATE AS
  	DECLARE @n INT

	SELECT @n=nroc FROM deleted  
	EXEC pa_importecompra @n
GO

------TRIGGER PARA CUANDO SE ACTUALIZA-----
CREATE TRIGGER des_importeup ON ventadetalle AFTER UPDATE AS

    DECLARE @n INT

    SELECT @n = nrov FROM deleted
    EXEC importeventa @n


-----PARA BORRAR UN TRIGGER------
delete trigger importdel
drop trigger des_importeup 

-----TRIGGER PARA ACTUALIZAR STOCK AL CERRAR LA VENTA-----

create trigger des_ventacerrar on venta after UPDATE AS
    DECLARE @es char(1) 
    DECLARE @nv int
    select @nv = nrov, @es = estado from inserted 
    if @es = 'C'
        exec pa_disminuirstock @nv
go





