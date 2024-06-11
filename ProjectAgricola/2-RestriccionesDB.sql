-----DEFINIENDO FOREIGN KEYS-----

alter table producto
add constraint fk_producto_idclase
foreign key (idclase)
references clase(idclase)
ON UPDATE CASCADE

alter table producto
add constraint fk_producto_idalmacen
foreign key (idalmacen)
references almacen(idalmacen)
ON UPDATE CASCADE

alter table compra
add constraint fk_compra_idproveedor
foreign key(idproveedor)
references proveedor(idproveedor)

alter table detallecompra
add constraint fk_detallecompra_idproducto
foreign key(idproducto)
references producto(idproducto)
ON UPDATE CASCADE

alter table detallecompra
add constraint fk_detallecompra_nrocompra
foreign key(nrocompra)
references compra(nrocompra)

alter table venta
add constraint fk_venta_nit
foreign key(nit)
references cliente(nit)

alter table venta
add constraint fk_venta_idempleado
foreign key(idempleado)
references empleado(idempleado)
ON UPDATE CASCADE

alter table detalleventa
add constraint fk_detalleventa_nroventa
foreign key(nroventa)
references venta(nroventa)

alter table detalleventa
add constraint fk_detalleventa_idproducto
foreign key(idproducto)
references producto(idproducto)
ON UPDATE CASCADE


-----DECLARANDO CHECKS-----

alter table producto
add constraint ch_producto_costou
check(costou >= 0)

alter table producto 
add constraint ch_producto_stock
check(stock >= 0)

alter table compra
add constraint ch_compra_estado
check(estado in('A', 'C', 'X'))

alter table compra
add constraint ch_compra_importe
check(importe >= 0)

alter table detallecompra
add constraint ch_detallecompra_cantidad
check(cantidad >= 0)

alter table detallecompra
add constraint ch_detallecompra_costou
check(costou >= 0)

alter table detallecompra
add constraint ch_detallecompra_subimporte
check(subimporte >= 0)

alter table venta 
add constraint ch_venta_estado
check(estado in('A', 'C', 'X'))

alter table venta
add constraint ch_venta_importe
check(importe >= 0)

alter table detalleventa
add constraint ch_detalleventa_costou
check(costou >= 0)

alter table detalleventa
add constraint ch_detalleventa_cantidad
check(cantidad >= 0)

alter table detalleventa
add constraint ch_detalleventa_subimporte
check(subimporte >= 0)


-----DEFINIENDO VALORES DEFAULT-----

alter table compra
add constraint df_compra_estado
default 'A' for estado

Alter table compra
add constraint df_compra_fecha
default Getdate() for fecha

alter table compra
add constraint df_compra_importe
default 0 for importe

alter table detallecompra
add constraint df_detallecompra_cantidad
default 0 for cantidad

alter table detallecompra
add constraint df_detallecompra_subimporte
default 0 for subimporte

alter table venta
add constraint df_venta_estado
default 'A' for estado

Alter table venta
add constraint df_venta_fecha
default Getdate() for fecha

alter table venta
add constraint df_venta_importe
default 0 for importe

alter table detalleventa
add constraint df_detalleventa_cantidad
default 0 for cantidad

alter table detalleventa
add constraint df_detalleventa_subimporte
default 0 for subimporte
