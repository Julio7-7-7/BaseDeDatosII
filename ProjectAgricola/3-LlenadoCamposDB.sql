-----INSERCION DE DATOS-----

INSERT INTO clase (idclase, descripcion)
VALUES
  ('C-111', 'Fertilizante'),
  ('C-222', 'Insecticida'),
  ('C-333', 'Pesticida'),
  ('C-444', 'Herbicida'),
  ('C-555', 'Semilla'),
  ('C-666', 'Otro')
  ;
  
INSERT INTO almacen (idalmacen, dimension)
VALUES
  ('A-123', 150),
  ('A-456', 150),
  ('A-789', 200)
  ;

INSERT INTO proveedor(idproveedor, nombre, telefono)
VALUES
('P-213', 'Fransisco Perez', 75064425),
('P-546', 'Carlos Gonzales', 78138945),
('P-879', 'Rosa Sanchez', 63254784)
;

INSERT INTO cliente (nit, nombre)
VALUES
  (6254511, 'Alejandro López'),
  (6554611, 'Eduardo Vargas'),
  (3224422, 'Raúl Ruíz'),
  (3255621, 'Isabel Ruíz'),
  (12375180, 'Daniel Rodríguez'),
  (6789012, 'Carlos Sánchez'),
  (7890123, 'Laura Fernández'),
  (8901234, 'Manuel López'),
  (9012345, 'Sofía Ramírez'),
  (1230123, 'Jorge Mendoza')
  ;

INSERT INTO producto (idproducto, idclase, idalmacen, nombre, costou, stock)
VALUES
  -----PRODUCTOS DE CLASE FERTILIZANTE-----
  ('PF-124', 'C-111', 'A-123', 'Fertilizant 20-10', 150, 30),
  ('PF-125', 'C-111', 'A-123', 'Fertilizante 40-70', 150, 20),
  ('PF-126', 'C-111', 'A-123', 'Fertilizante 7-7-10', 300, 20),
  -----PRODUCTOS DE CLASE INSECTICIDA-----
  ('PI-457', 'C-222', 'A-456', 'Zarper 60FS', 250, 30),
  ('PI-458', 'C-222', 'A-456', 'Insecticida huertas', 50, 40),
  ('PI-459', 'C-222', 'A-456', 'Insecticida en Polvo', 70, 15),
  -----PRODUCTOS DE CLASE PESTICIDA-----
  ('PP-790', 'C-333', 'A-456', 'Pesticida Zarper', 100, 20),
  ('PP-791', 'C-333', 'A-456', 'Pestiguard', 150, 15),
  ('PP-792', 'C-333', 'A-456', 'TerraProtec', 100, 30),
  -----PRODUCTOS DE CLASE HERBICIDA-----
  ('PH-013', 'C-444', 'A-456', 'Glifosato', 500, 30),
  ('PH-014', 'C-444', 'A-456', '24D Amine', 450, 30),
  ('PH-015', 'C-444', 'A-456', 'Tocon extra', 700, 20),
  -----PRODUCTOS DE CLASE SEMILLA-----
  ('PS-347', 'C-555', 'A-789', 'Maiz Triple7', 600, 100),
  ('PS-348', 'C-555', 'A-789', 'Maiz Hibrido Iniaf', 500, 100),
  ('PS-349', 'C-555', 'A-789', 'Sorgo Forrajero', 200, 100),
  ('PS-350', 'C-555', 'A-789', 'Pasto Gatton Panic', 150, 50),
  ('PS-351', 'C-555', 'A-789', 'Pasto Estrella', 200, 70),
  ('PS-352', 'C-555', 'A-789', 'Pasto Sudan', 250, 50),
  -----PRODUCTOS DE CLASE OTRO-----
  ('PO-902', 'C-666', 'A-123', 'Motosierra Stheel', 3500, 10),
  ('PO-904', 'C-666', 'A-123', 'Aceite Stheel', 50, 30),
  ('PO-903', 'C-666', 'A-123', 'Guantes de trabajo', 20, 100)
  ;
  
