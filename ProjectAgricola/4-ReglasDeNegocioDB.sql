-----PROCEDIMIENTOS ALMACENADOS-----

---1) AL MOMENTO DE REALIZAR UNA COMPRA---

    -----A) CALCULAR EL IMPORTE DE UNA COMPRA-----

CREATE PROCEDURE pa_importecompra @n INT AS
    DECLARE @total SMALLMONEY

    SELECT @total = SUM(cantidad * preciou)
    FROM detallecompra
    WHERE nrocompra = @n

    UPDATE compra
    SET importe = @total
    WHERE nrocompra = @n


    -----B) AUMENTAR EL STOCK DISPONIBLE-----

CREATE PROCEDURE pa_aumentarstock @idprod VARCHAR(10), @cant INT AS
    UPDATE producto
    SET stock = stock + @cant
    where idproducto = @idprod

---2) AL MOMENTO DE REALIZAR UNA VENTA---

-----A)CALCULAR EL IMPORTE DE UNA VENTA-----

CREATE PROCEDURE pa_importeventa @n INT AS
    DECLARE @total SMALLMONEY

    SELECT @total = SUM(cantidad * preciou) 
    FROM detalleventa 
    WHERE nroventa = @n

    UPDATE venta 
    SET importe = @total 
    WHERE nroventa = @n

-----B) DISMINUIR STOCK DISPONIBLE-----
CREATE PROCEDURE pa_disminuirstock @idprod VARCHAR(10), @cant INT AS
    UPDATE producto 
	SET stock = stock - @cant 
	WHERE idproducto = @idprod



