------PROCEDIMIENTOS ALMACENADOS-----

-----A) CALCULAR EL SUBIMPORTE DE LA COMPRA
 CREATE PROCEDURE pa_subimportecompra @n INT AS
 BEGIN
    DECLARE cursor1 CURSOR FOR

    SELECT detallecompra.idproducto, detallecompra.cantidad, producto.costou
    FROM detallecompra
    JOIN producto ON detallecompra.idproducto = producto.idproducto
    WHERE detallecompra.nrocompra = @n

    DECLARE @idproducto VARCHAR(10)
    DECLARE @cantidad INT
    DECLARE @costou INT

    OPEN cursor1
    FETCH cursor1 INTO @idproducto, @cantidad, @costou

    WHILE (@@fetch_status = 0)
        BEGIN   
            UPDATE detallecompra
            SET costou = @costou, 
            subimporte = @cantidad * @costou
            WHERE idproducto = @idproducto AND nrocompra = @n
    
            FETCH cursor1 INTO @idproducto, @cantidad, @costou
        END
    CLOSE cursor1
    DEALLOCATE cursor1
END 


-----B) CALCULAR EL IMPORTE DE UNA COMPRA-----

CREATE PROCEDURE pa_importecompra @n INT AS
BEGIN
    DECLARE @total SMALLMONEY;

    SELECT @total = SUM(cantidad * costou)
    FROM detallecompra
    WHERE nrocompra = @n;

    IF @total IS NULL
        SET @total = 0;

    UPDATE compra
    SET importe = @total
    WHERE nrocompra = @n;
END;

-----C) AUMENTAR AL HACER UNA COMPRA-----
CREATE PROCEDURE pa_aumentarstock @nrocompra INT AS
BEGIN
    DECLARE cursor2 CURSOR FOR
    SELECT idproducto, cantidad
    FROM detallecompra
    WHERE nrocompra = @nrocompra

    DECLARE @idproducto varchar(10)
    DECLARE @cantidad INT

    OPEN cursor2 
    FETCH cursor2 INTO @idproducto, @cantidad

    WHILE(@@fetch_status = 0)
        BEGIN
            UPDATE producto
            SET stock = stock + @cantidad
            WHERE idproducto = @idproducto
            FETCH cursor2 INTO @idproducto, @cantidad
        END
    CLOSE cursor2
    DEALLOCATE cursor2
END

-----D) CALCULAR EL SUBIMPORTE DE UNA VENTA
CREATE PROCEDURE pa_subimporteventa @n INT AS
BEGIN
    DECLARE cursor3 CURSOR FOR

    SELECT detalleventa.idproducto, detalleventa.cantidad, producto.costou
    FROM detalleventa
    JOIN producto ON detalleventa.idproducto = producto.idproducto
    WHERE detalleventa.nroventa = @n
    
    DECLARE @idproducto VARCHAR(10)
    DECLARE @cantidad INT
    DECLARE @costou INT
    
    OPEN cursor3
    FETCH cursor3 INTO @idproducto, @cantidad, @costou

    WHILE (@@fetch_status = 0)
        BEGIN   
            UPDATE detalleventa
            SET costou = @costou, 
            subimporte = @cantidad * @costou
            WHERE idproducto = @idproducto AND nroventa = @n
    
            FETCH cursor3 INTO @idproducto, @cantidad, @costou
        END
    CLOSE cursor3
    DEALLOCATE cursor3
END

-----E) CALCULAR EL IMPORTE DE UNA VENTA-----

CREATE PROCEDURE pa_importeventa @n INT AS
BEGIN
    DECLARE @total SMALLMONEY;

    SELECT @total = SUM(cantidad * costou)
    FROM detalleventa
    WHERE nroventa = @n;

    IF @total IS NULL
        SET @total = 0;

    UPDATE venta
    SET importe = @total
    WHERE nroventa = @n;
END;

-----F) DISMINUIR STOCK AL HACER UNA VENTA-----
CREATE PROCEDURE pa_disminuirstock @nroventa INT AS
BEGIN
    DECLARE cursor4 CURSOR FOR
    SELECT idproducto, cantidad
    FROM detalleventa
    WHERE nroventa = @nroventa

    DECLARE @idproducto varchar(10)
    DECLARE @cantidad INT

    OPEN cursor4 
    FETCH cursor4 INTO @idproducto, @cantidad

    WHILE(@@fetch_status = 0)
        BEGIN
            UPDATE producto
            SET stock = stock - @cantidad
            WHERE idproducto = @idproducto
            FETCH cursor4 INTO @idproducto, @cantidad
        END
    CLOSE cursor4
    DEALLOCATE cursor4
END
