select * from piso;

select direccion, fecha_construccion from piso;

select * from piso where precio < 300000;

select direccion , precio  from piso where garaje = 1;

select * from piso where fecha_construccion BETWEEN '1969-12-30' AND '1980-01-01';

select * from piso where fecha_construccion > '2000-12-30' AND precio > 300000;

select * from piso where ascensor = 1 and garaje = 1 and metros_2 >80;

SELECT * FROM piso where  poblacion NOT IN ('Barcelona','Badalona','Castelldefels') and precio < 250000 ORDER BY poblacion ASC;

SELECT * from piso where fecha_construccion >= '2016-01-01';

SELECT * FROM piso where  poblacion NOT IN ('Barcelona','Madrid','Vic');

SELECT direccion, precio *0.10 from piso where poblacion = 'Barcelona';


select DISTINCT poblacion  from piso where direccion like '%º%';

select * from piso where direccion LIKE '%Rambla%';

select * from piso order by precio DESC LIMIT 5;