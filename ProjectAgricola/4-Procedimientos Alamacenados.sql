------PROCEDIMIENTOS ALMACENADOS-----

-----A) CALCULAR EL IMPORTE DE UNA COMPRA-----

CREATE PROCEDURE pa_importecompra @n INT AS
    DECLARE @total SMALLMONEY

    SELECT @total = SUM(cantidad * preciou)
    FROM detallecompra
    WHERE nrocompra = @n

    UPDATE compra
    SET importe = @total
    WHERE nrocompra = @n

-----B)CALCULAR EL IMPORTE DE UNA VENTA-----

CREATE PROCEDURE pa_importeventa @n INT AS
    DECLARE @total SMALLMONEY

    SELECT @total = SUM(cantidad * preciou) 
    FROM detalleventa 
    WHERE nroventa = @n

    UPDATE venta 
    SET importe = @total 
    WHERE nroventa = @n

-----CURSORES PARA EL STOCK-----

-----C) AUMENTAR AL HACER UNA COMPRA-----
CREATE PROCEDURE pa_aumentarstock @nrocompra INT AS
CREATE cursor1 CURSOR FOR
SELECT idproducto, cantidad
FROM detallecompra
WHERE nrocompra = @nrocompra

DECLARE @idproducto varchar(10)
DECLARE @cantidad INT

OPEN cursor1 
FETCH cursor1 INTO @idproducto, @cantidad

WHILE(@@fetch_status = 0)
    BEGIN
        UPDATE producto
        SET stock = stock + @cantidad
        WHERE idproducto = @idproducto
        FETCH cursor1 INTO @idproducto, @cantidad
    END

CLOSE cursor1
DEALLOCATE cursor1

-----D)DISMINUIR STOCK AL HACER UNA VENTA-----

CREATE PROCEDURE pa_disminuirstock @nroventa INT AS
DECLARE cursor2 CURSOR FOR
SELECT idproducto, cantidad
FROM detalleventa
WHERE nroventa = @nroventa

DECLARE @idproducto VARCHAR(10)
DECLARE @cantidad INT

OPEN cursor2
FETCH cursor2 INTO @idproducto, @cantidad

WHILE(@@fetch_status = 0)
    BEGIN
        UPDATE producto 
        SET stock = stock - @cantidad
        WHERE idproducto = @idproducto
        FETCH cursor2 INTO @idproducto, @cantidad
    END

CLOSE cursor2
DEALLOCATE cursor2



