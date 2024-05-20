use NEGOCIOBD
GO

/*LLAVES FORANEAS.........*/

Alter table ventadetalle
add constraint fk_detven_nrov
foreign key (nrov)
references venta(nrov)

Alter table ventadetalle
add constraint fk_detven_codigo
foreign key (codigo)
references producto(codigo)

Alter table compradetalle
add constraint fk_detcom_nroc
foreign key (nroc)
references compra(nroc)

Alter table compradetalle
add constraint fk_detcom_codigo
foreign key (codigo)
references producto(codigo)



/* CHECK ++++++++++  */

alter table producto 
add constraint ch_producto_preciou
check (precioU>=0)

alter table producto 
add constraint ch_producto_stock
check (stock>=0)

alter table ventadetalle 
add constraint ch_detve_cant
check (cantidad>=0)

alter table ventadetalle 
add constraint ch_detve_preciou
check (preciou>=0)

alter table compradetalle 
add constraint ch_detcom_cant
check (cantidad>=0)

alter table compradetalle 
add constraint ch_detcom_preciou
check (preciou>=0)

alter table venta
add constraint ch_ven_estado
check (estado in ('A','C','X'))

alter table compra
add constraint ch_com_estado
check (estado in ('A','C','X'))


/* DEFAULT ++++++++++  */

Alter table venta
add constraint df_ven_estado
default 'A'
for estado

Alter table compra
add constraint df_com_estado
default 'A'
for estado

Alter table venta
add constraint df_ven_fecha
default Getdate()
for fecha

Alter table compra
add constraint df_com_fecha
default Getdate()
for fecha
