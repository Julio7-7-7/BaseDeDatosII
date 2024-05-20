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
  ('E-102932', 'Emily Lopez', 24, 'F', '75632114'),
  ('E-102933', 'Jesus Arteaga', 27, 'M', '78541221'),
  ('E-102934', 'Sofia Ramirez', 26, 'F', '67544213')
  ;

INSERT INTO compra (idproveedor, fecha, estado, importe)
VALUES
  ------PRIMER COMPRA AL PROVEEDOR P-213-----
  ('P-213', '2024-05-01', 'C', 144500),

  -----SEGUNDA COMPRA AL PROVEEDOR P-546-----
  ('P-546', '2024-05-02', 'C', 32500),

  -----TERCER COMPRA AL PROVEEDOR P-879-----
  ('P-879', '2024-05-03', 'C', 80300),

  -----CUARTA COMPRA AL PROVEEDOR P-213-----
  ('P-213', '2024-05-08', 'C', 65500),

  -----QUINTA COMPRA AL PROVEEDOR P-546-----
  ('P-546', '2024-05-09', 'C', 33000),

  -----SEXTA COMPRA AL PROVEEDOR P-879-----
  ('P-879', '2024-05-10', 'C', 103000)
  ;

INSERT INTO detallecompra (idproducto, nrocompra, cantidad, preciou, subimporte)
VALUES
-- Detalles de la compra 1 de 'P-213' (Fertilizantes y Semillas)
('PF-124', 1, 40, 150, 6000),
('PF-125', 1, 30, 150, 4500),
('PF-126', 1, 40, 300, 12000),
('PS-347', 1, 50, 600, 30000),
('PS-348', 1, 60, 500, 30000),
('PS-349', 1, 40, 200, 8000),

-- Detalles de la compra 2 de 'P-546' (Insecticidas y Pesticidas)
('PI-457', 2, 40, 250, 10000),
('PI-458', 2, 30, 50, 1500),
('PI-459', 2, 50, 70, 3500),
('PP-790', 2, 50, 100, 5000),
('PP-791', 2, 50, 150, 7500),
('PP-792', 2, 50, 100, 5000),

-- Detalles de la compra 3 de 'P-879' (Herbicidas y Otros productos)
('PH-013', 3, 30, 500, 15000),
('PH-014', 3, 40, 450, 18000),
('PH-015', 3, 15, 700, 10500),
('PO-902', 3, 10, 3500, 35000),
('PO-903', 3, 40, 20, 800),
('PO-904', 3, 20, 50, 1000),

-- Detalles de la compra 4 de 'P-213' (Fertilizantes y Semillas)
('PF-124', 4, 50, 150, 7500),
('PF-125', 4, 50, 150, 7500),
('PF-126', 4, 50, 300, 15000),
('PS-350', 4, 60, 150, 9000),
('PS-351', 4, 70, 200, 14000),
('PS-352', 4, 50, 250, 12500),

-- Detalles de la compra 5 de 'P-546' (Insecticidas y Pesticidas)
('PI-457', 5, 40, 250, 10000),
('PI-458', 5, 40, 50, 2000),
('PI-459', 5, 50, 70, 3500),
('PP-790', 5, 50, 100, 5000),
('PP-791', 5, 50, 150, 7500),
('PP-792', 5, 50, 100, 5000),

-- Detalles de la compra 6 de 'P-879' (Herbicidas y Otros productos)
('PH-013', 6, 40, 500, 20000),
('PH-014', 6, 40, 450, 18000),
('PH-015', 6, 40, 700, 28000),
('PO-902', 6, 10, 3500, 35000),
('PO-903', 6, 50, 20, 1000),
('PO-904', 6, 20, 50, 1000)
;

