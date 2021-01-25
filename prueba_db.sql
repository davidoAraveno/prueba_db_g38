CREATE DATABASE facturas;

\c facturas;

-- ////////////////////////////////////CREAR TABLAS///////////////////////////////////////////

CREATE TABLE cliente(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(30), 
    rut VARCHAR(15), 
    direccion VARCHAR(50)
);

CREATE TABLE factura(
    numero_factura INT PRIMARY KEY UNIQUE,
    fecha DATE DEFAULT CURRENT_DATE,
    cliente_id INT REFERENCES cliente(id)
);


CREATE TABLE valor_factura(
    id SERIAL PRIMARY KEY,
    subtotal INT,
    iva INT,
    precio_total INT,
    numero_factura INT REFERENCES factura(numero_factura)
);

CREATE TABLE categoria(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(15),
    descripcion VARCHAR(50)
);

CREATE TABLE producto(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(30) UNIQUE,
    descripcion VARCHAR(50),
    valor_unitario INT,
    categoria_id INT REFERENCES categoria(id)
);

CREATE TABLE listado_productos(
    id SERIAL PRIMARY KEY,
    producto_id INT REFERENCES producto(id),
    cantidad INT,
    valor_total_producto INT,
    numero_factura INT REFERENCES factura(numero_factura)
);



-- ////////////////////////////////INGRESAR 5 CLIENTES//////////////////////////////////////////////////////


INSERT INTO cliente(
    nombre,
    rut,
    direccion) VALUES (
        'david',
        '16270857-0',
        'simon bolivar #10'
);

INSERT INTO cliente(
    nombre,
    rut,
    direccion) VALUES (
        'estefania',
        '17474897-1',
        'gatos viejos #126'
);


INSERT INTO cliente(
    nombre,
    rut,
    direccion) VALUES (
        'elizabeth',
        '15374693-0',
        'andalucia #666'
),(
    'veronica',
    '8567262-0',
    'pintor san martin #2026'
),(
    'agustin',
    '20543666-1',
    'calle grande #50'
);

-- ////////////////////////////////////////////crear 3 categorias////////////////////////////////////////////////////////
INSERT INTO categoria(
    nombre,
    descripcion
) VALUES (
    'frutas',
    'frutas de importacion'
),(
    'abarrotes',
    'comidas, bebidas y conservas'
),(
    'lacteos',
    'productos derivados de la leche'
);


-- /////////////////////////////////////////CREAR 8 PRODUCTOS//////////////////////////////////////////////////



INSERT INTO producto(
    nombre,
    descripcion,
    valor_unitario,
    categoria_id
) VALUES (
    'manzana fuji',
    'manzana roja',
    100,
    1
), (
    'pera packham',
    'pera verde',
    150,
    1
), (
    'aceite miraflores',
    'aceite de maravilla 1 lt',
    1200,
    2
), (
    'porotos wasil',
    'porotos negros en conserva 250g',
    900,
    2
), (
    'atun van camps',
    'atun lomito en conserva en agua 354g',
    2000,
    2
), (
    'cereal chocapic',
    'cereal integral de chocolate 500g',
    2500,
    2
), (
    'yogurt activia',
    'yogurt con probioticos en bolsa de 1 lt',
    2500,
    3
), (
    'queso colun',
    'queso ranco laminado 500g',
    4700,
    3
);



-- /////////////////////////////////////CREAR 2 FACTURAS PARA EL CLIENTE 1/////////////////////////////////
INSERT INTO factura(
    numero_factura,
    cliente_id
) VALUES (
    100,
    1
),(
    200,
    1
);

-- ////////////////////////////////////////////////3 facturas para el cliente 2/////////////////////////////////
INSERT INTO factura(
    numero_factura,
    cliente_id
) VALUES (
    300,
    2
),(
    400,
    2
),(
    500,
    2
);

-- /////////////////////////////////1 factura para el cliente 3////////////////////////////////////////////
INSERT INTO factura(
    numero_factura,
    cliente_id
) VALUES (
    600,
    3
);


-- /////////////////////////////////4 facturas para el cliente 4////////////////////////////////
INSERT INTO factura(
    numero_factura,
    cliente_id
) VALUES (
    700,
    4
),(
    800,
    4
),(
    900,
    4
), (
    1000,
    4
);


-- ///////////////////agregar 2 y 3 productos a las 2 facturas del cliente 1////////////////////////////

INSERT INTO listado_productos(
    producto_id,
    cantidad,
    valor_total_producto,
    numero_factura
) VALUES (
    1,
    5,
    500,
    100
),(
    5,
    2,
    4000,
    100
),(
    6,
    1,
    2500,
    200
),(
    7,
    1,
    2500,
    200
),(
    8,
    1,
    4700,
    200
);



-- /////////////////precio final detallado en las facturas del cliente 1////////////////////////////
INSERT INTO valor_factura(
    subtotal,
    iva,
    precio_total,
    numero_factura
) VALUES (
    4500,
    855,
    5355,
    100
),(
    9700,
    1843,
    11543,
    200
);


-- ///////////////////////agregar 3, 2 y 3 productos a las 3 facturas del cliente 2/////////////////

INSERT INTO listado_productos(
    producto_id,
    cantidad,
    valor_total_producto,
    numero_factura
) VALUES (
    3,
    1,
    1200,
    300
),(
    4,
    1,
    900,
    300
),(
    5,
    1,
    2000,
    300
),(
    1,
    1,
    100,
    400
),(
    5,
    1,
    2000,
    400
),(
    2,
    1,
    150,
    500
),(
    4,
    1,
    900,
    500
),(
    5,
    1,
    2000,
    500  
);


-- /////////////////precio final detallado en las facturas del cliente 2////////////////////////////

INSERT INTO valor_factura(
    subtotal,
    iva,
    precio_total,
    numero_factura
) VALUES (
    4100,
    779,
    4879,
    300
),(
    2100,
    399,
    2499,
    400
),(
    3050,
    580,
    3630,
    500
);



-- ///////////////////////agregar 1 producto a la factura del cliente 3/////////////////

INSERT INTO listado_productos(
    producto_id,
    cantidad,
    valor_total_producto,
    numero_factura
) VALUES (
    6,
    1,
    2500,
    600
);

-- /////////////////precio final detallado en la factura del cliente 3////////////////////////////
INSERT INTO valor_factura(
    subtotal,
    iva,
    precio_total,
    numero_factura
) VALUES (
    2500,
    475,
    2975,
    600
);



-- ///////////////////////agregar 2, 3, 4 y 1 producto a las 4 facturas del cliente 4/////////////////


INSERT INTO listado_productos(
    producto_id,
    cantidad,
    valor_total_producto,
    numero_factura
) VALUES (
    1,
    1,
    100,
    700
),(
    5,
    1,
    2000,
    700
),(
    6,
    1,
    2500,
    800
),(
    2,
    1,
    150,
    800
),(
    8,
    1,
    4700,
    800
),(
    3,
    1,
    1200,
    900
),(
    4,
    1,
    900,
    900
),(
    5,
    1,
    2000,
    900
),(
    7,
    1,
    2500,
    900
),(
    4,
    1,
    900,
    1000
);


-- /////////////////precio final detallado en las facturas del cliente 4////////////////////////////
INSERT INTO valor_factura(
    subtotal,
    iva,
    precio_total,
    numero_factura
) VALUES (
    2100,
    399,
    2499,
    700
),(
    7350,
    1397,
    8747,
    800
),(
    6600,
    1254,
    7854,
    900
),(
    900,
    171,
    1071,
    1000
);


