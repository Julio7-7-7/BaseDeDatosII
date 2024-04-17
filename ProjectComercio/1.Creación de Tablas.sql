
CREATE DATABASE COMERCIOBD;
GO

USE COMERCIOBD;
GO 


CREATE TABLE producto( 
   codigo varchar(10) PRIMARY KEY,  
   nombre varchar(50) NOT NULL,  
   stock  smallint NOT NULL,  
   precioU smallmoney NULL,
   catId varchar(10))

 CREATE TABLE cliente( 
   cliId varchar(10) PRIMARY KEY,  
   nombre varchar(50) NOT NULL,  
   celu  int NULL )

CREATE TABLE venta( 
   nrov INT PRIMARY KEY IDENTITY,  
   fecha datetime NOT NULL,  
   importe Smallmoney, 
   tipo varchar(1) not null,
   cliID varchar(10))

CREATE TABLE ventadetalle(
   codigo varchar(10) NOT NULL,
   nrov int NOT NULL,
   cantidad smallint NOT NULL
   primary key (codigo,nrov) )

CREATE TABLE compra(
	nroc int primary key IDENTITY,
	fecha datetime NOT NULL,  
	importe smallmoney, 
	tipo char(1),
	proId varchar(10))

CREATE TABLE compradetalle(
   codigo varchar(10),
   nroc int,
   precioU smallmoney not null,
   cantidad int NOT NULL,
   fechaexp datetime,
   primary key (codigo,nroc) )

CREATE TABLE proveedor (
	proId varchar (10) primary key,
	nombre varchar(50) NOT NULL,
	cel int,
	ciudad varchar (30))

CREATE TABLE categoria (
	catId varchar (10) PRIMARY KEY NOT NULL,
	descripcion varchar(50) NOT NULL
)

CREATE TABLE lote (
	NrLo int PRIMARY key IDENTITY,
	costoU smallmoney NOT NULL,
	cantidad smallint  NOT NULl,
	fechaC datetime,
	fechaExp DATEtime,
	codigo varchar(10),
	stock int,
	nroc int)