INSERT INTO venta (nit, idempleado, fecha, estado, importe)
VALUES
-- Venta 1
(6254511, 'E-102932', '2024-02-05 10:30:00', 'C', 3900),
-- Venta 2
(6554611, 'E-102933', '2024-02-05 11:00:00', 'C', 1000),
-- Venta 3
(3224422, 'E-102934', '2024-03-05 14:00:00', 'C', 7500),
-- Venta 4
(3255621, 'E-102932', '2024-05-05 15:30:00', 'C', 3250),
-- Venta 5
(12375180, 'E-102933', '2024-05-05 16:45:00', 'C', 900),
-- Venta 6
(6789012, 'E-102934', '2024-06-05 17:30:00', 'C', 1000),
-- Venta 7
(7890123, 'E-102932', '2024-07-05 10:30:00', 'C', 1600),
-- Venta 8
(8901234, 'E-102933', '2024-08-05 11:00:00', 'C', 440),
-- Venta 9
(9012345, 'E-102934', '2024-08-05 14:00:00', 'C', 950),
-- Venta 10
(1230123, 'E-102932', '2024-09-05 15:30:00', 'C', 150)
;

INSERT INTO detalleventa (nroventa, idproducto, preciou, cantidad, subimporte)
VALUES
-- Detalles de la Venta 1
(1, 'PF-124', 150, 6, 900),
(1, 'PS-347', 600, 5, 3000),

-- Detalles de la Venta 2
(2, 'PI-457', 250, 2, 500),
(2, 'PP-790', 100, 5, 500),

-- Detalles de la Venta 3
(3, 'PH-013', 500, 1, 500),
(3, 'PO-902', 3500, 2, 7000),

-- Detalles de la Venta 4
(4, 'PF-125', 150, 5, 750),
(4, 'PS-348', 500, 5, 2500),

-- Detalles de la Venta 5
(5, 'PI-458', 50, 3, 150),
(5, 'PP-791', 150, 5, 750),

-- Detalles de la Venta 6
(6, 'PH-014', 450, 2, 900),
(6, 'PO-903', 20, 5, 100),

-- Detalles de la Venta 7
(7, 'PF-126', 300, 4, 1200),
(7, 'PS-349', 200, 2, 400),

-- Detalles de la Venta 8
(8, 'PI-459', 70, 2, 140),
(8, 'PP-792', 100, 3, 300),

-- Detalles de la Venta 9
(9, 'PH-015', 700, 1, 700),
(9, 'PO-904', 50, 5, 250),

-- Detalles de la Venta 10
(10, 'PF-124', 150, 5, 750),
(10, 'PS-351', 200, 5, 1000);























































  

  ALTER TABLE producto
  ALTER COLUMN nombre VARCHAR(50);



   ALTER TABLE venta
  DROP COLUMN tipo;

  INSERT INTO venta (fecha, estado, importe, nit)
VALUES
  (2024-04-01, 'C', 150.75, '1234567'),
  (2024-04-02, 'X', 75.25, '2345678'),
  (2024-04-03, 'A', 200.50, '3456789'),
  (2024-04-04, 'C', 180.25, '4567890'),
  (2024-04-05, 'X', 90.50, '5678901'),
  (2024-04-06, 'A', 120.75, '6789012'),
  (2024-04-07, 'C', 210.25, '7890123'),
  (2024-04-08, 'X', 95.50, '8901234'),
  (2024-04-09, 'A', 130.75, '9012345'),
  (2024-04-10, 'C', 220.25, '1230123'),
  (2024-04-11, 'X', 105.50, '2345678'),
  (2024-04-12, 'A', 140.75, '3456789'),
  (2024-04-13, 'C', 230.25, '4567890'),
  (2024-04-14, 'X', 125.50, '5678901'),
  (2024-04-15, 'A', 160.75, '6789012'),
  (2024-04-16, 'C', 250.25, '7890123'),
  (2024-04-17, 'X', 135.50, '8901234'),
  (2024-04-18, 'A', 170.75, '9012345'),
  (2024-04-19, 'C', 260.25, '1230123'),
  (2024-04-20, 'X', 145.50, '2345678')
  ;