INSERT INTO empleado (idempleado, nombre, edad, sexo, telefono)
VALUES
  ('E-102932', 'Emily Lopez', 24, 'F', 75632114),
  ('E-102933', 'Jesus Arteaga', 27, 'M', 78541221),
  ('E-102934', 'Sofia Ramirez', 26, 'F', 67544213)
  ;

INSERT INTO compra (idproveedor, fecha, estado)
VALUES
  ------PRIMER COMPRA AL PROVEEDOR P-213-----
  ('P-213', '2024-05-01', 'A')
;

INSERT INTO compra (idproveedor, fecha, estado)
VALUES
  -----SEGUNDA COMPRA AL PROVEEDOR P-546-----
  ('P-546', '2024-05-02', 'A')
;

INSERT INTO compra (idproveedor, fecha, estado)
VALUES
  -----TERCER COMPRA AL PROVEEDOR P-879-----
  ('P-879', '2024-05-03', 'A')
;

INSERT INTO compra (idproveedor, fecha, estado)
VALUES
  -----CUARTA COMPRA AL PROVEEDOR P-213-----
  ('P-213', '2024-05-08', 'A')
;

INSERT INTO compra (idproveedor, fecha, estado)
VALUES
  -----QUINTA COMPRA AL PROVEEDOR P-546-----
  ('P-546', '2024-05-09', 'A')
;

INSERT INTO compra (idproveedor, fecha, estado)
VALUES  
  -----SEXTA COMPRA AL PROVEEDOR P-879-----
  ('P-879', '2024-05-10', 'A')
;

INSERT INTO detallecompra (idproducto, nrocompra, cantidad)
VALUES
-- Detalles de la compra 1 de 'P-213' (Fertilizantes y Semillas)
('PF-124', 1, 40),
('PF-125', 1, 30),
('PF-126', 1, 40),
('PS-347', 1, 50),
('PS-348', 1, 60),
('PS-349', 1, 40)
;

INSERT INTO detallecompra (idproducto, nrocompra, cantidad)
VALUES
-- Detalles de la compra 2 de 'P-546' (Insecticidas y Pesticidas)
('PI-457', 2, 40),
('PI-458', 2, 30),
('PI-459', 2, 50),
('PP-790', 2, 50),
('PP-791', 2, 50),
('PP-792', 2, 50)
;

INSERT INTO detallecompra (idproducto, nrocompra, cantidad)
VALUES
-- Detalles de la compra 3 de 'P-879' (Herbicidas y Otros productos)
('PH-013', 3, 30),
('PH-014', 3, 40),
('PH-015', 3, 15),
('PO-902', 3, 10),
('PO-903', 3, 40),
('PO-904', 3, 20)
;

INSERT INTO detallecompra (idproducto, nrocompra, cantidad)
VALUES
-- Detalles de la compra 4 de 'P-213' (Fertilizantes y Semillas)
('PF-124', 4, 50),
('PF-125', 4, 50),
('PF-126', 4, 50),
('PS-350', 4, 60),
('PS-351', 4, 70),
('PS-352', 4, 50)
;

INSERT INTO detallecompra (idproducto, nrocompra, cantidad)
VALUES
-- Detalles de la compra 5 de 'P-546' (Insecticidas y Pesticidas)
('PI-457', 5, 40),
('PI-458', 5, 40),
('PI-459', 5, 50),
('PP-790', 5, 50),
('PP-791', 5, 50),
('PP-792', 5, 50)
;

INSERT INTO detallecompra (idproducto, nrocompra, cantidad)
VALUES
-- Detalles de la compra 6 de 'P-879' (Herbicidas y Otros productos)
('PH-013', 6, 40),
('PH-014', 6, 40),
('PH-015', 6, 40),
('PO-902', 6, 10),
('PO-903', 6, 50),
('PO-904', 6, 20)
;


INSERT INTO venta (nit, idempleado, fecha, estado)
VALUES
-- Venta 1
(6254511, 'E-102932', '2024-02-05 10:30:00', 'A')
;

