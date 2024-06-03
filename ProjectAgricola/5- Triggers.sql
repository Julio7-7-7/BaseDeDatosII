-----A) AL METER UN PRODUCTO EN LA COMPRA-----
CREATE TRIGGER tg_dc_importeinserted ON detallecompra AFTER INSERT AS
    DECLARE @n INT

	SELECT @n=nrocompra FROM inserted  
	EXEC pa_importecompra @n
GO

-----B) AL QUITAR UN PRODUCTO DE LA COMPRA-----
CREATE TRIGGER tg_dc_importedeleted ON detallecompra AFTER DELETE,UPDATE AS
  	DECLARE @n INT

	SELECT @n=nrocompra FROM deleted  
	EXEC pa_importecompra @n
GO

-----C) AL METER UN PRODUCTO EN LA VENTA-----
CREATE TRIGGER tg_dv_importeinserted ON detalleventa AFTER INSERT AS
    DECLARE @n INT

    SELECT @n=nroventa FROM inserted  
    EXEC pa_importeventa @n
GO

------D) AL QUITAR UN PRODUCTO DE LA COMPRA-----

CREATE TRIGGER tg_dv_importedeleted ON detalleventa AFTER DELETE,UPDATE AS
    DECLARE @n INT

	SELECT @n=nroventa FROM deleted  
	EXEC pa_importeventa @n
GO

-----E) ACTUALIZAR EL STOCK AL COMPRAR-----
CREATE TRIGGER tg_stockcompra ON compra AFTER UPDATE AS
    DECLARE @estado CHAR(1)
    DECLARE @nrocompra INT

    SELECT @nrocompra = nrocompra, @estado = estado 
    FROM inserted
    if @estado = 'C'
    exec pa_aumentarstock @nrocompra
GO

-----F) ACTUALIZAR STOCK AL VENDER-----

CREATE TRIGGER tg_stockventa ON venta AFTER UPDATE AS
    DECLARE @estado CHAR(1) 
    DECLARE @nroventa INT

    SELECT @nroventa = nroventa, @estado = estado 
    FROM inserted 
    IF @estado = 'C'
        EXEC pa_disminuirstock @nroventa
GO