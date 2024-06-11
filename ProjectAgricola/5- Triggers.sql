-----A) CALCULO DE SUBIMPORTE DE UNA COMPRA-----

CREATE TRIGGER tg_dc_calcularsubimporte
ON detallecompra
AFTER INSERT, UPDATE, DELETE AS
BEGIN
    DECLARE @n INT
    SELECT TOP 1 @n = nrocompra FROM inserted

    EXEC pa_subimportecompra @n
END;
GO

-----B) CALCULO DEL IMPORTE DE UNA COMPRA-----

CREATE TRIGGER tg_dc_calcularimporte
ON detallecompra
AFTER UPDATE, DELETE AS
BEGIN 
    DECLARE @n INT
    SELECT TOP 1 @n = nrocompra FROM inserted

    EXEC pa_importecompra @n
END

-----C) ACTUALIZAR EL STOCK AL COMPRAR-----
CREATE TRIGGER tg_stockcompra ON compra AFTER UPDATE AS
    DECLARE @estado CHAR(1)
    DECLARE @nrocompra INT

    SELECT @nrocompra = nrocompra, @estado = estado 
    FROM inserted
    if @estado = 'C'
    exec pa_aumentarstock @nrocompra
GO

-----D)CALCULO SUBIMPORTE DE UNA VENTA
CREATE TRIGGER tg_dv_calcularsubimporte
ON detalleventa
AFTER INSERT, UPDATE, DELETE AS
BEGIN
    DECLARE @n INT
    SELECT TOP 1 @n = nroventa FROM inserted

    EXEC pa_subimporteventa @n
END;
GO

-----E) CALCULO DEL IMPORTE DE UNA VENTA-----

CREATE TRIGGER tg_dv_calcularimporte
ON detalleventa
AFTER UPDATE, DELETE AS
BEGIN 
    DECLARE @n INT
    SELECT TOP 1 @n = nroventa FROM inserted

    EXEC pa_importeventa @n
END

-----F) ACTUALIZAR EL STOCK AL VENDER-----
CREATE TRIGGER tg_stockventa ON venta AFTER UPDATE AS
    DECLARE @estado CHAR(1)
    DECLARE @nroventa INT

    SELECT @nroventa = nroventa, @estado = estado 
    FROM inserted
    if @estado = 'C'
    exec pa_disminuirstock @nroventa
GO
