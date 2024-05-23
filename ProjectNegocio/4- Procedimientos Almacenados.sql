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

-----CURSORES-----

-----DISMINUIR STOCK-----

CREATE PROCEDURE pa_disminuirstock @nrov INT AS
DECLARE cursor1 CURSOR FOR SELECT codigo, cantidad
FROM ventadetalle WHERE nrov = @nrv
DECLARE @cod VARCHAR(10)
DECLARE @cat INT

OPEN cursor1 
FETCH cursor1 INTO @cod, @cant

WHILE(@@fetch_status=0)
    BEGIN
        UPDATE productos
        SET stock = stock - @cant
        WHERE codigo = @cod
        FETCH cursor1 into @cod, @cant
    END
CLOSE cursor1
DEALLOCATE cursor1
GO 

-----PARA LLAMAR AL TRIGGER------
EXEC pa_disminuirstock 4 --o cualquier venta--



