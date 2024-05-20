

create Database NEGOCIOBD
go


use NEGOCIOBD


Create table producto 
(codigo varchar(10) primary key, 
nombre varchar(40) not null, 
preciou smallmoney not null,
stock int null,
foto varbinary(max) );


Create table venta 
( nrov integer Identity(1,1) primary key, 
  fecha smalldatetime not null,
  importe smallmoney,
  estado char(1) null);

Create table ventadetalle
( codigo varchar(10),
  nrov int,
  preciou smallmoney not null, 
  cantidad int 
  Primary key(codigo,nrov) );


Create table compra
( nroc integer Identity(1,1) primary key, 
  fecha smalldatetime not null,
  importe smallmoney,
  estado char(1) null);

Create table compradetalle
( codigo varchar(10),
  nroc int,
  preciou smallmoney not null, 
  cantidad int 
  Primary key(codigo,nroc) );




