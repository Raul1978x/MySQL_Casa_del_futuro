/*Consignas
Clientes
¿Cuántos clientes existen?*/
select count(*)
from clientes;
/*
¿Cuántos clientes hay por ciudad?*/
select ciudad, count(*)
from clientes
group by Ciudad;
/*
Facturas
¿Cuál es el total de transporte?*/
select sum(transporte)
from facturas;
/*
¿Cuál es el total de transporte por EnvioVia (empresa de envío)?*/
select c.Compania, sum(f.transporte)
from facturas f
join correos c
where c.CorreoID = f.EnvioVia
group by EnvioVia;
/*
Calcular la cantidad de facturas por cliente. Ordenar descendentemente por cantidad de facturas.
Obtener el Top 5 de clientes de acuerdo a su cantidad de facturas.*/
select f.ClienteID, count(*)
from facturas f
group by f.ClienteID;
/*
¿Cuál es el país de envío menos frecuente de acuerdo a la cantidad de facturas?*/
select min(f.PaisEnvio), count(*)
from facturas f
group by f.PaisEnvio
order by count(*) asc
limit 1;
/*
Se quiere otorgar un bono al empleado con más ventas. ¿Qué ID de empleado realizó más operaciones de ventas?*/
select max(f.EmpleadoID) as EmpleadoID, count(*) as Cant_ventas
from facturas f
group by f.EmpleadoID
order by count(*) desc
limit 1;

/*
Factura detalle
¿Cuál es el producto que aparece en más líneas de la tabla Factura Detalle?*/
select p.ProductoID, p.ProductoNombre, count(*)
from facturadetalle fd
join productos p
on p.ProductoID = fd.ProductoID
group by fd.ProductoID
order by count(*) desc
limit 1;
/*
¿Cuál es el total facturado? Considerar que el total facturado es la suma de cantidad por precio unitario.*/
select (sum(fd.PrecioUnitario*fd.Cantidad)) as total_facturado
from facturadetalle fd;
/*
¿Cuál es el total facturado para los productos ID entre 30 y 50?*/
select (sum(fd.PrecioUnitario*fd.Cantidad)) as total_facturado
from facturadetalle fd
where fd.ProductoID between 30 and 50;
/*
¿Cuál es el precio unitario promedio de cada producto?*/
select avg(fd.PrecioUnitario)
from facturadetalle fd;
/*
¿Cuál es el precio unitario máximo?
*/
select max(fd.PrecioUnitario)
from facturadetalle fd