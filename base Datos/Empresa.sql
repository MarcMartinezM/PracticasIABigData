Drop database if exists EMPRESA;
Create database EMPRESA;
Use EMPRESA;

Create table CLIENTES (
idcliente varchar(9) primary key,
nombre varchar(20),
direccion varchar(30),
nif varchar(9),
telefono int,
poblacion varchar(20));

Create table FACTURA (
idfactura varchar(9) primary key,
fechaalta date,
idcliente varchar(9),
foreign key (idcliente) references CLIENTES(idcliente));

Create table PRODUCTOS (
idproducto varchar(9) primary key,
nombre varchar(20),
precio decimal(10,2));

Create table LINEASFRA (
idfactura varchar(9),
idproducto varchar(9),
idunidades varchar(9),
primary key (idfactura, idproducto),
constraint fk_factura foreign key (idfactura) references FACTURA(idfactura),
constraint fk_productos foreign key (idproducto) references PRODUCTOS(idproducto));

Create table PROVEEDOR (
idproveedor varchar(9) primary key,
nombre varchar(20),
direccion varchar(30),
telefono int,
poblacion varchar(30));

Create table PROVEEN (
idproveedor varchar(9),
idproducto varchar(9),
primary key (idproveedor, idproducto),
constraint fk_idproveedor foreign key (idproveedor) references PROVEEDOR(idproveedor),
constraint fk_idproducto foreign key (idproducto) references PRODUCTOS(idproducto));

Create table COMPONENTES (
idproducto varchar(9),
idcomponente varchar(9),
primary key (idproducto, idcomponente),
constraint fk_comp_producto foreign key (idproducto) references PRODUCTOS(idproducto),
constraint fk_componente foreign key (idcomponente) references PRODUCTOS(idproducto));

Create table DESCUENTOS (
PrecioMin decimal(8,2),
PrecioMax decimal(8,2),
Impuesto decimal(8,2),
Descuento decimal(8,2));

INSERT INTO CLIENTES VALUES(2,	'Aula',	'Cr Tallers 77',	111,	9211232,	'Barcelona'),
(3,	'Cenec',	'Trav les Corts 272',	222,	9233212,	'Barcelona'),
(4,	'Canvi',	'Cr General Almirante',	333,	9455432,	'Barcelona'),
(5,	'Bit',	'Avda Diagonal',	444,	9123322,	'Barcelona'),
(6,	'Informatic nou',	'Trav Collblanc 5-7',	555,	9877892,	'LHospitalet de Llob'),
(7,	'HES',	'Avda Josep Tarradelles',	666,	6996696,	'Barcelona'),
(8,	'ISC',	'Cr Sant Silvestre 11',	777,	9914213,	'Sta Coloma de Gramen'),
(9,	'stucom',	'pelayo 8',	888,	9023415,	'Barcelona');

INSERT INTO PRODUCTOS VALUES(1,	'Resistència',	2),
(2,	'Bobina',	3),
(3,	'Condensador',	2.2),
(4,	'Transistor',	1),
(5,	'Díode',	2),
(6,	'Connector',	3.2),
(7,	'Cable',	3),
(8,	'Font alimentació',	30),
(9,	'Electrode',	2),
(10,	'Dinamo',	10);

INSERT INTO COMPONENTES VALUES(4,	1),
(4,	2),
(4,	3),
(5,	3),
(5,	6),
(8,	4),
(8,	5);

INSERT INTO PROVEEDOR VALUES(1,	'Electrònica Vivas',	'Rambla Sant Sebastia 45',	3865555,	'Sta Coloma de Gramen'),
(2,	'Just Electric',	'Cr Euga 45',	2341232,	'Barcelona'),
(3,	'Components Garcia',	'Cr Música 21',	4563543,	'Barcelona'),
(4,	'Elèctric Badalona',	'Cr Mar 11',	4912311,	'Badalona'),
(5,	'Electricitat Ciurana',	'Cr Rafael Casanovas 42',	3853212,	'Sta Coloma de Gramen'),
(6,	'Gims Electronics',	'Pça del Pi 7',	3423212,	'Barcelona');

INSERT INTO PROVEEN VALUES(1,	2),
(1,	5),
(1,	8),
(2,	1),
(2,	4),
(2,	7),
(2,	8),
(3,	1),
(4,	3),
(4,	5),
(4,	6),
(5,	2),
(5,	7),
(6,	1),
(6,	3),
(6,	4),
(6,	5),
(6,	7);

INSERT INTO FACTURA VALUES(1,	'2012-01-13', 2),
(2,	'2012-02-01', 3),
(3,	'2012-02-12', 7),
(4,	'2012-03-15', 4),
(5,	'2012-04-23', 3),
(6,	'2012-05-04', 5),
(7,	'2012-06-02', 7),
(8, '2012-07-07', 3),
(9,	'2012-08-11', 2),
(10, '2012-08-23', 7),
(11, '2012-09-11', 3),
(12, '2012-10-17', 2),
(13, '2014-01-19', 7),
(14, '2014-01-31', 3),
(15, '2014-01-31', 8),
(16, '2014-01-07', 4),
(17, '2016-01-02', 2),
(18, '2016-01-03', 3);

INSERT INTO LINEASFRA VALUES(1,	2,	4),
(1,	4,	1),
(1,	6,	2),
(2,	1,	1),
(2,	3,	5),
(2,	5,	1),
(2,	7,	1),
(3,	2,	4),
(3,	4,	1),
(4,	8,	1),
(5,	3,	3),
(5,	1,	1),
(5,	2,	4),
(6,	7,	5),
(7,	2,	2),
(7,	3,	3),
(7,	5,	1),
(8,	2,	3),
(9,	7,	12),
(9,	3,	1),
(9,	8,	1),
(10, 2,	4),
(10, 3,	1),
(10, 5,	2),
(11, 4,	30),
(11, 1,	2),
(11, 2,	20),
(11, 3,	10),
(12, 2,	2),
(12, 6,	3),
(12, 4,	4),
(12, 5,	5),
(12, 7,	12),
(13, 8,	1),
(13, 4,	3),
(14, 2,	10),
(14, 5,	1),
(14, 8,	4),
(15, 1,	3),
(15, 3,	2),
(15, 5,	4),
(15, 7,	5),
(15, 8,	1),
(16, 6, 8),
(16, 10,1),
(16, 5,	2),
(16, 9,	4),
(17, 2,	5),
(17, 3,	2),
(18, 10, 2),
(18, 9,	3);

INSERT INTO DESCUENTOS VALUES(0,	0.50,	0.21,	0.05),
(0.51,	1,	0.21,	0.05),
(1.1,	5,	0.21,	0.10),
(5.1,	1000,	0.21,	0.20);
