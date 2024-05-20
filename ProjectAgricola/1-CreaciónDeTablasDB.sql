CREATE DATABASE AGRODB;
GO

USE AGRODB;
GO
-----CREACION DE TABLAS-----

CREATE TABLE clase(
   idclase varchar(10) PRIMARY KEY,
   descripcion varchar(20)
)

CREATE TABLE almacen(
   idalmacen varchar(10) PRIMARY KEY,
   dimension int
)

CREATE TABLE proveedor(
   idproveedor varchar(10) PRIMARY KEY,
   nombre varchar(20),
   telefono int
)

CREATE TABLE cliente( 
   nit int PRIMARY KEY,
   nombre varchar(20)
)

CREATE TABLE producto(
   idproducto varchar(10) PRIMARY KEY,
   idclase varchar(10) not null,
   idalmacen varchar(10),
   nombre varchar(20) NOT NULL,
   costou Smallmoney NOT NULL,
   stock int NOT NULL
)

CREATE TABLE empleado(
   idempleado varchar(10) PRIMARY KEY,
   nombre varchar(20),
   edad int,
   sexo varchar(1),
   telefono int 
)

CREATE TABLE compra(
   nrocompra int Identity(1,1) PRIMARY KEY,
   idproveedor varchar(10),
   fecha SmallDateTime NOT NULL,
   estado char(1),
   importe Smallmoney NOT NULL
)

CREATE TABLE detallecompra(
   idproducto varchar(10),
   nrocompra int,
   cantidad int not null,
   preciou Smallmoney not null,
   subimporte Smallmoney NOT NULL,
   PRIMARY KEY(idproducto, nrocompra)
)

CREATE TABLE venta( 
   nroventa int Identity(1,1) PRIMARY KEY, 
   nit int NOT NULL,
   idempleado varchar(10),
   fecha SmallDateTime NOT NULL,
   estado varchar(1),  
   importe Smallmoney NOT NULL
)

create table detalleventa(
	nroventa int,
	idproducto varchar(10),
	preciou Smallmoney NOT NULL,
	cantidad int NOT NULL,
	subimporte Smallmoney NOT NULL,
	Primary Key (nroventa, idproducto)
)
