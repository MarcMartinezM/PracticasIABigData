Listado de los proveedores de Barcelona que nos sirven el producto condensador.

SELECT p2.nombre  FROM PROVEEDOR p2 , PRODUCTOS p WHERE p2.poblacion LIKE 'Barcelona' and p.nombre like 'condensador';

Listado de los productos que nos provee ‘Electrònica Vivas’.

SELECT p.nombre from PRODUCTOS p , PROVEEDOR p2 where p2.nombre like 'Electrònica Vivas';

Listado de los clientes que no han facturado desde el 1/7/2012.

SELECT DISTINCT c.nombre from CLIENTES c , FACTURA f  where f.fechaalta > 2012-07-01;

Listado de los clientes que han comprado el producto resistencia. Si se repiten consigue que solo salga una vez cada uno. No sabes el id de la resistencia, solo el nombre.

SELECT  DISTINCT * from CLIENTES c ,PRODUCTOS p WHERE p.nombre like '%resistencia%';

Listado de los clientes que han comprado más de un diodo. No sabes el id del diodo, solo el nombre.

SELECT  DISTINCT * from CLIENTES c ,PRODUCTOS p WHERE p.nombre like '%Díode%';


Mostrar la cantidad total de productos facturada para cada cliente

SELECT c.nombre, SUM(l.idunidades)  from CLIENTES c
INNER JOIN FACTURA f ON c.idcliente = f.idcliente 
INNER JOIN LINEASFRA l on f.idfactura = l.idfactura 
group by c.nombre;


Mostrar la cantidad total de productos facturada entre 1/7/2012 y el 1/10/2012.

SELECT p.nombre, COUNT(l.idproducto)  from PRODUCTOS p 
INNER JOIN LINEASFRA l on p.idproducto = l.idproducto
INNER JOIN FACTURA f ON f.idfactura = l.idfactura 
where f.fechaalta >= 2012-07-01 and f.fechaalta <= 2012-10-01
GROUP BY p.nombre ;


Listado de los productos que son componentes del producto transistor. (¿Qué productos forman un transistor?)

SELECT p.*  from PRODUCTOS p ,COMPONENTES c WHERE c.idproducto = '4' and c.idcomponente  = p.idproducto ;


Listado de los productos de los cuales es componente un condensador. (¿qué productos entre sus componentes hay un condensador?)


SELECT p.*  from PRODUCTOS p ,COMPONENTES c WHERE c.idcomponente = '3' and c.idproducto  = p.idproducto ;


¿Cuál sería el descuento que se le aplica a cada producto en función de su precio?

SELECT p.nombre , d.Descuento  from DESCUENTOS d, PRODUCTOS p WHERE p.precio > d.PrecioMin and p.precio < d.PrecioMax ;

Aplícale el impuesto que toque a cada una de las facturas. Ten en cuenta que el precio final es precio*unidad.



Muestra los productos cuyo precio sea mayor que el precio medio de todos los productos. Ordena el precio de menor a mayor.

SELECT p.nombre , p.precio  
from PRODUCTOS p 
WHERE p.precio > (select AVG(precio) from PRODUCTOS p2)
ORDER BY p.precio ASC ;

¿Cuántos productos nos han comprado cada cliente durante el último semestre del 2012? Muestra solo los que hayan comprado 40 productos o más.

# me quedado a medias profe no lo lo executes :D te devolvera mas de 1 row.

SELECT c.nombre, SUM(l.idunidades) from CLIENTES c
INNER JOIN FACTURA f ON c.idcliente = f.idcliente 
INNER JOIN LINEASFRA l on f.idfactura = l.idfactura 
WHERE f.fechaalta > 2012-06-01 and f.fechaalta < 2013-01-01 and 
(SELECT SUM(l2.idunidades) from LINEASFRA l2, FACTURA f2 WHERE l2.idfactura = f2.idfactura GROUP BY f2.idfactura ) >= 40
group by c.nombre;


Para cada cliente, haz un listado con todos los productos y los proveedores de los productos que han comprado. ¡Ánimo, es la última!

