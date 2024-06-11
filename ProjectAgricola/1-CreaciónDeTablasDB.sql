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
   idclase varchar(10),
   idalmacen varchar(10),
   nombre varchar(50) NOT NULL,
   costou Smallmoney NOT NULL,
   stock int
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
   importe Smallmoney
)

CREATE TABLE detallecompra(
   nrocompra int,
   idproducto varchar(10),
   cantidad int,
   costou Smallmoney,
   subimporte Smallmoney,
   PRIMARY KEY(nrocompra, idproducto)
)

CREATE TABLE venta( 
   nroventa int Identity(1,1) PRIMARY KEY, 
   nit int NOT NULL,
   idempleado varchar(10),
   fecha SmallDateTime NOT NULL,
   estado varchar(1),  
   importe Smallmoney
)

create table detalleventa(
	nroventa int,
	idproducto varchar(10),
	cantidad int,
	costou Smallmoney,
	subimporte Smallmoney,
	Primary Key (nroventa, idproducto)
)

CREATE TABLE usuario(
	login varchar (10) primary key,
	clave varchar (10),
	tipousuario char(1)
)