INSERT INTO venta (nit, idempleado, fecha, estado)
VALUES
-- Venta 2
(6554611, 'E-102933', '2024-02-05 11:00:00', 'A')
;

INSERT INTO venta (nit, idempleado, fecha, estado)
VALUES
-- Venta 3
(3224422, 'E-102934', '2024-03-05 14:00:00', 'A')
;

INSERT INTO venta (nit, idempleado, fecha, estado)
VALUES
-- Venta 4
(3255621, 'E-102932', '2024-05-05 15:30:00', 'A')
;

INSERT INTO venta (nit, idempleado, fecha, estado)
VALUES
-- Venta 5
(12375180, 'E-102933', '2024-05-05 16:45:00', 'A')
;

INSERT INTO venta (nit, idempleado, fecha, estado)
VALUES
-- Venta 6
(6789012, 'E-102934', '2024-06-05 17:30:00', 'A')
;

INSERT INTO venta (nit, idempleado, fecha, estado)
VALUES
-- Venta 7
(7890123, 'E-102932', '2024-07-05 10:30:00', 'A')
;

INSERT INTO venta (nit, idempleado, fecha, estado)
VALUES
-- Venta 8
(8901234, 'E-102933', '2024-08-05 11:00:00', 'A')
;

INSERT INTO venta (nit, idempleado, fecha, estado)
VALUES
-- Venta 9
(9012345, 'E-102934', '2024-08-05 14:00:00', 'A')
;

INSERT INTO venta (nit, idempleado, fecha, estado)
VALUES
-- Venta 10
(1230123, 'E-102932', '2024-09-05 15:30:00', 'A')
;

INSERT INTO venta (nit, idempleado, fecha, estado)
VALUES
-- Venta 11
(9012345, 'E-102934', '2024-08-05 16:00:00', 'A')
;

INSERT INTO detalleventa (idproducto, nroventa, cantidad)
VALUES
-- Detalles de la Venta 1
('PF-124', 1, 6),
('PS-347', 1, 5)
;

INSERT INTO detalleventa (idproducto, nroventa, cantidad)
VALUES
-- Detalles de la Venta 2
('PI-457', 2, 2),
('PP-790', 2, 5)
;

INSERT INTO detalleventa (idproducto, nroventa, cantidad)
VALUES
-- Detalles de la Venta 3
('PH-013', 3, 1),
('PO-902', 3, 2)
;

INSERT INTO detalleventa (idproducto, nroventa, cantidad)
VALUES
-- Detalles de la Venta 4
('PF-125', 4, 5),
('PS-348', 4, 5)
;

INSERT INTO detalleventa (idproducto, nroventa, cantidad)
VALUES
-- Detalles de la Venta 5
('PI-458', 5, 3),
('PP-791', 5, 5)
;

INSERT INTO detalleventa (idproducto, nroventa, cantidad)
VALUES
-- Detalles de la Venta 6
('PH-014', 6, 2),
('PO-903', 6, 5)
;

INSERT INTO detalleventa (idproducto, nroventa, cantidad)
VALUES
-- Detalles de la Venta 7
('PF-126', 7, 4),
('PS-349', 7, 2)
;

INSERT INTO detalleventa (idproducto, nroventa, cantidad)
VALUES
-- Detalles de la Venta 8
('PI-459', 8, 2),
('PP-792', 8, 3)
;

INSERT INTO detalleventa (idproducto, nroventa, cantidad)
VALUES
-- Detalles de la Venta 9
('PH-015', 9, 1),
('PO-904', 9, 5)
;

INSERT INTO detalleventa (idproducto, nroventa, cantidad)
VALUES
-- Detalles de la Venta 10
('PF-124', 10, 5),
('PS-351', 10, 5)
;

INSERT INTO detalleventa (idproducto, nroventa, cantidad)
VALUES
-- Detalles de la Venta 11
('PH-015', 11, 1),
('PO-904', 11, 5)
;

UPDATE compra
SET estado = 'C'
WHERE nrocompra = n


UPDATE venta
SET estado = 'C'
WHERE nroventa = n