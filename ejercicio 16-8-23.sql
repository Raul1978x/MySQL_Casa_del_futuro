/*
Consultas
SELECT, GROUP BY y JOIN

Listar las canciones cuya duración sea mayor a 2 minutos.*/
select *
from canciones c
where c.milisegundos > 1000*60*2;
/*Listar las canciones cuyo nombre comience con una vocal. */
select *
from canciones c
where c.nombre like "a%" or c.nombre like "e%" or c.nombre like "i%" or c.nombre like "o%" or c.nombre like  "u%";
/*Canciones
Listar las canciones ordenadas por compositor en forma descendente.*/
select *
from canciones c
order by c.compositor desc;
/*Luego, por nombre en forma ascendente. Incluir únicamente aquellas canciones que tengan compositor. */
select *
from canciones c
where c.compositor != ""
order by c.nombre;
/*Canciones
Listar la cantidad de canciones de cada compositor. */
select c.compositor, count(*)
from canciones c
where c.compositor !=""
group by c.compositor;
/*Modificar la consulta para incluir únicamente los compositores que tengan más de 10 canciones. */
select c.compositor, count(*) as composiciones
from canciones c
where c.compositor !=""
group by c.compositor
having count(*) > 10
order by count(*) desc ;
/*5. Facturas
Listar el total facturado agrupado por ciudad.*/
select f.ciudad_de_facturacion, sum(f.total)
from facturas f
group by f.ciudad_de_facturacion
order by f.ciudad_de_facturacion;
/*Modificar el listado del punto (a) mostrando únicamente las ciudades de Canadá.*/
select f.ciudad_de_facturacion, sum(f.total)
from facturas f
where f.pais_de_facturacion = "Canadá"
group by f.ciudad_de_facturacion
order by f.ciudad_de_facturacion;
/*Modificar el listado del punto (a) mostrando únicamente las ciudades con una facturación mayor a 38.*/
select f.ciudad_de_facturacion, sum(f.total)
from facturas f
group by f.ciudad_de_facturacion
having sum(f.total) > 38
order by f.ciudad_de_facturacion;
/*Modificar el listado del punto (a) agrupando la facturación por país, y luego por ciudad.*/
select f.ciudad_de_facturacion, sum(f.total)
from facturas f
group by f.pais_de_facturacion, f.ciudad_de_facturacion
order by f.ciudad_de_facturacion;
/*6. Canciones / Géneros
Listar la duración mínima, máxima y promedio de las canciones. */
select min(c.milisegundos) as duracion_minima, max(c.milisegundos) as duracion_maxima, avg(c.milisegundos) as promedio_duracion
from canciones c;
/*Modificar el punto (a) mostrando la información agrupada por género.*/
select g.nombre, min(c.milisegundos) as duracion_minima, max(c.milisegundos) as duracion_maxima, avg(c.milisegundos) as promedio_duracion
from canciones c
join generos g
on g.id = c.id_genero
group by c.id_genero;