SELECT  categoriaNombre, Descripcion FROM categorias c;
SELECT * FROM productos;
SELECT * FROM productos WHERE Discontinuado = 1;
SELECT * FROM productos WHERE ProveedorID = 8;
SELECT * FROM productos WHERE PrecioUnitario between 10 and 22;
SELECT * FROM productos WHERE UnidadesStock < NivelReorden;
SELECT * FROM productos WHERE UnidadesStock < NivelReorden and UnidadesPedidas = 0;
/*Obtener un listado de todos los clientes con Contacto, Compania, Título, País. Ordenar el listado por País.*/
SELECT Contacto, Compania, Titulo, Pais FROM clientes order by pais;
/*Queremos conocer a todos los clientes que tengan un título “Owner”.*/
SELECT * FROM clientes WHERE Titulo = "Owner";
/*El operador telefónico que atendió a un cliente no recuerda su nombre. Solo sabe que comienza con “C”. 
¿Lo ayudamos a obtener un listado con todos los contactos que inician con la letra “C”?*/
SELECT * FROM clientes WHERE Contacto like "c%";
/*Obtener un listado de todas las facturas, ordenado por fecha de factura ascendente.*/
SELECT * FROM facturas ORDER BY FechaFactura ASC;
/*Ahora se requiere un listado de las facturas con el país de envío “USA” y que su correo (EnvioVia) sea distinto de 3.*/
SELECT * FROM facturas WHERE PaisEnvio = "USA" and EnvioVia != 3;
/*¿El cliente 'GOURL' realizó algún pedido?*/
SELECT * FROM facturas WHERE ClienteID = "GOURL";
SELECT P.UnidadesPedidas, P.ProductoNombre
FROM facturas F, productos P, facturadetalle FD 
WHERE F.FacturaID = FD.FacturaID AND P.ProductoID = FD.ProductoID AND F.ClienteID = "GOURL";
/*Se quiere visualizar todas las facturas de los empleados 2, 3, 5, 8 y 9.*/
SELECT * FROM facturas WHERE EmpleadoID = 2 OR 3 OR 5 OR 8 OR 9;
/*Obtener el listado de todos los productos ordenados descendentemente por precio unitario.*/
SELECT * FROM productos ORDER BY  PrecioUnitario DESC;
/*Obtener el listado de top 5 de productos cuyo precio unitario es el más caro.*/
SELECT * FROM productos ORDER BY  PrecioUnitario DESC LIMIT 5;
/*Obtener un top 10 de los productos con más unidades en stock.*/
SELECT * FROM productos ORDER BY  UnidadesStock DESC LIMIT 10;
/*Obtener un listado de FacturaID, Producto, Cantidad.*/
SELECT FD.FacturaID, FD.Cantidad, FD.ProductoID FROM facturadetalle FD ;
/*Ordenar el listado anterior por cantidad descendentemente.*/
SELECT FD.FacturaID, FD.Cantidad, FD.ProductoID FROM facturadetalle FD ORDER BY FD.Cantidad DESC;
/*Filtrar el listado solo para aquellos productos donde la cantidad se encuentre entre 50 y 100.*/
SELECT * FROM facturadetalle FD WHERE FD.Cantidad between 50 AND 100;
/*En otro listado nuevo, obtener un listado con los siguientes nombres de columnas: NroFactura (FacturaID),
 Producto (ProductoID), Total (PrecioUnitario*Cantidad).*/
 SELECT FacturaID AS NroFactura, ProductoID AS Producto, PrecioUnitario*Cantidad AS TOTAL FROM facturadetalle FD WHERE FD.Cantidad between 50 AND 100;
 /*Obtener un listado de todos los clientes que viven en “Brazil" o “Mexico”, o que tengan un título que empiece con “Sales”. */
 SELECT * FROM clientes c WHERE c.titulo LIKE "Sales%" OR c.pais = "Brazil"  OR c.pais = "Mexico";
 /*Obtener un listado de todos los clientes que pertenecen a una compañía que empiece con la letra "A".*/
 SELECT * FROM clientes c WHERE c.Compania LIKE "a%";
 /*Obtener un listado con los datos: Ciudad, Contacto y renombrarlo como Apellido y Nombre, Titulo y 
 renombrarlo como Puesto, de todos los clientes que sean de la ciudad "Madrid".*/
  SELECT Ciudad, Contacto as Apellido_y_Nombre, Titulo as Puesto FROM clientes c WHERE c.Ciudad = "Madrid";
  /*Obtener un listado de todas las facturas con ID entre 10000 y 10500*/
  SELECT * FROM facturas f WHERE f.FacturaID between 10000 and 10500;
  /*Obtener un listado de todas las facturas con ID entre 10000 y 10500 o de los clientes con ID que empiecen con la letra “B”.*/
  SELECT * FROM facturas f WHERE f.FacturaID between 10000 and 10500 and f.ClienteID like "B%";
  /*¿Existen facturas que la ciudad de envío sea “Vancouver” o que utilicen el correo 3?*/
  SELECT * FROM facturas as f WHERE f.CiudadEnvio = "Vancouver" or f.EnvioVia = 3;
  /*¿Cuál es el ID de empleado de “Buchanan”?*/
  SELECT e.EmpleadoID FROM empleados e WHERE e.Apellido = "Buchanan";
  /*¿Existen facturas con EmpleadoID del empleado del ejercicio anterior? (No relacionar, sino verificar que existan facturas)*/
  SELECT * FROM facturas f WHERE f.EmpleadoID = 5;
  SELECT * FROM facturas f, empleados e WHERE f.EmpleadoID = e.EmpleadoID and f.EmpleadoID = 5;