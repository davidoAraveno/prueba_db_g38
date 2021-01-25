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
    nombre VARCHAR(15) UNIQUE,
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
