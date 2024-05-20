USE NEGOCIO BD
GO

insert into producto(codigo,nombre,precioU,stock) values ('001','MANTEQUILLA PIL GRANDE',15,20)
insert into producto(codigo,nombre,precioU,stock) values ('002','LECHE PIL BLANCA',7,50)
insert into producto(codigo,nombre,precioU,stock) values ('003','LECHE PIL FRUTILLA',9,30)
insert into producto(codigo,nombre,precioU,stock) values ('004','DULCE DE LECHE PIL 250 gr',10,20)
insert into producto(codigo,nombre,precioU,stock) values ('005','LECHE PIL AVENA',9,40)


insert into venta(fecha) values ('01/01/2024')
insert into venta(fecha) values ('01/02/2024')
insert into venta(fecha) values ('01/03/2024')
insert into venta(fecha) values ('01/04/2024')
insert into venta(fecha) values ('01/05/2024')
insert into venta(importe) values (100)


insert into ventadetalle(nrov,codigo,cantidad,preciou) values (1,'001',2,15)
insert into ventadetalle(nrov,codigo,cantidad,preciou) values (1,'002',1,7)
insert into ventadetalle(nrov,codigo,cantidad,preciou) values (2,'003',3,9)
insert into ventadetalle(nrov,codigo,cantidad,preciou) values (3,'001',4,15)
insert into ventadetalle(nrov,codigo,cantidad,preciou) values (3,'004',1,10)
insert into ventadetalle(nrov,codigo,cantidad,preciou) values (3,'005',2,9)
insert into ventadetalle(nrov,codigo,cantidad,preciou) values (4,'001',6,15)
insert into ventadetalle(nrov,codigo,cantidad,preciou) values (4,'005',3,9)
insert into ventadetalle(nrov,codigo,cantidad,preciou) values (5,'001',5,15)
insert into ventadetalle(nrov,codigo,cantidad,preciou) values (5,'002',3,7)
insert into ventadetalle(nrov,codigo,cantidad,preciou) values (5,'003',4,9)
insert into ventadetalle(nrov,codigo,cantidad,preciou) values (5,'004',1,10)
insert into ventadetalle(nrov,codigo,cantidad,preciou) values (6,'001',1,15)
insert into ventadetalle(nrov,codigo,cantidad,preciou) values (6,'004',4,10)
insert into ventadetalle(nrov,codigo,cantidad,preciou) values (6,'005',2,9)


insert into compra(fecha) values ('01/01/2024')
insert into compra(fecha) values ('01/02/2024')
insert into compra(fecha) values ('01/03/2024')
insert into compra(fecha) values ('01/04/2024')
insert into compra(fecha) values ('01/05/2024')
insert into compra(importe) values (100)


insert into compradetalle(nroc,codigo,cantidad,preciou) values (1,'001',2,15)
insert into compradetalle(nroc,codigo,cantidad,preciou) values (1,'002',1,7)
insert into compradetalle(nroc,codigo,cantidad,preciou) values (2,'003',3,9)
insert into compradetalle(nroc,codigo,cantidad,preciou) values (3,'001',4,15)
insert into compradetalle(nroc,codigo,cantidad,preciou) values (3,'004',1,10)
insert into compradetalle(nroc,codigo,cantidad,preciou) values (3,'005',2,9)
insert into compradetalle(nroc,codigo,cantidad,preciou) values (4,'001',6,15)
insert into compradetalle(nroc,codigo,cantidad,preciou) values (4,'005',3,9)
insert into compradetalle(nroc,codigo,cantidad,preciou) values (5,'001',5,15)
insert into compradetalle(nroc,codigo,cantidad,preciou) values (5,'002',3,7)
insert into compradetalle(nroc,codigo,cantidad,preciou) values (5,'003',4,9)
insert into compradetalle(nroc,codigo,cantidad,preciou) values (5,'004',1,10)
insert into compradetalle(nroc,codigo,cantidad,preciou) values (6,'001',1,15)
insert into compradetalle(nroc,codigo,cantidad,preciou) values (6,'004',4,10)
insert into compradetalle(nroc,codigo,cantidad,preciou) values (6,'005',2,9)


