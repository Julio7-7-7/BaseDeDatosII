-----PROCEDIMIENTOS ALMACENADOS-----

CREATE PROCEDURE pa_importeventa @n INT AS
   DECLARE @total SMALLMONEY

   SELECT @total = sum(cantidad*preciou) 
   FROM ventadetalle WHERE nrov = @n
   UPDATE venta SET importe = @total 
   WHERE nrov = @n
GO 

-----PARA EJECUTAR------
EXEC pa_importeventa


CREATE PROCEDURE pa_importecompra @n INT AS
   DECLARE @total SMALLMONEY

   SELECT @total = sum(cantidad*preciou) 
   FROM compradetalle 
   WHERE nroc = @n
   UPDATE compra SET importe = @total 
   WHERE nroc = @n
GO 

-----PARA EJECUTAR-----
EXEC pa_importecompra


-----PROCEDIMIENTOS CON CURSORES-----

-----DISMINUIR STOCK LUEGO DE UNA VENTA-----

CREATE PROCEDURE pa_disminuirstock @nrov INT AS
DECLARE cursor1 CURSOR FOR 
SELECT codigo, cantidad
FROM ventadetalle 
WHERE nrov = @nrov
DECLARE @cod VARCHAR(10)
DECLARE @cant INT

OPEN cursor1 
FETCH cursor1 INTO @cod, @cant

WHILE(@@fetch_status=0)
    BEGIN
        UPDATE productos
        SET stock = stock - @cant
        WHERE codigo = @cod
        FETCH cursor1 INTO @cod, @cant
    END
CLOSE cursor1
DEALLOCATE cursor1
GO 
-----PARA LLAMAR AL TRIGGER------
EXEC pa_disminuirstock 4 --o cualquier venta--

-----AUMENTAR STOCK LUEGO DE UNA COMPRA-----

CREATE PROCEDURE pa_aumentarstock @nroc INT AS
DECLARE cursor1 CURSOR FOR
SELECT codigo, cantidad
FROM compradetalle
WHERE nroc = @nroc
DECLARE @cod VARCHAR(10)
DECLARE @cant INT

OPEN  cursor1
FETCH cursor1 INTO @cod, @cant

WHILE(@@fetch_status = 0)
    BEGIN
        UPDATE productos
        SET stock = stock + @cant
        WHERE codigo = @cod
        FETCH cursor1 into @cod, @cant
    END
CLOSE cursor1
DEALLOCATE cursor1
GO


